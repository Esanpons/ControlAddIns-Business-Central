// Convierte texto hexadecimal (UTF-16LE) a texto Unicode legible
function hexToUnicode(hex) {
    const bytes = [];
    for (let i = 0; i < hex.length; i += 2) {
      bytes.push(parseInt(hex.substr(i, 2), 16));
    }
  
    const buffer = new Uint8Array(bytes).buffer;
    const decoded = new TextDecoder('utf-16le').decode(buffer);
  
    // Dispara evento a Business Central con el resultado
    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('OnHexToUnicode', [decoded]);
  }
  
  // Convierte texto Unicode legible a hexadecimal (UTF-16LE)
  function unicodeToHex(text) {
    const buffer = new ArrayBuffer(text.length * 2);
    const view = new DataView(buffer);
    for (let i = 0; i < text.length; i++) {
      view.setUint16(i * 2, text.charCodeAt(i), true); // little-endian
    }
  
    let hex = '';
    for (let i = 0; i < buffer.byteLength; i++) {
      hex += view.getUint8(i).toString(16).padStart(2, '0');
    }
  
    // Dispara evento a Business Central con el resultado
    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('OnUnicodeToHex', [hex.toUpperCase()]);
  }

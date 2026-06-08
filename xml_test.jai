#import "Basic";
#import,file "./xml.jai";

main :: () {
  xdg :: "/usr/share/wayland-protocols/stable/xdg-shell/xdg-shell.xml";
  xml_bytes, ok := File.read_entire_file(xdg);
  if !ok {
    log_error("failed to read XML file\n");
    return;
  }

  xml := parse_xml(xml_bytes);
  if !xml {
    log_error("failed to parse XML DOM\n");
    return;
  }
  print_xml(xml, false);
  delete_xml(xml);
}

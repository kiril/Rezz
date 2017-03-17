import Foundation
import CRezz

public func resolve(hostname: String) -> String? {
    // get our hostname as a pointer we can pass
    let hostnameData = hostname.data(using: String.Encoding.utf8)!
    let charPointer = UnsafeMutablePointer<UInt8>.allocate(capacity: hostname.characters.count)
    hostnameData.copyBytes(to: charPointer, count: hostname.characters.count)
    let hostnamePointer = UnsafeMutableRawPointer(charPointer).bindMemory(to: Int8.self, capacity: hostname.characters.count)

    // this is the container we'll get the return in
    let ipPointer = UnsafeMutablePointer<Int8>.allocate(capacity: 100)

    // call the C function!
    hostname_to_ip(hostnamePointer, ipPointer)

    // unpack the IP!
    let stringPointer = UnsafeMutableRawPointer(ipPointer).bindMemory(to: UInt8.self, capacity: 100)
    return String(cString: stringPointer)
}

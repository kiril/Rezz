import Foundation
import CRezz

func resolve(hostname: String) -> String? {
    // get our hostname as a pointer we can pass
    let hostnameData = hostname.data(using: String.Encoding.utf8)!
    let charPointer = UnsafeMutablePointer<UInt8>.allocate(capacity: hostname.characters.count)
    hostnameData.copyBytes(to: charPointer, count: hostname.characters.count)
    let hostnamePointer = UnsafeMutableRawPointer(charPointer).bindMemory(to: Int8.self, capacity: hostname.characters.count)

    // this is the container we'll get the return in
    let ipData = NSMutableData(length: 100)!
    let ipDataWrapper = Data(referencing: ipData)
    let ipPointer = ipData.mutableBytes.bindMemory(to: Int8.self, capacity: 100)

    // call the C function!
    hostname_to_ip(hostnamePointer, ipPointer)

    // unpack the IP!
    let ip = String(data: ipDataWrapper, encoding: String.Encoding.utf8)
    print("got back \(ip)")
    return ip
}

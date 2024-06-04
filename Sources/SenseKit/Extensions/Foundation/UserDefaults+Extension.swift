//
//  UserDefaults+Extension.swift
//
//
//  Created by Yujin Kim on 2024-06-04.
//

#if canImport(Foundation) && !os(Linux)
import Foundation

public extension UserDefaults {
    /// Codable 프로토콜을 준수하는 객체를 저장합니다.
    ///
    /// - Parameters:
    ///   - object: 저장하려는 Codable 객체입니다.
    ///   - key: 객체의 Identifier입니다.
    ///   - encoder: 기본은 `JSONEncoder()`로 커스텀 JSONEncoder 인스턴스도 사용 가능합니다.
    func setObject<T>(
        _ object: T,
        forKey key: String,
        with encoder: JSONEncoder = JSONEncoder()
    ) where T : Codable {
        let data = try? encoder.encode(object)
        
        self.set(data, forKey: key)
    }
    
    /// Codable 프로토콜을 준수하는 객체를 찾습니다.
    ///
    /// - Parameters:
    ///   - type: Codable 프로토콜을 준수하는 클래스 타입입니다.
    ///   - key: 객체의 Identifier입니다.
    ///   - decoder: 기본은 `JSONDecoder()`로 커스텀 JSONDecoder 인스턴스도 사용 가능합니다.
    /// - Returns: UserDefaults에 key에 대한 객체가 존재한다면 해당 객체를 반환합니다.
    func getObject<T>(
        _ type: T.Type,
        forKey key: String,
        with decoder: JSONDecoder = JSONDecoder()
    ) -> T? where T : Codable {
        guard let data = self.value(forKey: key) as? Data else { return nil }
        
        return try? decoder.decode(type.self, from: data)
    }
}
#endif

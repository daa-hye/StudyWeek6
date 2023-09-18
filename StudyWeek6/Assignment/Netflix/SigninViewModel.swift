//
//  SigninViewModel.swift
//  StudyWeek6
//
//  Created by 박다혜 on 2023/09/18.
//

import Foundation

class SigninViewModel {

    var id: Observable<String?> = Observable("")
    var password: Observable<String?> = Observable("")
    var nickname: Observable<String?> = Observable("")
    var location: Observable<String?> = Observable("")
    var code: Observable<String?> = Observable("")

    var alertMent = Observable("")

    var isValid = Observable(false)

    func checkValidation() -> Bool {

        guard let id = id.value, id != "" else {
            alertMent.value = "이메일 주소를 입력해주세요"
            return false
        }

        guard id.count > 6 && id.contains("@") else {
            alertMent.value = "이메일 형식을 확인해주세요"
            return false
        }

        guard let password = password.value, password != "" else {
            alertMent.value = "비밀번호를 입력해주세요"
            return false
        }

        guard password.count > 5, password.count < 11 else {
            alertMent.value = "비밀번호를 6 ~ 10글자 사이로 입력해주세요"
            return false
        }

        guard let nickname = nickname.value, nickname != "" else {
            alertMent.value = "닉네임을 입력해주세요"
            return false
        }

        guard nickname.count > 1 else {
            alertMent.value = "닉네임을 한글자 이상 입력해주세요"
            return false
        }

        guard let location = location.value, location != "" else {
            alertMent.value = "위치를 입력해주세요"
            return false
        }

        if let code = code.value, code != "" {
            guard code.count == 6, Int(code) != nil else {
                alertMent.value = "추천 코드는 6자리 숫자 입니다"
                return false
            }
        }

        alertMent.value = ""
        return true

    }

}

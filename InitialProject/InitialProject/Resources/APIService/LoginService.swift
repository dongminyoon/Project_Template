//
//  LoginService.swift
//  InitialProject
//
//  Created by 윤동민 on 2019/12/20.
//  Copyright © 2019 윤동민. All rights reserved.
//

import Foundation

// Login Service

//struct LoginService {
//    static let shared = LoginService()
//
//    func login(_ id: String, pwd: String, completion: @escaping (NetworkResult<Any>) -> Void) {
//        let header = ["Content-Type": "application/json"]
//        let dataRequest = Alamofire.request(APIConstants.loginURL, method: .post, parameters: makeParameter(id, pwd), encoding: JSONEncoding.default, headers: header)
//
//        dataRequest.responseData { dataResponse in
//            switch dataRequest.result {
//            case .success:
//                guard let statusCode = dataResponse.response?.statusCode else { return }
//                guard let value = dataResponse.result.value else { return }
//                let networkResult = self.judge(by: statusCode, value: value)
//                completion(networkResult)
//            case .failure(let err):
//                print("\(err.localizedDescription)")
//                completion(.networkFail)
//            }
//
//        }
//    }
//
//    private func makeParameter(_ id: String, _ pwd: String) -> Parameter {
//        return ["userID": id, "userPwd": pwd]
//    }
//
//    private func judge(by statusCode: Int, value: Data) -> NetworkResult<Any> {
//        switch statusCode {
//        case 200: return isUser(value)
//        case 400: return .pathErr
//        case 500: return .serverErr
//        default: return .serverErr
//        }
//    }
//
//    private func isUser(_ value: Data) -> NetworkResult<Any> {
//        let decoder = JSONDecoder()
//        guard let getData = try? decoder.decode(LoginData.self, from: value) else { return .pathErr }
//        guard let userInfo = getData.data else { return .pathErr }
//        if getData.success { return .success(userInfo) }
//        else { return .requestErr(getData.message) }
//    }
//}


// Login View에 구현

//LoginService.shared.login(id, pw) { networkResult in
//    switch networkResult {
//    case .success(let data):
//        guard let tabbarController = self.storyboard?.instantiateViewController(identifier: "mainTabbarController") as? TabbarController else { return }
//        guard let userData = data as? UserData else { return }
//        self.dataTransferDelegate = tabbarController
//        self.dataTransferDelegate?.transferData(userData)
//        tabbarController.modalPresentationStyle = .fullScreen
//        self.present(tabbarController, animated: true, completion: nil)
//    case .requestErr(let message):
//        guard let message = message as? String else { return }
//        self.simpleAlert(title: message, message: "ID, PW을 확인해주세요")
//    case .pathErr:
//        print(".pathErr")
//    case .serverErr:
//        print(".serverErr")
//    case .networkFail:
//        self.simpleAlert(title: "네트워크 오류", message: "네트워크 연결을 확인해주세요")
//    }
//}

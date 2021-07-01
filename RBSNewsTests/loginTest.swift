//
//  loginTest.swift
//  RBSNewsTests
//
//  Created by naeem alabboodi on 6/30/21.
//

import XCTest
@testable import RBSNews

class loginTest: XCTestCase {

    let loginviewModel = LongIn()

    var username = "rbs"
    var password = "1234"
    
    func test_checkValdity(){
         
        //given
        username = "naeem"
        password = "1234"
        // when
        var output = loginviewModel.checkValdity(userName: username, passwrod: password)
        // then
        XCTAssertTrue(output == "Username is invalid.")
        username = "rbs"
        password = "1111"
         output = loginviewModel.checkValdity(userName: username, passwrod: password)
        XCTAssertTrue(output == "Password is invalid.")
        username = "rbs"
        password = "1234"
         output = loginviewModel.checkValdity(userName: username, passwrod: password)
        XCTAssertTrue(output == nil)
        username = ""
        password = ""
         output = loginviewModel.checkValdity(userName: username, passwrod: password)
        XCTAssertTrue(output == "Please input credentials.")
        
       
        
        
       
    }
}

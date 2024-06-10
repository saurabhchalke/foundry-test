// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Counter} from "../src/Counter.sol";
import {SymTest} from "halmos-cheatcodes/SymTest.sol";

contract CounterTest is Test, SymTest {
    Counter public counter;

    function setUp() public {
        counter = new Counter();
        uint256 number = svm.createUint256("number");
        counter.setNumber(number);
    }

    function check_Increment() public {
        uint256 oldNumber = counter.number();
        counter.increment();
        assert(counter.number() == oldNumber + 1);
    }

    function check_SetNumber() public {
        uint256 updatedNumber = svm.createUint256("updatedNumber");
        counter.setNumber(updatedNumber);
        assert(counter.number() == updatedNumber);
    }
}

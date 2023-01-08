// SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract enumPractice {
    enum FoodProcess {
        order, takeAway, delivery, payment
    }
    FoodProcess public foodstates;

    construct (){
        foodstates = FoodProcess.payment;
    }

    function orderFood() public{
        require(foodstates==Foodprocess.payment,"It must be the payment status");
        foodstates = FoodProcess.order;
    }
    function takeAwayFood() public{
        require(foodstates==Foodprocess.order,"It must be the order status");
        foodstates = FoodProcess.takeAway;
    }
    function deliveryFood() public{
        require(foodstates==Foodprocess.takeAway,"It must be the takeAway status");
        foodstates = FoodProcess.delivery;
    }
    function paymentFood() public{
        require(foodstates==Foodprocess.delivery,"It must be the delivery status");
        foodstates = FoodProcess.payment;
    }


}

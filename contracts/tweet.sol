// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract tweeto {
    struct Tweet {
        uint256 tweetId;
        string content;
        uint256 publishedTime;
        uint256 likeCount;
    }
    uint256 userCount = 0;
    uint256 tweetCount = 0;

    Tweet[] userTweets;

    mapping(address => string) Users;
    mapping(address => Tweet[]) userContent;

    function createUser(string memory _userName) public {
        userCount++;
        Users[msg.sender] = _userName;
    }

    function createtweet(string memory content) public {
        userContent[msg.sender].push(
            Tweet(tweetId++, content, block.timestamp, 0)
        );
    }

    function likeTweet(uint256 _tweetId) public view {
        Tweet[] memory tweetContent = userContent[msg.sender];
        bool found = false;
        for (uint i = 1; i <= tweetContent.length; i++) {
            if (tweetContent[i].tweetId == _tweetId) {
                tweetContent[i].likeCount++;
                return;
            }
        }
    }
}

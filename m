From: "Karthik BalaGuru  T" <karthik.t@incedoinc.com>
Subject: i2c_register_board_info for intel platform
Date: Mon, 22 May 2017 09:27:33 +0000
Message-ID: <E41D83B2B2E8CB42AC13E92B4C3FABD3B89F04@TS-GGN-MBX002.ibtechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ipout.ibtechnology.com ([14.141.217.210]:41238 "EHLO
        IPout.ibtechnology.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751979AbdEVJ1s (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 22 May 2017 05:27:48 -0400
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c-owner@vger.kernel.org" <linux-i2c-owner@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

Hi,

I am trying on an approach based on i2c_register_board_info which in turn can aid in invocation of probe of device driver.
However, I do not find a reference in linux kernel codebase where exactly it should be added for the Intel processor (atom or equivalent) ?
It can be helpful if someone can point to the location of addition of i2c_register_board_info for intel platform (atom or equivalent) ?

Thanks in advance,
Karthik Balaguru
Disclaimer : 
This email communication may contain privileged and confidential information and is intended for the use of the addressee only. If you are not an intended recipient you are requested not to reproduce, copy disseminate or in any manner distribute this email communication as the same is strictly prohibited. If you have received this email in error, please notify the sender immediately by return e-mail and delete the communication sent in error. Email communications cannot be guaranteed to be secure & error free and Incedo Inc. is not liable for any errors in the email communication or for the proper, timely and complete transmission thereof.

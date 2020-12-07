Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DDF8C4361B
	for <platform-driver-x86@archiver.kernel.org>; Mon,  7 Dec 2020 15:37:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0FB9A23730
	for <platform-driver-x86@archiver.kernel.org>; Mon,  7 Dec 2020 15:37:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726249AbgLGPhs (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 7 Dec 2020 10:37:48 -0500
Received: from mx3.molgen.mpg.de ([141.14.17.11]:33527 "EHLO mx1.molgen.mpg.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725774AbgLGPhs (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 7 Dec 2020 10:37:48 -0500
Received: from [192.168.0.3] (ip5f5af45d.dynamic.kabel-deutschland.de [95.90.244.93])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: pmenzel)
        by mx.molgen.mpg.de (Postfix) with ESMTPSA id 8CA5620647B6D;
        Mon,  7 Dec 2020 16:37:05 +0100 (CET)
From:   Paul Menzel <pmenzel@molgen.mpg.de>
To:     Matthew Garrett <mjg59@srcf.ucam.org>,
        =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org
Subject: dell-driver: Backlight access slow
Message-ID: <d2d1074d-a342-35ce-1e0d-5300b4803f33@molgen.mpg.de>
Date:   Mon, 7 Dec 2020 16:37:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Dear Linux folks,


On a Dell Precision 3540/0M14W7 with Debian sid/unstable restoring the 
keyboard backlight takes over 100 ms according to `systemd-analyze 
critical-chain` [1].

```
$ systemd-analyze critical-chain
[…]
             └─sysinit.target @887ms
               └─systemd-backlight@leds:dell::kbd_backlight.service 
@1.295s +114ms
                 └─system-systemd\x2dbacklight.slice @1.294s
                   └─system.slice @291ms
                     └─-.slice @291ms
```

I have to run the program [2] under strace to know for sure, that the 
delay is caused by accessing the backlight device. Unfortunately, the 
device is already in use by somebody else, so debugging is not easy. 
Maybe you have some hint, how to approach analysis from the Linux kernel 
side.


Kind regards,

Paul


[1]: https://github.com/systemd/systemd/issues/17885
[2]: 
https://github.com/systemd/systemd/blob/5acd143259068c8959d7823b178ffbca3269db30/src/backlight/backlight.c

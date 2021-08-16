Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD2FFC4338F
	for <platform-driver-x86@archiver.kernel.org>; Mon, 16 Aug 2021 09:48:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B00AE61B71
	for <platform-driver-x86@archiver.kernel.org>; Mon, 16 Aug 2021 09:48:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235343AbhHPJsv (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 16 Aug 2021 05:48:51 -0400
Received: from mx3.molgen.mpg.de ([141.14.17.11]:56999 "EHLO mx1.molgen.mpg.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231673AbhHPJsu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 16 Aug 2021 05:48:50 -0400
Received: from [192.168.0.3] (ip5f5aeb91.dynamic.kabel-deutschland.de [95.90.235.145])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        (Authenticated sender: pmenzel)
        by mx.molgen.mpg.de (Postfix) with ESMTPSA id AE09A61E30BCC;
        Mon, 16 Aug 2021 11:48:17 +0200 (CEST)
To:     Dell.Client.Kernel@dell.com, Matthew Garrett <mjg59@srcf.ucam.org>,
        =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
From:   Paul Menzel <pmenzel@molgen.mpg.de>
Subject: Dell laptop function keys stopped working between 5.10.46 and 5.13.9
Message-ID: <b8ff8f68-4d5a-7ec6-4c4f-9f5be6e70ab5@molgen.mpg.de>
Date:   Mon, 16 Aug 2021 11:48:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Dear Linux folks,


On a Dell Latitude E7250, updating Linux from 5.10.46 to 5.13.9 (Debian 
sid/unstable) the two function keys to (un-)mute the microphone, and 
enable/disable Wifi stopped working. The other function keys continue to 
work. The `evtest` output did not change.

     Linux version 5.10.0-8-amd64 (debian-kernel@lists.debian.org) 
(gcc-10 (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for 
Debian) 2.35.2) #1 SMP Debian 5.10.46-4 (2021-08-03)

     Event: time 1629104514.184947, type 4 (EV_MSC), code 4 (MSC_SCAN), 
value 88
     Event: time 1629104514.184947, type 1 (EV_KEY), code 240 
(KEY_UNKNOWN), value 2

     Linux version 5.13.0-trunk-amd64 (debian-kernel@lists.debian.org) 
(gcc-10 (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for 
Debian) 2.35.2) #1 SMP Debian 5.13.9-1~exp2 (2021-08-10)

     Event: time 1629103829.341409, type 4 (EV_MSC), code 4 (MSC_SCAN), 
value 88
     Event: time 1629103829.341409, type 1 (EV_KEY), code 240 
(KEY_UNKNOWN), value 2

The output of `acpi_listen` also did not change.

     $ acpi_listen
      9DBB5994-A997- 000000d0 00000000

Are you aware of such reports?


Kind regards,

Paul

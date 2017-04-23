From: Arcadiy Ivanov <arcadiy@ivanov.biz>
Subject: Re: [PATCH] Keyboard backlight on Dell E7470 not adjustable from /sys
 entry
Date: Sun, 23 Apr 2017 16:54:33 -0400
Message-ID: <274da9d5-187a-6bb5-35c7-c39d396ad14a@ivanov.biz>
References: <20170423055648.25711-1-arcadiy@ivanov.biz>
 <201704232141.23690@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mout.perfora.net ([74.208.4.194]:55775 "EHLO mout.perfora.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1163430AbdDWUyk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 23 Apr 2017 16:54:40 -0400
In-Reply-To: <201704232141.23690@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org, Mario Limonciello <mario.limonciello@dell.com>

On 2017-04-23 15:41, Pali Rohár wrote:
> Such macros are not needed in mainline code. They are probably useful
> in time of writing patch, but not later to have them present in final
> driver code.
>
> I sent a new patch (you are in recipients list too) which fixes getting
> and setting timeout value when on AC. It also handles detection of
> timeout AC value based on existence of 0x0451 SMBIOS token like Mario
> suggested.
>
Your patch is great, thanks!

Regarding the debug macros: there are quite a few additional reserved 
bits still left in the relevant data structures that may cause trouble 
in the future. IMO having those macros available may speed up developing 
fixes in the future.

Thanks again,

-- 
Arcadiy Ivanov
arcadiy@ivanov.biz | @arcivanov | https://ivanov.biz
https://github.com/arcivanov

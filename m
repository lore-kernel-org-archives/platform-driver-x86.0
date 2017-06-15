From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] RFC: platform/x86: wmi: Fix check for method instance
 number
Date: Thu, 15 Jun 2017 15:59:02 +0200
Message-ID: <20170615135902.GS5248@pali>
References: <1495886134-8276-1-git-send-email-pali.rohar@gmail.com>
 <201706102115.57995@pali>
 <20170613164951.GI27850@fury>
 <201706132004.58051@pali>
 <20170613184228.GC22450@fury>
 <20170614154654.GA22981@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f46.google.com ([74.125.82.46]:36809 "EHLO
        mail-wm0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751985AbdFON7F (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 15 Jun 2017 09:59:05 -0400
Content-Disposition: inline
In-Reply-To: <20170614154654.GA22981@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario.Limonciello@dell.com, Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andy@infradead.org>, Andy Lutomirski <luto@kernel.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Mario, are you able to check if instance number passed to
wmi_evaluate_method in following dell WMI drivers is correct and should
be really 1?

I suspect that it should be zero, as instance number is indexed from
zero.

There is no comment in those dell WMI drivers why it is 1, nor what 1
means.

Ideally it needs to be checked in ACPI byte code, MOF file and WDG dump.

On Wednesday 14 June 2017 17:46:54 Pali Rohár wrote:
> Function wmi_evaluate_method:
...
>   alienware-wmi.c:
>   instance=1 /* no comment why, guid=A70591CE-A997-11DA-B012-B622A1EF5492 */
>   instance=1 /* no comment why, guid=A80593CE-A997-11DA-B012-B622A1EF5492 */
>   instance=1 /* no comment why, guid=A70591CE-A997-11DA-B012-B622A1EF5492 */
...
>   dell-wmi-led.c:
>   instance=1 /* no comment why, guid=F6E4FE6E-909D-47cb-8BAB-C9F6F2F8D396 */

-- 
Pali Rohár
pali.rohar@gmail.com

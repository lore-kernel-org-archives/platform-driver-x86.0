From: Kyle Evans <kvans32@gmail.com>
Subject: Re: [PATCHv4] hp-wmi: limit hotkey enable
Date: Fri, 11 Sep 2015 10:05:42 -0500
Message-ID: <55F2EDC6.9090504@gmail.com>
References: <20150910030330.GE90062@vmdeb7> <1441907100-4141-1-git-send-email-kvans32@gmail.com> <20150910212147.GA117960@vmdeb7>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ig0-f175.google.com ([209.85.213.175]:36080 "EHLO
	mail-ig0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752444AbbIKPM2 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 11 Sep 2015 11:12:28 -0400
Received: by igcrk20 with SMTP id rk20so43924991igc.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 11 Sep 2015 08:12:27 -0700 (PDT)
In-Reply-To: <20150910212147.GA117960@vmdeb7>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, rjw@rjwysocki.net

On 09/10/2015 04:21 PM, Darren Hart wrote:
> On Thu, Sep 10, 2015 at 12:45:00PM -0500, Kyle Evans wrote:
>> Do not write initialize magic on systems that do not have
>> feature query 0xb. Fixes Bug #82451.
>>
>> Redefine FEATURE_QUERY to align with 0xb and FEATURE2 with 0xd
>> for code clearity.
>>
>> Add a new test function, hp_wmi_bios_2008_later() & simplify
>> hp_wmi_bios_2009_later(), which fixes a bug in cases where
>> an improper value is returned. Probably also fixes Bug #69131.
>>
>> Signed-off-by: Kyle Evans <kvans32@gmail.com>
>> ---
>>   Since v1:
>>   - Refactored feature query 0xb into separate function
>>   - Redefine FEATURE_QUERY to align with 0xb and FEATURE2 with 0xd
>>
>>   Since v2:
>>   - Simplify hp_wmi_bios_200x_later functions. No longer returns tru=
e
>>   (4) when the test fails. However, if state is somehow useful, that=
 is lost.
>>
>>   Since v3:
>>   - Fix whitespace, email client reformatting.
>
> Thanks, this one applies cleanly, however:
>
> drivers/platform/x86/hp-wmi.c: In function =E2=80=98hp_wmi_input_setu=
p=E2=80=99:
> drivers/platform/x86/hp-wmi.c:675:2: error: implicit declaration of f=
unction =E2=80=98hp_wmi_2008_later=E2=80=99 [-Werror=3Dimplicit-functio=
n-declaration]
>    if (!hp_wmi_bios_2009_later() && hp_wmi_2008_later())
>    ^
> drivers/platform/x86/hp-wmi.c: At top level:
> drivers/platform/x86/hp-wmi.c:299:19: warning: =E2=80=98hp_wmi_bios_2=
008_later=E2=80=99 defined but not used [-Wunused-function]
>   static int __init hp_wmi_bios_2008_later(void)
>
> Looks like you missed "bios" in the call to hp_wmi_bios_2008_later. W=
hich
> suggests this version was not compile tested. As I cannot test the co=
de myself
> without hardware, I depend on submitters even more to do the testing,=
 so it is
> really important that you have tested the exact patch that I send to =
Linus.
>
Sorry for all the rookie mistakes.
I did run a compile and reboot script. Unfortunately, the error logic=20
was commented out when I was debugging the reboot code and never=20
re-enabled. Lesson learned. I'm on it.

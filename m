From: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Subject: Re: [PATCH 0/2] Fixes for dell-wmi
Date: Sun, 27 Dec 2015 14:10:55 +0100
Message-ID: <567FE35F.9060101@gmail.com>
References: <1450991926-20937-1-git-send-email-pali.rohar@gmail.com>
 <567FE0CD.6080107@gmail.com> <201512271407.47844@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f47.google.com ([74.125.82.47]:38780 "EHLO
	mail-wm0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751621AbbL0NK5 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 27 Dec 2015 08:10:57 -0500
In-Reply-To: <201512271407.47844@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>, Andy Lutomirski <luto@kernel.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On 27/12/2015 14:07, Pali Roh=C3=A1r wrote:
> On Sunday 27 December 2015 13:59:57 Gabriele Mazzotta wrote:
>> On 24/12/2015 22:18, Pali Roh=C3=A1r wrote:
>>> This patch series adds check if Dell WMI descriptor structure is
>>> valid and fixes processing WMI events on devices with WMI
>>> interface version 0.
>>>
>>> After testing, second patch is good candidate for backporting into
>>> stable kernels, but problem is that it cannot be used without
>>> first patch. So I let decision to other people.
>>>
>>> Gabriele and Micha=C5=82, this patch series should fix processing e=
vents
>>> on yours Dell laptops (you have in DSDT defined version 0). Can
>>> you test it?
>>
>> Hi,
>>
>> I tested the patches and all the function keys work, but I can see
>> that there are some differences in the dmesg.
>>
>> Here a before and after comparison.
>>
>> The radio button seems to generate longer messages when compared to
>> the others.
>=20
> Hi! Thanks for testing. Can you please recompile driver with line=20
> #define DEBUG at beginning of dell-wmi.c file and send dmesg output=20
> again? I want to see processing buffer debug lines in dmesg. Here we=20
> should see that after this patch series garbage will not be parsed.

I had to define DEBUG to get those lines.
dell_new_hk_type is false, so that's all I can get.

From: Andrei Borzenkov <arvidjaar@gmail.com>
Subject: Re: Regression with dell-rbtn: radio killed on resume after suspend
 to RAM
Date: Sat, 21 Nov 2015 23:39:47 +0300
Message-ID: <5650D693.6050808@gmail.com>
References: <5650BE8E.2080506@gmail.com> <201511212008.46761@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f53.google.com ([209.85.215.53]:34996 "EHLO
	mail-lf0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751305AbbKUUjv (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 21 Nov 2015 15:39:51 -0500
Received: by lfdl133 with SMTP id l133so6584686lfd.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 21 Nov 2015 12:39:50 -0800 (PST)
In-Reply-To: <201511212008.46761@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, mjg59@srcf.ucam.org, Gabriele Mazzotta <gabriele.mzt@gmail.com>, dvhart@infradead.org

21.11.2015 22:08, Pali Roh=C3=A1r =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> On Saturday 21 November 2015 19:57:18 Andrei Borzenkov wrote:
>> After installing 4.2 on Dell Latitude E5450 I found that wireless wa=
s
>> disabled every second resume from suspend to RAM. Blacklisting
>> dell-rbtn "fixed" it.
>>
>> This is probably the same as discussed in this Arch forum and relate=
d
>> bug report: https://bbs.archlinux.org/viewtopic.php?id=3D203404. I
>> myself hit it on Ubuntu.
>>
>> I am not familiar with other models, but E5450 does have DELLABCE an=
d
>> so is using dell-rbtn driver.
>>
>> I am happy to test patches if need. Please let me know if formal bug
>> report is required.
>>
>> -andrei
>
> Hi Andrei!
>
> About five hours ago Gabriele sent patch which fixing this problem to
> LKML. You can find it on: https://lkml.org/lkml/2015/11/21/57
>
> Can you test that patch and confirm it fix also for you?
>

Yes, it does. Can add Tested-By me. Thank you!

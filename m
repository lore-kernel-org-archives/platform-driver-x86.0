From: Andrei Borzenkov <arvidjaar@gmail.com>
Subject: Re: Regression with dell-rbtn: radio killed on resume after suspend
 to RAM
Date: Wed, 25 Nov 2015 06:57:25 +0300
Message-ID: <565531A5.2030304@gmail.com>
References: <201511212008.46761@pali> <5650D693.6050808@gmail.com>
 <56515F57.8060801@gmail.com> <20151123145026.GF24147@pali>
 <56532D6B.8040407@gmail.com> <56533D81.7070406@gmail.com>
 <20151123192943.GY7413@malice.jf.intel.com> <56539427.5090304@gmail.com>
 <5653E243.9010707@gmail.com> <5654248E.8030505@gmail.com>
 <20151124085215.GA7046@srcf.ucam.org> <565430FA.4050301@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f50.google.com ([209.85.215.50]:35644 "EHLO
	mail-lf0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754091AbbKYD52 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 24 Nov 2015 22:57:28 -0500
Received: by lfdl133 with SMTP id l133so45479891lfd.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2015 19:57:27 -0800 (PST)
In-Reply-To: <565430FA.4050301@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Gabriele Mazzotta <gabriele.mzt@gmail.com>, Matthew Garrett <mjg59@srcf.ucam.org>
Cc: Darren Hart <dvhart@infradead.org>, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>, platform-driver-x86@vger.kernel.org

24.11.2015 12:42, Gabriele Mazzotta =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> On 24/11/2015 09:52, Matthew Garrett wrote:
>> On Tue, Nov 24, 2015 at 09:49:18AM +0100, Gabriele Mazzotta wrote:
>>>
>>> Pali, what should we do for the case Latitude/Precision + RBTN_TOGG=
LE?
>>
>> Are there any systems which claim Windows 8 support via OSI and whic=
h
>> don't implement the rbtn interface? If not, just add an ACPI depende=
ncy
>> to dell-laptop and have it skip the rfkill code on Windows 8 and lat=
er
>> systems. I never trusted that code, but Dell insisted that it would
>> always wor on Latitudes and Precisions=E2=80=A6

And the code actually worked and still does :)

>>
>=20
> I think that systems that claim Windows 8 support also implement an
> rbtn interface, but I can't be sure of this.
>=20
> Such a solution would work, but it's worth pointing out that this wou=
ld
> move the control of radios from kernel space to user space.=20

Well, this would be wrong. Button press is still handled by hardware
(BIOS) so we should not pretend it is software. We should rather fix
dell-rbtn to do the right thing when notification is received - i.e.
query current hardware state via dell-laptop.

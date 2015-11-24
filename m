From: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Subject: Re: Regression with dell-rbtn: radio killed on resume after suspend
 to RAM
Date: Tue, 24 Nov 2015 10:42:18 +0100
Message-ID: <565430FA.4050301@gmail.com>
References: <201511212008.46761@pali> <5650D693.6050808@gmail.com>
 <56515F57.8060801@gmail.com> <20151123145026.GF24147@pali>
 <56532D6B.8040407@gmail.com> <56533D81.7070406@gmail.com>
 <20151123192943.GY7413@malice.jf.intel.com> <56539427.5090304@gmail.com>
 <5653E243.9010707@gmail.com> <5654248E.8030505@gmail.com>
 <20151124085215.GA7046@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f41.google.com ([74.125.82.41]:38388 "EHLO
	mail-wm0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752911AbbKXJmU (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 24 Nov 2015 04:42:20 -0500
Received: by wmec201 with SMTP id c201so18062000wme.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2015 01:42:19 -0800 (PST)
In-Reply-To: <20151124085215.GA7046@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: Andrei Borzenkov <arvidjaar@gmail.com>, Darren Hart <dvhart@infradead.org>, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>, platform-driver-x86@vger.kernel.org

On 24/11/2015 09:52, Matthew Garrett wrote:
> On Tue, Nov 24, 2015 at 09:49:18AM +0100, Gabriele Mazzotta wrote:
>>
>> Pali, what should we do for the case Latitude/Precision + RBTN_TOGGL=
E?
>
> Are there any systems which claim Windows 8 support via OSI and which
> don't implement the rbtn interface? If not, just add an ACPI dependen=
cy
> to dell-laptop and have it skip the rfkill code on Windows 8 and late=
r
> systems. I never trusted that code, but Dell insisted that it would
> always wor on Latitudes and Precisions=E2=80=A6
>

I think that systems that claim Windows 8 support also implement an
rbtn interface, but I can't be sure of this.

Such a solution would work, but it's worth pointing out that this would
move the control of radios from kernel space to user space. Honestly,
I'm fine this, but not everybody agrees.

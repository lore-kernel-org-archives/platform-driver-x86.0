From: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Subject: Re: [Bug 106031] Regression in 4.2.x: in airplane mode each time I
 open my laptop lid
Date: Wed, 21 Oct 2015 20:53:36 +0200
Message-ID: <CABFtUbTF5k1Jm_pG6XiG1_9H8EwZQfvbXFuGWUjNZHd5YDgvXg@mail.gmail.com>
References: <bug-106031-5380@https.bugzilla.kernel.org/>
	<bug-106031-5380-zVXKHiyrZU@https.bugzilla.kernel.org/>
	<20151021085724.GA87951@vmdeb7>
	<20151021091954.GD15219@pali>
	<20151021110059.GF15219@pali>
	<20151021111243.GB87951@vmdeb7>
	<CABFtUbTZ6M4FQ3bAjKp1iKhkoybs9-RiL6B6sCgTVvEsdXJSrw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qg0-f41.google.com ([209.85.192.41]:36001 "EHLO
	mail-qg0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755491AbbJUSxh convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 21 Oct 2015 14:53:37 -0400
Received: by qgad10 with SMTP id d10so35860693qga.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Oct 2015 11:53:36 -0700 (PDT)
In-Reply-To: <CABFtUbTZ6M4FQ3bAjKp1iKhkoybs9-RiL6B6sCgTVvEsdXJSrw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Alex Hung <alex.hung@canonical.com>

2015-10-21 13:42 GMT+02:00 Gabriele Mazzotta <gabriele.mzt@gmail.com>:
> 2015-10-21 13:12 GMT+02:00 Darren Hart <dvhart@infradead.org>:
>> On Wed, Oct 21, 2015 at 01:00:59PM +0200, Pali Roh=C3=A1r wrote:
>>> On Wednesday 21 October 2015 11:19:54 Pali Roh=C3=A1r wrote:
>>> > On Wednesday 21 October 2015 10:57:24 Darren Hart wrote:
>>> > > On Sun, Oct 18, 2015 at 09:34:56AM +0000, bugzilla-daemon@bugzi=
lla.kernel.org wrote:
>>> > > > https://bugzilla.kernel.org/show_bug.cgi?id=3D106031
>>> > > >
>>> > > > --- Comment #2 from Britt Yazel <bwyazel@gmail.com> ---
>>> > > > Confirmed. Blacklisting the dell_rbtn module solves this issu=
e
>>> > >
>>> > > Pali,
>>> > >
>>> > > Can you take a look at this bug report regarding a 4.2 regressi=
on for rfkill
>>> > > after the introduction of the dell-rbtn driver please.
>>> > >
>>> >
>>> > Hi! This looks strange. Driver dell_rbnt is just receiver of BIOS=
/ACPI
>>> > events. It receive hotkey or slide switch event and translate it =
into
>>> > either linux input keypress or rfkill block event. But dell_rbnt =
driver
>>> > itself cannot set or change wireless rfkill or airplane mode.
>>> >
>>> > So my opinion is that BIOS/ACPI could send such event, dell_rbnt =
then
>>> > propagate it into userspace and some application process it and d=
o
>>> > something...
>>> >
>>>
>>> CCing Gabriele, owner of XPS machine too. Have you seen similar pro=
blems
>>> with dell_rbtn as described in above bug report?
>
> I'll look into this ASAP. I haven't been using dell_rbtn not to disab=
le
> the hardware switch, but I didn't notice anything strange the last ti=
me
> I tested it.

I went back to see the old thread about dell-rbtn and apparently I was
aware of this problem [1]. So yes, I confirm the bug.

We are assuming that RBTN receives notifications only when a button
function keys are pressed, but this is true only for some laptops, whil=
e
others, such as my XPS13, send a notification also on resume [2].
This makes things a bit more complicated.

CCed Alex since he might be interested in this.

[1] https://marc.info/?l=3Dlinux-kernel&m=3D141927583032180
[2] https://marc.info/?l=3Dlinux-kernel&m=3D141941243829713

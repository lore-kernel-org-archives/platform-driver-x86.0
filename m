From: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Subject: Re: [Bug 106031] Regression in 4.2.x: in airplane mode each time I
 open my laptop lid
Date: Wed, 21 Oct 2015 13:42:25 +0200
Message-ID: <CABFtUbTZ6M4FQ3bAjKp1iKhkoybs9-RiL6B6sCgTVvEsdXJSrw@mail.gmail.com>
References: <bug-106031-5380@https.bugzilla.kernel.org/>
	<bug-106031-5380-zVXKHiyrZU@https.bugzilla.kernel.org/>
	<20151021085724.GA87951@vmdeb7>
	<20151021091954.GD15219@pali>
	<20151021110059.GF15219@pali>
	<20151021111243.GB87951@vmdeb7>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f169.google.com ([209.85.220.169]:34381 "EHLO
	mail-qk0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753822AbbJULm1 convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 21 Oct 2015 07:42:27 -0400
Received: by qkfm62 with SMTP id m62so29732453qkf.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Oct 2015 04:42:25 -0700 (PDT)
In-Reply-To: <20151021111243.GB87951@vmdeb7>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

2015-10-21 13:12 GMT+02:00 Darren Hart <dvhart@infradead.org>:
> On Wed, Oct 21, 2015 at 01:00:59PM +0200, Pali Roh=C3=A1r wrote:
>> On Wednesday 21 October 2015 11:19:54 Pali Roh=C3=A1r wrote:
>> > On Wednesday 21 October 2015 10:57:24 Darren Hart wrote:
>> > > On Sun, Oct 18, 2015 at 09:34:56AM +0000, bugzilla-daemon@bugzil=
la.kernel.org wrote:
>> > > > https://bugzilla.kernel.org/show_bug.cgi?id=3D106031
>> > > >
>> > > > --- Comment #2 from Britt Yazel <bwyazel@gmail.com> ---
>> > > > Confirmed. Blacklisting the dell_rbtn module solves this issue
>> > >
>> > > Pali,
>> > >
>> > > Can you take a look at this bug report regarding a 4.2 regressio=
n for rfkill
>> > > after the introduction of the dell-rbtn driver please.
>> > >
>> >
>> > Hi! This looks strange. Driver dell_rbnt is just receiver of BIOS/=
ACPI
>> > events. It receive hotkey or slide switch event and translate it i=
nto
>> > either linux input keypress or rfkill block event. But dell_rbnt d=
river
>> > itself cannot set or change wireless rfkill or airplane mode.
>> >
>> > So my opinion is that BIOS/ACPI could send such event, dell_rbnt t=
hen
>> > propagate it into userspace and some application process it and do
>> > something...
>> >
>>
>> CCing Gabriele, owner of XPS machine too. Have you seen similar prob=
lems
>> with dell_rbtn as described in above bug report?

I'll look into this ASAP. I haven't been using dell_rbtn not to disable
the hardware switch, but I didn't notice anything strange the last time
I tested it.

> Here's some context I've gathered. I haven't drawn any conclusions fr=
om this,
> but perhaps you will find it useful:
>
> From what I can tell, the XPS 13 has a TOGGLE type rfkill button (Fn-=
PrtScrn):
>
> http://www.trustedreviews.com/dell-xps-13-2015-photos-11
>
> I see in the journal that systemd is working with two rfkill devices =
(8 and 9),
> and that dell-wmi is emitting unknown key events (e00e). This key is =
of course
> not in the dell_wmi_legacy_keymap, but it would land right after 0xe0=
0d, labeled
> as a BIOS error.

e00e is some battery related event that is sent when some ACPI methods
are executed. I know it's sent upon resume. I thought about adding it
to the ignore list, but then I completely forgot. I'm not sure it has
the same meaning on all the laptops, but I don't think it's something
we care about.

> --
> Darren Hart
> Intel Open Source Technology Center

From: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Subject: Re: [Bug 106031] Regression in 4.2.x: in airplane mode each time I
 open my laptop lid
Date: Thu, 22 Oct 2015 10:26:47 +0200
Message-ID: <CABFtUbTKUTfkeqE5nWKdNyrpbs3d2edNhMb8aSmSG_fBsMvcBg@mail.gmail.com>
References: <bug-106031-5380@https.bugzilla.kernel.org/>
	<bug-106031-5380-zVXKHiyrZU@https.bugzilla.kernel.org/>
	<20151021085724.GA87951@vmdeb7>
	<20151021091954.GD15219@pali>
	<20151021110059.GF15219@pali>
	<20151021111243.GB87951@vmdeb7>
	<CABFtUbTZ6M4FQ3bAjKp1iKhkoybs9-RiL6B6sCgTVvEsdXJSrw@mail.gmail.com>
	<CABFtUbTF5k1Jm_pG6XiG1_9H8EwZQfvbXFuGWUjNZHd5YDgvXg@mail.gmail.com>
	<20151022074937.GA2581@malice.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qg0-f49.google.com ([209.85.192.49]:33878 "EHLO
	mail-qg0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751338AbbJVI0s convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 22 Oct 2015 04:26:48 -0400
Received: by qgem9 with SMTP id m9so49881059qge.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 22 Oct 2015 01:26:47 -0700 (PDT)
In-Reply-To: <20151022074937.GA2581@malice.jf.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Alex Hung <alex.hung@canonical.com>

2015-10-22 9:49 GMT+02:00 Darren Hart <dvhart@infradead.org>:
> On Wed, Oct 21, 2015 at 08:53:36PM +0200, Gabriele Mazzotta wrote:
>> 2015-10-21 13:42 GMT+02:00 Gabriele Mazzotta <gabriele.mzt@gmail.com=
>:
>> > 2015-10-21 13:12 GMT+02:00 Darren Hart <dvhart@infradead.org>:
>> >> On Wed, Oct 21, 2015 at 01:00:59PM +0200, Pali Roh=C3=A1r wrote:
>> >>> On Wednesday 21 October 2015 11:19:54 Pali Roh=C3=A1r wrote:
>> >>> > On Wednesday 21 October 2015 10:57:24 Darren Hart wrote:
>> >>> > > On Sun, Oct 18, 2015 at 09:34:56AM +0000, bugzilla-daemon@bu=
gzilla.kernel.org wrote:
>> >>> > > > https://bugzilla.kernel.org/show_bug.cgi?id=3D106031
>> >>> > > >
>> >>> > > > --- Comment #2 from Britt Yazel <bwyazel@gmail.com> ---
>> >>> > > > Confirmed. Blacklisting the dell_rbtn module solves this i=
ssue
>> >>> > >
>> >>> > > Pali,
>> >>> > >
>> >>> > > Can you take a look at this bug report regarding a 4.2 regre=
ssion for rfkill
>> >>> > > after the introduction of the dell-rbtn driver please.
>> >>> > >
>> >>> >
>> >>> > Hi! This looks strange. Driver dell_rbnt is just receiver of B=
IOS/ACPI
>> >>> > events. It receive hotkey or slide switch event and translate =
it into
>> >>> > either linux input keypress or rfkill block event. But dell_rb=
nt driver
>> >>> > itself cannot set or change wireless rfkill or airplane mode.
>> >>> >
>> >>> > So my opinion is that BIOS/ACPI could send such event, dell_rb=
nt then
>> >>> > propagate it into userspace and some application process it an=
d do
>> >>> > something...
>> >>> >
>> >>>
>> >>> CCing Gabriele, owner of XPS machine too. Have you seen similar =
problems
>> >>> with dell_rbtn as described in above bug report?
>> >
>> > I'll look into this ASAP. I haven't been using dell_rbtn not to di=
sable
>> > the hardware switch, but I didn't notice anything strange the last=
 time
>> > I tested it.
>>
>> I went back to see the old thread about dell-rbtn and apparently I w=
as
>> aware of this problem [1]. So yes, I confirm the bug.
>>
>> We are assuming that RBTN receives notifications only when a button
>> function keys are pressed, but this is true only for some laptops, w=
hile
>> others, such as my XPS13, send a notification also on resume [2].
>> This makes things a bit more complicated.
>>
>> CCed Alex since he might be interested in this.
>>
>> [1] https://marc.info/?l=3Dlinux-kernel&m=3D141927583032180
>> [2] https://marc.info/?l=3Dlinux-kernel&m=3D141941243829713
>>
>
> Am I correct in my understanding that there is no EC state associated=
 with the
> RFKILL for the TOGGLE type?

As far as I know, yes.

> Is there any point in sending the event upon resume? If not, perhaps =
we could
> set a flag on suspend and then ignore the event on resume and then cl=
ear the
> flag. This would have to be only for the affected latops though, whic=
h is
> certainly not ideal.

The problem is that we don't know which are the affected laptops. I
suspect they are those that support both the methods to disable radio
devices (software and hardware), i.e. those with a working ARBT method,
such as mine.

So this solution wouldn't really work properly, unless we define some
time constraints, which makes the solution even worse.

I'll see if I can find a batter way to deal with this problem,
dell-laptop can detect the presence of an hardware switch.

> --
> Darren Hart
> Intel Open Source Technology Center

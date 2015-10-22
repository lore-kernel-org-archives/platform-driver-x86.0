From: Darren Hart <dvhart@infradead.org>
Subject: Re: [Bug 106031] Regression in 4.2.x: in airplane mode each time I
 open my laptop lid
Date: Thu, 22 Oct 2015 09:49:37 +0200
Message-ID: <20151022074937.GA2581@malice.jf.intel.com>
References: <bug-106031-5380@https.bugzilla.kernel.org/>
 <bug-106031-5380-zVXKHiyrZU@https.bugzilla.kernel.org/>
 <20151021085724.GA87951@vmdeb7>
 <20151021091954.GD15219@pali>
 <20151021110059.GF15219@pali>
 <20151021111243.GB87951@vmdeb7>
 <CABFtUbTZ6M4FQ3bAjKp1iKhkoybs9-RiL6B6sCgTVvEsdXJSrw@mail.gmail.com>
 <CABFtUbTF5k1Jm_pG6XiG1_9H8EwZQfvbXFuGWUjNZHd5YDgvXg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:38137 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751848AbbJVHtn (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 22 Oct 2015 03:49:43 -0400
Content-Disposition: inline
In-Reply-To: <CABFtUbTF5k1Jm_pG6XiG1_9H8EwZQfvbXFuGWUjNZHd5YDgvXg@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Alex Hung <alex.hung@canonical.com>

On Wed, Oct 21, 2015 at 08:53:36PM +0200, Gabriele Mazzotta wrote:
> 2015-10-21 13:42 GMT+02:00 Gabriele Mazzotta <gabriele.mzt@gmail.com>=
:
> > 2015-10-21 13:12 GMT+02:00 Darren Hart <dvhart@infradead.org>:
> >> On Wed, Oct 21, 2015 at 01:00:59PM +0200, Pali Roh=E1r wrote:
> >>> On Wednesday 21 October 2015 11:19:54 Pali Roh=E1r wrote:
> >>> > On Wednesday 21 October 2015 10:57:24 Darren Hart wrote:
> >>> > > On Sun, Oct 18, 2015 at 09:34:56AM +0000, bugzilla-daemon@bug=
zilla.kernel.org wrote:
> >>> > > > https://bugzilla.kernel.org/show_bug.cgi?id=3D106031
> >>> > > >
> >>> > > > --- Comment #2 from Britt Yazel <bwyazel@gmail.com> ---
> >>> > > > Confirmed. Blacklisting the dell_rbtn module solves this is=
sue
> >>> > >
> >>> > > Pali,
> >>> > >
> >>> > > Can you take a look at this bug report regarding a 4.2 regres=
sion for rfkill
> >>> > > after the introduction of the dell-rbtn driver please.
> >>> > >
> >>> >
> >>> > Hi! This looks strange. Driver dell_rbnt is just receiver of BI=
OS/ACPI
> >>> > events. It receive hotkey or slide switch event and translate i=
t into
> >>> > either linux input keypress or rfkill block event. But dell_rbn=
t driver
> >>> > itself cannot set or change wireless rfkill or airplane mode.
> >>> >
> >>> > So my opinion is that BIOS/ACPI could send such event, dell_rbn=
t then
> >>> > propagate it into userspace and some application process it and=
 do
> >>> > something...
> >>> >
> >>>
> >>> CCing Gabriele, owner of XPS machine too. Have you seen similar p=
roblems
> >>> with dell_rbtn as described in above bug report?
> >
> > I'll look into this ASAP. I haven't been using dell_rbtn not to dis=
able
> > the hardware switch, but I didn't notice anything strange the last =
time
> > I tested it.
>=20
> I went back to see the old thread about dell-rbtn and apparently I wa=
s
> aware of this problem [1]. So yes, I confirm the bug.
>=20
> We are assuming that RBTN receives notifications only when a button
> function keys are pressed, but this is true only for some laptops, wh=
ile
> others, such as my XPS13, send a notification also on resume [2].
> This makes things a bit more complicated.
>=20
> CCed Alex since he might be interested in this.
>=20
> [1] https://marc.info/?l=3Dlinux-kernel&m=3D141927583032180
> [2] https://marc.info/?l=3Dlinux-kernel&m=3D141941243829713
>=20

Am I correct in my understanding that there is no EC state associated w=
ith the
RFKILL for the TOGGLE type?

Is there any point in sending the event upon resume? If not, perhaps we=
 could
set a flag on suspend and then ignore the event on resume and then clea=
r the
flag. This would have to be only for the affected latops though, which =
is
certainly not ideal.

--=20
Darren Hart
Intel Open Source Technology Center

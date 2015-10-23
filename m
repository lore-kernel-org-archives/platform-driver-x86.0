From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [Bug 106031] Regression in 4.2.x: in airplane mode each time I
 open my laptop lid
Date: Fri, 23 Oct 2015 11:00:27 +0200
Message-ID: <20151023090027.GG15219@pali>
References: <20151022074937.GA2581@malice.jf.intel.com>
 <CABFtUbTKUTfkeqE5nWKdNyrpbs3d2edNhMb8aSmSG_fBsMvcBg@mail.gmail.com>
 <20151022085117.GQ15219@pali>
 <5628BDF8.9030506@gmail.com>
 <20151022105018.GX15219@pali>
 <5628C069.8040902@gmail.com>
 <20151022130211.GA110029@vmdeb7>
 <5628E812.2070708@gmail.com>
 <20151022141710.GD15219@pali>
 <56297148.6060605@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f179.google.com ([209.85.212.179]:33114 "EHLO
	mail-wi0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751687AbbJWJA3 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 23 Oct 2015 05:00:29 -0400
Received: by wijp11 with SMTP id p11so67567219wij.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 23 Oct 2015 02:00:28 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <56297148.6060605@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Alex Hung <alex.hung@canonical.com>

On Friday 23 October 2015 01:29:12 Gabriele Mazzotta wrote:
> On 22/10/2015 16:17, Pali Roh=C3=A1r wrote:
> >On Thursday 22 October 2015 15:43:46 Gabriele Mazzotta wrote:
> >>It's the F2 key. Depending on the value passed to the RBTN, it acts=
 as
> >>hw slider or sw toggle.
> >
> >Ok, we have differences in terminology and everybody understood this
> >problem differently.
> >
> >
> >To correct this situation, first define about what we are talking ab=
out:
> >
> >* HW slider: It is hardware slider switch which as two positions ON =
and
> >              OFF. Position exactly defines hardware state of wirele=
ss
> >              radio devices. Not possible (or should not) to remap.
> >
> >* SW hotkey toggle button: It is button or key, act in same way as a=
ny
> >                            other key on keyboard, controlled by SW
> >                            (if all drivers are installed, etc).
>=20
> Sorry for the confusion, I know I've been using "HW slider" improperl=
y,
> but I thought it was clear. Although it's a button, the BIOS makes it
> behave like an hardware slider when configured to behave as such
> through RBTN. The state of radio devices is changed by the BIOS when
> the function key is pressed, this state is never changed until the us=
er
> presses the function key again (at least if we ignore the fact that w=
e
> can perform some special SMI calls), this state is saved in the EC an=
d
> both userspace and the kernel don't receive any event other than rfki=
ll
> events (if we don't consider the WMI events ignored by dell-wmi).
>=20
> I think this behavior is closer to the one of an hardware slider
> rather than the one of a software hotkey, which I can still request
> through the RBTN method.
>=20
> >Next I think that this hypothesis is truth:
> >
> >* Every machine on which is binded ACPI dell-rbtn.ko driver has eith=
er
> >   HW slider or SW toggle. Not both!
> >
> >Correct?
>=20
> It depends on how you classify my laptop. The behavior changes
> completely depending on the value passed to RBTN.
>=20
> Obviously it can behave either as HW slider (again, not an actual
> slider) or SW toggle, but I can choose between the two.
>=20

If it has keyboard button and not switch with visible two positions, it
is "toggle button" (from HW perspective).

> >Then follows my expected behaviour for HW slider:
> >
> >* State of HW slider position is exported by kernel as rfkill device=
=2E
> >
> >* In any case HW slider position (ON/OFF) match hard rfkill state de=
vice
> >   (rfkill device state is correct also after resume, wake from hibe=
rnate).
> >
> >* Immediately after user change position of HW slider, rfkill device
> >   reflect it.
> >
> >
> >And then expected behaviour for SW toggle button:
> >
> >* Every time when user press it, kernel just send input event "wirel=
ess
> >   key pressed" to userspace.
> >
> >* Kernel does not send event "wireless key pressed" when user did no=
t
> >   pressed it (e.g. after resuming from suspend, waking from hiberna=
te).
>=20
> Yes, but we don't know exactly when the user pressed the button. As I
> said, the BIOS might send an event that triggers an input event even =
if
> the user didn't press anything.
>=20

Ok. This is strange if BIOS send event "changed" even if it was not
really changed.

Is BIOS sending this incorrect event only after waking from suspend? Or
it is also randomly at any time?

If we know that it send incorrectly only after suspend, we can drop thi=
s
event. But if it is completely randomly, we probably cannot do anything
(and just do not use driver in this case).

> >* Kernel should provide rfkill devices to "soft" block appropriate
> >   wireless cards.
> >
> >* Make sure that BIOS/firmware in any case does not change radio rfk=
ill
> >   state of any wireless card and wireless cards stay in same state =
as
> >   before (no enable/disable or changing hard/soft rfkill state).
>=20
> This is the problem. We can't differentiate notifications sent to
> DELLABCE/DELLRBTN by the BIOS because it felt like it was right to do=
 so
> (e.g. after resuming) or because the user pressed the function key.
>=20

In my opinion it is better to ignore user key press after resume, if it
fix our problem. Better as false-positive event.

> >If last sentence is not truth, then kernel must not send "wireless k=
ey
> >pressed" event to userspace and act like "no key was pressed".
> >
> >
> >Make this sense? Or are there any objections about this behaviour?
> >

So if you are OK with above my description (from previous email), then
we should fix dell-rbtn to act as it (if it is not implemented already
and correctly).

So my next question is: Does dell-rbtn behave like my description? If
not what are differences and what needs to be fixed?

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

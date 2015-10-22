From: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Subject: Re: [Bug 106031] Regression in 4.2.x: in airplane mode each time I
 open my laptop lid
Date: Fri, 23 Oct 2015 01:29:12 +0200
Message-ID: <56297148.6060605@gmail.com>
References: <CABFtUbTZ6M4FQ3bAjKp1iKhkoybs9-RiL6B6sCgTVvEsdXJSrw@mail.gmail.com>
 <CABFtUbTF5k1Jm_pG6XiG1_9H8EwZQfvbXFuGWUjNZHd5YDgvXg@mail.gmail.com>
 <20151022074937.GA2581@malice.jf.intel.com>
 <CABFtUbTKUTfkeqE5nWKdNyrpbs3d2edNhMb8aSmSG_fBsMvcBg@mail.gmail.com>
 <20151022085117.GQ15219@pali> <5628BDF8.9030506@gmail.com>
 <20151022105018.GX15219@pali> <5628C069.8040902@gmail.com>
 <20151022130211.GA110029@vmdeb7> <5628E812.2070708@gmail.com>
 <20151022141710.GD15219@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f169.google.com ([209.85.212.169]:35671 "EHLO
	mail-wi0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964996AbbJVX3Q (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 22 Oct 2015 19:29:16 -0400
Received: by wicll6 with SMTP id ll6so9419334wic.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 22 Oct 2015 16:29:14 -0700 (PDT)
In-Reply-To: <20151022141710.GD15219@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Alex Hung <alex.hung@canonical.com>

On 22/10/2015 16:17, Pali Roh=C3=A1r wrote:
> On Thursday 22 October 2015 15:43:46 Gabriele Mazzotta wrote:
>> It's the F2 key. Depending on the value passed to the RBTN, it acts =
as
>> hw slider or sw toggle.
>
> Ok, we have differences in terminology and everybody understood this
> problem differently.
>
>
> To correct this situation, first define about what we are talking abo=
ut:
>
> * HW slider: It is hardware slider switch which as two positions ON a=
nd
>               OFF. Position exactly defines hardware state of wireles=
s
>               radio devices. Not possible (or should not) to remap.
>
> * SW hotkey toggle button: It is button or key, act in same way as an=
y
>                             other key on keyboard, controlled by SW
>                             (if all drivers are installed, etc).

Sorry for the confusion, I know I've been using "HW slider" improperly,
but I thought it was clear. Although it's a button, the BIOS makes it
behave like an hardware slider when configured to behave as such
through RBTN. The state of radio devices is changed by the BIOS when
the function key is pressed, this state is never changed until the user
presses the function key again (at least if we ignore the fact that we
can perform some special SMI calls), this state is saved in the EC and
both userspace and the kernel don't receive any event other than rfkill
events (if we don't consider the WMI events ignored by dell-wmi).

I think this behavior is closer to the one of an hardware slider
rather than the one of a software hotkey, which I can still request
through the RBTN method.

> Next I think that this hypothesis is truth:
>
> * Every machine on which is binded ACPI dell-rbtn.ko driver has eithe=
r
>    HW slider or SW toggle. Not both!
>
> Correct?

It depends on how you classify my laptop. The behavior changes
completely depending on the value passed to RBTN.

Obviously it can behave either as HW slider (again, not an actual
slider) or SW toggle, but I can choose between the two.

> Then follows my expected behaviour for HW slider:
>
> * State of HW slider position is exported by kernel as rfkill device.
>
> * In any case HW slider position (ON/OFF) match hard rfkill state dev=
ice
>    (rfkill device state is correct also after resume, wake from hiber=
nate).
>
> * Immediately after user change position of HW slider, rfkill device
>    reflect it.
>
>
> And then expected behaviour for SW toggle button:
>
> * Every time when user press it, kernel just send input event "wirele=
ss
>    key pressed" to userspace.
>
> * Kernel does not send event "wireless key pressed" when user did not
>    pressed it (e.g. after resuming from suspend, waking from hibernat=
e).

Yes, but we don't know exactly when the user pressed the button. As I
said, the BIOS might send an event that triggers an input event even if
the user didn't press anything.

> * Kernel should provide rfkill devices to "soft" block appropriate
>    wireless cards.
>
> * Make sure that BIOS/firmware in any case does not change radio rfki=
ll
>    state of any wireless card and wireless cards stay in same state a=
s
>    before (no enable/disable or changing hard/soft rfkill state).

This is the problem. We can't differentiate notifications sent to
DELLABCE/DELLRBTN by the BIOS because it felt like it was right to do s=
o
(e.g. after resuming) or because the user pressed the function key.

> If last sentence is not truth, then kernel must not send "wireless ke=
y
> pressed" event to userspace and act like "no key was pressed".
>
>
> Make this sense? Or are there any objections about this behaviour?
>

From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [Bug 106031] Regression in 4.2.x: in airplane mode each time I
 open my laptop lid
Date: Thu, 22 Oct 2015 16:17:10 +0200
Message-ID: <20151022141710.GD15219@pali>
References: <CABFtUbTZ6M4FQ3bAjKp1iKhkoybs9-RiL6B6sCgTVvEsdXJSrw@mail.gmail.com>
 <CABFtUbTF5k1Jm_pG6XiG1_9H8EwZQfvbXFuGWUjNZHd5YDgvXg@mail.gmail.com>
 <20151022074937.GA2581@malice.jf.intel.com>
 <CABFtUbTKUTfkeqE5nWKdNyrpbs3d2edNhMb8aSmSG_fBsMvcBg@mail.gmail.com>
 <20151022085117.GQ15219@pali>
 <5628BDF8.9030506@gmail.com>
 <20151022105018.GX15219@pali>
 <5628C069.8040902@gmail.com>
 <20151022130211.GA110029@vmdeb7>
 <5628E812.2070708@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f179.google.com ([209.85.212.179]:35515 "EHLO
	mail-wi0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757761AbbJVORN (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 22 Oct 2015 10:17:13 -0400
Received: by wicll6 with SMTP id ll6so137609758wic.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 22 Oct 2015 07:17:12 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <5628E812.2070708@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Alex Hung <alex.hung@canonical.com>

On Thursday 22 October 2015 15:43:46 Gabriele Mazzotta wrote:
> It's the F2 key. Depending on the value passed to the RBTN, it acts a=
s
> hw slider or sw toggle.

Ok, we have differences in terminology and everybody understood this
problem differently.


To correct this situation, first define about what we are talking about=
:

* HW slider: It is hardware slider switch which as two positions ON and
             OFF. Position exactly defines hardware state of wireless
             radio devices. Not possible (or should not) to remap.

* SW hotkey toggle button: It is button or key, act in same way as any
                           other key on keyboard, controlled by SW
                           (if all drivers are installed, etc).


Next I think that this hypothesis is truth:

* Every machine on which is binded ACPI dell-rbtn.ko driver has either
  HW slider or SW toggle. Not both!

Correct?


Then follows my expected behaviour for HW slider:

* State of HW slider position is exported by kernel as rfkill device.

* In any case HW slider position (ON/OFF) match hard rfkill state devic=
e
  (rfkill device state is correct also after resume, wake from hibernat=
e).

* Immediately after user change position of HW slider, rfkill device
  reflect it.


And then expected behaviour for SW toggle button:

* Every time when user press it, kernel just send input event "wireless
  key pressed" to userspace.

* Kernel does not send event "wireless key pressed" when user did not
  pressed it (e.g. after resuming from suspend, waking from hibernate).

* Kernel should provide rfkill devices to "soft" block appropriate
  wireless cards.

* Make sure that BIOS/firmware in any case does not change radio rfkill
  state of any wireless card and wireless cards stay in same state as
  before (no enable/disable or changing hard/soft rfkill state).

If last sentence is not truth, then kernel must not send "wireless key
pressed" event to userspace and act like "no key was pressed".


Make this sense? Or are there any objections about this behaviour?

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

From: David Herrmann <dh.herrmann@gmail.com>
Subject: Re: [PATCH] thinkpad_acpi: don't yell on unsupported brightness interfaces
Date: Fri, 8 Jan 2016 12:55:13 +0100
Message-ID: <CANq1E4SZZGxt21c3KpxJD_S=poMOttYaEOLYpDrSfmgXLQ+e7g@mail.gmail.com>
References: <1445424370-4725-1-git-send-email-dh.herrmann@gmail.com>
	<1445438032.750540.416379153.1ECC9658@webmail.messagingengine.com>
	<20151021144410.GB29166@vmdeb7>
	<CANq1E4TQUunxqfuxMjwmJGfOD0tjoJuH8T548XaGkSKEp-Ep_g@mail.gmail.com>
	<20151106175706.GE18221@malice.jf.intel.com>
	<CANpvso5BV-i8eE24vnTFPH=VAYFDy04U2N-Q7YRqpzd9bkbhJA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f48.google.com ([74.125.82.48]:32850 "EHLO
	mail-wm0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754449AbcAHLzP (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 8 Jan 2016 06:55:15 -0500
In-Reply-To: <CANpvso5BV-i8eE24vnTFPH=VAYFDy04U2N-Q7YRqpzd9bkbhJA@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Eric Curtin <ericcurtin17@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Henrique de Moraes Holschuh <hmh@hmh.eng.br>, platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, linux-kernel <linux-kernel@vger.kernel.org>

Hi

On Thu, Jan 7, 2016 at 2:03 AM, Eric Curtin <ericcurtin17@gmail.com> wrote:
> Also another query, could be a mini-side project for me as I'm a
> beginner kernel dev when I have some spare time. Could we change the
> minimum brightness value not to be off? 0 does not have to mean
> backlight off from reading various things around the web:
>
> http://www.x.org/wiki/Events/XDC2014/XDC2014GoedeBacklight/backlight.pdf
>
> And to be honest having the ability to completely turn off the
> backlight is a useless function and is probably unintended as discussed
> in the github thread above also. You would need night vision googles to
> read the screen in this state! I'm pretty sure the Windows driver does
> not completely turn off the screen on minimum brightness either, no
> need to have different functionality on different platforms especially
> when this functionality isn't very useful.

Whether '0' means 'off' or 'lowest brightness level' has been
discussed several times. Sadly, we cannot change semantics without
breaking user-space, so you better work around it. There have been
several proposals to fix it, but I guess no-one cared so far.

Anyway, both features (turning backlight off *and* lowest backlight
level) _are_ used actively by user-space. Hence, both should be
supported.

Thanks
David

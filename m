From: Eric Curtin <ericcurtin17@gmail.com>
Subject: Re: [PATCH] thinkpad_acpi: don't yell on unsupported brightness interfaces
Date: Thu, 7 Jan 2016 01:03:50 +0000
Message-ID: <CANpvso5BV-i8eE24vnTFPH=VAYFDy04U2N-Q7YRqpzd9bkbhJA@mail.gmail.com>
References: <1445424370-4725-1-git-send-email-dh.herrmann@gmail.com>
	<1445438032.750540.416379153.1ECC9658@webmail.messagingengine.com>
	<20151021144410.GB29166@vmdeb7>
	<CANq1E4TQUunxqfuxMjwmJGfOD0tjoJuH8T548XaGkSKEp-Ep_g@mail.gmail.com>
	<20151106175706.GE18221@malice.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f43.google.com ([74.125.82.43]:35576 "EHLO
	mail-wm0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752196AbcAGBDv (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 6 Jan 2016 20:03:51 -0500
In-Reply-To: <20151106175706.GE18221@malice.jf.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: David Herrmann <dh.herrmann@gmail.com>, Henrique de Moraes Holschuh <hmh@hmh.eng.br>, platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, linux-kernel <linux-kernel@vger.kernel.org>

On 6 November 2015 at 17:57, Darren Hart <dvhart@infradead.org> wrote:
>
> On Fri, Nov 06, 2015 at 03:19:43PM +0100, David Herrmann wrote:
> > Hi Darren!
> >
> > On Wed, Oct 21, 2015 at 4:44 PM, Darren Hart <dvhart@infradead.org> wrote:
> > > On Wed, Oct 21, 2015 at 12:33:52PM -0200, Henrique de Moraes Holschuh wrote:
> > >> On Wed, Oct 21, 2015, at 08:46, David Herrmann wrote:
> > >> > The thinkpad_acpi driver currently emits error messages on unsupported
> > >> > brightness interfaces, giving the impression that someone will implement
> > >> > those. However, this error is spit out on nearly every thinkpad in
> > >> > production since 2 years now. Furthermore, the backlight interfaces on
> > >> > those devices are supported by the i915 driver just fine.
> > >> >
> > >> > Downgrade the error message to a normal pr_info() and stop telling people
> > >> > to report it to IBM.
> > >>
> > >> IBM?  Those reports go directly to me.
> > >>
> > >> > Signed-off-by: David Herrmann <dh.herrmann@gmail.com>
> > >>
> > >> Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
> > >
> > > Thanks, Queued.
> >
> > Any particular reason this didn't show up in:
> >     [GIT PULL] platform-drivers-x86 for 4.4-1
> >
> > Just a kind reminder, in case it slipped through the cracks.
>
> Thank you, appears to be an error on my part, possibly due to some tooling
> changes on my end. Apologies, I'll get 4.4-2 out within the merge window and be
> sure to include this.
>
> --
> Darren Hart
> Intel Open Source Technology Center
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/

Hi Guys,

Actually could we just remove this log message altogether I don't think
it is very useful. The likelihood of this log indicating an error or
"Unsupported brightness interface" is very very low I imagine. This
appears on my Lenovo E540 (b variable in switch statement is 101 in my
case), I have been using Linux on this machine for well over a year and
the brightness interface is definitely very well supported. From
talking to this guy on a completely different thread it seems to happen
on his machine also:

https://github.com/mate-desktop/mate-power-manager/issues/179#issuecomment-169085313

Or else I can add a 101 switch case to the statement?

Also another query, could be a mini-side project for me as I'm a
beginner kernel dev when I have some spare time. Could we change the
minimum brightness value not to be off? 0 does not have to mean
backlight off from reading various things around the web:

http://www.x.org/wiki/Events/XDC2014/XDC2014GoedeBacklight/backlight.pdf

And to be honest having the ability to completely turn off the
backlight is a useless function and is probably unintended as discussed
in the github thread above also. You would need night vision googles to
read the screen in this state! I'm pretty sure the Windows driver does
not completely turn off the screen on minimum brightness either, no
need to have different functionality on different platforms especially
when this functionality isn't very useful.

As suggested on the GitHub thread also, on other Lenovo machines (T60),
minimum brightness (0) does not mean off, so it would be nice to have
some consistency here.

Let me know what you think, I'd be happy to implement both these things
if you guys agree. I don't see much point in writing code if it won't
be accepted!

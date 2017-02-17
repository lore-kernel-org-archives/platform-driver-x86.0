From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] platform/x86: ideapad-laptop: Add sysfs interface for
 touchpad state
Date: Fri, 17 Feb 2017 00:48:06 -0800
Message-ID: <20170217084806.GA4397@dtor-ws>
References: <20170214141612.16913-1-rrs@debian.org>
 <20170217033301.GI6814@wisp>
 <CAHp75VeUGMYpmth34OisQT54VhmkuDSFp=OAOu+c69L3GUZUmg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:33631 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754199AbdBQIsJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 17 Feb 2017 03:48:09 -0500
Content-Disposition: inline
In-Reply-To: <CAHp75VeUGMYpmth34OisQT54VhmkuDSFp=OAOu+c69L3GUZUmg@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Ritesh Raj Sarraf <rrs@debian.org>, Rafael Wysocki <rjw@rjwysocki.net>, Platform Driver <platform-driver-x86@vger.kernel.org>, Ike Panhc <ike.pan@canonical.com>, Andy Shevchenko <andy@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Feb 17, 2017 at 09:39:20AM +0200, Andy Shevchenko wrote:
> On Fri, Feb 17, 2017 at 5:33 AM, Darren Hart <dvhart@infradead.org> wrote:
> > On Tue, Feb 14, 2017 at 07:46:12PM +0530, Ritesh Raj Sarraf wrote:
> >> Lenovo Yoga (many variants: Yoga, Yoga2 Pro, Yoga2 13, Yoga3 Pro, Yoga 3
> >> 14 etc) has multiple modles that are a hybrid laptop, working in laptop
> >> mode as well as tablet mode.
> 
> > That said, we need to make these systems usable, and as there appears not to be
> > an accepted standard way of doing this, I don't object to the approach. However,
> > you mentioned in the bug comments (#64) on 2/12:
> >
> >     "I have attached the final patch that I had proposed, but for whatever
> >     reasons, the maintainer isn't convinced that that interface is needed."
> >
> > This is the only version of this patch I have seen.
> 
> This patch is actually a v2 that includes maintainers as I had asked
> and additional paragraph to explain why we need such interface.
> 
> > Who objected to the patch?
> 
> I was trying to understand why /dev/input/eventX can not be used for a such.
> 
> > I would like to hear from Rafael and Dmitry, for their opinion on an ACPI or INPUT
> > interface for indicating TABLET_MODE to userspace. Even if we accept this patch
> > as is, we should be thinking about how to do this in a standard way.

Kernel should send EV_SW/SW_TABLET_MODE to communicate tablet mode to
userspace; clients should be listening to these events.

It looks like the patch is trying to provide a way to disable the
touchpad when transitioning in tablet mode. In ChromeOS we have a notion
of "inhibiting" input devices, where userspace policy daemon tells the
kernel that it is not interested in events from a given device and input
core will suppress events from such device (and driver may optionally
put device into low power mode, if it chooses to do so). But in this
case the control seems to be totally outside of the input driver (which
I suspect is PS/2 device), so the policy daemon would have to have
specific knowledge of this new knob.

BTW, I am not sure if this is actually reliable: if system goes to S3
with lid open and user changes it into tablet form, nobody will tell the
EC that touchpad should be ignored and it will wake up the tablet.

Thanks.

-- 
Dmitry

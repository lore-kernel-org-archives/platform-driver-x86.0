From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] platform/x86: ideapad-laptop: Add sysfs interface for
 touchpad state
Date: Fri, 17 Feb 2017 11:52:37 -0800
Message-ID: <20170217195237.GD13050@dtor-ws>
References: <20170214141612.16913-1-rrs@debian.org>
 <20170217033301.GI6814@wisp>
 <CAHp75VeUGMYpmth34OisQT54VhmkuDSFp=OAOu+c69L3GUZUmg@mail.gmail.com>
 <20170217084806.GA4397@dtor-ws>
 <1487323140.6980.20.camel@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:34381 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932606AbdBQTwl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 17 Feb 2017 14:52:41 -0500
Content-Disposition: inline
In-Reply-To: <1487323140.6980.20.camel@debian.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Ritesh Raj Sarraf <rrs@debian.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Darren Hart <dvhart@infradead.org>, Rafael Wysocki <rjw@rjwysocki.net>, Platform Driver <platform-driver-x86@vger.kernel.org>, Ike Panhc <ike.pan@canonical.com>, Andy Shevchenko <andy@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Feb 17, 2017 at 02:49:00PM +0530, Ritesh Raj Sarraf wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA512
> 
> Hello Dmitry,
> 
> On Fri, 2017-02-17 at 00:48 -0800, Dmitry Torokhov wrote:
> > It looks like the patch is trying to provide a way to disable the
> > touchpad when transitioning in tablet mode. 
> 
> The keyboard/touchpad get disabled, by hardware, when flipped to tablet mode.
> Since currently, the driver has no way to expose a tablet-mode interface, we
> relied on this behavior, for the Lenovo Yoga device types.
> 
> > In ChromeOS we have a notion
> > of "inhibiting" input devices, where userspace policy daemon tells the
> > kernel that it is not interested in events from a given device and input
> > core will suppress events from such device (and driver may optionally
> > put device into low power mode, if it chooses to do so). But in this
> > case the control seems to be totally outside of the input driver (which
> > I suspect is PS/2 device), so the policy daemon would have to have
> > specific knowledge of this new knob.
> > 
> > BTW, I am not sure if this is actually reliable: if system goes to S3
> > with lid open and user changes it into tablet form, nobody will tell the
> > EC that touchpad should be ignored and it will wake up the tablet.
> 
> I am not sure what you mean here. But:
> 
> root@learner:/sys/bus/platform/devices/VPC2004:00# When in normal mode^C
> root@learner:/sys/bus/platform/devices/VPC2004:00# cat touchpad_mode 
> 1
> 
> S3 Suspend here. THen flip hw to tablet mode. Now, hit power btn to Resume.
> 
> root@learner:/sys/bus/platform/devices/VPC2004:00# Now in tablet mode^C
> root@learner:/sys/bus/platform/devices/VPC2004:00# cat touchpad_mode 
> 0

OK, if firmware disables the touchpad automatically, then it is fine.

I am wondering about the utility of the new interface though. Are there
already major users of it? If there are no users, then there is no point
in adding it, it will stay there unused and forgotten by anyone.
Teaching ideapad to emit SW_TABLET_MODE is more useful IMO.

Thanks.

-- 
Dmitry

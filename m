From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] Add WMI driver for some Megaware notebook models.
Date: Fri, 10 Dec 2010 00:09:50 -0800
Message-ID: <20101210080949.GD21009@core.coreip.homeip.net>
References: <1291928034-29199-1-git-send-email-cascardo@holoscopio.com>
 <AANLkTik9gkpnc9p0j3L20XhxRcME01=G8CNydW1FJqQ5@mail.gmail.com>
 <20101210000859.GB14810@core.coreip.homeip.net>
 <AANLkTimZYnWds0zc2faTKyKCr2+2Nf=DrQrGF8Q7X8rE@mail.gmail.com>
 <20101210073148.GA21009@core.coreip.homeip.net>
 <AANLkTikkF9aTi=KbgZsMrXUcCqrH-xyLd=efjqwKDWZB@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-gx0-f180.google.com ([209.85.161.180]:61147 "EHLO
	mail-gx0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752338Ab0LJIJ5 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 10 Dec 2010 03:09:57 -0500
Received: by gxk19 with SMTP id 19so2067476gxk.11
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Dec 2010 00:09:56 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <AANLkTikkF9aTi=KbgZsMrXUcCqrH-xyLd=efjqwKDWZB@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>
Cc: Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>, platform-driver-x86@vger.kernel.org, ceolin@ulevel.com

On Fri, Dec 10, 2010 at 08:53:31AM +0100, Corentin Chary wrote:
> On Fri, Dec 10, 2010 at 8:31 AM, Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> > On Fri, Dec 10, 2010 at 08:12:53AM +0100, Corentin Chary wrote:
> >> On Fri, Dec 10, 2010 at 1:08 AM, Dmitry Torokhov
> >> <dmitry.torokhov@gmail.com> wrote:
> >> >
> >> > .remove is still needed but I guess Corentin refers to using
> >> > platform_driver_probe() instead of platform_driver_register() so the
> >> > megaware_probe can be marked __init and discarded after driver
> >> > initialization has been completed.
> >>
> >> Also, register won't return any error code if the probe function failed,
> >> and the driver will be left in a strange state.
> >>
> >> Calling directly platform_driver_probe() will return an error code.
> >>
> >> But since it's a singleton device, and since the real "probe" code
> >> is already in the module_init function (wmi_has_guid()) call, using
> >> the probe callback to initialize data structures doesn't seems to make
> >> sense.
> >>
> >
> > What's the other option (provided that we want to keep platform device)?
> > Manual binding device and driver? I think platform_driver_probe() is
> > better tested and is safer, emits all necessary uevents. etc, etc.
> >
> > I'd suggest platform_create_bundle() except I am not quite happy with
> > the API at the moment (needs to also accept drvdata I think).
> >
> 
> Well, I'd suggest something like
> http://git.kernel.org/?p=linux/kernel/git/mjg59/platform-drivers-x86.git;a=blob;f=drivers/platform/x86/eeepc-wmi.c;hb=linux-next#l887
> 
> It's like platform_create_bundle, but by hand, because I didn't like
> the API too.
> 
> Please note that I'd gladly accept any comment/patch on eeepc-wmi if you
> think it's not ok :).

Well, I see one, more theoretical than practical issue here. Your
platform driver does not suppress bind/unbind via sysfs and when I
unbind a driver from a device I'd really expect children disappear. But
your implementation of eeepc-wmi it does not work this way.

> 
> Maybe the wmi_has_guid() calls should be in the probe callback,
> and we should all call platform_driver_probe() ?
> 

Yes, I think this would work.

-- 
Dmitry

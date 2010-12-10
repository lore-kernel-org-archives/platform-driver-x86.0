From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] Add WMI driver for some Megaware notebook models.
Date: Thu, 9 Dec 2010 23:31:48 -0800
Message-ID: <20101210073148.GA21009@core.coreip.homeip.net>
References: <1291928034-29199-1-git-send-email-cascardo@holoscopio.com>
 <AANLkTik9gkpnc9p0j3L20XhxRcME01=G8CNydW1FJqQ5@mail.gmail.com>
 <20101210000859.GB14810@core.coreip.homeip.net>
 <AANLkTimZYnWds0zc2faTKyKCr2+2Nf=DrQrGF8Q7X8rE@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-iw0-f172.google.com ([209.85.214.172]:65126 "EHLO
	mail-iw0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750966Ab0LJHbz (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 10 Dec 2010 02:31:55 -0500
Received: by iwn40 with SMTP id 40so4840946iwn.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 09 Dec 2010 23:31:55 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <AANLkTimZYnWds0zc2faTKyKCr2+2Nf=DrQrGF8Q7X8rE@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>
Cc: Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>, platform-driver-x86@vger.kernel.org, ceolin@ulevel.com

On Fri, Dec 10, 2010 at 08:12:53AM +0100, Corentin Chary wrote:
> On Fri, Dec 10, 2010 at 1:08 AM, Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > .remove is still needed but I guess Corentin refers to using
> > platform_driver_probe() instead of platform_driver_register() so the
> > megaware_probe can be marked __init and discarded after driver
> > initialization has been completed.
> 
> Also, register won't return any error code if the probe function failed,
> and the driver will be left in a strange state.
> 
> Calling directly platform_driver_probe() will return an error code.
> 
> But since it's a singleton device, and since the real "probe" code
> is already in the module_init function (wmi_has_guid()) call, using
> the probe callback to initialize data structures doesn't seems to make
> sense.
> 

What's the other option (provided that we want to keep platform device)?
Manual binding device and driver? I think platform_driver_probe() is
better tested and is safer, emits all necessary uevents. etc, etc.

I'd suggest platform_create_bundle() except I am not quite happy with
the API at the moment (needs to also accept drvdata I think).

-- 
Dmitry

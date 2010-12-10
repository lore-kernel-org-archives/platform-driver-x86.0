From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH] Add WMI driver for some Megaware notebook models.
Date: Fri, 10 Dec 2010 08:53:31 +0100
Message-ID: <AANLkTikkF9aTi=KbgZsMrXUcCqrH-xyLd=efjqwKDWZB@mail.gmail.com>
References: <1291928034-29199-1-git-send-email-cascardo@holoscopio.com>
	<AANLkTik9gkpnc9p0j3L20XhxRcME01=G8CNydW1FJqQ5@mail.gmail.com>
	<20101210000859.GB14810@core.coreip.homeip.net>
	<AANLkTimZYnWds0zc2faTKyKCr2+2Nf=DrQrGF8Q7X8rE@mail.gmail.com>
	<20101210073148.GA21009@core.coreip.homeip.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ew0-f45.google.com ([209.85.215.45]:51468 "EHLO
	mail-ew0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751136Ab0LJHxd (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 10 Dec 2010 02:53:33 -0500
Received: by ewy10 with SMTP id 10so2370293ewy.4
        for <platform-driver-x86@vger.kernel.org>; Thu, 09 Dec 2010 23:53:31 -0800 (PST)
In-Reply-To: <20101210073148.GA21009@core.coreip.homeip.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>, platform-driver-x86@vger.kernel.org, ceolin@ulevel.com

On Fri, Dec 10, 2010 at 8:31 AM, Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> On Fri, Dec 10, 2010 at 08:12:53AM +0100, Corentin Chary wrote:
>> On Fri, Dec 10, 2010 at 1:08 AM, Dmitry Torokhov
>> <dmitry.torokhov@gmail.com> wrote:
>> >
>> > .remove is still needed but I guess Corentin refers to using
>> > platform_driver_probe() instead of platform_driver_register() so the
>> > megaware_probe can be marked __init and discarded after driver
>> > initialization has been completed.
>>
>> Also, register won't return any error code if the probe function failed,
>> and the driver will be left in a strange state.
>>
>> Calling directly platform_driver_probe() will return an error code.
>>
>> But since it's a singleton device, and since the real "probe" code
>> is already in the module_init function (wmi_has_guid()) call, using
>> the probe callback to initialize data structures doesn't seems to make
>> sense.
>>
>
> What's the other option (provided that we want to keep platform device)?
> Manual binding device and driver? I think platform_driver_probe() is
> better tested and is safer, emits all necessary uevents. etc, etc.
>
> I'd suggest platform_create_bundle() except I am not quite happy with
> the API at the moment (needs to also accept drvdata I think).
>

Well, I'd suggest something like
http://git.kernel.org/?p=linux/kernel/git/mjg59/platform-drivers-x86.git;a=blob;f=drivers/platform/x86/eeepc-wmi.c;hb=linux-next#l887

It's like platform_create_bundle, but by hand, because I didn't like
the API too.

Please note that I'd gladly accept any comment/patch on eeepc-wmi if you
think it's not ok :).

Maybe the wmi_has_guid() calls should be in the probe callback,
and we should all call platform_driver_probe() ?

-- 
Corentin Chary
http://xf.iksaif.net

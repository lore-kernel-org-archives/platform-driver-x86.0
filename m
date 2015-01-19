From: AceLan Kao <acelan@gmail.com>
Subject: Re: [PATCH] ideapad-laptop: Use intel_backlight only on Lenovo B470e
Date: Mon, 19 Jan 2015 11:14:44 +0800
Message-ID: <CAMz9Wg_P3S1otKmtYJ1q=uMCsKY6QeS5n9-Bn9Ba5zwsQhpn1w@mail.gmail.com>
References: <1408342153-16764-1-git-send-email-yidi.lin@canonical.com>
	<53F68245.20403@babioch.de>
	<CAFquV7USrY9Cmg104z9nfqTpUDhiKgahyyjAk5jOEw0T3imXBQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-yk0-f180.google.com ([209.85.160.180]:37670 "EHLO
	mail-yk0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751128AbbASDOp (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 18 Jan 2015 22:14:45 -0500
Received: by mail-yk0-f180.google.com with SMTP id 9so13576832ykp.11
        for <platform-driver-x86@vger.kernel.org>; Sun, 18 Jan 2015 19:14:44 -0800 (PST)
In-Reply-To: <CAFquV7USrY9Cmg104z9nfqTpUDhiKgahyyjAk5jOEw0T3imXBQ@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Cc: Karol Babioch <karol@babioch.de>, mattia Dongili <malattia@linux.it>, YK <yk@canonical.com>, Darren Hart <dvhart@infradead.org>

Hi all,

I'm wondering are there any concerns that prevent this patch from
entering the upstream?

Best regards,
AceLan Kao.

2014-08-22 14:18 GMT+08:00 Yidi Lin <yidi.lin@canonical.com>:
> Hi Karol Babioch,
>
> On Fri, Aug 22, 2014 at 7:35 AM, Karol Babioch <karol@babioch.de> wrote:
>> By looking at your description (and your patch) I'm wondering how
>> exactly this problem made itself apparent? I'm having a similar (the
>> same?) issue with my Sony Vaio VPCS12C5E. The backlight interface
>> registered by ACPI does not work and I have to boot with the command
>> line option "acpi_backlight=vendor". Even then two interfaces get
>> registered "nv_backlight" and "sony", only one of which (nv_backlight)
>> works.
>>
>
> My situation is that the brightness control on Lenovo B470e is broken on
> Ubuntu 12.04.5 but 12.04.2. Neither "acpi_backlight=vendor " nor
> "video.use_native_backlight=1" works for the brightness control.
>
> After bisecting, the regression happens in 3.10-rc1.
>
> Before 3.10-rc1, acpi/video.c fails to register backlight interface due to
> acpi_video_device_lcd_set_level() returns -EINVAL in
> acpi_video_init_brightness().
> Only "intel_backlight" is registered under /sys/class/backlight.
> So the brightness can be adjusted from UI.
>
> In 3.10-rc1, some changes make acpi/video.c able to register backlight
> for Lenovo B470e. "acpi_video0" is used as the default backlight interface.
>
> There is no BIOS update since 2012. And the vendor is unlikely to fix this bug.
> So I propose the patch for fixing the brightness control on Lenovo B470e.
>
>> Desktop environments (GNOME in particular) seem to be confused by this,
>> so I always have to change the brightness by writing directly into the
>> "actual_brightness" file. I've reported this back in 2012 [1], but was
>> told that it is an ACPI issue and so it never was fixed.
>>
>
> Similar situation on Toshiba T130-15T
> https://bugzilla.kernel.org/show_bug.cgi?id=50551
>
>> Couldn't a similar patch be applied to the sony-laptop module? I've
>> added Mattia Dongili to the discussion, hopefully he doesn't mind to
>> take a look at this again. I'm glad to test any patches, but am not
>> familiar enough with all of the internal structs to mess around with
>> them for myself without breaking support for other users of this module,
>> especially since my model was shipped with in two different versions:
>> One with the internal Intel GPU and another with a dedicated Nvidia GPU.
>> I'm afraid a simple DMI match might not be good enough in this case?
>>
>
> You may use dmidecode to see if there is any extra information which can
> differentiate between these two versions.
>
> Regards,
> Edward Lin
> --
> To unsubscribe from this list: send the line "unsubscribe platform-driver-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Chia-Lin Kao(AceLan)
http://blog.acelan.idv.tw/
E-Mail: acelan.kaoATcanonical.com (s/AT/@/)

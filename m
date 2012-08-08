From: AceLan Kao <acelan.kao@canonical.com>
Subject: Re: asus-wmi.ko should be loaded before video.ko
Date: Wed, 8 Aug 2012 16:13:05 +0800
Message-ID: <CAMz9Wg-nYAV-hT_kXQAuP6yZDqAPGzqs1rKZP19PCmE-mGuivg@mail.gmail.com>
References: <CAMz9Wg9A=mmSVRh8HS4ezTqs=A8EmX_yiGSB8HbNSOxckG+4KQ@mail.gmail.com>
	<CAHR064i7xywTh1-=bfTOSLGZkWEV-WtNwp9adtCtq1YrkRmF0g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:48087 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757854Ab2HHINH (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 8 Aug 2012 04:13:07 -0400
Received: by pbbrr13 with SMTP id rr13so1086378pbb.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 08 Aug 2012 01:13:06 -0700 (PDT)
In-Reply-To: <CAHR064i7xywTh1-=bfTOSLGZkWEV-WtNwp9adtCtq1YrkRmF0g@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentincj@iksaif.net>
Cc: platform-driver-x86@vger.kernel.org

Dear Corentin,

2012/8/7 Corentin Chary <corentincj@iksaif.net>:
> On Tue, Aug 7, 2012 at 11:26 AM, AceLan Kao <acelan.kao@canonical.com> wrote:
>> Hi,
>>
>> The new commit[1] will call acpi_video_dmi_promote_vendor() to add
>> the ACPI_VIDEO_BACKLIGHT_DMI_VENDOR flag to acpi_video_support.
>> So, asus-wmi.ko should be loaded before video.ko, or calling that
>> function is in vain.
>> Since loading video.ko will check those flags, we have to add the flag
>> before it's being checked.
>>
>> I'm wondering is there a way to add this kind of dependency in the code, so that
>> depmod will help to build the dependency in modules.dep
>>
>> 1. 272c77d asus-wmi: control backlight power through WMI, not ACPI
>>
>> Best regards,
>> AceLan Kao.
>
> Hi,
>
> I don't really understand what you mean.
> Currently:
> - acpi_video_dmi_promote_vendor() is called to set the flags
> - video.ko flags are checked to find which backlight should be used
> (in order to respect acpi_video="" parameters if user specified them)
> - if necessary, acpi_video_unregister() is called
>
> So yes, the acpi backlight will be register, and then un-registered,
> but there is no way to fix that (or with a big blacklist in video.ko,
> and we don't want that).
I saw asus-wmi will call acpi_video_unregister(),
but it looks like it doesn't call backlight_device_unregister() as well.

The problem is that the /sys/class/backlight/acpi_video0 directory still exists
and the gnome-settings-daemon will choose acpi_video0 for the
brightness functions
But, if asus-wmi is loaded before video, then video won't call
backlight_device_register(),
since the flag is already be set.

>
> Thanks,
>
> --
> Corentin Chary
> http://xf.iksaif.net



-- 
Chia-Lin Kao(AceLan)
http://blog.acelan.idv.tw/
E-Mail: acelan.kaoATcanonical.com (s/AT/@/)

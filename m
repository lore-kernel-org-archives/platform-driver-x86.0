From: Corentin Chary <corentincj@iksaif.net>
Subject: Re: asus-wmi.ko should be loaded before video.ko
Date: Wed, 8 Aug 2012 11:34:51 +0200
Message-ID: <CAHR064i0VUp5djWdoKLpk9H32w81ULwQFeM3hrzTsehF6ou20A@mail.gmail.com>
References: <CAMz9Wg9A=mmSVRh8HS4ezTqs=A8EmX_yiGSB8HbNSOxckG+4KQ@mail.gmail.com>
	<CAHR064i7xywTh1-=bfTOSLGZkWEV-WtNwp9adtCtq1YrkRmF0g@mail.gmail.com>
	<CAMz9Wg-nYAV-hT_kXQAuP6yZDqAPGzqs1rKZP19PCmE-mGuivg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qa0-f46.google.com ([209.85.216.46]:48634 "EHLO
	mail-qa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751926Ab2HHJew (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 8 Aug 2012 05:34:52 -0400
Received: by qadb17 with SMTP id b17so2309720qad.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 08 Aug 2012 02:34:51 -0700 (PDT)
In-Reply-To: <CAMz9Wg-nYAV-hT_kXQAuP6yZDqAPGzqs1rKZP19PCmE-mGuivg@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: AceLan Kao <acelan.kao@canonical.com>
Cc: platform-driver-x86@vger.kernel.org

On Wed, Aug 8, 2012 at 10:13 AM, AceLan Kao <acelan.kao@canonical.com> wrote:
> Dear Corentin,
>
> 2012/8/7 Corentin Chary <corentincj@iksaif.net>:
>> On Tue, Aug 7, 2012 at 11:26 AM, AceLan Kao <acelan.kao@canonical.com> wrote:
>>> Hi,
>>>
>>> The new commit[1] will call acpi_video_dmi_promote_vendor() to add
>>> the ACPI_VIDEO_BACKLIGHT_DMI_VENDOR flag to acpi_video_support.
>>> So, asus-wmi.ko should be loaded before video.ko, or calling that
>>> function is in vain.
>>> Since loading video.ko will check those flags, we have to add the flag
>>> before it's being checked.
>>>
>>> I'm wondering is there a way to add this kind of dependency in the code, so that
>>> depmod will help to build the dependency in modules.dep
>>>
>>> 1. 272c77d asus-wmi: control backlight power through WMI, not ACPI
>>>
>>> Best regards,
>>> AceLan Kao.
>>
>> Hi,
>>
>> I don't really understand what you mean.
>> Currently:
>> - acpi_video_dmi_promote_vendor() is called to set the flags
>> - video.ko flags are checked to find which backlight should be used
>> (in order to respect acpi_video="" parameters if user specified them)
>> - if necessary, acpi_video_unregister() is called
>>
>> So yes, the acpi backlight will be register, and then un-registered,
>> but there is no way to fix that (or with a big blacklist in video.ko,
>> and we don't want that).
> I saw asus-wmi will call acpi_video_unregister(),
> but it looks like it doesn't call backlight_device_unregister() as well.

backlight_device_unregister() should be called by video.ko when
calling acpi_video_unregister()

> The problem is that the /sys/class/backlight/acpi_video0 directory still exists
> and the gnome-settings-daemon will choose acpi_video0 for the
> brightness functions

Are you sure acpi_video_unregister() was called in this case ? can you
add some traces to video.c to see what happened and why
backlight_device_unregister() wasn't called ?

> But, if asus-wmi is loaded before video, then video won't call
> backlight_device_register(),
> since the flag is already be set.

Honestly, I don't know if there is a way to do that, and asus-wmi
should be loadable and working at any time, not only on boot.

-- 
Corentin Chary
http://xf.iksaif.net

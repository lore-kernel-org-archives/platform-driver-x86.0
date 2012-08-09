From: AceLan Kao <acelan.kao@canonical.com>
Subject: Re: asus-wmi.ko should be loaded before video.ko
Date: Thu, 9 Aug 2012 11:29:23 +0800
Message-ID: <CAMz9Wg-Way=wRo2BYX=aDHEDTuJ4nmwb2wGLTKh3Duvkt8T-Zw@mail.gmail.com>
References: <CAMz9Wg9A=mmSVRh8HS4ezTqs=A8EmX_yiGSB8HbNSOxckG+4KQ@mail.gmail.com>
	<CAHR064i7xywTh1-=bfTOSLGZkWEV-WtNwp9adtCtq1YrkRmF0g@mail.gmail.com>
	<CAMz9Wg-nYAV-hT_kXQAuP6yZDqAPGzqs1rKZP19PCmE-mGuivg@mail.gmail.com>
	<CAHR064i0VUp5djWdoKLpk9H32w81ULwQFeM3hrzTsehF6ou20A@mail.gmail.com>
	<5022C95D.6090200@igalia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:41349 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753893Ab2HIDfq (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 8 Aug 2012 23:35:46 -0400
Received: by yenl2 with SMTP id l2so4446yen.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 08 Aug 2012 20:35:45 -0700 (PDT)
In-Reply-To: <5022C95D.6090200@igalia.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentincj@iksaif.net>
Cc: platform-driver-x86@vger.kernel.org, Carlos Alberto Lopez Perez <clopez@igalia.com>

Dear Corentin,

2012/8/9 Carlos Alberto Lopez Perez <clopez@igalia.com>:
> On 08/08/12 11:34, Corentin Chary wrote:
>>> The problem is that the /sys/class/backlight/acpi_video0 directory still exists
>>> > and the gnome-settings-daemon will choose acpi_video0 for the
>>> > brightness functions
>> Are you sure acpi_video_unregister() was called in this case ? can you
>> add some traces to video.c to see what happened and why
>> backlight_device_unregister() wasn't called ?
Yes, you are right, acpi_video_unregister() is not be called.
#ifdef CONFIG_ACPI_VIDEO doesn't work as expected.
In ubuntu kernel, it's config as module, CONFIG_ACPI_VIDEO=m.
I will try to figure out what happened.

>>> > But, if asus-wmi is loaded before video, then video won't call
>>> > backlight_device_register(),
>>> > since the flag is already be set.
>> Honestly, I don't know if there is a way to do that, and asus-wmi
>> should be loadable and working at any time, not only on boot.
>
> What about writing an udev rule to force using acpi_video0 for asus-wmi?
>
> Use udevadm to get the attributes for building the rule
>
> udevadm info --attribute-walk --path=/sys/class/backlight/acpi_video0
>



-- 
Chia-Lin Kao(AceLan)
http://blog.acelan.idv.tw/
E-Mail: acelan.kaoATcanonical.com (s/AT/@/)

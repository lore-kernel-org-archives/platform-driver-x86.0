From: Corentin Chary <corentincj@iksaif.net>
Subject: Re: asus-wmi.ko should be loaded before video.ko
Date: Tue, 7 Aug 2012 11:32:33 +0200
Message-ID: <CAHR064i7xywTh1-=bfTOSLGZkWEV-WtNwp9adtCtq1YrkRmF0g@mail.gmail.com>
References: <CAMz9Wg9A=mmSVRh8HS4ezTqs=A8EmX_yiGSB8HbNSOxckG+4KQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qc0-f174.google.com ([209.85.216.174]:53892 "EHLO
	mail-qc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753809Ab2HGJce (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 7 Aug 2012 05:32:34 -0400
Received: by qcro28 with SMTP id o28so2306285qcr.19
        for <platform-driver-x86@vger.kernel.org>; Tue, 07 Aug 2012 02:32:33 -0700 (PDT)
In-Reply-To: <CAMz9Wg9A=mmSVRh8HS4ezTqs=A8EmX_yiGSB8HbNSOxckG+4KQ@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: AceLan Kao <acelan.kao@canonical.com>
Cc: platform-driver-x86@vger.kernel.org

On Tue, Aug 7, 2012 at 11:26 AM, AceLan Kao <acelan.kao@canonical.com> wrote:
> Hi,
>
> The new commit[1] will call acpi_video_dmi_promote_vendor() to add
> the ACPI_VIDEO_BACKLIGHT_DMI_VENDOR flag to acpi_video_support.
> So, asus-wmi.ko should be loaded before video.ko, or calling that
> function is in vain.
> Since loading video.ko will check those flags, we have to add the flag
> before it's being checked.
>
> I'm wondering is there a way to add this kind of dependency in the code, so that
> depmod will help to build the dependency in modules.dep
>
> 1. 272c77d asus-wmi: control backlight power through WMI, not ACPI
>
> Best regards,
> AceLan Kao.

Hi,

I don't really understand what you mean.
Currently:
- acpi_video_dmi_promote_vendor() is called to set the flags
- video.ko flags are checked to find which backlight should be used
(in order to respect acpi_video="" parameters if user specified them)
- if necessary, acpi_video_unregister() is called

So yes, the acpi backlight will be register, and then un-registered,
but there is no way to fix that (or with a big blacklist in video.ko,
and we don't want that).

Thanks,

-- 
Corentin Chary
http://xf.iksaif.net

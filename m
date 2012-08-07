From: AceLan Kao <acelan.kao@canonical.com>
Subject: asus-wmi.ko should be loaded before video.ko
Date: Tue, 7 Aug 2012 17:26:45 +0800
Message-ID: <CAMz9Wg9A=mmSVRh8HS4ezTqs=A8EmX_yiGSB8HbNSOxckG+4KQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:53676 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753408Ab2HGJ0q (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 7 Aug 2012 05:26:46 -0400
Received: by yenl2 with SMTP id l2so3444891yen.19
        for <platform-driver-x86@vger.kernel.org>; Tue, 07 Aug 2012 02:26:46 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, Corentin Chary <corentincj@iksaif.net>

Hi,

The new commit[1] will call acpi_video_dmi_promote_vendor() to add
the ACPI_VIDEO_BACKLIGHT_DMI_VENDOR flag to acpi_video_support.
So, asus-wmi.ko should be loaded before video.ko, or calling that
function is in vain.
Since loading video.ko will check those flags, we have to add the flag
before it's being checked.

I'm wondering is there a way to add this kind of dependency in the code, so that
depmod will help to build the dependency in modules.dep

1. 272c77d asus-wmi: control backlight power through WMI, not ACPI

Best regards,
AceLan Kao.

-- 
Chia-Lin Kao(AceLan)
http://blog.acelan.idv.tw/
E-Mail: acelan.kaoATcanonical.com (s/AT/@/)

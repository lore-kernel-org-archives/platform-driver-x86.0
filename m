From: Darren Hart <dvhart@infradead.org>
Subject: Darren unavailable through Aug 11
Date: Thu, 6 Aug 2015 10:56:47 -0700
Message-ID: <20150806001023.GC34034@vmdeb7>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:40431 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753594AbbHFR6O (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 6 Aug 2015 13:58:14 -0400
Received: from dvhart by bombadil.infradead.org with local (Exim 4.80.1 #2 (Red Hat Linux))
	id 1ZNPQj-0004De-US
	for platform-driver-x86@vger.kernel.org; Thu, 06 Aug 2015 17:58:13 +0000
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org

Platform Drivers X86 contributors,

I will be unavailable for review and merge through Aug 11. If you have submitted
patches and are uncertain of their status, you may:

1) Check the for-next and for-review branches of my tree
   (listed in MAINTAINERS)

2) Check the status on the newly instantiated Patchwork:
   https://patchwork.kernel.org/project/platform-driver-x86/list/?state=*&archive=both

The following patches are currently queued in for-next:
495078f toshiba_acpi: Bump driver version to 0.23
a6b5354 toshiba_acpi: Remove unnecessary checks and returns in HCI/SCI functions
e1a949c toshiba_acpi: Refactor *{get, set} functions return value
0409cbc toshiba_acpi: Remove "*not supported" feature prints
ea215a3 toshiba_acpi: Change *available functions return type
3e07e5b toshiba_acpi: Add set_fan_status function
1e574db toshiba_acpi: Change some variables to avoid warnings from ninja-check
d50c900 toshiba_acpi: Reorder toshiba_acpi_alt_keymap entries
d7e4f2e toshiba_acpi: Remove unused wireless defines
695f606 toshiba_acpi: Transflective backlight updates
a88bc06 toshiba_acpi: Avoid registering input device on WMI event laptops
fc5462f toshiba_acpi: Add /dev/toshiba_acpi device
7deef55 toshiba_acpi: Adapt /proc/acpi/toshiba/keys to TOS1900 devices

The following are queued in for-review:
c2bc755 ideapad-laptop: add alternative representation for Yoga 2 to DMI table
0325467 surface pro 3: Add support driver for Surface Pro 3 buttons
7b623a4 platform:x86: add Intel Punit mailbox IPC driver
50f6db8 asus-laptop: Add key found on Asus F3M
6615e04 MAINTAINERS: Remove Toshiba Linux mailing list address

Regards,

-- 
Darren Hart
Intel Open Source Technology Center

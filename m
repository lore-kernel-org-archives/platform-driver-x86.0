From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH v2 0/8] toshiba_acpi: New functions added
Date: Tue, 25 Mar 2014 20:38:28 -0600
Message-ID: <1395801515-2333-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oa0-f46.google.com ([209.85.219.46]:39775 "EHLO
	mail-oa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751314AbaCZCjG (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 25 Mar 2014 22:39:06 -0400
Received: by mail-oa0-f46.google.com with SMTP id i7so1728851oag.5
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Mar 2014 19:39:05 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>, platform-driver-x86@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

Up for review, the following patch series add new features
found on newer Toshiba laptops such as KBD Backlight,
TouchPad enable/disable and accelerometer axes info.

[1] http://linux.toshiba-dme.co.jp/linux/index.htm

These apply cleanly to the Next tree and with some fuzz
to Matthew's platform tree.

Changes from v1 include:
- Dropped platform support, as suggested by Seth Forshee
- Re-factor SCI code to be less intrusive, the return code
  cleanup can be done later, as they are shared by both
  the HCI and SCI
- Re-order the patches to have all the SCI dependent ones first

[PATCH 1/7] toshiba_acpi: Add System Configuration Interface
[PATCH 2/7] toshiba_acpi: Adapt Illumination code to use SCI
[PATCH 3/7] toshiba_acpi: Add keyboard backlight support
[PATCH 4/7] toshiba_acpi: Add touchpad enable/disable support
[PATCH 5/7] toshiba_acpi: Add ECO mode led support
[PATCH 6/7] toshiba_acpi: Add accelerometer support
[PATCH 7/7] toshiba_acpi: Update version and copyright info

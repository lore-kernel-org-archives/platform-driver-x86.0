From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH v2 0/4] toshiba_acpi: Add support for USB Sleep functions
Date: Sun, 18 Jan 2015 18:30:21 -0700
Message-ID: <1421631025-27895-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:63011 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751185AbbASBaz (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 18 Jan 2015 20:30:55 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

The following patches add support to several USB Sleep functions
found on newer Toshiba laptops, allowing to use the USB ports while
the laptop is asleep or turned off.

Changes since v1:
- Changed accepted parameters on first patch and added a short
  description of what the auto and alternate charging modes mean
- Some misc format and typo changes

Azael Avalos (4):
  toshiba_acpi: Add support for USB Sleep and Charge function
  toshiba_acpi: Add support for USB Sleep functions under battery
  toshiba_acpi: Add support for USB Rapid Charge
  toshiba_acpi: Add support for USB Sleep and Music

 drivers/platform/x86/toshiba_acpi.c | 455 ++++++++++++++++++++++++++++++++++++
 1 file changed, 455 insertions(+)

-- 
2.2.1

From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH 0/3] platform/x86: Toshiba built-in accelerometer support
Date: Mon,  4 Aug 2014 09:27:12 -0600
Message-ID: <1407166035-2020-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ob0-f176.google.com ([209.85.214.176]:55650 "EHLO
	mail-ob0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751065AbaHDP1U (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 4 Aug 2014 11:27:20 -0400
Received: by mail-ob0-f176.google.com with SMTP id wo20so4599330obc.21
        for <platform-driver-x86@vger.kernel.org>; Mon, 04 Aug 2014 08:27:20 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>, platform-driver-x86@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

Up for review.

The following series of patches add support for the
built-in accelerometer found on recent Toshiba laptops
with HID TOS620A.

Azael Avalos (3):
  platform/x86: Toshiba HDD Active Protection Sensor
  Documentation: Add file about toshiba_haps module
  platform/x86: Enable build support for toshiba_haps

 Documentation/laptops/toshiba_haps.txt |  80 ++++++++++
 drivers/platform/x86/Kconfig           |  20 +++
 drivers/platform/x86/toshiba_haps.c    | 283 +++++++++++++++++++++++++++++++++
 3 files changed, 383 insertions(+)
 create mode 100644 Documentation/laptops/toshiba_haps.txt
 create mode 100644 drivers/platform/x86/toshiba_haps.c

-- 
2.0.0

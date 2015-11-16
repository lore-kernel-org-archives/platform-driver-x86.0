From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH 0/2] toshiba_acpi: Add WWAN support
Date: Sun, 15 Nov 2015 20:26:48 -0700
Message-ID: <1447644410-32665-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f47.google.com ([209.85.218.47]:35322 "EHLO
	mail-oi0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752597AbbKPD12 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 15 Nov 2015 22:27:28 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Fabian Koester <fabian.koester@bringnow.com>, Azael Avalos <coproscefalo@gmail.com>

These two patches add WWAN support to the driver, the first adds the actual
support functions and the second adds RFKill handler functions to set the
device status according to the killswitch.

Azael Avalos (2):
  toshiba_acpi: Add support for WWAN devices
  toshiba_acpi: Add WWAN RFKill support

 drivers/platform/x86/toshiba_acpi.c | 166 ++++++++++++++++++++++++++++++++++++
 1 file changed, 166 insertions(+)

-- 
2.6.2

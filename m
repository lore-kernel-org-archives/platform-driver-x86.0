From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH 0/2] toshiba_acpi: Purge driver from bluetooth RFKill code
Date: Mon, 27 Apr 2015 14:30:52 -0600
Message-ID: <1430166654-15010-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f43.google.com ([209.85.218.43]:33265 "EHLO
	mail-oi0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964994AbbD0UbF (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 27 Apr 2015 16:31:05 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

These two patches remove all bluetooth rfkill code from toshiba_acpi
and its build dependencies, as another series of patches will re-add
the rfkill code to toshiba_bluetooth instead.

Azael Avalos (2):
  toshiba_acpi: Remove bluetooth rfkill code
  platform/x86: Remove RFKILL dependency from toshiba_acpi

 drivers/platform/x86/Kconfig        |   1 -
 drivers/platform/x86/toshiba_acpi.c | 123 ------------------------------------
 2 files changed, 124 deletions(-)

-- 
2.3.5

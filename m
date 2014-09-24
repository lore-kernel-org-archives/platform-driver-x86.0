From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH 0/4] toshiba_acpi: Return codes cleanup
Date: Tue, 23 Sep 2014 18:24:24 -0600
Message-ID: <1411518268-2773-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f44.google.com ([209.85.218.44]:56623 "EHLO
	mail-oi0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750796AbaIXAYj (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 23 Sep 2014 20:24:39 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

Up for review.

This series of patches are a cleanup thee Toshiba
configuration interface return codes (unification),
as well as changing the returned type of the HCI/SCI
read/write functions from acpi_status to u32, since
the "status" was never checked on most of the functions.

I would like these to be queued for 3.18 if possible.

Azael Avalos (4):
  toshiba_acpi: Rename hci_raw to tci_raw
  toshiba_acpi: Unify return codes prefix to from HCI/SCI to TOS
  toshiba_acpi: Change HCI/SCI functions return code type
  toshiba_acpi: Adapt functions to the changes made to HCI/SCI

 drivers/platform/x86/toshiba_acpi.c | 289 ++++++++++++++++++------------------
 1 file changed, 142 insertions(+), 147 deletions(-)

-- 
2.0.0

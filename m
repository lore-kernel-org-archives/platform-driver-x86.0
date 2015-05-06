From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH v3 0/5] toshiba_acpi: Driver cleanup
Date: Wed,  6 May 2015 09:35:08 -0600
Message-ID: <1430926513-6264-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f42.google.com ([209.85.218.42]:34363 "EHLO
	mail-oi0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751197AbbEFPfY (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 6 May 2015 11:35:24 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

These patches cleanup the driver from some no longer needed
functions, renames hci_{read, write}1 functions, some comment
blocks were changed, unneeded error checks removed and the driver
version was bumped to 0.22.

Changes since v2:
- Refactor third patch according to ml comments
- Typo on fifth patch

Changes since v1:
- Added two new patches to the series, one containing error check
  removals and another bumping the driver version.

Azael Avalos (5):
  toshiba_acpi: Remove no longer needed hci_{read, write}2 functions
  toshiba_acpi: Rename hci_{read, write}1 functions
  toshiba_acpi: Comments cleanup
  toshiba_acpi: Remove TOS_FAILURE check from some functions
  toshiba_acpi: Bump driver version to 0.22

 drivers/platform/x86/toshiba_acpi.c | 122 +++++++++++++++---------------------
 1 file changed, 50 insertions(+), 72 deletions(-)

-- 
2.3.6

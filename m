From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH v2 0/5] toshiba_acpi: Driver cleanup
Date: Mon,  4 May 2015 11:15:53 -0600
Message-ID: <1430759758-4026-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:35445 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751442AbbEDRQF (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 4 May 2015 13:16:05 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

These patches cleanup the driver from some no longer needed
functions, renames hci_{read, write}1 functions, some comment
blocks were changed, unneeded error checks removed and the driver
version was bumped to 0.22.

Changes since v1:
- Added two new patches to the series, one containing error check
  removals and another bumping the driver version.

Darren:
Sorry for this, I totally forgot to include the patch to remove
the function error check :-(
Now this patchset is complete now :-)

Azael Avalos (5):
  toshiba_acpi: Remove no longer needed hci_{read, write}2 functions
  toshiba_acpi: Rename hci_{read, write}1 functions
  toshiba_acpi: Cleanup blank lines after comment blocks
  toshiba_acpi: Remove TOS_FAILURE check from some functions
  toshiba_acpi: Bump driver version to 0.22

 drivers/platform/x86/toshiba_acpi.c | 136 +++++++++++++++---------------------
 1 file changed, 57 insertions(+), 79 deletions(-)

-- 
2.3.6

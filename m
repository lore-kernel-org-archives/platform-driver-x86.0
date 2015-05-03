From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH 0/3] toshiba_acpi: Driver cleanup
Date: Sun,  3 May 2015 17:46:33 -0600
Message-ID: <1430696793-12469-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f52.google.com ([209.85.218.52]:33443 "EHLO
	mail-oi0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751181AbbECXqh (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 3 May 2015 19:46:37 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

These patches cleanup the driver from some no longer needed
functions, renames hci_{read, write}1 functions and also some comment
blocks were changed.

Azael Avalos (3):
  toshiba_acpi: Remove no longer needed hci_{read, write}2 functions
  toshiba_acpi: Rename hci_{read, write}1 functions
  toshiba_acpi: Cleanup blank lines after comment blocks

 drivers/platform/x86/toshiba_acpi.c | 114 +++++++++++++++---------------------
 1 file changed, 46 insertions(+), 68 deletions(-)

-- 
2.3.6

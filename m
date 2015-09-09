From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH 0/2] toshiba_acpi: Hotkey updates
Date: Wed,  9 Sep 2015 11:28:18 -0600
Message-ID: <1441819700-11678-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:36804 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752104AbbIIR2Y (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 9 Sep 2015 13:28:24 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

These two patches make some changes to the hotkeys code, the first
patch unify the hotkey enabling code, and the second changes the default
hotkey enabling parameter.

Azael Avalos (2):
  toshiba_acpi: Unify hotkey enabling functions
  toshiba_acpi: Change default Hotkey enabling value

 drivers/platform/x86/toshiba_acpi.c | 38 +++++++++++++------------------------
 1 file changed, 13 insertions(+), 25 deletions(-)

-- 
2.5.1

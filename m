From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH 0/3] toshiba_acpi: Functions cleanup
Date: Tue, 16 Aug 2016 12:06:14 -0600
Message-ID: <20160816180617.1743-1-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f65.google.com ([209.85.218.65]:35755 "EHLO
	mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752671AbcHPSG5 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 16 Aug 2016 14:06:57 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

These set of patches make some cleanup in some of the driver's functions.

The first patch changes the variables declaration, the second changes
the error checking logic and the third simply fixes a typo found while
making these changes.

Azael Avalos (3):
  toshiba_acpi: Cleanup variable declaration
  toshiba_acpi: Change error checking logic from TCI functions
  toshiba_acpi: Fix typo in *_cooling_method_set function

 drivers/platform/x86/toshiba_acpi.c | 322 +++++++++++++++++++-----------------
 1 file changed, 169 insertions(+), 153 deletions(-)

-- 
2.9.2

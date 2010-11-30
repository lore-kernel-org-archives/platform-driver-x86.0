From: Herton Ronaldo Krzesinski <herton@mandriva.com.br>
Subject: [PATCH 1/2] classmate-laptop: add missing input_sync call
Date: Tue, 30 Nov 2010 16:30:42 -0200
Message-ID: <1291141843-8807-1-git-send-email-herton@mandriva.com.br>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from perninha.conectiva.com.br ([187.115.55.249]:55889 "EHLO
	perninha.conectiva.com.br" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753858Ab0K3SbD (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 30 Nov 2010 13:31:03 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Matthew Garrett <mjg@redhat.com>, Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>, Herton Ronaldo Krzesinski <herton@mandriva.com.br>

Add missing input_sync call in cmpc_keys_handler function.

Signed-off-by: Herton Ronaldo Krzesinski <herton@mandriva.com.br>
Cc: Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>
---
 drivers/platform/x86/classmate-laptop.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/classmate-laptop.c b/drivers/platform/x86/classmate-laptop.c
index 341cbfe..b714c6a 100644
--- a/drivers/platform/x86/classmate-laptop.c
+++ b/drivers/platform/x86/classmate-laptop.c
@@ -655,6 +655,7 @@ static void cmpc_keys_handler(struct acpi_device *dev, u32 event)
 		code = cmpc_keys_codes[event & 0x0F];
 	inputdev = dev_get_drvdata(&dev->dev);;
 	input_report_key(inputdev, code, !(event & 0x10));
+	input_sync(inputdev);
 }
 
 static void cmpc_keys_idev_init(struct input_dev *inputdev)
-- 
1.7.3.2

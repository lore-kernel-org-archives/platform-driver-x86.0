From: Anisse Astier <anisse@astier.eu>
Subject: [PATCH] MAINTAINERS: Orphan x86 driver msi-wmi
Date: Sun, 14 Jun 2015 22:32:23 +0200
Message-ID: <1434313943-4016-1-git-send-email-anisse@astier.eu>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f173.google.com ([209.85.212.173]:35357 "EHLO
	mail-wi0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751797AbbFNUck (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 14 Jun 2015 16:32:40 -0400
Received: by wiga1 with SMTP id a1so58810378wig.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 14 Jun 2015 13:32:39 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>
Cc: Anisse Astier <anisse@astier.eu>

I haven't touched the code in a long time, and I don't have access to
the hardware anymore to test any changes to this driver.

Signed-off-by: Anisse Astier <anisse@astier.eu>
---
 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d8afd29..8a9204a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6557,9 +6557,8 @@ S:	Maintained
 F:	drivers/platform/x86/msi-laptop.c
 
 MSI WMI SUPPORT
-M:	Anisse Astier <anisse@astier.eu>
 L:	platform-driver-x86@vger.kernel.org
-S:	Supported
+S:	Orphan
 F:	drivers/platform/x86/msi-wmi.c
 
 MSI001 MEDIA DRIVER
-- 
1.9.3

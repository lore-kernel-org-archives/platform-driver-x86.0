From: Ike Panhc <ike.pan@canonical.com>
Subject: [PATCH] MAINTAINERS: add new entry for ideapad-laptop
Date: Thu, 25 Aug 2011 22:28:45 +0800
Message-ID: <1314282525-2247-1-git-send-email-ike.pan@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:45550 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750893Ab1HYO2x (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 25 Aug 2011 10:28:53 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: mjg@redhat.com

Signed-off-by: Ike Panhc <ike.pan@canonical.com>
---
 MAINTAINERS |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 069ee3b..cca2a91 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3183,6 +3183,13 @@ F:	Documentation/ide/
 F:	drivers/ide/
 F:	include/linux/ide.h
 
+IDEAPAD LAPTOP EXTRAS DRIVER
+M:	Ike Panhc <ike.pan@canonical.com>
+L:	platform-driver-x86@vger.kernel.org
+W:	http://launchpad.net/ideapad-laptop
+S:	Maintained
+F:	drivers/platform/x86/ideapad-laptop.c
+
 IDE/ATAPI DRIVERS
 M:	Borislav Petkov <petkovbb@gmail.com>
 L:	linux-ide@vger.kernel.org
-- 
1.7.5.4

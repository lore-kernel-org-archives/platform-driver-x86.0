From: Corentin Chary <corentincj@iksaif.net>
Subject: [PATCH 07/10] eeepc-wmi: claim eeepc-wmi maintainership
Date: Mon, 29 Nov 2010 08:14:11 +0100
Message-ID: <1291014854-17961-8-git-send-email-corentincj@iksaif.net>
References: <1291014854-17961-1-git-send-email-corentincj@iksaif.net>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from slow3-v.mail.gandi.net ([217.70.178.89]:37219 "EHLO
	slow3-v.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755021Ab0K2HPK (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 29 Nov 2010 02:15:10 -0500
Received: from relay4-v.mail.gandi.net (relay4-v.mail.gandi.net [217.70.178.78])
	by slow3-v.mail.gandi.net (Postfix) with ESMTP id DCD2E862B1
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Nov 2010 08:15:09 +0100 (CET)
In-Reply-To: <1291014854-17961-1-git-send-email-corentincj@iksaif.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Matthew Garrett <mjg@redhat.com>, "David S. Miller" <davem@davemloft.net>, Yong Wang <yong.y.wang@intel.com>, Corentin Chary <corentincj@iksaif.net>

Since eeepc-wmi has currently no official maintainer, I claim
maintainership of this driver, and add it to the acpi4asus project.

Signed-off-by: Corentin Chary <corentincj@iksaif.net>
---
 MAINTAINERS                      |    8 ++++++++
 drivers/platform/x86/eeepc-wmi.c |    1 +
 2 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index b49ba9a..02a34ea 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2242,6 +2242,14 @@ W:	http://acpi4asus.sf.net
 S:	Maintained
 F:	drivers/platform/x86/eeepc-laptop.c
 
+EEEPC WMI EXTRAS DRIVER
+M:	Corentin Chary <corentincj@iksaif.net>
+L:	acpi4asus-user@lists.sourceforge.net
+L:	platform-driver-x86@vger.kernel.org
+W:	http://acpi4asus.sf.net
+S:	Maintained
+F:	drivers/platform/x86/eeepc-wmi.c
+
 EFIFB FRAMEBUFFER DRIVER
 L:	linux-fbdev@vger.kernel.org
 M:	Peter Jones <pjones@redhat.com>
diff --git a/drivers/platform/x86/eeepc-wmi.c b/drivers/platform/x86/eeepc-wmi.c
index 78306be..5f3f42c 100644
--- a/drivers/platform/x86/eeepc-wmi.c
+++ b/drivers/platform/x86/eeepc-wmi.c
@@ -2,6 +2,7 @@
  * Eee PC WMI hotkey driver
  *
  * Copyright(C) 2010 Intel Corporation.
+ * Copyright(C) 2010 Corentin Chary <corentin.chary@gmail.com>
  *
  * Portions based on wistron_btns.c:
  * Copyright (C) 2005 Miloslav Trmac <mitr@volny.cz>
-- 
1.7.3.2

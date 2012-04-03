From: Robert Gerlach <khnz@gmx.de>
Subject: [PATCH 2/3] fujitsu-tablet: convert printk to pr_*
Date: Tue,  3 Apr 2012 22:34:34 +0200
Message-ID: <1333485275-2752-3-git-send-email-khnz@gmx.de>
References: <1333485275-2752-1-git-send-email-khnz@gmx.de>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mailout-de.gmx.net ([213.165.64.22]:48289 "HELO
	mailout-de.gmx.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1753502Ab2DCUem (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 3 Apr 2012 16:34:42 -0400
Received: from localhost (localhost [127.0.0.1])
	by kolab.lan (Postfix) with ESMTP id 011CB166A3
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Apr 2012 22:34:40 +0200 (CEST)
Received: from kolab.lan ([127.0.0.1])
	by localhost (kolab.lan [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2ZElwJVEgx34 for <platform-driver-x86@vger.kernel.org>;
	Tue,  3 Apr 2012 22:34:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by kolab.lan (Postfix) with ESMTP id 0ECB2166A9
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Apr 2012 22:34:38 +0200 (CEST)
In-Reply-To: <1333485275-2752-1-git-send-email-khnz@gmx.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, Robert Gerlach <khnz@gmx.de>


Signed-off-by: Robert Gerlach <khnz@gmx.de>
---
 drivers/platform/x86/fujitsu-tablet.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-tablet.c b/drivers/platform/x86/fujitsu-tablet.c
index 4830f5d..8b74fdf 100644
--- a/drivers/platform/x86/fujitsu-tablet.c
+++ b/drivers/platform/x86/fujitsu-tablet.c
@@ -16,6 +16,8 @@
  * 59 Temple Place Suite 330, Boston, MA 02111-1307, USA.
  */
 
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/init.h>
@@ -274,7 +276,7 @@ static irqreturn_t fujitsu_interrupt(int irq, void *dev_id)
 
 static int __devinit fujitsu_dmi_default(const struct dmi_system_id *dmi)
 {
-	printk(KERN_INFO MODULENAME ": %s\n", dmi->ident);
+	pr_info("%s\n", dmi->ident);
 	memcpy(fujitsu.config.keymap, dmi->driver_data,
 			sizeof(fujitsu.config.keymap));
 	return 1;
-- 
1.7.9.1

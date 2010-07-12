From: Axel Lin <axel.lin@gmail.com>
Subject: [PATCH] eeepc-laptop: fix hotplug_disabled module_param permissions
Date: Mon, 12 Jul 2010 09:15:25 +0800
Message-ID: <1278897325.6563.7.camel@mola>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-px0-f174.google.com ([209.85.212.174]:37485 "EHLO
	mail-px0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755357Ab0GLBO5 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 11 Jul 2010 21:14:57 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: linux-kernel <linux-kernel@vger.kernel.org>
Cc: Corentin Chary <corentincj@iksaif.net>, Matthew Garrett <mjg@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Alan Jenkins <alan-jenkins@tuffmail.co.uk>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

The hotplug_disabled module parameter is determinated at the module load time.
Change the value after the module is loaded does not make sense and has
no effect at all, thus set the permissions to 0444 instead of 0644.

Signed-off-by: Axel Lin <axel.lin@gmail.com>
---
 drivers/platform/x86/eeepc-laptop.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/platform/x86/eeepc-laptop.c b/drivers/platform/x86/eeepc-laptop.c
index 0306174..6b8e062 100644
--- a/drivers/platform/x86/eeepc-laptop.c
+++ b/drivers/platform/x86/eeepc-laptop.c
@@ -53,7 +53,7 @@ MODULE_LICENSE("GPL");
 
 static bool hotplug_disabled;
 
-module_param(hotplug_disabled, bool, 0644);
+module_param(hotplug_disabled, bool, 0444);
 MODULE_PARM_DESC(hotplug_disabled,
 		 "Disable hotplug for wireless device. "
 		 "If your laptop need that, please report to "
-- 
1.5.4.3

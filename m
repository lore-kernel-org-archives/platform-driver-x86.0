From: Andy Ross <andy.ross@windriver.com>
Subject: [PATCH 4/4] asus-laptop: allow boot time control of Pegatron ALS sensor
Date: Thu, 24 Mar 2011 15:02:10 -0700
Message-ID: <1301004130-3294-5-git-send-email-andy.ross@windriver.com>
References: <1301004130-3294-1-git-send-email-andy.ross@windriver.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from li44-10.members.linode.com ([72.14.181.10]:44868 "EHLO
	plausible.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757155Ab1CXWIj (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 24 Mar 2011 18:08:39 -0400
In-Reply-To: <1301004130-3294-1-git-send-email-andy.ross@windriver.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>
Cc: acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

Signed-off-by: Andy Ross <andy.ross@windriver.com>
---
 drivers/platform/x86/asus-laptop.c |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x86/asus-laptop.c
index 9b07368..1d32457 100644
--- a/drivers/platform/x86/asus-laptop.c
+++ b/drivers/platform/x86/asus-laptop.c
@@ -85,6 +85,7 @@ static int wlan_status = 1;
 static int bluetooth_status = 1;
 static int wimax_status = -1;
 static int wwan_status = -1;
+static int als_status = -1;
 
 module_param(wlan_status, int, 0444);
 MODULE_PARM_DESC(wlan_status, "Set the wireless status on boot "
@@ -106,6 +107,11 @@ MODULE_PARM_DESC(wwan_status, "Set the wireless status on boot "
 		 "(0 = disabled, 1 = enabled, -1 = don't do anything). "
 		 "default is 1");
 
+module_param(als_status, int, 0444);
+MODULE_PARM_DESC(als_status, "Set the ALS status on boot "
+		 "(0 = disabled, 1 = enabled, -1 = don't do anything). "
+		 "default is 0");
+
 /*
  * Some events we use, same for all Asus
  */
@@ -1752,7 +1758,7 @@ static int __devinit asus_acpi_init(struct asus_laptop *asus)
 	asus->ledd_status = 0xFFF;
 
 	/* Set initial values of light sensor and level */
-	asus->light_switch = 0;	/* Default to light sensor disabled */
+	asus->light_switch = als_status >= 0 ? !!als_status : 0;
 	asus->light_level = 5;	/* level 5 for sensor sensitivity */
 
 	if (asus->have_pega_lucid) {
-- 
1.7.1

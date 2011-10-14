From: Corentin Chary <corentincj-EjuBZuxMvz2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCH 3/8] asus-laptop: allow boot time control
	of Pegatron ALS sensor
Date: Fri, 14 Oct 2011 11:13:37 +0200
Message-ID: <1318583622-23518-4-git-send-email-corentincj@iksaif.net>
References: <1318583622-23518-1-git-send-email-corentincj@iksaif.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <acpi4asus-user-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <1318583622-23518-1-git-send-email-corentincj-EjuBZuxMvz2sTnJN9+BGXg@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/acpi4asus-user>,
	<mailto:acpi4asus-user-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=acpi4asus-user>
List-Post: <mailto:acpi4asus-user-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:acpi4asus-user-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/acpi4asus-user>,
	<mailto:acpi4asus-user-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: acpi4asus-user-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Matthew Garrett <mjg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: acpi4asus-user-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Anisse Astier <anisse-fwwRqrJYcP2HXe+LvDLADg@public.gmane.org>, Corentin Chary <corentin.chary-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andy Ross <andy.ross-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

From: Andy Ross <andy.ross-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>

Signed-off-by: Andy Ross <andy.ross-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
Signed-off-by: Corentin Chary <corentin.chary-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/platform/x86/asus-laptop.c |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x86/asus-laptop.c
index afed9ff..e892a43 100644
--- a/drivers/platform/x86/asus-laptop.c
+++ b/drivers/platform/x86/asus-laptop.c
@@ -85,6 +85,7 @@ static int wlan_status = 1;
 static int bluetooth_status = 1;
 static int wimax_status = -1;
 static int wwan_status = -1;
+static int als_status;
 
 module_param(wlan_status, int, 0444);
 MODULE_PARM_DESC(wlan_status, "Set the wireless status on boot "
@@ -106,6 +107,11 @@ MODULE_PARM_DESC(wwan_status, "Set the wireless status on boot "
 		 "(0 = disabled, 1 = enabled, -1 = don't do anything). "
 		 "default is 1");
 
+module_param(als_status, int, 0444);
+MODULE_PARM_DESC(als_status, "Set the ALS status on boot "
+		 "(0 = disabled, 1 = enabled). "
+		 "default is 0");
+
 /*
  * Some events we use, same for all Asus
  */
@@ -1472,7 +1478,7 @@ static int __devinit asus_acpi_init(struct asus_laptop *asus)
 	asus->ledd_status = 0xFFF;
 
 	/* Set initial values of light sensor and level */
-	asus->light_switch = 0;	/* Default to light sensor disabled */
+	asus->light_switch = !!als_status;
 	asus->light_level = 5;	/* level 5 for sensor sensitivity */
 
 	if (asus->is_pega_lucid) {
-- 
1.7.3.4


------------------------------------------------------------------------------
All the data continuously generated in your IT infrastructure contains a
definitive record of customers, application performance, security
threats, fraudulent activity and more. Splunk takes this data and makes
sense of it. Business sense. IT sense. Common sense.
http://p.sf.net/sfu/splunk-d2d-oct

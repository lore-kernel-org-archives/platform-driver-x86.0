From: Corentin Chary <corentincj-EjuBZuxMvz2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCH 6/8] asus-laptop: fix module description
Date: Fri, 14 Oct 2011 11:13:40 +0200
Message-ID: <1318583622-23518-7-git-send-email-corentincj@iksaif.net>
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

From: Corentin Chary <corentin.chary-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Signed-off-by: Corentin Chary <corentin.chary-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/platform/x86/asus-laptop.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x86/asus-laptop.c
index 168084e..d67b7b5 100644
--- a/drivers/platform/x86/asus-laptop.c
+++ b/drivers/platform/x86/asus-laptop.c
@@ -90,22 +90,22 @@ static int als_status;
 module_param(wlan_status, int, 0444);
 MODULE_PARM_DESC(wlan_status, "Set the wireless status on boot "
 		 "(0 = disabled, 1 = enabled, -1 = don't do anything). "
-		 "default is 1");
+		 "default is -1");
 
 module_param(bluetooth_status, int, 0444);
 MODULE_PARM_DESC(bluetooth_status, "Set the wireless status on boot "
 		 "(0 = disabled, 1 = enabled, -1 = don't do anything). "
-		 "default is 1");
+		 "default is -1");
 
 module_param(wimax_status, int, 0444);
 MODULE_PARM_DESC(wimax_status, "Set the wireless status on boot "
 		 "(0 = disabled, 1 = enabled, -1 = don't do anything). "
-		 "default is 1");
+		 "default is -1");
 
 module_param(wwan_status, int, 0444);
 MODULE_PARM_DESC(wwan_status, "Set the wireless status on boot "
 		 "(0 = disabled, 1 = enabled, -1 = don't do anything). "
-		 "default is 1");
+		 "default is -1");
 
 module_param(als_status, int, 0444);
 MODULE_PARM_DESC(als_status, "Set the ALS status on boot "
-- 
1.7.3.4


------------------------------------------------------------------------------
All the data continuously generated in your IT infrastructure contains a
definitive record of customers, application performance, security
threats, fraudulent activity and more. Splunk takes this data and makes
sense of it. Business sense. IT sense. Common sense.
http://p.sf.net/sfu/splunk-d2d-oct

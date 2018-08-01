From: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux-9XfqOkM5JgxKQ7RDE2T8Pw@public.gmane.org>
Subject: [PATCH] platform/x86: thinkpad_acpi: Fix
 multi-battery bug
Date: Thu,  2 Aug 2018 00:19:19 +0200
Message-ID: <20180801221919.19187-1-linux@weissschuh.net>
References: <20180801114747.qrjclik665ya7oh5@khazad-dum.debian.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <20180801114747.qrjclik665ya7oh5-ZGHd14iZgfaRjzvQDGKj+xxZW9W5cXbT@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
Cc: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux-9XfqOkM5JgxKQ7RDE2T8Pw@public.gmane.org>, Ognjen Galic <smclt30p-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

The struct containing the supported operations for all batteries is
being zeroed on each battery probe.  This prevents all other batteries
except the lastly probed one from being configured.
---
 drivers/platform/x86/thinkpad_acpi.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 3dbff2dda9be..60de1c577ce0 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -9374,7 +9374,9 @@ static int tpacpi_battery_probe(int battery)
 {
 	int ret = 0;
 
-	memset(&battery_info, 0, sizeof(struct tpacpi_battery_driver_data));
+	memset(&battery_info.batteries[battery], 0,
+		sizeof(battery_info.batteries[battery]));
+
 	/*
 	 * 1) Get the current start threshold
 	 * 2) Check for support
@@ -9616,6 +9618,8 @@ static const struct tpacpi_quirk battery_quirk_table[] __initconst = {
 
 static int __init tpacpi_battery_init(struct ibm_init_struct *ibm)
 {
+	memset(&battery_info, 0, sizeof(battery_info));
+
 	tp_features.battery_force_primary = tpacpi_check_quirks(
 					battery_quirk_table,
 					ARRAY_SIZE(battery_quirk_table));
-- 
2.18.0


------------------------------------------------------------------------------
Check out the vibrant tech community on one of the world's most
engaging tech sites, Slashdot.org! http://sdm.link/slashdot

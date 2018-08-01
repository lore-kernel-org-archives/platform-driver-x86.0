From: Jouke Witteveen <j.witteveen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 2/2] platform/x86: thinkpad_acpi:
 Support battery quirk
Date: Wed, 1 Aug 2018 11:27:44 +0200
Message-ID: <20180801092744.GA11320@Mindship-05.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org, dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org
Cc: ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

Some Thinkpads have a single battery, but expose it as BAT1. Use the quirks
engine to force these machines into always addressing the primary battery.
Without this, the battery name would resolve to the non-existent secondary
battery and ACPI calls would fail.

Signed-off-by: Jouke Witteveen <j.witteveen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---

Compared to the previous version of this patch, four new models were found
that need the quirk. It was tested on the Thinkpad 13 (three character ID)
and the Thinkpad 11e (two character ID).

The other three IDs were scraped from bug reports where the driver reports

    Thinkpad_acpi: Error probing battery 2

These bug reports were found by a simple web search.

 drivers/platform/x86/thinkpad_acpi.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 2cd3ca7e..bc9a11b8 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -335,6 +335,7 @@ static struct {
 	u32 second_fan:1;
 	u32 beep_needs_two_args:1;
 	u32 mixer_no_level_control:1;
+	u32 battery_force_primary:1;
 	u32 input_device_registered:1;
 	u32 platform_drv_registered:1;
 	u32 platform_drv_attrs_registered:1;
@@ -343,7 +344,6 @@ static struct {
 	u32 sensors_pdev_attrs_registered:1;
 	u32 hotkey_poll_active:1;
 	u32 has_adaptive_kbd:1;
-	u32 battery:1;
 } tp_features;
 
 static struct {
@@ -471,6 +471,12 @@ do {									\
 	  .ec = TPACPI_MATCH_ANY,		\
 	  .quirks = (__quirk) }
 
+#define TPACPI_Q_LNV3(__id1, __id2, __id3, __quirk) \
+	{ .vendor = PCI_VENDOR_ID_LENOVO,	\
+	  .bios = TPID3(__id1, __id2, __id3),	\
+	  .ec = TPACPI_MATCH_ANY,		\
+	  .quirks = (__quirk) }
+
 #define TPACPI_QEC_LNV(__id1, __id2, __quirk)	\
 	{ .vendor = PCI_VENDOR_ID_LENOVO,	\
 	  .bios = TPACPI_MATCH_ANY,		\
@@ -9423,7 +9429,8 @@ static int tpacpi_battery_probe(int battery)
 static int tpacpi_battery_get_id(const char *battery_name)
 {
 
-	if (strcmp(battery_name, "BAT0") == 0)
+	if (strcmp(battery_name, "BAT0") == 0 ||
+	    tp_features.battery_force_primary)
 		return BAT_PRIMARY;
 	if (strcmp(battery_name, "BAT1") == 0)
 		return BAT_SECONDARY;
@@ -9599,8 +9606,24 @@ static struct acpi_battery_hook battery_hook = {
 
 /* Subdriver init/exit */
 
+static const struct tpacpi_quirk battery_quirk_table[] __initconst = {
+	/*
+	 * Individual addressing is broken on models that expose the
+	 * primary battery as BAT1.
+	 */
+	TPACPI_Q_LNV('J', '7', true),       /* B5400 */
+	TPACPI_Q_LNV('J', 'I', true),       /* 11e */
+	TPACPI_Q_LNV3('R', '0', 'B', true), /* 11e gen 3 */
+	TPACPI_Q_LNV3('R', '0', 'C', true), /* 13 */
+	TPACPI_Q_LNV3('R', '0', 'J', true), /* 13 gen 2 */
+};
+
 static int __init tpacpi_battery_init(struct ibm_init_struct *ibm)
 {
+	tp_features.battery_force_primary = tpacpi_check_quirks(
+					battery_quirk_table,
+					ARRAY_SIZE(battery_quirk_table));
+
 	battery_hook_register(&battery_hook);
 	return 0;
 }
-- 
2.18.0


------------------------------------------------------------------------------
Check out the vibrant tech community on one of the world's most
engaging tech sites, Slashdot.org! http://sdm.link/slashdot

From: Jouke Witteveen <j.witteveen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/2] platform/x86: thinkpad_acpi: Proper
 model/release matching
Date: Wed, 11 Jul 2018 11:44:41 +0200
Message-ID: <20180711094441.GA3240@Mindship-05.localdomain>
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

Modern Thinkpads have three character model designators. Previously, they
would be accepted, but recorded incompletely. Revision matching extracted
the wrong bytes from the ID string. This made the use of quirks for modern
machines impossible.

Fixes: 1b0eb5bc2413
Signed-off-by: Jouke Witteveen <j.witteveen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/platform/x86/thinkpad_acpi.c | 98 ++++++++++++++--------------
 1 file changed, 48 insertions(+), 50 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index cae9b059..2cd3ca7e 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -358,9 +358,9 @@ struct thinkpad_id_data {
 	char *bios_version_str;	/* Something like 1ZET51WW (1.03z) */
 	char *ec_version_str;	/* Something like 1ZHT51WW-1.04a */
 
-	u16 bios_model;		/* 1Y = 0x5931, 0 = unknown */
-	u16 ec_model;
-	u16 bios_release;	/* 1ZETK1WW = 0x314b, 0 = unknown */
+	u32 bios_model;		/* 1Y = 0x3159, 0 = unknown */
+	u32 ec_model;
+	u16 bios_release;	/* 1ZETK1WW = 0x4b31, 0 = unknown */
 	u16 ec_release;
 
 	char *model_str;	/* ThinkPad T43 */
@@ -444,17 +444,20 @@ do {									\
 /*
  * Quirk handling helpers
  *
- * ThinkPad IDs and versions seen in the field so far
- * are two-characters from the set [0-9A-Z], i.e. base 36.
+ * ThinkPad IDs and versions seen in the field so far are
+ * two or three characters from the set [0-9A-Z], i.e. base 36.
  *
  * We use values well outside that range as specials.
  */
 
-#define TPACPI_MATCH_ANY		0xffffU
+#define TPACPI_MATCH_ANY		0xffffffffU
+#define TPACPI_MATCH_ANY_VERSION	0xffffU
 #define TPACPI_MATCH_UNKNOWN		0U
 
-/* TPID('1', 'Y') == 0x5931 */
-#define TPID(__c1, __c2) (((__c2) << 8) | (__c1))
+/* TPID('1', 'Y') == 0x3159 */
+#define TPID(__c1, __c2)	(((__c1) << 8) | (__c2))
+#define TPID3(__c1, __c2, __c3)	(((__c1) << 16) | ((__c2) << 8) | (__c3))
+#define TPVER TPID
 
 #define TPACPI_Q_IBM(__id1, __id2, __quirk)	\
 	{ .vendor = PCI_VENDOR_ID_IBM,		\
@@ -476,8 +479,8 @@ do {									\
 
 struct tpacpi_quirk {
 	unsigned int vendor;
-	u16 bios;
-	u16 ec;
+	u32 bios;
+	u32 ec;
 	unsigned long quirks;
 };
 
@@ -1647,16 +1650,16 @@ static void tpacpi_remove_driver_attributes(struct device_driver *drv)
 	{ .vendor	= (__v),			\
 	  .bios		= TPID(__id1, __id2),		\
 	  .ec		= TPACPI_MATCH_ANY,		\
-	  .quirks	= TPACPI_MATCH_ANY << 16	\
-			  | (__bv1) << 8 | (__bv2) }
+	  .quirks	= TPACPI_MATCH_ANY_VERSION << 16 \
+			  | TPVER(__bv1, __bv2) }
 
 #define TPV_Q_X(__v, __bid1, __bid2, __bv1, __bv2,	\
 		__eid, __ev1, __ev2)			\
 	{ .vendor	= (__v),			\
 	  .bios		= TPID(__bid1, __bid2),		\
 	  .ec		= __eid,			\
-	  .quirks	= (__ev1) << 24 | (__ev2) << 16 \
-			  | (__bv1) << 8 | (__bv2) }
+	  .quirks	= TPVER(__ev1, __ev2) << 16	\
+			  | TPVER(__bv1, __bv2) }
 
 #define TPV_QI0(__id1, __id2, __bv1, __bv2) \
 	TPV_Q(PCI_VENDOR_ID_IBM, __id1, __id2, __bv1, __bv2)
@@ -1798,7 +1801,7 @@ static void __init tpacpi_check_outdated_fw(void)
 	/* note that unknown versions are set to 0x0000 and we use that */
 	if ((bios_version > thinkpad_id.bios_release) ||
 	    (ec_version > thinkpad_id.ec_release &&
-				ec_version != TPACPI_MATCH_ANY)) {
+				ec_version != TPACPI_MATCH_ANY_VERSION)) {
 		/*
 		 * The changelogs would let us track down the exact
 		 * reason, but it is just too much of a pain to track
@@ -9808,36 +9811,37 @@ static int __init ibm_init(struct ibm_init_struct *iibm)
 
 /* Probing */
 
-static bool __pure __init tpacpi_is_fw_digit(const char c)
+static char __init tpacpi_parse_fw_id(const char * const s,
+				      u32 *model, u16 *release)
 {
-	return (c >= '0' && c <= '9') || (c >= 'A' && c <= 'Z');
-}
+	int i;
+
+	if (!s || strlen(s) < 8)
+		goto invalid;
+
+	for (i = 0; i < 8; i++)
+		if (!((s[i] >= '0' && s[i] <= '9') ||
+		      (s[i] >= 'A' && s[i] <= 'Z')))
+			goto invalid;
 
-static bool __pure __init tpacpi_is_valid_fw_id(const char * const s,
-						const char t)
-{
 	/*
 	 * Most models: xxyTkkWW (#.##c)
 	 * Ancient 570/600 and -SL lacks (#.##c)
 	 */
-	if (s && strlen(s) >= 8 &&
-		tpacpi_is_fw_digit(s[0]) &&
-		tpacpi_is_fw_digit(s[1]) &&
-		s[2] == t &&
-		(s[3] == 'T' || s[3] == 'N') &&
-		tpacpi_is_fw_digit(s[4]) &&
-		tpacpi_is_fw_digit(s[5]))
-		return true;
+	if (s[3] == 'T' || s[3] == 'N') {
+		*model = TPID(s[0], s[1]);
+		*release = TPVER(s[4], s[5]);
+		return s[2];
 
 	/* New models: xxxyTkkW (#.##c); T550 and some others */
-	return s && strlen(s) >= 8 &&
-		tpacpi_is_fw_digit(s[0]) &&
-		tpacpi_is_fw_digit(s[1]) &&
-		tpacpi_is_fw_digit(s[2]) &&
-		s[3] == t &&
-		(s[4] == 'T' || s[4] == 'N') &&
-		tpacpi_is_fw_digit(s[5]) &&
-		tpacpi_is_fw_digit(s[6]);
+	} else if (s[4] == 'T' || s[4] == 'N') {
+		*model = TPID3(s[0], s[1], s[2]);
+		*release = TPVER(s[5], s[6]);
+		return s[3];
+	}
+
+invalid:
+	return '\0';
 }
 
 /* returns 0 - probe ok, or < 0 - probe error.
@@ -9849,6 +9853,7 @@ static int __must_check __init get_thinkpad_model_data(
 	const struct dmi_device *dev = NULL;
 	char ec_fw_string[18];
 	char const *s;
+	char t;
 
 	if (!tp)
 		return -EINVAL;
@@ -9868,15 +9873,11 @@ static int __must_check __init get_thinkpad_model_data(
 		return -ENOMEM;
 
 	/* Really ancient ThinkPad 240X will fail this, which is fine */
-	if (!(tpacpi_is_valid_fw_id(tp->bios_version_str, 'E') ||
-	      tpacpi_is_valid_fw_id(tp->bios_version_str, 'C')))
+	t = tpacpi_parse_fw_id(tp->bios_version_str,
+			       &tp->bios_model, &tp->bios_release);
+	if (t != 'E' && t != 'C')
 		return 0;
 
-	tp->bios_model = tp->bios_version_str[0]
-			 | (tp->bios_version_str[1] << 8);
-	tp->bios_release = (tp->bios_version_str[4] << 8)
-			 | tp->bios_version_str[5];
-
 	/*
 	 * ThinkPad T23 or newer, A31 or newer, R50e or newer,
 	 * X32 or newer, all Z series;  Some models must have an
@@ -9895,12 +9896,9 @@ static int __must_check __init get_thinkpad_model_data(
 			if (!tp->ec_version_str)
 				return -ENOMEM;
 
-			if (tpacpi_is_valid_fw_id(ec_fw_string, 'H')) {
-				tp->ec_model = ec_fw_string[0]
-						| (ec_fw_string[1] << 8);
-				tp->ec_release = (ec_fw_string[4] << 8)
-						| ec_fw_string[5];
-			} else {
+			t = tpacpi_parse_fw_id(ec_fw_string,
+					       &tp->ec_model, &tp->ec_release);
+			if (t != 'H') {
 				pr_notice("ThinkPad firmware release %s doesn't match the known patterns\n",
 					  ec_fw_string);
 				pr_notice("please report this to %s\n",
-- 
2.18.0


------------------------------------------------------------------------------
Check out the vibrant tech community on one of the world's most
engaging tech sites, Slashdot.org! http://sdm.link/slashdot

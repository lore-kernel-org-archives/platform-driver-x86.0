From: Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>
Subject: [PATCH v3 3/3] platform/x86: intel_pmc_core: Decode Snoop / Non Snoop LTR
Date: Fri,  2 Nov 2018 16:04:41 +0530
Message-ID: <20181102103441.21943-1-rajneesh.bhardwaj@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, andy@infradead.org, linux-kernel@vger.kernel.org, rajneesh.bhardwaj@intel.com, srinivas.pandruvada@linux.intel.com, Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

The LTR values follow PCIE LTR encoding format and can be decoded as per
https://pcisig.com/sites/default/files/specification_documents/ECN_LatencyTolnReporting_14Aug08.pdf

This adds support to translate the raw LTR values as read from the PMC
to meaningful values in nanosecond units of time.

Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>
---
Changes in v3:
 * No more IP printing
 * Addressed convert_ltr_scale suggestions
 * Added bits.h
 * Reworked seq_printf for ltr decode but didnt use 0x%016x since
   leading zeroes made output look odd.
 
 drivers/platform/x86/intel_pmc_core.c | 63 ++++++++++++++++++++++++++-
 drivers/platform/x86/intel_pmc_core.h |  5 +++
 2 files changed, 66 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
index 11e8ecde95f0..bdcdec1af31a 100644
--- a/drivers/platform/x86/intel_pmc_core.c
+++ b/drivers/platform/x86/intel_pmc_core.c
@@ -21,6 +21,8 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/acpi.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
 #include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/io.h>
@@ -650,15 +652,72 @@ static int pmc_core_slps0_dbg_show(struct seq_file *s, void *unused)
 }
 DEFINE_SHOW_ATTRIBUTE(pmc_core_slps0_dbg);
 
+static u32 convert_ltr_scale(u32 val)
+{
+	/*
+	 * As per PCIE specification supporting document
+	 * ECN_LatencyTolnReporting_14Aug08.pdf the Latency
+	 * Tolerance Reporting data payload is encoded in a
+	 * 3 bit scale and 10 bit value fields. Values are
+	 * multiplied by the indicated scale to yield an absolute time
+	 * value, expressible in a range from 1 nanosecond to
+	 * 2^25*(2^10-1) = 34,326,183,936 nanoseconds.
+	 *
+	 * scale encoding is as follows:
+	 *
+	 * ----------------------------------------------
+	 * |scale factor	|	Multiplier (ns)	|
+	 * ----------------------------------------------
+	 * |	0		|	1		|
+	 * |	1		|	32		|
+	 * |	2		|	1024		|
+	 * |	3		|	32768		|
+	 * |	4		|	1048576		|
+	 * |	5		|	33554432	|
+	 * |	6		|	Invalid		|
+	 * |	7		|	Invalid		|
+	 * ----------------------------------------------
+	 */
+	if (val > 5) {
+		pr_warn("Invalid LTR scale factor.\n");
+		return 0;
+	}
+
+	return 1U << (5 * val);
+}
+
 static int pmc_core_ltr_show(struct seq_file *s, void *unused)
 {
 	struct pmc_dev *pmcdev = s->private;
 	const struct pmc_bit_map *map = pmcdev->map->ltr_show_sts;
+	u64 decoded_snoop_ltr, decoded_non_snoop_ltr;
+	u32 ltr_raw_data, scale, val;
+	u16 snoop_ltr, nonsnoop_ltr;
 	int index;
 
 	for (index = 0; map[index].name ; index++) {
-		seq_printf(s, "%-32s\tRAW LTR: 0x%x\n", map[index].name,
-			   pmc_core_reg_read(pmcdev, map[index].bit_mask));
+		decoded_snoop_ltr = decoded_non_snoop_ltr = 0;
+		ltr_raw_data = pmc_core_reg_read(pmcdev,
+						 map[index].bit_mask);
+		snoop_ltr = ltr_raw_data & ~MTPMC_MASK;
+		nonsnoop_ltr = (ltr_raw_data >> 0x10) & ~MTPMC_MASK;
+
+		if (FIELD_GET(LTR_REQ_NONSNOOP, ltr_raw_data)) {
+			scale = FIELD_GET(LTR_DECODED_SCALE, nonsnoop_ltr);
+			val = FIELD_GET(LTR_DECODED_VAL, nonsnoop_ltr);
+			decoded_non_snoop_ltr = val * convert_ltr_scale(scale);
+		}
+
+		if (FIELD_GET(LTR_REQ_SNOOP, ltr_raw_data)) {
+			scale = FIELD_GET(LTR_DECODED_SCALE, snoop_ltr);
+			val = FIELD_GET(LTR_DECODED_VAL, snoop_ltr);
+			decoded_snoop_ltr = val * convert_ltr_scale(scale);
+		}
+
+		seq_printf(s, "%-32s\tLTR: RAW: 0x%-16x\tNon-Snoop(ns): %-16llu\tSnoop(ns): %-16llu\n",
+			   map[index].name, ltr_raw_data,
+			   decoded_non_snoop_ltr,
+			   decoded_snoop_ltr);
 	}
 	return 0;
 }
diff --git a/drivers/platform/x86/intel_pmc_core.h b/drivers/platform/x86/intel_pmc_core.h
index 7f8181057ec8..cc49cd4c86e9 100644
--- a/drivers/platform/x86/intel_pmc_core.h
+++ b/drivers/platform/x86/intel_pmc_core.h
@@ -177,6 +177,11 @@ enum ppfear_regs {
 #define CNP_PMC_LTR_EMMC			0x1BF4
 #define CNP_PMC_LTR_UFSX2			0x1BF8
 
+#define LTR_REQ_NONSNOOP			BIT(31)
+#define LTR_REQ_SNOOP				BIT(15)
+#define LTR_DECODED_VAL				GENMASK(9, 0)
+#define LTR_DECODED_SCALE			GENMASK(12, 10)
+
 struct pmc_bit_map {
 	const char *name;
 	u32 bit_mask;
-- 
2.17.1

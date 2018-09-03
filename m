From: Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>
Subject: [PATCH 3/4] platform/x86: intel_pmc_core: Decode Snoop / Non Snoop LTR
Date: Mon,  3 Sep 2018 23:34:14 +0530
Message-ID: <20180903180415.31575-3-rajneesh.bhardwaj@linux.intel.com>
References: <20180903180415.31575-1-rajneesh.bhardwaj@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180903180415.31575-1-rajneesh.bhardwaj@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, andy@infradead.org, linux-kernel@vger.kernel.org, rajneesh.bhardwaj@intel.com, souvik.k.chakravarty@intel.com, Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

The LTR values follow PCIE LTR encoding format and can be decoded as per
https://pcisig.com/sites/default/files/specification_documents/ECN_LatencyTolnReporting_14Aug08.pdf

This adds support to translate the raw LTR values as read from the PMC
to meaningful values in nanosecond units of time.

Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>
---
 drivers/platform/x86/intel_pmc_core.c | 62 ++++++++++++++++++++++++++-
 drivers/platform/x86/intel_pmc_core.h | 14 ++++++
 2 files changed, 74 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
index c1330a03523d..ffa912a8a5f5 100644
--- a/drivers/platform/x86/intel_pmc_core.c
+++ b/drivers/platform/x86/intel_pmc_core.c
@@ -651,16 +651,74 @@ static int pmc_core_slps0_dbg_show(struct seq_file *s, void *unused)
 }
 DEFINE_SHOW_ATTRIBUTE(pmc_core_slps0_dbg);
 
+static void get_ltr_scale(u32 *val)
+{
+	/*
+	 * As per PCIE specification supprting document
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
+	if (*val > 5) {
+		*val = 0;
+		pr_warn("Invalid LTR scale factor.\n");
+	} else {
+		*val = 1U << (5 * (*val));
+	}
+}
+
 static int pmc_core_ltr_show(struct seq_file *s, void *unused)
 {
 	struct pmc_dev *pmcdev = s->private;
 	const struct pmc_bit_map *map = pmcdev->map->ltr_show_sts;
+	u64 decoded_snoop_ltr = 0, decoded_non_snoop_ltr = 0;
+	union ltr_payload ltr_data;
+	u32 scale = 0;
 	int index;
 
 	for (index = 0; map[index].name ; index++) {
-		seq_printf(s, "%-32s\tRAW LTR: 0x%x\n",
+		ltr_data.raw_data = pmc_core_reg_read(pmcdev,
+						      map[index].bit_mask);
+
+		if (ltr_data.bits.non_snoop_req) {
+			scale = ltr_data.bits.non_snoop_scale;
+			get_ltr_scale(&scale);
+			decoded_non_snoop_ltr =
+				ltr_data.bits.non_snoop_val * scale;
+		}
+
+		if (ltr_data.bits.snoop_req) {
+			scale = ltr_data.bits.snoop_scale;
+			get_ltr_scale(&scale);
+			decoded_snoop_ltr =
+				ltr_data.bits.snoop_val * scale;
+		}
+
+		seq_printf(s, "%-24s\tRaw LTR: 0x%-16x\t Non-Snoop LTR (ns): %-16llu\t Snoop LTR (ns): %-16llu\n",
 			   map[index].name,
-			   pmc_core_reg_read(pmcdev, map[index].bit_mask));
+			   ltr_data.raw_data,
+			   decoded_non_snoop_ltr,
+			   decoded_snoop_ltr);
+
+		decoded_snoop_ltr = decoded_non_snoop_ltr = 0;
 	}
 	return 0;
 }
diff --git a/drivers/platform/x86/intel_pmc_core.h b/drivers/platform/x86/intel_pmc_core.h
index 12663c58f122..bbf9a2790548 100644
--- a/drivers/platform/x86/intel_pmc_core.h
+++ b/drivers/platform/x86/intel_pmc_core.h
@@ -243,4 +243,18 @@ struct pmc_dev {
 	struct mutex lock; /* generic mutex lock for PMC Core */
 };
 
+union ltr_payload {
+	u32 raw_data;
+	struct {
+	u32 snoop_val : 10;
+	u32 snoop_scale : 3;
+	u32 snoop_res : 2;
+	u32 snoop_req : 1;
+	u32 non_snoop_val : 10;
+	u32 non_snoop_scale : 3;
+	u32 non_snoop_res : 2;
+	u32 non_snoop_req : 1;
+	} bits;
+};
+
 #endif /* PMC_CORE_H */
-- 
2.17.1

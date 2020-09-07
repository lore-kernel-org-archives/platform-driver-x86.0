From: Mike Travis <mike.travis@hpe.com>
Subject: [PATCH 09/12] x86/platform/uv: Update UV5 MMR references in UV GRU
Date: Mon, 07 Sep 2020 13:54:39 -0500
Message-ID: <20200907185431.257694099@hpe.com>
References: <20200907185430.363197758@hpe.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, Steve Wahl <steve.wahl@hpe.com>, Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@suse.de>
Cc: Dimitri Sivanich <dimitri.sivanich@hpe.com>, "H. Peter Anvin" <hpa@zytor.com>, Russ Anderson <russ.anderson@hpe.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Alexandre Chartre <alexandre.chartre@oracle.com>, Jian Cai <caij2003@gmail.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Make modifications to the GRU mappings to accommodate changes for UV5.

Signed-off-by: Mike Travis <mike.travis@hpe.com>
Reviewed-by: Dimitri Sivanich <dimitri.sivanich@hpe.com>
Reviewed-by: Steve Wahl <steve.wahl@hpe.com>
---
 arch/x86/kernel/apic/x2apic_uv_x.c |   30 ++++++++++++++++++++++++------
 1 file changed, 24 insertions(+), 6 deletions(-)

--- linux.orig/arch/x86/kernel/apic/x2apic_uv_x.c
+++ linux/arch/x86/kernel/apic/x2apic_uv_x.c
@@ -83,6 +83,9 @@ static unsigned long __init uv_early_rea
 
 static inline bool is_GRU_range(u64 start, u64 end)
 {
+	if (!gru_start_paddr)
+		return false;
+
 	return start >= gru_start_paddr && end <= gru_end_paddr;
 }
 
@@ -914,13 +917,24 @@ static __init void map_high(char *id, un
 static __init void map_gru_high(int max_pnode)
 {
 	union uvh_rh_gam_gru_overlay_config_u gru;
-	int shift = UVH_RH_GAM_GRU_OVERLAY_CONFIG_BASE_SHFT;
-	unsigned long mask = UVH_RH_GAM_GRU_OVERLAY_CONFIG_BASE_MASK;
-	unsigned long base;
+	unsigned long mask, base;
+	int shift;
+
+	if (UVH_RH_GAM_GRU_OVERLAY_CONFIG) {
+		gru.v = uv_read_local_mmr(UVH_RH_GAM_GRU_OVERLAY_CONFIG);
+		shift = UVH_RH_GAM_GRU_OVERLAY_CONFIG_BASE_SHFT;
+		mask = UVH_RH_GAM_GRU_OVERLAY_CONFIG_BASE_MASK;
+	} else if (UVH_RH10_GAM_GRU_OVERLAY_CONFIG) {
+		gru.v = uv_read_local_mmr(UVH_RH10_GAM_GRU_OVERLAY_CONFIG);
+		shift = UVH_RH10_GAM_GRU_OVERLAY_CONFIG_BASE_SHFT;
+		mask = UVH_RH10_GAM_GRU_OVERLAY_CONFIG_BASE_MASK;
+	} else {
+		pr_err("UV: GRU unavailable (no MMR)\n");
+		return;
+	}
 
-	gru.v = uv_read_local_mmr(UVH_RH_GAM_GRU_OVERLAY_CONFIG);
 	if (!gru.s.enable) {
-		pr_info("UV: GRU disabled\n");
+		pr_info("UV: GRU disabled (by BIOS)\n");
 		return;
 	}
 
@@ -1289,7 +1303,11 @@ static void __init uv_init_hub_info(stru
 	/* Show system specific info: */
 	pr_info("UV: N:%d M:%d m_shift:%d n_lshift:%d\n", hi->n_val, hi->m_val, hi->m_shift, hi->n_lshift);
 	pr_info("UV: gpa_mask/shift:0x%lx/%d pnode_mask:0x%x apic_pns:%d\n", hi->gpa_mask, hi->gpa_shift, hi->pnode_mask, hi->apic_pnode_shift);
-	pr_info("UV: mmr_base/shift:0x%lx/%ld gru_base/shift:0x%lx/%ld\n", hi->global_mmr_base, hi->global_mmr_shift, hi->global_gru_base, hi->global_gru_shift);
+	pr_info("UV: mmr_base/shift:0x%lx/%ld\n", hi->global_mmr_base, hi->global_mmr_shift);
+	if (hi->global_gru_base)
+		pr_info("UV: gru_base/shift:0x%lx/%ld\n",
+			hi->global_gru_base, hi->global_gru_shift);
+
 	pr_info("UV: gnode_upper:0x%lx gnode_extra:0x%x\n", hi->gnode_upper, hi->gnode_extra);
 }
 

From: Mike Travis <mike.travis@hpe.com>
Subject: [PATCH 08/12] x86/platform/uv: Adjust GAM MMR references affected by UV5 updates
Date: Mon, 07 Sep 2020 13:54:38 -0500
Message-ID: <20200907185431.162991006@hpe.com>
References: <20200907185430.363197758@hpe.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, Steve Wahl <steve.wahl@hpe.com>, Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@suse.de>
Cc: Dimitri Sivanich <dimitri.sivanich@hpe.com>, "H. Peter Anvin" <hpa@zytor.com>, Russ Anderson <russ.anderson@hpe.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Alexandre Chartre <alexandre.chartre@oracle.com>, Jian Cai <caij2003@gmail.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Make modifications to the GAM MMR mappings to accommodate changes for UV5.

Signed-off-by: Mike Travis <mike.travis@hpe.com>
Reviewed-by: Dimitri Sivanich <dimitri.sivanich@hpe.com>
Reviewed-by: Steve Wahl <steve.wahl@hpe.com>
---
 arch/x86/kernel/apic/x2apic_uv_x.c |   30 +++++++++++++++++++++++++-----
 1 file changed, 25 insertions(+), 5 deletions(-)

--- linux.orig/arch/x86/kernel/apic/x2apic_uv_x.c
+++ linux/arch/x86/kernel/apic/x2apic_uv_x.c
@@ -932,12 +932,32 @@ static __init void map_gru_high(int max_
 
 static __init void map_mmr_high(int max_pnode)
 {
-	union uvh_rh_gam_mmr_overlay_config_u mmr;
-	int shift = UVH_RH_GAM_MMR_OVERLAY_CONFIG_BASE_SHFT;
+	unsigned long base;
+	int shift;
+	bool enable;
 
-	mmr.v = uv_read_local_mmr(UVH_RH_GAM_MMR_OVERLAY_CONFIG);
-	if (mmr.s.enable)
-		map_high("MMR", mmr.s.base, shift, shift, max_pnode, map_uc);
+	if (UVH_RH10_GAM_MMR_OVERLAY_CONFIG) {
+		union uvh_rh10_gam_mmr_overlay_config_u mmr;
+
+		mmr.v = uv_read_local_mmr(UVH_RH10_GAM_MMR_OVERLAY_CONFIG);
+		enable = mmr.s.enable;
+		base = mmr.s.base;
+		shift = UVH_RH10_GAM_MMR_OVERLAY_CONFIG_BASE_SHFT;
+	} else if (UVH_RH_GAM_MMR_OVERLAY_CONFIG) {
+		union uvh_rh_gam_mmr_overlay_config_u mmr;
+
+		mmr.v = uv_read_local_mmr(UVH_RH_GAM_MMR_OVERLAY_CONFIG);
+		enable = mmr.s.enable;
+		base = mmr.s.base;
+		shift = UVH_RH_GAM_MMR_OVERLAY_CONFIG_BASE_SHFT;
+	} else {
+		pr_err("UV:%s:RH_GAM_MMR_OVERLAY_CONFIG MMR undefined?\n",
+			__func__);
+		return;
+	}
+
+	if (enable)
+		map_high("MMR", base, shift, shift, max_pnode, map_uc);
 	else
 		pr_info("UV: MMR disabled\n");
 }

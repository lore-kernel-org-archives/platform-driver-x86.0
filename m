From: Mike Travis <mike.travis@hpe.com>
Subject: [PATCH 11/12] x86/platform/uv: Update UV5 TSC Checking
Date: Mon, 07 Sep 2020 13:54:41 -0500
Message-ID: <20200907185431.445769235@hpe.com>
References: <20200907185430.363197758@hpe.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, Steve Wahl <steve.wahl@hpe.com>, Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@suse.de>
Cc: Dimitri Sivanich <dimitri.sivanich@hpe.com>, "H. Peter Anvin" <hpa@zytor.com>, Russ Anderson <russ.anderson@hpe.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Alexandre Chartre <alexandre.chartre@oracle.com>, Jian Cai <caij2003@gmail.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Update check of BIOS TSC sync status to include both possible "invalid"
states provided by newer UV5 BIOS.

Signed-off-by: Mike Travis <mike.travis@hpe.com>
Reviewed-by: Steve Wahl <steve.wahl@hpe.com>
---
 arch/x86/include/asm/uv/uv_hub.h   |    2 +-
 arch/x86/kernel/apic/x2apic_uv_x.c |   24 ++++++++++--------------
 2 files changed, 11 insertions(+), 15 deletions(-)

--- linux.orig/arch/x86/include/asm/uv/uv_hub.h
+++ linux/arch/x86/include/asm/uv/uv_hub.h
@@ -727,7 +727,7 @@ extern void uv_nmi_setup_hubless(void);
 #define UVH_TSC_SYNC_SHIFT_UV2K	16	/* UV2/3k have different bits */
 #define UVH_TSC_SYNC_MASK	3	/* 0011 */
 #define UVH_TSC_SYNC_VALID	3	/* 0011 */
-#define UVH_TSC_SYNC_INVALID	2	/* 0010 */
+#define UVH_TSC_SYNC_UNKNOWN	0	/* 0000 */
 
 /* BMC sets a bit this MMR non-zero before sending an NMI */
 #define UVH_NMI_MMR		UVH_BIOS_KERNEL_MMR
--- linux.orig/arch/x86/kernel/apic/x2apic_uv_x.c
+++ linux/arch/x86/kernel/apic/x2apic_uv_x.c
@@ -200,36 +200,32 @@ static void __init uv_tsc_check_sync(voi
 	int sync_state;
 	int mmr_shift;
 	char *state;
-	bool valid;
 
-	/* Accommodate different UV arch BIOSes */
+	/* Different returns from different UV BIOS versions */
 	mmr = uv_early_read_mmr(UVH_TSC_SYNC_MMR);
 	mmr_shift =
 		is_uv2_hub() ? UVH_TSC_SYNC_SHIFT_UV2K : UVH_TSC_SYNC_SHIFT;
 	sync_state = (mmr >> mmr_shift) & UVH_TSC_SYNC_MASK;
 
+	/* Check if TSC is valid for all sockets */
 	switch (sync_state) {
 	case UVH_TSC_SYNC_VALID:
 		state = "in sync";
-		valid = true;
+		mark_tsc_async_resets("UV BIOS");
 		break;
 
-	case UVH_TSC_SYNC_INVALID:
-		state = "unstable";
-		valid = false;
+	/* If BIOS state unknown, don't do anything */
+	case UVH_TSC_SYNC_UNKNOWN:
+		state = "unknown";
 		break;
+
+	/* Otherwise, BIOS indicates problem with TSC */
 	default:
-		state = "unknown: assuming valid";
-		valid = true;
+		state = "unstable";
+		mark_tsc_unstable("UV BIOS");
 		break;
 	}
 	pr_info("UV: TSC sync state from BIOS:0%d(%s)\n", sync_state, state);
-
-	/* Mark flag that says TSC != 0 is valid for socket 0 */
-	if (valid)
-		mark_tsc_async_resets("UV BIOS");
-	else
-		mark_tsc_unstable("UV BIOS");
 }
 
 /* Selector for (4|4A|5) structs */

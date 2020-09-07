From: Mike Travis <mike.travis@hpe.com>
Subject: [PATCH 10/12] x86/platform/uv: Update Node Present Counting
Date: Mon, 07 Sep 2020 13:54:40 -0500
Message-ID: <20200907185431.351814173@hpe.com>
References: <20200907185430.363197758@hpe.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, Steve Wahl <steve.wahl@hpe.com>, Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@suse.de>
Cc: Dimitri Sivanich <dimitri.sivanich@hpe.com>, "H. Peter Anvin" <hpa@zytor.com>, Russ Anderson <russ.anderson@hpe.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Alexandre Chartre <alexandre.chartre@oracle.com>, Jian Cai <caij2003@gmail.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

The changes in the UV5 arch shrunk the NODE PRESENT table to just 2x64
entries (128 total) so are in to 64 bit MMRs instead of a depth of 64
bits in an array.  Adjust references when counting up the nodes present.

Signed-off-by: Mike Travis <mike.travis@hpe.com>
Reviewed-by: Dimitri Sivanich <dimitri.sivanich@hpe.com>
Reviewed-by: Steve Wahl <steve.wahl@hpe.com>
---
 arch/x86/kernel/apic/x2apic_uv_x.c |   26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

--- linux.orig/arch/x86/kernel/apic/x2apic_uv_x.c
+++ linux/arch/x86/kernel/apic/x2apic_uv_x.c
@@ -1437,20 +1437,32 @@ static int __init decode_uv_systab(void)
 /* Set up physical blade translations from UVH_NODE_PRESENT_TABLE */
 static __init void boot_init_possible_blades(struct uv_hub_info_s *hub_info)
 {
+	unsigned long np;
 	int i, uv_pb = 0;
 
-	pr_info("UV: NODE_PRESENT_DEPTH = %d\n", UVH_NODE_PRESENT_TABLE_DEPTH);
-	for (i = 0; i < UVH_NODE_PRESENT_TABLE_DEPTH; i++) {
-		unsigned long np;
-
-		np = uv_read_local_mmr(UVH_NODE_PRESENT_TABLE + i * 8);
-		if (np)
+	if (UVH_NODE_PRESENT_TABLE) {
+		pr_info("UV: NODE_PRESENT_DEPTH = %d\n",
+			UVH_NODE_PRESENT_TABLE_DEPTH);
+		for (i = 0; i < UVH_NODE_PRESENT_TABLE_DEPTH; i++) {
+			np = uv_read_local_mmr(UVH_NODE_PRESENT_TABLE + i * 8);
 			pr_info("UV: NODE_PRESENT(%d) = 0x%016lx\n", i, np);
-
+			uv_pb += hweight64(np);
+		}
+	}
+	if (UVH_NODE_PRESENT_0) {
+		np = uv_read_local_mmr(UVH_NODE_PRESENT_0);
+		pr_info("UV: NODE_PRESENT_0 = 0x%016lx\n", np);
+		uv_pb += hweight64(np);
+	}
+	if (UVH_NODE_PRESENT_1) {
+		np = uv_read_local_mmr(UVH_NODE_PRESENT_1);
+		pr_info("UV: NODE_PRESENT_1 = 0x%016lx\n", np);
 		uv_pb += hweight64(np);
 	}
 	if (uv_possible_blades != uv_pb)
 		uv_possible_blades = uv_pb;
+
+	pr_info("UV: number nodes/possible blades %d\n", uv_pb);
 }
 
 static void __init build_socket_tables(void)

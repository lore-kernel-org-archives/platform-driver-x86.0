From: Kangjie Lu <kjlu@umn.edu>
Subject: [PATCH] platform: uv: fix missing checks for kcalloc
Date: Sun, 24 Mar 2019 17:57:53 -0500
Message-ID: <20190324225755.1702-1-kjlu@umn.edu>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: kjlu@umn.edu
Cc: pakki001@umn.edu, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Mike Travis <mike.travis@hpe.com>, Kees Cook <keescook@chromium.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Varsha Rao <rvarsha016@gmail.com>, Nicolai Stange <nstange@suse.de>, Andrew Banman <abanman@hpe.com>, Colin Ian King <colin.king@canonical.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

In case kcalloc fails, the patch return an error to avoid
potential NULL pointer dereference.

Signed-off-by: Kangjie Lu <kjlu@umn.edu>
---
 arch/x86/platform/uv/tlb_uv.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/x86/platform/uv/tlb_uv.c b/arch/x86/platform/uv/tlb_uv.c
index 2c53b0f19329..1ac777f14846 100644
--- a/arch/x86/platform/uv/tlb_uv.c
+++ b/arch/x86/platform/uv/tlb_uv.c
@@ -2140,7 +2140,13 @@ static int __init init_per_cpu(int nuvhubs, int base_part_pnode)
 		timeout_us = calculate_destination_timeout();
 
 	uvhub_descs = kcalloc(nuvhubs, sizeof(struct uvhub_desc), GFP_KERNEL);
+	if (!uvhub_descs)
+		return 1;
 	uvhub_mask = kzalloc((nuvhubs+7)/8, GFP_KERNEL);
+	if (!uvhub_mask) {
+		kfree(uvhub_descs);
+		return 1;
+	}
 
 	if (get_cpu_topology(base_part_pnode, uvhub_descs, uvhub_mask))
 		goto fail;
-- 
2.17.1

From: Aditya Pakki <pakki001@umn.edu>
Subject: [PATCH] x86: uv: Fix potential NULL pointer dereference of kmalloc_node
Date: Sat,  2 Mar 2019 15:09:04 -0600
Message-ID: <20190302210905.13032-1-pakki001@umn.edu>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: pakki001@umn.edu
Cc: kjlu@umn.edu, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Nicolai Stange <nstange@suse.de>, Kees Cook <keescook@chromium.org>, Andrew Banman <abanman@hpe.com>, Mike Travis <mike.travis@hpe.com>, Colin Ian King <colin.king@canonical.com>, Varsha Rao <rvarsha016@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

kmalloc_node might fail to allocate memory for thp field. This fix
attempts to avoid a potential NULL pointer dereference.

Signed-off-by: Aditya Pakki <pakki001@umn.edu>
---
 arch/x86/platform/uv/tlb_uv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/x86/platform/uv/tlb_uv.c b/arch/x86/platform/uv/tlb_uv.c
index a4130b84d1ff..5a6d51e30a36 100644
--- a/arch/x86/platform/uv/tlb_uv.c
+++ b/arch/x86/platform/uv/tlb_uv.c
@@ -2011,6 +2011,9 @@ static void make_per_cpu_thp(struct bau_control *smaster)
 	size_t hpsz = sizeof(struct hub_and_pnode) * num_possible_cpus();
 
 	smaster->thp = kmalloc_node(hpsz, GFP_KERNEL, smaster->osnode);
+	if (!smaster->thp)
+		return;
+
 	memset(smaster->thp, 0, hpsz);
 	for_each_present_cpu(cpu) {
 		smaster->thp[cpu].pnode = uv_cpu_hub_info(cpu)->pnode;
-- 
2.17.1

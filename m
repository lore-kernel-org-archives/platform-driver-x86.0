From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 5.1 310/405] x86/platform/uv: Fix missing checks of kcalloc() return values
Date: Wed, 29 May 2019 20:05:08 -0700
Message-ID: <20190530030556.486305232@linuxfoundation.org>
References: <20190530030540.291644921@linuxfoundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190530030540.291644921@linuxfoundation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, Kangjie Lu <kjlu@umn.edu>, Borislav Petkov <bp@suse.de>, Andrew Banman <abanman@hpe.com>, Andy Shevchenko <andy@infradead.org>, Colin Ian King <colin.king@canonical.com>, Darren Hart <dvhart@infradead.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Kees Cook <keescook@chromium.org>, Mike Travis <mike.travis@hpe.com>, Nicolai Stange <nstange@suse.de>, pakki001@umn.edu, platform-driver-x86@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Varsha Rao <rvarsha016@gmail.com>, x86-ml <x86@kernel.org>, Sasha Levin <sashal@kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

[ Upstream commit 766460852cfaeca4042e5f3aeb9616b3689147bc ]

Handle potential errors returned from kcalloc().

 [ bp: rewrite commit message. ]

Signed-off-by: Kangjie Lu <kjlu@umn.edu>
Signed-off-by: Borislav Petkov <bp@suse.de>
Cc: Andrew Banman <abanman@hpe.com>
Cc: Andy Shevchenko <andy@infradead.org>
Cc: Colin Ian King <colin.king@canonical.com>
Cc: Darren Hart <dvhart@infradead.org>
Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Mike Travis <mike.travis@hpe.com>
Cc: Nicolai Stange <nstange@suse.de>
Cc: pakki001@umn.edu
Cc: platform-driver-x86@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Varsha Rao <rvarsha016@gmail.com>
Cc: x86-ml <x86@kernel.org>
Link: https://lkml.kernel.org/r/20190325202924.4624-1-kjlu@umn.edu
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/x86/platform/uv/tlb_uv.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/x86/platform/uv/tlb_uv.c b/arch/x86/platform/uv/tlb_uv.c
index 2c53b0f19329a..1297e185b8c8d 100644
--- a/arch/x86/platform/uv/tlb_uv.c
+++ b/arch/x86/platform/uv/tlb_uv.c
@@ -2133,14 +2133,19 @@ static int __init summarize_uvhub_sockets(int nuvhubs,
  */
 static int __init init_per_cpu(int nuvhubs, int base_part_pnode)
 {
-	unsigned char *uvhub_mask;
 	struct uvhub_desc *uvhub_descs;
+	unsigned char *uvhub_mask = NULL;
 
 	if (is_uv3_hub() || is_uv2_hub() || is_uv1_hub())
 		timeout_us = calculate_destination_timeout();
 
 	uvhub_descs = kcalloc(nuvhubs, sizeof(struct uvhub_desc), GFP_KERNEL);
+	if (!uvhub_descs)
+		goto fail;
+
 	uvhub_mask = kzalloc((nuvhubs+7)/8, GFP_KERNEL);
+	if (!uvhub_mask)
+		goto fail;
 
 	if (get_cpu_topology(base_part_pnode, uvhub_descs, uvhub_mask))
 		goto fail;
-- 
2.20.1

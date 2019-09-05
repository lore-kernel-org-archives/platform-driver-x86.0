From: Austin Kim <austindh.kim@gmail.com>
Subject: [PATCH] x86/platform/uv: move kmalloc() NULL check routine
Date: Fri, 6 Sep 2019 08:29:51 +0900
Message-ID: <20190905232951.GA28779@LGEARND20B15>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de
Cc: dvhart@infradead.org, andy@infradead.org, hpa@zytor.com, x86@kernel.org, gregkh@linuxfoundation.org, allison@lohutok.net, armijn@tjaldur.nl, kjlu@umn.edu, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

The result of kmalloc should have been checked ahead of below statement:
	pqp = (struct bau_pq_entry *)vp;

Move BUG_ON(!vp) before above statement.

Signed-off-by: Austin Kim <austindh.kim@gmail.com>
---
 arch/x86/platform/uv/tlb_uv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/platform/uv/tlb_uv.c b/arch/x86/platform/uv/tlb_uv.c
index 20c389a..5f0a96bf 100644
--- a/arch/x86/platform/uv/tlb_uv.c
+++ b/arch/x86/platform/uv/tlb_uv.c
@@ -1804,9 +1804,9 @@ static void pq_init(int node, int pnode)
 
 	plsize = (DEST_Q_SIZE + 1) * sizeof(struct bau_pq_entry);
 	vp = kmalloc_node(plsize, GFP_KERNEL, node);
-	pqp = (struct bau_pq_entry *)vp;
-	BUG_ON(!pqp);
+	BUG_ON(!vp);
 
+	pqp = (struct bau_pq_entry *)vp;
 	cp = (char *)pqp + 31;
 	pqp = (struct bau_pq_entry *)(((unsigned long)cp >> 5) << 5);
 
-- 
2.6.2

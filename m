From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH] platform/x86: dell_rbu: fix lock imbalance in img_update_realloc
Date: Mon, 11 Feb 2019 14:09:40 +0100
Message-ID: <20190211130940.28206-1-hch@lst.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: stuart.w.hayes@gmail.com, dvhart@infradead.org, andy@infradead.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>
List-Id: platform-driver-x86.vger.kernel.org

We need to ensure rbu_data.lock is always held on return.

Fixes: 289790a3ea94 ("platform/x86: dell_rbu: stop abusing the DMA API")
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/platform/x86/dell_rbu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell_rbu.c b/drivers/platform/x86/dell_rbu.c
index 8104ca0c44ca..031c68903583 100644
--- a/drivers/platform/x86/dell_rbu.c
+++ b/drivers/platform/x86/dell_rbu.c
@@ -436,6 +436,7 @@ static int img_update_realloc(unsigned long size)
 	ordernum = get_order(size);
 	image_update_buffer =
 		(unsigned char *)__get_free_pages(GFP_DMA32, ordernum);
+	spin_lock(&rbu_data.lock);
 	if (!image_update_buffer) {
 		pr_debug("Not enough memory for image update:"
 			"size = %ld\n", size);
@@ -446,7 +447,6 @@ static int img_update_realloc(unsigned long size)
 	if (WARN_ON_ONCE(img_buf_phys_addr > BIOS_SCAN_LIMIT))
 		return -EINVAL; /* can't happen per definition */
 
-	spin_lock(&rbu_data.lock);
 	rbu_data.image_update_buffer = image_update_buffer;
 	rbu_data.image_update_buffer_size = size;
 	rbu_data.bios_image_size = rbu_data.image_update_buffer_size;
-- 
2.20.1

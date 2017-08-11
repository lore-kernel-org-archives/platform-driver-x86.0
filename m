From: Bhumika Goyal <bhumirks@gmail.com>
Subject: [PATCH] platform/x86: intel_mid_powerbtn: make mid_pb_ddata
Date: Fri, 11 Aug 2017 19:50:00 +0530
Message-ID: <1502461200-11013-1-git-send-email-bhumirks@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: julia.lawall@lip6.fr, dvhart@infradead.org, andy@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Bhumika Goyal <bhumirks@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Make these const as they are only used during a copy operation.
Done using Coccinelle.

Signed-off-by: Bhumika Goyal <bhumirks@gmail.com>
---
 drivers/platform/x86/intel_mid_powerbtn.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel_mid_powerbtn.c b/drivers/platform/x86/intel_mid_powerbtn.c
index 871cfa6..2916672 100644
--- a/drivers/platform/x86/intel_mid_powerbtn.c
+++ b/drivers/platform/x86/intel_mid_powerbtn.c
@@ -108,13 +108,13 @@ static irqreturn_t mid_pb_isr(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static struct mid_pb_ddata mfld_ddata = {
+static const struct mid_pb_ddata mfld_ddata = {
 	.mirqlvl1_addr	= INTEL_MSIC_IRQLVL1MSK,
 	.pbstat_addr	= INTEL_MSIC_PBSTATUS,
 	.pbstat_mask	= MSIC_PB_LEVEL,
 };
 
-static struct mid_pb_ddata mrfld_ddata = {
+static const struct mid_pb_ddata mrfld_ddata = {
 	.mirqlvl1_addr	= BCOVE_IRQLVL1MSK,
 	.pbstat_addr	= BCOVE_PBSTATUS,
 	.pbstat_mask	= BCOVE_PB_LEVEL,
-- 
1.9.1

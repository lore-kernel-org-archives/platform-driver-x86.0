From: Bhumika Goyal <bhumirks@gmail.com>
Subject: [PATCH] platform/x86: intel_scu_ipc: make intel_scu_ipc_pdata_t const
Date: Fri, 11 Aug 2017 18:49:11 +0530
Message-ID: <1502457551-29177-1-git-send-email-bhumirks@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: julia.lawall@lip6.fr, dvhart@infradead.org, andy@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Bhumika Goyal <bhumirks@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Make these const as they are only used during a copy operation.

Done using Coccinelle.

Signed-off-by: Bhumika Goyal <bhumirks@gmail.com>
---
 drivers/platform/x86/intel_scu_ipc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/intel_scu_ipc.c b/drivers/platform/x86/intel_scu_ipc.c
index f7cf981..2c85f75 100644
--- a/drivers/platform/x86/intel_scu_ipc.c
+++ b/drivers/platform/x86/intel_scu_ipc.c
@@ -72,20 +72,20 @@ struct intel_scu_ipc_pdata_t {
 	u8 irq_mode;
 };
 
-static struct intel_scu_ipc_pdata_t intel_scu_ipc_lincroft_pdata = {
+static const struct intel_scu_ipc_pdata_t intel_scu_ipc_lincroft_pdata = {
 	.i2c_base = 0xff12b000,
 	.i2c_len = 0x10,
 	.irq_mode = 0,
 };
 
 /* Penwell and Cloverview */
-static struct intel_scu_ipc_pdata_t intel_scu_ipc_penwell_pdata = {
+static const struct intel_scu_ipc_pdata_t intel_scu_ipc_penwell_pdata = {
 	.i2c_base = 0xff12b000,
 	.i2c_len = 0x10,
 	.irq_mode = 1,
 };
 
-static struct intel_scu_ipc_pdata_t intel_scu_ipc_tangier_pdata = {
+static const struct intel_scu_ipc_pdata_t intel_scu_ipc_tangier_pdata = {
 	.i2c_base  = 0xff00d000,
 	.i2c_len = 0x10,
 	.irq_mode = 0,
-- 
1.9.1

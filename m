From: Srikanth Krishnakar <skrishnakar@gmail.com>
Subject: [PATCH] platform/x86: pmc_atom: Add Siemens SIMATIC IPC2x7E to critclk_systems DMI table
Date: Thu, 19 Sep 2019 13:15:56 +0530
Message-ID: <20190919074556.25691-1-Srikanth_Krishnakar@mentor.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, dvhart@infradead.org, andy@infradead.org
Cc: Cedric_Hombourger@mentor.com, Srikanth_Krishnakar@mentor.com, jan.kiszka@siemens.com
List-Id: platform-driver-x86.vger.kernel.org

The SIMATIC IPC227E and IPC277E uses the PMC clock for on-board components
and gets stuck during boot if the clock is disabled. Therefore, add this
device to the critical systems list.

The Board revision does vary in some instances and hence use PRODUCT_NAME
to allow the boards to boot with identical names.

Tested on SIMATIC IPC227E and IPC277E.

Fixes: 648e921888ad ("clk: x86: Stop marking clocks as CLK_IS_CRITICAL")
CC: Jan Kiszka <jan.kiszka@siemens.com>
CC: Cedric Hombourger <Cedric_Hombourger@mentor.com>
Signed-off-by: Srikanth Krishnakar <Srikanth_Krishnakar@mentor.com>
---
 drivers/platform/x86/pmc_atom.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/pmc_atom.c b/drivers/platform/x86/pmc_atom.c
index 9aca5e7ce6d0..1e48c2ec684e 100644
--- a/drivers/platform/x86/pmc_atom.c
+++ b/drivers/platform/x86/pmc_atom.c
@@ -419,7 +419,14 @@ static const struct dmi_system_id critclk_systems[] = {
 		.ident = "SIMATIC IPC227E",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "SIEMENS AG"),
-			DMI_MATCH(DMI_PRODUCT_VERSION, "6ES7647-8B"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "SIMATIC IPC227E"),
+		},
+	},
+	{
+		.ident = "SIMATIC IPC277E",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "SIEMENS AG"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "SIMATIC IPC277E"),
 		},
 	},
 	{ /*sentinel*/ }
-- 
2.17.1

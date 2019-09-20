From: Srikanth Krishnakar <skrishnakar@gmail.com>
Subject: [PATCH v2] platform/x86: pmc_atom: Add Siemens SIMATIC IPC277E to critclk_systems DMI table
Date: Fri, 20 Sep 2019 15:01:56 +0530
Message-ID: <20190920093156.18885-1-Srikanth_Krishnakar@mentor.com>
References: <972f063e-e1da-7248-90ab-e9b12481641d@siemens.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <972f063e-e1da-7248-90ab-e9b12481641d@siemens.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, dvhart@infradead.org, andy@infradead.org, jan.kiszka@siemens.com
Cc: Cedric_Hombourger@mentor.com, volker.edenhofer@siemens.com, Srikanth_Krishnakar@mentor.com
List-Id: platform-driver-x86.vger.kernel.org

The SIMATIC IPC277E uses the PMC clock for on-board components
and gets stuck during boot if the clock is disabled. Therefore,
add this device to the critical systems list.

Tested on SIMATIC IPC277E.

Fixes: 648e921888ad ("clk: x86: Stop marking clocks as CLK_IS_CRITICAL")
Reviewed-by: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Cedric Hombourger <Cedric_Hombourger@mentor.com>
Signed-off-by: Srikanth Krishnakar <Srikanth_Krishnakar@mentor.com>
---

Suggested for linux-stable v4.14.x and above.
Depends on ad0d315b4d4e ("platform/x86: pmc_atom: Add Siemens SIMATIC IPC227E to critclk_systems DMI table")

 drivers/platform/x86/pmc_atom.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/pmc_atom.c b/drivers/platform/x86/pmc_atom.c
index 9aca5e7ce6d0..07d1b911e72f 100644
--- a/drivers/platform/x86/pmc_atom.c
+++ b/drivers/platform/x86/pmc_atom.c
@@ -422,6 +422,13 @@ static const struct dmi_system_id critclk_systems[] = {
 			DMI_MATCH(DMI_PRODUCT_VERSION, "6ES7647-8B"),
 		},
 	},
+	{
+		.ident = "SIMATIC IPC277E",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "SIEMENS AG"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "6AV7882-0"),
+		},
+	},
 	{ /*sentinel*/ }
 };
 
-- 
2.17.1

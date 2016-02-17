From: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
Subject: [PATCH] intel_telemetry_pltdrv: Change verbosity control bits
Date: Wed, 17 Feb 2016 12:05:22 +0530
Message-ID: <1455690922-22936-1-git-send-email-souvik.k.chakravarty@intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:27224 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756521AbcBQG3R (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 17 Feb 2016 01:29:17 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, linux-kernel@vger.kernel.org, Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>

Due to a recent fix in the firmware, the Punit verbosity control bits
now adhere to the correct pattern. Hence remove the workaround and
do a read-mofiy-write of the register.

Signed-off-by: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
---
 drivers/platform/x86/intel_telemetry_pltdrv.c |   13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel_telemetry_pltdrv.c b/drivers/platform/x86/intel_telemetry_pltdrv.c
index f97019b..397119f 100644
--- a/drivers/platform/x86/intel_telemetry_pltdrv.c
+++ b/drivers/platform/x86/intel_telemetry_pltdrv.c
@@ -1030,8 +1030,19 @@ static int telemetry_plt_set_trace_verbosity(enum telemetry_unit telem_unit,
 	switch (telem_unit) {
 	case TELEM_PSS:
 		ret = intel_punit_ipc_command(
+				IPC_PUNIT_BIOS_READ_TELE_TRACE_CTRL,
+				0, 0, NULL, &temp);
+		if (ret) {
+			pr_err("PSS TRACE_CTRL Read Failed\n");
+			goto out;
+		}
+
+		TELEM_CLEAR_VERBOSITY_BITS(temp);
+		TELEM_SET_VERBOSITY_BITS(temp, verbosity);
+
+		ret = intel_punit_ipc_command(
 				IPC_PUNIT_BIOS_WRITE_TELE_TRACE_CTRL,
-				0, 0, &verbosity, NULL);
+				0, 0, &temp, NULL);
 		if (ret) {
 			pr_err("PSS TRACE_CTRL Verbosity Set Failed\n");
 			goto out;
-- 
1.7.9.5

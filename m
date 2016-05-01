From: Julia Lawall <Julia.Lawall@lip6.fr>
Subject: [PATCH] intel_telemetry: constify telemetry_core_ops structures
Date: Sun,  1 May 2016 22:11:59 +0200
Message-ID: <1462133519-17989-1-git-send-email-Julia.Lawall@lip6.fr>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:51354 "EHLO
	mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752150AbcEAU1U (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 1 May 2016 16:27:20 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>, Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org

The telemetry_core_ops structures are never modified, so declare them as const.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 arch/x86/include/asm/intel_telemetry.h        |    2 +-
 drivers/platform/x86/intel_telemetry_core.c   |    6 +++---
 drivers/platform/x86/intel_telemetry_pltdrv.c |    2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/intel_telemetry_core.c b/drivers/platform/x86/intel_telemetry_core.c
index a695a43..0d4c380 100644
--- a/drivers/platform/x86/intel_telemetry_core.c
+++ b/drivers/platform/x86/intel_telemetry_core.c
@@ -25,7 +25,7 @@
 
 struct telemetry_core_config {
 	struct telemetry_plt_config *plt_config;
-	struct telemetry_core_ops *telem_ops;
+	const struct telemetry_core_ops *telem_ops;
 };
 
 static struct telemetry_core_config telm_core_conf;
@@ -95,7 +95,7 @@ static int telemetry_def_reset_events(void)
 	return 0;
 }
 
-static struct telemetry_core_ops telm_defpltops = {
+static const struct telemetry_core_ops telm_defpltops = {
 	.set_sampling_period = telemetry_def_set_sampling_period,
 	.get_sampling_period = telemetry_def_get_sampling_period,
 	.get_trace_verbosity = telemetry_def_get_trace_verbosity,
@@ -332,7 +332,7 @@ EXPORT_SYMBOL_GPL(telemetry_set_trace_verbosity);
  *
  * Return: 0 success, < 0 for failure
  */
-int telemetry_set_pltdata(struct telemetry_core_ops *ops,
+int telemetry_set_pltdata(const struct telemetry_core_ops *ops,
 			  struct telemetry_plt_config *pltconfig)
 {
 	if (ops)
diff --git a/drivers/platform/x86/intel_telemetry_pltdrv.c b/drivers/platform/x86/intel_telemetry_pltdrv.c
index 781bd10..09c84a2 100644
--- a/drivers/platform/x86/intel_telemetry_pltdrv.c
+++ b/drivers/platform/x86/intel_telemetry_pltdrv.c
@@ -1081,7 +1081,7 @@ out:
 	return ret;
 }
 
-static struct telemetry_core_ops telm_pltops = {
+static const struct telemetry_core_ops telm_pltops = {
 	.get_trace_verbosity = telemetry_plt_get_trace_verbosity,
 	.set_trace_verbosity = telemetry_plt_set_trace_verbosity,
 	.set_sampling_period = telemetry_plt_set_sampling_period,
diff --git a/arch/x86/include/asm/intel_telemetry.h b/arch/x86/include/asm/intel_telemetry.h
index ed65fe7..85029b5 100644
--- a/arch/x86/include/asm/intel_telemetry.h
+++ b/arch/x86/include/asm/intel_telemetry.h
@@ -99,7 +99,7 @@ struct telemetry_core_ops {
 	int (*reset_events)(void);
 };
 
-int telemetry_set_pltdata(struct telemetry_core_ops *ops,
+int telemetry_set_pltdata(const struct telemetry_core_ops *ops,
 			  struct telemetry_plt_config *pltconfig);
 
 int telemetry_clear_pltdata(void);

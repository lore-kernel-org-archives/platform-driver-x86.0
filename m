From: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Subject: [PATCH 2/3] platform/x86: intel_telemetry: Fix typos
Date: Tue, 10 Oct 2017 15:35:18 +0530
Message-ID: <1507629919-31299-2-git-send-email-rajneesh.bhardwaj@intel.com>
References: <1507629919-31299-1-git-send-email-rajneesh.bhardwaj@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1507629919-31299-1-git-send-email-rajneesh.bhardwaj@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, andy@infradead.org, linux-kernel@vger.kernel.org, souvik.k.chakravarty@intel.com, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Telemetry word is misspelled several times in this file as Telemtry. This
fixes the spelling mistake and folds in another minor typo.

Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
---
 drivers/platform/x86/intel_telemetry_pltdrv.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/intel_telemetry_pltdrv.c b/drivers/platform/x86/intel_telemetry_pltdrv.c
index 136507a0d391..3daf92e1282f 100644
--- a/drivers/platform/x86/intel_telemetry_pltdrv.c
+++ b/drivers/platform/x86/intel_telemetry_pltdrv.c
@@ -256,7 +256,7 @@ static int telemetry_check_evtid(enum telemetry_unit telem_unit,
 		break;
 
 	default:
-		pr_err("Unknown Telemetry action Specified %d\n", action);
+		pr_err("Unknown Telemetry action specified %d\n", action);
 		return -EINVAL;
 	}
 
@@ -659,7 +659,7 @@ static int telemetry_setup(struct platform_device *pdev)
 	ret = telemetry_setup_evtconfig(pss_evtconfig, ioss_evtconfig,
 					TELEM_RESET);
 	if (ret) {
-		dev_err(&pdev->dev, "TELEMTRY Setup Failed\n");
+		dev_err(&pdev->dev, "TELEMETRY Setup Failed\n");
 		return ret;
 	}
 	return 0;
@@ -685,7 +685,7 @@ static int telemetry_plt_update_events(struct telemetry_evtconfig pss_evtconfig,
 	ret = telemetry_setup_evtconfig(pss_evtconfig, ioss_evtconfig,
 					TELEM_UPDATE);
 	if (ret)
-		pr_err("TELEMTRY Config Failed\n");
+		pr_err("TELEMETRY Config Failed\n");
 
 	return ret;
 }
@@ -822,7 +822,7 @@ static int telemetry_plt_reset_events(void)
 	ret = telemetry_setup_evtconfig(pss_evtconfig, ioss_evtconfig,
 					TELEM_RESET);
 	if (ret)
-		pr_err("TELEMTRY Reset Failed\n");
+		pr_err("TELEMETRY Reset Failed\n");
 
 	return ret;
 }
@@ -885,7 +885,7 @@ static int telemetry_plt_add_events(u8 num_pss_evts, u8 num_ioss_evts,
 	ret = telemetry_setup_evtconfig(pss_evtconfig, ioss_evtconfig,
 					TELEM_ADD);
 	if (ret)
-		pr_err("TELEMTRY ADD Failed\n");
+		pr_err("TELEMETRY ADD Failed\n");
 
 	return ret;
 }
@@ -1195,7 +1195,7 @@ static int telemetry_pltdrv_probe(struct platform_device *pdev)
 
 	ret = telemetry_set_pltdata(&telm_pltops, telm_conf);
 	if (ret) {
-		dev_err(&pdev->dev, "TELEMTRY Set Pltops Failed.\n");
+		dev_err(&pdev->dev, "TELEMETRY Set Pltops Failed.\n");
 		goto out;
 	}
 
@@ -1210,7 +1210,7 @@ static int telemetry_pltdrv_probe(struct platform_device *pdev)
 		iounmap(telm_conf->pss_config.regmap);
 	if (telm_conf->ioss_config.regmap)
 		iounmap(telm_conf->ioss_config.regmap);
-	dev_err(&pdev->dev, "TELEMTRY Setup Failed.\n");
+	dev_err(&pdev->dev, "TELEMETRY Setup Failed.\n");
 
 	return ret;
 }
-- 
2.7.4

Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC6D1C61DA4
	for <platform-driver-x86@archiver.kernel.org>; Thu,  9 Mar 2023 04:14:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbjCIEOT (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 8 Mar 2023 23:14:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229644AbjCIEOT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Mar 2023 23:14:19 -0500
X-Greylist: delayed 604 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 08 Mar 2023 20:14:17 PST
Received: from hust.edu.cn (mail.hust.edu.cn [202.114.0.240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED5086486A
        for <platform-driver-x86@vger.kernel.org>; Wed,  8 Mar 2023 20:14:17 -0800 (PST)
Received: from localhost.localdomain ([172.16.0.254])
        (user=dzm91@hust.edu.cn mech=LOGIN bits=0)
        by mx1.hust.edu.cn  with ESMTP id 32943g7q028914-32943g7u028914
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Thu, 9 Mar 2023 12:03:54 +0800
From:   Dongliang Mu <dzm91@hust.edu.cn>
To:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
Cc:     Dongliang Mu <dzm91@hust.edu.cn>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH linux-next v2 1/3] platform/x86/intel/tpmi: Fix double free in tpmi_create_device()
Date:   Thu,  9 Mar 2023 12:01:05 +0800
Message-Id: <20230309040107.534716-2-dzm91@hust.edu.cn>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230309040107.534716-1-dzm91@hust.edu.cn>
References: <20230309040107.534716-1-dzm91@hust.edu.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-FEAS-AUTH-USER: dzm91@hust.edu.cn
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The previous commit 6a192c0cbf38 ("platform/x86/intel/tpmi: Fix
double free reported by Smatch") incorrectly handle the deallocation of
res variable. As shown in the comment, intel_vsec_add_aux handles all
the deallocation of res and feature_vsec_dev. Therefore, kfree(res) can
still cause double free if intel_vsec_add_aux returns error.

Fix this by adjusting the error handling part in tpmi_create_device,
following the function intel_vsec_add_dev.

Fixes: 6a192c0cbf38 ("platform/x86/intel/tpmi: Fix double free reported by Smatch")
Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
---
 drivers/platform/x86/intel/tpmi.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/intel/tpmi.c b/drivers/platform/x86/intel/tpmi.c
index c999732b0f1e..882fe5e4763f 100644
--- a/drivers/platform/x86/intel/tpmi.c
+++ b/drivers/platform/x86/intel/tpmi.c
@@ -215,8 +215,8 @@ static int tpmi_create_device(struct intel_tpmi_info *tpmi_info,
 
 	feature_vsec_dev = kzalloc(sizeof(*feature_vsec_dev), GFP_KERNEL);
 	if (!feature_vsec_dev) {
-		ret = -ENOMEM;
-		goto free_res;
+		kfree(res);
+		return -ENOMEM;
 	}
 
 	snprintf(feature_id_name, sizeof(feature_id_name), "tpmi-%s", name);
@@ -242,17 +242,8 @@ static int tpmi_create_device(struct intel_tpmi_info *tpmi_info,
 	 * feature_vsec_dev memory is also freed as part of device
 	 * delete.
 	 */
-	ret = intel_vsec_add_aux(vsec_dev->pcidev, &vsec_dev->auxdev.dev,
-				 feature_vsec_dev, feature_id_name);
-	if (ret)
-		goto free_res;
-
-	return 0;
-
-free_res:
-	kfree(res);
-
-	return ret;
+	return intel_vsec_add_aux(vsec_dev->pcidev, &vsec_dev->auxdev.dev,
+				  feature_vsec_dev, feature_id_name);
 }
 
 static int tpmi_create_devices(struct intel_tpmi_info *tpmi_info)
-- 
2.39.2


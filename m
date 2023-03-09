Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0BECC61DA4
	for <platform-driver-x86@archiver.kernel.org>; Thu,  9 Mar 2023 04:14:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229644AbjCIEOY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 8 Mar 2023 23:14:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229692AbjCIEOX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Mar 2023 23:14:23 -0500
Received: from hust.edu.cn (unknown [202.114.0.240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 230B864ABB
        for <platform-driver-x86@vger.kernel.org>; Wed,  8 Mar 2023 20:14:21 -0800 (PST)
Received: from localhost.localdomain ([172.16.0.254])
        (user=dzm91@hust.edu.cn mech=LOGIN bits=0)
        by mx1.hust.edu.cn  with ESMTP id 32943g7q028914-32943g7v028914
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Thu, 9 Mar 2023 12:03:56 +0800
From:   Dongliang Mu <dzm91@hust.edu.cn>
To:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
Cc:     Dongliang Mu <dzm91@hust.edu.cn>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH linux-next v2 2/3] drivers/platform/x86/intel/tpmi: revise the comment of intel_vsec_add_aux
Date:   Thu,  9 Mar 2023 12:01:06 +0800
Message-Id: <20230309040107.534716-3-dzm91@hust.edu.cn>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230309040107.534716-1-dzm91@hust.edu.cn>
References: <20230309040107.534716-1-dzm91@hust.edu.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-FEAS-AUTH-USER: dzm91@hust.edu.cn
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

intel_vsec_add_aux() is resource managed including res and
feature_vsec_dev memory.

Fix this by revising the comment of intel_vsec_add_aux since res variable
will also be freed in the intel_vsec_add_aux.

Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
---
 drivers/platform/x86/intel/tpmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel/tpmi.c b/drivers/platform/x86/intel/tpmi.c
index 882fe5e4763f..036d0e0dba19 100644
--- a/drivers/platform/x86/intel/tpmi.c
+++ b/drivers/platform/x86/intel/tpmi.c
@@ -239,8 +239,8 @@ static int tpmi_create_device(struct intel_tpmi_info *tpmi_info,
 	/*
 	 * intel_vsec_add_aux() is resource managed, no explicit
 	 * delete is required on error or on module unload.
-	 * feature_vsec_dev memory is also freed as part of device
-	 * delete.
+	 * feature_vsec_dev and res memory are also freed as part of
+	 * device deletion.
 	 */
 	return intel_vsec_add_aux(vsec_dev->pcidev, &vsec_dev->auxdev.dev,
 				  feature_vsec_dev, feature_id_name);
-- 
2.39.2


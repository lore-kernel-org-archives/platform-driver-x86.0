Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71747C433DB
	for <platform-driver-x86@archiver.kernel.org>; Tue,  9 Mar 2021 19:54:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1E54F6523D
	for <platform-driver-x86@archiver.kernel.org>; Tue,  9 Mar 2021 19:54:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231415AbhCITx3 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 9 Mar 2021 14:53:29 -0500
Received: from mga04.intel.com ([192.55.52.120]:27908 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231226AbhCITxT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 9 Mar 2021 14:53:19 -0500
IronPort-SDR: O7fZc3WAGbR1aLmHX5Yd0VT4LoZESm+hqQ+DetHZqtt2T0L3VgzZQ/LGUSorKZIvVYLOToLVrH
 VeqToUAkutqg==
X-IronPort-AV: E=McAfee;i="6000,8403,9917"; a="185930765"
X-IronPort-AV: E=Sophos;i="5.81,236,1610438400"; 
   d="scan'208";a="185930765"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2021 11:53:15 -0800
IronPort-SDR: 99KnkdsPI3XGfCvZxQLKpQPf4ENJOvLLejFEbLjPQVr5NDnZyom0YTZ8WLbN6rPHP26dlmHEDs
 UtHc903WTmAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,236,1610438400"; 
   d="scan'208";a="588560712"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga005.jf.intel.com with ESMTP; 09 Mar 2021 11:53:14 -0800
Received: from debox1-desk2.jf.intel.com (debox1-desk2.jf.intel.com [10.54.75.16])
        by linux.intel.com (Postfix) with ESMTP id 57E3858088F;
        Tue,  9 Mar 2021 11:53:14 -0800 (PST)
From:   "David E. Box" <david.e.box@linux.intel.com>
To:     lee.jones@linaro.org, hdegoede@redhat.com, mgross@linux.intel.com
Cc:     "David E. Box" <david.e.box@linux.intel.com>,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: [PATCH V3 1/2] MFD: intel_pmt: Fix nuisance messages and handling of disabled capabilities
Date:   Tue,  9 Mar 2021 11:52:33 -0800
Message-Id: <20210309195234.2400678-1-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309181309.GU4931@dell>
References: <20210309181309.GU4931@dell>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Some products will be available that have PMT capabilities that are not
supported. Remove the warnings in this instance to avoid nuisance messages
and confusion.

Also return an error code for capabilities that are disabled by quirk to
prevent them from keeping the driver loaded if only disabled capabilities
are found.

Fixes: 4f8217d5b0ca ("mfd: Intel Platform Monitoring Technology support")
Signed-off-by: David E. Box <david.e.box@linux.intel.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
---

No change from V2

 drivers/mfd/intel_pmt.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/mfd/intel_pmt.c b/drivers/mfd/intel_pmt.c
index 744b230cdcca..65da2b17a204 100644
--- a/drivers/mfd/intel_pmt.c
+++ b/drivers/mfd/intel_pmt.c
@@ -79,19 +79,18 @@ static int pmt_add_dev(struct pci_dev *pdev, struct intel_dvsec_header *header,
 	case DVSEC_INTEL_ID_WATCHER:
 		if (quirks & PMT_QUIRK_NO_WATCHER) {
 			dev_info(dev, "Watcher not supported\n");
-			return 0;
+			return -EINVAL;
 		}
 		name = "pmt_watcher";
 		break;
 	case DVSEC_INTEL_ID_CRASHLOG:
 		if (quirks & PMT_QUIRK_NO_CRASHLOG) {
 			dev_info(dev, "Crashlog not supported\n");
-			return 0;
+			return -EINVAL;
 		}
 		name = "pmt_crashlog";
 		break;
 	default:
-		dev_err(dev, "Unrecognized PMT capability: %d\n", id);
 		return -EINVAL;
 	}
 
@@ -174,12 +173,8 @@ static int pmt_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		header.offset = INTEL_DVSEC_TABLE_OFFSET(table);
 
 		ret = pmt_add_dev(pdev, &header, quirks);
-		if (ret) {
-			dev_warn(&pdev->dev,
-				 "Failed to add device for DVSEC id %d\n",
-				 header.id);
+		if (ret)
 			continue;
-		}
 
 		found_devices = true;
 	} while (true);

base-commit: a38fd8748464831584a19438cbb3082b5a2dab15
-- 
2.25.1


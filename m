Return-Path: <SRS0=FuY/=EL=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3FDCC00A89
	for <platform-driver-x86@archiver.kernel.org>; Thu,  5 Nov 2020 11:05:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 773032072E
	for <platform-driver-x86@archiver.kernel.org>; Thu,  5 Nov 2020 11:05:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730099AbgKELFl (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 5 Nov 2020 06:05:41 -0500
Received: from mga05.intel.com ([192.55.52.43]:50626 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726400AbgKELFl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 5 Nov 2020 06:05:41 -0500
IronPort-SDR: 4usoaI/AB9yHjEuBi4/4q1Vz+e11sy3xiShDefj99svphRE/vy00gEBvvg3GjHbGRVWs3e/S3L
 o4tgyR1y+xLA==
X-IronPort-AV: E=McAfee;i="6000,8403,9795"; a="254070853"
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; 
   d="scan'208";a="254070853"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2020 03:05:40 -0800
IronPort-SDR: OQuyvb57QRx2d4auNN5SwoKgIMdC2kqH4vv3bZ+tXJ3G+IA1psjO+Evxv+4SzxLwo7lSkXN98v
 VbOxUeoSwFgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; 
   d="scan'208";a="397218874"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 05 Nov 2020 03:05:31 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 10CFD213; Thu,  5 Nov 2020 13:05:31 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/4] platform/x86: i2c-multi-instantiate: Simplify with dev_err_probe()
Date:   Thu,  5 Nov 2020 13:05:28 +0200
Message-Id: <20201105110530.27888-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201105110530.27888-1-andriy.shevchenko@linux.intel.com>
References: <20201105110530.27888-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Common pattern of handling deferred probe can be simplified with
dev_err_probe(). Less code and the error value gets printed.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/i2c-multi-instantiate.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/i2c-multi-instantiate.c b/drivers/platform/x86/i2c-multi-instantiate.c
index d92d9a98ec8f..ce4d921c3301 100644
--- a/drivers/platform/x86/i2c-multi-instantiate.c
+++ b/drivers/platform/x86/i2c-multi-instantiate.c
@@ -118,9 +118,8 @@ static int i2c_multi_inst_probe(struct platform_device *pdev)
 		}
 		multi->clients[i] = i2c_acpi_new_device(dev, i, &board_info);
 		if (IS_ERR(multi->clients[i])) {
-			ret = PTR_ERR(multi->clients[i]);
-			if (ret != -EPROBE_DEFER)
-				dev_err(dev, "Error creating i2c-client, idx %d\n", i);
+			ret = dev_err_probe(dev, PTR_ERR(multi->clients[i]),
+					    "Error creating i2c-client, idx %d\n", i);
 			goto error;
 		}
 	}
-- 
2.28.0


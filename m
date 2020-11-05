Return-Path: <SRS0=FuY/=EL=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CA4BC388F7
	for <platform-driver-x86@archiver.kernel.org>; Thu,  5 Nov 2020 11:05:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2C2DC20756
	for <platform-driver-x86@archiver.kernel.org>; Thu,  5 Nov 2020 11:05:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729263AbgKELFd (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 5 Nov 2020 06:05:33 -0500
Received: from mga14.intel.com ([192.55.52.115]:51420 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730099AbgKELFd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 5 Nov 2020 06:05:33 -0500
IronPort-SDR: QdnzVZOPclHqC5sMyUVc8USrzfaLm6gXbVQh3kLf0Hhf79gKniZZk2aqAktMl7Fg9rIJRVeo2M
 hxK1sL9r20bA==
X-IronPort-AV: E=McAfee;i="6000,8403,9795"; a="168582718"
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; 
   d="scan'208";a="168582718"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2020 03:05:33 -0800
IronPort-SDR: Ck0pj+sH+1dtxccwao/yXh/2LysUX3QTkqFwxsgTj/giFRUM1uDYhR8XDzQnPj8IUNd8mB12YM
 GmwNUk6MDfrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; 
   d="scan'208";a="354238261"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 05 Nov 2020 03:05:31 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 190D1386; Thu,  5 Nov 2020 13:05:31 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 3/4] platform/x86: i2c-multi-instantiate: Make number of clients unsigned
Date:   Thu,  5 Nov 2020 13:05:29 +0200
Message-Id: <20201105110530.27888-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201105110530.27888-1-andriy.shevchenko@linux.intel.com>
References: <20201105110530.27888-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

There is no need to use signed type for number of clients. Moreover,
it's cleaner to show that we never go negative there.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/i2c-multi-instantiate.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/i2c-multi-instantiate.c b/drivers/platform/x86/i2c-multi-instantiate.c
index ce4d921c3301..422fa88da643 100644
--- a/drivers/platform/x86/i2c-multi-instantiate.c
+++ b/drivers/platform/x86/i2c-multi-instantiate.c
@@ -27,7 +27,7 @@ struct i2c_inst_data {
 };
 
 struct i2c_multi_inst_data {
-	int num_clients;
+	unsigned int num_clients;
 	struct i2c_client *clients[];
 };
 
@@ -64,8 +64,9 @@ static int i2c_multi_inst_probe(struct platform_device *pdev)
 	struct i2c_board_info board_info = {};
 	struct device *dev = &pdev->dev;
 	struct acpi_device *adev;
+	unsigned int i;
 	char name[32];
-	int i, ret;
+	int ret;
 
 	match = acpi_match_device(dev->driver->acpi_match_table, dev);
 	if (!match) {
@@ -90,7 +91,7 @@ static int i2c_multi_inst_probe(struct platform_device *pdev)
 	for (i = 0; i < multi->num_clients && inst_data[i].type; i++) {
 		memset(&board_info, 0, sizeof(board_info));
 		strlcpy(board_info.type, inst_data[i].type, I2C_NAME_SIZE);
-		snprintf(name, sizeof(name), "%s-%s.%d", dev_name(dev),
+		snprintf(name, sizeof(name), "%s-%s.%u", dev_name(dev),
 			 inst_data[i].type, i);
 		board_info.dev_name = name;
 		switch (inst_data[i].flags & IRQ_RESOURCE_TYPE) {
@@ -119,12 +120,12 @@ static int i2c_multi_inst_probe(struct platform_device *pdev)
 		multi->clients[i] = i2c_acpi_new_device(dev, i, &board_info);
 		if (IS_ERR(multi->clients[i])) {
 			ret = dev_err_probe(dev, PTR_ERR(multi->clients[i]),
-					    "Error creating i2c-client, idx %d\n", i);
+					    "Error creating i2c-client, idx %u\n", i);
 			goto error;
 		}
 	}
 	if (i < multi->num_clients) {
-		dev_err(dev, "Error finding driver, idx %d\n", i);
+		dev_err(dev, "Error finding driver, idx %u\n", i);
 		ret = -ENODEV;
 		goto error;
 	}
@@ -133,7 +134,7 @@ static int i2c_multi_inst_probe(struct platform_device *pdev)
 	return 0;
 
 error:
-	while (--i >= 0)
+	while (i--)
 		i2c_unregister_device(multi->clients[i]);
 
 	return ret;
@@ -142,7 +143,7 @@ static int i2c_multi_inst_probe(struct platform_device *pdev)
 static int i2c_multi_inst_remove(struct platform_device *pdev)
 {
 	struct i2c_multi_inst_data *multi = platform_get_drvdata(pdev);
-	int i;
+	unsigned int i;
 
 	for (i = 0; i < multi->num_clients; i++)
 		i2c_unregister_device(multi->clients[i]);
-- 
2.28.0


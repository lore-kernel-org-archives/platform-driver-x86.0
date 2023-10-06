Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13FB2E81E09
	for <platform-driver-x86@archiver.kernel.org>; Fri,  6 Oct 2023 15:27:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230226AbjJFP1r (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 6 Oct 2023 11:27:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232803AbjJFP1q (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 6 Oct 2023 11:27:46 -0400
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 572D29E;
        Fri,  6 Oct 2023 08:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696606065; x=1728142065;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bf77ZdZ1uTgln+hS23JadGI3L2QVcO3kDUNslRuZ4Yk=;
  b=Czk29VncDmdNmvjbnrXGj3Ucp+97uZ/sndLc84S/wLBDxC23Tdz46HMp
   KRTEfR+j3AgGU9hSky9wS405oculK6GIe/8AlPmk1p6iWTd2ilzSXMkLf
   SQLPTwm1k0yIzGuSOOvQOIv/rExQq/1OJYCur/37aMatyjbWQVRshAaRw
   q5IEQPIVR3jMQpFNMLgj5GQUAi5TneM4ikRAVY5GULlKFzUHG79ViXoih
   UkiCOInpWRgm0BWL6Tr0lDTyCsGU+oBpogafCpLc35lubKMt3gcecdWCN
   IkGyEJKX9i+q81gec3pxaHIZo6WIBFbNXNMiOlFIqVJr3T7lD6jr9DxRb
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="2374454"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="2374454"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2023 08:27:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="781687049"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="781687049"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 06 Oct 2023 08:27:42 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 3577E430; Fri,  6 Oct 2023 18:27:41 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Corentin Chary <corentin.chary@gmail.com>,
        =?UTF-8?q?Jo=C3=A3o=20Paulo=20Rechi=20Vita?= <jprvita@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Mark Gross <markgross@kernel.org>
Subject: [PATCH v2 1/1] platform/x86: asus-wireless: Replace open coded acpi_match_device()
Date:   Fri,  6 Oct 2023 18:27:39 +0300
Message-Id: <20231006152739.3495671-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Replace open coded acpi_match_device() in asus_wireless_add().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: fixed compilation error
 drivers/platform/x86/asus-wireless.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/asus-wireless.c b/drivers/platform/x86/asus-wireless.c
index abf01e00b799..8b9a0dde34e3 100644
--- a/drivers/platform/x86/asus-wireless.c
+++ b/drivers/platform/x86/asus-wireless.c
@@ -148,13 +148,9 @@ static int asus_wireless_add(struct acpi_device *adev)
 	if (err)
 		return err;
 
-	for (id = device_ids; id->id[0]; id++) {
-		if (!strcmp((char *) id->id, acpi_device_hid(adev))) {
-			data->hswc_params =
-				(const struct hswc_params *)id->driver_data;
-			break;
-		}
-	}
+	id = acpi_match_device(device_ids, adev);
+	if (id)
+		data->hswc_params = (const struct hswc_params *)id->driver_data;
 	if (!data->hswc_params)
 		return 0;
 
-- 
2.40.0.1.gaa8946217a0b


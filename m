Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFD64C433F5
	for <platform-driver-x86@archiver.kernel.org>; Sun, 21 Nov 2021 19:11:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238620AbhKUTOu (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 21 Nov 2021 14:14:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46213 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238617AbhKUTOu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 21 Nov 2021 14:14:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637521904;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iZy2IYFJBZLfR1ICpjcleU/N5a4dNxMnu4P22cnd9fo=;
        b=PUsAzh4cAKoOxvQHyRE/r5oMZW0lOE6YJBOTaA46yx0JiQW2hr+LnxlNhjWO/OZImm6V1Y
        qBaQUwcykEx4ytY8PeBKetcsajnGmc8Ulzzbmilj9XgSRv1H84DlIVhjAlXLD4WCm0c10z
        3tn0hyT18SvQLAICJSczyz+TK8Z4PlA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-200-P9m-lSdYO2Wl8A4vWgKVDg-1; Sun, 21 Nov 2021 14:11:39 -0500
X-MC-Unique: P9m-lSdYO2Wl8A4vWgKVDg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6851E18125C0;
        Sun, 21 Nov 2021 19:11:38 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.41])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4C0895DF5E;
        Sun, 21 Nov 2021 19:11:37 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Mark Pearson <markpearson@lenovo.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 5/7] platform/x86: thinkpad_acpi: Properly indent code in tpacpi_dytc_profile_init()
Date:   Sun, 21 Nov 2021 20:11:27 +0100
Message-Id: <20211121191129.256713-6-hdegoede@redhat.com>
In-Reply-To: <20211121191129.256713-1-hdegoede@redhat.com>
References: <20211121191129.256713-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The previous refactoring of some code in tpacpi_dytc_profile_init() left
a weirdly indented code-block behind.

Remove the unnecessary '{}' and reduce the indent level one step,
other then changing the indentation the code is completely unchanged.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 47 ++++++++++++++--------------
 1 file changed, 23 insertions(+), 24 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index cdc4028be341..acfe08e7dc3f 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -10134,31 +10134,30 @@ static int tpacpi_dytc_profile_init(struct ibm_init_struct *iibm)
 	if (dytc_version < 5)
 		return -ENODEV;
 
-	{
-		dbg_printk(TPACPI_DBG_INIT,
-				"DYTC version %d: thermal mode available\n", dytc_version);
-		/*
-		 * Check if MMC_GET functionality available
-		 * Version > 6 and return success from MMC_GET command
-		 */
-		dytc_mmc_get_available = false;
-		if (dytc_version >= 6) {
-			err = dytc_command(DYTC_CMD_MMC_GET, &output);
-			if (!err && ((output & DYTC_ERR_MASK) == DYTC_ERR_SUCCESS))
-				dytc_mmc_get_available = true;
-		}
-		/* Create platform_profile structure and register */
-		err = platform_profile_register(&dytc_profile);
-		/*
-		 * If for some reason platform_profiles aren't enabled
-		 * don't quit terminally.
-		 */
-		if (err)
-			return -ENODEV;
-
-		/* Ensure initial values are correct */
-		dytc_profile_refresh();
+	dbg_printk(TPACPI_DBG_INIT,
+			"DYTC version %d: thermal mode available\n", dytc_version);
+	/*
+	 * Check if MMC_GET functionality available
+	 * Version > 6 and return success from MMC_GET command
+	 */
+	dytc_mmc_get_available = false;
+	if (dytc_version >= 6) {
+		err = dytc_command(DYTC_CMD_MMC_GET, &output);
+		if (!err && ((output & DYTC_ERR_MASK) == DYTC_ERR_SUCCESS))
+			dytc_mmc_get_available = true;
 	}
+	/* Create platform_profile structure and register */
+	err = platform_profile_register(&dytc_profile);
+	/*
+	 * If for some reason platform_profiles aren't enabled
+	 * don't quit terminally.
+	 */
+	if (err)
+		return -ENODEV;
+
+	/* Ensure initial values are correct */
+	dytc_profile_refresh();
+
 	return 0;
 }
 
-- 
2.31.1


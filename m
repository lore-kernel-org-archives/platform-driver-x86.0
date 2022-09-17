Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFF17C6FA82
	for <platform-driver-x86@archiver.kernel.org>; Sat, 17 Sep 2022 21:04:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229462AbiIQVEO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 17 Sep 2022 17:04:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbiIQVEM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 17 Sep 2022 17:04:12 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB5672C658
        for <platform-driver-x86@vger.kernel.org>; Sat, 17 Sep 2022 14:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663448650;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=eD055yD72ytGrWLwmCULS6WL+LR1pBuSfH6qBO8xEO4=;
        b=Cl50aESIzxtgK4gKN1nwGJHoZFg/dgvqJKOim0cbIsuc2ZZeXl34hNsF9tTQY/fM6vSQl6
        h6KFNRcg6rzdL6pWcaz1ni8ZX7acu5mR5Gdn7WIJwtEqEglUX8VdUTxkzDZbThoh0noQCo
        A/8uiHMBbXmNTcwhYnpC7ryAUy2RDo4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-673-x78qWhOtMcKhy6snsvkcJg-1; Sat, 17 Sep 2022 17:04:08 -0400
X-MC-Unique: x78qWhOtMcKhy6snsvkcJg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 849A8811726;
        Sat, 17 Sep 2022 21:04:08 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.28])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D06672166B26;
        Sat, 17 Sep 2022 21:04:07 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: msi-laptop: Change DMI match / alias strings to fix module autoloading
Date:   Sat, 17 Sep 2022 23:04:07 +0200
Message-Id: <20220917210407.647432-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On a MSI S270 with Fedora 37 x86_64 / systemd-251.4 the module does not
properly autoload.

This is likely caused by issues with how systemd-udevd handles the single
quote char (') which is part of the sys_vendor / chassis_vendor strings
on this laptop. As a workaround remove the single quote char + everything
behind it from the sys_vendor + chassis_vendor matches. This fixes
the module not autoloading.

Link: https://github.com/systemd/systemd/issues/24715
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/msi-laptop.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/msi-laptop.c b/drivers/platform/x86/msi-laptop.c
index 1c29678e5727..2f850396e9a7 100644
--- a/drivers/platform/x86/msi-laptop.c
+++ b/drivers/platform/x86/msi-laptop.c
@@ -602,11 +602,10 @@ static const struct dmi_system_id msi_dmi_table[] __initconst = {
 	{
 		.ident = "MSI S270",
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "MICRO-STAR INT'L CO.,LTD"),
+			DMI_MATCH(DMI_SYS_VENDOR, "MICRO-STAR INT"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "MS-1013"),
 			DMI_MATCH(DMI_PRODUCT_VERSION, "0131"),
-			DMI_MATCH(DMI_CHASSIS_VENDOR,
-				  "MICRO-STAR INT'L CO.,LTD")
+			DMI_MATCH(DMI_CHASSIS_VENDOR, "MICRO-STAR INT")
 		},
 		.driver_data = &quirk_old_ec_model,
 		.callback = dmi_check_cb
@@ -639,8 +638,7 @@ static const struct dmi_system_id msi_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "NOTEBOOK"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "SAM2000"),
 			DMI_MATCH(DMI_PRODUCT_VERSION, "0131"),
-			DMI_MATCH(DMI_CHASSIS_VENDOR,
-				  "MICRO-STAR INT'L CO.,LTD")
+			DMI_MATCH(DMI_CHASSIS_VENDOR, "MICRO-STAR INT")
 		},
 		.driver_data = &quirk_old_ec_model,
 		.callback = dmi_check_cb
-- 
2.37.3


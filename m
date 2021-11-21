Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82BEAC433F5
	for <platform-driver-x86@archiver.kernel.org>; Sun, 21 Nov 2021 19:11:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238521AbhKUTOo (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 21 Nov 2021 14:14:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34311 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236275AbhKUTOn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 21 Nov 2021 14:14:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637521898;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Xh3Gq0+naht22gPnrMTUi+D9zNliHNTtUQjlG4t9cWM=;
        b=Oq+St8edLu7y7BWsyfNZ+MEU0P/d/J9fyH6DzHi6lfLxSHE9N0yE57bZRBoogEEz5Q1Yks
        Oe09YIdm9l1jXQxFRrqFVq02UT/maKtBKBDKTSoTNwBK9zmpURHYftvGsJi/q4u8SYvui0
        //aj2HeAKOU6cDDFiP1c55j51j0+v94=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-227-5kSaQgbsOTqivGV_ulrSCA-1; Sun, 21 Nov 2021 14:11:36 -0500
X-MC-Unique: 5kSaQgbsOTqivGV_ulrSCA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 98CC91006AA0;
        Sun, 21 Nov 2021 19:11:35 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.41])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7AEAB5DF21;
        Sun, 21 Nov 2021 19:11:34 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Mark Pearson <markpearson@lenovo.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 3/7] platform/x86: thinkpad_acpi: Simplify dytc_version handling
Date:   Sun, 21 Nov 2021 20:11:25 +0100
Message-Id: <20211121191129.256713-4-hdegoede@redhat.com>
In-Reply-To: <20211121191129.256713-1-hdegoede@redhat.com>
References: <20211121191129.256713-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The only reason the proxysensor code needs dytc_version handling is for
proxsensor_attr_is_visible() and that will only ever get called after
all the subdrv init() callbacks have run.

tpacpi_dytc_profile_init() already calls DYTC_CMD_QUERY and is the
primary consumer of dytc_version, so simply let tpacpi_dytc_profile_init()
set dytc_version and remove the now no longer necessary dytc_get_version()
helper and its calls.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 47 +++-------------------------
 1 file changed, 5 insertions(+), 42 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 24a3c79a045e..4c8050a0655a 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -9781,33 +9781,6 @@ static int dytc_command(int command, int *output)
 	return 0;
 }
 
-static int dytc_get_version(void)
-{
-	int err, output;
-
-	/* Check if we've been called before - and just return cached value */
-	if (dytc_version)
-		return dytc_version;
-
-	/* Otherwise query DYTC and extract version information */
-	err = dytc_command(DYTC_CMD_QUERY, &output);
-	/*
-	 * If support isn't available (ENODEV) then don't return an error
-	 * and don't create the sysfs group
-	 */
-	if (err == -ENODEV)
-		return 0;
-	/* For all other errors we can flag the failure */
-	if (err)
-		return err;
-
-	/* Check DYTC is enabled and supports mode setting */
-	if (output & BIT(DYTC_QUERY_ENABLE_BIT))
-		dytc_version = (output >> DYTC_QUERY_REV_BIT) & 0xF;
-
-	return 0;
-}
-
 static int lapsensor_get(bool *present, bool *state)
 {
 	int output, err;
@@ -9904,7 +9877,7 @@ static umode_t proxsensor_attr_is_visible(struct kobject *kobj,
 		 * Platforms before DYTC version 5 claim to have a lap sensor,
 		 * but it doesn't work, so we ignore them.
 		 */
-		if (!has_lapsensor ||  dytc_version < 5)
+		if (!has_lapsensor || dytc_version < 5)
 			return 0;
 	} else if (attr == &dev_attr_palmsensor.attr) {
 		if (!has_palmsensor)
@@ -9921,7 +9894,7 @@ static const struct attribute_group proxsensor_attr_group = {
 
 static int tpacpi_proxsensor_init(struct ibm_init_struct *iibm)
 {
-	int palm_err, lap_err, err;
+	int palm_err, lap_err;
 
 	palm_err = palmsensor_get(&has_palmsensor, &palm_state);
 	lap_err = lapsensor_get(&has_lapsensor, &lap_state);
@@ -9934,13 +9907,6 @@ static int tpacpi_proxsensor_init(struct ibm_init_struct *iibm)
 	if (lap_err && (lap_err != -ENODEV))
 		return lap_err;
 
-	/* Check if we know the DYTC version, if we don't then get it */
-	if (!dytc_version) {
-		err = dytc_get_version();
-		if (err)
-			return err;
-	}
-
 	return 0;
 }
 
@@ -10166,12 +10132,9 @@ static int tpacpi_dytc_profile_init(struct ibm_init_struct *iibm)
 	if (err)
 		return err;
 
-	/* Check if we know the DYTC version, if we don't then get it */
-	if (!dytc_version) {
-		err = dytc_get_version();
-		if (err)
-			return err;
-	}
+	if (output & BIT(DYTC_QUERY_ENABLE_BIT))
+		dytc_version = (output >> DYTC_QUERY_REV_BIT) & 0xF;
+
 	/* Check DYTC is enabled and supports mode setting */
 	if (dytc_version >= 5) {
 		dbg_printk(TPACPI_DBG_INIT,
-- 
2.31.1


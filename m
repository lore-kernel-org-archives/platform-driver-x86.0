Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF030C433EF
	for <platform-driver-x86@archiver.kernel.org>; Sun, 21 Nov 2021 19:11:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238470AbhKUTOp (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 21 Nov 2021 14:14:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25123 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238591AbhKUTOp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 21 Nov 2021 14:14:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637521899;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4oM5oEs5OiU5M+o68PHeYE5TW+V2pU/hdghQ/URiuXw=;
        b=N7OJfJNKJrq2smdgJiMgFmB5Dntow/1Jtgc505Wm/JcdffaXv6pRmIMGNzuyj5TFccSJfc
        wLEFro6DLwSF+Bww8dFLJh8mTPG8Tyt4Y0aqZHwO6rAwd4Lo2EQpM0Tg+7XgSkU/NpN5fz
        S6Pcnp1t8GjL3au5cgGWoO+Ae5dEKPU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-299-Z3bT5Ex_NwuPvxYMk6c6Wg-1; Sun, 21 Nov 2021 14:11:38 -0500
X-MC-Unique: Z3bT5Ex_NwuPvxYMk6c6Wg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03D0B102C887;
        Sun, 21 Nov 2021 19:11:37 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.41])
        by smtp.corp.redhat.com (Postfix) with ESMTP id DFFC35DF21;
        Sun, 21 Nov 2021 19:11:35 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Mark Pearson <markpearson@lenovo.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 4/7] platform/x86: thinkpad_acpi: Cleanup dytc_profile_available
Date:   Sun, 21 Nov 2021 20:11:26 +0100
Message-Id: <20211121191129.256713-5-hdegoede@redhat.com>
In-Reply-To: <20211121191129.256713-1-hdegoede@redhat.com>
References: <20211121191129.256713-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Remove the dytc_profile_available check from dytc_profile_set(),
that function only gets called if the platform_profile_handler was
registered, so the check is not necessary.

Make tpacpi_dytc_profile_init() return -ENODEV when it does not register
the platform_profile() handler this will cause
dytc_profile_driver_data.flags.init to not get set, which in turn will
cause the dytc_profile_exit() call to get skipped.

Together this avoids the need to have the dytc_profile_available
variable at all, since the information is now duplicated in the
dytc_profile_driver_data.flags.init flag.

Note this leaves a weirdly indented code-block behind, this is
deliberately done to make what actually changes in this commit clear.
This will be fixed-up in the next commit.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 4c8050a0655a..cdc4028be341 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -9950,7 +9950,6 @@ static struct ibm_struct proxsensor_driver_data = {
 
 #define DYTC_ENABLE_CQL DYTC_SET_COMMAND(DYTC_FUNCTION_CQL, DYTC_MODE_BALANCE, 1)
 
-static bool dytc_profile_available;
 static enum platform_profile_option dytc_current_profile;
 static atomic_t dytc_ignore_event = ATOMIC_INIT(0);
 static DEFINE_MUTEX(dytc_mutex);
@@ -10054,9 +10053,6 @@ static int dytc_profile_set(struct platform_profile_handler *pprof,
 	int output;
 	int err;
 
-	if (!dytc_profile_available)
-		return -ENODEV;
-
 	err = mutex_lock_interruptible(&dytc_mutex);
 	if (err)
 		return err;
@@ -10127,7 +10123,6 @@ static int tpacpi_dytc_profile_init(struct ibm_init_struct *iibm)
 	set_bit(PLATFORM_PROFILE_BALANCED, dytc_profile.choices);
 	set_bit(PLATFORM_PROFILE_PERFORMANCE, dytc_profile.choices);
 
-	dytc_profile_available = false;
 	err = dytc_command(DYTC_CMD_QUERY, &output);
 	if (err)
 		return err;
@@ -10136,7 +10131,10 @@ static int tpacpi_dytc_profile_init(struct ibm_init_struct *iibm)
 		dytc_version = (output >> DYTC_QUERY_REV_BIT) & 0xF;
 
 	/* Check DYTC is enabled and supports mode setting */
-	if (dytc_version >= 5) {
+	if (dytc_version < 5)
+		return -ENODEV;
+
+	{
 		dbg_printk(TPACPI_DBG_INIT,
 				"DYTC version %d: thermal mode available\n", dytc_version);
 		/*
@@ -10156,9 +10154,8 @@ static int tpacpi_dytc_profile_init(struct ibm_init_struct *iibm)
 		 * don't quit terminally.
 		 */
 		if (err)
-			return 0;
+			return -ENODEV;
 
-		dytc_profile_available = true;
 		/* Ensure initial values are correct */
 		dytc_profile_refresh();
 	}
@@ -10167,10 +10164,7 @@ static int tpacpi_dytc_profile_init(struct ibm_init_struct *iibm)
 
 static void dytc_profile_exit(void)
 {
-	if (dytc_profile_available) {
-		dytc_profile_available = false;
-		platform_profile_remove();
-	}
+	platform_profile_remove();
 }
 
 static struct ibm_struct  dytc_profile_driver_data = {
-- 
2.31.1


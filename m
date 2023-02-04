Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E75BC61DA4
	for <platform-driver-x86@archiver.kernel.org>; Sat,  4 Feb 2023 11:03:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231775AbjBDLDV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 4 Feb 2023 06:03:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232974AbjBDLDU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 4 Feb 2023 06:03:20 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3E2E30E8D
        for <platform-driver-x86@vger.kernel.org>; Sat,  4 Feb 2023 03:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675508552;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=rmTsTfFbqiLmJRDHUTmjAPal6hUwXx4LnidUVVXr/4s=;
        b=Oyzs5PPh+oe6JbSzI92sHVkJqwIK+6QOoEOyqwV4CZ3zAI3cVhBAlH8rEodNLiUnKZMUih
        Cb/eGcpjSSHLjfflzHckTmgdLUR0yWOM8Ino92yt2uKILTTAA6X+hPYUhytJMu8wb1aAUS
        UThURxPKgvUpsChYygucKQP8oQR8j6M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-267-gYLbXExhOBaXio6lXrGwZg-1; Sat, 04 Feb 2023 06:02:27 -0500
X-MC-Unique: gYLbXExhOBaXio6lXrGwZg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ECB25858F09;
        Sat,  4 Feb 2023 11:02:26 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.192.32])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 72374140EBF6;
        Sat,  4 Feb 2023 11:02:25 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Daniel Scally <djrscally@gmail.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: int3472/discrete: Drop unnecessary obj->type == string check
Date:   Sat,  4 Feb 2023 12:02:23 +0100
Message-Id: <20230204110223.54625-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

acpi_evaluate_dsm_typed() already verifies the type is the requested type,
so this error check is a no-op, drop it.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel/int3472/discrete.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index 96963e30ab6c..f064da74f50a 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -78,14 +78,6 @@ skl_int3472_get_sensor_module_config(struct int3472_discrete_device *int3472)
 		return ERR_PTR(-ENODEV);
 	}
 
-	if (obj->string.type != ACPI_TYPE_STRING) {
-		dev_err(int3472->dev,
-			"Sensor _DSM returned a non-string value\n");
-
-		ACPI_FREE(obj);
-		return ERR_PTR(-EINVAL);
-	}
-
 	for (i = 0; i < ARRAY_SIZE(int3472_sensor_configs); i++) {
 		if (!strcmp(int3472_sensor_configs[i].sensor_module_name,
 			    obj->string.pointer))
-- 
2.39.1


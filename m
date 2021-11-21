Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 526B7C433EF
	for <platform-driver-x86@archiver.kernel.org>; Sun, 21 Nov 2021 19:11:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238617AbhKUTOv (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 21 Nov 2021 14:14:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50198 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238645AbhKUTOu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 21 Nov 2021 14:14:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637521905;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=oMvv03ftgCzaw3NgLghJeXW5m+IAKBCTRRPu495Gwfw=;
        b=VrIqHEvV2Ea4kuMWZNk8mX8DGQOjGsolnU5FUpKJtRO3urobiFGPh5YOC6EPipxOy2ElEX
        mkxOkCbA3anDjQNSKT+TzYaojWTfgw/Z2Jeldo+bPmlUL8vbacp+yUi8B7bPNrYNnqVB9Y
        rYTP4G20tzSX6b+DPafb1h6Ohb//d8k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-583-pNAYE0K-N8e6uepF-Imj1w-1; Sun, 21 Nov 2021 14:11:42 -0500
X-MC-Unique: pNAYE0K-N8e6uepF-Imj1w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6FF11006AA1;
        Sun, 21 Nov 2021 19:11:40 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.41])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B02335DF21;
        Sun, 21 Nov 2021 19:11:38 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Mark Pearson <markpearson@lenovo.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 6/7] platform/x86: thinkpad_acpi: Remove "goto err_exit" from hotkey_init()
Date:   Sun, 21 Nov 2021 20:11:28 +0100
Message-Id: <20211121191129.256713-7-hdegoede@redhat.com>
In-Reply-To: <20211121191129.256713-1-hdegoede@redhat.com>
References: <20211121191129.256713-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The err_exit label just does a:
 return (res < 0) ? res : -ENODEV;

And res is always < 0 when we go there (hotkey_mask_get() returns
either 0 or -EIO), so the goto-s can simply be replaced with
"return res".

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index acfe08e7dc3f..9f45949fb3e9 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -3466,7 +3466,7 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 		 * the first hotkey_mask_get to return hotkey_orig_mask */
 		res = hotkey_mask_get();
 		if (res)
-			goto err_exit;
+			return res;
 
 		hotkey_orig_mask = hotkey_acpi_mask;
 	} else {
@@ -3502,8 +3502,7 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 			TPACPI_HOTKEY_MAP_SIZE,	GFP_KERNEL);
 	if (!hotkey_keycode_map) {
 		pr_err("failed to allocate memory for key map\n");
-		res = -ENOMEM;
-		goto err_exit;
+		return -ENOMEM;
 	}
 
 	input_set_capability(tpacpi_inputdev, EV_MSC, MSC_SCAN);
@@ -3584,9 +3583,6 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 	hotkey_poll_setup_safe(true);
 
 	return 0;
-
-err_exit:
-	return (res < 0) ? res : -ENODEV;
 }
 
 /* Thinkpad X1 Carbon support 5 modes including Home mode, Web browser
-- 
2.31.1


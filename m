Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08856C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon,  7 Mar 2022 22:09:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238994AbiCGWKc (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 7 Mar 2022 17:10:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238966AbiCGWKc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 7 Mar 2022 17:10:32 -0500
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com [IPv6:2607:f8b0:4864:20::c2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0E1B49FBF
        for <platform-driver-x86@vger.kernel.org>; Mon,  7 Mar 2022 14:09:36 -0800 (PST)
Received: by mail-oo1-xc2e.google.com with SMTP id 6-20020a4a0906000000b0031d7eb98d31so19654741ooa.10
        for <platform-driver-x86@vger.kernel.org>; Mon, 07 Mar 2022 14:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=r0w9iy6ltdJEIPiWyBM76LsklLYjFjkl5UdOe3VckJc=;
        b=iP0Q5Sj8O0dj7SQkzn0eIsh9kNeqpgvfknDdMlBf+HxOfG9HUi3p1othjp2hT0IXdf
         pm5VXSaJ0BCxZpHafnxMbT6QbkbXiNQhMDyyXtl3CCFNYmGaU4vuYBHgLa4afxvV7wev
         IA+ggFmLFmy2NPE8GaGlEd4o+UR+N8xtkJLkKxbUokFG0QLpeXds7VEPlGHWe76SLUNL
         Cy+FvszdW5iCC2f61lB4tMygxkandFwSNJ69wt2XoZmhxCaqIrSbYOn1ukP4pOoRiNu4
         sES4UvLnjjiGaF/JyCU5pkxuuhZ/SLghX/SmUDuDRu9hn7Fw6sv/Iomh5RUjcAdxrr7a
         WL0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r0w9iy6ltdJEIPiWyBM76LsklLYjFjkl5UdOe3VckJc=;
        b=67h2QH+PQVZReI18fPkImoqabV2uSSfuPS3dVjRcyRgLSoR8veM1JsR6IhCyACtnL0
         Cn/93VHqJhOFRfvOunhQWS2m9NovkvHtIHWOQuvyw0PBhlBu/zwew8hqBxdO2NNzHBMd
         7P7Fhp7tPHoVyORR2zGTOhCqKYFWoRDVkSZwYkxbLfmp7KbEK5LbH61VcCE8E9b2NMm9
         WbUp9HnbBXGnoLNrdBZhUT8l7BVDAacLh3Bduc0DYKpYePMRF/9dZOcdiYuHXxxPVxSr
         24jEMlyeBqGMKrWiqOtK7ZJUgInLrz5UqwGAq15SYYoairAuJAb+e1FcKsaPid3IZctT
         I5jw==
X-Gm-Message-State: AOAM533pHe5pt7/Y24YOUDoPx5s+FqmZlSeUtFZhq+2rh4r2cz7rNDw8
        rWIm28s0ha5jIR6bwEi2okXfx7P+aoA=
X-Google-Smtp-Source: ABdhPJwViWEsdMn/WdpBUcBn0FR6MYPUmyaQJkvhy9iFVX0QMnxivcNroYMtsNdvBFDobx2+kHepDA==
X-Received: by 2002:a05:6870:ac26:b0:d9:de72:e989 with SMTP id kw38-20020a056870ac2600b000d9de72e989mr650434oab.64.1646690975769;
        Mon, 07 Mar 2022 14:09:35 -0800 (PST)
Received: from grumpy-vm.hsd1.tx.comcast.net ([2601:2c3:480:7390:c8fd:9e42:5ced:850e])
        by smtp.gmail.com with ESMTPSA id z25-20020a056808065900b002d97bda386esm6892644oih.51.2022.03.07.14.09.34
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 14:09:35 -0800 (PST)
From:   Jorge Lopez <jorgealtxwork@gmail.com>
X-Google-Original-From: Jorge Lopez <jorge.lopez2@hp.com>
To:     platform-driver-x86@vger.kernel.org
Subject: [PATCH v4 3/3] Changing bios_args.data to be dynamically allocated
Date:   Mon,  7 Mar 2022 16:09:32 -0600
Message-Id: <20220307220932.23607-4-jorge.lopez2@hp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220307220932.23607-1-jorge.lopez2@hp.com>
References: <20220307220932.23607-1-jorge.lopez2@hp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The purpose of this patch is to remove 128 bytes buffer limitation
imposed in bios_args structure.

A limiting factor discovered during this investigation was the struct
bios_args.data size restriction.  The data member size limits all possible
WMI commands to those requiring buffer size of 128 bytes or less.
Several WMI commands and queries require a buffer size larger than 128
bytes hence limiting current and feature supported by the driver.
It is for this reason, struct bios_args.data changed and is dynamically
allocated.  hp_wmi_perform_query function changed to handle the memory
allocation and release of any required buffer size.

All changes were validated on a HP ZBook Workstation notebook,
HP EliteBook x360, and HP EliteBook 850 G8.  Additional
validation was included in the test process to ensure no other
commands were incorrectly handled.

Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>

---
Based on the latest platform-drivers-x86.git/for-next
---
 drivers/platform/x86/hp-wmi.c | 59 ++++++++++++++++++++++-------------
 1 file changed, 38 insertions(+), 21 deletions(-)

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index a0aba7db8a1c..a04723fdea60 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -82,12 +82,17 @@ enum hp_wmi_event_ids {
 	HPWMI_BATTERY_CHARGE_PERIOD	= 0x10,
 };
 
+/**
+ * struct bios_args buffer is dynamically allocated.  New WMI command types
+ * were introduced that exceeds 128-byte data size.  Changes to handle
+ * the data size allocation scheme were kept in hp_wmi_perform_qurey function.
+ */
 struct bios_args {
 	u32 signature;
 	u32 command;
 	u32 commandtype;
 	u32 datasize;
-	u8 data[128];
+	u8 data[0];
 };
 
 enum hp_wmi_commandtype {
@@ -268,34 +273,39 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
 	int mid;
 	struct bios_return *bios_return;
 	int actual_outsize;
-	union acpi_object *obj;
-	struct bios_args args = {
-		.signature = 0x55434553,
-		.command = command,
-		.commandtype = query,
-		.datasize = insize,
-		.data = { 0 },
-	};
-	struct acpi_buffer input = { sizeof(struct bios_args), &args };
+	union acpi_object *obj = NULL;
+	size_t bios_args_size = sizeof(struct bios_args) + insize;
+	struct bios_args *args = NULL;
+	struct acpi_buffer input;
 	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
 	int ret = 0;
 
-	mid = encode_outsize_for_pvsz(outsize);
-	if (WARN_ON(mid < 0))
-		return mid;
+	args = kmalloc(bios_args_size, GFP_KERNEL);
+	if (!args)
+		return -ENOMEM;
 
-	if (WARN_ON(insize > sizeof(args.data)))
-		return -EINVAL;
-	memcpy(&args.data[0], buffer, insize);
+	input.length = bios_args_size;
+	input.pointer = args;
 
-	wmi_evaluate_method(HPWMI_BIOS_GUID, 0, mid, &input, &output);
+	mid = encode_outsize_for_pvsz(outsize);
+	if (WARN_ON(mid < 0)) {
+		ret = mid;
+		goto out_free;
+	}
 
-	obj = output.pointer;
+	memcpy(args->data, buffer, insize);
 
-	if (!obj)
-		return -EINVAL;
+	args->signature = 0x55434553;
+	args->command = command;
+	args->commandtype = query;
+	args->datasize = insize;
 
-	if (obj->type != ACPI_TYPE_BUFFER) {
+	ret = wmi_evaluate_method(HPWMI_BIOS_GUID, 0, mid, &input, &output);
+	if (ret)
+		goto out_free;
+
+	obj = output.pointer;
+	if (!obj) {
 		ret = -EINVAL;
 		goto out_free;
 	}
@@ -310,6 +320,12 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
 		goto out_free;
 	}
 
+	if (obj->type != ACPI_TYPE_BUFFER) {
+		pr_warn("query 0x%x returned an invalid object 0x%x\n", query, ret);
+		ret = -EINVAL;
+		goto out_free;
+	}
+
 	/* Ignore output data of zero size */
 	if (!outsize)
 		goto out_free;
@@ -320,6 +336,7 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
 
 out_free:
 	kfree(obj);
+	kfree(args);
 	return ret;
 }
 
-- 
2.25.1


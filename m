Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09C7FC433EF
	for <platform-driver-x86@archiver.kernel.org>; Fri,  4 Mar 2022 20:33:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229641AbiCDUeP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 4 Mar 2022 15:34:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230177AbiCDUcd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 4 Mar 2022 15:32:33 -0500
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3C2E1E745E
        for <platform-driver-x86@vger.kernel.org>; Fri,  4 Mar 2022 12:31:35 -0800 (PST)
Received: by mail-qk1-x736.google.com with SMTP id 185so7397737qkh.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 04 Mar 2022 12:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=P+dj1OE6cszYcWyWwPfzXXeiPtA9PrXWU9gSaPAos2o=;
        b=o0NlPAsJ6EeDr/sjT0U3wCXzkTkZ4t/tITNLb/P9SphdOzcXty+Jd30Fi7BO3KnycU
         PqeqPW0uECctunRHoDUcgyhA9++9PD1Zg7ePc24T3yH+9KMOz1w9PoBb88CQdYkxcp6n
         ZgxYLT0+wqxxKaxINwJu08kOp7uIPn9Gkuk+iDb0HUYfEMNJ8CYN1uUxWhNqgFYidR1j
         RJjDLIe6+MbOHk0OstARTojt9Mg8eO6d85ixDzyv2+eI6hUfH1TKnvcgG1R5213t+aB/
         XWRZEcg7Ivm9PX+ly2aM0kLs9cHOMSHCZGSEN3iWhQhuJUEXToHeIFAN2zczP0Ecnkkk
         ELRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P+dj1OE6cszYcWyWwPfzXXeiPtA9PrXWU9gSaPAos2o=;
        b=OYuQl1GL37UDiDVmdeJJLlikbB8Pk4V5OlgSslLW6oHqBEw4mooFBtDyy9tfML8kXA
         x0TuUdY8GqVwys4bDBARrjHu2Hbq42Fw4Tz9/E6A8gggc0Tu33l4xFyrMwH3yVvOVIR8
         WMAZov8MSJ1lLsg8GHNnhqL1eTQnX0TC4iTCRKvHKLVrT8j4kA2fcf0hnKYm+bI2m8LT
         yyFIAM5r+dQyXA0YWRbDF/sWNLVUJpqCxNCangelzS7jX2PcS7A2qMsd2iVwUQycvNis
         aFl/YnIzjPGyHBUwVvdHxyADgXnpgywYGoOBrujgXR6fBvEsllLp9OnjwvlmqcEcKWI6
         HOvA==
X-Gm-Message-State: AOAM5301BPlmH2/aB+ey/NlMFrHdwh6T2OUI6+yE/DN22Cy5RZPZnhrl
        7NoCWzljffB1JfL3H//Uck1U27bu/Yw=
X-Google-Smtp-Source: ABdhPJxtZNnteDLm/YlbH7HEjlCK3JnhI8Qmdbu233Dm3dT1p91CnLVzr5ghAWi7098v6QYPA6QmJw==
X-Received: by 2002:a37:755:0:b0:60d:d47b:aaa1 with SMTP id 82-20020a370755000000b0060dd47baaa1mr274747qkh.688.1646425894485;
        Fri, 04 Mar 2022 12:31:34 -0800 (PST)
Received: from grumpy-vm.hsd1.tx.comcast.net ([2601:2c3:480:7390:27a2:529c:40d3:26aa])
        by smtp.gmail.com with ESMTPSA id de18-20020a05620a371200b00662cf4b5631sm2974513qkb.23.2022.03.04.12.31.33
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 12:31:34 -0800 (PST)
From:   Jorge Lopez <jorgealtxwork@gmail.com>
X-Google-Original-From: Jorge Lopez <jorge.lopez2@hp.com>
To:     platform-driver-x86@vger.kernel.org
Subject: [PATCH v3 3/3] Changing bios_args.data to be dynamically allocated
Date:   Fri,  4 Mar 2022 14:31:30 -0600
Message-Id: <20220304203130.43150-4-jorge.lopez2@hp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220304203130.43150-1-jorge.lopez2@hp.com>
References: <20220304203130.43150-1-jorge.lopez2@hp.com>
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
index ecf2a3a8ed78..95a95535aea0 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -86,12 +86,17 @@ enum hp_wmi_event_ids {
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
@@ -259,34 +264,39 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
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
@@ -301,6 +311,12 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
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
@@ -311,6 +327,7 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
 
 out_free:
 	kfree(obj);
+	kfree(args);
 	return ret;
 }
 
-- 
2.25.1


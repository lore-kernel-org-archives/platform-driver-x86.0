Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6788FC433FE
	for <platform-driver-x86@archiver.kernel.org>; Fri, 18 Feb 2022 16:09:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236768AbiBRQJ3 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 18 Feb 2022 11:09:29 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:47652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237444AbiBRQJ2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 18 Feb 2022 11:09:28 -0500
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFB071598DC
        for <platform-driver-x86@vger.kernel.org>; Fri, 18 Feb 2022 08:09:11 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id x193so3626920oix.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 18 Feb 2022 08:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=l7qvE6blMW3DwGcVzWdqev+E/lm6oLMrypITz0NdxYo=;
        b=C91cv7frTIP/+cj2+hoVEn3YxQFDPTQO78K+dylkxxs75vArYroXphhvEHmuR4/pF/
         B4zPPCXG5q2s1NoiQiVKFJTyBKONHJYOrblTGPTyDIn7ojLVWtLr6h9cC5ALpYny4a9Z
         +DQ/2p6wXB09ifNvwa4ExO0W9uWMnynhlAJ65+cMEUeydnDIcbtY9aObFrUIwrcYZQLj
         i3LwsvfiOpjyFNYqY7MSPruWAnBff/1ng5y/A3LtX5Jm9cZMuz2Xm4GtGMjCmIpMPXoX
         8lgUfSVZ+dHD9AmUjTytKqXFmm8Jva7fyxnNm5GUHZh2IIMObxW83NNuYRjuqCzCvEf6
         6u/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l7qvE6blMW3DwGcVzWdqev+E/lm6oLMrypITz0NdxYo=;
        b=WySINOb0GUTwECsXHK3HPYCMtrnV4zQKjKd34TILTgwKRJNMkfFqb/VQ4Rpmp2Ia1y
         r9tWlQvQxN2yCksQ5j0c/GfVp2OLRvoCoiu2q7tB7TA0m1UlBQwKmYcA71BW6dRN8VSp
         AYLmuFsTaS5pB3z0YNPlszdbUV/48oqJBs3FULIUVBI2B+g0uVbmLZfGdjov5ysPfeZo
         ImCHXs4YGT4Dm2g4vC4x0YkQUB+t4JLHIwL9wlGqTPdSSEW3HZEEg8jG0ctQ9TpUnkl/
         mGrdrPYWpTAbCX+NpggDtZJUBpJIo015rfAG0Hd4sL4le3XX7FPqXEjN0fq7OnUkqOd4
         fpPw==
X-Gm-Message-State: AOAM5302G7D3YMxTx7VPSZz2vLiSPBUwtiXezrFl1KM9XeURVkaCa1kE
        qVPWLKDtIVxdBWalJjUWwE+8d1IGg8E=
X-Google-Smtp-Source: ABdhPJzWUyk+9O/DTwCvyarH+SQ75S1FjC4tIav/5GHDbi+KNuH/jr4Id48GsTGtm5mAMJz5QULujQ==
X-Received: by 2002:a05:6808:300b:b0:2d0:a492:e489 with SMTP id ay11-20020a056808300b00b002d0a492e489mr5149738oib.171.1645200550955;
        Fri, 18 Feb 2022 08:09:10 -0800 (PST)
Received: from grumpy-vm.hsd1.tx.comcast.net ([2601:2c3:480:7390:e8f4:b8ac:759b:cd87])
        by smtp.gmail.com with ESMTPSA id l1sm1648021otd.18.2022.02.18.08.09.10
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 08:09:10 -0800 (PST)
From:   Jorge Lopez <jorgealtxwork@gmail.com>
X-Google-Original-From: Jorge Lopez <jorge.lopez2@hp.com>
To:     platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 3/3] Changing bios_args.data to be dynamically allocated
Date:   Fri, 18 Feb 2022 10:09:07 -0600
Message-Id: <20220218160907.3422-4-jorge.lopez2@hp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220218160907.3422-1-jorge.lopez2@hp.com>
References: <20220218160907.3422-1-jorge.lopez2@hp.com>
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

All changes were validated on a ZBook Workstation notebook. Additional
validation was included to ensure no other commands were failing or
incorrectly handled.

Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>

---
Based on the latest platform-drivers-x86.git/for-next
---
 drivers/platform/x86/hp-wmi.c | 67 +++++++++++++++++++++++------------
 1 file changed, 44 insertions(+), 23 deletions(-)

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index de715687021a..11c8e9b6e64a 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -83,12 +83,17 @@ enum hp_wmi_event_ids {
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
@@ -258,39 +263,47 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
 	struct bios_return *bios_return;
 	int actual_outsize;
 	union acpi_object *obj;
-	struct bios_args args = {
-		.signature = 0x55434553,
-		.command = command,
-		.commandtype = query,
-		.datasize = insize,
-		.data = { 0 },
-	};
-	struct acpi_buffer input = { sizeof(struct bios_args), &args };
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
+		goto in_free;
+	}
 
-	obj = output.pointer;
+	/* Avoid unnecessary copy to the data buffer if input buffer size is zero */
+	if (insize > 0)
+		memcpy(args->data, buffer, insize);
 
-	if (!obj)
-		return -EINVAL;
+	args->signature = 0x55434553;
+	args->command = command;
+	args->commandtype = query;
+	args->datasize = insize;
 
-	if (obj->type != ACPI_TYPE_BUFFER) {
+	ret = wmi_evaluate_method(HPWMI_BIOS_GUID, 0, mid, &input, &output);
+
+	obj = output.pointer;
+	if (!obj) {
+		pr_warn("query 0x%x returned a null obj 0x%x\n", query, ret);
 		ret = -EINVAL;
-		goto out_free;
+		goto in_free;
 	}
 
-	bios_return = (struct bios_return *)obj->buffer.pointer;
-	ret = bios_return->return_code;
+	if (!ret && obj->type == ACPI_TYPE_BUFFER) {
+		bios_return = (struct bios_return *)obj->buffer.pointer;
+		ret = bios_return->return_code;
+	}
 
 	if (ret) {
 		if (ret != HPWMI_RET_UNKNOWN_COMMAND &&
@@ -299,6 +312,12 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
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
@@ -309,6 +328,8 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
 
 out_free:
 	kfree(obj);
+in_free:
+	kfree(args);
 	return ret;
 }
 
-- 
2.25.1


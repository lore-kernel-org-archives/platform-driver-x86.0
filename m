Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F0F0C4332F
	for <platform-driver-x86@archiver.kernel.org>; Thu, 10 Mar 2022 21:09:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343894AbiCJVKB (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 10 Mar 2022 16:10:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343889AbiCJVKA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 10 Mar 2022 16:10:00 -0500
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2B184DF62
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Mar 2022 13:08:58 -0800 (PST)
Received: by mail-qk1-x72f.google.com with SMTP id r127so5467696qke.13
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Mar 2022 13:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=lKko2zVjvFLxheKUr9P/i/K6RQQt+T5e5d08DGe2Z24=;
        b=ET4f7079R32BGXGYt43glhtAJhUVPVdkb4yprXlpvy6+MqJezjqYs45sw23S2M/tm/
         fR0bIrO3RM+OTTzsUQWcZqKROqr/28pVUfpD+0GLxdPMoPb/wLj62C3w3BQVoV456gFZ
         PNDOScXOdlN11jKv6n6WPObkGbZ/CIFsOrCoFR78T2XjSbItIJc63KgT0kxvm3f2hC4v
         zFRYfKFZBiQHdMdtaK+hn3VTwuXQWzkh3/CPnIKtnr4RG3UN6MgYiLVoNWrOcMrANalu
         ln6pZyIaX+ageF7L9oFiP07D0xnJjRelbyXC6fX3aWgJSHSRL8iCRMBvKEw8y2agua7x
         mbtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lKko2zVjvFLxheKUr9P/i/K6RQQt+T5e5d08DGe2Z24=;
        b=qCKyR/Gox2bbQOz1H6kjL2Cs00y9gG/MxQuGubIUjmAcc44z0yEC4jPCMC0lRYlWsv
         htpBYmNSCoHIZIut3m2EfyH3Y78sUte/Sr/BXeV5qGETLHFGFA8qiq0rzhC4sHmPV0yW
         4d9W54nFXVOfvQ9EYagK2K2P08j3EFyjxCoX4n8Xv8zl4TLoL9OI+MTQROwafIEQABzp
         6pXiPz4pQgFfdpkzvaMp4MlNXHb+XjT9U/iZuAQBG3Be3I5FZWszIkH0UDIV6mCfADlK
         twkpiAugXnl0PxSdEwPN9pMTCaCQD/iX4TyDS7ba3bFV5sWU3TJuTlnnduqqRwwddrbf
         rsKA==
X-Gm-Message-State: AOAM530vtd1WCF4s/QoygxrHhnjsPuEK/fRuOROo3jrUpIcZKIhWOc4i
        i9UeRYd/hg6uhmFPGcWT488pHhdCXaA=
X-Google-Smtp-Source: ABdhPJzJY/helysDLJUAEfiDC2s+evLdi3dwZaGy5uyjPO5CEHHSNGpYhbtPH97DUKRtBbq8T9lrUA==
X-Received: by 2002:a37:c85:0:b0:67b:30aa:b09c with SMTP id 127-20020a370c85000000b0067b30aab09cmr4415834qkm.283.1646946537783;
        Thu, 10 Mar 2022 13:08:57 -0800 (PST)
Received: from grumpy-vm.hsd1.tx.comcast.net ([2601:2c3:480:7390:c0b0:4de4:5b27:f2e7])
        by smtp.gmail.com with ESMTPSA id k6-20020a378806000000b0064915d9584fsm2881727qkd.8.2022.03.10.13.08.57
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Mar 2022 13:08:57 -0800 (PST)
From:   Jorge Lopez <jorgealtxwork@gmail.com>
X-Google-Original-From: Jorge Lopez <jorge.lopez2@hp.com>
To:     platform-driver-x86@vger.kernel.org
Subject: [PATCH v5 4/4] Changing bios_args.data to be dynamically allocated
Date:   Thu, 10 Mar 2022 15:08:53 -0600
Message-Id: <20220310210853.28367-5-jorge.lopez2@hp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220310210853.28367-1-jorge.lopez2@hp.com>
References: <20220310210853.28367-1-jorge.lopez2@hp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The purpose of this patch is to remove 128 bytes buffer limitation
imposed in bios_args structure.

A limiting factor discovered during this investigation was the struct
bios_args.data size restriction.  The data member size limits all
possible WMI commands to those requiring buffer size of 128 bytes or
less. Several WMI commands and queries require a buffer size larger
than 128 bytes hence limiting current and feature supported by the
driver. It is for this reason, struct bios_args.data changed and is
dynamically allocated.  hp_wmi_perform_query function changed to
handle the memory allocation and release of any required buffer size.

All changes were validated on a HP ZBook Workstation notebook,
HP EliteBook x360, and HP EliteBook 850 G8.  Additional
validation was included in the test process to ensure no other
commands were incorrectly handled.

Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>

---
Based on the latest platform-drivers-x86.git/for-next
---
 drivers/platform/x86/hp-wmi.c | 64 +++++++++++++++++++++++------------
 1 file changed, 42 insertions(+), 22 deletions(-)

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index e76bd4bef6b5..cc5c4f637328 100644
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
+	u8 data[];
 };
 
 enum hp_wmi_commandtype {
@@ -268,34 +273,40 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
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
+	struct bios_args *args = NULL;
+	size_t bios_args_size = struct_size(args, data, insize);
+	
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
+	memcpy(args->data, buffer, flex_array_size(args, data, insize));
 
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
@@ -310,9 +321,17 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
 		goto out_free;
 	}
 
+	if (obj->type != ACPI_TYPE_BUFFER) {
+		pr_warn("query 0x%x returned an invalid object 0x%x\n", query, ret);
+		ret = -EINVAL;
+		goto out_free;
+	}
+
 	/* Ignore output data of zero size */
-	if (!outsize)
+	if (!outsize) {
+		ret = 0;
 		goto out_free;
+	}
 
 	actual_outsize = min(outsize, (int)(obj->buffer.length - sizeof(*bios_return)));
 	memcpy(buffer, obj->buffer.pointer + sizeof(*bios_return), actual_outsize);
@@ -320,6 +339,7 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
 
 out_free:
 	kfree(obj);
+	kfree(args);
 	return ret;
 }
 
-- 
2.25.1


Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D918EC43334
	for <platform-driver-x86@archiver.kernel.org>; Wed,  8 Jun 2022 01:31:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356853AbiFHBbF (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 7 Jun 2022 21:31:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1389692AbiFHB2x (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 7 Jun 2022 21:28:53 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A35BA30D915
        for <platform-driver-x86@vger.kernel.org>; Tue,  7 Jun 2022 13:43:15 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id w16so15611154oie.5
        for <platform-driver-x86@vger.kernel.org>; Tue, 07 Jun 2022 13:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EjwV2W94o8gcJXSCbcVxSj8joAYvl6gC9y3qsKhwzXk=;
        b=e9Qjos6qJj1vQE+TFifVKPPU4Q3sngoBncMy3lu1Bg1NCAkXfsEy3Ojt8WKyML5wiK
         3JwbrWozbBKpYXuyaugBUbEjWpjpUEEJdOvVBx6nF03BHlNF9M2hWVUhjCuYQG8GuReo
         CnDbWcY/IZw/1ejZJbWaT9j/IgWh9LggTDTAIhSBnwlnWc69iTYvXmKOj++4lwQRuReC
         woIdoyprC5+ZQIvz/SKYgohGDuXD152677yxyqeFHqVQAPBfHRoeCJVlVcYgHGp2yJj0
         Malitv//TWc3XOTTnVBoI0bKczdc0tPo7qlEoCPfh5BWXx5HaP9fTZ8SdZwmKYBo6sRY
         o51w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EjwV2W94o8gcJXSCbcVxSj8joAYvl6gC9y3qsKhwzXk=;
        b=5kX5sO/9m26w2gY4O5M5ANykuoggUGc8n17/JBNAP/jTs5TQwMSTXHtUpxLTVjuGvi
         Q2pYK/ZMSRGnvmMZTmK+LEaj1jvNe81tQKM9mindUqD69WhmvnOFWhn0Os1kiu4a64nB
         eltdSBZueDxSu9wg6f5IpDTcYDUaMZvndmUjdcJWNtOzAEkTctXHiyywRD4SGOZ+Upd7
         l56+nkg1y3CkPNqtlu9reCuqPgnjP+ktoOYUQrXfxo/TvxYvE7Yd2o7hUnKtd3hRF5y9
         9aMJWnRqvzCpGQ1cLkf/egpMtTN4PFTwcxBl9/Q0sSrNcxEchmHH8W6FTtR/8U26w70M
         stkQ==
X-Gm-Message-State: AOAM533zwGhqh6TayyyWEyvrclFq3bgQbHd0dzN4zw4yaAknIkYjixw7
        Uz77EOXyklZf6YUVJgA0DgjKvGiObPM=
X-Google-Smtp-Source: ABdhPJypqnX2GJ5PMbbkP7c6jNf0S/E7LYFqcBziem83LpyeVvGndKqypXR8zkca5O3Oh52Amx4Ayw==
X-Received: by 2002:a05:6808:1919:b0:32e:6d83:d72 with SMTP id bf25-20020a056808191900b0032e6d830d72mr465477oib.13.1654634594791;
        Tue, 07 Jun 2022 13:43:14 -0700 (PDT)
Received: from grumpy-vm.hsd1.tx.comcast.net ([2601:2c3:480:7390:5209:73c:4f88:a572])
        by smtp.gmail.com with ESMTPSA id nd24-20020a056871441800b000f44c6041e1sm8595962oab.50.2022.06.07.13.43.13
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 13:43:14 -0700 (PDT)
From:   Jorge Lopez <jorgealtxwork@gmail.com>
X-Google-Original-From: Jorge Lopez <jorge.lopez2@hp.com>
To:     platform-driver-x86@vger.kernel.org
Subject: [PATCH] Resolve WMI query failures on some devices
Date:   Tue,  7 Jun 2022 15:43:13 -0500
Message-Id: <20220607204313.5374-1-jorge.lopez2@hp.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

WMI queries fail on some devices where the ACPI method HWMC
unconditionally attempts to create Fields beyond the buffer
if the buffer is too small, this breaks essential features
such as power profiles:

         CreateByteField (Arg1, 0x10, D008)
         CreateByteField (Arg1, 0x11, D009)
         CreateByteField (Arg1, 0x12, D010)
         CreateDWordField (Arg1, 0x10, D032)
         CreateField (Arg1, 0x80, 0x0400, D128)

In cases where args->data had zero length, ACPI BIOS Error
(bug): AE_AML_BUFFER_LIMIT, Field [D008] at bit
offset/length 128/8 exceeds size of target Buffer (128 bits)
(20211217/dsopcode-198) was obtained.

ACPI BIOS Error (bug): AE_AML_BUFFER_LIMIT, Field [D009] at bit
offset/length 136/8 exceeds size of target Buffer (136bits)
(20211217/dsopcode-198)

The original code created a buffer size of 128 bytes regardless if
the WMI call required a smaller buffer or not.  This particular
behavior occurs in older BIOS and reproduced in OMEN laptops.  Newer
BIOS handles buffer sizes properly and meets the latest specification
requirements.  This is the reason why testing with a dynamically
allocated buffer did not uncover any failures with the test systems at
hand.

This patch was tested on several OMEN, Elite, and Zbooks.  It was
confirmed the patch resolves HPWMI_FAN GET/SET calls in an OMEN
Laptop 15-ek0xxx.  No problems were reported when testing on several Elite
and Zbooks notebooks.

Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>

---
Based on the latest platform-drivers-x86.git/for-next
---
 drivers/platform/x86/hp-wmi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index 0e9a25b56e0e..7bcfa07cc6ab 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -292,12 +292,14 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
 	struct bios_args *args = NULL;
 	int mid, actual_outsize, ret;
 	size_t bios_args_size;
+	int actual_insize;
 
 	mid = encode_outsize_for_pvsz(outsize);
 	if (WARN_ON(mid < 0))
 		return mid;
 
-	bios_args_size = struct_size(args, data, insize);
+	actual_insize = max(insize, 128);
+	bios_args_size = struct_size(args, data, actual_insize);
 	args = kmalloc(bios_args_size, GFP_KERNEL);
 	if (!args)
 		return -ENOMEM;
-- 
2.25.1


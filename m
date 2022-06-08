Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B439C43334
	for <platform-driver-x86@archiver.kernel.org>; Wed,  8 Jun 2022 17:16:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230361AbiFHRQd (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 8 Jun 2022 13:16:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230470AbiFHRQW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Jun 2022 13:16:22 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BCAE2A1D53
        for <platform-driver-x86@vger.kernel.org>; Wed,  8 Jun 2022 10:03:06 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id l9-20020a056830268900b006054381dd35so15534783otu.4
        for <platform-driver-x86@vger.kernel.org>; Wed, 08 Jun 2022 10:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=EjwV2W94o8gcJXSCbcVxSj8joAYvl6gC9y3qsKhwzXk=;
        b=QGvPb5YhGtbULEekIN5fnNkBOXx92uvKGLGf3bdF5W1TAQs+lxN8O/NaMBYmphw3kC
         pYi/GXkSZrxCnImyrbvH5MK+pNF+YO0VmmSoAjETwIihUq+teOhKbvxZrszhMlSre4mJ
         ggKq2nOl0Kb+L43yl6s6EQ8X8w2YkHhdazv6ZrlpVyDGn8aQI2T1YC3PSicTZJCynuk1
         G+Y/kRGEXO5xrs06U0M0usSnquk+KxswHcfD+1ybhOShWVQnD2+is0KeKZQ/rhNX5mCw
         DH1S8wc3zJ7TWl0YTCgGHHhnryOPepOzfNehXZd5nW4LeyWVUA1MtX3XD8xoH1FpeR3G
         m/Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EjwV2W94o8gcJXSCbcVxSj8joAYvl6gC9y3qsKhwzXk=;
        b=bLo2aqiNO+wiz7YZ1OxeYDXx578sfLN0QylHcZOCcA9IK/CzX7+jpAfWk8fh+DAo2i
         ro4YMizTs0lfiqYS+VCXRKNeCFvLweWde8FhWQQQe5qjHkEH3uAQO7Z4qHK5+SlyMPeL
         p3H4r/6j+dpXsG7KQAqt6xd6Fck/W7LRzrUy9WWWVn7TzfNnk/+w/gnjXZig4Jz+jRzl
         LrnmXJpohaNueKLd/vtjbPCCFCifdeALk+wSgXzFSBkL7D8ivZVyd6jNU9rt32Koa4dP
         bPSr+i96wt5BbUErKJM3TJEUajwgGILShkSOQ1YsSQib6miCTaxoWpqpMa/bLk01PGTg
         qr+A==
X-Gm-Message-State: AOAM530QCevmEd1NYFh+ECTIz0hbQykPEyPx0amJPnMR1muB2HtlKoZJ
        lYIbf/iFZncFEHA6eAkN2iIMUsOwhSw=
X-Google-Smtp-Source: ABdhPJwYkT/d7V+RxDBEZGPIzgABUiEdZ76eH1nuoFh2aZHla9zA6hRV39sSrbHhmQQr67NI8WN29Q==
X-Received: by 2002:a05:6830:33cf:b0:5af:4018:fc2a with SMTP id q15-20020a05683033cf00b005af4018fc2amr14785476ott.161.1654707785676;
        Wed, 08 Jun 2022 10:03:05 -0700 (PDT)
Received: from grumpy-vm.hsd1.tx.comcast.net ([2601:2c3:480:7390:e5f7:48da:3306:a654])
        by smtp.gmail.com with ESMTPSA id g24-20020a544f98000000b00325cda1ffb4sm11411196oiy.51.2022.06.08.10.02.48
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 10:02:55 -0700 (PDT)
From:   Jorge Lopez <jorgealtxwork@gmail.com>
X-Google-Original-From: Jorge Lopez <jorge.lopez2@hp.com>
To:     platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 1/2] Resolve WMI query failures on some devices
Date:   Wed,  8 Jun 2022 12:02:19 -0500
Message-Id: <20220608170220.5751-2-jorge.lopez2@hp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220608170220.5751-1-jorge.lopez2@hp.com>
References: <20220608170220.5751-1-jorge.lopez2@hp.com>
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


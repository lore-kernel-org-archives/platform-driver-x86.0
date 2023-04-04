Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40FA2C761A6
	for <platform-driver-x86@archiver.kernel.org>; Tue,  4 Apr 2023 18:21:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235935AbjDDSV1 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 4 Apr 2023 14:21:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236297AbjDDSVH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 4 Apr 2023 14:21:07 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FB6C46BF
        for <platform-driver-x86@vger.kernel.org>; Tue,  4 Apr 2023 11:21:01 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id n14so16277948plc.8
        for <platform-driver-x86@vger.kernel.org>; Tue, 04 Apr 2023 11:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680632461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DdBAV21+tEDurt/JvTaHJyUQ0LBM5nBDKYeMtin7GIs=;
        b=MX30zIpzC4L+H3vLtz3ly3GSsB3XwuvpMQpmEupPQ85QZVU8HRpoYlIf3wBZNQKKLD
         VtbAaOHFd13vmPsqb8jFR5LHfURvqMEP4PmA952ogWkFFfdnVfA6YrYXGpbue16V0vz2
         wzM4ZbBEVPBt9Hfsf9CnBQoG/TblQOmhq56mLVUSCQGP5RHhy/qlytMlTEr8MhtER2mp
         ep3IM4xNIUVffLhgHfWRXOI6Sdbay9+pGr84nAbg1Szv5728VCO39Ewtymzy8/qMQ/Vj
         +CXTYu46xi73R7egRio2zBf/pxKsdmHgApX/2r5Q29nuT1f3Vx5xSeoQlA9ll5cHiE2e
         OURA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680632461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DdBAV21+tEDurt/JvTaHJyUQ0LBM5nBDKYeMtin7GIs=;
        b=VIMk15ZCmIXMz6eqazZ42IST9ftKujxqXOKlsEdAXOv9sK9D6x/jCCbqG+oUaEKhUU
         3LI6U9/7sR6iQH/0uuc36da6y7nSPFAWGSka6MqBHQKddqgCmG6WmCDF2CJyxg+fYKm3
         8Qv7PCf/daBN6CW0/FUx8zDE2RE4vRIr+39dMOfZSttXhGqMDf/7YHRz0Jk2XfzweZ4i
         AOBsVpBUE+P3OIiuzv+UontztlwF4oyKiHqwVo+ytQSbqXTuBWlrsiwu/dEfAeMhIq2j
         CxurqXFX4sk5UJzInzjXB7Gq5IhDX0sSFBsiQgWQoYc4cFDjcPhuA463soCqVcaTxeLA
         K8OQ==
X-Gm-Message-State: AAQBX9e1oGqMx5LAIPyIv4V6qvrN/99sQe1HPI5As4UV5Tn3/xP/CuHW
        aVA/ObCW7B+5GPOEkYhWUenpSQ==
X-Google-Smtp-Source: AKy350ZMHM/cKvyT+rOOWpftInPEoGFfEdxrUaZ3Pg6Dhz7B1J2sE85PLnSoaYL4fu4p8GglqFgtxg==
X-Received: by 2002:a05:6a20:4c9f:b0:d9:ecba:b9fc with SMTP id fq31-20020a056a204c9f00b000d9ecbab9fcmr2623263pzb.54.1680632461193;
        Tue, 04 Apr 2023 11:21:01 -0700 (PDT)
Received: from localhost.localdomain ([106.51.184.50])
        by smtp.gmail.com with ESMTPSA id o12-20020a056a001bcc00b0062dcf5c01f9sm9018524pfw.36.2023.04.04.11.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 11:21:00 -0700 (PDT)
From:   Sunil V L <sunilvl@ventanamicro.com>
To:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
        linux-crypto@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        llvm@lists.linux.dev
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Len Brown <lenb@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Weili Qian <qianweili@huawei.com>,
        Zhou Wang <wangzhou1@hisilicon.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Marc Zyngier <maz@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH V4 02/23] ACPICA: MADT: Add RISC-V INTC interrupt controller
Date:   Tue,  4 Apr 2023 23:50:16 +0530
Message-Id: <20230404182037.863533-3-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230404182037.863533-1-sunilvl@ventanamicro.com>
References: <20230404182037.863533-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

ACPICA commit bd6d1ae1e13abe78e149c8b61b4bc7bc7feab015

The ECR to add RISC-V INTC interrupt controller is approved by
the UEFI forum and will be available in the next revision of
the ACPI specification.

Link: https://github.com/acpica/acpica/commit/bd6d1ae1
Reference: Mantis ID: 2348
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 include/acpi/actbl2.h | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/include/acpi/actbl2.h b/include/acpi/actbl2.h
index b2973dbe37ee..c432fd15db65 100644
--- a/include/acpi/actbl2.h
+++ b/include/acpi/actbl2.h
@@ -891,7 +891,8 @@ enum acpi_madt_type {
 	ACPI_MADT_TYPE_MSI_PIC = 21,
 	ACPI_MADT_TYPE_BIO_PIC = 22,
 	ACPI_MADT_TYPE_LPC_PIC = 23,
-	ACPI_MADT_TYPE_RESERVED = 24,	/* 24 to 0x7F are reserved */
+	ACPI_MADT_TYPE_RINTC = 24,
+	ACPI_MADT_TYPE_RESERVED = 25,	/* 25 to 0x7F are reserved */
 	ACPI_MADT_TYPE_OEM_RESERVED = 0x80	/* 0x80 to 0xFF are reserved for OEM use */
 };
 
@@ -1250,6 +1251,24 @@ enum acpi_madt_lpc_pic_version {
 	ACPI_MADT_LPC_PIC_VERSION_RESERVED = 2	/* 2 and greater are reserved */
 };
 
+/* 24: RISC-V INTC */
+struct acpi_madt_rintc {
+	struct acpi_subtable_header header;
+	u8 version;
+	u8 reserved;
+	u32 flags;
+	u64 hart_id;
+	u32 uid;		/* ACPI processor UID */
+};
+
+/* Values for RISC-V INTC Version field above */
+
+enum acpi_madt_rintc_version {
+	ACPI_MADT_RINTC_VERSION_NONE = 0,
+	ACPI_MADT_RINTC_VERSION_V1 = 1,
+	ACPI_MADT_RINTC_VERSION_RESERVED = 2	/* 2 and greater are reserved */
+};
+
 /* 80: OEM data */
 
 struct acpi_madt_oem_data {
-- 
2.34.1


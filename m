Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25A69C77B7F
	for <platform-driver-x86@archiver.kernel.org>; Mon,  8 May 2023 11:59:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234458AbjEHL7B (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 8 May 2023 07:59:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236434AbjEHL6J (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 8 May 2023 07:58:09 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA80D431E6
        for <platform-driver-x86@vger.kernel.org>; Mon,  8 May 2023 04:55:52 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1aaec9ad820so41499445ad.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 08 May 2023 04:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1683546949; x=1686138949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OXbI3HNo2LwXyvQs8qly8d1W6GTwS2nLVT7+MHc+VBo=;
        b=VJ05ByxAGU0vvx8FU1rjL6l0PIhYquRStC62VT+/S2jdFsLmaNzstWpoe/hp4v7/fY
         9Ylc58Ec1X59MDBgEvRnZDYa2YK4has1nYcaIChEcUHpK9Rtzzs0lN8auNvjP/eS/mzF
         b/q8IeE+kqnv4kgmSGEDfxohLmsEDEAmTj4HLYxPf8Gjz4R36yz+fRDNLHDdLtDGxoAl
         7mtfwXr9/djJaaG1DwPbd57mwyG5l4sdX1mA2Rl2byTeWWF1TsEdVB1cs1cR+R0R1EW9
         +Ash7wiwJX0Utkc0AktTYUTxTmaoyjAeBGJFDxoAhquycttgz+y0oV4T4PsNDlPm/P57
         2AwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683546949; x=1686138949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OXbI3HNo2LwXyvQs8qly8d1W6GTwS2nLVT7+MHc+VBo=;
        b=GKuhSxb4Ezs/nJfe9G1ATP3nV5AXD1++qh6nhX6dEfTk1BrAlQf5gBv7gRs6K0KGAW
         QaSx3omCgGurxhfaUIQMKwpuo7sdQcVFDVdMZyYvKgX/nHXo7fWx6x/YsejnS/bOfVvj
         /wyjrEwguYt4pvqSEjxbyMtlHOCDD+DkiuirgNHLYSP/bxS/I/HSJB/gf/AYdVSDgP3Q
         crw0B126vGek0iXBz8M8GwNkV/yPSuJJaqPLTyNr0nMZxpNA/ITUELxRJwoNkILrNN6H
         YIgbuDFA6M1G6IPyHtFtQisUwpiBgkr2u7g8rIipj4dOMwXabP42PPZ5vb9dcJSDt0JT
         yNhA==
X-Gm-Message-State: AC+VfDxBeakHFSiAsTZbYgpTZakwk8l0m13/T82O81k0OAnsZzdJOXl3
        9/m2qRE/VJhsrAxnBeWtQVVtAQ==
X-Google-Smtp-Source: ACHHUZ4GEr9Y9j7DgnPzlC1fbWrO73mkCaN33oq08+WeT0xKd/++5k0KyC4CIRoSU1LTRnVvt3Uuyw==
X-Received: by 2002:a17:902:b20a:b0:1ac:3e90:7c4 with SMTP id t10-20020a170902b20a00b001ac3e9007c4mr10016908plr.2.1683546948833;
        Mon, 08 May 2023 04:55:48 -0700 (PDT)
Received: from sunil-laptop.. ([106.51.189.144])
        by smtp.gmail.com with ESMTPSA id w9-20020a170902904900b001aaed524541sm7015149plz.227.2023.05.08.04.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 04:55:48 -0700 (PDT)
From:   Sunil V L <sunilvl@ventanamicro.com>
To:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
        linux-crypto@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        llvm@lists.linux.dev
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Weili Qian <qianweili@huawei.com>,
        Zhou Wang <wangzhou1@hisilicon.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Marc Zyngier <maz@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>,
        Sunil V L <sunilvl@ventanamicro.com>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: [PATCH V5 21/21] MAINTAINERS: Add entry for drivers/acpi/riscv
Date:   Mon,  8 May 2023 17:22:37 +0530
Message-Id: <20230508115237.216337-22-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230508115237.216337-1-sunilvl@ventanamicro.com>
References: <20230508115237.216337-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

ACPI defines few RISC-V specific tables which need
parsing code added in drivers/acpi/riscv. Add maintainer
entries for this newly created folder.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7e0b87d5aa2e..083ba321fc7c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -406,6 +406,14 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	drivers/acpi/arm64
 
+ACPI FOR RISC-V (ACPI/riscv)
+M:	Sunil V L <sunilvl@ventanamicro.com>
+L:	linux-acpi@vger.kernel.org
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+F:	arch/riscv/kernel/acpi.c
+F:	drivers/acpi/riscv
+
 ACPI SERIAL MULTI INSTANTIATE DRIVER
 M:	Hans de Goede <hdegoede@redhat.com>
 L:	platform-driver-x86@vger.kernel.org
-- 
2.34.1


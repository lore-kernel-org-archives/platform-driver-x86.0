Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87F4BC77B60
	for <platform-driver-x86@archiver.kernel.org>; Tue,  4 Apr 2023 18:26:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236450AbjDDS0L (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 4 Apr 2023 14:26:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236219AbjDDSZ3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 4 Apr 2023 14:25:29 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AF725FD6
        for <platform-driver-x86@vger.kernel.org>; Tue,  4 Apr 2023 11:23:17 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id ja10so32150012plb.5
        for <platform-driver-x86@vger.kernel.org>; Tue, 04 Apr 2023 11:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680632595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bxjRnY50ljGzDkjFJKwpbgFpDq6dD9KEN8bTRX7WND0=;
        b=DUjOausdvzFTVQlcC6m84GARZK5LmEhMht8gMLun6u8d/vhvQDQIhEE8PuNQKXP186
         0Sq8iIVodsU0Skgpet6N/Mb9uhXlJU2cQ0UAC8Odwjor6m+ubsGRHF1SKMN62ZIITSOx
         uKaCINtsM5qD+zb0+Ky44kERjcb2URa2HHFJVdN98U7df7b7TcXae/mpr60N9hSJEzcD
         bs0/UMMtuOougT+/ob1sPci2eYBARU1ovpXTnZh/fljveDgKCvU976b1VpvUFAqUS58A
         9a9W/4mKqFePf8VXn8kULaTt3TpsK/9yvMRoFqRBN/oG2lQ4z1BrZAk5fSXHuRGiqbrJ
         K/Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680632595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bxjRnY50ljGzDkjFJKwpbgFpDq6dD9KEN8bTRX7WND0=;
        b=yvcvhooZ3WdxQ4HEtr24795cRoO00FBPTedKw3KCV+yd/uPy2iXRcE1wZ1QsTBHDMT
         5rNnJUYw9YGqFvp6hsgkaYOA65ZOGkwICk0l1GnpnQYa6sAkDzqgPB7f7D3rCludrJXU
         ldUGO/xIsM6lXk8zg1HBwEhrG/Z5ckTecwXRAAqwir1cgR+580nv//T/i+dDsI9twv4b
         /5tklFno8QQlXRYVFw4BBfhte7k1VRWy+ULlBr4radWVMTDeyQ4H8JlbUJC8LCModH0b
         AP55C1d6nZ8xjj8+kJoJxvcTGixjkJlOTxq+UQxeWelv7ON4SAHk9Se0Wy8NMIO8o1f5
         Ub1g==
X-Gm-Message-State: AAQBX9daFfPgQHjIOOEIZ3vmWlor8mLQFZVZJY5cFR6tSlxM1rDeBb1e
        H3I1MNkOohiOpt74P36ShPwnCg==
X-Google-Smtp-Source: AKy350bkfJy3/J/N4hFHpsA/SCejSzTneUJgG9jMyZsK97P+mZ2vHjDGEOqM8+xhJPDrUVdhideASg==
X-Received: by 2002:a05:6a20:4da3:b0:d9:a38d:3ec7 with SMTP id gj35-20020a056a204da300b000d9a38d3ec7mr36588pzb.29.1680632595264;
        Tue, 04 Apr 2023 11:23:15 -0700 (PDT)
Received: from localhost.localdomain ([106.51.184.50])
        by smtp.gmail.com with ESMTPSA id o12-20020a056a001bcc00b0062dcf5c01f9sm9018524pfw.36.2023.04.04.11.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 11:23:14 -0700 (PDT)
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
        Sunil V L <sunilvl@ventanamicro.com>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: [PATCH V4 21/23] MAINTAINERS: Add entry for drivers/acpi/riscv
Date:   Tue,  4 Apr 2023 23:50:35 +0530
Message-Id: <20230404182037.863533-22-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230404182037.863533-1-sunilvl@ventanamicro.com>
References: <20230404182037.863533-1-sunilvl@ventanamicro.com>
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
index 90abe83c02f3..903a52027309 100644
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


Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C24ECC43334
	for <platform-driver-x86@archiver.kernel.org>; Tue, 19 Jul 2022 13:33:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235686AbiGSNds (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 19 Jul 2022 09:33:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237743AbiGSNdf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 19 Jul 2022 09:33:35 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61300A9BB6
        for <platform-driver-x86@vger.kernel.org>; Tue, 19 Jul 2022 05:49:10 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id z13so1860361wro.13
        for <platform-driver-x86@vger.kernel.org>; Tue, 19 Jul 2022 05:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rhebo.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5J/x344XDUrdXcDFkdfo9rtFs5nkcwU/7ZJcG3SW9Ug=;
        b=KvR3SFewOtc/uuxI64da7m+TPScLnFwC67EX7vHkZEbw0k87Ihq4nj+UYOjDrklrbi
         OJ8nMzAxxKuPjifFlvobNKX2ZPKNDIHqiL1sZEKdD7wAMEMm8HyH3jVgxVmQj9IWZSwq
         bXVqlC6aGZe3IAX0RjhSmixC+QGFGrxqeqamulVuU8vPzV9YN+RzBT2zoIJ747W3F+/w
         onnV3+7GbEAi0VWElhSXqHZ3EVDq8f4MKc+g7HW9ki0kX55KdkV1GiGy3fLRZbnH4th3
         aV7F63KpNdfYAZ6x9+avlX2WHN0DSesQEEZvSwXiG68euO/vNG+aXp0wqgsqUL2QHkLd
         7TFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5J/x344XDUrdXcDFkdfo9rtFs5nkcwU/7ZJcG3SW9Ug=;
        b=35uamHTZtZLUrCnrTLNrvzj9z4M3gtC9eARkZrPjPguifwSfh3fw/pK9OkLOm+nZyI
         FTtvvViiXCYw8j+eL3blmfIZVcQb0DtWAUCOWfyJgqPzutPhojoEompOFJxxAhUxnpPT
         ZuzzQQKAgX2fMB4jYZleWMEpGJh2QWRxWlUXp0oVjyy6cZ9m6c1KTesvDpi+AYDj+gwO
         ej+rJJ7OEnIxGm+e67XoaU9eVlkdh1XmC2Arl56pg7sFJiOX3ydswDHFmgNAM6Jy11J+
         2QSyPVZwv6dot/BMyZIsaR7JZkGTdnpAPkKeIe7zVfosx9a4YxhT1u83YePVsdZw5ojk
         Y8aQ==
X-Gm-Message-State: AJIora+uuQC7n83VwCzxC3jTlZsNWh/zw+gHwCpo2WKux16lTv9y5LmH
        uZt5BTSjFjHw18FUWaKkItI6wA==
X-Google-Smtp-Source: AGRyM1vCjg7veeivzEbdJC4/l9oM7HTCCSciEkLhGtg6qyIEYP8J2wVYb2cH4yU1h6hsii5eJafA3g==
X-Received: by 2002:adf:facc:0:b0:21d:8c8f:4b51 with SMTP id a12-20020adffacc000000b0021d8c8f4b51mr25703959wrs.307.1658234944609;
        Tue, 19 Jul 2022 05:49:04 -0700 (PDT)
Received: from Air-von-Paul.lan ([80.64.181.150])
        by smtp.gmail.com with ESMTPSA id n2-20020a5d6b82000000b0021dd08ad8d7sm11043130wrx.46.2022.07.19.05.49.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 19 Jul 2022 05:49:04 -0700 (PDT)
From:   Paul Spooren <paul.spooren@rhebo.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Spooren <paul.spooren@rhebo.com>,
        =?UTF-8?q?Michael=20Sch=C3=B6ne?= <michael.schoene@rhebo.com>
Subject: [PATCH] platform/x86: pmc_atom: Add Lex 3I380NX industrial PC to critclk_systems DMI table
Date:   Tue, 19 Jul 2022 14:48:31 +0200
Message-Id: <20220719124830.2320-1-paul.spooren@rhebo.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The Lex 3I380NX industrial PC has 4 ethernet controllers on board
which need pmc_plt_clk0 - 3 to function, add it to the critclk_systems
DMI table, so that drivers/clk/x86/clk-pmc-atom.c will mark the clocks
as CLK_CRITICAL and they will not get turned off.

This commit is nearly redundant to 3d0818f5eba8 ("platform/x86:
pmc_atom: Add Lex 3I380D industrial PC to critclk_systems DMI table")
but for the 3I380NX device.

The original vendor firmware is only available using the WaybackMachine:
http://www.lex.com.tw/products/3I380NX.html

Signed-off-by: Michael Schöne <michael.schoene@rhebo.com>
Signed-off-by: Paul Spooren <paul.spooren@rhebo.com>
---
 drivers/platform/x86/pmc_atom.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/pmc_atom.c b/drivers/platform/x86/pmc_atom.c
index b8b1ed1406de..15973a400e43 100644
--- a/drivers/platform/x86/pmc_atom.c
+++ b/drivers/platform/x86/pmc_atom.c
@@ -397,6 +397,15 @@ static const struct dmi_system_id critclk_systems[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "3I380D"),
 		},
 	},
+	{
+		/* pmc_plt_clk0 - 3 are used for the 4 ethernet controllers */
+		.ident = "Lex 3I380NX",
+		.callback = dmi_callback,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Lex BayTrail"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "3I380NX"),
+		},
+	},
 	{
 		/* pmc_plt_clk* - are used for ethernet controllers */
 		.ident = "Lex 2I385SW",
-- 
2.32.1 (Apple Git-133)


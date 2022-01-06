Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BBA3C433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu,  6 Jan 2022 23:21:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245427AbiAFXVA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 6 Jan 2022 18:21:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234795AbiAFXVA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 6 Jan 2022 18:21:00 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17491C061245
        for <platform-driver-x86@vger.kernel.org>; Thu,  6 Jan 2022 15:21:00 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id i22so7691074wrb.13
        for <platform-driver-x86@vger.kernel.org>; Thu, 06 Jan 2022 15:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CTKQzjpHKcEGauZ82NDAqk/Z3ZGom4EmUoxiXtaUYKQ=;
        b=VzUmt3NY3DuEcYee+uT1KTj3fK53jRqBJALwU0eOlDtuuBblF1P7T70fi2XCHl3/PE
         ahxv1ScVFt3/ljozXosdWicYXFyBQmAP78DjlB8radClnJfbATTIBOWKhIbL4y5TR+D3
         NtRzmfekRO9uT6Q28X8qXdZqcqDLhJ7xrutxGduJd3M5vid+dEBugSt0FXLDhwC2b9qs
         zn7nxaKx5GP+uxRD1Abfb+PmEkbbPTlSdU9ngmxaOOcKxCIZEZbqQO7kj7e/+z2PsEav
         cq6vkYc3+IJtuZE04u5W9td+NP617JgF9MO6TxBijVKXKs6yf/HUwv7Is+JAFjYb3Qsk
         iMtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CTKQzjpHKcEGauZ82NDAqk/Z3ZGom4EmUoxiXtaUYKQ=;
        b=rSlDdFId/dmKFmk4yBFOEHgVxgJ8iEwU68ORIfCFKhcIrcHYJGvZLremAg0tV/s0Uk
         e49PsnFRIPA6BdBYwMS2FKr+R5ranGYu494pR5rCgucEB8pYgmBTMj68agzjUNJ0v6DY
         KIFJaZAF5bXmRkQaHhi7bgdlSQkpsXLNaP+ZxhnqkPaxqFdJBLB1TAA0Mkn2teO7H3ei
         SlP5BSQVSSJkf9gWZKgFIV5FSeeNMwmw00YtKvU5DIj+rCCv6/p5kOmQO7TGALjDxRYw
         HGN4YOFvDrHDTTrtrx9XAF3w8xZ5YuXNsnUqdOI5qXcTx4ByZASu6s7FVohX6Qo5dwWU
         Zo5g==
X-Gm-Message-State: AOAM5320USfwi2BdZUgfigkfNt2WKYN5ob29PvdtUutO03PGKbjOONlY
        clZ+Xs8N3ESAmGJ8qKnkwUAfEuqFJyg=
X-Google-Smtp-Source: ABdhPJwk70EdBl4mWyPI9yNk5gq4sPFRzYYomA5cFXWdy1HaFQE48Z40WGGnkZlhUJ6Jh3ChB/HT1g==
X-Received: by 2002:a5d:604b:: with SMTP id j11mr2814990wrt.215.1641511258736;
        Thu, 06 Jan 2022 15:20:58 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id b16sm3252796wmq.41.2022.01.06.15.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jan 2022 15:20:58 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     platform-driver-x86@vger.kernel.org
Cc:     hdegoede@redhat.com, markgross@kernel.org
Subject: [PATCH] platform/x86: int3472: Add board data for Surface Go 3
Date:   Thu,  6 Jan 2022 23:20:45 +0000
Message-Id: <20220106232045.41291-1-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The Surface Go 3 needs some board data in order to configure the
TPS68470 PMIC - add entries to the tables in tps68470_board_data.c
that define the configuration that's needed.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---

Hans - I based this onto the platform-drivers-x86-int3472 branch, hope that's
right. Let me know if it needs to be rebased.

 .../x86/intel/int3472/tps68470_board_data.c         | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
index faa5570f6e6b..f93d437fd192 100644
--- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
+++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
@@ -110,6 +110,12 @@ static const struct int3472_tps68470_board_data surface_go_tps68470_board_data =
 	.tps68470_regulator_pdata = &surface_go_tps68470_pdata,
 };
 
+static const struct int3472_tps68470_board_data surface_go3_tps68470_board_data = {
+	.dev_name = "i2c-INT3472:01",
+	.tps68470_gpio_lookup_table = &surface_go_tps68470_gpios,
+	.tps68470_regulator_pdata = &surface_go_tps68470_pdata,
+};
+
 static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
 	{
 		.matches = {
@@ -125,6 +131,13 @@ static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
 		},
 		.driver_data = (void *)&surface_go_tps68470_board_data,
 	},
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Microsoft Corporation"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Surface Go 3"),
+		},
+		.driver_data = (void *)&surface_go3_tps68470_board_data,
+	},
 	{ }
 };
 
-- 
2.25.1


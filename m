Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F619C4332F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 15 Nov 2022 23:15:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238667AbiKOXPk (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 15 Nov 2022 18:15:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231821AbiKOXPR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 15 Nov 2022 18:15:17 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0E4FF02;
        Tue, 15 Nov 2022 15:15:15 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id z18so24139030edb.9;
        Tue, 15 Nov 2022 15:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GnIjaEyd7LaVSU757Qe++o4zl3QzVferzydv3y7XN8g=;
        b=XfL3yPVLPfRfVJj+3bI0IZ/iNIElinuD5/rHDFvsUxS1H8Dz0FnrzffKZHhK5yBzce
         gf6tiYldxJVlLr7TwkVicuivNbyR7CF5BcJpbF2HZ2E/gaZG43GtuXNVB+5MrgJ8O+hG
         NT4h6/ogSCcha5Lnm8y0PKnjOrr7N1s8Zd7ovO6ziSQEXiib4QqZC378YwjiJnWyiEmh
         V6z80osN96oNW+v23kn1qPQOcdMoKGuu43Ro/lBA3y4hHD+T99phLO0dn6wbrdLNF8UB
         owsnGDZVrbF9qpPzn6lYfgcZWOA/ef0xm521CgU9omNdZDlODDkeQItCvT7ognp+sTkZ
         iiOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GnIjaEyd7LaVSU757Qe++o4zl3QzVferzydv3y7XN8g=;
        b=HyKYHO9k8uiAlDxVXn4s3rV53cDBkGhWUqp4LO5WjELh7YjrHZ9cqhKIsYwiAR6yNP
         R0hOSRENlxibScFO+pKaokM/koqBNL/SVYDvTFAaNDiR5obRm1jGdvOEQqQsZ0U5C7CN
         x0Xco8HS+SKfZW1glshGjyttc2johg8b+6qlyqb1QNO1BDm/9CtFpnjD9ArR2J1Md3J0
         p83h1qr075/m1xT1mS8WYsCVizVcszG1ule/7vemA2cjFWGdXkCkUP/YBhmuO2pRo3qu
         bPEXy5qcFUOBNG5Nm0niJliSwhQLVOmCect9Hsiet2M/oNz6mo/j9lktvyq9W9y2M2IZ
         Evtw==
X-Gm-Message-State: ANoB5pkBd4YFmvRVE2mpWfMsQN//ihAQtVwCta9OcpG7dr7sMkx97qQ2
        jnPaX/aNO2Deyvi5PeZdoi8=
X-Google-Smtp-Source: AA0mqf5gVgAxwiNiy5frJ2LdbxP0BXIuu5Pae9ceoKDptmpM+kSIoHdYKlHvkLQz9Jrry6Z3uahh5A==
X-Received: by 2002:a05:6402:2943:b0:461:c3c9:38e6 with SMTP id ed3-20020a056402294300b00461c3c938e6mr17183988edb.350.1668554113630;
        Tue, 15 Nov 2022 15:15:13 -0800 (PST)
Received: from xws.localdomain ([37.120.217.162])
        by smtp.gmail.com with ESMTPSA id b16-20020a17090630d000b00795bb7d64d8sm6122907ejb.217.2022.11.15.15.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 15:15:13 -0800 (PST)
From:   Maximilian Luz <luzmaximilian@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maximilian Luz <luzmaximilian@gmail.com>
Subject: [PATCH] platform/surface: aggregator_registry: Add support for Surface Laptop 5
Date:   Wed, 16 Nov 2022 00:14:40 +0100
Message-Id: <20221115231440.1338142-1-luzmaximilian@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add device nodes to enable support for battery and charger status, the
ACPI platform profile, as well as internal HID devices (including
touchpad and keyboard) on the Surface Laptop 5.

Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>
---
 .../surface/surface_aggregator_registry.c        | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/platform/surface/surface_aggregator_registry.c b/drivers/platform/surface/surface_aggregator_registry.c
index db82c2a7c567..023f126121d7 100644
--- a/drivers/platform/surface/surface_aggregator_registry.c
+++ b/drivers/platform/surface/surface_aggregator_registry.c
@@ -234,6 +234,19 @@ static const struct software_node *ssam_node_group_sl3[] = {
 	NULL,
 };
 
+/* Devices for Surface Laptop 5. */
+static const struct software_node *ssam_node_group_sl5[] = {
+	&ssam_node_root,
+	&ssam_node_bat_ac,
+	&ssam_node_bat_main,
+	&ssam_node_tmp_pprof,
+	&ssam_node_hid_main_keyboard,
+	&ssam_node_hid_main_touchpad,
+	&ssam_node_hid_main_iid5,
+	&ssam_node_hid_sam_ucm_ucsi,
+	NULL,
+};
+
 /* Devices for Surface Laptop Studio. */
 static const struct software_node *ssam_node_group_sls[] = {
 	&ssam_node_root,
@@ -345,6 +358,9 @@ static const struct acpi_device_id ssam_platform_hub_match[] = {
 	/* Surface Laptop 4 (13", Intel) */
 	{ "MSHW0250", (unsigned long)ssam_node_group_sl3 },
 
+	/* Surface Laptop 5 */
+	{ "MSHW0350", (unsigned long)ssam_node_group_sl5 },
+
 	/* Surface Laptop Go 1 */
 	{ "MSHW0118", (unsigned long)ssam_node_group_slg1 },
 
-- 
2.38.1


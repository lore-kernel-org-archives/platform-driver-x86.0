Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67FFFC4707A
	for <platform-driver-x86@archiver.kernel.org>; Sun, 23 May 2021 13:46:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 467336115C
	for <platform-driver-x86@archiver.kernel.org>; Sun, 23 May 2021 13:46:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231788AbhEWNrp (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 23 May 2021 09:47:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231784AbhEWNrp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 23 May 2021 09:47:45 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 278ABC06138A;
        Sun, 23 May 2021 06:46:17 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id n2so25820527wrm.0;
        Sun, 23 May 2021 06:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Fc3G6exJieu9OL4lvjd+2d/FQ/AgmvBVDDkwAj8ehdk=;
        b=U4H3Fgky50WtLxLLaUenJD9ELdNCml1iPrd9Ef2y7ncNA250IzIQ/Oh+wYcSvNnCpL
         gLY6rZpLXTyrIvT5jS0KpwkM5McN2uQkpNu2ZHI/Qp/mH1Dp4/Cgwbnhi+GmiGSh/yj5
         iK1iCaLK4IdvXYaR2bRwIMu4PVudImb08vmBjaRl23e1LImhttSXj2MkgJa/kfxsEhdo
         TBMAk90ayJ4trPUAylNCoyblo9W0ScZv1Yd1zf8Hc8YzciMyRgQMwayKV03xP2S1W2b0
         VsHJoSsD1HzQm73KXUeV5Vgr/sJg5I0Ly9kHMJXSBedvkBRSk9Z9+SGhYCZM7uzLX1ap
         gtWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Fc3G6exJieu9OL4lvjd+2d/FQ/AgmvBVDDkwAj8ehdk=;
        b=ZzK1pqoYddGIr0pYYG0W7kMJdTAtMTFjMkseXNFCK2lKGQnATzVDUkvKIpT/yjuFG1
         YZ6IF+vGM8dQs9F49cr8LeYHCEseahbft2Xks2tHD7J4yX84wfzKZjtfG+ZoGCqZ9acL
         O16fRS1/oL7nkuhQadkSsOW4RhNff6KvOSKf8duNra4mIWbXKif8Px6OmvcOVLnNaiQI
         ksmoMJceExjgoyXTzRq935j+pt78xUD0ZZvaLO4AOr4YRA6zen5AGLV9hrQ+UU5U4gds
         mR58hM7T3MF33Whe1j6+IW3pNonMU8cG+kt2xfceuEZYEMTDJYIyDsq6cT6kdD3V3GFl
         61kg==
X-Gm-Message-State: AOAM532wi9XJWXhm4t4du6QWIBHFjM/rA9Nb+ULcWtMqNdsuqOPGW4Ey
        4+V4mGlcTkmrHxLzbiBskEM=
X-Google-Smtp-Source: ABdhPJyn3eRbyc9jx8EeAu8Lf/hMfcd9sctBYbJoh+P9HAU90yp5Y/d8BOUrt5S5cKixS18nG+E4Uw==
X-Received: by 2002:a5d:62d0:: with SMTP id o16mr18579057wrv.164.1621777575779;
        Sun, 23 May 2021 06:46:15 -0700 (PDT)
Received: from xws.localdomain ([37.58.58.229])
        by smtp.gmail.com with ESMTPSA id z188sm5112414wme.38.2021.05.23.06.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 May 2021 06:46:15 -0700 (PDT)
From:   Maximilian Luz <luzmaximilian@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maximilian Luz <luzmaximilian@gmail.com>
Subject: [PATCH 3/3] platform/surface: aggregator_registry: Consolidate node groups for 5th- and 6th-gen devices
Date:   Sun, 23 May 2021 15:45:28 +0200
Message-Id: <20210523134528.798887-4-luzmaximilian@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210523134528.798887-1-luzmaximilian@gmail.com>
References: <20210523134528.798887-1-luzmaximilian@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

5th- and 6th-generation Surface devices have all SAM clients defined in
ACPI, except for the platform profile/performance mode which his handled
via the WSID (Windows Surface Integration Device). Thus, the node groups
for those devices are the same and we can just use a single one instead
of re-defining the same one over and over again.

Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>
---
 .../surface/surface_aggregator_registry.c     | 47 +++++--------------
 1 file changed, 12 insertions(+), 35 deletions(-)

diff --git a/drivers/platform/surface/surface_aggregator_registry.c b/drivers/platform/surface/surface_aggregator_registry.c
index ef83461fa536..4428c4330229 100644
--- a/drivers/platform/surface/surface_aggregator_registry.c
+++ b/drivers/platform/surface/surface_aggregator_registry.c
@@ -119,8 +119,13 @@ static const struct software_node ssam_node_hid_base_iid6 = {
 	.parent = &ssam_node_hub_base,
 };
 
-/* Devices for Surface Book 2. */
-static const struct software_node *ssam_node_group_sb2[] = {
+/*
+ * Devices for 5th- and 6th-generations models:
+ * - Surface Book 2,
+ * - Surface Laptop 1 and 2,
+ * - Surface Pro 5 and 6.
+ */
+static const struct software_node *ssam_node_group_gen5[] = {
 	&ssam_node_root,
 	&ssam_node_tmp_pprof,
 	NULL,
@@ -142,20 +147,6 @@ static const struct software_node *ssam_node_group_sb3[] = {
 	NULL,
 };
 
-/* Devices for Surface Laptop 1. */
-static const struct software_node *ssam_node_group_sl1[] = {
-	&ssam_node_root,
-	&ssam_node_tmp_pprof,
-	NULL,
-};
-
-/* Devices for Surface Laptop 2. */
-static const struct software_node *ssam_node_group_sl2[] = {
-	&ssam_node_root,
-	&ssam_node_tmp_pprof,
-	NULL,
-};
-
 /* Devices for Surface Laptop 3 and 4. */
 static const struct software_node *ssam_node_group_sl3[] = {
 	&ssam_node_root,
@@ -177,20 +168,6 @@ static const struct software_node *ssam_node_group_slg1[] = {
 	NULL,
 };
 
-/* Devices for Surface Pro 5. */
-static const struct software_node *ssam_node_group_sp5[] = {
-	&ssam_node_root,
-	&ssam_node_tmp_pprof,
-	NULL,
-};
-
-/* Devices for Surface Pro 6. */
-static const struct software_node *ssam_node_group_sp6[] = {
-	&ssam_node_root,
-	&ssam_node_tmp_pprof,
-	NULL,
-};
-
 /* Devices for Surface Pro 7 and Surface Pro 7+. */
 static const struct software_node *ssam_node_group_sp7[] = {
 	&ssam_node_root,
@@ -495,10 +472,10 @@ static struct ssam_device_driver ssam_base_hub_driver = {
 
 static const struct acpi_device_id ssam_platform_hub_match[] = {
 	/* Surface Pro 4, 5, and 6 (OMBR < 0x10) */
-	{ "MSHW0081", (unsigned long)ssam_node_group_sp5 },
+	{ "MSHW0081", (unsigned long)ssam_node_group_gen5 },
 
 	/* Surface Pro 6 (OMBR >= 0x10) */
-	{ "MSHW0111", (unsigned long)ssam_node_group_sp6 },
+	{ "MSHW0111", (unsigned long)ssam_node_group_gen5 },
 
 	/* Surface Pro 7 */
 	{ "MSHW0116", (unsigned long)ssam_node_group_sp7 },
@@ -507,16 +484,16 @@ static const struct acpi_device_id ssam_platform_hub_match[] = {
 	{ "MSHW0119", (unsigned long)ssam_node_group_sp7 },
 
 	/* Surface Book 2 */
-	{ "MSHW0107", (unsigned long)ssam_node_group_sb2 },
+	{ "MSHW0107", (unsigned long)ssam_node_group_gen5 },
 
 	/* Surface Book 3 */
 	{ "MSHW0117", (unsigned long)ssam_node_group_sb3 },
 
 	/* Surface Laptop 1 */
-	{ "MSHW0086", (unsigned long)ssam_node_group_sl1 },
+	{ "MSHW0086", (unsigned long)ssam_node_group_gen5 },
 
 	/* Surface Laptop 2 */
-	{ "MSHW0112", (unsigned long)ssam_node_group_sl2 },
+	{ "MSHW0112", (unsigned long)ssam_node_group_gen5 },
 
 	/* Surface Laptop 3 (13", Intel) */
 	{ "MSHW0114", (unsigned long)ssam_node_group_sl3 },
-- 
2.31.1


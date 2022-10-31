Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE205ECAAA1
	for <platform-driver-x86@archiver.kernel.org>; Mon, 31 Oct 2022 21:26:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229851AbiJaV04 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 31 Oct 2022 17:26:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229711AbiJaV0y (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 31 Oct 2022 17:26:54 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBD42E015
        for <platform-driver-x86@vger.kernel.org>; Mon, 31 Oct 2022 14:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667251559;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=shBZPHKYcMC0unaK56b0eDrAF/WjMbXbhoipJJg1iNY=;
        b=RoC03dwNmK5wIxdravsueKp1pfUoQj3JUxf7t95jEvQuZNgOtO2Ydcph1iVGTD1F64UYG1
        X/eAyL/39dx4AxIuQAg/+c1KNPd2LZz6PD+2T0QNNnk0NWIGWPBDzAENavbUJ1Zv6qjkqv
        qhygsaCIixMbqVpmvCgceWSB/APffZQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-271-B0R6GCAVPq-v3ersUlo2WA-1; Mon, 31 Oct 2022 17:25:58 -0400
X-MC-Unique: B0R6GCAVPq-v3ersUlo2WA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D41293814943;
        Mon, 31 Oct 2022 21:25:57 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.145])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E76DBC15BB2;
        Mon, 31 Oct 2022 21:25:56 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     "Rafael J . Wysocki" <rafael@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, Len Brown <lenb@kernel.org>,
        linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Daniel Dadap <ddadap@nvidia.com>
Subject: [PATCH] ACPI: video: Add backlight=native DMI quirk for Dell G15 5515
Date:   Mon, 31 Oct 2022 22:25:56 +0100
Message-Id: <20221031212556.401618-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The Dell G15 5515 has the WMI interface (and WMI call returns) expected
by the nvidia-wmi-ec-backlight interface. But the backlight class device
registered by the nvidia-wmi-ec-backlight driver does not actually work.

The amdgpu_bl0 native GPU backlight class device does actually work,
add a backlight=native DMI quirk for this.

Cc: Daniel Dadap <ddadap@nvidia.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/acpi/video_detect.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/acpi/video_detect.c b/drivers/acpi/video_detect.c
index 841f6213b4de..88acc09773bb 100644
--- a/drivers/acpi/video_detect.c
+++ b/drivers/acpi/video_detect.c
@@ -645,6 +645,16 @@ static const struct dmi_system_id video_detect_dmi_table[] = {
 		},
 	},
 
+	/* Models which have nvidia-ec-wmi support, but should not use it. */
+	{
+	 .callback = video_detect_force_native,
+	 /* Dell G15 5515 */
+	 .matches = {
+		DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+		DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5515"),
+		},
+	},
+
 	/*
 	 * Desktops which falsely report a backlight and which our heuristics
 	 * for this do not catch.
-- 
2.37.3


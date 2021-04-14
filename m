Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DD7BC43600
	for <platform-driver-x86@archiver.kernel.org>; Wed, 14 Apr 2021 15:11:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0463F60E08
	for <platform-driver-x86@archiver.kernel.org>; Wed, 14 Apr 2021 15:11:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346526AbhDNPLf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 14 Apr 2021 11:11:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40845 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1348697AbhDNPLd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 14 Apr 2021 11:11:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1618413071;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9FFhvY6ZxnqT5eoC1FAyJyFCzDmRpxf/vMdYaTlRI98=;
        b=FfjoT9rA4BDyAgeofiyw2hF8bUIEcCB5Y34AnqExo1KpPBz1EhGwkMGYX6VFus8Z1STLQ2
        U/zjAiXa3i3vb25AT97zAWEYqzJgXFE3oszZpWCUKdreZ378TPeJG00cQDuR62eBB5Ky5O
        4v0dnYIF06fRtt8ltKrW5daSXXOf5us=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-wE_YVmpjPGiZi1XsKSoLHQ-1; Wed, 14 Apr 2021 11:11:09 -0400
X-MC-Unique: wE_YVmpjPGiZi1XsKSoLHQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3F781854E26;
        Wed, 14 Apr 2021 15:11:06 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-168.ams2.redhat.com [10.36.112.168])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 692445D6BA;
        Wed, 14 Apr 2021 15:11:03 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Rajat Jain <rajatja@google.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Pekka Paalanen <pekka.paalanen@collabora.com>,
        Mario Limonciello <mario.limonciello@outlook.com>,
        Sebastien Bacher <seb128@ubuntu.com>,
        Marco Trevisan <marco.trevisan@canonical.com>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org,
        Mark Pearson <markpearson@lenovo.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH resend 3/9] drm/privacy-screen: Add X86 specific arch init code
Date:   Wed, 14 Apr 2021 17:10:43 +0200
Message-Id: <20210414151049.95828-4-hdegoede@redhat.com>
In-Reply-To: <20210414151049.95828-1-hdegoede@redhat.com>
References: <20210414151049.95828-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add X86 specific arch init code, which fills the privacy-screen lookup
table by checking for various vendor specific ACPI interfaces for
controlling the privacy-screen.

This initial version only checks for the Lenovo Thinkpad specific ACPI
methods for privacy-screen control.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/Makefile                 |  5 +-
 drivers/gpu/drm/drm_privacy_screen_x86.c | 82 ++++++++++++++++++++++++
 include/drm/drm_privacy_screen_machine.h |  5 ++
 3 files changed, 91 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/drm_privacy_screen_x86.c

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 9a802605249d..75166bd53e00 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -58,11 +58,14 @@ drm_kms_helper-$(CONFIG_DRM_DP_CEC) += drm_dp_cec.o
 obj-$(CONFIG_DRM_KMS_HELPER) += drm_kms_helper.o
 obj-$(CONFIG_DRM_DEBUG_SELFTEST) += selftests/
 
+drm_privacy_screen_helper-y := drm_privacy_screen.o
+drm_privacy_screen_helper-$(CONFIG_X86) += drm_privacy_screen_x86.o
+obj-$(CONFIG_DRM_PRIVACY_SCREEN) += drm_privacy_screen_helper.o
+
 obj-$(CONFIG_DRM)	+= drm.o
 obj-$(CONFIG_DRM_MIPI_DBI) += drm_mipi_dbi.o
 obj-$(CONFIG_DRM_MIPI_DSI) += drm_mipi_dsi.o
 obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) += drm_panel_orientation_quirks.o
-obj-$(CONFIG_DRM_PRIVACY_SCREEN) += drm_privacy_screen.o
 obj-y			+= arm/
 obj-$(CONFIG_DRM_TTM)	+= ttm/
 obj-$(CONFIG_DRM_SCHED)	+= scheduler/
diff --git a/drivers/gpu/drm/drm_privacy_screen_x86.c b/drivers/gpu/drm/drm_privacy_screen_x86.c
new file mode 100644
index 000000000000..f486d9087819
--- /dev/null
+++ b/drivers/gpu/drm/drm_privacy_screen_x86.c
@@ -0,0 +1,82 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright (C) 2020 Red Hat, Inc.
+ *
+ * Authors:
+ * Hans de Goede <hdegoede@redhat.com>
+ */
+
+#include <linux/acpi.h>
+#include <drm/drm_privacy_screen_machine.h>
+
+static struct drm_privacy_screen_lookup arch_lookup;
+
+struct arch_init_data {
+	struct drm_privacy_screen_lookup lookup;
+	bool (*detect)(void);
+};
+
+static acpi_status __init acpi_set_handle(acpi_handle handle, u32 level,
+					  void *context, void **return_value)
+{
+	*(acpi_handle *)return_value = handle;
+	return AE_CTRL_TERMINATE;
+}
+
+static bool __init detect_thinkpad_privacy_screen(void)
+{
+	union acpi_object obj = { .type = ACPI_TYPE_INTEGER };
+	struct acpi_object_list args = { .count = 1, .pointer = &obj, };
+	acpi_handle ec_handle = NULL;
+	unsigned long long output;
+	acpi_status status;
+
+	/* Get embedded-controller handle */
+	status = acpi_get_devices("PNP0C09", acpi_set_handle, NULL, &ec_handle);
+	if (ACPI_FAILURE(status) || !ec_handle)
+		return false;
+
+	/* And call the privacy-screen get-status method */
+	status = acpi_evaluate_integer(ec_handle, "HKEY.GSSS", &args, &output);
+	if (ACPI_FAILURE(status))
+		return false;
+
+	return (output & 0x10000) ? true : false;
+}
+
+static const struct arch_init_data arch_init_data[] __initconst = {
+#if IS_ENABLED(CONFIG_THINKPAD_ACPI)
+	{
+		.lookup = {
+			.dev_id = NULL,
+			.con_id = NULL,
+			.provider = "thinkpad_acpi",
+		},
+		.detect = detect_thinkpad_privacy_screen,
+	},
+#endif
+};
+
+void __init drm_privacy_screen_arch_init(void)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(arch_init_data); i++) {
+		if (!arch_init_data[i].detect())
+			continue;
+
+		pr_info("Found '%s' privacy-screen provider\n",
+			arch_init_data[i].lookup.provider);
+
+		/* Make a copy because arch_init_data is __initconst */
+		arch_lookup = arch_init_data[i].lookup;
+		drm_privacy_screen_lookup_add(&arch_lookup);
+		break;
+	}
+}
+
+void __exit drm_privacy_screen_arch_exit(void)
+{
+	if (arch_lookup.provider)
+		drm_privacy_screen_lookup_remove(&arch_lookup);
+}
diff --git a/include/drm/drm_privacy_screen_machine.h b/include/drm/drm_privacy_screen_machine.h
index 55f4b4fd8e4e..0d2f2a443e8c 100644
--- a/include/drm/drm_privacy_screen_machine.h
+++ b/include/drm/drm_privacy_screen_machine.h
@@ -31,11 +31,16 @@ struct drm_privacy_screen_lookup {
 void drm_privacy_screen_lookup_add(struct drm_privacy_screen_lookup *lookup);
 void drm_privacy_screen_lookup_remove(struct drm_privacy_screen_lookup *lookup);
 
+#ifdef CONFIG_X86
+void drm_privacy_screen_arch_init(void);
+void drm_privacy_screen_arch_exit(void);
+#else
 static inline void drm_privacy_screen_arch_init(void)
 {
 }
 static inline void drm_privacy_screen_arch_exit(void)
 {
 }
+#endif
 
 #endif
-- 
2.31.1


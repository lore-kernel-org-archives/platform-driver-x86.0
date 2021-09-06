Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41C06C433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon,  6 Sep 2021 07:35:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2B333606A5
	for <platform-driver-x86@archiver.kernel.org>; Mon,  6 Sep 2021 07:35:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240178AbhIFHgx (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 6 Sep 2021 03:36:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36570 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240186AbhIFHgx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 6 Sep 2021 03:36:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1630913748;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CIzkOXF9DSJKO6Tm/ydmAmVv4uvi805F7LCwNg72B9c=;
        b=D/dhk11/tyMJ4kdLxKJYr3TNQQrY6LLOBFZxbCFDEGY8u5KFL2LeX4xIZUmtwbRd45mPHf
        dEX/xZz8D5SO0o1YaGS4uoY5xNORWposqM/TwMiA8nF94QzpvVI9gg0CZL552NODt3WflH
        0IX+srVD1zpKKW771RXvtyjhwThXc54=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-525-RyptznbhNA-6gzenXBi62w-1; Mon, 06 Sep 2021 03:35:46 -0400
X-MC-Unique: RyptznbhNA-6gzenXBi62w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 261FE1854E26;
        Mon,  6 Sep 2021 07:35:44 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.133])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6145717A98;
        Mon,  6 Sep 2021 07:35:38 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rajat Jain <rajatja@google.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Lyude <lyude@redhat.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Pekka Paalanen <pekka.paalanen@collabora.com>,
        Mario Limonciello <mario.limonciello@outlook.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Sebastien Bacher <seb128@ubuntu.com>,
        Marco Trevisan <marco.trevisan@canonical.com>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 3/9] drm/privacy-screen: Add X86 specific arch init code
Date:   Mon,  6 Sep 2021 09:35:13 +0200
Message-Id: <20210906073519.4615-4-hdegoede@redhat.com>
In-Reply-To: <20210906073519.4615-1-hdegoede@redhat.com>
References: <20210906073519.4615-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add X86 specific arch init code, which fills the privacy-screen lookup
table by checking for various vendor specific ACPI interfaces for
controlling the privacy-screen.

This initial version only checks for the Lenovo Thinkpad specific ACPI
methods for privacy-screen control.

Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/Makefile                 |  2 +-
 drivers/gpu/drm/drm_privacy_screen_x86.c | 86 ++++++++++++++++++++++++
 include/drm/drm_privacy_screen_machine.h |  5 ++
 3 files changed, 92 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/drm_privacy_screen_x86.c

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 788fc37096f6..12997ca5670d 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -32,7 +32,7 @@ drm-$(CONFIG_OF) += drm_of.o
 drm-$(CONFIG_PCI) += drm_pci.o
 drm-$(CONFIG_DEBUG_FS) += drm_debugfs.o drm_debugfs_crc.o
 drm-$(CONFIG_DRM_LOAD_EDID_FIRMWARE) += drm_edid_load.o
-drm-$(CONFIG_DRM_PRIVACY_SCREEN) += drm_privacy_screen.o
+drm-$(CONFIG_DRM_PRIVACY_SCREEN) += drm_privacy_screen.o drm_privacy_screen_x86.o
 
 obj-$(CONFIG_DRM_DP_AUX_BUS) += drm_dp_aux_bus.o
 
diff --git a/drivers/gpu/drm/drm_privacy_screen_x86.c b/drivers/gpu/drm/drm_privacy_screen_x86.c
new file mode 100644
index 000000000000..a2cafb294ca6
--- /dev/null
+++ b/drivers/gpu/drm/drm_privacy_screen_x86.c
@@ -0,0 +1,86 @@
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
+#ifdef CONFIG_X86
+static struct drm_privacy_screen_lookup arch_lookup;
+
+struct arch_init_data {
+	struct drm_privacy_screen_lookup lookup;
+	bool (*detect)(void);
+};
+
+#if IS_ENABLED(CONFIG_THINKPAD_ACPI)
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
+#endif
+
+static const struct arch_init_data arch_init_data[] __initconst = {
+#if IS_ENABLED(CONFIG_THINKPAD_ACPI)
+	{
+		.lookup = {
+			.dev_id = NULL,
+			.con_id = NULL,
+			.provider = "privacy_screen-thinkpad_acpi",
+		},
+		.detect = detect_thinkpad_privacy_screen,
+	},
+#endif
+};
+
+void __init drm_privacy_screen_lookup_init(void)
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
+void drm_privacy_screen_lookup_exit(void)
+{
+	if (arch_lookup.provider)
+		drm_privacy_screen_lookup_remove(&arch_lookup);
+}
+#endif /* ifdef CONFIG_X86 */
diff --git a/include/drm/drm_privacy_screen_machine.h b/include/drm/drm_privacy_screen_machine.h
index aaa0d38cce92..02e5371904d3 100644
--- a/include/drm/drm_privacy_screen_machine.h
+++ b/include/drm/drm_privacy_screen_machine.h
@@ -31,11 +31,16 @@ struct drm_privacy_screen_lookup {
 void drm_privacy_screen_lookup_add(struct drm_privacy_screen_lookup *lookup);
 void drm_privacy_screen_lookup_remove(struct drm_privacy_screen_lookup *lookup);
 
+#if IS_ENABLED(CONFIG_DRM_PRIVACY_SCREEN) && IS_ENABLED(CONFIG_X86)
+void drm_privacy_screen_lookup_init(void);
+void drm_privacy_screen_lookup_exit(void);
+#else
 static inline void drm_privacy_screen_lookup_init(void)
 {
 }
 static inline void drm_privacy_screen_lookup_exit(void)
 {
 }
+#endif
 
 #endif
-- 
2.31.1


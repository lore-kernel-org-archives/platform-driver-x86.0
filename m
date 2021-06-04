Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22D13C48BCD
	for <platform-driver-x86@archiver.kernel.org>; Fri,  4 Jun 2021 19:49:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 10569613FE
	for <platform-driver-x86@archiver.kernel.org>; Fri,  4 Jun 2021 19:49:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229810AbhFDTup (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 4 Jun 2021 15:50:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44203 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231184AbhFDTun (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 4 Jun 2021 15:50:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1622836136;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2tGOOs3yhj0okDEfpsJWowz+lZzo9bFGmCeXUqdBADg=;
        b=gdZAvlOmILL93KV2dXJzNGSoEi6FQ/ICoeLHHQL6XJw6ZPApuSZipwP4tcg1r+YSZa02b4
        1k0S71v+G1GfKzM3K3H2Cid1ci1UaM5WKyAR+3sY94L3AtR24vgdGrJ6+feBQKaxTrwxAX
        5p5+sXcYR3RGwCbV44TQshsdOK7nD6o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-5ADH_2V2Ot-tTxWG8Hrj7A-1; Fri, 04 Jun 2021 15:48:53 -0400
X-MC-Unique: 5ADH_2V2Ot-tTxWG8Hrj7A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E4E310074A6;
        Fri,  4 Jun 2021 19:48:51 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-54.ams2.redhat.com [10.36.112.54])
        by smtp.corp.redhat.com (Postfix) with ESMTP id AA424620DE;
        Fri,  4 Jun 2021 19:48:48 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Imre Deak <imre.deak@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org,
        platform-driver-x86@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH 2/8] drm/connector: Add a fwnode pointer to drm_connector and register with ACPI (v2)
Date:   Fri,  4 Jun 2021 21:48:34 +0200
Message-Id: <20210604194840.14655-3-hdegoede@redhat.com>
In-Reply-To: <20210604194840.14655-1-hdegoede@redhat.com>
References: <20210604194840.14655-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add a fwnode pointer to struct drm_connector and register an acpi_bus_type
for the connectors with the ACPI subsystem (when CONFIG_ACPI is enabled).

The adding of the fwnode pointer allows drivers to associate a fwnode
that represents a connector with that connector.

When the new fwnode pointer points to an ACPI-companion, then the new
acpi_bus_type will cause the ACPI subsys to bind the device instantiated
for the connector with the fwnode by calling acpi_bind_one(). This will
result in a firmware_node symlink under /sys/class/card#-<connecter-name>/
which helps to verify that the fwnode-s and connectors are properly
matched.

Changes in v2:
- Make drm_connector_cleanup() call fwnode_handle_put() on
  connector->fwnode and document this

Co-developed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Tested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/drm_connector.c |  2 ++
 drivers/gpu/drm/drm_sysfs.c     | 37 +++++++++++++++++++++++++++++++++
 include/drm/drm_connector.h     |  8 +++++++
 3 files changed, 47 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index da39e7ff6965..eb3bd362c23f 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -474,6 +474,8 @@ void drm_connector_cleanup(struct drm_connector *connector)
 	drm_mode_object_unregister(dev, &connector->base);
 	kfree(connector->name);
 	connector->name = NULL;
+	fwnode_handle_put(connector->fwnode);
+	connector->fwnode = NULL;
 	spin_lock_irq(&dev->mode_config.connector_list_lock);
 	list_del(&connector->head);
 	dev->mode_config.num_connector--;
diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
index f9d92bbb1f98..bf9edce8e2d1 100644
--- a/drivers/gpu/drm/drm_sysfs.c
+++ b/drivers/gpu/drm/drm_sysfs.c
@@ -10,6 +10,7 @@
  * Copyright (c) 2003-2004 IBM Corp.
  */
 
+#include <linux/acpi.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/export.h>
@@ -56,6 +57,39 @@ static struct device_type drm_sysfs_device_connector = {
 
 struct class *drm_class;
 
+#ifdef CONFIG_ACPI
+static bool drm_connector_acpi_bus_match(struct device *dev)
+{
+	return dev->type == &drm_sysfs_device_connector;
+}
+
+static struct acpi_device *drm_connector_acpi_find_companion(struct device *dev)
+{
+	struct drm_connector *connector = to_drm_connector(dev);
+
+	return to_acpi_device_node(connector->fwnode);
+}
+
+static struct acpi_bus_type drm_connector_acpi_bus = {
+	.name = "drm_connector",
+	.match = drm_connector_acpi_bus_match,
+	.find_companion = drm_connector_acpi_find_companion,
+};
+
+static void drm_sysfs_acpi_register(void)
+{
+	register_acpi_bus_type(&drm_connector_acpi_bus);
+}
+
+static void drm_sysfs_acpi_unregister(void)
+{
+	unregister_acpi_bus_type(&drm_connector_acpi_bus);
+}
+#else
+static void drm_sysfs_acpi_register(void) { }
+static void drm_sysfs_acpi_unregister(void) { }
+#endif
+
 static char *drm_devnode(struct device *dev, umode_t *mode)
 {
 	return kasprintf(GFP_KERNEL, "dri/%s", dev_name(dev));
@@ -89,6 +123,8 @@ int drm_sysfs_init(void)
 	}
 
 	drm_class->devnode = drm_devnode;
+
+	drm_sysfs_acpi_register();
 	return 0;
 }
 
@@ -101,6 +137,7 @@ void drm_sysfs_destroy(void)
 {
 	if (IS_ERR_OR_NULL(drm_class))
 		return;
+	drm_sysfs_acpi_unregister();
 	class_remove_file(drm_class, &class_attr_version.attr);
 	class_destroy(drm_class);
 	drm_class = NULL;
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 714d1a01c065..56aae0d5e2f8 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1223,6 +1223,14 @@ struct drm_connector {
 	struct device *kdev;
 	/** @attr: sysfs attributes */
 	struct device_attribute *attr;
+	/**
+	 * @fwnode: associated fwnode supplied by platform firmware
+	 *
+	 * Drivers can set this to associate a fwnode with a connector, drivers
+	 * are expected to get a reference on the fwnode when setting this.
+	 * drm_connector_cleanup() will call fwnode_handle_put() on this.
+	 */
+	struct fwnode_handle *fwnode;
 
 	/**
 	 * @head:
-- 
2.31.1


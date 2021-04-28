Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2953C433ED
	for <platform-driver-x86@archiver.kernel.org>; Wed, 28 Apr 2021 21:53:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 778D36135B
	for <platform-driver-x86@archiver.kernel.org>; Wed, 28 Apr 2021 21:53:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230520AbhD1VyH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 28 Apr 2021 17:54:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52608 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229942AbhD1VyG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 28 Apr 2021 17:54:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1619646800;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ERBBDzY8cgN0bD72/H5ijzJDtmdBQ5XjP50xYJ8nAQo=;
        b=NAGpx/Sh5TiF8ZRf17/fIIzpvs/AnH98+mrnubX/xo8MKaYp98WMEIOBmZkQl3y20FhlUW
        amVw5ZJvN/Em3+TYw1qr99yNxCngltArkn6tfpvLVioANF24MCniBxlP4TR04t/KWjPnp/
        R4x3UJgZ62UZnpwiIgimZSI2RS2nuI8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-01z3OwsINiWgdNb5_e3jNQ-1; Wed, 28 Apr 2021 17:53:18 -0400
X-MC-Unique: 01z3OwsINiWgdNb5_e3jNQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D8D1107ACC7;
        Wed, 28 Apr 2021 21:53:17 +0000 (UTC)
Received: from x1.localdomain (ovpn-115-166.ams2.redhat.com [10.36.115.166])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 5A8DB5C1BB;
        Wed, 28 Apr 2021 21:53:14 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org,
        platform-driver-x86@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH 3/9] drm/connector: Add drm_connector_find_by_fwnode() function
Date:   Wed, 28 Apr 2021 23:52:51 +0200
Message-Id: <20210428215257.500088-4-hdegoede@redhat.com>
In-Reply-To: <20210428215257.500088-1-hdegoede@redhat.com>
References: <20210428215257.500088-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add a function which allows other subsystems to find a connector
based on a fwnode.

This will be used by the USB-Type-C code to be able to find the DP
connector to which to send hotplug events received by a Type-C port in
DP-alternate-mode.

Note this function is defined in drivers/gpu/drm/drm_sysfs.c because it
needs access to the drm_sysfs_device_connector device_type struct.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/drm_sysfs.c | 38 +++++++++++++++++++++++++++++++++++++
 include/drm/drm_connector.h |  1 +
 2 files changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
index c1d3e2b843b7..ca71c46fad78 100644
--- a/drivers/gpu/drm/drm_sysfs.c
+++ b/drivers/gpu/drm/drm_sysfs.c
@@ -520,3 +520,41 @@ void drm_class_device_unregister(struct device *dev)
 	return device_unregister(dev);
 }
 EXPORT_SYMBOL_GPL(drm_class_device_unregister);
+
+/**
+ * drm_connector_find_by_fwnode - Find a connector based on the associated fwnode
+ * @fwnode: fwnode for which to find the matching drm_connector
+ *
+ * This functions looks up a drm_connector based on its associated fwnode. When
+ * a connector is found a reference to the connector is returned. The caller must
+ * call drm_connector_put() to release this reference when it is done with the
+ * connector.
+ *
+ * Returns: A reference to the found connector or NULL if no matching connector was found
+ */
+struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
+{
+	struct drm_connector *connector, *found = NULL;
+	struct class_dev_iter iter;
+	struct device *dev;
+
+	if (!fwnode)
+		return NULL;
+
+	class_dev_iter_init(&iter, drm_class, NULL, &drm_sysfs_device_connector);
+	while ((dev = class_dev_iter_next(&iter))) {
+		connector = to_drm_connector(dev);
+
+		if ((connector->fwnode == fwnode) ||
+		    (connector->fwnode && connector->fwnode->secondary == fwnode)) {
+			drm_connector_get(connector);
+			found = connector;
+			break;
+		}
+
+	}
+	class_dev_iter_exit(&iter);
+
+	return found;
+}
+EXPORT_SYMBOL(drm_connector_find_by_fwnode);
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index d20bfd7576ed..1e5d154d1f4a 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1696,6 +1696,7 @@ drm_connector_is_unregistered(struct drm_connector *connector)
 		DRM_CONNECTOR_UNREGISTERED;
 }
 
+struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode);
 const char *drm_get_connector_type_name(unsigned int connector_type);
 const char *drm_get_connector_status_name(enum drm_connector_status status);
 const char *drm_get_subpixel_order_name(enum subpixel_order order);
-- 
2.31.1


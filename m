Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3E7FC43460
	for <platform-driver-x86@archiver.kernel.org>; Wed, 28 Apr 2021 21:53:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A87F96115B
	for <platform-driver-x86@archiver.kernel.org>; Wed, 28 Apr 2021 21:53:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231368AbhD1VyM (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 28 Apr 2021 17:54:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28002 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231400AbhD1VyM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 28 Apr 2021 17:54:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1619646806;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WQDbdJA2WYqaP/uXXHe6PlOJwt4ys8knj5XPUgLLHMk=;
        b=b3MR6jWOKRy3rHTCmAHduAmBj7XadpqmXtfSW6uM49NUvmePEVt8wGNjiraBIov9PEHo0Z
        eiS3Qb0wuIUAS37Ta0djORAwnMJjmdP+3DtbCJQmT/X3EaLy3YwBD84YpU9xFI5aGD4Cay
        IbAdF3sEeGDK2Z+5PG4XAkwWjT6vWOM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-2kv8Tav3Ol6MPZvC4kl5Fg-1; Wed, 28 Apr 2021 17:53:23 -0400
X-MC-Unique: 2kv8Tav3Ol6MPZvC4kl5Fg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 412A3107ACCA;
        Wed, 28 Apr 2021 21:53:21 +0000 (UTC)
Received: from x1.localdomain (ovpn-115-166.ams2.redhat.com [10.36.115.166])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 576795C1BB;
        Wed, 28 Apr 2021 21:53:17 +0000 (UTC)
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
Subject: [PATCH 4/9] drm/connector: Add support for out-of-band hotplug notification
Date:   Wed, 28 Apr 2021 23:52:52 +0200
Message-Id: <20210428215257.500088-5-hdegoede@redhat.com>
In-Reply-To: <20210428215257.500088-1-hdegoede@redhat.com>
References: <20210428215257.500088-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add a new drm_connector_oob_hotplug_event() function and
oob_hotplug_event drm_connector_funcs member.

On some hardware a hotplug event notification may come from outside the
display driver / device. An example of this is some USB Type-C setups
where the hardware muxes the DisplayPort data and aux-lines but does
not pass the altmode HPD status bit to the GPU's DP HPD pin.

In cases like this the new drm_connector_oob_hotplug_event() function can
be used to report these out-of-band events after obtaining a drm_connector
reference through calling drm_connector_find_by_fwnode().

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/drm_connector.c | 20 ++++++++++++++++++++
 include/drm/drm_connector.h     | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 87c68563e6c3..7d3adc41c11a 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -2676,6 +2676,26 @@ int drm_mode_getconnector(struct drm_device *dev, void *data,
 	return ret;
 }
 
+/**
+ * drm_connector_oob_hotplug_event - Report out-of-band hotplug event to connector
+ * @connector: connector to report the event on
+ * @data: data related to the event
+ *
+ * On some hardware a hotplug event notification may come from outside the display
+ * driver / device. An example of this is some USB Type-C setups where the hardware
+ * muxes the DisplayPort data and aux-lines but does not pass the altmode HPD
+ * status bit to the GPU's DP HPD pin.
+ *
+ * This function can be used to report these out-of-band events after obtaining
+ * a drm_connector reference through calling drm_connector_find_by_fwnode().
+ */
+void drm_connector_oob_hotplug_event(struct drm_connector *connector,
+				     struct drm_connector_oob_hotplug_event_data *data)
+{
+	if (connector->funcs->oob_hotplug_event)
+		connector->funcs->oob_hotplug_event(connector, data);
+}
+EXPORT_SYMBOL(drm_connector_oob_hotplug_event);
 
 /**
  * DOC: Tile group
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 1e5d154d1f4a..6a10f8890809 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -27,6 +27,7 @@
 #include <linux/llist.h>
 #include <linux/ctype.h>
 #include <linux/hdmi.h>
+#include <linux/usb/typec.h> /* For enum typec_orientation */
 #include <drm/drm_mode_object.h>
 #include <drm/drm_util.h>
 
@@ -649,6 +650,27 @@ struct drm_connector_tv_margins {
 	unsigned int top;
 };
 
+/**
+ * struct drm_connector_oob_hotplug_event_data: OOB hotplug event data
+ *
+ * Contains data about out-of-band hotplug events, signalled through
+ * drm_connector_oob_hotplug_event().
+ */
+struct drm_connector_oob_hotplug_event_data {
+	/**
+	 * @connected: New connected status for the connector.
+	 */
+	bool connected;
+	/**
+	 * @dp_lanes: Number of available displayport lanes, 0 if unknown.
+	 */
+	int dp_lanes;
+	/**
+	 * @orientation: Connector orientation.
+	 */
+	enum typec_orientation orientation;
+};
+
 /**
  * struct drm_tv_connector_state - TV connector related states
  * @subconnector: selected subconnector
@@ -1110,6 +1132,15 @@ struct drm_connector_funcs {
 	 */
 	void (*atomic_print_state)(struct drm_printer *p,
 				   const struct drm_connector_state *state);
+
+	/**
+	 * @oob_hotplug_event:
+	 *
+	 * This will get called when a hotplug-event for a drm-connector
+	 * has been received from a source outside the display driver / device.
+	 */
+	void (*oob_hotplug_event)(struct drm_connector *connector,
+				  struct drm_connector_oob_hotplug_event_data *data);
 };
 
 /**
@@ -1697,6 +1728,8 @@ drm_connector_is_unregistered(struct drm_connector *connector)
 }
 
 struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode);
+void drm_connector_oob_hotplug_event(struct drm_connector *connector,
+				     struct drm_connector_oob_hotplug_event_data *data);
 const char *drm_get_connector_type_name(unsigned int connector_type);
 const char *drm_get_connector_status_name(enum drm_connector_status status);
 const char *drm_get_subpixel_order_name(enum subpixel_order order);
-- 
2.31.1


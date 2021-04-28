Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B03D9C433ED
	for <platform-driver-x86@archiver.kernel.org>; Wed, 28 Apr 2021 21:53:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 71D5A6115B
	for <platform-driver-x86@archiver.kernel.org>; Wed, 28 Apr 2021 21:53:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230166AbhD1Vx7 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 28 Apr 2021 17:53:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50155 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229890AbhD1Vx7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 28 Apr 2021 17:53:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1619646793;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CHPFfFBaEv5BhiohhcETCsT/UQLEXf89TQ8+clFnID0=;
        b=MydZZSa/1xbutMQIzvch8SwuKVlsaBQjh0+3zUFWbIsCMz1RcHl+ogjNFxcn+o7msV1afJ
        +1VPNJR85lrPDjQJqKwUopcDeUqsLEW+CLCYQXPtJ8Hqaj087+NAa8ZEXTL/3w8sYkhFjB
        4QRRQY/H3bpZLSQT4A3tgrFG7JZ4TqQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-5jHzSbalNpmuGHHKzLbFxw-1; Wed, 28 Apr 2021 17:53:10 -0400
X-MC-Unique: 5jHzSbalNpmuGHHKzLbFxw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C76E803620;
        Wed, 28 Apr 2021 21:53:08 +0000 (UTC)
Received: from x1.localdomain (ovpn-115-166.ams2.redhat.com [10.36.115.166])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 862C161D2D;
        Wed, 28 Apr 2021 21:53:03 +0000 (UTC)
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
Subject: [PATCH 1/9] drm/connector: Make the drm_sysfs connector->kdev device hold a reference to the connector
Date:   Wed, 28 Apr 2021 23:52:49 +0200
Message-Id: <20210428215257.500088-2-hdegoede@redhat.com>
In-Reply-To: <20210428215257.500088-1-hdegoede@redhat.com>
References: <20210428215257.500088-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Userspace could hold open a reference to the connector->kdev device,
through e.g. holding a sysfs-atrtribute open after
drm_sysfs_connector_remove() has been called. In this case the connector
could be free-ed while the connector->kdev device's drvdata is still
pointing to it.

Give drm_connector devices there own device type, which allows
us to specify our own release function and make drm_sysfs_connector_add()
take a reference on the connector object, and have the new release
function put the reference when the device is released.

Giving drm_connector devices there own device type, will also allow
checking if a device is a drm_connector device with a
"if (device->type == &drm_sysfs_device_connector)" check.

Note that the setting of the name member of the device_type struct will
cause udev events for drm_connector-s to now contain DEVTYPE=drm_connector
as extra info. So this extends the uevent part of the userspace API.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/drm_sysfs.c | 54 +++++++++++++++++++++++++++++++------
 1 file changed, 46 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
index f0336c804639..c344c6d5e738 100644
--- a/drivers/gpu/drm/drm_sysfs.c
+++ b/drivers/gpu/drm/drm_sysfs.c
@@ -50,6 +50,10 @@ static struct device_type drm_sysfs_device_minor = {
 	.name = "drm_minor"
 };
 
+static struct device_type drm_sysfs_device_connector = {
+	.name = "drm_connector",
+};
+
 struct class *drm_class;
 
 static char *drm_devnode(struct device *dev, umode_t *mode)
@@ -271,30 +275,64 @@ static const struct attribute_group *connector_dev_groups[] = {
 	NULL
 };
 
+static void drm_sysfs_connector_release(struct device *dev)
+{
+	struct drm_connector *connector = to_drm_connector(dev);
+
+	drm_connector_put(connector);
+	kfree(dev);
+}
+
 int drm_sysfs_connector_add(struct drm_connector *connector)
 {
 	struct drm_device *dev = connector->dev;
+	struct device *kdev;
+	int r;
 
 	if (connector->kdev)
 		return 0;
 
-	connector->kdev =
-		device_create_with_groups(drm_class, dev->primary->kdev, 0,
-					  connector, connector_dev_groups,
-					  "card%d-%s", dev->primary->index,
-					  connector->name);
+	kdev = kzalloc(sizeof(*kdev), GFP_KERNEL);
+	if (!kdev)
+		return -ENOMEM;
+
+	device_initialize(kdev);
+	kdev->class = drm_class;
+	kdev->type = &drm_sysfs_device_connector;
+	kdev->parent = dev->primary->kdev;
+	kdev->groups = connector_dev_groups;
+	kdev->release = drm_sysfs_connector_release;
+	dev_set_drvdata(kdev, connector);
+
+	r = dev_set_name(kdev, "card%d-%s", dev->primary->index, connector->name);
+	if (r)
+		goto err_free;
+
 	DRM_DEBUG("adding \"%s\" to sysfs\n",
 		  connector->name);
 
-	if (IS_ERR(connector->kdev)) {
-		DRM_ERROR("failed to register connector device: %ld\n", PTR_ERR(connector->kdev));
-		return PTR_ERR(connector->kdev);
+	r = device_add(kdev);
+	if (r) {
+		DRM_ERROR("failed to register connector device: %d\n", r);
+		goto err_free;
 	}
 
+	/*
+	 * Ensure the connector object does not get free-ed if userspace still has
+	 * references open to the device through e.g. the connector sysfs-attributes.
+	 */
+	drm_connector_get(connector);
+
+	connector->kdev = kdev;
+
 	if (connector->ddc)
 		return sysfs_create_link(&connector->kdev->kobj,
 				 &connector->ddc->dev.kobj, "ddc");
 	return 0;
+
+err_free:
+	put_device(kdev);
+	return r;
 }
 
 void drm_sysfs_connector_remove(struct drm_connector *connector)
-- 
2.31.1


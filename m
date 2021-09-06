Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52F62C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon,  6 Sep 2021 07:35:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 37D5560E8B
	for <platform-driver-x86@archiver.kernel.org>; Mon,  6 Sep 2021 07:35:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240188AbhIFHg5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 6 Sep 2021 03:36:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31041 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239974AbhIFHg5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 6 Sep 2021 03:36:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1630913753;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XE0VVY65Ll2sCtE26jyM5/18Lb7fjFHBt4PVQazCjf0=;
        b=eLsMSn6K8CXuTHnjcolB5iGIBkEZc8JH5BP/84DVyXdplBEUn7eNhJFYLl4IpLFkvV18nR
        v2dKAcayP7H89DSpUZg5QHzFEU+CN6Jw+bOiSZSIJB0bxvy5OJq+bjMyX8/vxX0ta98ZiA
        oPYC3Ne7mULio1WUIR/kHRIa7gdtyMk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-T3xe_YDCNeS2y6owuXfBug-1; Mon, 06 Sep 2021 03:35:51 -0400
X-MC-Unique: T3xe_YDCNeS2y6owuXfBug-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CBEBD501E0;
        Mon,  6 Sep 2021 07:35:48 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.133])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 8574F17A98;
        Mon,  6 Sep 2021 07:35:44 +0000 (UTC)
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
Subject: [PATCH 4/9] drm/privacy-screen: Add notifier support
Date:   Mon,  6 Sep 2021 09:35:14 +0200
Message-Id: <20210906073519.4615-5-hdegoede@redhat.com>
In-Reply-To: <20210906073519.4615-1-hdegoede@redhat.com>
References: <20210906073519.4615-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add support for privacy-screen consumers to register a notifier to
be notified of external (e.g. done by the hw itself on a hotkey press)
state changes.

Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/drm_privacy_screen.c      | 67 +++++++++++++++++++++++
 include/drm/drm_privacy_screen_consumer.h | 15 +++++
 include/drm/drm_privacy_screen_driver.h   |  4 ++
 3 files changed, 86 insertions(+)

diff --git a/drivers/gpu/drm/drm_privacy_screen.c b/drivers/gpu/drm/drm_privacy_screen.c
index 294a09194bfb..7a5f878c3171 100644
--- a/drivers/gpu/drm/drm_privacy_screen.c
+++ b/drivers/gpu/drm/drm_privacy_screen.c
@@ -255,6 +255,49 @@ void drm_privacy_screen_get_state(struct drm_privacy_screen *priv,
 }
 EXPORT_SYMBOL(drm_privacy_screen_get_state);
 
+/**
+ * drm_privacy_screen_register_notifier - register a notifier
+ * @priv: Privacy screen to register the notifier with
+ * @nb: Notifier-block for the notifier to register
+ *
+ * Register a notifier with the privacy-screen to be notified of changes made
+ * to the privacy-screen state from outside of the privacy-screen class.
+ * E.g. the state may be changed by the hardware itself in response to a
+ * hotkey press.
+ *
+ * The notifier is called with no locks held. The new hw_state and sw_state
+ * can be retrieved using the drm_privacy_screen_get_state() function.
+ * A pointer to the drm_privacy_screen's struct is passed as the void *data
+ * argument of the notifier_block's notifier_call.
+ *
+ * The notifier will NOT be called when changes are made through
+ * drm_privacy_screen_set_sw_state(). It is only called for external changes.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int drm_privacy_screen_register_notifier(struct drm_privacy_screen *priv,
+					 struct notifier_block *nb)
+{
+	return blocking_notifier_chain_register(&priv->notifier_head, nb);
+}
+EXPORT_SYMBOL(drm_privacy_screen_register_notifier);
+
+/**
+ * drm_privacy_screen_unregister_notifier - unregister a notifier
+ * @priv: Privacy screen to register the notifier with
+ * @nb: Notifier-block for the notifier to register
+ *
+ * Unregister a notifier registered with drm_privacy_screen_register_notifier().
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int drm_privacy_screen_unregister_notifier(struct drm_privacy_screen *priv,
+					   struct notifier_block *nb)
+{
+	return blocking_notifier_chain_unregister(&priv->notifier_head, nb);
+}
+EXPORT_SYMBOL(drm_privacy_screen_unregister_notifier);
+
 /*** drm_privacy_screen_driver.h functions ***/
 
 static ssize_t sw_state_show(struct device *dev,
@@ -352,6 +395,7 @@ struct drm_privacy_screen *drm_privacy_screen_register(
 		return ERR_PTR(-ENOMEM);
 
 	mutex_init(&priv->lock);
+	BLOCKING_INIT_NOTIFIER_HEAD(&priv->notifier_head);
 
 	priv->dev.class = drm_class;
 	priv->dev.type = &drm_privacy_screen_type;
@@ -399,3 +443,26 @@ void drm_privacy_screen_unregister(struct drm_privacy_screen *priv)
 	device_unregister(&priv->dev);
 }
 EXPORT_SYMBOL(drm_privacy_screen_unregister);
+
+/**
+ * drm_privacy_screen_call_notifier_chain - notify consumers of state change
+ * @priv: Privacy screen to register the notifier with
+ *
+ * A privacy-screen provider driver can call this functions upon external
+ * changes to the privacy-screen state. E.g. the state may be changed by the
+ * hardware itself in response to a hotkey press.
+ * This function must be called without holding the privacy-screen lock.
+ * the driver must update sw_state and hw_state to reflect the new state before
+ * calling this function.
+ * The expected behavior from the driver upon receiving an external state
+ * change event is: 1. Take the lock; 2. Update sw_state and hw_state;
+ * 3. Release the lock. 4. Call drm_privacy_screen_call_notifier_chain().
+ */
+void drm_privacy_screen_call_notifier_chain(struct drm_privacy_screen *priv)
+{
+	if (WARN_ON(mutex_is_locked(&priv->lock)))
+		return;
+
+	blocking_notifier_call_chain(&priv->notifier_head, 0, priv);
+}
+EXPORT_SYMBOL(drm_privacy_screen_call_notifier_chain);
diff --git a/include/drm/drm_privacy_screen_consumer.h b/include/drm/drm_privacy_screen_consumer.h
index 0cbd23b0453d..7f66a90d15b7 100644
--- a/include/drm/drm_privacy_screen_consumer.h
+++ b/include/drm/drm_privacy_screen_consumer.h
@@ -24,6 +24,11 @@ int drm_privacy_screen_set_sw_state(struct drm_privacy_screen *priv,
 void drm_privacy_screen_get_state(struct drm_privacy_screen *priv,
 				  enum drm_privacy_screen_status *sw_state_ret,
 				  enum drm_privacy_screen_status *hw_state_ret);
+
+int drm_privacy_screen_register_notifier(struct drm_privacy_screen *priv,
+					 struct notifier_block *nb);
+int drm_privacy_screen_unregister_notifier(struct drm_privacy_screen *priv,
+					   struct notifier_block *nb);
 #else
 static inline struct drm_privacy_screen *drm_privacy_screen_get(struct device *dev,
 								const char *con_id)
@@ -45,6 +50,16 @@ static inline void drm_privacy_screen_get_state(struct drm_privacy_screen *priv,
 	*sw_state_ret = PRIVACY_SCREEN_DISABLED;
 	*hw_state_ret = PRIVACY_SCREEN_DISABLED;
 }
+static inline int drm_privacy_screen_register_notifier(struct drm_privacy_screen *priv,
+						       struct notifier_block *nb)
+{
+	return -ENODEV;
+}
+static inline int drm_privacy_screen_unregister_notifier(struct drm_privacy_screen *priv,
+							 struct notifier_block *nb)
+{
+	return -ENODEV;
+}
 #endif
 
 #endif
diff --git a/include/drm/drm_privacy_screen_driver.h b/include/drm/drm_privacy_screen_driver.h
index 5187ae52eb03..24591b607675 100644
--- a/include/drm/drm_privacy_screen_driver.h
+++ b/include/drm/drm_privacy_screen_driver.h
@@ -54,6 +54,8 @@ struct drm_privacy_screen {
 	struct mutex lock;
 	/** @list: privacy-screen devices list list-entry. */
 	struct list_head list;
+	/** @notifier_head: privacy-screen notifier head. */
+	struct blocking_notifier_head notifier_head;
 	/**
 	 * @ops: &struct drm_privacy_screen_ops for this privacy-screen.
 	 * This is NULL if the driver has unregistered the privacy-screen.
@@ -77,4 +79,6 @@ struct drm_privacy_screen *drm_privacy_screen_register(
 	struct device *parent, const struct drm_privacy_screen_ops *ops);
 void drm_privacy_screen_unregister(struct drm_privacy_screen *priv);
 
+void drm_privacy_screen_call_notifier_chain(struct drm_privacy_screen *priv);
+
 #endif
-- 
2.31.1


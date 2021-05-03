Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF09AC43460
	for <platform-driver-x86@archiver.kernel.org>; Mon,  3 May 2021 15:47:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7BA2D600CC
	for <platform-driver-x86@archiver.kernel.org>; Mon,  3 May 2021 15:47:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230478AbhECPsL (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 3 May 2021 11:48:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48833 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230448AbhECPsL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 3 May 2021 11:48:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620056837;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=anbAqr+B18UJD0ROosbVNOxc6A3+H/xmJXK4QX2H7os=;
        b=FET5l0nH/u4b4Uizvvdvrp+5kzRNuCpB3ZPhwlZO+2b4T9hbS8ojgdqMEe0mDf4gThxlQr
        zixgjkAZTdKgiipS9aMizaghY+Din2gzOcxwg/Lu7xkwWKGqoN+HXoa779TNrR0kPNzsgs
        Mur/VSEn6EPD7rOqGmIVwa3Hwx2B8UU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-YATCiBC3Nt2q5tCRyO5Fyg-1; Mon, 03 May 2021 11:47:16 -0400
X-MC-Unique: YATCiBC3Nt2q5tCRyO5Fyg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 29AE88042AD;
        Mon,  3 May 2021 15:47:14 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-158.ams2.redhat.com [10.36.112.158])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 685DE1007610;
        Mon,  3 May 2021 15:47:11 +0000 (UTC)
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
Subject: [PATCH 6/9] drm/i915/dp: Add support for out-of-bound hotplug events
Date:   Mon,  3 May 2021 17:46:44 +0200
Message-Id: <20210503154647.142551-7-hdegoede@redhat.com>
In-Reply-To: <20210503154647.142551-1-hdegoede@redhat.com>
References: <20210503154647.142551-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On some Cherry Trail devices, DisplayPort over Type-C is supported through
a USB-PD microcontroller (e.g. a fusb302) + a mux to switch the superspeed
datalines between USB-3 and DP (e.g. a pi3usb30532). The kernel in this
case does the PD/alt-mode negotiation itself, rather then everything being
handled in firmware.

So the kernel itself picks an alt-mode, tells the Type-C "dongle" to switch
to DP mode and sets the mux accordingly. In this setup the HPD pin is not
connected, so the i915 driver needs to respond to a software event and scan
the DP port for changes manually.

This commit adds support for this. Together with the recent addition of
DP alt-mode support to the Type-C subsystem this makes DP over Type-C
work on these devices.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 64a73b3ced94..1029720cc945 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -5846,6 +5846,18 @@ static int intel_dp_connector_atomic_check(struct drm_connector *conn,
 	return intel_modeset_synced_crtcs(state, conn);
 }
 
+static void intel_dp_oob_hotplug_event(struct drm_connector *connector,
+				       struct drm_connector_oob_hotplug_event_data *data)
+{
+	struct intel_encoder *encoder = intel_attached_encoder(to_intel_connector(connector));
+	struct drm_i915_private *i915 = to_i915(connector->dev);
+
+	spin_lock_irq(&i915->irq_lock);
+	i915->hotplug.event_bits |= BIT(encoder->hpd_pin);
+	spin_unlock_irq(&i915->irq_lock);
+	queue_delayed_work(system_wq, &i915->hotplug.hotplug_work, 0);
+}
+
 static const struct drm_connector_funcs intel_dp_connector_funcs = {
 	.force = intel_dp_force,
 	.fill_modes = drm_helper_probe_single_connector_modes,
@@ -5856,6 +5868,7 @@ static const struct drm_connector_funcs intel_dp_connector_funcs = {
 	.destroy = intel_connector_destroy,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 	.atomic_duplicate_state = intel_digital_connector_duplicate_state,
+	.oob_hotplug_event = intel_dp_oob_hotplug_event,
 };
 
 static const struct drm_connector_helper_funcs intel_dp_connector_helper_funcs = {
-- 
2.31.1


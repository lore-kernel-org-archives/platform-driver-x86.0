Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1787C43331
	for <platform-driver-x86@archiver.kernel.org>; Fri, 15 Jan 2021 16:20:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B8984238EE
	for <platform-driver-x86@archiver.kernel.org>; Fri, 15 Jan 2021 16:20:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726669AbhAOQU1 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 15 Jan 2021 11:20:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30989 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726801AbhAOQU0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 15 Jan 2021 11:20:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1610727540;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=n/IyGGyAtzldC2xck5zJKauolrnnq/fedN1dZDSs/RU=;
        b=FaaZ4s79haiVGwkfdwM6zJrH3T0cdYxjSYh0QJvC1EmMbzxVW4SVhfVmsOKSX2JS7lXlBR
        Tvet4cUwK3wEO1zj/izSTQM9vRSQJ1+x7GXwsUknFUpYBzoDhW1Tbxqj4/UXxCyQtiXUP+
        2sWT9s9T2PJ7CJ3BypP2PbP3aAonhjk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-mV29elQvM1GnAx_yCcavlQ-1; Fri, 15 Jan 2021 11:18:56 -0500
X-MC-Unique: mV29elQvM1GnAx_yCcavlQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A294100E424;
        Fri, 15 Jan 2021 16:18:55 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-172.ams2.redhat.com [10.36.112.172])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4393B5C276;
        Fri, 15 Jan 2021 16:18:54 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org,
        Elia Devito <eliadevito@gmail.com>
Subject: [PATCH 3/4] platform/x86: intel-vbtn: Add alternative method to enable switches
Date:   Fri, 15 Jan 2021 17:18:49 +0100
Message-Id: <20210115161850.117614-3-hdegoede@redhat.com>
In-Reply-To: <20210115161850.117614-1-hdegoede@redhat.com>
References: <20210115161850.117614-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Some 2-in-1s have a broken VGBS method, so we cannot get an initial
state for the switches from them. Reporting the wrong initial state for
SW_TABLET_MODE causes serious problems (touchpad and/or keyboard events
being ignored by userspace when reporting SW_TABLET_MODE=1), so on these
devices we cannot register an input-dev for the switches at probe time.

We can however register an input-dev for the switches as soon as we
receive the first switches event, because then we will know the state.

Note this mirrors the behavior of recent changs to the intel-hid driver
which also registers a separate switches input-dev on receiving the
first event on machines with a broken VGBS method.

Cc: Elia Devito <eliadevito@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel-vbtn.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel-vbtn.c b/drivers/platform/x86/intel-vbtn.c
index 04725173d087..852cb07c3dfd 100644
--- a/drivers/platform/x86/intel-vbtn.c
+++ b/drivers/platform/x86/intel-vbtn.c
@@ -145,6 +145,7 @@ static void notify_handler(acpi_handle handle, u32 event, void *context)
 	const struct key_entry *ke, *ke_rel;
 	struct input_dev *input_dev;
 	bool autorelease;
+	int ret;
 
 	if ((ke = sparse_keymap_entry_from_scancode(priv->buttons_dev, event))) {
 		if (!priv->has_buttons) {
@@ -154,8 +155,12 @@ static void notify_handler(acpi_handle handle, u32 event, void *context)
 		input_dev = priv->buttons_dev;
 	} else if ((ke = sparse_keymap_entry_from_scancode(priv->switches_dev, event))) {
 		if (!priv->has_switches) {
-			dev_warn(&device->dev, "Warning: received a switches event on a device without switchess, please report this.\n");
-			return;
+			dev_info(&device->dev, "Registering Intel Virtual Switches input-dev after receiving a switch event\n");
+			ret = input_register_device(priv->switches_dev);
+			if (ret)
+				return;
+
+			priv->has_switches = true;
 		}
 		input_dev = priv->switches_dev;
 	} else {
-- 
2.28.0


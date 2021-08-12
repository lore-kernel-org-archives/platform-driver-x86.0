Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFFD1C4338F
	for <platform-driver-x86@archiver.kernel.org>; Thu, 12 Aug 2021 14:56:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8FA0E60724
	for <platform-driver-x86@archiver.kernel.org>; Thu, 12 Aug 2021 14:56:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237036AbhHLO43 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 12 Aug 2021 10:56:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31170 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237171AbhHLO42 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 12 Aug 2021 10:56:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1628780162;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=ZNk3qNOi4hGOVgqO6hXbzlPLzBtmemGADDhDxcGeIOY=;
        b=YNfALpPhg/3txF25CF1+eF+WqeAingOghtT+mazRjWB9DzgG5PgsQ5QNtKF4nDIcQ/DNEa
        0zmvI2wAmyowkkxo1ehNTD/zoTQYhv443mtiGuYIUYMWI8NVyUZoqI2zyYjIEc7wQoFmIO
        fth4ExfIjX173GytAdpCGZSCmv6K9hc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-VmjC3ZwtMBqfLwqMgA_yPg-1; Thu, 12 Aug 2021 10:55:16 -0400
X-MC-Unique: VmjC3ZwtMBqfLwqMgA_yPg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C1461008061;
        Thu, 12 Aug 2021 14:55:15 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.192.195])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 738F260BF1;
        Thu, 12 Aug 2021 14:55:14 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 1/2] platform/x86: asus-nb-wmi: Allow configuring SW_TABLET_MODE method with a module option
Date:   Thu, 12 Aug 2021 16:55:12 +0200
Message-Id: <20210812145513.39117-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Unfortunately we have been unable to find a reliable way to detect if
and how SW_TABLET_MODE reporting is supported, so we are relying on
DMI quirks for this.

Add a module-option to specify the SW_TABLET_MODE method so that this can
be easily tested without needing to rebuild the kernel.

BugLink: https://gitlab.freedesktop.org/libinput/libinput/-/issues/639
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/asus-nb-wmi.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index 0cb927f0f301..9929eedf7dd8 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -41,6 +41,10 @@ static int wapf = -1;
 module_param(wapf, uint, 0444);
 MODULE_PARM_DESC(wapf, "WAPF value");
 
+static int tablet_mode_sw = -1;
+module_param(tablet_mode_sw, uint, 0444);
+MODULE_PARM_DESC(tablet_mode_sw, "Tablet mode detect: -1:auto 0:disable 1:kbd-dock 2:lid-flip");
+
 static struct quirk_entry *quirks;
 
 static bool asus_q500a_i8042_filter(unsigned char data, unsigned char str,
@@ -477,6 +481,21 @@ static void asus_nb_wmi_quirks(struct asus_wmi_driver *driver)
 	else
 		wapf = quirks->wapf;
 
+	switch (tablet_mode_sw) {
+	case 0:
+		quirks->use_kbd_dock_devid = false;
+		quirks->use_lid_flip_devid = false;
+		break;
+	case 1:
+		quirks->use_kbd_dock_devid = true;
+		quirks->use_lid_flip_devid = false;
+		break;
+	case 2:
+		quirks->use_kbd_dock_devid = false;
+		quirks->use_lid_flip_devid = true;
+		break;
+	}
+
 	if (quirks->i8042_filter) {
 		ret = i8042_install_filter(quirks->i8042_filter);
 		if (ret) {
-- 
2.31.1


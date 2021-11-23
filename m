Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F806C433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 23 Nov 2021 21:04:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233903AbhKWVIE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 23 Nov 2021 16:08:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36722 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233885AbhKWVID (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 23 Nov 2021 16:08:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637701495;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=h5yMwtz65eATvIzGc+0KQrZbsBQxQER0mGPQSvieQDA=;
        b=C8JxmDt8hnBmAm7FTW0Z7F+RREC5ngmSo6i2Jlku7OuKH21zrFSqga+NekmibllUCTV8PJ
        byeBMTGGLScsrzLVypMJEouLnuOpeCh//HimkhgVAdufFMaWAhf5G80W8PTM9SiIekbtiW
        AKXV9a3p/5AuzcUM94zvmo95HO056Mk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-158-HX_GiW4oO6mMn7yDj330LA-1; Tue, 23 Nov 2021 16:04:51 -0500
X-MC-Unique: HX_GiW4oO6mMn7yDj330LA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 671858799EB;
        Tue, 23 Nov 2021 21:04:50 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.192.41])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1BE3279448;
        Tue, 23 Nov 2021 21:04:45 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Mark Pearson <markpearson@lenovo.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, Len Baker <len.baker@gmx.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 5/6] platform/x86: thinkpad_acpi: Remove unused sensors_pdev_attrs_registered flag
Date:   Tue, 23 Nov 2021 22:04:23 +0100
Message-Id: <20211123210424.266607-6-hdegoede@redhat.com>
In-Reply-To: <20211123210424.266607-1-hdegoede@redhat.com>
References: <20211123210424.266607-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

After the recent sysfs-attributes registration cleanups, the
tp_features.sensors_pdev_attrs_registered flag only ever gets set and
never gets read, remove it.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 2f290ed59d92..392af8f1c213 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -335,7 +335,6 @@ static struct {
 	u32 input_device_registered:1;
 	u32 platform_drv_registered:1;
 	u32 sensors_pdrv_registered:1;
-	u32 sensors_pdev_attrs_registered:1;
 	u32 hotkey_poll_active:1;
 	u32 has_adaptive_kbd:1;
 	u32 kbd_lang:1;
@@ -11285,7 +11284,6 @@ static int __init thinkpad_acpi_module_init(void)
 		thinkpad_acpi_module_exit();
 		return ret;
 	}
-	tp_features.sensors_pdev_attrs_registered = 1;
 
 	mutex_init(&tpacpi_inputdev_send_mutex);
 	tpacpi_inputdev = input_allocate_device();
-- 
2.33.1


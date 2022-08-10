Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81968C00140
	for <platform-driver-x86@archiver.kernel.org>; Wed, 10 Aug 2022 14:19:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231310AbiHJOTk (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 10 Aug 2022 10:19:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229816AbiHJOTi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 10 Aug 2022 10:19:38 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3949672867
        for <platform-driver-x86@vger.kernel.org>; Wed, 10 Aug 2022 07:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1660141177;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=8zv7TVkJpGGVh3TRJPhEOFN1D9tkUxZbpRLW766PkD8=;
        b=hJfujxeAfbrjtc892sKVm2W1uTAkFLvoXR5Qo5J9x93dd2sZkSyFRoQ4Nkq93FNwBAMfSK
        O1zsgAe6G1ijKRn31TXfKLcr5aAp3nnirgXAlAS1dMwamM3GLvHHPukP1lPw+hxBZRIj8u
        EBFFiGEwu6W3/pZSaJjRFEg3UfAFJ6k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-TpKU_ot-Nzaihz4GD98uOQ-1; Wed, 10 Aug 2022 10:19:35 -0400
X-MC-Unique: TpKU_ot-Nzaihz4GD98uOQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8FD3085A587;
        Wed, 10 Aug 2022 14:19:35 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.71])
        by smtp.corp.redhat.com (Postfix) with ESMTP id DBBC818EAA;
        Wed, 10 Aug 2022 14:19:34 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: x86-android-tablets: Fix broken touchscreen on Chuwi Hi8 with Windows BIOS
Date:   Wed, 10 Aug 2022 16:19:34 +0200
Message-Id: <20220810141934.140771-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The x86-android-tablets handling for the Chuwi Hi8 is only necessary with
the Android BIOS and it is causing problems with the Windows BIOS version.

Specifically when trying to register the already present touchscreen
x86_acpi_irq_helper_get() calls acpi_unregister_gsi(), this breaks
the working of the touchscreen and also leads to an oops:

[   14.248946] ------------[ cut here ]------------
[   14.248954] remove_proc_entry: removing non-empty directory 'irq/75', leaking at least 'MSSL0001:00'
[   14.248983] WARNING: CPU: 3 PID: 440 at fs/proc/generic.c:718 remove_proc_entry
...
[   14.249293]  unregister_irq_proc+0xe0/0x100
[   14.249305]  free_desc+0x29/0x70
[   14.249312]  irq_free_descs+0x4b/0x80
[   14.249320]  mp_unmap_irq+0x5c/0x60
[   14.249329]  acpi_unregister_gsi_ioapic+0x2a/0x40
[   14.249338]  x86_acpi_irq_helper_get+0x4b/0x190 [x86_android_tablets]
[   14.249355]  x86_android_tablet_init+0x178/0xe34 [x86_android_tablets]

Add an init callback for the Chuwi Hi8, which detects when the Windows BIOS
is in use and exits with -ENODEV in that case, fixing this.

Fixes: 84c2dcdd475f ("platform/x86: x86-android-tablets: Add an init() callback to struct x86_dev_info")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/x86-android-tablets.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/platform/x86/x86-android-tablets.c b/drivers/platform/x86/x86-android-tablets.c
index 480375977435..4acd6fa8d43b 100644
--- a/drivers/platform/x86/x86-android-tablets.c
+++ b/drivers/platform/x86/x86-android-tablets.c
@@ -663,9 +663,23 @@ static const struct x86_i2c_client_info chuwi_hi8_i2c_clients[] __initconst = {
 	},
 };
 
+static int __init chuwi_hi8_init(void)
+{
+	/*
+	 * Avoid the acpi_unregister_gsi() call in x86_acpi_irq_helper_get()
+	 * breaking the touchscreen + logging various errors when the Windows
+	 * BIOS is used.
+	 */
+	if (acpi_dev_present("MSSL0001", NULL, 1))
+		return -ENODEV;
+
+	return 0;
+}
+
 static const struct x86_dev_info chuwi_hi8_info __initconst = {
 	.i2c_client_info = chuwi_hi8_i2c_clients,
 	.i2c_client_count = ARRAY_SIZE(chuwi_hi8_i2c_clients),
+	.init = chuwi_hi8_init,
 };
 
 #define CZC_EC_EXTRA_PORT	0x68
-- 
2.37.1


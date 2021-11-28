Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BC77C4332F
	for <platform-driver-x86@archiver.kernel.org>; Sun, 28 Nov 2021 19:02:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234909AbhK1TF6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 28 Nov 2021 14:05:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32919 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235013AbhK1TDz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 28 Nov 2021 14:03:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1638126038;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=JNPkbDHMdfBGCUHDZr6EoxV7kG1oQ/difFaKEQd1ZWg=;
        b=JYAcOcT8koSHMJW2+hyiwMXA3EllQyDo6JXzkbbJGZY6V4ZcKNs+3gRunCSxA5kfABq2pN
        kByXm/Y5Wav2iUvuTKcZ9lia8D17BtYTBUCJsai+fdLwo/YSVz6KrEtPZafxkzPeR11m83
        IZA2UJ2FIsFyumKRxDkysbbteNWBcWo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-521-QATb4KIsPjayc2yCxeQvaA-1; Sun, 28 Nov 2021 14:00:34 -0500
X-MC-Unique: QATb4KIsPjayc2yCxeQvaA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A14828042F6;
        Sun, 28 Nov 2021 19:00:33 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.65])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 8545660BF1;
        Sun, 28 Nov 2021 19:00:32 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Yauhen Kharuzhy <jekhor@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 1/5] platform/x86: wmi: Replace read_takes_no_args with a flags field
Date:   Sun, 28 Nov 2021 20:00:27 +0100
Message-Id: <20211128190031.405620-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Replace the wmi_block.read_takes_no_args bool field with
an unsigned long flags field, used together with test_bit()
and friends.

This is a preparation patch for fixing a driver->notify() vs ->probe()
race, which requires atomic flag handling.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/wmi.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index c34341f4da76..46178e03aeca 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -57,6 +57,10 @@ static_assert(sizeof(typeof_member(struct guid_block, guid)) == 16);
 static_assert(sizeof(struct guid_block) == 20);
 static_assert(__alignof__(struct guid_block) == 1);
 
+enum {	/* wmi_block flags */
+	WMI_READ_TAKES_NO_ARGS,
+};
+
 struct wmi_block {
 	struct wmi_device dev;
 	struct list_head list;
@@ -67,8 +71,7 @@ struct wmi_block {
 	wmi_notify_handler handler;
 	void *handler_data;
 	u64 req_buf_size;
-
-	bool read_takes_no_args;
+	unsigned long flags;
 };
 
 
@@ -367,7 +370,7 @@ static acpi_status __query_block(struct wmi_block *wblock, u8 instance,
 	wq_params[0].type = ACPI_TYPE_INTEGER;
 	wq_params[0].integer.value = instance;
 
-	if (instance == 0 && wblock->read_takes_no_args)
+	if (instance == 0 && test_bit(WMI_READ_TAKES_NO_ARGS, &wblock->flags))
 		input.count = 0;
 
 	/*
@@ -1113,7 +1116,7 @@ static int wmi_create_device(struct device *wmi_bus_dev,
 	 * laptops, WQxx may not be a method at all.)
 	 */
 	if (info->type != ACPI_TYPE_METHOD || info->param_count == 0)
-		wblock->read_takes_no_args = true;
+		set_bit(WMI_READ_TAKES_NO_ARGS, &wblock->flags);
 
 	kfree(info);
 
-- 
2.33.1


Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CAC6C43217
	for <platform-driver-x86@archiver.kernel.org>; Sun, 28 Nov 2021 19:02:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235013AbhK1TF6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 28 Nov 2021 14:05:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44207 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235157AbhK1TD4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 28 Nov 2021 14:03:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1638126039;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=t0yNtxe5A3saMNo3wIUYOA8oQEDVxy9wLWTsl0ZVl1s=;
        b=CfqrYXE7NVP/+RrECWO7TY9Lbnq/zrWFp4SuFQaV87Xddqx8n5es3O0MQzKtDc3/5rZYhO
        tnmrRw8q1s0N3UEDO3hXrNojDjQNqUWDReQ61CsBMsT+FAQkJePlLhMo4zDBGSIUheuOq3
        NMF34z6804h3aAnbNMrXlwttWPjY1f8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-398-C6qaFY4UPqyGawx8W0yDNA-1; Sun, 28 Nov 2021 14:00:36 -0500
X-MC-Unique: C6qaFY4UPqyGawx8W0yDNA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 127A31006AA0;
        Sun, 28 Nov 2021 19:00:35 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.65])
        by smtp.corp.redhat.com (Postfix) with ESMTP id EC6ED60BF1;
        Sun, 28 Nov 2021 19:00:33 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Yauhen Kharuzhy <jekhor@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 2/5] platform/x86: wmi: Fix driver->notify() vs ->probe() race
Date:   Sun, 28 Nov 2021 20:00:28 +0100
Message-Id: <20211128190031.405620-2-hdegoede@redhat.com>
In-Reply-To: <20211128190031.405620-1-hdegoede@redhat.com>
References: <20211128190031.405620-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The driver core sets struct device->driver before calling out
to the bus' probe() method, this leaves a window where an ACPI
notify may happen on the WMI object before the driver's
probe() method has completed running, causing e.g. the
driver's notify() callback to get called with drvdata
not yet being set leading to a NULL pointer deref.

At a check for this to the WMI core, ensuring that the notify()
callback is not called before the driver is ready.

Fixes: 1686f5444546 ("platform/x86: wmi: Incorporate acpi_install_notify_handler")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/wmi.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index 46178e03aeca..02aba274c4bc 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -59,6 +59,7 @@ static_assert(__alignof__(struct guid_block) == 1);
 
 enum {	/* wmi_block flags */
 	WMI_READ_TAKES_NO_ARGS,
+	WMI_PROBED,
 };
 
 struct wmi_block {
@@ -1008,6 +1009,7 @@ static int wmi_dev_probe(struct device *dev)
 		}
 	}
 
+	set_bit(WMI_PROBED, &wblock->flags);
 	return 0;
 
 probe_misc_failure:
@@ -1025,6 +1027,8 @@ static void wmi_dev_remove(struct device *dev)
 	struct wmi_block *wblock = dev_to_wblock(dev);
 	struct wmi_driver *wdriver = drv_to_wdrv(dev->driver);
 
+	clear_bit(WMI_PROBED, &wblock->flags);
+
 	if (wdriver->filter_callback) {
 		misc_deregister(&wblock->char_dev);
 		kfree(wblock->char_dev.name);
@@ -1322,7 +1326,7 @@ static void acpi_wmi_notify_handler(acpi_handle handle, u32 event,
 		return;
 
 	/* If a driver is bound, then notify the driver. */
-	if (wblock->dev.dev.driver) {
+	if (test_bit(WMI_PROBED, &wblock->flags) && wblock->dev.dev.driver) {
 		struct wmi_driver *driver = drv_to_wdrv(wblock->dev.dev.driver);
 		struct acpi_buffer evdata = { ACPI_ALLOCATE_BUFFER, NULL };
 		acpi_status status;
-- 
2.33.1


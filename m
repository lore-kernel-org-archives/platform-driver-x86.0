Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1334C77B73
	for <platform-driver-x86@archiver.kernel.org>; Sun, 30 Apr 2023 16:59:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230272AbjD3Q7u (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 30 Apr 2023 12:59:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230317AbjD3Q7s (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 30 Apr 2023 12:59:48 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EE5D2709
        for <platform-driver-x86@vger.kernel.org>; Sun, 30 Apr 2023 09:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1682873909;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QncfvbxoisQ0r9XQST3rgFnhIErMKLMQEVSKDtcu3zw=;
        b=b6s4d+bdoEwuoZ8s47h4Qx0az+fE7tz4dzg2+IHWXwNph9Fn1h7iHTl0Tx7B6sHkkg47Xb
        dQXH1Xc36n3aA9zy3XLfwKIU6DzHOafNlnYJIRefQtBkLqzqLOn+7vkRN+/Ry0F5V0ZEgq
        vX8+mkv/Pnc3EgWmIVU2B7HcWTyCy40=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-318-gVDiX9D5MCeTAFmR5RrjDQ-1; Sun, 30 Apr 2023 12:58:25 -0400
X-MC-Unique: gVDiX9D5MCeTAFmR5RrjDQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 100021C06EC1;
        Sun, 30 Apr 2023 16:58:25 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.59])
        by smtp.corp.redhat.com (Postfix) with ESMTP id EA5FE2166B26;
        Sun, 30 Apr 2023 16:58:23 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Yauhen Kharuzhy <jekhor@gmail.com>,
        platform-driver-x86@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: [PATCH v2 06/19] platform/x86: lenovo-yogabook: Switch to DEFINE_SIMPLE_DEV_PM_OPS()
Date:   Sun, 30 Apr 2023 18:57:54 +0200
Message-Id: <20230430165807.472798-7-hdegoede@redhat.com>
In-Reply-To: <20230430165807.472798-1-hdegoede@redhat.com>
References: <20230430165807.472798-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Switch to DEFINE_SIMPLE_DEV_PM_OPS() so that the __maybe_unused can
be dropped from the suspend/resume callbacks.

While at it also drop the _wmi_ part from the callback names in preparation
for making lenovo-yogabook-wmi also work on the Android version of
the Yoga Book 1 which does not have a WMI interface to deal with toggling
the keyboard half between touch-keyboard and wacom-digitizer mode.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/lenovo-yogabook-wmi.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/lenovo-yogabook-wmi.c b/drivers/platform/x86/lenovo-yogabook-wmi.c
index 0b49c7a54bfc..2a46e19893e8 100644
--- a/drivers/platform/x86/lenovo-yogabook-wmi.c
+++ b/drivers/platform/x86/lenovo-yogabook-wmi.c
@@ -346,7 +346,7 @@ static void yogabook_wmi_remove(struct wmi_device *wdev)
 	acpi_dev_put(data->kbd_adev);
 }
 
-static int __maybe_unused yogabook_wmi_suspend(struct device *dev)
+static int yogabook_suspend(struct device *dev)
 {
 	struct wmi_device *wdev = container_of(dev, struct wmi_device, dev);
 	struct yogabook_wmi *data = dev_get_drvdata(dev);
@@ -362,7 +362,7 @@ static int __maybe_unused yogabook_wmi_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused yogabook_wmi_resume(struct device *dev)
+static int yogabook_resume(struct device *dev)
 {
 	struct wmi_device *wdev = container_of(dev, struct wmi_device, dev);
 	struct yogabook_wmi *data = dev_get_drvdata(dev);
@@ -391,13 +391,12 @@ static const struct wmi_device_id yogabook_wmi_id_table[] = {
 	{ } /* Terminating entry */
 };
 
-static SIMPLE_DEV_PM_OPS(yogabook_wmi_pm_ops,
-			 yogabook_wmi_suspend, yogabook_wmi_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(yogabook_pm_ops, yogabook_suspend, yogabook_resume);
 
 static struct wmi_driver yogabook_wmi_driver = {
 	.driver = {
 		.name = "yogabook-wmi",
-		.pm = &yogabook_wmi_pm_ops,
+		.pm = pm_sleep_ptr(&yogabook_pm_ops),
 	},
 	.no_notify_data = true,
 	.id_table = yogabook_wmi_id_table,
-- 
2.39.2


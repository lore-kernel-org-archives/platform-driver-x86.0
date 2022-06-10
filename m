Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2BFCC433EF
	for <platform-driver-x86@archiver.kernel.org>; Fri, 10 Jun 2022 05:42:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239815AbiFJFmW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 10 Jun 2022 01:42:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240043AbiFJFmV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 10 Jun 2022 01:42:21 -0400
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34A1E6BFF2
        for <platform-driver-x86@vger.kernel.org>; Thu,  9 Jun 2022 22:42:20 -0700 (PDT)
Received: from fsav118.sakura.ne.jp (fsav118.sakura.ne.jp [27.133.134.245])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 25A5g2Nh087677;
        Fri, 10 Jun 2022 14:42:02 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav118.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav118.sakura.ne.jp);
 Fri, 10 Jun 2022 14:42:02 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav118.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 25A5g1uR087674
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 10 Jun 2022 14:42:02 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <63ec2d45-c67c-1134-f6d3-490c8ba67a01@I-love.SAKURA.ne.jp>
Date:   Fri, 10 Jun 2022 14:41:58 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To:     Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org
From:   Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Subject: [PATCH] platform/surface: avoid flush_scheduled_work() usage
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Use local wq in order to avoid flush_scheduled_work() usage.

Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
---
Please see commit c4f135d643823a86 ("workqueue: Wrap flush_workqueue()
using a macro") for background.

This is a blind conversion, and is only compile tested.

 .../platform/surface/surface_acpi_notify.c    | 27 ++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/surface/surface_acpi_notify.c b/drivers/platform/surface/surface_acpi_notify.c
index 7b758f8cc137..c0e12f0b9b79 100644
--- a/drivers/platform/surface/surface_acpi_notify.c
+++ b/drivers/platform/surface/surface_acpi_notify.c
@@ -37,6 +37,7 @@ struct san_data {
 #define to_san_data(ptr, member) \
 	container_of(ptr, struct san_data, member)
 
+static struct workqueue_struct *san_wq;
 
 /* -- dGPU notifier interface. ---------------------------------------------- */
 
@@ -356,7 +357,7 @@ static u32 san_evt_bat_nf(struct ssam_event_notifier *nf,
 
 	memcpy(&work->event, event, sizeof(struct ssam_event) + event->length);
 
-	schedule_delayed_work(&work->work, delay);
+	queue_delayed_work(san_wq, &work->work, delay);
 	return SSAM_NOTIF_HANDLED;
 }
 
@@ -861,7 +862,7 @@ static int san_remove(struct platform_device *pdev)
 	 * We have unregistered our event sources. Now we need to ensure that
 	 * all delayed works they may have spawned are run to completion.
 	 */
-	flush_scheduled_work();
+	flush_workqueue(san_wq);
 
 	return 0;
 }
@@ -881,7 +882,27 @@ static struct platform_driver surface_acpi_notify = {
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
-module_platform_driver(surface_acpi_notify);
+
+static int __init san_init(void)
+{
+	int ret;
+
+	san_wq = alloc_workqueue("san_wq", 0, 0);
+	if (!san_wq)
+		return -ENOMEM;
+	ret = platform_driver_register(&surface_acpi_notify);
+	if (ret)
+		destroy_workqueue(san_wq);
+	return ret;
+}
+module_init(san_init);
+
+static void __exit san_exit(void)
+{
+	platform_driver_unregister(&surface_acpi_notify);
+	destroy_workqueue(san_wq);
+}
+module_exit(san_exit);
 
 MODULE_AUTHOR("Maximilian Luz <luzmaximilian@gmail.com>");
 MODULE_DESCRIPTION("Surface ACPI Notify driver for Surface System Aggregator Module");
-- 
2.18.4

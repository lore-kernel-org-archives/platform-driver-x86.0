Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 424C3C4321E
	for <platform-driver-x86@archiver.kernel.org>; Sun, 28 Nov 2021 19:02:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353195AbhK1TF6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 28 Nov 2021 14:05:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54106 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235237AbhK1TD5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 28 Nov 2021 14:03:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1638126040;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XfF8nUrvzzncLxcdFHgoNRLpxeTDeLjGwy8eYw6ydCk=;
        b=fZS3QPbC/dh50ytsJJmlgbE7bMlaLgwIGvN0ehdkSncx7uc67TkZ7ywOcHl3LbVFJsBrFC
        r3tcrqxfzBk95ACO/oA35/nc7SjtlRWOwL01EDljI6Wvlr1vIzwMgRgM+kJ3Cy2KOaA0Lo
        D+hrnf0OVBzrRxZ6QbwTbkfxPyhcFfg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-63-nC2ppwCoO8W5c1nMDpuTDQ-1; Sun, 28 Nov 2021 14:00:37 -0500
X-MC-Unique: nC2ppwCoO8W5c1nMDpuTDQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72C46801B22;
        Sun, 28 Nov 2021 19:00:36 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.65])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 5BC4E60BF1;
        Sun, 28 Nov 2021 19:00:35 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Yauhen Kharuzhy <jekhor@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 3/5] platform/x86: wmi: Add no_notify_data flag to struct wmi_driver
Date:   Sun, 28 Nov 2021 20:00:29 +0100
Message-Id: <20211128190031.405620-3-hdegoede@redhat.com>
In-Reply-To: <20211128190031.405620-1-hdegoede@redhat.com>
References: <20211128190031.405620-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Some WMI implementations do notifies on WMI objects without a _WED method
allow WMI drivers to indicate that _WED should not be called for notifies
on the WMI objects the driver is bound to.

Instead the driver's notify callback will simply be called with a NULL
data argument.

Reported-by: Yauhen Kharuzhy <jekhor@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/wmi.c | 10 ++++++----
 include/linux/wmi.h        |  1 +
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index 02aba274c4bc..58a23a9adbef 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -1331,10 +1331,12 @@ static void acpi_wmi_notify_handler(acpi_handle handle, u32 event,
 		struct acpi_buffer evdata = { ACPI_ALLOCATE_BUFFER, NULL };
 		acpi_status status;
 
-		status = get_event_data(wblock, &evdata);
-		if (ACPI_FAILURE(status)) {
-			dev_warn(&wblock->dev.dev, "failed to get event data\n");
-			return;
+		if (!driver->no_notify_data) {
+			status = get_event_data(wblock, &evdata);
+			if (ACPI_FAILURE(status)) {
+				dev_warn(&wblock->dev.dev, "failed to get event data\n");
+				return;
+			}
 		}
 
 		if (driver->notify)
diff --git a/include/linux/wmi.h b/include/linux/wmi.h
index 2cb3913c1f50..b88d7b58e61e 100644
--- a/include/linux/wmi.h
+++ b/include/linux/wmi.h
@@ -35,6 +35,7 @@ extern int set_required_buffer_size(struct wmi_device *wdev, u64 length);
 struct wmi_driver {
 	struct device_driver driver;
 	const struct wmi_device_id *id_table;
+	bool no_notify_data;
 
 	int (*probe)(struct wmi_device *wdev, const void *context);
 	void (*remove)(struct wmi_device *wdev);
-- 
2.33.1


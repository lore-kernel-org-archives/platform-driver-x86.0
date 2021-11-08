Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2E67C433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon,  8 Nov 2021 18:04:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AFF8561503
	for <platform-driver-x86@archiver.kernel.org>; Mon,  8 Nov 2021 18:04:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234570AbhKHSG5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 8 Nov 2021 13:06:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47187 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234536AbhKHSG5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 8 Nov 2021 13:06:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1636394652;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=im9lhTupFPwsIHFjLfrf1/cWof8gxzjA2GesYxJq3+Y=;
        b=ZxpTq81JXdCR3H4nt42x15rQlZNlPV29Qdcfnm5K4NIQMHTyJZ2DNj1MuyJULzTsspSZQS
        7jzjqjB8Wpwl0U38OrMWz/9HHjLct9plIfNEIMQ5Zplz1eJlxeoZa4ml1n0vlo3goMD8TG
        6fy4/A7PP8tcKd4nqa0lq3goa2k2qno=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-oiG5onmRPcKpQIUZRhHuhA-1; Mon, 08 Nov 2021 13:04:11 -0500
X-MC-Unique: oiG5onmRPcKpQIUZRhHuhA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27BB719253C6;
        Mon,  8 Nov 2021 18:04:10 +0000 (UTC)
Received: from [172.30.41.16] (ovpn-115-6.phx2.redhat.com [10.3.115.6])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C1ED560C17;
        Mon,  8 Nov 2021 18:03:57 +0000 (UTC)
Subject: [PATCH] platform/x86: think-lmi: Abort probe on analyze failure
From:   Alex Williamson <alex.williamson@redhat.com>
To:     markpearson@lenovo.com, hdegoede@redhat.com, markgross@kernel.org
Cc:     alex.williamson@redhat.com, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Mon, 08 Nov 2021 11:03:57 -0700
Message-ID: <163639463588.1330483.15850167112490200219.stgit@omen>
User-Agent: StGit/1.0-8-g6af9-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

A Lenovo ThinkStation S20 (4157CTO BIOS 60KT41AUS) fails to boot on
recent kernels including the think-lmi driver, due to the fact that
errors returned by the tlmi_analyze() function are ignored by
tlmi_probe(), where  tlmi_sysfs_init() is called unconditionally.
This results in making use of an array of already freed, non-null
pointers and other uninitialized globals, causing all sorts of nasty
kobject and memory faults.

Make use of the analyze function return value, free a couple leaked
allocations, and remove the settings_count field, which is incremented
but never consumed.

Fixes: a40cd7ef22fb ("platform/x86: think-lmi: Add WMI interface support on Lenovo platforms")
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
 drivers/platform/x86/think-lmi.c |   13 ++++++++++---
 drivers/platform/x86/think-lmi.h |    1 -
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
index 9472aae72df2..c4d9c45350f7 100644
--- a/drivers/platform/x86/think-lmi.c
+++ b/drivers/platform/x86/think-lmi.c
@@ -888,8 +888,10 @@ static int tlmi_analyze(void)
 			break;
 		if (!item)
 			break;
-		if (!*item)
+		if (!*item) {
+			kfree(item);
 			continue;
+		}
 
 		/* It is not allowed to have '/' for file name. Convert it into '\'. */
 		strreplace(item, '/', '\\');
@@ -902,6 +904,7 @@ static int tlmi_analyze(void)
 		setting = kzalloc(sizeof(*setting), GFP_KERNEL);
 		if (!setting) {
 			ret = -ENOMEM;
+			kfree(item);
 			goto fail_clear_attr;
 		}
 		setting->index = i;
@@ -916,7 +919,6 @@ static int tlmi_analyze(void)
 		}
 		kobject_init(&setting->kobj, &tlmi_attr_setting_ktype);
 		tlmi_priv.setting[i] = setting;
-		tlmi_priv.settings_count++;
 		kfree(item);
 	}
 
@@ -983,7 +985,12 @@ static void tlmi_remove(struct wmi_device *wdev)
 
 static int tlmi_probe(struct wmi_device *wdev, const void *context)
 {
-	tlmi_analyze();
+	int ret;
+
+	ret = tlmi_analyze();
+	if (ret)
+		return ret;
+
 	return tlmi_sysfs_init();
 }
 
diff --git a/drivers/platform/x86/think-lmi.h b/drivers/platform/x86/think-lmi.h
index f8e26823075f..2ce5086a5af2 100644
--- a/drivers/platform/x86/think-lmi.h
+++ b/drivers/platform/x86/think-lmi.h
@@ -55,7 +55,6 @@ struct tlmi_attr_setting {
 struct think_lmi {
 	struct wmi_device *wmi_device;
 
-	int settings_count;
 	bool can_set_bios_settings;
 	bool can_get_bios_selections;
 	bool can_set_bios_password;



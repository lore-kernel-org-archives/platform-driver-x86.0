Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 735DCC49EB7
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Jun 2021 09:52:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 579EE61448
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Jun 2021 09:52:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232590AbhF1JzD (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 28 Jun 2021 05:55:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27074 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232488AbhF1JzB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 28 Jun 2021 05:55:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1624873955;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=/EskJBksOJVtNEvAGubLDUgfqMXTrtkNs43WZpsN5Sk=;
        b=F4nk10blvNsWV32HX9zJqKtHIZf1ZAs7ZhFi9OUN4njwBcbQmo9o0Bp/PJZBP0fVcb6loG
        UDLFM3zcro8BU4P7CNXI5H42t7uq+H6TytZyxMSFmLKARIiA4XeCQHWJDb3ZRCM/Pk30iM
        yQY4PqacgZuvo7UAfESqI6Je61j75M0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-90bPP_QKNp-7Vm-YRSB00g-1; Mon, 28 Jun 2021 05:52:33 -0400
X-MC-Unique: 90bPP_QKNp-7Vm-YRSB00g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81D90804141;
        Mon, 28 Jun 2021 09:52:32 +0000 (UTC)
Received: from x1.localdomain (ovpn-114-14.ams2.redhat.com [10.36.114.14])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6F51960C5F;
        Mon, 28 Jun 2021 09:52:31 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>,
        Mark Pearson <markpearson@lenovo.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: think-lmi: Move kfree(setting->possible_values) to tlmi_attr_setting_release()
Date:   Mon, 28 Jun 2021 11:52:30 +0200
Message-Id: <20210628095230.319726-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

We must not free the possible_values string before we have called
sysfs_remove_group(kobj, &tlmi_attr_group) otherwise there is a race
where a sysfs read of possible_values could reference the free-ed
memory.

Move the kfree(setting->possible_values) together with the free of the
actual tlmi_attr_setting struct to avoid this race.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/think-lmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
index 4cab341a3538..3671b5d20613 100644
--- a/drivers/platform/x86/think-lmi.c
+++ b/drivers/platform/x86/think-lmi.c
@@ -626,6 +626,7 @@ static void tlmi_attr_setting_release(struct kobject *kobj)
 {
 	struct tlmi_attr_setting *setting = to_tlmi_attr_setting(kobj);
 
+	kfree(setting->possible_values);
 	kfree(setting);
 }
 
@@ -654,7 +655,6 @@ static void tlmi_release_attr(void)
 	/* Attribute structures */
 	for (i = 0; i < TLMI_SETTINGS_COUNT; i++) {
 		if (tlmi_priv.setting[i]) {
-			kfree(tlmi_priv.setting[i]->possible_values);
 			sysfs_remove_group(&tlmi_priv.setting[i]->kobj, &tlmi_attr_group);
 			kobject_put(&tlmi_priv.setting[i]->kobj);
 		}
-- 
2.31.1


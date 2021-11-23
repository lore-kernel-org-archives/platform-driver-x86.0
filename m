Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 243E9C433FE
	for <platform-driver-x86@archiver.kernel.org>; Tue, 23 Nov 2021 21:04:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233687AbhKWVHv (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 23 Nov 2021 16:07:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41852 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234244AbhKWVHu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 23 Nov 2021 16:07:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637701481;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3I4HAqGswl4SSv2aFBtvXyGJrOYZAoPJvADJTfM9QRs=;
        b=D7dSpntK4eWNLepxqx5idaYtzOwyJ5RZC4i+9qk6VvmwNQF05OtWCWhiw2AmDdvR2XECfh
        dGv0H+dseOH/wRtM3FbfqM2m704M15zFKAA6XBEmwoWDzrAGbA2NWOvG+77G4yMTH8xUWf
        AygJHbZni2n0zDZYBczLMIID+zmF5eM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-180-kG4Xpn6dOXKopRCaDGF-Qg-1; Tue, 23 Nov 2021 16:04:38 -0500
X-MC-Unique: kG4Xpn6dOXKopRCaDGF-Qg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 624371023F4D;
        Tue, 23 Nov 2021 21:04:37 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.192.41])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 042B57945F;
        Tue, 23 Nov 2021 21:04:26 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Mark Pearson <markpearson@lenovo.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, Len Baker <len.baker@gmx.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 1/6] platform/x86: thinkpad_acpi: Restore missing hotkey_tablet_mode and hotkey_radio_sw sysfs-attr
Date:   Tue, 23 Nov 2021 22:04:19 +0100
Message-Id: <20211123210424.266607-2-hdegoede@redhat.com>
In-Reply-To: <20211123210424.266607-1-hdegoede@redhat.com>
References: <20211123210424.266607-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Commit c99ca78d67a6 ("platform/x86: thinkpad_acpi: Switch to common use
of attributes") removed the conditional adding of the
hotkey_tablet_mode and hotkey_radio_sw sysfs-attributes, replacing this
with a hotkey_attr_is_visible() callback which hides them when the
feature is not present.

But this commit forgot to add these 2 attributes to the default
hotkey_attributes[] set, so they would now never get added at all.

Add the 2 attributes to the default hotkey_attributes[] set so that
they are available on systems with these features once more.

Fixes: c99ca78d67a6 ("platform/x86: thinkpad_acpi: Switch to common use of attributes")
Cc: Len Baker <len.baker@gmx.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 2d2d5fd11635..ade3c1bdf80d 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -2962,6 +2962,8 @@ static struct attribute *hotkey_attributes[] = {
 	&dev_attr_hotkey_all_mask.attr,
 	&dev_attr_hotkey_adaptive_all_mask.attr,
 	&dev_attr_hotkey_recommended_mask.attr,
+	&dev_attr_hotkey_tablet_mode.attr,
+	&dev_attr_hotkey_radio_sw.attr,
 #ifdef CONFIG_THINKPAD_ACPI_HOTKEY_POLL
 	&dev_attr_hotkey_source_mask.attr,
 	&dev_attr_hotkey_poll_freq.attr,
-- 
2.33.1


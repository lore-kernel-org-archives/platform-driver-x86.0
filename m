Return-Path: <SRS0=1m0M=D2=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 858B9C433DF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 19 Oct 2020 18:56:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 27517223C6
	for <platform-driver-x86@archiver.kernel.org>; Mon, 19 Oct 2020 18:56:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EgaAN0YA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730915AbgJSS4m (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 19 Oct 2020 14:56:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34071 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727681AbgJSS4m (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 19 Oct 2020 14:56:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603133801;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8Z89dfAlUEe8WtEcadHN3q4UqNrNW7FNb+3MdNeaxH4=;
        b=EgaAN0YAU319ppoZFTEv4RnoE+STdPQdoM428mqkgd4youoHiG8IJt8FdDfpM0hHaDwQ+V
        u8sMgDgfq0MQhruPe9ql7qI3LNqYRH/ZjzOL+N4EDd6j6jH3GPbuUD9VuYVxHo4gPF/mAs
        uw8TQlEVSN57NLuQ9DLoN1UOaVpe3ng=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-10opVTl-NnOZ1QhIjEmqQQ-1; Mon, 19 Oct 2020 14:56:39 -0400
X-MC-Unique: 10opVTl-NnOZ1QhIjEmqQQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE74F1005E6E;
        Mon, 19 Oct 2020 18:56:36 +0000 (UTC)
Received: from x1.localdomain (ovpn-114-62.ams2.redhat.com [10.36.114.62])
        by smtp.corp.redhat.com (Postfix) with ESMTP id BF39460DA0;
        Mon, 19 Oct 2020 18:56:35 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>, Lee Chun-Yi <jlee@suse.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 4/6] platform/x86: acer-wmi: Add new force_caps module parameter
Date:   Mon, 19 Oct 2020 20:56:26 +0200
Message-Id: <20201019185628.264473-4-hdegoede@redhat.com>
In-Reply-To: <20201019185628.264473-1-hdegoede@redhat.com>
References: <20201019185628.264473-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add a new force_caps module parameter to allow overriding the drivers
builtin capability detection mechanism.

This can be used to for example:
-Disable rfkill functionality on devices where there is an AA OEM DMI
 record advertising non functional rfkill switches
-Force loading of the driver on devices with a missing AA OEM DMI record

Note that force_caps is -1 when unset, this allows forcing the
capability field to 0, which results in acer-wmi only providing WMI
hotkey handling while disabling all other (led, rfkill, backlight)
functionality.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/acer-wmi.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index f728cb5e5115..87f64b91d283 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -232,6 +232,7 @@ static int mailled = -1;
 static int brightness = -1;
 static int threeg = -1;
 static int force_series;
+static int force_caps = -1;
 static bool ec_raw_mode;
 static bool has_type_aa;
 static u16 commun_func_bitmap;
@@ -241,11 +242,13 @@ module_param(mailled, int, 0444);
 module_param(brightness, int, 0444);
 module_param(threeg, int, 0444);
 module_param(force_series, int, 0444);
+module_param(force_caps, int, 0444);
 module_param(ec_raw_mode, bool, 0444);
 MODULE_PARM_DESC(mailled, "Set initial state of Mail LED");
 MODULE_PARM_DESC(brightness, "Set initial LCD backlight brightness");
 MODULE_PARM_DESC(threeg, "Set initial state of 3G hardware");
 MODULE_PARM_DESC(force_series, "Force a different laptop series");
+MODULE_PARM_DESC(force_caps, "Force the capability bitmask to this value");
 MODULE_PARM_DESC(ec_raw_mode, "Enable EC raw mode");
 
 struct acer_data {
@@ -2163,7 +2166,7 @@ static int __init acer_wmi_init(void)
 		}
 		/* WMID always provides brightness methods */
 		interface->capability |= ACER_CAP_BRIGHTNESS;
-	} else if (!wmi_has_guid(WMID_GUID2) && interface && !has_type_aa) {
+	} else if (!wmi_has_guid(WMID_GUID2) && interface && !has_type_aa && force_caps == -1) {
 		pr_err("No WMID device detection method found\n");
 		return -ENODEV;
 	}
@@ -2193,6 +2196,9 @@ static int __init acer_wmi_init(void)
 	if (acpi_video_get_backlight_type() != acpi_backlight_vendor)
 		interface->capability &= ~ACER_CAP_BRIGHTNESS;
 
+	if (force_caps != -1)
+		interface->capability = force_caps;
+
 	if (wmi_has_guid(WMID_GUID3)) {
 		if (ACPI_FAILURE(acer_wmi_enable_rf_button()))
 			pr_warn("Cannot enable RF Button Driver\n");
-- 
2.28.0


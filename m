Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BA82C433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 23 Nov 2021 21:05:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234102AbhKWVIl (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 23 Nov 2021 16:08:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27600 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233885AbhKWVIj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 23 Nov 2021 16:08:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637701530;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Lxrua7HPmX1VsvQNf/oIwnwDysSrBFhPM0jC1NXqb00=;
        b=DLgzpY9L/rCyuorQNXY0s4uLLCH5iUIYjzPLydogJMK/94AimH1ag8puox8qml9kp1DoP+
        WKECNtXB1OVjh0AAM0L5YyW9lLuIZc4u3Jx+KDCHifg1MWqT7E886cyzAhm+2nqcFpiQob
        MI5gLp6CW8O1vfbMqD8bHjKwBR56c0s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-48-8sQKXafEN6KhJD0tEx3SCQ-1; Tue, 23 Nov 2021 16:05:29 -0500
X-MC-Unique: 8sQKXafEN6KhJD0tEx3SCQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4DC01DDF1;
        Tue, 23 Nov 2021 21:05:27 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.192.41])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B68C926FA3;
        Tue, 23 Nov 2021 21:05:26 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Mark Pearson <markpearson@lenovo.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 2/2] platform/x86: thinkpad_acpi: Add lid-logo-led to the list of safe LEDs
Date:   Tue, 23 Nov 2021 22:05:24 +0100
Message-Id: <20211123210524.266705-2-hdegoede@redhat.com>
In-Reply-To: <20211123210524.266705-1-hdegoede@redhat.com>
References: <20211123210524.266705-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

There have been various bugs / forum threads about allowing control of
the LED in the ThinkPad logo on the lid of various models.

This seems to be something which users want to control and there really
is no reason to require setting CONFIG_THINKPAD_ACPI_UNSAFE_LEDS for this.

The lid-logo-led is LED number 10, so change the name of the 10th led
from unknown_led2 to lid_logo_led and add it to the TPACPI_SAFE_LEDS mask.

Link: https://www.reddit.com/r/thinkpad/comments/7n8eyu/thinkpad_led_control_under_gnulinux/
BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1943318
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 49fdf16b2db9..28f0299ecab0 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -5661,11 +5661,11 @@ static const char * const tpacpi_led_names[TPACPI_LED_NUMLEDS] = {
 	"tpacpi::standby",
 	"tpacpi::dock_status1",
 	"tpacpi::dock_status2",
-	"tpacpi::unknown_led2",
+	"tpacpi::lid_logo_led",
 	"tpacpi::unknown_led3",
 	"tpacpi::thinkvantage",
 };
-#define TPACPI_SAFE_LEDS	0x1081U
+#define TPACPI_SAFE_LEDS	0x1481U
 
 static inline bool tpacpi_is_led_restricted(const unsigned int led)
 {
-- 
2.33.1


Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43799C46CA1
	for <platform-driver-x86@archiver.kernel.org>; Tue, 17 Oct 2023 09:08:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234876AbjJQJIo (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 17 Oct 2023 05:08:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234829AbjJQJI1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 17 Oct 2023 05:08:27 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFB63F1
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Oct 2023 02:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1697533661;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GrOTFBU5wk+ezBieVcCe5LofhBRKVRtnk1D3TEl96Fg=;
        b=R4bBfOv7PkInsPR0KE5W4vcHIffb96bVUEtN9QhYjW/q9e4uS7GyFSQTTMZo7CNqJrfyzS
        ZJQ58nueww+8iXGiKxKnnjLHbKfRlIyMdmfmWce+9wOgpznCr10GLyjcEoa6ttZKBe0pks
        LKhzBBYx6QeChvJhGeOesYcbgozhat4=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-387-oQf9R2RPOGOK3MpiS-x51Q-1; Tue, 17 Oct 2023 05:07:35 -0400
X-MC-Unique: oQf9R2RPOGOK3MpiS-x51Q-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 30F3228EC111;
        Tue, 17 Oct 2023 09:07:35 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.205])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1969D492BEE;
        Tue, 17 Oct 2023 09:07:33 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Corentin Chary <corentin.chary@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Kai Heng Feng <kai.heng.feng@canonical.com>,
        James John <me@donjajo.com>,
        acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org
Subject: [RFC 2/3] platform/x86: asus-wmi: Only map brightness codes when using asus-wmi backlight control
Date:   Tue, 17 Oct 2023 11:07:24 +0200
Message-ID: <20231017090725.38163-3-hdegoede@redhat.com>
In-Reply-To: <20231017090725.38163-1-hdegoede@redhat.com>
References: <20231017090725.38163-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Older Asus laptops change the backlight level themselves and then send
WMI events with different codes for different backlight levels.

The asus-wmi.c code maps the entire range of codes reported on
brightness down keypresses to an internal ASUS_WMI_BRN_DOWN code:

define NOTIFY_BRNUP_MIN                0x11
define NOTIFY_BRNUP_MAX                0x1f
define NOTIFY_BRNDOWN_MIN              0x20
define NOTIFY_BRNDOWN_MAX              0x2e

        if (code >= NOTIFY_BRNUP_MIN && code <= NOTIFY_BRNUP_MAX)
                code = ASUS_WMI_BRN_UP;
        else if (code >= NOTIFY_BRNDOWN_MIN && code <= NOTIFY_BRNDOWN_MAX)
                code = ASUS_WMI_BRN_DOWN;

This mapping is causing issues on new laptop models which actually
send 0x2b events for printscreen presses and 0x2c events for
capslock presses, which get translated into spurious brightness-down
presses.

This mapping is really only necessary when asus-wmi has registered
a backlight-device for backlight control. In this case the mapping
was used to decide to filter out the keypresss since in this case
the firmware has already modified the brightness itself and instead
of reporting a keypress asus-wmi will just report the new brightness
value to userspace.

OTOH when the firmware does not adjust the brightness itself then
it seems to always report 0x2e for brightness-down presses and
0x2f for brightness up presses independent of the actual brightness
level. So in this case the mapping of the code is not necessary
and this translation actually leads to spurious brightness-down
presses being send to userspace when pressing printscreen or capslock.

Modify asus_wmi_handle_event_code() to only do the mapping
when using asus-wmi backlight control to fix the spurious
brightness-down presses.

Reported-by: James John <me@donjajo.com>
Closes: https://lore.kernel.org/platform-driver-x86/a2c441fe-457e-44cf-a146-0ecd86b037cf@donjajo.com/
Closes: https://bbs.archlinux.org/viewtopic.php?pid=2123716
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/asus-wmi.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 928fc74e79b4..6a79f16233ab 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -3950,7 +3950,6 @@ static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
 {
 	unsigned int key_value = 1;
 	bool autorelease = 1;
-	int orig_code = code;
 
 	if (asus->driver->key_filter) {
 		asus->driver->key_filter(asus->driver, &code, &key_value,
@@ -3959,16 +3958,10 @@ static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
 			return;
 	}
 
-	if (code >= NOTIFY_BRNUP_MIN && code <= NOTIFY_BRNUP_MAX)
-		code = ASUS_WMI_BRN_UP;
-	else if (code >= NOTIFY_BRNDOWN_MIN && code <= NOTIFY_BRNDOWN_MAX)
-		code = ASUS_WMI_BRN_DOWN;
-
-	if (code == ASUS_WMI_BRN_DOWN || code == ASUS_WMI_BRN_UP) {
-		if (acpi_video_get_backlight_type() == acpi_backlight_vendor) {
-			asus_wmi_backlight_notify(asus, orig_code);
-			return;
-		}
+	if (acpi_video_get_backlight_type() == acpi_backlight_vendor &&
+	    code >= NOTIFY_BRNUP_MIN && code <= NOTIFY_BRNDOWN_MAX) {
+		asus_wmi_backlight_notify(asus, code);
+		return;
 	}
 
 	if (code == NOTIFY_KBD_BRTUP) {
-- 
2.41.0


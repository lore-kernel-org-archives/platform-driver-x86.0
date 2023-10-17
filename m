Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47D56CDB474
	for <platform-driver-x86@archiver.kernel.org>; Tue, 17 Oct 2023 09:08:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234773AbjJQJIZ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 17 Oct 2023 05:08:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234741AbjJQJIY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 17 Oct 2023 05:08:24 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29AF5B0
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Oct 2023 02:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1697533659;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QVLQPVmLgptKM1FBx9t7/v/z7D75KlDvepMUU5NAoOs=;
        b=SXywEQfcXW18fvB1Kv13oHSiG4ievU7gdB2mxcezzJ5oz3r0/u4j3BrZq1CSDLCvVcKP8c
        Uwh8jj9z6SoVmxyFvLRtFMG253voh3ck1nNmJDnNguCBI7AR4tPtouupKv5wGvk2VNuXHM
        E6E2fsNvUOrbOGJ72RL6/IdVct7LBCk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-568-aobrOxuNMsKR1Q2CaR1WvA-1; Tue, 17 Oct 2023 05:07:37 -0400
X-MC-Unique: aobrOxuNMsKR1Q2CaR1WvA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7AE1381C960;
        Tue, 17 Oct 2023 09:07:36 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.205])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 63684492BEE;
        Tue, 17 Oct 2023 09:07:35 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Corentin Chary <corentin.chary@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Kai Heng Feng <kai.heng.feng@canonical.com>,
        James John <me@donjajo.com>,
        acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org
Subject: [RFC 3/3] platform/x86: asus-wmi: Map 0x2a code, Ignore 0x2b and 0x2c events
Date:   Tue, 17 Oct 2023 11:07:25 +0200
Message-ID: <20231017090725.38163-4-hdegoede@redhat.com>
In-Reply-To: <20231017090725.38163-1-hdegoede@redhat.com>
References: <20231017090725.38163-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Newer Asus laptops send the following new WMI event codes when some
of the F1 - F12 "media" hotkeys are pressed:

0x2a Screen Capture
0x2b PrintScreen
0x2c CapsLock

Map 0x2a to KEY_SELECTIVE_SCREENSHOT mirroring how similar hotkeys
are mapped on other laptops.

PrintScreem and CapsLock are also reported as normal PS/2 keyboard events,
map these event codes to KE_IGNORE to avoid "Unknown key code 0x%x\n" log
messages.

Reported-by: James John <me@donjajo.com>
Closes: https://lore.kernel.org/platform-driver-x86/a2c441fe-457e-44cf-a146-0ecd86b037cf@donjajo.com/
Closes: https://bbs.archlinux.org/viewtopic.php?pid=2123716
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/asus-nb-wmi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index d85d895fee89..df1db54d4e18 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -531,6 +531,9 @@ static void asus_nb_wmi_quirks(struct asus_wmi_driver *driver)
 static const struct key_entry asus_nb_wmi_keymap[] = {
 	{ KE_KEY, ASUS_WMI_BRN_DOWN, { KEY_BRIGHTNESSDOWN } },
 	{ KE_KEY, ASUS_WMI_BRN_UP, { KEY_BRIGHTNESSUP } },
+	{ KE_KEY, 0x2a, { KEY_SELECTIVE_SCREENSHOT } },
+	{ KE_IGNORE, 0x2b, }, /* PrintScreen (also send via PS/2) on newer models */
+	{ KE_IGNORE, 0x2c, }, /* CapsLock (also send via PS/2) on newer models */
 	{ KE_KEY, 0x30, { KEY_VOLUMEUP } },
 	{ KE_KEY, 0x31, { KEY_VOLUMEDOWN } },
 	{ KE_KEY, 0x32, { KEY_MUTE } },
-- 
2.41.0


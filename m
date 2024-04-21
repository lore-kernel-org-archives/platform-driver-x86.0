Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B761A28C
	for <platform-driver-x86@vger.kernel.org>; Sun, 21 Apr 2024 15:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713714362; cv=none; b=dFje6pfTNnbBOl2HNVb+ru6Zul+E3Izh1z4loIgi/JtIE1WUVvgPJV2guDtsqF6xJNHOpAZsK6EL0boNUbCpqvViFRclEu81HMME9S+AQuI7JmF5PMPgx90rBS6SUHVCsalajwnpYkL7okCDx3BdAm0AlZ+5mVJM3XJxVYwhGLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713714362; c=relaxed/simple;
	bh=g39fENwJNYWMOhGDqxTFCNhBKRALQVUI3rmQfBpk70A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NQGSIA2xlxHZ3FHhg1vlhjw5+ezRn0K1ZtYGGTgAiBXauBFqtlBes7atnzr/3L127yVzfTHct1kRlBPzw1hFYvJMo4mfdggvLSbrdho2vbA0jvDDZ8o4W8ah6IJyAvVVouoN97ytTafM9A1+cV+qKwgw+wVS1N7RLpyt07cvUhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=T4/8tRlO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="T4/8tRlO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713714359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jio3xgKs+JhEZrHYiPoxVJB0d6MUvPH04p9TEhRA2Fs=;
	b=T4/8tRlOgS/lxilrr5hEgEHUDi3H42Obz0LD7xQDv+JnqG7Hc2fuErzlbI4hecRoFlba1V
	VoZhjFLPNOGgcRr0n6aN9LcPjaWVXa5C3/7Bk+49EVFJ2uE9o9QLFlapOyfjnpwy83Plro
	uwfU5uqtMgYFX1siMZl0q5wXohuetII=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-412-C88mgSIfPUOYKxpaOdhFRQ-1; Sun,
 21 Apr 2024 11:45:56 -0400
X-MC-Unique: C88mgSIfPUOYKxpaOdhFRQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 015B429AA3B5;
	Sun, 21 Apr 2024 15:45:56 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.66])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DB399402482D;
	Sun, 21 Apr 2024 15:45:54 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Vishnu Sankar <vishnuocv@gmail.com>,
	Nitin Joshi <njoshi1@lenovo.com>,
	ibm-acpi-devel@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 22/24] platform/x86: thinkpad_acpi: Support for trackpoint doubletap
Date: Sun, 21 Apr 2024 17:45:18 +0200
Message-ID: <20240421154520.37089-23-hdegoede@redhat.com>
In-Reply-To: <20240421154520.37089-1-hdegoede@redhat.com>
References: <20240421154520.37089-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2

From: Mark Pearson <mpearson-lenovo@squebb.ca>

Lenovo trackpoints are adding the ability to generate a doubletap event.
This handles the doubletap event and sends the KEY_PROG4 event to
userspace. Despite the driver itself not using KEY_PROG1 - KEY_PROG3 this
still uses KEY_PROG4 because of some keys being remapped to KEY_PROG1 -
KEY_PROG3 by default by the upstream udev hwdb containing:

evdev:name:ThinkPad Extra Buttons:dmi:bvn*:bvr*:bd*:svnLENOVO*:pn*:*
 ...
 KEYBOARD_KEY_17=prog1
 KEYBOARD_KEY_1a=f20       # Microphone mute button
 KEYBOARD_KEY_45=bookmarks
 KEYBOARD_KEY_46=prog2     # Fn + PrtSc, on Windows: Snipping tool
 KEYBOARD_KEY_4a=prog3     # Fn + Right shift, on Windows: No idea

Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
Link: https://lore.kernel.org/r/20240417173124.9953-2-mpearson-lenovo@squebb.ca
[hdegoede@redhat.com: Adjust for switch to sparse-keymap keymaps]
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index cd54a2455ac8..c7e2e85944ac 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -248,6 +248,9 @@ enum tpacpi_hkey_event_t {
 
 	/* Misc */
 	TP_HKEY_EV_RFKILL_CHANGED	= 0x7000, /* rfkill switch changed */
+
+	/* Misc2 */
+	TP_HKEY_EV_TRACK_DOUBLETAP      = 0x8036, /* trackpoint doubletap */
 };
 
 /****************************************************************************
@@ -3264,6 +3267,7 @@ static const struct key_entry keymap_lenovo[] __initconst = {
 	 * after switching to sparse keymap support. The mappings above use translated
 	 * scancodes to preserve uAPI compatibility, see tpacpi_input_send_key().
 	 */
+	{ KE_KEY, TP_HKEY_EV_TRACK_DOUBLETAP /* 0x8036 */, { KEY_PROG4 } },
 	{ KE_END }
 };
 
@@ -3812,6 +3816,17 @@ static bool hotkey_notify_6xxx(const u32 hkey, bool *send_acpi_ev)
 	return true;
 }
 
+static bool hotkey_notify_8xxx(const u32 hkey, bool *send_acpi_ev)
+{
+	switch (hkey) {
+	case TP_HKEY_EV_TRACK_DOUBLETAP:
+		tpacpi_input_send_key(hkey, send_acpi_ev);
+		return true;
+	default:
+		return false;
+	}
+}
+
 static void hotkey_notify(struct ibm_struct *ibm, u32 event)
 {
 	u32 hkey;
@@ -3888,6 +3903,10 @@ static void hotkey_notify(struct ibm_struct *ibm, u32 event)
 				known_ev = true;
 			}
 			break;
+		case 8:
+			/* 0x8000-0x8FFF: misc2 */
+			known_ev = hotkey_notify_8xxx(hkey, &send_acpi_ev);
+			break;
 		}
 		if (!known_ev) {
 			pr_notice("unhandled HKEY event 0x%04x\n", hkey);
-- 
2.44.0


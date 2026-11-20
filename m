Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=145.253.228.164
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795176467;
	b=zY5yDKPnQBwsIO2d3GoruAvKfjiW5kMZqXHZlEZhzEZqmrqcQ6I9o2ZGIEMFKsFhaQzW
	 slV1MTFksHKHNrNxkvozjaTVrya4Ic0r50cJQWoK7+RvdKNa5qQvwDsWVZxWu6NqeP65c
	 SgGelGSjxOyMY+LVLljmzJQ1z5O9mxOUDhLtRaAZTc844CRRuo+SKXr6FeF5SVeGtmKHq
	 4k4n9JEy2G7kLjEQWGooYjC8hMj8haJxALPVLLq9i9KYsz3KDyczzOupNoZUp1CX1BzSt
	 wp3AggzybvT0s12qAiXkuPXaFsM0Dg6Npc8pIBRZ1WZb0ZHi+dsuZnjKC0PNGJHOH6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795176467;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-purgate-server:X-purgate-type:X-purgate:X-purgate-size:
	 X-purgate-ID;
	bh=+0zLlHjY/KwNiTQOkB+1Oym5SXmdA90TlYnMhoyXusk=;
	b=HpDNOdrb4iimVdb05BVjR4syirLbhDARq5QOlJUGdqDK7u7oaRVZIlphFr0ml9khZJ2q
	 E/lfmieWTxOwnT9ZaQvMQV3enfD23HdOXnjv4hZjMxP+yntdnuD6OVHP6iOi5o4Gri4Du
	 9NARbHQphJg55ms5cWX1F591gMM6biKEmTuYdKSknBAL2s2IildZlqfcUvvOb6XQAa0wZ
	 Wk+YJvFHwKxRjaWuEi4GwFelB9qIpFUw63QfujA0T5IHL/WjhfjVjRQzJ8o4p0YC6U7U4
	 kjMzIigaVC8BsxxdohiQGXcckDStayTNnLEu/pFad7V+7FKlc1CmvT0Kc4Q22v21Sjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arcor.de;
	spf=pass smtp.mailfrom=arcor.de;
	dkim=pass header.d=arcor.de header.i=@arcor.de header.a=rsa-sha256 header.s=vfde-mb-mr2-23sep header.b=b2eVrhrq;
	arc=none smtp.remote-ip=145.253.228.164
Received: from mr4.vodafonemail.de (mr4.vodafonemail.de [145.253.228.164])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16ED606A326
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2026 12:07:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E16ED606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arcor.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arcor.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arcor.de header.i=@arcor.de header.a=rsa-sha256 header.s=vfde-mb-mr2-23sep header.b=b2eVrhrq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arcor.de;
	s=vfde-mb-mr2-23sep; t=1795176458;
	bh=+0zLlHjY/KwNiTQOkB+1Oym5SXmdA90TlYnMhoyXusk=;
	h=From:To:Subject:Date:Message-ID:X-Mailer:From;
	b=b2eVrhrqHACB53ZAHfaZlQ4JNysWH6JRHO+Tg1Pf/j4tFz+ERqlGh0V11vNY8UAzQ
	 tu03eV7EC7qL/N6U5ztWdd3hpyiyhvJmo04ud5RdKUPk8G6xlBdguwoNKbSlyuAjVf
	 C+HFNKjH9py8qwCwmclX5hfXAVbE1v7ryqEPd33c=
Received: from smtp.vodafone.de (unknown [10.5.0.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mr4.vodafonemail.de (Postfix) with ESMTPS id 4jWDcB0bVcz3sTnm;
	Fri, 20 Nov 2026 12:07:38 +0000 (UTC)
Received: from floian-LIFEBOOK-U9311X (p549c28b0.dip0.t-ipconnect.de [84.156.40.176])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.vodafone.de (Postfix) with ESMTPSA id 4jWDbw68zdz92kY;
	Fri, 20 Nov 2026 12:07:20 +0000 (UTC)
From: Florian Schmidt <kewl0@arcor.de>
To: Jonathan Woithe <jwoithe@just42.net>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	Florian Schmidt <kewl0@arcor.de>
Subject: [PATCH] platform/x86: fujitsu-laptop: Report Windows Ink button on LIFEBOOK U9311X
Date: Fri, 20 Nov 2026 13:06:55 +0100
Message-ID: <20261120120655.40295-1-kewl0@arcor.de>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-server: smtpa02
X-purgate-type: clean
X-purgate: clean
X-purgate-size: 3824
X-purgate-ID: 155817::1795176457-63C6AA3B-85CE5D1E/0/0

The LIFEBOOK U9311X has a hardware button for Microsoft Windows Ink.
Pressing it does not queue an entry in the FUNC_BUTTONS ring buffer.
Instead, bit 20 of the FUNC_FLAGS status (op 0x4) is set while the
button is held down and cleared on release, and an ACPI notify is
raised on both edges. The FUNC_FLAGS event value (op 0x1) reports
bit 20 on both edges, so it cannot be used to tell press from release.

FUNC_FLAGS op 0x0 returns 0x66120120 on this machine, so bit 20 is
advertised as supported. Bit 30 follows the Fn lock state and is not
touched by this change.

Track the level of bit 20 and report press and release as KEY_PROG1
so the button can be bound in userspace.

Tested on a LIFEBOOK U9311X (BIOS 2.42) with this change backported
to v7.0: libinput shows KEY_PROG1 pressed/released for each button
press, independent of the Fn lock state.

The analysis of the dynamic debug output, the code change and this
changelog were produced with the help of an AI coding assistant
(Claude Code by Anthropic) on my request to make this button usable
under Linux. I reviewed the change and tested it on the hardware.

Signed-off-by: Florian Schmidt <kewl0@arcor.de>
---
 drivers/platform/x86/fujitsu-laptop.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index 8e909cb..0bcb92e 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -81,6 +81,7 @@
 #define FLAG_TOUCHPAD_TOGGLE		BIT(26)
 #define FLAG_MICMUTE			BIT(29)
 #define FLAG_SOFTKEYS			(FLAG_RFKILL | FLAG_TOUCHPAD_TOGGLE | FLAG_MICMUTE)
+#define FLAG_INK_BUTTON			BIT(20)
 
 /* FUNC interface - LED control */
 #define FUNC_LED_OFF			BIT(0)
@@ -140,6 +141,7 @@ struct fujitsu_laptop {
 	spinlock_t fifo_lock;
 	int flags_supported;
 	int flags_state;
+	bool ink_button_pressed;
 	bool charge_control_supported;
 };
 
@@ -585,6 +587,7 @@ static const struct key_entry keymap_default[] = {
 	{ KE_KEY, FLAG_RFKILL,          { KEY_RFKILL } },
 	{ KE_KEY, FLAG_TOUCHPAD_TOGGLE, { KEY_TOUCHPAD_TOGGLE } },
 	{ KE_KEY, FLAG_MICMUTE,         { KEY_MICMUTE } },
+	{ KE_KEY, FLAG_INK_BUTTON,      { KEY_PROG1 } },
 	{ KE_END, 0 }
 };
 
@@ -957,6 +960,7 @@ static void acpi_fujitsu_laptop_notify(acpi_handle handle, u32 event, void *data
 	unsigned long flags;
 	int scancode, i = 0;
 	unsigned int irb;
+	bool pressed;
 
 	if (event != ACPI_FUJITSU_NOTIFY_CODE) {
 		acpi_handle_info(handle, "Unsupported event [0x%x]\n", event);
@@ -990,6 +994,20 @@ static void acpi_fujitsu_laptop_notify(acpi_handle handle, u32 event, void *data
 		for_each_set_bit(i, &flags, BITS_PER_LONG)
 			sparse_keymap_report_event(priv->input, BIT(i), 1, true);
 	}
+
+	/*
+	 * On some models (e.g. LIFEBOOK U9311X) the Windows Ink button is
+	 * only reported as a level in the status flags: the bit is set while
+	 * the button is held down. Report press and release on each change.
+	 */
+	if (priv->flags_supported & FLAG_INK_BUTTON) {
+		pressed = priv->flags_state & FLAG_INK_BUTTON;
+		if (pressed != priv->ink_button_pressed) {
+			sparse_keymap_report_event(priv->input, FLAG_INK_BUTTON,
+						   pressed, false);
+			priv->ink_button_pressed = pressed;
+		}
+	}
 }
 
 static int acpi_fujitsu_laptop_probe(struct platform_device *pdev)
@@ -1037,6 +1055,7 @@ static int acpi_fujitsu_laptop_probe(struct platform_device *pdev)
 	if (priv->flags_supported)
 		priv->flags_state = call_fext_func(fext, FUNC_FLAGS, 0x4, 0x0,
 						   0x0);
+	priv->ink_button_pressed = priv->flags_state & FLAG_INK_BUTTON;
 
 	/* Suspect this is a keymap of the application panel, print it */
 	acpi_handle_info(device->handle, "BTNI: [0x%x]\n",
-- 
2.53.0


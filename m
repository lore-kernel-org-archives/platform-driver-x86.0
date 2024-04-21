Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBE61B95B
	for <platform-driver-x86@vger.kernel.org>; Sun, 21 Apr 2024 15:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713714355; cv=none; b=Zgz/f55dBnGPGTX9Mj/e3IlFEaRzNH5JV7zVkPY0uthVE/2LIlKpd2z2vnlM28mqNss/GGDuuVLPDwcYlbeir3PTrpJkfhLpk2DIkAeHNsdwi9X3dwsoSwNiGFKnYnRj9J28ULY40YvK4UbmqAiB5usEJcuAk7KC1M8Yzh2tEPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713714355; c=relaxed/simple;
	bh=NLIzfqTNVxORCa5xj6KGjjN8O8hVDSqmlrT/Ewslf2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dxepg8ei9uGbJMEQaK9M4Jd1rd3VCTC6cEPzrGCEFf1d9jtGGjuZAG+E+KiwcCzLyYjUKtRttGP1KV406nBGZVXme+uPoBxxxuq+h5OBjunDkZlBOic6UtCWNHV/4Hk2uwX1g/voHxhFDgwcqhhnzAZLYc/pwPEbqhxmXS+ZGc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FNndmzrt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FNndmzrt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713714353;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uJu5U2rYPpaHTQ7q0KTXMZY1pF1nfHsUq1/3p+/ppH4=;
	b=FNndmzrtwEcxkZhLKDg7AYTJCNUgv5HqiqesO1vV8sGZa/AQK8maZjRZOu1pV8qqzoASQm
	TAOOKQ8+uf4wLS9aaOHWEEGhmZoxlwFBDjJpkDkPmPztxdyOEyEaq4WRMe4WU3OpA8ZwAA
	oTy2xBIXblgg8Y6DiAMT6kSZwnOZULg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-266-9npPsJJAPkGpf5ZVscnDJw-1; Sun, 21 Apr 2024 11:45:49 -0400
X-MC-Unique: 9npPsJJAPkGpf5ZVscnDJw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5EAE780B935;
	Sun, 21 Apr 2024 15:45:49 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.66])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4427E40C122D;
	Sun, 21 Apr 2024 15:45:48 +0000 (UTC)
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
Subject: [PATCH 17/24] platform/x86: thinkpad_acpi: Use correct keycodes for volume and brightness keys
Date: Sun, 21 Apr 2024 17:45:13 +0200
Message-ID: <20240421154520.37089-18-hdegoede@redhat.com>
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

Change the default keymap to report the correct keycodes for the volume and
brightness keys. Reporting key events for these is already filtered out by
the hotkey_reserved_mask which masks these keys out of hotkey_user_mask at
initialization time, so there is no need to also map them to KEY_RESERVED.

This avoids users, who want these to be reported, having to also remap
the keycodes on top of overriding hotkey_user_mask to report these
and Linux userspace has already been overridding the KEY_RESERVED mappings
with the correct keycodes through udev/hwdb/60-keyboard.hwdb for years now.

Also drop hotkey_unmap() it was only used to dynamically map the brightness
keys to KEY_RESERVED and after removing that it has no remaining users.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 45 +++++++++++++---------------
 1 file changed, 21 insertions(+), 24 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 30219ba43208..5db46220d400 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -3097,15 +3097,6 @@ static void hotkey_exit(void)
 	mutex_unlock(&hotkey_mutex);
 }
 
-static void __init hotkey_unmap(const unsigned int scancode)
-{
-	if (hotkey_keycode_map[scancode] != KEY_RESERVED) {
-		clear_bit(hotkey_keycode_map[scancode],
-			  tpacpi_inputdev->keybit);
-		hotkey_keycode_map[scancode] = KEY_RESERVED;
-	}
-}
-
 /*
  * HKEY quirks:
  *   TPACPI_HK_Q_INIMASK:	Supports FN+F3,FN+F4,FN+F12
@@ -3224,22 +3215,28 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 		KEY_UNKNOWN,	/* 0x0D: FN+INSERT */
 		KEY_UNKNOWN,	/* 0x0E: FN+DELETE */
 
-		/* brightness: firmware always reacts to them */
-		KEY_RESERVED,	/* 0x0F: FN+HOME (brightness up) */
-		KEY_RESERVED,	/* 0x10: FN+END (brightness down) */
+		/* brightness: firmware always reacts to them.
+		 * Suppressed by default through hotkey_reserved_mask.
+		 */
+		KEY_BRIGHTNESSUP,	/* 0x0F: FN+HOME (brightness up) */
+		KEY_BRIGHTNESSDOWN,	/* 0x10: FN+END (brightness down) */
 
-		/* Thinklight: firmware always react to it */
-		KEY_RESERVED,	/* 0x11: FN+PGUP (thinklight toggle) */
+		/* Thinklight: firmware always react to it.
+		 * Suppressed by default through hotkey_reserved_mask.
+		 */
+		KEY_KBDILLUMTOGGLE,	/* 0x11: FN+PGUP (thinklight toggle) */
 
 		KEY_UNKNOWN,	/* 0x12: FN+PGDOWN */
 		KEY_ZOOM,	/* 0x13: FN+SPACE (zoom) */
 
 		/* Volume: firmware always react to it and reprograms
 		 * the built-in *extra* mixer.  Never map it to control
-		 * another mixer by default. */
-		KEY_RESERVED,	/* 0x14: VOLUME UP */
-		KEY_RESERVED,	/* 0x15: VOLUME DOWN */
-		KEY_RESERVED,	/* 0x16: MUTE */
+		 * another mixer by default.
+		 * Suppressed by default through hotkey_reserved_mask.
+		 */
+		KEY_VOLUMEUP,	/* 0x14: VOLUME UP */
+		KEY_VOLUMEDOWN,	/* 0x15: VOLUME DOWN */
+		KEY_MUTE,	/* 0x16: MUTE */
 
 		KEY_VENDOR,	/* 0x17: Thinkpad/AccessIBM/Lenovo */
 
@@ -3282,7 +3279,8 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 		KEY_BRIGHTNESSUP,	/* 0x0F: FN+HOME (brightness up) */
 		KEY_BRIGHTNESSDOWN,	/* 0x10: FN+END (brightness down) */
 
-		KEY_RESERVED,	/* 0x11: FN+PGUP (thinklight toggle) */
+		/* Suppressed by default through hotkey_reserved_mask. */
+		KEY_KBDILLUMTOGGLE,	/* 0x11: FN+PGUP (thinklight toggle) */
 
 		KEY_UNKNOWN,	/* 0x12: FN+PGDOWN */
 		KEY_ZOOM,	/* 0x13: FN+SPACE (zoom) */
@@ -3297,10 +3295,11 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 		 * change unless you get test reports from all Lenovo
 		 * models.  May cause the BIOS to interfere with the
 		 * HDA mixer.
+		 * Suppressed by default through hotkey_reserved_mask.
 		 */
-		KEY_RESERVED,	/* 0x14: VOLUME UP */
-		KEY_RESERVED,	/* 0x15: VOLUME DOWN */
-		KEY_RESERVED,	/* 0x16: MUTE */
+		KEY_VOLUMEUP,	/* 0x14: VOLUME UP */
+		KEY_VOLUMEDOWN,	/* 0x15: VOLUME DOWN */
+		KEY_MUTE,	/* 0x16: MUTE */
 
 		KEY_VENDOR,	/* 0x17: Thinkpad/AccessIBM/Lenovo */
 
@@ -3599,8 +3598,6 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 		 * for userspace to do something even remotely sane */
 		hotkey_reserved_mask |= TP_ACPI_HKEY_BRGHTUP_MASK |
 					TP_ACPI_HKEY_BRGHTDWN_MASK;
-		hotkey_unmap(TP_ACPI_HOTKEYSCAN_FNHOME);
-		hotkey_unmap(TP_ACPI_HOTKEYSCAN_FNEND);
 	}
 
 #ifdef CONFIG_THINKPAD_ACPI_HOTKEY_POLL
-- 
2.44.0


Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DE215ADAE
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Apr 2024 12:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713961745; cv=none; b=h+tc4elJexSbQVVgn1B/nPkU04Bc4YgVLXIRHuuNdQ3VeI+qjjgxkbzchbtSCgT9ifm6Sts57uVM5jTdm22D82q+CsJo7YFnCIMPYtobSVmRDacSVxlsXoiG8CP9t7vT+nxgkVhKRrSs1tyrzmsVtvVR5QkjQjCT6P0zDzxRKdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713961745; c=relaxed/simple;
	bh=G8eOoWrD+3sSUPqOpxjZZdpVfMshys3tuVhL0xwOl1k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gsTXpfvcaFY7dqEJaNU4EFuRTUB7HfRHdJGK2G6wj2fdr5+ng4InlwNFcvvB9l6MH09rxg/xyunRNSbMinRHBpyit0XrO2g9wwVyksnblzsqQ1beHRYHx5Nek3J63QyQCsO4uhvVavirTve5cPX3xjsOvhWFiQDs/mf2w/PnzqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S4ROS08Y; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S4ROS08Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713961743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1sT0DzFtYGSGrORU33wcG5T6tVmB9+5DP1SLHoMQ3gs=;
	b=S4ROS08YcyYzK8GEhqVmIg3ACRTZ69HCd2WKTyXFLQBZOV/QVNuYBvI8FDJsR/1TmByC+D
	vyUzUzAAgCvVzOvUVKTzfsxMpLmRrauSXKVZGMsF0d674k3wMXuFmyGl8mdLg76+n1VOI4
	hzKRW++MiZSF6gUbEnhTv8SaUW0CrQU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-9F4NV9g7MeSCgGJydxdS5w-1; Wed, 24 Apr 2024 08:29:00 -0400
X-MC-Unique: 9F4NV9g7MeSCgGJydxdS5w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7CFE918065AA;
	Wed, 24 Apr 2024 12:28:59 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.195.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 57FA8C13FA5;
	Wed, 24 Apr 2024 12:28:58 +0000 (UTC)
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
Subject: [PATCH v2 17/24] platform/x86: thinkpad_acpi: Use correct keycodes for volume and brightness keys
Date: Wed, 24 Apr 2024 14:28:27 +0200
Message-ID: <20240424122834.19801-18-hdegoede@redhat.com>
In-Reply-To: <20240424122834.19801-1-hdegoede@redhat.com>
References: <20240424122834.19801-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8

Change the default keymap to report the correct keycodes for the volume and
brightness keys. Reporting key events for these is already filtered out by
the hotkey_reserved_mask which masks these keys out of hotkey_user_mask at
initialization time, so there is no need to also map them to KEY_RESERVED.

This avoids users, who want these to be reported, having to also remap
the keycodes on top of overriding hotkey_user_mask to report these
and Linux userspace has already been overriding the KEY_RESERVED mappings
with the correct keycodes through udev/hwdb/60-keyboard.hwdb for years now.

Also drop hotkey_unmap() it was only used to dynamically map the brightness
keys to KEY_RESERVED and after removing that it has no remaining users.

Tested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 45 +++++++++++++---------------
 1 file changed, 21 insertions(+), 24 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index cf5c741d1343..89931bb980be 100644
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


Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B15A199B8
	for <platform-driver-x86@vger.kernel.org>; Sun, 21 Apr 2024 15:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713714352; cv=none; b=m8akocHyDD9IsSYl/haWR6yXNGM9ntzPqbkGJsonKmrBs2VFya5Hg5zXpSk9BgOm6ggHHomTj7pz+/HYS5/zEY3V0g/0ZNCDoSVLOuy0/QZqEo+OakotF90+ktgp0Yn6bA+5iOrybq2f++1nQP9MEUDWLbfqccT6lbeb9a2HlEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713714352; c=relaxed/simple;
	bh=UURe6vFaGRIFZ+7mZOf4I+tspzFwBA52Cthu/2SFxVE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h1MsOO3VWR2hUj/qvBpYN0Ts2fzcYdvcxHdPkhFVxnBpOtDfaa/L2PuYwWDwp18JQkH4u0zOJLbvutl53qZBh+IRWI1/JupvdWpztOnE1MucsVYZ6iYdNmtBVJ4t912cxM+WEBOT5eL4V5FJwa3UT9JK2ymIot3u+gms8geHW/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=I4YqYAVR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I4YqYAVR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713714348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XT/UaZY9kAT8L+fR7Nv16pmVtbMQiia4PE42AxXnaNE=;
	b=I4YqYAVROEJepGoZnbrD7TURjn1GUxGvoRr0fI8Tmxn2pjmf4Jd+yHZc+j/0J+EL+Ic2e1
	c2hfmO9za8GyeCirmB8sw/0KqlzYqDLnVE5KEeVD9Mx97iBd3RvicSagbaCl4jKHk61E3U
	qNjJawSUIBj5UZ1gTpGa/hNr+qBH1bE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683-01pyaDsWOuu62uO7CtZOjA-1; Sun, 21 Apr 2024 11:45:44 -0400
X-MC-Unique: 01pyaDsWOuu62uO7CtZOjA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2A67D810602;
	Sun, 21 Apr 2024 15:45:44 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.66])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 10ED2402482D;
	Sun, 21 Apr 2024 15:45:42 +0000 (UTC)
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
Subject: [PATCH 13/24] platform/x86: thinkpad_acpi: Move hkey > scancode mapping to tpacpi_input_send_key()
Date: Sun, 21 Apr 2024 17:45:09 +0200
Message-ID: <20240421154520.37089-14-hdegoede@redhat.com>
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

Move the mapping of hkey events to scancodes to tpacpi_input_send_key(),
this results in a nice cleanup and prepares things for adding sparse-keymap
support.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 81 +++++++++-------------------
 1 file changed, 24 insertions(+), 57 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index bc87c78ab0f2..633701c218f2 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -2250,15 +2250,28 @@ static void tpacpi_input_send_tabletsw(void)
 	}
 }
 
-/* Do NOT call without validating scancode first */
-static void tpacpi_input_send_key(const unsigned int scancode)
+static bool tpacpi_input_send_key(const u32 hkey)
 {
-	const unsigned int keycode = hotkey_keycode_map[scancode];
+	unsigned int keycode, scancode;
 
-	if (scancode < TP_ACPI_HOTKEYSCAN_ADAPTIVE_START &&
-	    !(hotkey_user_mask & (1 << scancode)))
-		return;
+	if (hkey >= TP_HKEY_EV_ORIG_KEY_START &&
+	    hkey <= TP_HKEY_EV_ORIG_KEY_END) {
+		scancode = hkey - TP_HKEY_EV_ORIG_KEY_START;
+		if (!(hotkey_user_mask & (1 << scancode)))
+			return true; /* Not reported but still a known code */
+	} else if (hkey >= TP_HKEY_EV_ADAPTIVE_KEY_START &&
+		   hkey <= TP_HKEY_EV_ADAPTIVE_KEY_END) {
+		scancode = hkey - TP_HKEY_EV_ADAPTIVE_KEY_START +
+			   TP_ACPI_HOTKEYSCAN_ADAPTIVE_START;
+	} else if (hkey >= TP_HKEY_EV_EXTENDED_KEY_START &&
+		   hkey <= TP_HKEY_EV_EXTENDED_KEY_END) {
+		scancode = hkey - TP_HKEY_EV_EXTENDED_KEY_START +
+			   TP_ACPI_HOTKEYSCAN_EXTENDED_START;
+	} else {
+		return false;
+	}
 
+	keycode = hotkey_keycode_map[scancode];
 	if (keycode != KEY_RESERVED) {
 		mutex_lock(&tpacpi_inputdev_send_mutex);
 
@@ -2272,6 +2285,8 @@ static void tpacpi_input_send_key(const unsigned int scancode)
 
 		mutex_unlock(&tpacpi_inputdev_send_mutex);
 	}
+
+	return true;
 }
 
 #ifdef CONFIG_THINKPAD_ACPI_HOTKEY_POLL
@@ -2281,7 +2296,7 @@ static struct tp_acpi_drv_struct ibm_hotkey_acpidriver;
 static void tpacpi_hotkey_send_key(unsigned int scancode)
 {
 	tpacpi_driver_event(TP_HKEY_EV_ORIG_KEY_START + scancode);
-	tpacpi_input_send_key(scancode);
+	tpacpi_input_send_key(TP_HKEY_EV_ORIG_KEY_START + scancode);
 }
 
 static void hotkey_read_nvram(struct tp_nvram_state *n, const u32 m)
@@ -3703,42 +3718,15 @@ static void adaptive_keyboard_s_quickview_row(void)
 	adaptive_keyboard_set_mode(FUNCTION_MODE);
 }
 
-static bool adaptive_keyboard_hotkey_notify_hotkey(const u32 hkey)
-{
-	if (hkey < TP_HKEY_EV_ADAPTIVE_KEY_START ||
-	    hkey > TP_HKEY_EV_ADAPTIVE_KEY_END) {
-		pr_info("Unhandled adaptive keyboard key: 0x%x\n", hkey);
-		return false;
-	}
-
-	tpacpi_input_send_key(hkey - TP_HKEY_EV_ADAPTIVE_KEY_START +
-			      TP_ACPI_HOTKEYSCAN_ADAPTIVE_START);
-	return true;
-}
-
-static bool hotkey_notify_extended_hotkey(const u32 hkey)
-{
-	if (hkey >= TP_HKEY_EV_EXTENDED_KEY_START &&
-	    hkey <= TP_HKEY_EV_EXTENDED_KEY_END) {
-		unsigned int scancode = hkey - TP_HKEY_EV_EXTENDED_KEY_START +
-					TP_ACPI_HOTKEYSCAN_EXTENDED_START;
-		tpacpi_input_send_key(scancode);
-		return true;
-	}
-
-	return false;
-}
-
 /* 0x1000-0x1FFF: key presses */
 static bool hotkey_notify_hotkey(const u32 hkey, bool *send_acpi_ev)
 {
-	unsigned int scancode = hkey - TP_HKEY_EV_ORIG_KEY_START;
-
 	/* Never send ACPI netlink events for original hotkeys (hkey: 0x1001 - 0x1020) */
 	if (hkey >= TP_HKEY_EV_ORIG_KEY_START && hkey <= TP_HKEY_EV_ORIG_KEY_END) {
 		*send_acpi_ev = false;
 
 		/* Original hotkeys may be polled from NVRAM instead */
+		unsigned int scancode = hkey - TP_HKEY_EV_ORIG_KEY_START;
 		if (hotkey_source_mask & (1 << scancode))
 			return true;
 	}
@@ -3746,28 +3734,7 @@ static bool hotkey_notify_hotkey(const u32 hkey, bool *send_acpi_ev)
 	if (tpacpi_driver_event(hkey))
 		return true;
 
-	/*
-	 * Original events are in the 0x10XX range, the adaptive keyboard
-	 * found in 2014 X1 Carbon emits events are of 0x11XX. In 2017
-	 * models, additional keys are emitted through 0x13XX.
-	 */
-	switch ((hkey >> 8) & 0xf) {
-	case 0:
-		if (hkey >= TP_HKEY_EV_ORIG_KEY_START &&
-		    hkey <= TP_HKEY_EV_ORIG_KEY_END) {
-			tpacpi_input_send_key(scancode);
-			return true;
-		}
-		break;
-
-	case 1:
-		return adaptive_keyboard_hotkey_notify_hotkey(hkey);
-
-	case 3:
-		return hotkey_notify_extended_hotkey(hkey);
-	}
-
-	return false;
+	return tpacpi_input_send_key(hkey);
 }
 
 /* 0x2000-0x2FFF: Wakeup reason */
-- 
2.44.0


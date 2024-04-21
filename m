Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57AB3D66
	for <platform-driver-x86@vger.kernel.org>; Sun, 21 Apr 2024 15:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713714345; cv=none; b=KZMSAqST9aBoP+asurw845icWXFj8Zy83r1XmNDuw30lvUDT+HJauB2WwLphepZSWGz+eNGMefEcLNMtF8/OBlrSTDkfWmPjgAmXH4vcA4OFRGpnkOa1T7b6jd1XTT9ErQqDUcDWHjH5M8FjHsbA03QAKP4c80OC6CTt0+yUVjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713714345; c=relaxed/simple;
	bh=Z9+F9O+UwMCfrqxqw4D2NxHQBHhmHYAPyjzL4/VoU3I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QD7IuT9qp473t8+SfXnlgP6QowHa/i/c7qgQnnHknfZttB4O31lyOSmKvQGvT/vY406dszC8l12a/cfDrpLDwfmdpYIV2jX+JJATUCLLcJ3yCAu8/xBYo0joWG4w4508Kco8YH0PVRkOHcKAxdP13Rw8oyDcLPXf1XLQ0GbPPM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IXdEEBn1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IXdEEBn1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713714342;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+dNVfH4aGVacLkbXT0WRWWwSuiiGQo9z/8wu7tgvq18=;
	b=IXdEEBn1e/CLWtG9TQxGwb8j/uLPbvK6/1cEVPmVLTfAKa8lw4I1i0L79NPk61VsL8+Bi5
	50stJEPNdAnE06c99BGhNfwSVXVcqdJB5GXbKSLr5gZ71/s+qM9tXSUP0/JlLOhCcHLU47
	pBWc3uq633kVZ4rkqsOP9D1RJQKopCA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-Smf0iJuyOPqSaf_2W2UNjg-1; Sun, 21 Apr 2024 11:45:38 -0400
X-MC-Unique: Smf0iJuyOPqSaf_2W2UNjg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A69F91011324;
	Sun, 21 Apr 2024 15:45:37 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.66])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8BC4C402482D;
	Sun, 21 Apr 2024 15:45:36 +0000 (UTC)
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
Subject: [PATCH 08/24] platform/x86: thinkpad_acpi: Move adaptive kbd event handling to tpacpi_driver_event()
Date: Sun, 21 Apr 2024 17:45:04 +0200
Message-ID: <20240421154520.37089-9-hdegoede@redhat.com>
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

Factor out the adaptive kbd non hotkey event handling into
adaptive_keyboard_change_row() and adaptive_keyboard_s_quickview_row()
helpers and move the handling of TP_HKEY_EV_DFR_CHANGE_ROW and
TP_HKEY_EV_DFR_S_QUICKVIEW_ROW to tpacpi_driver_event().

This groups all the handling of hotkey events which do not emit
a key press event together in tpacpi_driver_event().

This is a preparation patch for moving to sparse-keymaps.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 85 +++++++++++++++-------------
 1 file changed, 45 insertions(+), 40 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 0bbc462d604c..e8d30f4af126 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -3677,51 +3677,50 @@ static int adaptive_keyboard_get_next_mode(int mode)
 	return adaptive_keyboard_modes[i];
 }
 
+static void adaptive_keyboard_change_row(void)
+{
+	int mode;
+
+	if (adaptive_keyboard_mode_is_saved) {
+		mode = adaptive_keyboard_prev_mode;
+		adaptive_keyboard_mode_is_saved = false;
+	} else {
+		mode = adaptive_keyboard_get_mode();
+		if (mode < 0)
+			return;
+		mode = adaptive_keyboard_get_next_mode(mode);
+	}
+
+	adaptive_keyboard_set_mode(mode);
+}
+
+static void adaptive_keyboard_s_quickview_row(void)
+{
+	int mode = adaptive_keyboard_get_mode();
+
+	if (mode < 0)
+		return;
+
+	adaptive_keyboard_prev_mode = mode;
+	adaptive_keyboard_mode_is_saved = true;
+
+	adaptive_keyboard_set_mode(FUNCTION_MODE);
+}
+
 static bool adaptive_keyboard_hotkey_notify_hotkey(const u32 hkey)
 {
-	int current_mode = 0;
-	int new_mode = 0;
-
-	switch (hkey) {
-	case TP_HKEY_EV_DFR_CHANGE_ROW:
-		if (adaptive_keyboard_mode_is_saved) {
-			new_mode = adaptive_keyboard_prev_mode;
-			adaptive_keyboard_mode_is_saved = false;
-		} else {
-			current_mode = adaptive_keyboard_get_mode();
-			if (current_mode < 0)
-				return false;
-			new_mode = adaptive_keyboard_get_next_mode(
-					current_mode);
-		}
-
-		if (adaptive_keyboard_set_mode(new_mode) < 0)
-			return false;
-
+	if (tpacpi_driver_event(hkey))
 		return true;
 
-	case TP_HKEY_EV_DFR_S_QUICKVIEW_ROW:
-		current_mode = adaptive_keyboard_get_mode();
-		if (current_mode < 0)
-			return false;
-
-		adaptive_keyboard_prev_mode = current_mode;
-		adaptive_keyboard_mode_is_saved = true;
-
-		if (adaptive_keyboard_set_mode (FUNCTION_MODE) < 0)
-			return false;
-		return true;
-
-	default:
-		if (hkey < TP_HKEY_EV_ADAPTIVE_KEY_START ||
-		    hkey > TP_HKEY_EV_ADAPTIVE_KEY_END) {
-			pr_info("Unhandled adaptive keyboard key: 0x%x\n", hkey);
-			return false;
-		}
-		tpacpi_input_send_key(hkey - TP_HKEY_EV_ADAPTIVE_KEY_START +
-				      TP_ACPI_HOTKEYSCAN_ADAPTIVE_START);
-		return true;
+	if (hkey < TP_HKEY_EV_ADAPTIVE_KEY_START ||
+	    hkey > TP_HKEY_EV_ADAPTIVE_KEY_END) {
+		pr_info("Unhandled adaptive keyboard key: 0x%x\n", hkey);
+		return false;
 	}
+
+	tpacpi_input_send_key(hkey - TP_HKEY_EV_ADAPTIVE_KEY_START +
+			      TP_ACPI_HOTKEYSCAN_ADAPTIVE_START);
+	return true;
 }
 
 static bool hotkey_notify_extended_hotkey(const u32 hkey)
@@ -11117,6 +11116,12 @@ static bool tpacpi_driver_event(const unsigned int hkey_event)
 		}
 		/* Key events are suppressed by default hotkey_user_mask */
 		return false;
+	case TP_HKEY_EV_DFR_CHANGE_ROW:
+		adaptive_keyboard_change_row();
+		return true;
+	case TP_HKEY_EV_DFR_S_QUICKVIEW_ROW:
+		adaptive_keyboard_s_quickview_row();
+		return true;
 	case TP_HKEY_EV_THM_CSM_COMPLETED:
 		lapsensor_refresh();
 		/* If we are already accessing DYTC then skip dytc update */
-- 
2.44.0


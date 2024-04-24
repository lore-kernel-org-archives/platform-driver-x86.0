Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE5015B107
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Apr 2024 12:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713961734; cv=none; b=slEEJaUiMKeVDJwtSv4XNan/b00IpS2INu8/cqz0Xma0L36QJ695zx6L3PtDseeASH7e2B0XqcQq8lit+EB9g6JMoDQfkm0R7oi5RaKv5JTxDehtI81NnZ85lTjP2y8rJKPsCTU1z3YPMePlHv7ixn0LltnMRBuZL3PrGXNjCX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713961734; c=relaxed/simple;
	bh=7Ix8boAjz+QGSZYli2iIBjrTkDervm8woYysof+/wmM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xmf5mkZ4Z1SCF3gwAGcFThn48dNSWQFm0KF7O6EkMP4W3Pc3zIjN9ySbUHBUd9OhwNrvBFxTTg04Eq1tCPaqehU9fWC558/fl0/o48dUl0lzjR/r4eCubh7KiycKAAF+cbW5QR1hwmFyy2UP6iS2qeyv08pxcaHrF+S/2+aFdfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IjR/cmfv; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IjR/cmfv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713961731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2u6+95SeKcOB4uKuNQwXuA4gi2xEOtr2FgNtlgItEGA=;
	b=IjR/cmfvle0eUtpBJt4HBJOFkjlxjYwrvJd2k//xO3TZfTTv4iRkgFZj9aDgkAq4OgneZt
	BnqHv0lwCyAD7PuSkBV7571lhd2Su8OUyb5ERPc5sVaRmRGMmYl+e8kcHh/AvdbnoJZhDd
	EYBOaZSf9uKvD95SvyzgjYczpaWC7ZU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-490-K8d84AJWMQigZU7YiRopvA-1; Wed, 24 Apr 2024 08:28:48 -0400
X-MC-Unique: K8d84AJWMQigZU7YiRopvA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0FE0418065AA;
	Wed, 24 Apr 2024 12:28:47 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.195.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DE5F5C2595D;
	Wed, 24 Apr 2024 12:28:45 +0000 (UTC)
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
Subject: [PATCH v2 08/24] platform/x86: thinkpad_acpi: Move adaptive kbd event handling to tpacpi_driver_event()
Date: Wed, 24 Apr 2024 14:28:18 +0200
Message-ID: <20240424122834.19801-9-hdegoede@redhat.com>
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

Factor out the adaptive kbd non hotkey event handling into
adaptive_keyboard_change_row() and adaptive_keyboard_s_quickview_row()
helpers and move the handling of TP_HKEY_EV_DFR_CHANGE_ROW and
TP_HKEY_EV_DFR_S_QUICKVIEW_ROW to tpacpi_driver_event().

This groups all the handling of hotkey events which do not emit
a key press event together in tpacpi_driver_event().

This also drops the returning of false as known-event value when
adaptive_keyboard_get_mode() / adaptive_keyboard_set_mode() fail.
These functions already log an error on failure, returning false just
leads to an extra messgae being logged about the hkey event being
unknown, which is wrong as the event is not unknown.

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Tested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 86 +++++++++++++++-------------
 1 file changed, 46 insertions(+), 40 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 0bbc462d604c..f4d7f3c25a4a 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -3677,51 +3677,51 @@ static int adaptive_keyboard_get_next_mode(int mode)
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
+	int mode;
+
+	mode = adaptive_keyboard_get_mode();
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
@@ -11117,6 +11117,12 @@ static bool tpacpi_driver_event(const unsigned int hkey_event)
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


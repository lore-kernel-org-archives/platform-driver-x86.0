Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CFE15B124
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Apr 2024 12:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713961756; cv=none; b=BUe6nL68sts+diXi9X7iy15X0YhPwx09S3GPc0ov6DXhQPDRc0o5LcebNJW1f8PM/rxCOdsNnlNlUwJFvwf8V2qbadRFEKOObsEXtg0Kno/je/3NtdS4x41WYexcEbC3CbjSRY0ZCoPMm8aPY6a823K6yRnHUAn1qAK0VBdkeqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713961756; c=relaxed/simple;
	bh=/FICMD3LINPCDgU0nEbdvaDkdVbYVmsY1YyWJ9wEYhs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=crRy9yPz5OE2NMpvRXy2574/TEb2sTFv5tOG1eBIvO3jEGGPbfRUz/mr+QrSGZZcrBHYJVutOxIVv7OYKEhymHqKwBdZPKzOz+Hb2fZdNZUup5LI8eGG//yQRwNsH07HcEhCl5Os82dcCCHTavsp8+nUgh913GpSM1MtU8N4Kt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MAppHl6a; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MAppHl6a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713961753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6nsKo0q4niaDpbjprANUt4BQhHVhyPgmHNzney+KoBg=;
	b=MAppHl6aN5T6otnB56K39Ios/1ZeaMnj9yZGTg25d02YhUogGMD+goCjiuBm7UdDee4W84
	0WZBInNjpRJ7R7VdVxC1kaA9QkOzVIPetYuSGjH2yPhfuPLtCk6db4I7keFk9oURMXaKyA
	fVst15YBXuLDuwUobKHzPg/VMH7foMY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-537-7kET92U6MJuHD1N8VNqVWA-1; Wed, 24 Apr 2024 08:29:10 -0400
X-MC-Unique: 7kET92U6MJuHD1N8VNqVWA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 004A1830E85;
	Wed, 24 Apr 2024 12:29:10 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.195.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C75E1C13FA3;
	Wed, 24 Apr 2024 12:29:08 +0000 (UTC)
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
Subject: [PATCH v2 24/24] platform/x86: thinkpad_acpi: Support hotkey to disable trackpoint doubletap
Date: Wed, 24 Apr 2024 14:28:34 +0200
Message-ID: <20240424122834.19801-25-hdegoede@redhat.com>
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

From: Mark Pearson <mpearson-lenovo@squebb.ca>

The hotkey combination Fn + G can be used to disable the trackpoint
doubletap feature on Windows. Add matching functionality for Linux.

Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
Link: https://lore.kernel.org/r/20240417173124.9953-4-mpearson-lenovo@squebb.ca
[hdegoede@redhat.com: Adjust for switch to sparse-keymap keymaps]
[hdegoede@redhat.com: Do not log unknown event msg for doubletap when disabled]
Tested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 7a27cbca6980..7e2288009063 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -183,6 +183,7 @@ enum tpacpi_hkey_event_t {
 						   * directly in the sparse-keymap.
 						   */
 	TP_HKEY_EV_AMT_TOGGLE		= 0x131a, /* Toggle AMT on/off */
+	TP_HKEY_EV_DOUBLETAP_TOGGLE	= 0x131c, /* Toggle trackpoint doubletap on/off */
 	TP_HKEY_EV_PROFILE_TOGGLE	= 0x131f, /* Toggle platform profile */
 
 	/* Reasons for waking up from S3/S4 */
@@ -372,6 +373,7 @@ static struct {
 	u32 hotkey_poll_active:1;
 	u32 has_adaptive_kbd:1;
 	u32 kbd_lang:1;
+	u32 trackpoint_doubletap:1;
 	struct quirk_entry *quirks;
 } tp_features;
 
@@ -3527,6 +3529,9 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 
 	hotkey_poll_setup_safe(true);
 
+	/* Enable doubletap by default */
+	tp_features.trackpoint_doubletap = 1;
+
 	return 0;
 }
 
@@ -3826,7 +3831,9 @@ static bool hotkey_notify_8xxx(const u32 hkey, bool *send_acpi_ev)
 {
 	switch (hkey) {
 	case TP_HKEY_EV_TRACK_DOUBLETAP:
-		tpacpi_input_send_key(hkey, send_acpi_ev);
+		if (tp_features.trackpoint_doubletap)
+			tpacpi_input_send_key(hkey, send_acpi_ev);
+
 		return true;
 	default:
 		return false;
@@ -11033,6 +11040,9 @@ static bool tpacpi_driver_event(const unsigned int hkey_event)
 		else
 			dytc_control_amt(!dytc_amt_active);
 
+		return true;
+	case TP_HKEY_EV_DOUBLETAP_TOGGLE:
+		tp_features.trackpoint_doubletap = !tp_features.trackpoint_doubletap;
 		return true;
 	case TP_HKEY_EV_PROFILE_TOGGLE:
 		platform_profile_cycle();
-- 
2.44.0


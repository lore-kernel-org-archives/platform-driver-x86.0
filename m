Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28C41B27D
	for <platform-driver-x86@vger.kernel.org>; Sun, 21 Apr 2024 15:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713714367; cv=none; b=YJhftPbNV/hQDUxgc3SS7bc2H6yqWG/+xiD6I90LpeOcqXVJZ2BClK4+oyy52rT8M8dJJtsmA0o/8CWSOHkTUvZtVLRXSehpevqrWPqAfxpdoNcNX59/sZu2INDhMKYXr5lSx6XgT6mdiMo1cwtj0ACZ/1u9w9PfquW2Ge3R2w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713714367; c=relaxed/simple;
	bh=jroP9Ku8ETzPW2yG2BEuYQJSjEKWqFL97XlgLq5MvMI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NA+jnAafxgu8Kj1aDMncdf3M7JLtGWRBto8gbHmxKPxoQxMhlH4HjfIhR1ob37PRYXUQv8GdCBNGrzemrJl/HIVVGr1NCegvsKMfD0Kqov+QPr55arIptUTV6Zwr/1HqjSBj6P1IzKfjwW/ntt1hUA5Q0W0Q+xcZP2QKb4Aaz6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Nd1c00+T; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Nd1c00+T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713714364;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YgKLEB9YqmegmBVYCh43Fl0YyweTGlVQeoVCCWEddIs=;
	b=Nd1c00+T6SCacI30FFIddA0UaDfPEK2HuL4a/UCmzBordS74Gm6dyaiQJ+bQf4i2jAy86T
	ItCMkzVeqTKni+fawTGHBrwSMaelitwuKVh1QXOtf7s4gJQMY5QSxK5iuBjsEvb8dLNs8z
	4SQGbXGLwe6cMPToqXRN1Y8T6E/rs7g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-282-4zSIIjlWPwypbuIDASdiMg-1; Sun, 21 Apr 2024 11:45:59 -0400
X-MC-Unique: 4zSIIjlWPwypbuIDASdiMg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 928651005D7C;
	Sun, 21 Apr 2024 15:45:58 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.66])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 79796407F3D5;
	Sun, 21 Apr 2024 15:45:57 +0000 (UTC)
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
Subject: [PATCH 24/24] platform/x86: thinkpad_acpi: Support hotkey to disable trackpoint doubletap
Date: Sun, 21 Apr 2024 17:45:20 +0200
Message-ID: <20240421154520.37089-25-hdegoede@redhat.com>
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

The hotkey combination Fn + G can be used to disable the trackpoint
doubletap feature on Windows. Add matching functionality for Linux.

Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
Link: https://lore.kernel.org/r/20240417173124.9953-4-mpearson-lenovo@squebb.ca
[hdegoede@redhat.com: Adjust for switch to sparse-keymap keymaps]
[hdegoede@redhat.com: Do not log unknown event msg for doubletap when disabled]
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index dd8873d61126..7b9d48271d7d 100644
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
 
@@ -3523,6 +3525,9 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 
 	hotkey_poll_setup_safe(true);
 
+	/* Enable doubletap by default */
+	tp_features.trackpoint_doubletap = 1;
+
 	return 0;
 }
 
@@ -3821,7 +3826,9 @@ static bool hotkey_notify_8xxx(const u32 hkey, bool *send_acpi_ev)
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
@@ -11028,6 +11035,9 @@ static bool tpacpi_driver_event(const unsigned int hkey_event)
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


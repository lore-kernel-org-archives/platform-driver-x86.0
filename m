Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AFD199B8
	for <platform-driver-x86@vger.kernel.org>; Sun, 21 Apr 2024 15:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713714348; cv=none; b=tiROZMN/bAp/ip7WzWuIDYHLFbJtTue5GIHocMvRF2u3Nbcs8etGJmxsMd9JxfDyrKFZQEgWCj1TE1nKHvieHhvbAdboIrtkseCUW2fu80xFa/W4+02bYxsw7IHEJYpJGy+XxkvrEC52JPQvig5S8BfmM1c64g+XffzO97DHECk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713714348; c=relaxed/simple;
	bh=spr4HE+7sdqYqr10HLcPCsH7aU8Wo6uDhtSFLDrq9zk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lh3r2nq+fauAx0jUPfr6ZyJgTaTi8EE4OPZ++Id4FqmwTPWfooMSnHlXDkGL22jRZr0LFJ68AFZ2JpEY+gFoN1gsP7Rli0jImr8WKAlowXAa6f2HmjodJYsbx+6vvOrIUbAnSoRMO0X3KwTh7Yr58QsCeiIwp2skjeJAPXWh50M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L0PXRFzz; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L0PXRFzz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713714345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=86SulCLqVPYVAss5wTbv7h50nFisEK/xSBhkR+RzgcU=;
	b=L0PXRFzz2x2HMHn7bNYd8XAI6rPd6nCaAP8Slj8qL45X32kWE8IhH0RKzo3p+Z2jmTUX+e
	QlcY9AqstjH2gb84GfkUpJvKibNyQqsf+NdxDZSMsIoWmuJ67Fyh1onhZgBWQ2qeszH3mr
	3oqkht8s2BFDnLp6LN71xN97VkCSSEU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-iTnqqejcOBSDMktzwhkLLQ-1; Sun, 21 Apr 2024 11:45:42 -0400
X-MC-Unique: iTnqqejcOBSDMktzwhkLLQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D68C18065AE;
	Sun, 21 Apr 2024 15:45:41 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.66])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7388A40357A7;
	Sun, 21 Apr 2024 15:45:40 +0000 (UTC)
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
Subject: [PATCH 11/24] platform/x86: thinkpad_acpi: Always call tpacpi_driver_event() for hotkeys
Date: Sun, 21 Apr 2024 17:45:07 +0200
Message-ID: <20240421154520.37089-12-hdegoede@redhat.com>
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

Call tpacpi_driver_event() at the top of hotkey_notify_hotkey() for all
(orig / adaptive / extended) hotkey types, rather then having the orig
code path call tpacpi_input_send_key_masked() which calls it through
hotkey_driver_event() and having the adaptive / extended helpers call
it separately.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 3a5c4dca5c1b..acd2c7e0dea6 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -3712,9 +3712,6 @@ static void adaptive_keyboard_s_quickview_row(void)
 
 static bool adaptive_keyboard_hotkey_notify_hotkey(const u32 hkey)
 {
-	if (tpacpi_driver_event(hkey))
-		return true;
-
 	if (hkey < TP_HKEY_EV_ADAPTIVE_KEY_START ||
 	    hkey > TP_HKEY_EV_ADAPTIVE_KEY_END) {
 		pr_info("Unhandled adaptive keyboard key: 0x%x\n", hkey);
@@ -3728,9 +3725,6 @@ static bool adaptive_keyboard_hotkey_notify_hotkey(const u32 hkey)
 
 static bool hotkey_notify_extended_hotkey(const u32 hkey)
 {
-	if (tpacpi_driver_event(hkey))
-		return true;
-
 	if (hkey >= TP_HKEY_EV_EXTENDED_KEY_START &&
 	    hkey <= TP_HKEY_EV_EXTENDED_KEY_END) {
 		unsigned int scancode = hkey - TP_HKEY_EV_EXTENDED_KEY_START +
@@ -3756,6 +3750,9 @@ static bool hotkey_notify_hotkey(const u32 hkey, bool *send_acpi_ev)
 			return true;
 	}
 
+	if (tpacpi_driver_event(hkey))
+		return true;
+
 	/*
 	 * Original events are in the 0x10XX range, the adaptive keyboard
 	 * found in 2014 X1 Carbon emits events are of 0x11XX. In 2017
@@ -3765,7 +3762,7 @@ static bool hotkey_notify_hotkey(const u32 hkey, bool *send_acpi_ev)
 	case 0:
 		if (hkey >= TP_HKEY_EV_ORIG_KEY_START &&
 		    hkey <= TP_HKEY_EV_ORIG_KEY_END) {
-			tpacpi_input_send_key_masked(scancode);
+			tpacpi_input_send_key(scancode);
 			return true;
 		}
 		break;
-- 
2.44.0


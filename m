Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FFF15AAA2
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Apr 2024 12:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713961739; cv=none; b=toULPeWYjAwdik3HrYOBXpoxILrolvEbNacUDeKXfDnQIes2ljvlBRiKNsjaYrAF5Y81g86DH2CLUjNQGPHq9USK4NTtzKTVrC5aJyOuLgboap5Rz8++oJPDmOYjQcbt47fuuFZZ1Y99ITUKNqbMZBh9iOMKQOQtaPlPvw1kNU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713961739; c=relaxed/simple;
	bh=rjPO8DH0pA9JdOPp0ggj2ZCmtdZjh4QbkxnjHyNDnVE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A2LOExu58zTGHCmGoUZ8SMSnzI0Ft0RiWlbBCFmEUd1a8g7in1x0JiiQUdJ/w+OXaiozFPS2naEbcmgBdf5EC6IvzGEURv2wfeVR4bYo78yB77F6wVbXp2Z0Xp+HtrpCzJHuXeZ+qm8ZTSxaVQqevkn6azQQDCbIC1bPveEtIo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qzwzi+Ze; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qzwzi+Ze"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713961737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IxC43M8Mawg7aalqwEn5qO0qdwjgtbqBNRS0N1xfmgc=;
	b=Qzwzi+ZexwqovsqQgWkLq4vShd6AZsdEJPmkLGNWsgk++bVBGsIyrS3jiLXsLNZ4cyukOK
	wqOTuhoOb0+6E7ZImSGW6rviDH6NcjVUc+9MeDwyl9dRG6hLnQBlccDjOnLPX7iDuOcTJ8
	pvWj0uJ6Q7Q/bjk+hky7yWj98gMmqeg=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-344-pWNuZHY6M6m3hkmxAdiJnA-1; Wed,
 24 Apr 2024 08:28:51 -0400
X-MC-Unique: pWNuZHY6M6m3hkmxAdiJnA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6043829AC01C;
	Wed, 24 Apr 2024 12:28:51 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.195.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E5870C13FA6;
	Wed, 24 Apr 2024 12:28:49 +0000 (UTC)
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
Subject: [PATCH v2 11/24] platform/x86: thinkpad_acpi: Always call tpacpi_driver_event() for hotkeys
Date: Wed, 24 Apr 2024 14:28:21 +0200
Message-ID: <20240424122834.19801-12-hdegoede@redhat.com>
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

Call tpacpi_driver_event() at the top of hotkey_notify_hotkey() for all
(orig / adaptive / extended) hotkey types, rather then having the orig
code path call tpacpi_input_send_key_masked() which calls it through
hotkey_driver_event() and having the adaptive / extended helpers call
it separately.

Tested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 05c1a562f6a1..25758d252f27 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -3713,9 +3713,6 @@ static void adaptive_keyboard_s_quickview_row(void)
 
 static bool adaptive_keyboard_hotkey_notify_hotkey(const u32 hkey)
 {
-	if (tpacpi_driver_event(hkey))
-		return true;
-
 	if (hkey < TP_HKEY_EV_ADAPTIVE_KEY_START ||
 	    hkey > TP_HKEY_EV_ADAPTIVE_KEY_END) {
 		pr_info("Unhandled adaptive keyboard key: 0x%x\n", hkey);
@@ -3729,9 +3726,6 @@ static bool adaptive_keyboard_hotkey_notify_hotkey(const u32 hkey)
 
 static bool hotkey_notify_extended_hotkey(const u32 hkey)
 {
-	if (tpacpi_driver_event(hkey))
-		return true;
-
 	if (hkey >= TP_HKEY_EV_EXTENDED_KEY_START &&
 	    hkey <= TP_HKEY_EV_EXTENDED_KEY_END) {
 		unsigned int scancode = hkey - TP_HKEY_EV_EXTENDED_KEY_START +
@@ -3757,6 +3751,9 @@ static bool hotkey_notify_hotkey(const u32 hkey, bool *send_acpi_ev)
 			return true;
 	}
 
+	if (tpacpi_driver_event(hkey))
+		return true;
+
 	/*
 	 * Original events are in the 0x10XX range, the adaptive keyboard
 	 * found in 2014 X1 Carbon emits events are of 0x11XX. In 2017
@@ -3766,7 +3763,7 @@ static bool hotkey_notify_hotkey(const u32 hkey, bool *send_acpi_ev)
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


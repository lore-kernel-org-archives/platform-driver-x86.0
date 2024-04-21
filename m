Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157CC1BC20
	for <platform-driver-x86@vger.kernel.org>; Sun, 21 Apr 2024 15:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713714356; cv=none; b=GHfLNmNvhRumoYT5UQFgl4eXks0YysbIhaBNmbyGXUpp7PdfK1fvR1LeelcdYA4JNXuy4KeVpLsVIiZS76gM8gdxthYcomfJXrkWl6O4DNaKmG9pPlHpCKPTnxQybBQRBp0PGh49KOeg9TXS880aQYhHFhUl4zNIYXIobMPUUck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713714356; c=relaxed/simple;
	bh=xDm4SEcWtRc7SYttDwC/8ka9pTZbNh+a7e3oRr55W54=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lDWXprHrXH8VsCIw3j0pmLDQ5w6mdrrdrVbte5MI4R0tealMzen76Z+w4XImF0uZHvmhj4cCccbg3NaM65TqEu+Q5e+BmC/I6RTbceIYu4U5HlZnQNK56wlArwKwBnpyqJyqrWXb3MnV/DZjiQoryHPTyhuM3ghJ2h3d3WNgIpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Zd4OB0eh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Zd4OB0eh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713714354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=soMQvIDFn2hV9rOkbrtpr5VaPlC0qyFAQ0wlLL8jG5c=;
	b=Zd4OB0ehnbFEbyJpAX5/hUxDwU5zm4i/rCPWMyhhyjIixnVDl1X5cYrzuk/y99F7jwAuxA
	Udal09aBzILeeubgQXxhvyavwGk0R/IDdfRBbQfhvEGZJLWFu0GfuDunhtRtJAMRgV4W61
	WaHEHafYZsNg81CuvrPzEXAUERRlSQY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-496-mBwWsH7oNdavdXxNiC5P5w-1; Sun, 21 Apr 2024 11:45:48 -0400
X-MC-Unique: mBwWsH7oNdavdXxNiC5P5w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1604989A248;
	Sun, 21 Apr 2024 15:45:48 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.66])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EE81240357A7;
	Sun, 21 Apr 2024 15:45:46 +0000 (UTC)
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
Subject: [PATCH 16/24] platform/x86: thinkpad_acpi: Change hotkey_reserved_mask initialization
Date: Sun, 21 Apr 2024 17:45:12 +0200
Message-ID: <20240421154520.37089-17-hdegoede@redhat.com>
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

Change the hotkey_reserved_mask initialization to hardcode the list
of reserved keys. There are only a few reserved keys and the code to
iterate over the keymap will be removed when moving to sparse-keymaps.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index ace615752c93..30219ba43208 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -3545,6 +3545,19 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 	dbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_HKEY,
 		   "using keymap number %lu\n", keymap_id);
 
+	/* Keys which should be reserved on both IBM and Lenovo models */
+	hotkey_reserved_mask = TP_ACPI_HKEY_KBD_LIGHT_MASK |
+			       TP_ACPI_HKEY_VOLUP_MASK |
+			       TP_ACPI_HKEY_VOLDWN_MASK |
+			       TP_ACPI_HKEY_MUTE_MASK;
+	/*
+	 * Reserve brightness up/down unconditionally on IBM models, on Lenovo
+	 * models these are disabled based on acpi_video_get_backlight_type().
+	 */
+	if (keymap_id == TPACPI_KEYMAP_IBM_GENERIC)
+		hotkey_reserved_mask |= TP_ACPI_HKEY_BRGHTUP_MASK |
+					TP_ACPI_HKEY_BRGHTDWN_MASK;
+
 	hotkey_keycode_map = kmemdup(&tpacpi_keymaps[keymap_id],
 			TPACPI_HOTKEY_MAP_SIZE,	GFP_KERNEL);
 	if (!hotkey_keycode_map) {
@@ -3560,9 +3573,6 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 		if (hotkey_keycode_map[i] != KEY_RESERVED) {
 			input_set_capability(tpacpi_inputdev, EV_KEY,
 						hotkey_keycode_map[i]);
-		} else {
-			if (i < sizeof(hotkey_reserved_mask)*8)
-				hotkey_reserved_mask |= 1 << i;
 		}
 	}
 
@@ -3587,9 +3597,8 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 		/* Disable brightness up/down on Lenovo thinkpads when
 		 * ACPI is handling them, otherwise it is plain impossible
 		 * for userspace to do something even remotely sane */
-		hotkey_reserved_mask |=
-			(1 << TP_ACPI_HOTKEYSCAN_FNHOME)
-			| (1 << TP_ACPI_HOTKEYSCAN_FNEND);
+		hotkey_reserved_mask |= TP_ACPI_HKEY_BRGHTUP_MASK |
+					TP_ACPI_HKEY_BRGHTDWN_MASK;
 		hotkey_unmap(TP_ACPI_HOTKEYSCAN_FNHOME);
 		hotkey_unmap(TP_ACPI_HOTKEYSCAN_FNEND);
 	}
-- 
2.44.0


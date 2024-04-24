Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067AE15B108
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Apr 2024 12:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713961734; cv=none; b=PXRXbRI6KZCDz8OxfhWOrXJqT361sb/jINqKRUpB8GabRpEmB5QdgiW+h4K3taiTheXrT2VVXy8TarAduox90tGfPwbcl/xjdNCyl92/UA/qOV+JiFRb0NE+kWO3o7CNC8D76oXczb3jTVKTm2xPaUWvLFmbTU+suWMnS/KwBc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713961734; c=relaxed/simple;
	bh=V4pqAbashQ1I+t3rHM16FONWZ8zfBPjubDy0ih9mn8Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jaDI6jXf67gi7NLPCnpA6Cwn18+tRskJWfhmUiKgBqJlJnL8cWiWNPwxuRabDrX9d8Fal49ATPaLHkVdX++02Rxy/lRt59kCQQ/wov0uhFdbw0SUjzMYab28XHrpCiobI0Vu1m0OLTRaPnYYV3PyX8Kkvu4mw4Go9wJXRMT4B3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bBSX+X05; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bBSX+X05"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713961732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=koYczCjHK/r7kbO/0nl3Gw+M6AO6/yC2q1EpuYm7qYo=;
	b=bBSX+X05peCpVXZdc9mDBYQeTAMAIGt6+sJuMnB8Qu9uGKcTcBtRnXm2x9GDIoA577OSa1
	ZX0lwKN0YzLdPhyLVqZBlZAdORvXRwpGQKpWyQdwzyFzJ2p6qN1/4zxazT+9qLS+esMfuD
	HRS2vHOC76mPhiaafZYWkMwJC6VHiDs=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-83-ObG46QxoMb2sf74LXX_04g-1; Wed,
 24 Apr 2024 08:28:48 -0400
X-MC-Unique: ObG46QxoMb2sf74LXX_04g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 62D2F1C0513F;
	Wed, 24 Apr 2024 12:28:48 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.195.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3EA22C13FA5;
	Wed, 24 Apr 2024 12:28:47 +0000 (UTC)
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
Subject: [PATCH v2 09/24] platform/x86: thinkpad_acpi: Move special original hotkeys handling out of switch-case
Date: Wed, 24 Apr 2024 14:28:19 +0200
Message-ID: <20240424122834.19801-10-hdegoede@redhat.com>
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

Move the special handling (send_acpi_ev = false, hotkey_source_mask check)
for original hotkeys out of the switch-case in hotkey_notify_hotkey().
This is a preparation patch for further refactoring.

Tested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index f4d7f3c25a4a..ba440213ae49 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -3745,6 +3745,15 @@ static bool hotkey_notify_hotkey(const u32 hkey, bool *send_acpi_ev)
 {
 	unsigned int scancode = hkey - TP_HKEY_EV_ORIG_KEY_START;
 
+	/* Never send ACPI netlink events for original hotkeys (hkey: 0x1001 - 0x1020) */
+	if (hkey >= TP_HKEY_EV_ORIG_KEY_START && hkey <= TP_HKEY_EV_ORIG_KEY_END) {
+		*send_acpi_ev = false;
+
+		/* Original hotkeys may be polled from NVRAM instead */
+		if (hotkey_source_mask & (1 << scancode))
+			return true;
+	}
+
 	/*
 	 * Original events are in the 0x10XX range, the adaptive keyboard
 	 * found in 2014 X1 Carbon emits events are of 0x11XX. In 2017
@@ -3754,10 +3763,7 @@ static bool hotkey_notify_hotkey(const u32 hkey, bool *send_acpi_ev)
 	case 0:
 		if (hkey >= TP_HKEY_EV_ORIG_KEY_START &&
 		    hkey <= TP_HKEY_EV_ORIG_KEY_END) {
-			if (!(hotkey_source_mask & (1 << scancode)))
-				tpacpi_input_send_key_masked(scancode);
-
-			*send_acpi_ev = false;
+			tpacpi_input_send_key_masked(scancode);
 			return true;
 		}
 		break;
-- 
2.44.0


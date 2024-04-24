Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2CE15B107
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Apr 2024 12:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713961737; cv=none; b=QtzNCfo3I77QrJU/CQSQj5dtxFy49NCmiKijdWu8WNRGcievj8+l1s2iXThZy+IM3WNn0chuD/B1L/dxLONhvPsQXF8diW5kR9RAbD1nohyvxAbSIw240hGY4rQ9zawqrxunDmF7W1I+7OTRU+qSlWnrnaEyfwsdMbYs8nUk37w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713961737; c=relaxed/simple;
	bh=T90/xAVghpXc/eEsWuNsH33hmDQtGJhRSc23hW16LFI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DVPxzujy58hfugWt8OdiLmDsyhKCS5Unuv3gRtshLF9ECQwh0CdQNjG7Vqp1ryYFTefcfVEDd2tzCfQiFYGJpkamlUTuM8fzX8/Y1dzUZbj0VtkoSG0adrFt8SWo4U1lVIpuwxJDkv7X8sLjwYM6EiZi/JaQTMZe3xAwKahCH/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AH+eBcyY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AH+eBcyY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713961734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mK3Hc7ZFofFM9Zf9Re1qp9IuYreHHDkQG7ObPY71tzA=;
	b=AH+eBcyYwsMY1CA9XxXodx1vdH+IJXvL/nbgJhbo4fnQ+VmZ6JONUTYeq8D3aohjTuY1YU
	6vSullG+EPYj0WLjsv+bj2muGJasePs39kBqE7OnRqGiwd1LWxn334JoHwztKV++ISidtk
	mRFXTFvtGVa8v5snu96KQ4EUtOXMUeg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-487-koMY1mCrNR-9o7_P6O--Mg-1; Wed, 24 Apr 2024 08:28:53 -0400
X-MC-Unique: koMY1mCrNR-9o7_P6O--Mg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B6AE781B561;
	Wed, 24 Apr 2024 12:28:52 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.195.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8EDA4C15771;
	Wed, 24 Apr 2024 12:28:51 +0000 (UTC)
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
Subject: [PATCH v2 12/24] platform/x86: thinkpad_acpi: Drop tpacpi_input_send_key_masked() and hotkey_driver_event()
Date: Wed, 24 Apr 2024 14:28:22 +0200
Message-ID: <20240424122834.19801-13-hdegoede@redhat.com>
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

Both are only 1 / 2 lines and both only have 1 caller fold the contents
into tpacpi_hotkey_send_key() which is their single caller.

Tested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 25758d252f27..593093884cc5 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -1919,7 +1919,6 @@ static u32 hotkey_acpi_mask;		/* events enabled in firmware */
 static u16 *hotkey_keycode_map;
 
 static bool tpacpi_driver_event(const unsigned int hkey_event);
-static void hotkey_driver_event(const unsigned int scancode);
 static void hotkey_poll_setup(const bool may_warn);
 
 /* HKEY.MHKG() return bits */
@@ -2275,20 +2274,14 @@ static void tpacpi_input_send_key(const unsigned int scancode)
 	}
 }
 
-/* Do NOT call without validating scancode first */
-static void tpacpi_input_send_key_masked(const unsigned int scancode)
-{
-	hotkey_driver_event(scancode);
-	tpacpi_input_send_key(scancode);
-}
-
 #ifdef CONFIG_THINKPAD_ACPI_HOTKEY_POLL
 static struct tp_acpi_drv_struct ibm_hotkey_acpidriver;
 
 /* Do NOT call without validating scancode first */
 static void tpacpi_hotkey_send_key(unsigned int scancode)
 {
-	tpacpi_input_send_key_masked(scancode);
+	tpacpi_driver_event(TP_HKEY_EV_ORIG_KEY_START + scancode);
+	tpacpi_input_send_key(scancode);
 }
 
 static void hotkey_read_nvram(struct tp_nvram_state *n, const u32 m)
@@ -11168,11 +11161,6 @@ static bool tpacpi_driver_event(const unsigned int hkey_event)
 	return false;
 }
 
-static void hotkey_driver_event(const unsigned int scancode)
-{
-	tpacpi_driver_event(TP_HKEY_EV_ORIG_KEY_START + scancode);
-}
-
 /* --------------------------------------------------------------------- */
 
 /* /proc support */
-- 
2.44.0


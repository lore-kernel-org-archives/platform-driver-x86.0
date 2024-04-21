Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ECA31A291
	for <platform-driver-x86@vger.kernel.org>; Sun, 21 Apr 2024 15:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713714351; cv=none; b=KydTcFI2hAVAY3B94O1TLnrOUaP6hze9/HaAScNDB5Wi/WG6M3lMwFsfCtyK2kuXMSq0xffdG8d8Vhd02CnSUFMtFovGSeMOMCe9BFf7wd+N767nEMWb75u8CXnSBrcBXBWglOj4k9xABnJFABHRa2+1kP6F/LNhrGOE5yjbPe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713714351; c=relaxed/simple;
	bh=ZlpV2laXevVtynTlfQZkNYFBQpY5rpUlsCTRMiNlrWY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Eu6q+0mRahIeQgmErXIDUoWxD9qtPi7T6RWHjfGThPnmWCZQ5pO9+aKP2T1Voufsi4AfV5LinelPwjMZPoSWB07Ycn/kGTsGepl5HEeLi4cqvU9IkClhs/Qv1TkX8zec8L18mknEDLrD9GVbXy3cpAoW6BCCLFSUNmbFOq3hgZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QPYLJuCY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QPYLJuCY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713714349;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SuKvjF97wP5SiRRXeVZ80DuORnYCtp3wHlgNR1jQFUU=;
	b=QPYLJuCYVAz3IirW07z4D0q72mme7vcdfdW9mLFeW/Cq/nAKa4AJQcX1Rup8jCSSZeUpOc
	Q7g67Fi5TCH5lgV0+/mCbwff0VSoWcdDr97WGc0WMVwtTfT6SpcM9L8J1aKtkhKO1tSd8+
	FYY68WYqXZBztbh85vO4QL8VNmWoaH0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-689-FFgOUaYBN0C6ORxIJMRPkw-1; Sun, 21 Apr 2024 11:45:46 -0400
X-MC-Unique: FFgOUaYBN0C6ORxIJMRPkw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 778E9802E4D;
	Sun, 21 Apr 2024 15:45:45 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.66])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 582D640829C3;
	Sun, 21 Apr 2024 15:45:44 +0000 (UTC)
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
Subject: [PATCH 14/24] platform/x86: thinkpad_acpi: Move tpacpi_driver_event() call to tpacpi_input_send_key()
Date: Sun, 21 Apr 2024 17:45:10 +0200
Message-ID: <20240421154520.37089-15-hdegoede@redhat.com>
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

All callers of tpacpi_input_send_key() first call tpacpi_driver_event(),
move the tpacpi_driver_event() inside tpacpi_input_send_key() to avoid
code duplication.

For the original hotkey codes 0x1001 - 0x1020 tpacpi_driver_event() never
returns true. So the added "return true;" inside tpacpi_input_send_key()
never happens when called from tpacpi_hotkey_send_key() so behavior does
not change.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 633701c218f2..bed66dd54920 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -2254,6 +2254,9 @@ static bool tpacpi_input_send_key(const u32 hkey)
 {
 	unsigned int keycode, scancode;
 
+	if (tpacpi_driver_event(hkey))
+		return true;
+
 	if (hkey >= TP_HKEY_EV_ORIG_KEY_START &&
 	    hkey <= TP_HKEY_EV_ORIG_KEY_END) {
 		scancode = hkey - TP_HKEY_EV_ORIG_KEY_START;
@@ -2295,7 +2298,6 @@ static struct tp_acpi_drv_struct ibm_hotkey_acpidriver;
 /* Do NOT call without validating scancode first */
 static void tpacpi_hotkey_send_key(unsigned int scancode)
 {
-	tpacpi_driver_event(TP_HKEY_EV_ORIG_KEY_START + scancode);
 	tpacpi_input_send_key(TP_HKEY_EV_ORIG_KEY_START + scancode);
 }
 
@@ -3731,9 +3733,6 @@ static bool hotkey_notify_hotkey(const u32 hkey, bool *send_acpi_ev)
 			return true;
 	}
 
-	if (tpacpi_driver_event(hkey))
-		return true;
-
 	return tpacpi_input_send_key(hkey);
 }
 
-- 
2.44.0


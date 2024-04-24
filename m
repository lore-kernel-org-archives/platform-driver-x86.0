Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9CC15B100
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Apr 2024 12:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713961744; cv=none; b=AxLJs3UGKGuixHCaq27C/sEOYUT0b1e4aa8a+HYq56UT7tUpEo0byzFviHt/dJqR3+diqR4CPsF/n9JeaeJcsXKMjq9z3WfumfSrFkHt0S/DzPe29uyDRFNRpxC/QPgcfCfhBXo3cEmU0KlX+qfPRSGm8euwauV7rzV74tLosVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713961744; c=relaxed/simple;
	bh=EKnBuR6pcpsVy7VJoOk/1jJY2rK6aubmKzNj0Z88b7s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JL5Nlb92RDfBuJ57IbhnX8Yoe5uF91iBbPxIHAxXt+dyYBl+YuC3MVXfb+8Sfcqbt2U57PZLG6iVqarCHe/4h0XhyE881wzBMV1eCSvHaddeYmCltJkm5a2/pEHA3MjMQoIcffyPutHn6k6PEJjrj5dnlOzbfi2PpGRIoRVOuLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=f1S+6l8E; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f1S+6l8E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713961739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XGRfok/6unr1+qVxnKywpzSejxrLgiYMakPBmTLB2KY=;
	b=f1S+6l8Ey4lSEtKRP0dqUtvOicbpnit+pqTjAjWtem79iJMeiD7+Hbpsg4Mut8UmdF/TlM
	B1XGoskFKY8nQ5V7J6xOgJ6r+vG7QKtsAfZ+cW8AK1FkqB7oPOUeWmYTdcaC9qo8F1Uq83
	vyqTNH7ZT3DMAy781kaUkKm8Yf0RsA8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-453-vOjExRNQNiqbrZbEcFa7Qg-1; Wed, 24 Apr 2024 08:28:55 -0400
X-MC-Unique: vOjExRNQNiqbrZbEcFa7Qg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B4768DCFC3;
	Wed, 24 Apr 2024 12:28:55 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.195.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 46A20C13FA3;
	Wed, 24 Apr 2024 12:28:54 +0000 (UTC)
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
Subject: [PATCH v2 14/24] platform/x86: thinkpad_acpi: Move tpacpi_driver_event() call to tpacpi_input_send_key()
Date: Wed, 24 Apr 2024 14:28:24 +0200
Message-ID: <20240424122834.19801-15-hdegoede@redhat.com>
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

All callers of tpacpi_input_send_key() first call tpacpi_driver_event(),
move the tpacpi_driver_event() inside tpacpi_input_send_key() to avoid
code duplication.

For the original hotkey codes 0x1001 - 0x1020 tpacpi_driver_event() never
returns true. So the added "return true;" inside tpacpi_input_send_key()
never happens when called from tpacpi_hotkey_send_key() so behavior does
not change.

Tested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 08419dede995..9b38770412ab 100644
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
 
@@ -3732,9 +3734,6 @@ static bool hotkey_notify_hotkey(const u32 hkey, bool *send_acpi_ev)
 			return true;
 	}
 
-	if (tpacpi_driver_event(hkey))
-		return true;
-
 	return tpacpi_input_send_key(hkey);
 }
 
-- 
2.44.0


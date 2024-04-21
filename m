Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443261A291
	for <platform-driver-x86@vger.kernel.org>; Sun, 21 Apr 2024 15:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713714349; cv=none; b=hndv9sush6nty3cNdcrj9S0YZB3vgvxev+zvKKwElK8kbPHreaUWoSahC+l1/DJzAFey6r0978575WTOKrjblvLqNbjhDlV65NVoE9Y8FGrU9IUAw1IzYCmJ/ZTbs7Boi9+MBLrJ9TSbHRGBEtzmvK0XSI/J/bHeeYbN6VNu7z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713714349; c=relaxed/simple;
	bh=xGsp+6v7rISNeq/7B3ff5tExliWnZ6NHgJ62fLPtOAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QEU+FdlieAU3zty+DXWbFZFyqiyXDq7Oe+FHX+sDU35ZDA6Xzvz+DgupmSzPa5SOCc0qCxwWqnn1KERDVpd+enjSznlrkzwT9G9EIvJ+mACbrl+m1kkP4J6PgKwZiLnQr8X41rrJzVsc/rBeMmWQmPGebtyvOBYmWkXhN1lH+Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VNQW/l0H; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VNQW/l0H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713714347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pPEuP85JM+Hqh/Twef4FmVCYuO56o0XSHWMtS119Q+Y=;
	b=VNQW/l0H8v55E0/MeYYqajugr1vO7WfrH/OGsUNZTMnKS40QYcAyJWe/oBUDMnoId/KNcd
	iRJrGoyKQMS1UfpVKqdgs7q0+vyCo6nXWA1ZT/qQ7F7UjTx9ns43Z4k/bqXIwoY9ub7x7P
	r3s3NvyDdyTj/T9EO5wShaX5TDVI5I4=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-454-ypLHZJADMGmUOsRfqt_8sA-1; Sun,
 21 Apr 2024 11:45:40 -0400
X-MC-Unique: ypLHZJADMGmUOsRfqt_8sA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 459AA380450C;
	Sun, 21 Apr 2024 15:45:40 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.66])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2A1B640829C3;
	Sun, 21 Apr 2024 15:45:39 +0000 (UTC)
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
Subject: [PATCH 10/24] platform/x86: thinkpad_acpi: Move hotkey_user_mask check to tpacpi_input_send_key()
Date: Sun, 21 Apr 2024 17:45:06 +0200
Message-ID: <20240421154520.37089-11-hdegoede@redhat.com>
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

Move hotkey_user_mask check to tpacpi_input_send_key(), this is
a preparation patch for further refactoring.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index f7dacd2c338a..3a5c4dca5c1b 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -2256,6 +2256,10 @@ static void tpacpi_input_send_key(const unsigned int scancode)
 {
 	const unsigned int keycode = hotkey_keycode_map[scancode];
 
+	if (scancode < TP_ACPI_HOTKEYSCAN_ADAPTIVE_START &&
+	    !(hotkey_user_mask & (1 << scancode)))
+		return;
+
 	if (keycode != KEY_RESERVED) {
 		mutex_lock(&tpacpi_inputdev_send_mutex);
 
@@ -2275,8 +2279,7 @@ static void tpacpi_input_send_key(const unsigned int scancode)
 static void tpacpi_input_send_key_masked(const unsigned int scancode)
 {
 	hotkey_driver_event(scancode);
-	if (hotkey_user_mask & (1 << scancode))
-		tpacpi_input_send_key(scancode);
+	tpacpi_input_send_key(scancode);
 }
 
 #ifdef CONFIG_THINKPAD_ACPI_HOTKEY_POLL
-- 
2.44.0


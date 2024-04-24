Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8887515ADAE
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Apr 2024 12:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713961729; cv=none; b=awN3GSOzFyNEppeWQLwOjx4PEy5vJw457k+lhJp/Jz/I0t8z/Mko9PC+OGxS4lcjsPCd9oIBl+i2/KskoLdCsTwj8VHXYARTgxGLjt7M0SaLSbLitFRNP77bgsqqFNlDhM9N5H+fb/9CM42H0LX/HFdcw1RuzBrx2hDOUXy+QyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713961729; c=relaxed/simple;
	bh=VEVLlD9cSdS/6D7/DZUiK3MO5VBD8nSMqBkjIJ4Cld8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MMfSfjo3uc1Pq6AbVYw9zT2Vkei0JeGcp7iteD6Cz/OLYrYS5a9aH0l5GzEXqZuy/kpGfhW81VrE0NlNX8GYy+XPNsDaS4guo0YfJfqrajSQpcHdHoOVE+1J4bVi5ArZUcL7zOdRWiTNqdE10rolW0h0qNAA0KF3i3v34j0j2Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bIn5sbOW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bIn5sbOW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713961725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gOcYJ7QjDNUmjLYidLgoqDVvkZMatE/cwGfA65Igyjc=;
	b=bIn5sbOWSyTABzD6Ygqx0+aInHcuecKIAXo28fRc8YGm/r3M1YV6LpeTvkfx4s6i2pNnF6
	JXJxH/mlF5baExN/fYopiN4zW6h5I2mtW3wuwnSg67GfoXtJVdY3BAHsTUh3UvqjH2DB5a
	UZepydIhCe5BwRWCVfH8fi31k/c6mY8=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-7-80vOxQLfOfGKBvaIFDRFQQ-1; Wed,
 24 Apr 2024 08:28:39 -0400
X-MC-Unique: 80vOxQLfOfGKBvaIFDRFQQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC6B43806703;
	Wed, 24 Apr 2024 12:28:38 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.195.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C8331C13FA3;
	Wed, 24 Apr 2024 12:28:37 +0000 (UTC)
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
Subject: [PATCH v2 02/24] platform/x86: thinkpad_acpi: Provide hotkey_poll_stop_sync() dummy
Date: Wed, 24 Apr 2024 14:28:12 +0200
Message-ID: <20240424122834.19801-3-hdegoede@redhat.com>
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

Provide a hotkey_poll_stop_sync() dummy implementation when
CONFIG_THINKPAD_ACPI_HOTKEY_POLL, so that the #ifdef-ery around
hotkey_poll_stop_sync() can be removed from hotkey_exit().

Tested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index ba4df8f68c2a..fc5681808c3b 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -2575,6 +2575,9 @@ static void hotkey_poll_setup_safe(const bool __unused)
 {
 }
 
+static void hotkey_poll_stop_sync(void)
+{
+}
 #endif /* CONFIG_THINKPAD_ACPI_HOTKEY_POLL */
 
 static int hotkey_inputdev_open(struct input_dev *dev)
@@ -3045,9 +3048,7 @@ static void tpacpi_send_radiosw_update(void)
 static void hotkey_exit(void)
 {
 	mutex_lock(&hotkey_mutex);
-#ifdef CONFIG_THINKPAD_ACPI_HOTKEY_POLL
 	hotkey_poll_stop_sync();
-#endif
 	dbg_printk(TPACPI_DBG_EXIT | TPACPI_DBG_HKEY,
 		   "restoring original HKEY status and mask\n");
 	/* yes, there is a bitwise or below, we want the
-- 
2.44.0


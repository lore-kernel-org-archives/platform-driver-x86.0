Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0AE199B4
	for <platform-driver-x86@vger.kernel.org>; Sun, 21 Apr 2024 15:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713714350; cv=none; b=CppzXI+7DYR+furGa4iOF9BTl0QI3l2tzbfANvzLhaPmgtU3ZPlC+RGZ8PI0GaMdFv8o8TtK5LPFMR3PWLqYNiSj3z4DFvLxvKrUS3f0Ppe32A1RqPoISsU45oURtG4LYN9OdxHCXq25sok2aAMakCwO26zN8tRZLuLXVCPgnfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713714350; c=relaxed/simple;
	bh=jnxNRvMNvB1IhioXsTqOs1RIocpKJpM/cSzgnMro+7w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d8DO/RAU7sH0M46WKMr7cN1OPyDPsIiBJkZfA4SBaeA4jN20NcS0J0e3RwuUBlnq2869uVd0ek5y6amXM0PTX0atz/XCWVxfFl9AL8ixcMIncEKVZ7kZz0sHCg4kbyerc9knvWxsqenwmIlPAlus0zChYLCkPUntvjRw5HqL/jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D22NAxzR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D22NAxzR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713714348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nVcjbji+h5OBgnB/rtWKpMSYXx8CV8D3blVjNswdio0=;
	b=D22NAxzRhOaxbHTM6IMB50xcWNmh8YRzgLaYSaq7q6PSDAuG4n8ihpX1LhbOy2FsUIjfJK
	fK9fQ1ea6RM6irYQwMxyUOXThPB+1PPDACBse260twSGbpAAFrD+5IXB6flBVkUFEiKy4W
	KyylGP3UPsj/XQY2kC3fWtQ4p7ebsvY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-330-bHlngMirO_at-MFuatKELQ-1; Sun, 21 Apr 2024 11:45:43 -0400
X-MC-Unique: bHlngMirO_at-MFuatKELQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D6F7D80B935;
	Sun, 21 Apr 2024 15:45:42 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.66])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BC51F40829C3;
	Sun, 21 Apr 2024 15:45:41 +0000 (UTC)
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
Subject: [PATCH 12/24] platform/x86: thinkpad_acpi: Drop tpacpi_input_send_key_masked() and hotkey_driver_event()
Date: Sun, 21 Apr 2024 17:45:08 +0200
Message-ID: <20240421154520.37089-13-hdegoede@redhat.com>
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

Both are only 1 / 2 lines and both only have 1 caller fold the contents
into tpacpi_hotkey_send_key() which is their single caller.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index acd2c7e0dea6..bc87c78ab0f2 100644
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
@@ -11167,11 +11160,6 @@ static bool tpacpi_driver_event(const unsigned int hkey_event)
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


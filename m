Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2F81E52C
	for <platform-driver-x86@vger.kernel.org>; Wed, 27 Mar 2024 19:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711569444; cv=none; b=ImUcIQCXkWpL0mVXDb+DglB/S6x+KCW3TlL9s872qrfCYpD2s83RBdcXWxsylpyFsso/sOgOtFhyzRarRtzts8XIFAxZ92MlV/aFoSyS477R5Eb/SgJJG8UpSKWPsmzPWJZDWmksd4R2IzliZjcc82Qn7nZHZAmZC0rFgQOqGD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711569444; c=relaxed/simple;
	bh=PwwWaMkjcAnTN3Yl5abWp9vRPUpCdb/AxVd3dbrI/qE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k8Q+GBzZs8PWrn4k9RbhVxRidNGDOXj2Von0BaPXn1f6zGyXxE+yv2f+XL3xh8PukW05znkse5DLjk0ssqT4IZCKEO1bJkbJ9lA1Gb3qRhoffN3vMJbobSLS00X69YdkQDRBmuZ3zf2bO2QmQy3DMueGfnO9UO4y5IYIX4Buxg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g05uW8J9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g05uW8J9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711569441;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=k8x6FLbDO3dryiT00cduLLZ+5Sspq2JbPLrEoS7YurU=;
	b=g05uW8J9l4dZyFKA1OVjE+Wlw9IpbUFYcDVoTyMRR85gTFbDPeA5PDLHjgGA+SzVqy8YWR
	RDRPV8ogW5jqceFp7Tuuo9n87x1E+WxTyx3E29azpj+zzU+AAix2FqMj+kytc0Y+idYIP6
	21H9DlLJ6Oz1v5EAfHpCLvi2/Nd+Wmg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-323-vb40LO-iOxmNs8GP1KpYRA-1; Wed, 27 Mar 2024 15:57:18 -0400
X-MC-Unique: vb40LO-iOxmNs8GP1KpYRA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB0458007A4;
	Wed, 27 Mar 2024 19:57:17 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.114])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DE8F51C060D0;
	Wed, 27 Mar 2024 19:57:16 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	AceLan Kao <acelan.kao@canonical.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: intel-vbtn: Log event code on unexpected button events
Date: Wed, 27 Mar 2024 20:57:12 +0100
Message-ID: <20240327195712.43851-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7

When logging the warning about receiving a button event on a device
without buttons log the event code which triggered the warning.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel/vbtn.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/vbtn.c b/drivers/platform/x86/intel/vbtn.c
index 084c355c86f5..de4decbb13ba 100644
--- a/drivers/platform/x86/intel/vbtn.c
+++ b/drivers/platform/x86/intel/vbtn.c
@@ -158,7 +158,8 @@ static void notify_handler(acpi_handle handle, u32 event, void *context)
 
 	if ((ke = sparse_keymap_entry_from_scancode(priv->buttons_dev, event))) {
 		if (!priv->has_buttons) {
-			dev_warn(&device->dev, "Warning: received a button event on a device without buttons, please report this.\n");
+			dev_warn(&device->dev, "Warning: received 0x%02x button event on a device without buttons, please report this.\n",
+				 event);
 			return;
 		}
 		input_dev = priv->buttons_dev;
-- 
2.44.0


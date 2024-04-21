Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680E9199B4
	for <platform-driver-x86@vger.kernel.org>; Sun, 21 Apr 2024 15:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713714336; cv=none; b=OiWcTjCQq+vvuX0b2fAhSF8Aw4e/lXIV6l2ECH+hpNv5+e9dczwaY/XBRjpO9S2escPCK+FOxW5Wi3plUbAGjglC+GmyFUOpkGjq8eH4whFgaCI0+D06FGBEuFDAGJ2GsHLqvfdnVNJGgWDYK9GZ6Acs3d4EHwvEBTo6/wFEprw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713714336; c=relaxed/simple;
	bh=qNOJKbc7cCGDmwTuhfuZEUQsSkSMa+lJhr5eWUU23UM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eRYn9RAIkSf0GYaStVNRTF5uxXnnfEM5KrUfgiZ4sY78E6iMqVGLLc2BUaagwE0gHTK165AcWm0xDvqMPDIhbMHUWAd2daSzP3mstnKtquIVIsrtUrmq6cA++amEvvMf9RfZs2KPUxMioMB7ItTAblHb+IzMKP8pW6RhDljPlV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=R6K6cpF4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R6K6cpF4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713714334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eRJS14jEMEAweraoFLSRpvMpzEv8JeJAQvdnoLpFW1s=;
	b=R6K6cpF4F8e4cXQv2zXwsxYMdn4h603NEZTm7x5uBUQuNfQ7IQPyrRWHkjopb59rTLaST3
	avMk9CQkvZz0rv5/uFqYK07budzMWi3F15/PsSOLgSqw477hDYxj4KLQ48ASKymzXxKPOE
	2AqmTcUY/NogLCQ5uflHVMQpHjyYV6g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-wZAaQ7gWOX2PKFlUyAavVw-1; Sun, 21 Apr 2024 11:45:29 -0400
X-MC-Unique: wZAaQ7gWOX2PKFlUyAavVw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 90D1389A245;
	Sun, 21 Apr 2024 15:45:28 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.66])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7632740357A7;
	Sun, 21 Apr 2024 15:45:27 +0000 (UTC)
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
Subject: [PATCH 01/24] platform/x86: thinkpad_acpi: Take hotkey_mutex during hotkey_exit()
Date: Sun, 21 Apr 2024 17:44:57 +0200
Message-ID: <20240421154520.37089-2-hdegoede@redhat.com>
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

hotkey_exit() already takes the mutex around the hotkey_poll_stop_sync()
call, but not around the other calls.

commit 38831eaf7d4c ("platform/x86: thinkpad_acpi: use lockdep
annotations") has added lockdep_assert_held() checks to various hotkey
functions.

These lockdep_assert_held() checks fail causing WARN() backtraces in
dmesg due to missing locking in hotkey_exit(), fix this.

Fixes: 38831eaf7d4c ("platform/x86: thinkpad_acpi: use lockdep annotations")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 771aaa7ae4cf..ba4df8f68c2a 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -3044,10 +3044,9 @@ static void tpacpi_send_radiosw_update(void)
 
 static void hotkey_exit(void)
 {
-#ifdef CONFIG_THINKPAD_ACPI_HOTKEY_POLL
 	mutex_lock(&hotkey_mutex);
+#ifdef CONFIG_THINKPAD_ACPI_HOTKEY_POLL
 	hotkey_poll_stop_sync();
-	mutex_unlock(&hotkey_mutex);
 #endif
 	dbg_printk(TPACPI_DBG_EXIT | TPACPI_DBG_HKEY,
 		   "restoring original HKEY status and mask\n");
@@ -3057,6 +3056,8 @@ static void hotkey_exit(void)
 	      hotkey_mask_set(hotkey_orig_mask)) |
 	     hotkey_status_set(false)) != 0)
 		pr_err("failed to restore hot key mask to BIOS defaults\n");
+
+	mutex_unlock(&hotkey_mutex);
 }
 
 static void __init hotkey_unmap(const unsigned int scancode)
-- 
2.44.0


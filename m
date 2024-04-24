Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E22158DD6
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Apr 2024 12:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713961725; cv=none; b=IcbnY6C01E4v9ppPQuDMorsCTE/9emf/Jo/o1FK7ELSrJCh1KgnDGEiX+/Baat0nx5WCGdHz38pCM7zMwbapVtmHZvKLASH/FXiWDvgZcWgm6vloiTV6GxNu/oyVYb3OPO9f+uaREWMwDeld4TYbERv76WQEFEiOR8bwDB0zO6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713961725; c=relaxed/simple;
	bh=HlCU3HasjapcNdZymtPYXlEGBkXfFSj7Y4X9frrXYdM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lo+QWs0AlJZwINZgIpYmgqLzXH4x9SMG2Wy0PjOd1nFMJqd8v30Tz4EEsjVaslC8uyZIS/EaTvlCjsci7ZmDDLG5NRRE7m5ViZKKj3I27rGKcbDuZe6uotcMB2PxSBXR5n2tSJP7oY2sFqHpvyZ07jwJzKQIwV0J+tfYzyVYFpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=esR8ahsP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="esR8ahsP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713961722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TlhfdfFKJRtI0kowbIbRXk0Rgrwm63hOdtE/+4j/f0Y=;
	b=esR8ahsP55zfK05ITM1EbkyK+EkVdRVjHEIHA8uHWpuBQC9AEnHK9QSwbmz2QVZTS5Mbss
	ruSNsBPfJoCOVc+EAhYVUJZb6txOVH9RShiwP6eS9A/mzZ97cVL7018Eh8RETKhzkQ7s3L
	2uSJrFbaH1bRms5J7AXOOjgRSpEY23w=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-435-TBQIGLZ7M4iO-IJwZC0lVQ-1; Wed,
 24 Apr 2024 08:28:38 -0400
X-MC-Unique: TBQIGLZ7M4iO-IJwZC0lVQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9992F1C0C647;
	Wed, 24 Apr 2024 12:28:37 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.195.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 75399C01595;
	Wed, 24 Apr 2024 12:28:36 +0000 (UTC)
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
Subject: [PATCH v2 01/24] platform/x86: thinkpad_acpi: Take hotkey_mutex during hotkey_exit()
Date: Wed, 24 Apr 2024 14:28:11 +0200
Message-ID: <20240424122834.19801-2-hdegoede@redhat.com>
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

hotkey_exit() already takes the mutex around the hotkey_poll_stop_sync()
call, but not around the other calls.

commit 38831eaf7d4c ("platform/x86: thinkpad_acpi: use lockdep
annotations") has added lockdep_assert_held() checks to various hotkey
functions.

These lockdep_assert_held() checks fail causing WARN() backtraces in
dmesg due to missing locking in hotkey_exit(), fix this.

Fixes: 38831eaf7d4c ("platform/x86: thinkpad_acpi: use lockdep annotations")
Tested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
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


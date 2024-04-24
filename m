Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8053C15B14F
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Apr 2024 12:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713961747; cv=none; b=DU/1xu6qUZ5wrZp0Q9NbC5i+tgd6rjo90YJWwYjsuK0c/6M8tJthMDlxtgrmwzt9b+O7xNA1kxBlplRl9L0foo4YRr9jIVdHa6qK5ybgCrZn5Xbgr7lDCztX6PZMcFcCKnFI+ETXgG1ltZ9uGvbz7kOqBdMJpRguuAA9Yv5ACG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713961747; c=relaxed/simple;
	bh=Hujf1T+57Mfu9ruTQ2QvjOQU79DY8ytM4b403DMfGxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XuSNKbcPZGshgV3LYJlAGaFk7ykYAFcYHXJ5UpiLdE90OPiA5BfNzi22KJV04XlkOVEVc/54qKFEXl/DqOU9Kbk89A61HECbmLNXKDF1/OTvpJcyMGQcYypmp3KY1sh4YAz9iYPZQZbdoobgUXfxJIYYdJ5XORyJ9l9y5MliMqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q0DdD9S6; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q0DdD9S6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713961745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OSqdnxz7yQ43p7sPqX9rSv132sOibQ/BR3f9C9zBSg0=;
	b=Q0DdD9S6NrE2PMfiZVnDWx7npzxolxybkWn6QB0c4+dEWhRZoLrc1/se3fYIL2oeq9lWur
	yGkKRCcG602ehA1puRsZF+1nkbmKroOEQ6wJzRax7P/Blf4265cbJiDeTajCBByoANn7CP
	omhL33LylXnPyAy3g7bwIctukymCRyI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-690-IboGCCaaPRK96bMiZwvGSw-1; Wed, 24 Apr 2024 08:29:01 -0400
X-MC-Unique: IboGCCaaPRK96bMiZwvGSw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CFACA811029;
	Wed, 24 Apr 2024 12:29:00 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.195.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AC1F5C01595;
	Wed, 24 Apr 2024 12:28:59 +0000 (UTC)
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
Subject: [PATCH v2 18/24] platform/x86: thinkpad_acpi: Drop KEY_RESERVED special handling
Date: Wed, 24 Apr 2024 14:28:28 +0200
Message-ID: <20240424122834.19801-19-hdegoede@redhat.com>
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

The input core already filters out EV_KEY events for KEY_RESERVED,
remove the check for this in tpacpi_input_send_key() and rely
on the input core filtering instead.

Also change tpacpi_input_send_key() to only report the scancode
once instead of reporting it on both press and release. Together
these 2 changes make tpacpi_input_send_key() behave the same as
sparse_keymap_report_event().

The goal of this patch is to have a separate commit with
the slightly different behavior from sparse_keymap_report_event()
before switching over to using the sparse-keymap helpers.

Tested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 89931bb980be..6a136d124cab 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -2283,19 +2283,17 @@ static bool tpacpi_input_send_key(const u32 hkey, bool *send_acpi_ev)
 	}
 
 	keycode = hotkey_keycode_map[scancode];
-	if (keycode != KEY_RESERVED) {
-		mutex_lock(&tpacpi_inputdev_send_mutex);
 
-		input_event(tpacpi_inputdev, EV_MSC, MSC_SCAN, scancode);
-		input_report_key(tpacpi_inputdev, keycode, 1);
-		input_sync(tpacpi_inputdev);
+	mutex_lock(&tpacpi_inputdev_send_mutex);
 
-		input_event(tpacpi_inputdev, EV_MSC, MSC_SCAN, scancode);
-		input_report_key(tpacpi_inputdev, keycode, 0);
-		input_sync(tpacpi_inputdev);
+	input_event(tpacpi_inputdev, EV_MSC, MSC_SCAN, scancode);
+	input_report_key(tpacpi_inputdev, keycode, 1);
+	input_sync(tpacpi_inputdev);
 
-		mutex_unlock(&tpacpi_inputdev_send_mutex);
-	}
+	input_report_key(tpacpi_inputdev, keycode, 0);
+	input_sync(tpacpi_inputdev);
+
+	mutex_unlock(&tpacpi_inputdev_send_mutex);
 
 	return true;
 }
-- 
2.44.0


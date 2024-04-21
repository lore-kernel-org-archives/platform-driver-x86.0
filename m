Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82EF18E1A
	for <platform-driver-x86@vger.kernel.org>; Sun, 21 Apr 2024 15:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713714341; cv=none; b=r+kOy5Z3RP0cfTsZXB/4vegblIDzdIdpvP6uATLh687hPonyVNuCUS4Rjz28EvqYnxvhn9jlqQ10C/uaZ9bd4RNoPou6PVDx5BG/XRUsKmm/Y2+Jck9N0BK5HeOz6Fjds2xuaEvcC24Q6Xt7n7sbsE5vv8hD9hi4WziVsv25blQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713714341; c=relaxed/simple;
	bh=TkFpx/E+SLpE00CJjAfW/uSe9U45Jf/HZ8EPUMyCABY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RmP9DIKGr0RxoCNi/xZeyEQJk3mWmowK+qbLPRUDCJlklJZu1hOAgMDExnDmrFtaLvZ2j5OgGOcKAbA94kd7t2C24+t1ptyQ7qDmA1eAt9f9l5Ab2Q1Bjmak3+1TUMnZltfUFFSqum4M4UFFl1dhl4cQx+xXro41+ZU5UKgBCpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EWf7zO3t; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EWf7zO3t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713714338;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u89WmVZu4h1RAqubz6Eju1GLAK55/YNjt0KJ98OXdqI=;
	b=EWf7zO3tpPdZrX5Ix5L0X9jL+REevZx5J0b0yaKY5zOzzLgYgf4Gf5YwsB6UOBE5o4Ec4b
	g6/xCINCorEYk7zNxpakylo9kql34Sef3Bb6PlhgC7WlsaWPjraL15wIzHmvSUd2HJcL9A
	YwYI7+8NDyhjoxMOs19MsMHTcAu7tj0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-176-F_Vq_frZPK6AORc1TLUhNA-1; Sun, 21 Apr 2024 11:45:34 -0400
X-MC-Unique: F_Vq_frZPK6AORc1TLUhNA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BEFCE802E4D;
	Sun, 21 Apr 2024 15:45:33 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.66])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A340840357A7;
	Sun, 21 Apr 2024 15:45:32 +0000 (UTC)
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
Subject: [PATCH 05/24] platform/x86: thinkpad_acpi: Use tpacpi_input_send_key() in adaptive kbd code
Date: Sun, 21 Apr 2024 17:45:01 +0200
Message-ID: <20240421154520.37089-6-hdegoede@redhat.com>
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

Use tpacpi_input_send_key() in adaptive_keyboard_hotkey_notify_hotkey()
instead of re-implementing it there.

Note this change will also result in a behavioral change, key presses on
the adaptive keyboard will now also send a EV_MSC event with the scancode,
just like all other hotkey presses already do. This is not a bug but
a feature.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index bb6b880a5b50..126e39367924 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -3670,7 +3670,6 @@ static bool adaptive_keyboard_hotkey_notify_hotkey(unsigned int scancode)
 {
 	int current_mode = 0;
 	int new_mode = 0;
-	int keycode;
 
 	switch (scancode) {
 	case DFR_CHANGE_ROW:
@@ -3711,19 +3710,8 @@ static bool adaptive_keyboard_hotkey_notify_hotkey(unsigned int scancode)
 				scancode);
 			return false;
 		}
-		keycode = hotkey_keycode_map[scancode - FIRST_ADAPTIVE_KEY +
-					     TP_ACPI_HOTKEYSCAN_ADAPTIVE_START];
-		if (keycode != KEY_RESERVED) {
-			mutex_lock(&tpacpi_inputdev_send_mutex);
-
-			input_report_key(tpacpi_inputdev, keycode, 1);
-			input_sync(tpacpi_inputdev);
-
-			input_report_key(tpacpi_inputdev, keycode, 0);
-			input_sync(tpacpi_inputdev);
-
-			mutex_unlock(&tpacpi_inputdev_send_mutex);
-		}
+		tpacpi_input_send_key(scancode - FIRST_ADAPTIVE_KEY +
+				      TP_ACPI_HOTKEYSCAN_ADAPTIVE_START);
 		return true;
 	}
 }
-- 
2.44.0


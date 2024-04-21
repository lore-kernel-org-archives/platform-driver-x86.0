Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77D41A28C
	for <platform-driver-x86@vger.kernel.org>; Sun, 21 Apr 2024 15:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713714357; cv=none; b=dAxWrkQXdFlpBqKsUC3Nb5fY91CvYGKN+9wXH7FD2/XOe4nPw4CTOajfXb5N1Zyl6rzCk7CU+OlPC5FIFYwQUvg4Eo409MCKL5jh971HL8h3dItKJAh0dB/WQ+50Z6pWvAHrDhAyJK0tNRAziLuXHOUZ6/rCLnBj4OXTd5FjRjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713714357; c=relaxed/simple;
	bh=8C0/uFdrfdo1QFddVqoHTfioLEjFZVQN+bhB9kVEL7s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BPXH39Qu8b3AHTcxsksKY9KV4TAV46iPYrFp53F9RNiF8OR2dhw9eb4JAX+JCca9R3KwnFlU8TLnF3gIqPEW8KIT7EgiInxeaEB40QHFi7kA4J7pm9qdNcPM7A2P2MhrqQNLmeTUi9uLA/eAGUUoPp0ulazvNsLZa0BY1p1CJU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GCg0SmPB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GCg0SmPB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713714354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R6QrbtZCHBRTks1Xbnahfy+zyxyziZb4NRLnWdsoqbM=;
	b=GCg0SmPBtJZXLJjgFFq3X0nK1M0skHOBCAFxEwWU4RfGnp6NV7TF2d4tPmS7l1YyRMITi5
	U6s+B9PKNxmD4u0/uPpsqf3l6+xeaFfIh8HQESkprcQYIOihZKJJqNTxR/cBV1lfpZGvXD
	1BLA1Estlj3e3pzSsjibPTxDo42bBtQ=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-102-M3aZLmX3PQKXRNHEPER4bg-1; Sun,
 21 Apr 2024 11:45:51 -0400
X-MC-Unique: M3aZLmX3PQKXRNHEPER4bg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A67693C00098;
	Sun, 21 Apr 2024 15:45:50 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.66])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8C465407F3D4;
	Sun, 21 Apr 2024 15:45:49 +0000 (UTC)
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
Subject: [PATCH 18/24] platform/x86: thinkpad_acpi: Drop KEY_RESERVED special handling
Date: Sun, 21 Apr 2024 17:45:14 +0200
Message-ID: <20240421154520.37089-19-hdegoede@redhat.com>
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

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 5db46220d400..f70f87b216cb 100644
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


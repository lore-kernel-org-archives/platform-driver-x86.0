Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6ED1A291
	for <platform-driver-x86@vger.kernel.org>; Sun, 21 Apr 2024 15:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713714353; cv=none; b=FUgqyg5WYl6HPXC6d5RjNTvwh85zXnTa11HhgcETeigCH97F5gN7jDyH4RUMq+FNEH5ngORRQnxlBmseYLLKMQKiEbWKG4g5/l8p1hA6Bc9GLbxZYqA8Lk2IQ07mdJFP7EDbMC5Me/xilWS6FOuGyoQtnYFoH7wyZOTuxdWGPmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713714353; c=relaxed/simple;
	bh=xW9u38v3xE8rIvZBaKCKV2rsDD6U526TyIO1haSO5VU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BcKOcBIytt+rcXmFoNBovJJWy6POidLQzGv6XC8v0P4lk6+sItJoxHgLOOQulQFUkfYdlMmfdi0DPF13k6A5zEXxfNAqJvfAf2tgSF7mju7+O8jJvvf1ZWvrPu5s5p2vXLNkPR0JFzQbcz3h7DSm5JCmeMPPLoRGp2NRPX+Asp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BWcoqbne; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BWcoqbne"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713714351;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JnjSJbh0o4jsaf81yyRkEYAvrQAXrb/x4V/CWBpqLI0=;
	b=BWcoqbneu37dBzuND96fEc5DPXfGfTkZTH44OfE/ktO8SZLusNnH3I0KYU/CEqtVi9EXyO
	6OGNUjpTHia9DbSkRSPpXTcHzxGzDQ3GrtwsNGmkli2954i700FeFgmen0tKWIShii6tY1
	raEMTsccX2uBc1CUZSW6VfwleVAfIls=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-444-odOOxaiiMc6hHRR_gXLnPA-1; Sun,
 21 Apr 2024 11:45:47 -0400
X-MC-Unique: odOOxaiiMc6hHRR_gXLnPA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BFED71C0515F;
	Sun, 21 Apr 2024 15:45:46 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.66])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A5DCA402482D;
	Sun, 21 Apr 2024 15:45:45 +0000 (UTC)
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
Subject: [PATCH 15/24] platform/x86: thinkpad_acpi: Do not send ACPI netlink events for unknown hotkeys
Date: Sun, 21 Apr 2024 17:45:11 +0200
Message-ID: <20240421154520.37089-16-hdegoede@redhat.com>
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

Do not send ACPI netlink events for unknown hotkeys, to avoid userspace
starting to rely on them. Instead these should be added to the keymap to
send evdev events.

This should not cause a behavior change for existing laptop models since
all currently known 0x1xxx events have a mapping.

In hindsight the ACPI netlink events should have been suppressed for
the adaptive keyboard and extended hotkeys events too. But the kernel has
been sending ACPI netlink events for those for a long time now, so we
cannot just stop sending them without potentially causing issues for
existing users who may depend on these.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index bed66dd54920..ace615752c93 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -2250,7 +2250,7 @@ static void tpacpi_input_send_tabletsw(void)
 	}
 }
 
-static bool tpacpi_input_send_key(const u32 hkey)
+static bool tpacpi_input_send_key(const u32 hkey, bool *send_acpi_ev)
 {
 	unsigned int keycode, scancode;
 
@@ -2271,6 +2271,14 @@ static bool tpacpi_input_send_key(const u32 hkey)
 		scancode = hkey - TP_HKEY_EV_EXTENDED_KEY_START +
 			   TP_ACPI_HOTKEYSCAN_EXTENDED_START;
 	} else {
+		/*
+		 * Do not send ACPI netlink events for unknown hotkeys, to
+		 * avoid userspace starting to rely on them. Instead these
+		 * should be added to the keymap to send evdev events.
+		 */
+		if (send_acpi_ev)
+			*send_acpi_ev = false;
+
 		return false;
 	}
 
@@ -2298,7 +2306,7 @@ static struct tp_acpi_drv_struct ibm_hotkey_acpidriver;
 /* Do NOT call without validating scancode first */
 static void tpacpi_hotkey_send_key(unsigned int scancode)
 {
-	tpacpi_input_send_key(TP_HKEY_EV_ORIG_KEY_START + scancode);
+	tpacpi_input_send_key(TP_HKEY_EV_ORIG_KEY_START + scancode, NULL);
 }
 
 static void hotkey_read_nvram(struct tp_nvram_state *n, const u32 m)
@@ -3733,7 +3741,7 @@ static bool hotkey_notify_hotkey(const u32 hkey, bool *send_acpi_ev)
 			return true;
 	}
 
-	return tpacpi_input_send_key(hkey);
+	return tpacpi_input_send_key(hkey, send_acpi_ev);
 }
 
 /* 0x2000-0x2FFF: Wakeup reason */
-- 
2.44.0


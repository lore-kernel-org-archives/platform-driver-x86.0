Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B2F15AAA2
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Apr 2024 12:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713961744; cv=none; b=oHCMsuwv1FjBgaKX0q607ugpTWl6GbXtLR/HE8NjWFMogDEFgvwLiImn1ufgce9/Ymm+vfIWB3hPAv6hmEo3n9K9mfVzfXpLGAYhH2x/i17wjtdpAT6vphASVKOCiCSbD6Yctr7+dBPQFryeK95fdLfOWYpnADa6vD/F0lQygds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713961744; c=relaxed/simple;
	bh=zdncH5Km9zEoStf+cFErV8TELh0QHC1LK/vb0N8r8y0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p0oXUQAXGP/H0+l4l2RAUBbLH5R1z3MP6v40OSikLbq+z69QjT1NSCoQKUHPOx1Md/p1IPKtqIxNcHOAeoEMQvpLBM46otB7ZZOvbNck/tmSkaxc2InyfJGn652rYOGmuMo6din+vL0tsccAVmiUYqdRPoPAdhedS38HUVM9QJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ENZFMTvf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ENZFMTvf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713961742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dY2gZFfHmlVa/tcflKA7wKkQf3tUyaPElSricq2ysRM=;
	b=ENZFMTvfkvy686aiJabVUs5OuPDX8CNZB0qzFX9wVCaV9n6gNXPw3IRLRrPPrGoIti8O4a
	3+Z/SUIUZyTxBp4IZ16THVn+KR8bfDJ1Os77cFPOfCVtSDTplFLMMD9Enxz3McLyLOvlaH
	zVJq/g3AE2/N/qh6cOUJBh+eVUWlmjs=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-118-a0Tbv2OmMIGRuk8zu6RW-Q-1; Wed,
 24 Apr 2024 08:28:57 -0400
X-MC-Unique: a0Tbv2OmMIGRuk8zu6RW-Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C766329AC01E;
	Wed, 24 Apr 2024 12:28:56 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.195.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9A53CC1A225;
	Wed, 24 Apr 2024 12:28:55 +0000 (UTC)
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
Subject: [PATCH v2 15/24] platform/x86: thinkpad_acpi: Do not send ACPI netlink events for unknown hotkeys
Date: Wed, 24 Apr 2024 14:28:25 +0200
Message-ID: <20240424122834.19801-16-hdegoede@redhat.com>
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

Tested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 9b38770412ab..952bac635a18 100644
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
@@ -3734,7 +3742,7 @@ static bool hotkey_notify_hotkey(const u32 hkey, bool *send_acpi_ev)
 			return true;
 	}
 
-	return tpacpi_input_send_key(hkey);
+	return tpacpi_input_send_key(hkey, send_acpi_ev);
 }
 
 /* 0x2000-0x2FFF: Wakeup reason */
-- 
2.44.0


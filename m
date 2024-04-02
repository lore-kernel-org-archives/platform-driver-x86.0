Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F32D79B87
	for <platform-driver-x86@vger.kernel.org>; Tue,  2 Apr 2024 12:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712061866; cv=none; b=Zqx3nTM28GHQY8/E8VrP5FhyVPb6TMp7FAUUJdvQi6Uc56Gdfa37ackfAgYu2l0L0LTeT9Cdv62+rlob/e0DkBfeYEFuZTezDy6ox9n/t9Bx6eYtlvNZDpFgShYzPlAiWIvBp582mO2c8FQHLW2WQniiquo6+4gPul91EOgmHl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712061866; c=relaxed/simple;
	bh=qfE8PezeJ0JIHZAkNhHbI4tf4fcIGHY7WUbwDGB+e0U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XB9uCc1vQGg9k1WMDT7wy0DIm7i7JNN2LpzC0/XVnHLb6TJQz8okzXjNX4/qSjsEknXvX2it0/AUXYgNYvQLXu9QbPuJSs3FkmK/XL3mdbu60795W7Nk5UGlbkdupdChGxMTCRKUJ5ZoUbPv/ogobckC9jmTNOZfW1TJ1ELyovs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VSkh3ouT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VSkh3ouT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712061863;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DzmCvL3Nsd29+cJ9eQpeaTEVTss6ce5zle9OwCf5pG4=;
	b=VSkh3ouTwHF+8yFbG9RSJIYqyf5htH7NijS07O+GGfq1EF7FsrFWe8fpwqCxPmRGp1pkZC
	ZJixjRFpbaLAIq8zOu7cJ0aV0DebilyzFEGgjQt8qiGZQj2qq9lWtc1ikGCo4azEdpsLcY
	mZsUWFMYBTtZUVarvOeYH0k1CAt0aIU=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-58-Mk9jzuelNuyLwvmKax3rDA-1; Tue,
 02 Apr 2024 08:44:20 -0400
X-MC-Unique: Mk9jzuelNuyLwvmKax3rDA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 396A11C41A03;
	Tue,  2 Apr 2024 12:44:20 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8F4043C85;
	Tue,  2 Apr 2024 12:44:19 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: toshiba_acpi: Silence logging for some events
Date: Tue,  2 Apr 2024 14:43:51 +0200
Message-ID: <20240402124351.167152-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1

Stop logging unknown event / unknown keycode messages on suspend /
resume on a Toshiba Portege Z830:

1. The Toshiba Portege Z830 sends a 0x8e event when the power button
is pressed, ignore this.

2. The Toshiba Portege Z830 sends a 0xe00 hotkey event on resume from
suspend, ignore this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/toshiba_acpi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 2a5a651235fe..16e941449b14 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -270,6 +270,7 @@ static const struct key_entry toshiba_acpi_keymap[] = {
 	{ KE_KEY, 0xb32, { KEY_NEXTSONG } },
 	{ KE_KEY, 0xb33, { KEY_PLAYPAUSE } },
 	{ KE_KEY, 0xb5a, { KEY_MEDIA } },
+	{ KE_IGNORE, 0x0e00, { KEY_RESERVED } }, /* Wake from sleep */
 	{ KE_IGNORE, 0x1430, { KEY_RESERVED } }, /* Wake from sleep */
 	{ KE_IGNORE, 0x1501, { KEY_RESERVED } }, /* Output changed */
 	{ KE_IGNORE, 0x1502, { KEY_RESERVED } }, /* HDMI plugged/unplugged */
@@ -3553,9 +3554,10 @@ static void toshiba_acpi_notify(struct acpi_device *acpi_dev, u32 event)
 					(dev->kbd_mode == SCI_KBD_MODE_ON) ?
 					LED_FULL : LED_OFF);
 		break;
+	case 0x8e: /* Power button pressed */
+		break;
 	case 0x85: /* Unknown */
 	case 0x8d: /* Unknown */
-	case 0x8e: /* Unknown */
 	case 0x94: /* Unknown */
 	case 0x95: /* Unknown */
 	default:
-- 
2.44.0


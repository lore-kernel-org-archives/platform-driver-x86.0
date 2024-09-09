Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3661B3B30
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Sep 2024 11:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725881564; cv=none; b=FCRpbCgFvN5JPE1YiUZLHHI/dfqqiEt558ZXBP/NZlxvFPIEGyFhYuKZoBCCr7Jv7Wx1EvGlGJeJSsSJtI5qoHusJNDhLb1fM2JfGDtmrbpR7Xf2MSVV7TSX5A2iMx8+m0P9do6gGiRPeJOwzkvWPeVnetzxBsUkMsW7+ZjBpQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725881564; c=relaxed/simple;
	bh=j9Yb3Bkd6za1B2DJQv4ZGZWnfTSLHwc6fGFJsvnK6mo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Elv0/lyqj/ZORO9XPa4IcwGtlZI1J70OWdN+WIJpUzjyZIOXQutbqjn9oS/0eRg/AYXh3SUFIj4Hd+8F9+EiTpA5Ncqgs1ONSI7m3EAzq88+JRCIgsFTK7Xwuo+3V0HYbfbIig/XTCKnQoPfyO09Az9nfIzjd6qW+QXpfRCiVaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CnwGpAeX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CnwGpAeX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725881561;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VQ71HYer0fhlrrk5Xwt4Z6H/I85PPpkVm7V85vm6yrs=;
	b=CnwGpAeXARzyftnx/DYb4DbZSWY8emLffUj6TZnG1+EVdCMO26F7UINHPcTaoANBp8BGTS
	1GQx9pXzY1vGCMyXNamQF0FwyVo79xSjzkP2bmQ0xRGoGFFg4P2VaTSbhBTuQ3k1S5/gzT
	k7AHGAgCTKBJ0kaxSrPgoNtaove0vBw=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-25-IuI6uYZkNdWZ7QYlgbf9Zw-1; Mon,
 09 Sep 2024 07:32:40 -0400
X-MC-Unique: IuI6uYZkNdWZ7QYlgbf9Zw-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B4D9219560BD;
	Mon,  9 Sep 2024 11:32:38 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.168])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4825719560AA;
	Mon,  9 Sep 2024 11:32:36 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	James Harmison <jharmison@redhat.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 3/3] platform/x86: panasonic-laptop: Add support for programmable buttons
Date: Mon,  9 Sep 2024 13:32:27 +0200
Message-ID: <20240909113227.254470-3-hdegoede@redhat.com>
In-Reply-To: <20240909113227.254470-1-hdegoede@redhat.com>
References: <20240909113227.254470-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

From: James Harmison <jharmison@redhat.com>

The value returned by "HINF" contains press/release information
in bit 7 and a keycode in bits 0-6.

Change the code to retrieve the keycode to use all 7 keycode bits instead
of only using bits 0-3 and add mappings for the higher keycodes used by
the programmable buttons found on newer panasonic toughbook models.

Tested-by: James Harmison <jharmison@redhat.com>
Signed-off-by: James Harmison <jharmison@redhat.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Add changing the mask to get the keycode to the commit message
- Use GENMASK() and BIT() to get the keycode / press info
---
 drivers/platform/x86/panasonic-laptop.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform/x86/panasonic-laptop.c
index ebd81846e2d5..2bf94d0ab324 100644
--- a/drivers/platform/x86/panasonic-laptop.c
+++ b/drivers/platform/x86/panasonic-laptop.c
@@ -121,6 +121,7 @@
 
 #include <linux/acpi.h>
 #include <linux/backlight.h>
+#include <linux/bits.h>
 #include <linux/ctype.h>
 #include <linux/i8042.h>
 #include <linux/init.h>
@@ -224,6 +225,17 @@ static const struct key_entry panasonic_keymap[] = {
 	{ KE_KEY, 8, { KEY_PROG1 } }, /* Change CPU boost */
 	{ KE_KEY, 9, { KEY_BATTERY } },
 	{ KE_KEY, 10, { KEY_SUSPEND } },
+	{ KE_KEY, 21, { KEY_MACRO1 } },
+	{ KE_KEY, 22, { KEY_MACRO2 } },
+	{ KE_KEY, 24, { KEY_MACRO3 } },
+	{ KE_KEY, 25, { KEY_MACRO4 } },
+	{ KE_KEY, 34, { KEY_MACRO5 } },
+	{ KE_KEY, 35, { KEY_MACRO6 } },
+	{ KE_KEY, 36, { KEY_MACRO7 } },
+	{ KE_KEY, 37, { KEY_MACRO8 } },
+	{ KE_KEY, 41, { KEY_MACRO9 } },
+	{ KE_KEY, 42, { KEY_MACRO10 } },
+	{ KE_KEY, 43, { KEY_MACRO11 } },
 	{ KE_END, 0 }
 };
 
@@ -830,8 +842,8 @@ static void acpi_pcc_generate_keyinput(struct pcc_acpi *pcc)
 		return;
 	}
 
-	key = result & 0xf;
-	updown = result & 0x80; /* 0x80 == key down; 0x00 = key up */
+	key = result & GENMASK(6, 0);
+	updown = result & BIT(7); /* 0x80 == key down; 0x00 = key up */
 
 	/* hack: some firmware sends no key down for sleep / hibernate */
 	if (key == 7 || key == 10) {
-- 
2.46.0


Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD38715B12E
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Apr 2024 12:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713961746; cv=none; b=nQUmf7wCetoo5k2Ezlv/P16KUdJJNz+z/WOfyb5LHul2P2UhlMycgBiPEGbHTccyUsMVdQO4bsd6MstVQRM4jcXxuaceGuyIt9Kg8z5NgDBEmN0kWSMt/Csp32Q0UQqhLAC7MN3K6SkfpV+nk5Eb4q3SEvFr6mF4PEKWpaySqAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713961746; c=relaxed/simple;
	bh=XYxPU0e7IFUzudmzHaMZkmIf9oh2yo7tpTCAHBEARR4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r3rX+2aRq5+opYwOaR/k+40PnqVIvBuU6cw5micNKVB7FsIsbgQ9btrYoHd58A6VQzEOGlO7I6QhjzTGZ2xVbdFltFd7JuRc1OhQtui6HVMgmRLbWcKRDkc35QxI51tq+1CbmXASvLnLSxxXc3oTvTzIF9SFb/4+2rgpgz/KjZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Jq4YaQg4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Jq4YaQg4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713961744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r4y8mBLvF2B3Lj9tuHBd0FLdcMnBPN6u7k5p3xVqxXA=;
	b=Jq4YaQg4Xr9OmVGsvfrToy/3glpsWZ8H2I6ttMosT9f+9u2be1G5xoEbgqZ79n/EFCFVOy
	wjC2hP9XJf2IN2e62FDPAwXImHOncvrf+PEtygOQZR25ZsfvWVlws5tpiSzqriM4WYB2fC
	O+XoAt/ac0m9kAMf9S3mZugcwP8isTw=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-612-pzh4lwsUMESSvdoG0dfHqw-1; Wed,
 24 Apr 2024 08:28:58 -0400
X-MC-Unique: pzh4lwsUMESSvdoG0dfHqw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 290C329AC016;
	Wed, 24 Apr 2024 12:28:58 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.195.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 022EEC15771;
	Wed, 24 Apr 2024 12:28:56 +0000 (UTC)
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
Subject: [PATCH v2 16/24] platform/x86: thinkpad_acpi: Change hotkey_reserved_mask initialization
Date: Wed, 24 Apr 2024 14:28:26 +0200
Message-ID: <20240424122834.19801-17-hdegoede@redhat.com>
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

Change the hotkey_reserved_mask initialization to hardcode the list
of reserved keys. There are only a few reserved keys and the code to
iterate over the keymap will be removed when moving to sparse-keymaps.

Tested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 952bac635a18..cf5c741d1343 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -3545,6 +3545,19 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 	dbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_HKEY,
 		   "using keymap number %lu\n", keymap_id);
 
+	/* Keys which should be reserved on both IBM and Lenovo models */
+	hotkey_reserved_mask = TP_ACPI_HKEY_KBD_LIGHT_MASK |
+			       TP_ACPI_HKEY_VOLUP_MASK |
+			       TP_ACPI_HKEY_VOLDWN_MASK |
+			       TP_ACPI_HKEY_MUTE_MASK;
+	/*
+	 * Reserve brightness up/down unconditionally on IBM models, on Lenovo
+	 * models these are disabled based on acpi_video_get_backlight_type().
+	 */
+	if (keymap_id == TPACPI_KEYMAP_IBM_GENERIC)
+		hotkey_reserved_mask |= TP_ACPI_HKEY_BRGHTUP_MASK |
+					TP_ACPI_HKEY_BRGHTDWN_MASK;
+
 	hotkey_keycode_map = kmemdup(&tpacpi_keymaps[keymap_id],
 			TPACPI_HOTKEY_MAP_SIZE,	GFP_KERNEL);
 	if (!hotkey_keycode_map) {
@@ -3560,9 +3573,6 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 		if (hotkey_keycode_map[i] != KEY_RESERVED) {
 			input_set_capability(tpacpi_inputdev, EV_KEY,
 						hotkey_keycode_map[i]);
-		} else {
-			if (i < sizeof(hotkey_reserved_mask)*8)
-				hotkey_reserved_mask |= 1 << i;
 		}
 	}
 
@@ -3587,9 +3597,8 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 		/* Disable brightness up/down on Lenovo thinkpads when
 		 * ACPI is handling them, otherwise it is plain impossible
 		 * for userspace to do something even remotely sane */
-		hotkey_reserved_mask |=
-			(1 << TP_ACPI_HOTKEYSCAN_FNHOME)
-			| (1 << TP_ACPI_HOTKEYSCAN_FNEND);
+		hotkey_reserved_mask |= TP_ACPI_HKEY_BRGHTUP_MASK |
+					TP_ACPI_HKEY_BRGHTDWN_MASK;
 		hotkey_unmap(TP_ACPI_HOTKEYSCAN_FNHOME);
 		hotkey_unmap(TP_ACPI_HOTKEYSCAN_FNEND);
 	}
-- 
2.44.0


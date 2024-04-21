Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A091B5B1
	for <platform-driver-x86@vger.kernel.org>; Sun, 21 Apr 2024 15:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713714358; cv=none; b=qFijggTMi20iY5qLzT6OdJR4Ochxvaxb2C4WMG/dIJ2KMPKjv5HhF7F97QThilc/iXsBy7rEbLoeFcZO34bw1ud5EAVBWA5qiUemvs8jzU+GLMsOJbl//hTuvIbcorVcGyiqQc55XDgaUg6IWgAAPKclsJ4IwrhlYT0NhprzJeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713714358; c=relaxed/simple;
	bh=TbT+L44GuIdHBouGGtSCReysnxAwvX6rRc1stQsm9Dk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cgzzBSY4hMdA1FUwaiv1mQdRSS2dR35gerFBPD89iRQiUYT20EU8unIS3QZpYzhxibKJTT9SA3nRYJ2LLqUZfyXIj0iKvRz1pMD4mYAAjkNAWKXKCx2alVza8o7ETOi6ocIOhDILNixpVSzBdYJ4q4yykabVo4D/231U7u+o5Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SKcxL0G2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SKcxL0G2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713714356;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vvdv18IJGOuumFikPskbXJYsileD8TWgYyzZkZDzd08=;
	b=SKcxL0G2T+0x4XaL0KdJGyIMtLtZX5PTrSmb5x0JfCCxD63yNvgRiBOdhXZO551gtoXFB3
	+C2C7kixqAyHdy6Et8jSTSW7My6fEHjYRdshsWk95EmA9gJNFarMwfLFM7FTcHoM8x9Wz5
	ho+6yzzYP7y8e7FRupRQ19aS4XrzucM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-269-3Ig_eV2VOv6zmer-9rB3Yw-1; Sun, 21 Apr 2024 11:45:53 -0400
X-MC-Unique: 3Ig_eV2VOv6zmer-9rB3Yw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5F7A0802E4D;
	Sun, 21 Apr 2024 15:45:53 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.66])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 44718402482D;
	Sun, 21 Apr 2024 15:45:52 +0000 (UTC)
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
Subject: [PATCH 20/24] platform/x86: thinkpad_acpi: Add mappings for adaptive kbd clipping-tool and cloud keys
Date: Sun, 21 Apr 2024 17:45:16 +0200
Message-ID: <20240421154520.37089-21-hdegoede@redhat.com>
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

The X1 carbon 2014 / 2nd gen's adaptive keyboard top row's "Home" mode,
which is 1 of the 2 modes Linux supports, has clipping-tool and cloud
buttons which so far are not mapped.

I assume these were left as KEY_RESERVED because no suitable KEY_FOO codes
were available when support was added.

In the mean time we have gotten KEY_SELECTIVE_SCREENSHOT and this has been
used for the clipping-tool function under Fn + PrtSc on more traditional
ThinkPad keyboards already.

Finding a KEY_FOO code for the cloud key is harder looking at the symbol
it seems to refer to cloud-storage which made me think of file syncing,
or file transfer which has let me to pick KEY_XFER for this.

Note this is based on looking at a picture of the adaptive top row
in Home mode and has not been tested on an actual adaptive keyboard.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 5e34f70c21a4..fc60857b39ec 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -3231,8 +3231,8 @@ static const struct key_entry keymap_lenovo[] __initconst = {
 	/* Adaptive keyboard mappings for Carbon X1 2014 translated scancodes 0x20 - 0x33 */
 	{ KE_KEY, TP_ACPI_HOTKEYSCAN_MUTE2, { KEY_RESERVED } },
 	{ KE_KEY, TP_ACPI_HOTKEYSCAN_BRIGHTNESS_ZERO, { KEY_BRIGHTNESS_MIN } },
-	{ KE_KEY, TP_ACPI_HOTKEYSCAN_CLIPPING_TOOL, { KEY_RESERVED } },
-	{ KE_KEY, TP_ACPI_HOTKEYSCAN_CLOUD, { KEY_RESERVED } },
+	{ KE_KEY, TP_ACPI_HOTKEYSCAN_CLIPPING_TOOL, { KEY_SELECTIVE_SCREENSHOT } },
+	{ KE_KEY, TP_ACPI_HOTKEYSCAN_CLOUD, { KEY_XFER } },
 	{ KE_KEY, TP_ACPI_HOTKEYSCAN_UNK9, { KEY_RESERVED } },
 	{ KE_KEY, TP_ACPI_HOTKEYSCAN_VOICE, { KEY_VOICECOMMAND } },
 	{ KE_KEY, TP_ACPI_HOTKEYSCAN_UNK10, { KEY_RESERVED } },
-- 
2.44.0


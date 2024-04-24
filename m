Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7284E15B14F
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Apr 2024 12:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713961749; cv=none; b=PQBZF0/5reFJd6VkfMTlFqTpgA2xcVi0ce8rX6gnQKKM2ZEbCHDsL7hnu3/gAFy4vTtzWxc30ak6dsEuz3NaePtIL+tvixtvUNxrIYnSkwUjAR9ak9IV3pnpOG5Ty4KHi/lfdtRRA6LVJid9Td9t5ISxnGmFRtmHyW2vynZXDdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713961749; c=relaxed/simple;
	bh=e8zM4KRuOOIii4pa/hYPtlH4KmYNPpOrZ71athcOQF4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UMe01Dqz4AlZwwk7nm57qqp81e70yeNFvSGJ1gs1di6XfAHIYg1l8zR8NZRPtfUCDn7/lM92zSztlq7jf9UBI2gRamFLh/yKBogjHYvk4L8GWCuNIGws87oU01DtPjxfhSE9OwzY0QvsM6QAmg8iNk3fNj3RQIUjlrtobKzk6A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RuT6XllO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RuT6XllO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713961747;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=siYZsqknV5oaJbisuTMcBjL55sHZciVQiQTii0iwrMQ=;
	b=RuT6XllOSFVnbtsUk7m5vxIPoA70Is710fLAi4KITI4ReB9iWaJB5AI5JV5Wz8zJnoXAsC
	F14HM4y3IHpzCNFDOQL3aGYYM0alZ5Af/3iXmv6IzgAi+kc0fzyPES539/f+W5jxRnaLSV
	kYB0TOKt+7gV4TGVnaJAxvllE97Wk4c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-444-0iLcTKMXOjWWF2Fbqpx9RA-1; Wed, 24 Apr 2024 08:29:04 -0400
X-MC-Unique: 0iLcTKMXOjWWF2Fbqpx9RA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8EFB1811029;
	Wed, 24 Apr 2024 12:29:03 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.195.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 69ABCC13FA5;
	Wed, 24 Apr 2024 12:29:02 +0000 (UTC)
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
Subject: [PATCH v2 20/24] platform/x86: thinkpad_acpi: Add mappings for adaptive kbd clipping-tool and cloud keys
Date: Wed, 24 Apr 2024 14:28:30 +0200
Message-ID: <20240424122834.19801-21-hdegoede@redhat.com>
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

Tested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 8af9406f2a13..469ff6a39d18 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -3234,8 +3234,8 @@ static const struct key_entry keymap_lenovo[] __initconst = {
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


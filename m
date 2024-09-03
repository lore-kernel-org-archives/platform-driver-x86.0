Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB662101B6
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Sep 2024 08:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725352552; cv=none; b=ul9M5UrEFmV3z0ddgOsBqrQZvvKeBn447KPS0xo6GM7jteuOOpKJ3+GBr/drjwjYgiQVhd8WKyZVrIqHJQqtfX0WWjmDCNZLiA1NK94O4OqT25JZnbWizqljVRYUHfQKUbHBhbDDQWgNutD3F1h69P9GCy53pogJefgwXYzJRpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725352552; c=relaxed/simple;
	bh=BTmfV+dbk20wxIoisLxlFz0NSY9nvNlUKOx9t2uCNm8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rnqXnsvc+lYHk9y/uaMDBS54SXi8igTB2zzAa0N3AZXROSsHOS3IbesOTihUwf/vTAJ/G6IvUOIzeCbmptprHUeA+zT9WeT2SLAFE4hbvEnKuNOQyeH8/Aqld3fqGOXgjDIk97ikojRhY0rt7Z84cWxbHLuOGw8xT2wWdMPyuz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GuRJX8kf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GuRJX8kf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725352550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=diPdWsAXoVHRe4pdgH8lVXAuNaKBDPC6yKVNGzO0C3U=;
	b=GuRJX8kf+T/wFZVebIWgauh+GlyCq1lioZbLD5aM7cvvzx67yt08MCOVYOi/pudhN5B9N1
	mp1BuhWQbPq8JBzS78ujmikPEIedrmeYtfHgcVhX5M9gj4QTzWbx53u8WJ3NdNMp7Zlk56
	FKJnsk8REsAxSGF21AipaSF3zv0x0fg=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-459-06qTNzUmNYKJCQ8oT5OZvw-1; Tue,
 03 Sep 2024 04:35:47 -0400
X-MC-Unique: 06qTNzUmNYKJCQ8oT5OZvw-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 17C801955BF2;
	Tue,  3 Sep 2024 08:35:46 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.239])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5FFF01956048;
	Tue,  3 Sep 2024 08:35:44 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	James Harmison <jharmison@redhat.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 3/3] platform/x86: panasonic-laptop: Add support for programmable buttons
Date: Tue,  3 Sep 2024 10:35:33 +0200
Message-ID: <20240903083533.9403-3-hdegoede@redhat.com>
In-Reply-To: <20240903083533.9403-1-hdegoede@redhat.com>
References: <20240903083533.9403-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

From: James Harmison <jharmison@redhat.com>

Newer panasonic toughbook models have a number of programmable buttons,
add support for these.

Tested-by: James Harmison <jharmison@redhat.com>
Signed-off-by: James Harmison <jharmison@redhat.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/panasonic-laptop.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform/x86/panasonic-laptop.c
index 4c9e20e1afe8..2070caa1ea1b 100644
--- a/drivers/platform/x86/panasonic-laptop.c
+++ b/drivers/platform/x86/panasonic-laptop.c
@@ -224,6 +224,17 @@ static const struct key_entry panasonic_keymap[] = {
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
 
@@ -811,7 +822,7 @@ static void acpi_pcc_generate_keyinput(struct pcc_acpi *pcc)
 		return;
 	}
 
-	key = result & 0xf;
+	key = result & 0x7f;
 	updown = result & 0x80; /* 0x80 == key down; 0x00 = key up */
 
 	/* hack: some firmware sends no key down for sleep / hibernate */
-- 
2.46.0


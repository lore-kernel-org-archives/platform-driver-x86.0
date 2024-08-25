Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303231E492
	for <platform-driver-x86@vger.kernel.org>; Sun, 25 Aug 2024 13:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724592271; cv=none; b=m4BwFnRSmnVGwmYa6IK6DR6gr+kZOqeO+VuuiXGFXEj68udjonaQhal9nuUjcIG1O0cHzGs5MWvtg6UBIDxCazA1rkyl47oOYdqSKVZ77NUVajlkyMRW+wwxhEeK64CIBCTnmdrb0t7Qg6uyZJZY/H6gtGI7E57liw4b/7HA9yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724592271; c=relaxed/simple;
	bh=XdqKFwgvLELrO+mx3bKIOiJQe5ma+Zs9Qc+lYiLlmqg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kcpVWgmX8ar/aR03eT9pL1CdeP0t9cIVeram4QaIPnkNkqm2tMfpxyDt++3A7sGFiF9EhhMB8Bm4YRflaoVA1kZTOUvGiPN7UYvUQgP1cN7g3XGiwF9Kksd7+6jIpDmp5PKWHABzE2H2yfgY5GIc6mYymibMNaR23Y4hi6LfceM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WE9sLkXJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WE9sLkXJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724592269;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vhk4gXHCvZRTu2tIPFZGv0rg5ce2zN8CBWqiUFO3Nkg=;
	b=WE9sLkXJnOQP1u3tWLnI0081GWVHU194jUbWckMtZOQ/Dpxpbunl3YT0ByixHJxrs1tE5C
	wXaW7R1lC30KoHoaq9fH2iGV7/5PSB8sjPTi8qGza3waGBu0SE5dJHMzagEHWxYwoIltPf
	CsDBfewj5yZGD9NItDam8CT/cNwqhOs=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-170-GaCpSo7ZNviFZIiuKVxSqA-1; Sun,
 25 Aug 2024 09:24:27 -0400
X-MC-Unique: GaCpSo7ZNviFZIiuKVxSqA-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 858C719560AB;
	Sun, 25 Aug 2024 13:24:26 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.45])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0816B300019C;
	Sun, 25 Aug 2024 13:24:24 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: x86-android-tablets: Make Lenovo Yoga Tab 3 X90F DMI match less strict
Date: Sun, 25 Aug 2024 15:24:15 +0200
Message-ID: <20240825132415.8307-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

There are 2G and 4G RAM versions of the Lenovo Yoga Tab 3 X90F and it
turns out that the 2G version has a DMI product name of
"CHERRYVIEW D1 PLATFORM" where as the 4G version has
"CHERRYVIEW C0 PLATFORM". The sys-vendor + product-version check are
unique enough that the product-name check is not necessary.

Drop the product-name check so that the existing DMI match for the 4G
RAM version also matches the 2G RAM version.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/x86-android-tablets/dmi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/platform/x86/x86-android-tablets/dmi.c b/drivers/platform/x86/x86-android-tablets/dmi.c
index 141a2d25e83b..387dd092c4dd 100644
--- a/drivers/platform/x86/x86-android-tablets/dmi.c
+++ b/drivers/platform/x86/x86-android-tablets/dmi.c
@@ -140,7 +140,6 @@ const struct dmi_system_id x86_android_tablet_ids[] __initconst = {
 		/* Lenovo Yoga Tab 3 Pro YT3-X90F */
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "CHERRYVIEW D1 PLATFORM"),
 			DMI_MATCH(DMI_PRODUCT_VERSION, "Blade3-10A-001"),
 		},
 		.driver_data = (void *)&lenovo_yt3_info,
-- 
2.46.0


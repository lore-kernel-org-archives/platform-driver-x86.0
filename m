Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5F812FF60
	for <platform-driver-x86@vger.kernel.org>; Fri, 16 Feb 2024 20:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708114662; cv=none; b=aGeWxiSJ4yq/U4pXyn4WU0cJxuasky8aFye8v4gGmsXRXxyHcX6EVRB2KLTdDjXymyjQ7yObySMe2YQo2tsUGrUzy+1xe9bbxJ83jpLI9/JmP6ujc/vEP7vGer/3ZRA2qDXdnSGUMK7z5/TPCZ2ZAM08oC78HCdGZcz2j98K0x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708114662; c=relaxed/simple;
	bh=+aUnygeZ/eORD1KANbO9PL6QOyV0GPLty8QpBjy5HKg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PPF8dIxU5etiuzIH9xZvfFBWEPbZ95ih/VzqmqbfFwoqsww7DwyiMSLZx1kow+dc5z7bsXOxL5bbjoA8uh4ybklN5mNYC54Sr6awvb3f4bQWubldwkV2Sx+xvkAkUc/8j1UrTSmIgdOG+uMKmHXoyCIsyNsyOugTHpJQI5kEgPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ukwhl8D2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ukwhl8D2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708114659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GuZuMAiuz11oJlkC6XU6Ap7u9oBaJLgrcvYCfd9k0wo=;
	b=Ukwhl8D2co7f9MacJT9XbEDcDH0TpjYJWS7B1ED0Pi2/HcUW6gvShfguc70UGJmC6QS4dR
	rcDr7HTIf4ez5qtP3xWfnnw2hgFRmOBLbFedsY/u5/u0UvsuHVxOsj4pnwljvAqJl9k/Bz
	ETpy2mqzIuFiZzRVt2644z51PUUwhlA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-581-ei4LcZETMOiFdCSSzY4htw-1; Fri, 16 Feb 2024 15:17:34 -0500
X-MC-Unique: ei4LcZETMOiFdCSSzY4htw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 17AA483B7EB;
	Fri, 16 Feb 2024 20:17:34 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.87])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6E34B2166B4F;
	Fri, 16 Feb 2024 20:17:33 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 4/4] platform/x86: x86-android-tablets: Fix acer_b1_750_goodix_gpios name
Date: Fri, 16 Feb 2024 21:17:21 +0100
Message-ID: <20240216201721.239791-5-hdegoede@redhat.com>
In-Reply-To: <20240216201721.239791-1-hdegoede@redhat.com>
References: <20240216201721.239791-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6

The Acer B1 750 tablet used a Novatek NVT-ts touchscreen,
not a Goodix touchscreen.

Rename acer_b1_750_goodix_gpios to acer_b1_750_nvt_ts_gpios
to correctly reflect this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/x86-android-tablets/other.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets/other.c b/drivers/platform/x86/x86-android-tablets/other.c
index bc6bbf7ec6ea..278402dcb808 100644
--- a/drivers/platform/x86/x86-android-tablets/other.c
+++ b/drivers/platform/x86/x86-android-tablets/other.c
@@ -68,7 +68,7 @@ static const struct x86_i2c_client_info acer_b1_750_i2c_clients[] __initconst =
 	},
 };
 
-static struct gpiod_lookup_table acer_b1_750_goodix_gpios = {
+static struct gpiod_lookup_table acer_b1_750_nvt_ts_gpios = {
 	.dev_id = "i2c-NVT-ts",
 	.table = {
 		GPIO_LOOKUP("INT33FC:01", 26, "reset", GPIO_ACTIVE_LOW),
@@ -77,7 +77,7 @@ static struct gpiod_lookup_table acer_b1_750_goodix_gpios = {
 };
 
 static struct gpiod_lookup_table * const acer_b1_750_gpios[] = {
-	&acer_b1_750_goodix_gpios,
+	&acer_b1_750_nvt_ts_gpios,
 	&int3496_reference_gpios,
 	NULL
 };
-- 
2.43.0


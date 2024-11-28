Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C391BBBC4
	for <platform-driver-x86@vger.kernel.org>; Thu, 28 Nov 2024 15:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732808544; cv=none; b=Y69dA1k63HaIVsjPRuDvFrZpFpibLktyIpVL2wTvuhhrSAtcefMnn95IWGfewwDMBqgB4y+DoZZfAxmHspfTllkJaE2e4+0aRmTZH8ic4lnyvz0ZgzgbrTd1FVpFm7AhfLl2C5+9r2RQbRe5NLnXpbXx+6WctEZfcWjQDK3G5lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732808544; c=relaxed/simple;
	bh=wgNqM+Kn/wiUr0nJBp6KaGMRX11zLJJ0RHzh9P7q2UY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VblDUgycNHdCZR/xm55eptPgUfcfLoUTubzN91l4psTFkk2vq5dL+UlmruBVAmOXqqpdrGixX+9zk+62J6VEHveNKTjFHpH4Y1Q5si1vJo5uJD3Bw8K2gM+51hOIBOnzxnM3FvaNyq54U5Zjdkkq3iWVMXPourdewb5l5zrTXwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZbJ7cmDV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZbJ7cmDV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732808541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=abPdtoj+mXJDoghrBr0nCAfl6WZxElb00nmLj90LDyA=;
	b=ZbJ7cmDVqEY4NkAbmsxK8vBp8zEdRWl/nzEPpOQ0N5zRdicRoocemlsQWQzX7i8EHh/LM4
	/Um5kBHwN4B+b3HY2bSgpdTyhi9MFO/OAjDQj1kBblqIkyL63xcm3ab+QTBrC5joDmloW8
	exNKi1zBwrGiDdj9XFHbT/5QSJFJUws=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-550-jQ68UsatOuCym-QQyj6kJg-1; Thu,
 28 Nov 2024 10:42:19 -0500
X-MC-Unique: jQ68UsatOuCym-QQyj6kJg-1
X-Mimecast-MFC-AGG-ID: jQ68UsatOuCym-QQyj6kJg
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BD2A61955D58;
	Thu, 28 Nov 2024 15:42:18 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.193.119])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 13E4C195605A;
	Thu, 28 Nov 2024 15:42:16 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 2/4] platform/x86: int3472: Drop "pin number mismatch" messages
Date: Thu, 28 Nov 2024 16:42:10 +0100
Message-ID: <20241128154212.6216-2-hdegoede@redhat.com>
In-Reply-To: <20241128154212.6216-1-hdegoede@redhat.com>
References: <20241128154212.6216-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

It seems that Windows is only using the ACPI GPIO resources and never
looks at the part of the _DSM return value which encodes the pin number.

For example on a Terra Pad 1262 v2 the following messages are printend:

int3472-discrete INT3472:01: reset \_SB.GPI0 pin number mismatch _DSM 103 resource 359
int3472-discrete INT3472:01: powerdown \_SB.GPI0 pin number mismatch _DSM 207 resource 335
int3472-discrete INT3472:02: reset \_SB.GPI0 pin number mismatch _DSM 101 resource 357

Notice for the 2 reset pins that the _DSM value is off by 256, this is
caused by there only being 8 bits reserved in the _DSM return value for
the pin-number.

As for the powerdown pin, testing has shown that the pin-number 335 from
the ACPI GPIO resource is correct and the _DSM value is bogus.

Drop the warning about these mismatches since Windows clearly is just
ignoring the _DSM pin-number so invalid values are too be expected there.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel/int3472/discrete.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index 15678508ee50..01da18b426ae 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -189,9 +189,9 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 {
 	struct int3472_discrete_device *int3472 = data;
 	struct acpi_resource_gpio *agpio;
-	u8 active_value, pin, type;
 	union acpi_object *obj;
 	struct gpio_desc *gpio;
+	u8 active_value, type;
 	const char *err_msg;
 	const char *func;
 	u32 polarity;
@@ -219,12 +219,6 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 
 	int3472_get_func_and_polarity(type, &func, &polarity);
 
-	pin = FIELD_GET(INT3472_GPIO_DSM_PIN, obj->integer.value);
-	if (pin != agpio->pin_table[0])
-		dev_warn(int3472->dev, "%s %s pin number mismatch _DSM %d resource %d\n",
-			 func, agpio->resource_source.string_ptr, pin,
-			 agpio->pin_table[0]);
-
 	active_value = FIELD_GET(INT3472_GPIO_DSM_SENSOR_ON_VAL, obj->integer.value);
 	if (!active_value)
 		polarity ^= GPIO_ACTIVE_LOW;
-- 
2.47.0


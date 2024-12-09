Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C300019CC34
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Dec 2024 22:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733781935; cv=none; b=LuBYQnEWrH5scw9glprtTQUZfExnMG2AmarAgKNZwYZg3rH3hguUmWBiIKbmH9DYLBSI6D3KlRik2hfzvVcezhvL5YVUd5QVf2YkSIQVxKiNcjNd9XaXKj9LqcoweDyGOpeejKdGn7kR8JWZ01Tkszn2LFBYP+3sScV9N9PAeAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733781935; c=relaxed/simple;
	bh=5t7gmCARs05F6X//SHIKGMg+44sahrNtKrK1mIRX6Qo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NZBqSUUF8dJxkoahvDl8b7Cbw6NR55SZaFYYU4hyjTIlQIGJPNqVgPdmAY1pih1+NEgQDW40BAQTWiQw46fudd7VwpPdvP7gdBusHTKOM9IZwaWN/2HMnje77dZfbVrOB0rj6MdkLPoNz+J86rGrEHGdbzKpko9Y9tgw/b6NAGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PehcGvcQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PehcGvcQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733781932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UocOw5NfV55u+cpvqWoVncO5O88QKHEI2mBMIavnmhc=;
	b=PehcGvcQXeySeZz4FBLsRWmBJm2ba8I3bUyZRSxcATYptN3y94oLOB3tKru1glpoJGTbIY
	ligCSx5JPZBE9+xXE8+sda6c3jouOaRLFCNK1BanfOxLfDvZex5KMrkYs0MkkvdFAX0xY3
	ihEW4+IEP7W8dnwZS0XDgIAxUCSG5Fw=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-136-ED0WCReqPi-uhdmxYfhE4A-1; Mon,
 09 Dec 2024 17:05:28 -0500
X-MC-Unique: ED0WCReqPi-uhdmxYfhE4A-1
X-Mimecast-MFC-AGG-ID: ED0WCReqPi-uhdmxYfhE4A
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1B8261955F40;
	Mon,  9 Dec 2024 22:05:27 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.3])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C2F4419560A2;
	Mon,  9 Dec 2024 22:05:25 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 2/4] platform/x86: int3472: Make "pin number mismatch" message a debug message
Date: Mon,  9 Dec 2024 23:05:20 +0100
Message-ID: <20241209220522.25288-2-hdegoede@redhat.com>
In-Reply-To: <20241209220522.25288-1-hdegoede@redhat.com>
References: <20241209220522.25288-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

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

Lower the warning about these mismatches to a debug message and only
look at the lower 8 bits of the GPIO resource pin numbers.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Lower message to debug level instead of dropping it
---
 drivers/platform/x86/intel/int3472/discrete.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index 09fff213b091..6e2b81da2d68 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -220,10 +220,10 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 	int3472_get_func_and_polarity(type, &func, &polarity);
 
 	pin = FIELD_GET(INT3472_GPIO_DSM_PIN, obj->integer.value);
-	if (pin != agpio->pin_table[0])
-		dev_warn(int3472->dev, "%s %s pin number mismatch _DSM %d resource %d\n",
-			 func, agpio->resource_source.string_ptr, pin,
-			 agpio->pin_table[0]);
+	/* Pin field is not really used under Windows and wraps around at 8 bits */
+	if (pin != (agpio->pin_table[0] & 0xff))
+		dev_dbg(int3472->dev, FW_BUG "%s %s pin number mismatch _DSM %d resource %d\n",
+			func, agpio->resource_source.string_ptr, pin, agpio->pin_table[0]);
 
 	active_value = FIELD_GET(INT3472_GPIO_DSM_SENSOR_ON_VAL, obj->integer.value);
 	if (!active_value)
-- 
2.47.1


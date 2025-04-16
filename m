Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E989386334
	for <platform-driver-x86@vger.kernel.org>; Wed, 16 Apr 2025 12:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744807268; cv=none; b=CG1+Tjnrlzc8SC5aC7MsTyYZ+X84lGj8/yuIgZrTHRlhIWDqDMQTni4QpPuVZ9w1Tqh9X+AWIP+jrsD27+1Ji6zxaeqd5Ug8yHxAYWdf7ht+6Zb3h/VN1h7L+UYXdmEL6SnAWfIEi2trOIxg5AS+STC6QA6THVWQeT2RGgS9gYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744807268; c=relaxed/simple;
	bh=nVnBfmspl+DON/YD3BIcEG78H4IhwBM2t0pL72M0Zjc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LZLdaBOkFF0kj4itFRx9lmxMlHiyXuj2HkG/YKVAlnceCvz866rZ8HOwbATDMwgmQOLXzWknHThBPRpbkSKNAS8K4Pay9TeTASwdwIUp9YKnn5zYmoyKTaRsfJUFv/RSGiaaZA3HfjL6jLqlppop/FxswX6Z2y6PGoCfc29wkgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EajfQF7J; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EajfQF7J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744807262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XlHtPHUZ660q5i4ytAKPVW+2iA+L4bNpvIUVcx+G3mQ=;
	b=EajfQF7JY8hoi13BkcA+/wvXsOWfMjWfil7O5ItvVBuj2BP/++Kcqm2cnigfIZrbniwEJX
	c/k7AurTZCEOW3arLF0YYCxuMSNgdC/KYuQorcp5Tv/JNC7BF8onRMVSEosc/SjMD4mQ3I
	Un15LQfMmoC/6oJKFla4B8++2XIB42I=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-606-wm1i2jF8OZKOPVGdqXU6Kg-1; Wed,
 16 Apr 2025 08:40:58 -0400
X-MC-Unique: wm1i2jF8OZKOPVGdqXU6Kg-1
X-Mimecast-MFC-AGG-ID: wm1i2jF8OZKOPVGdqXU6Kg_1744807256
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3297E180087A;
	Wed, 16 Apr 2025 12:40:56 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.44.34.142])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id ADEEE195608D;
	Wed, 16 Apr 2025 12:40:52 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Dan Scally <djrscally@gmail.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hao Yao <hao.yao@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Duane <duanek@chorus.net>,
	platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v3 2/9] platform/x86: int3472: Stop setting a supply-name for GPIO regulators
Date: Wed, 16 Apr 2025 14:40:30 +0200
Message-ID: <20250416124037.90508-3-hdegoede@redhat.com>
In-Reply-To: <20250416124037.90508-1-hdegoede@redhat.com>
References: <20250416124037.90508-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

The supply_name field is not mandatory and is supposed to be set to
the name of another regulator when it is known that the regulator being
registered is supplied by that other regulator.

Having a regulator supplying the regulator which is being registered does
not apply to the INT3472 GPIO regulator, stop setting a supply_name.

Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel/int3472/clk_and_regulator.c | 3 ---
 drivers/platform/x86/intel/int3472/common.h            | 5 +----
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/clk_and_regulator.c b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
index 837990af24fe..40434591dd0b 100644
--- a/drivers/platform/x86/intel/int3472/clk_and_regulator.c
+++ b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
@@ -256,12 +256,9 @@ int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
 	snprintf(int3472->regulator.regulator_name,
 		 sizeof(int3472->regulator.regulator_name), "%s-regulator",
 		 acpi_dev_name(int3472->adev));
-	snprintf(int3472->regulator.supply_name,
-		 GPIO_REGULATOR_SUPPLY_NAME_LENGTH, "supply-0");
 
 	int3472->regulator.rdesc = INT3472_REGULATOR(
 						int3472->regulator.regulator_name,
-						int3472->regulator.supply_name,
 						&int3472_gpio_regulator_ops);
 
 	int3472->regulator.gpio = gpio;
diff --git a/drivers/platform/x86/intel/int3472/common.h b/drivers/platform/x86/intel/int3472/common.h
index 145dec66df64..72ef222629b6 100644
--- a/drivers/platform/x86/intel/int3472/common.h
+++ b/drivers/platform/x86/intel/int3472/common.h
@@ -27,17 +27,15 @@
 #define INT3472_MAX_SENSOR_GPIOS				3
 
 #define GPIO_REGULATOR_NAME_LENGTH				21
-#define GPIO_REGULATOR_SUPPLY_NAME_LENGTH			9
 #define GPIO_REGULATOR_SUPPLY_MAP_COUNT				2
 
 #define INT3472_LED_MAX_NAME_LEN				32
 
 #define CIO2_SENSOR_SSDB_MCLKSPEED_OFFSET			86
 
-#define INT3472_REGULATOR(_name, _supply, _ops)			\
+#define INT3472_REGULATOR(_name, _ops)				\
 	(const struct regulator_desc) {				\
 		.name = _name,					\
-		.supply_name = _supply,				\
 		.type = REGULATOR_VOLTAGE,			\
 		.ops = _ops,					\
 		.owner = THIS_MODULE,				\
@@ -82,7 +80,6 @@ struct int3472_discrete_device {
 		/* SUPPLY_MAP_COUNT * 2 to make room for second sensor mappings */
 		struct regulator_consumer_supply supply_map[GPIO_REGULATOR_SUPPLY_MAP_COUNT * 2];
 		char regulator_name[GPIO_REGULATOR_NAME_LENGTH];
-		char supply_name[GPIO_REGULATOR_SUPPLY_NAME_LENGTH];
 		struct gpio_desc *gpio;
 		struct regulator_dev *rdev;
 		struct regulator_desc rdesc;
-- 
2.49.0


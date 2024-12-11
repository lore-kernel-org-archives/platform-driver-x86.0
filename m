Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5514D1DE880
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Dec 2024 17:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733939123; cv=none; b=P8BDW5Gl1GqiIgxEZC6uYUFtBCX11AC2gz8WECs+/zphhWbq5t32AnwOXNd2F8n/KaYebJHSF/DfEh6nCAB4rIapKTIlCWBGQWSL70cWaLm/76lcIhS8A+fFHm6JND5zpvuHsQdq43hlf1wuQO2irhRBaqGMx4PWFXghA+Wr4VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733939123; c=relaxed/simple;
	bh=xgraoVROL4md+uwThl0fk8T13lXPnNMqv+CU/+g1Qs4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dklclhfjmWqc76MyAQlDoDq2RPoTVQZOGb1+ExSx+akxy4FUnRvY+Hh/t6eATcaLnBXu/zR1AJRgEItJ6PnzuCFYkMhlinKTfDD9N7tze42mSKOnRBalv283zwRDSGzJ/dipY+DLsz3EYzM0lRpCW2xpIuZiXRMQIBeYJyKfOrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZyyfQNSn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZyyfQNSn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733939119;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dge+lrTUYbxVYF5Oeog8XIT3jenoNEqlhPDI9C71FmM=;
	b=ZyyfQNSngQ2OelOgES7925jNM89x0E4Sf9wpeMKguy4plJhF6p8ZXGxTCD+c6+GbWKk1zX
	dA45SgCiNuRb1JyRaC915uYXVZAhMmf1C7vcc+UocOAfcDETt1UgWEZWVbOx8yHkXMRJbD
	8oVmTpm/3dIghmjTMffakNX6aH4E1jM=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-5-BP428xeaNECHzmxULGzEbA-1; Wed,
 11 Dec 2024 12:45:14 -0500
X-MC-Unique: BP428xeaNECHzmxULGzEbA-1
X-Mimecast-MFC-AGG-ID: BP428xeaNECHzmxULGzEbA
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CC5B4195421A;
	Wed, 11 Dec 2024 17:45:12 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.61])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3DA7C1956048;
	Wed, 11 Dec 2024 17:45:10 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Sebastian Reichel <sre@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Jelle van der Waa <jelle@vdwaa.nl>,
	platform-driver-x86@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v4 3/4] power: supply: bq24190_charger: Add support for "charge_types" property
Date: Wed, 11 Dec 2024 18:44:50 +0100
Message-ID: <20241211174451.355421-4-hdegoede@redhat.com>
In-Reply-To: <20241211174451.355421-1-hdegoede@redhat.com>
References: <20241211174451.355421-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

The bq24190 power_supply class device has a writeable "charge_type"
property, add support for the new "charge_types" property. Reading this
returns a list of supported charge-types with the currently active type
surrounded by square brackets, allowing userspace to find out which
enum power_supply_charge_type values are supported.

This has been tested on a GPD win gaming-handheld.

Reviewed-by: Thomas Weißschuh <linux@weissschuh.net>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/power/supply/bq24190_charger.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/power/supply/bq24190_charger.c b/drivers/power/supply/bq24190_charger.c
index 3b97f7884967..4d96352af34c 100644
--- a/drivers/power/supply/bq24190_charger.c
+++ b/drivers/power/supply/bq24190_charger.c
@@ -1313,6 +1313,7 @@ static int bq24190_charger_get_property(struct power_supply *psy,
 
 	switch (psp) {
 	case POWER_SUPPLY_PROP_CHARGE_TYPE:
+	case POWER_SUPPLY_PROP_CHARGE_TYPES:
 		ret = bq24190_charger_get_charge_type(bdi, val);
 		break;
 	case POWER_SUPPLY_PROP_HEALTH:
@@ -1393,6 +1394,7 @@ static int bq24190_charger_set_property(struct power_supply *psy,
 		ret = bq24190_charger_set_temp_alert_max(bdi, val);
 		break;
 	case POWER_SUPPLY_PROP_CHARGE_TYPE:
+	case POWER_SUPPLY_PROP_CHARGE_TYPES:
 		ret = bq24190_charger_set_charge_type(bdi, val);
 		break;
 	case POWER_SUPPLY_PROP_CONSTANT_CHARGE_CURRENT:
@@ -1421,6 +1423,7 @@ static int bq24190_charger_property_is_writeable(struct power_supply *psy,
 	case POWER_SUPPLY_PROP_ONLINE:
 	case POWER_SUPPLY_PROP_TEMP_ALERT_MAX:
 	case POWER_SUPPLY_PROP_CHARGE_TYPE:
+	case POWER_SUPPLY_PROP_CHARGE_TYPES:
 	case POWER_SUPPLY_PROP_CONSTANT_CHARGE_CURRENT:
 	case POWER_SUPPLY_PROP_CONSTANT_CHARGE_VOLTAGE:
 	case POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT:
@@ -1469,6 +1472,7 @@ static void bq24190_charger_external_power_changed(struct power_supply *psy)
 
 static enum power_supply_property bq24190_charger_properties[] = {
 	POWER_SUPPLY_PROP_CHARGE_TYPE,
+	POWER_SUPPLY_PROP_CHARGE_TYPES,
 	POWER_SUPPLY_PROP_HEALTH,
 	POWER_SUPPLY_PROP_ONLINE,
 	POWER_SUPPLY_PROP_STATUS,
@@ -1498,6 +1502,9 @@ static const struct power_supply_desc bq24190_charger_desc = {
 	.set_property		= bq24190_charger_set_property,
 	.property_is_writeable	= bq24190_charger_property_is_writeable,
 	.external_power_changed	= bq24190_charger_external_power_changed,
+	.charge_types		= BIT(POWER_SUPPLY_CHARGE_TYPE_NONE)    |
+				  BIT(POWER_SUPPLY_CHARGE_TYPE_TRICKLE) |
+				  BIT(POWER_SUPPLY_CHARGE_TYPE_FAST),
 };
 
 /* Battery power supply property routines */
-- 
2.47.1


Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8098E1F2C33
	for <platform-driver-x86@vger.kernel.org>; Sat, 21 Dec 2024 12:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734785513; cv=none; b=azx3IsEReVDDYGITbYZW241OBkvk+1YfN9EO49t11R1vLqLaC9OO5uq0LjDc9F33zIXq2pug1xXaykMUOImSQbBsbJt+10rw+c0g/rp8g98VZDR/8WHEzZVL82Enktihx7o/gcyN4Qf+IbRvLmeshboQ8bSj9dLynh5kViqhTeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734785513; c=relaxed/simple;
	bh=TpRq31bbDKM+E/ruSCBS9GhhNyJukeJ0XXaFE4hvS7g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q6s0XveCLI2Y/uK47azZDID6OdaGPBCfXADRzoR7CHP1Vn1hSD+p3oJZrNnExM+by1U8ng9KbOrxAFc9KYtk/DrdV++VVVJ6FlL1kTGTodNZJdZ4tJnsDPrksYumAjB3I5zO6VYJb1FmBt5Xy4xILP0CPyE9oM3sWE2GoJjghws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hCG6hT56; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hCG6hT56"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734785510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=04Pmas301IFxFVgMh1JoH+9P3L/9Jh1+DChgIS7PTrQ=;
	b=hCG6hT56B8mh00+5ehJXwf+u4tJkmkTR+FXmCkgnrV4vi1COEhh14O5YnJToxbZvJJbRqv
	qNuyMqHzqXWXn+E3CwgfEWddD0uahEVT7bEeu8HH9PnvYeYnQyO9ChVuu0vQXFCAynltmm
	IqB+VqXiBH4WDC6/8muzJf8AiFOCCHA=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-654-DvZnE2NpP2OZLWUW5y7W7Q-1; Sat,
 21 Dec 2024 07:51:49 -0500
X-MC-Unique: DvZnE2NpP2OZLWUW5y7W7Q-1
X-Mimecast-MFC-AGG-ID: DvZnE2NpP2OZLWUW5y7W7Q
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2CA9D1956086;
	Sat, 21 Dec 2024 12:51:47 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.23])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 932FC1953953;
	Sat, 21 Dec 2024 12:51:44 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Sebastian Reichel <sre@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	platform-driver-x86@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v5 1/1] platform/x86: dell-laptop: Use power_supply_charge_types_show/_parse() helpers
Date: Sat, 21 Dec 2024 13:51:40 +0100
Message-ID: <20241221125140.345776-2-hdegoede@redhat.com>
In-Reply-To: <20241221125140.345776-1-hdegoede@redhat.com>
References: <20241221125140.345776-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Make battery_modes a map between tokens and enum power_supply_charge_type
values instead of between tokens and strings and use the new
power_supply_charge_types_show/_parse() helpers for show()/store()
to ensure that things are handled in the same way as in other drivers.

This also changes battery_supported_modes to be a bitmap of charge-types
(enum power_supply_charge_type values) rather then a bitmap of indices
into battery_modes[].

Reviewed-by: Thomas Weißschuh <linux@weissschuh.net>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v5:
- Return ENOENT instead of EIO in charge_types_store() when the requested
  mode was accepted by power_supply_charge_types_parse() but for some
  reason is not found in the battery_modes[] array
---
 drivers/platform/x86/dell/dell-laptop.c | 54 ++++++++++++-------------
 1 file changed, 25 insertions(+), 29 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-laptop.c b/drivers/platform/x86/dell/dell-laptop.c
index 5671bd0deee7..e6da468daf83 100644
--- a/drivers/platform/x86/dell/dell-laptop.c
+++ b/drivers/platform/x86/dell/dell-laptop.c
@@ -103,15 +103,15 @@ static bool mute_led_registered;
 
 struct battery_mode_info {
 	int token;
-	const char *label;
+	enum power_supply_charge_type charge_type;
 };
 
 static const struct battery_mode_info battery_modes[] = {
-	{ BAT_PRI_AC_MODE_TOKEN,   "Trickle" },
-	{ BAT_EXPRESS_MODE_TOKEN,  "Fast" },
-	{ BAT_STANDARD_MODE_TOKEN, "Standard" },
-	{ BAT_ADAPTIVE_MODE_TOKEN, "Adaptive" },
-	{ BAT_CUSTOM_MODE_TOKEN,   "Custom" },
+	{ BAT_PRI_AC_MODE_TOKEN,   POWER_SUPPLY_CHARGE_TYPE_TRICKLE },
+	{ BAT_EXPRESS_MODE_TOKEN,  POWER_SUPPLY_CHARGE_TYPE_FAST },
+	{ BAT_STANDARD_MODE_TOKEN, POWER_SUPPLY_CHARGE_TYPE_STANDARD },
+	{ BAT_ADAPTIVE_MODE_TOKEN, POWER_SUPPLY_CHARGE_TYPE_ADAPTIVE },
+	{ BAT_CUSTOM_MODE_TOKEN,   POWER_SUPPLY_CHARGE_TYPE_CUSTOM },
 };
 static u32 battery_supported_modes;
 
@@ -2261,46 +2261,42 @@ static ssize_t charge_types_show(struct device *dev,
 		struct device_attribute *attr,
 		char *buf)
 {
-	ssize_t count = 0;
+	enum power_supply_charge_type charge_type;
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(battery_modes); i++) {
-		bool active;
+		charge_type = battery_modes[i].charge_type;
 
-		if (!(battery_supported_modes & BIT(i)))
+		if (!(battery_supported_modes & BIT(charge_type)))
 			continue;
 
-		active = dell_battery_mode_is_active(battery_modes[i].token);
-		count += sysfs_emit_at(buf, count, active ? "[%s] " : "%s ",
-				battery_modes[i].label);
+		if (!dell_battery_mode_is_active(battery_modes[i].token))
+			continue;
+
+		return power_supply_charge_types_show(dev, battery_supported_modes,
+						      charge_type, buf);
 	}
 
-	/* convert the last space to a newline */
-	if (count > 0)
-		count--;
-	count += sysfs_emit_at(buf, count, "\n");
-
-	return count;
+	/* No active mode found */
+	return -EIO;
 }
 
 static ssize_t charge_types_store(struct device *dev,
 		struct device_attribute *attr,
 		const char *buf, size_t size)
 {
-	bool matched = false;
-	int err, i;
+	int charge_type, err, i;
+
+	charge_type = power_supply_charge_types_parse(battery_supported_modes, buf);
+	if (charge_type < 0)
+		return charge_type;
 
 	for (i = 0; i < ARRAY_SIZE(battery_modes); i++) {
-		if (!(battery_supported_modes & BIT(i)))
-			continue;
-
-		if (sysfs_streq(battery_modes[i].label, buf)) {
-			matched = true;
+		if (battery_modes[i].charge_type == charge_type)
 			break;
-		}
 	}
-	if (!matched)
-		return -EINVAL;
+	if (i == ARRAY_SIZE(battery_modes))
+		return -ENOENT;
 
 	err = dell_battery_set_mode(battery_modes[i].token);
 	if (err)
@@ -2430,7 +2426,7 @@ static u32 __init battery_get_supported_modes(void)
 
 	for (i = 0; i < ARRAY_SIZE(battery_modes); i++) {
 		if (dell_smbios_find_token(battery_modes[i].token))
-			modes |= BIT(i);
+			modes |= BIT(battery_modes[i].charge_type);
 	}
 
 	return modes;
-- 
2.47.1


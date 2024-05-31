Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A592D15B0EB
	for <platform-driver-x86@vger.kernel.org>; Fri, 31 May 2024 13:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717163246; cv=none; b=Ozgu/q0y4pMEqnLy+CWnpXikfOH0FmD4E5Au/RS5aGQ1ON2FkqfKSAKgstEZCsFj8pb8rCbOsZ1qZMkWsDjszuradbxLVFiI619pzXTgqtKN7GCPEDcVZmbE48PDtls2ihqyynHiYCyCFnbXwR8DM8cKdjZdWScX9HTjcpB2RNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717163246; c=relaxed/simple;
	bh=gXKjLBynIcLmbfKX7WD2h03GNICMYxTgTCUf7gWsBIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YuqDhWSfqYhidrBmSsyDhtThg3hYNZ9fcFvtl2J4I+hDjo/WL7dk8tgxslfOceEi+N9EQdL/y+DPh5hkfK1ktyz4hkl4gbM2kyz7hUDAzdNvglOLpmSxwLoaluNhrqnUHL+a1lTQ4IhRORprSCxm314vIbZO+zo9FDboEEnKN1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eXnI8mO7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eXnI8mO7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717163243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sy2QrRtQS1ZXr2r/Ht8xMH5jFrRv9RAt8SNKBxOYZFo=;
	b=eXnI8mO7qsW8o+azhPXkwXfvJG96Gav7FanzShHP5AUQ4Db78jocYuCP37ZOZWzy1FWG3k
	y5ik1mzmQ7PA7ZSTyw5/PUGiEN7i7/9d+MaykX48UW7l2meZv5bL9OQ1qnvaijW5Eo09cV
	i2bf2DWRR1ADyk+7AygOKk4wEOgXcNY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-581-l79VswIYMxa42MWeN2KnWQ-1; Fri, 31 May 2024 09:47:20 -0400
X-MC-Unique: l79VswIYMxa42MWeN2KnWQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 94CF7101A54F;
	Fri, 31 May 2024 13:47:19 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.76])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2795E1054820;
	Fri, 31 May 2024 13:47:18 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	Sebastian Reichel <sre@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	linux-leds@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v2 3/3] power: supply: power-supply-leds: Add activate() callback to triggers
Date: Fri, 31 May 2024 15:47:02 +0200
Message-ID: <20240531134702.166145-4-hdegoede@redhat.com>
In-Reply-To: <20240531134702.166145-1-hdegoede@redhat.com>
References: <20240531134702.166145-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3

Add an activate() callback to the power-supply LED triggers so that
the LED being activated will properly reflect the current power-supply
state for power-supply devices which are already fully registered
when the trigger gets activated.

This fixes e.g. wrong LED state (1) when the LED gets registered
after the power-supply device.

1) Until the psy driver has a reason to call power_supply_changed()
   which may take quite a while

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Use trigger_to_psy_trigger() macro
---
 drivers/power/supply/power_supply_leds.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/power/supply/power_supply_leds.c b/drivers/power/supply/power_supply_leds.c
index f2d6b8d33707..f4a7e566bea1 100644
--- a/drivers/power/supply/power_supply_leds.c
+++ b/drivers/power/supply/power_supply_leds.c
@@ -27,6 +27,16 @@ struct power_supply_led_trigger {
 #define trigger_to_psy_trigger(trigger) \
 	container_of(trigger, struct power_supply_led_trigger, trig)
 
+static int power_supply_led_trigger_activate(struct led_classdev *led_cdev)
+{
+	struct power_supply_led_trigger *psy_trig =
+		trigger_to_psy_trigger(led_cdev->trigger);
+
+	/* Sync current power-supply state to LED being activated */
+	power_supply_update_leds(psy_trig->psy);
+	return 0;
+}
+
 static int power_supply_register_led_trigger(struct power_supply *psy,
 					     const char *name_template,
 					     struct led_trigger **tp, int *err)
@@ -46,6 +56,7 @@ static int power_supply_register_led_trigger(struct power_supply *psy,
 	if (!psy_trig->trig.name)
 		goto err_free_trigger;
 
+	psy_trig->trig.activate = power_supply_led_trigger_activate;
 	psy_trig->psy = psy;
 
 	ret = led_trigger_register(&psy_trig->trig);
-- 
2.45.1


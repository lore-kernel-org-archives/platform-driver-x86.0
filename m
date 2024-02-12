Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CFA3A8C2
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 Feb 2024 12:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707739574; cv=none; b=kJechDBHFWVvHnl5YBlPtqqddhyjAEnghotkCM2OZxe2ODAQn8FNuAElwCPKKgIAVQyYXCmrF3knjXWnf2NzfWTprG7RpXKQPKmlvIVZEfp2NFuXSzi5+mS+CgQrAqo64i7JjsG+9Ui47aHtBLw0r7B2gc4Tz+aMUL+Vvon7x2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707739574; c=relaxed/simple;
	bh=9oOJcoD09vS0GlVY0rWpPFIuermSWxorgbCqVKhTegQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TPa28TwwkCfnVDxSAf3HKwB7X4AuSCK3Nektd4tSHgNTWhAoB0DGrwAaQ1uPRbfXn85hdqwnFPJBfOKQYpZaq8wnAucECcK0J1Mon3lP6vH3UYb5nNQ2S+CeG0QVCGHiha7kwEf5QYIjqjzxLTHoCMCt3x3ZXA4jntjg5XwV1G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WmHov0b5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WmHov0b5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707739572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=z5Av24ZAA9PqTIyGquMzexrHWHffTXB157Tx8l8uofs=;
	b=WmHov0b5hIUndIygd45xL9X3i+R/dkBGAWyqvvr+tnZMKCfO/4TfB3rZKc21UkloW7HkkV
	wXy4fvL18/tIzA8KRETZ+YWXNGqJTtMIdFB+gcdsL0lzzpBPnfTF5sXBi/DSY3Gx97txdJ
	oSgmSk42OsWkIrOBm4aYF0TNzyBrwa8=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-648-CRyIasX9MmyLNXp8_9qkHA-1; Mon,
 12 Feb 2024 07:06:10 -0500
X-MC-Unique: CRyIasX9MmyLNXp8_9qkHA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 74A901C08BA4;
	Mon, 12 Feb 2024 12:06:10 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.82])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C7E1540C9444;
	Mon, 12 Feb 2024 12:06:09 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 1/2] platform/x86: touchscreen_dmi: Allow partial (prefix) matches for ACPI names
Date: Mon, 12 Feb 2024 13:06:07 +0100
Message-ID: <20240212120608.30469-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2

On some devices the ACPI name of the touchscreen is e.g. either
MSSL1680:00 or MSSL1680:01 depending on the BIOS version.

This happens for example on the "Chuwi Hi8 Air" tablet where the initial
commit's ts_data uses "MSSL1680:00" but the tablets from the github issue
and linux-hardware.org probe linked below both use "MSSL1680:01".

Replace the strcmp() match on ts_data->acpi_name with a strstarts()
check to allow using a partial match on just the ACPI HID of "MSSL1680"
and change the ts_data->acpi_name for the "Chuwi Hi8 Air" accordingly
to fix the touchscreen not working on models where it is "MSSL1680:01".

Note this drops the length check for I2C_NAME_SIZE. This never was
necessary since the ACPI names used are never more then 11 chars and
I2C_NAME_SIZE is 20 so the replaced strncmp() would always stop long
before reaching I2C_NAME_SIZE.

Link: https://linux-hardware.org/?computer=AC4301C0542A
Closes: https://github.com/onitake/gsl-firmware/issues/91
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/touchscreen_dmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
index 7aee5e9ff2b8..969477c83e56 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -81,7 +81,7 @@ static const struct property_entry chuwi_hi8_air_props[] = {
 };
 
 static const struct ts_dmi_data chuwi_hi8_air_data = {
-	.acpi_name	= "MSSL1680:00",
+	.acpi_name	= "MSSL1680",
 	.properties	= chuwi_hi8_air_props,
 };
 
@@ -1821,7 +1821,7 @@ static void ts_dmi_add_props(struct i2c_client *client)
 	int error;
 
 	if (has_acpi_companion(dev) &&
-	    !strncmp(ts_data->acpi_name, client->name, I2C_NAME_SIZE)) {
+	    strstarts(client->name, ts_data->acpi_name)) {
 		error = device_create_managed_software_node(dev, ts_data->properties, NULL);
 		if (error)
 			dev_err(dev, "failed to add properties: %d\n", error);
-- 
2.43.0


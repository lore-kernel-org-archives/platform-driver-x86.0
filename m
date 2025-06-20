Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82EEB2C032E
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Jun 2025 17:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750442296; cv=none; b=bx6/lgA8nCHhwfQRBxhRBs6B3VKUF+AGOYpkRdVgm1fA4CaRZcq+oLF8nryzy34XQfAnkuTi6TdZd9xxRJFUAsZaWLTAcW1KT1Y+IhtKtNI9MI7H035wsO/PylYyXJYpBAUz+AFRXl8WY+iT92CRAQi2ke3UeFVd9/oBZCo892o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750442296; c=relaxed/simple;
	bh=Gf/0lDI0dE+IC6b3kTNVKizzAwDYth5cgGaleoOnTNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VX00xF4vkfBzgRtDqTPbOypUv3VzEacb7sI8jlLgnsz0hEuI/h07R/RpIOQKoSsNQJVxnuIT9oVwve2fzv+ObmuieBapE4tJm/vCJtEJSK6U9VUg/Mv88+yOT7pC5+cFyPgJSvYXxW9cDEpGKpXnM/2BIJ5Q+1kCIrA0OMo45yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ENlhc1a1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ENlhc1a1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D537BC4CEE3;
	Fri, 20 Jun 2025 17:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750442296;
	bh=Gf/0lDI0dE+IC6b3kTNVKizzAwDYth5cgGaleoOnTNQ=;
	h=From:To:Cc:Subject:Date:From;
	b=ENlhc1a1F6GdITjV6ETNfMUqjENxaCKv00I2En2fVJz7EogdU5gOWrtuG1x/u/IEC
	 UGqFrl9WUltCScWruf6qfk3cMnH3TrP8/7EdU9FJKJLCiDo5GovnmdP89KOcb7P8GS
	 wqkoJZi5dzSg+UsnoxGlIgu/VLj404rCG1wd7ot1ocZzAuSNRq8H9Qo5cjLvGyZjin
	 98ul97jszdvSMFiaawVSU5WQ7BU/Aa5UzWVZdVj42y7K4bp2Hj609U3jYtmrsvvuVG
	 5Dj2+6DRn3ryrPagFqfkDqQ3konJyBYsJ7rwH9qc8uURezZQX5AQeMHyID/AkR5cRI
	 ukiaVdlUonrQg==
From: Hans de Goede <hansg@kernel.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Armin Wolf <W_Armin@gmx.de>
Cc: Hans de Goede <hansg@kernel.org>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: dell-ddv: Fix taking the psy->extensions_sem lock twice
Date: Fri, 20 Jun 2025 19:58:07 +0200
Message-ID: <20250620175807.418300-1-hansg@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

dell_wmi_ddv_get_property() gets called with psy->extensions_sem
read-locked, it calls dell_wmi_ddv_battery_translate() which calls
power_supply_get_property() on the same psy which again read-locks
psy->extensions_sem.

Lockdep rightfully complains about this:

 ============================================
 WARNING: possible recursive locking detected
...
 kworker/16:3/1230 is trying to acquire lock:
 ffff8c3143417658 (&psy->extensions_sem){++++}-{4:4},
  at: power_supply_get_property.part.0+0x23/0x160
 but task is already holding lock:
 ffff8c3143417658 (&psy->extensions_sem){++++}-{4:4},
  at: power_supply_get_property.part.0+0x23/0x160
...
  Possible unsafe locking scenario:

        CPU0
        ----
   lock(&psy->extensions_sem);
   lock(&psy->extensions_sem);

  *** DEADLOCK ***
...
 Call Trace:
  <TASK>
  ...
  down_read+0x3e/0x180
  ? power_supply_get_property.part.0+0x23/0x160
  power_supply_get_property.part.0+0x23/0x160
  dell_wmi_ddv_battery_translate+0x68/0x1d0 [dell_wmi_ddv]
  ? lock_acquire+0xd9/0x2c0
  dell_wmi_ddv_get_property+0x25/0x240 [dell_wmi_ddv]
  power_supply_get_property.part.0+0x87/0x160
  power_supply_format_property+0xc4/0x3d0
  add_prop_uevent+0x26/0x90
  power_supply_uevent+0xb9/0xf0

This usually works fine, because read-locking can be done multiple times
but if someone tries to write-lock between the 2 read-lock calls then
the second read-lock will block on the write-lock and the write-lock will
be blocked on the first read-lock leading to a deadlock.

The serial is part of the main psy device, not of an extension. Directly
call psy->desc->get_property() in dell_wmi_ddv_battery_translate() to fix
the double-lock issue.

Note this also influences eppid_show() which is called directly rather
then through power_supply_get_property(). This is ok since the ACPI
battery is fully ready to be used when the battery hook's add_battery
callback is called.

Fixes: 058de163a376 ("platform/x86: dell-ddv: Implement the battery matching algorithm")
Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/platform/x86/dell/dell-wmi-ddv.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-wmi-ddv.c b/drivers/platform/x86/dell/dell-wmi-ddv.c
index 67f3d7158403..95cc3139f271 100644
--- a/drivers/platform/x86/dell/dell-wmi-ddv.c
+++ b/drivers/platform/x86/dell/dell-wmi-ddv.c
@@ -689,9 +689,11 @@ static int dell_wmi_ddv_battery_translate(struct dell_wmi_ddv_data *data,
 
 	dev_dbg(&data->wdev->dev, "Translation cache miss\n");
 
-	/* Perform a translation between a ACPI battery and a battery index */
-
-	ret = power_supply_get_property(battery, POWER_SUPPLY_PROP_SERIAL_NUMBER, &val);
+	/*
+	 * Perform a translation between a ACPI battery and a battery index. Directly call
+	 * desc->get_property() to avoid locking battery->extensions_sem a second time.
+	 */
+	ret = battery->desc->get_property(battery, POWER_SUPPLY_PROP_SERIAL_NUMBER, &val);
 	if (ret < 0)
 		return ret;
 
-- 
2.49.0


Received: from mail-244108.protonmail.ch (mail-244108.protonmail.ch [109.224.244.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D0E3B2FDF
	for <platform-driver-x86@vger.kernel.org>; Sun, 19 Jul 2026 18:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784484992; cv=none; b=DC8zJoJoC17GpJs1dhetkfkpWdmCtAjxz80Y8Bin4a9FSa96ZpDngRsxy0/3Gq5IB1YCfxlglMUpz8LkfxPeHhg3eLHNlICvjZJz0krkRMoYbWbzUIpu9F11DFu7KBshgDVQyCONX9Q2YJCzne+xQSoAE8CY7YO5EX/VPFN5ALM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784484992; c=relaxed/simple;
	bh=kg0xLxafLKprtnwgqyIDo9n04xyxelPV+r4CR3GjvHY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=KSoHAA9VqyW7NnBacKSOhRhMdWs9ULPf20hf1ZBPLDckFTBssnqDypF7qCQE27uDZ0sj6EyMo3faWdnKEOy6XsEyC3q6AYm8vgoCY7w8gsA47EHGGUo2aUbCtpRBcSZVqBx97QIgeFRmufTPCt7riyaZjrOaQ7tDHqzAvjMh7Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=berg.pm; spf=pass smtp.mailfrom=berg.pm; dkim=pass (2048-bit key) header.d=berg.pm header.i=@berg.pm header.b=Kbiiajxp; arc=none smtp.client-ip=109.224.244.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=berg.pm
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berg.pm
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berg.pm header.i=@berg.pm header.b="Kbiiajxp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=berg.pm;
	s=protonmail; t=1784484977; x=1784744177;
	bh=l68H8O0Eq1bVeHDBa3ruzNFelsiH6/46bsXKgdZyrr4=;
	h=From:Date:Subject:Message-Id:To:Cc:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=KbiiajxpmYAHZ7pDP62bey3kEd1rnxDVkVqQ/oZK0Mt4OUqkgK+NDqFkmbrzwmFLt
	 Z5fSYmcKVw9f1xIZrUfSXXU0ORP1DhG194Gt+siLwZ43gGoHmU23/7NZx12zSbXL3D
	 uzFZraKmcFrosBBVeAYfpC9XkllyFGGcuY/wJXtiCKcUvDrPhOmHyUxM0yUzWY+mUH
	 fBt1kdN8nG+qG81d0X3DD+WKfRWf7RDiBVehnz1kbBCiRf0M0L6x2Cr6YrAO4Ck0p0
	 sTlKsWeGeNWwpqwQu49bwKZ7u9AXH4P4M21iSFK+snfVxaV9dakcY8eCkY/ntWU3sh
	 +KsmtG3iKD2IQ==
X-Pm-Submission-Id: 4h3Bfl09N6z1DDp6
From: Jakob Berg Jespersen <dev@berg.pm>
Date: Sun, 19 Jul 2026 20:15:12 +0200
Subject: [PATCH] platform/x86: int3472: handle GPIO type 0x08 as a power
 regulator
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-sp7plus-int3472-v1-1-521a43f5c191@berg.pm>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ7CIBBA0as0s5YEKBHwKsZFS4d2jEHCtMaEc
 HdRl2/xfwXGQshwGSoUfBHTM3Wo0wBhm9KKgpZu0FKfpVVecLb5cbCgtI/GauGiVGZ2C1ofoFe
 5YKT373i9/c3HfMewfzfQ2gcWWl6kcwAAAA==
X-Change-ID: 20260719-sp7plus-int3472-8f014b8de79c
To: Daniel Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tooraj Taraz <tooraj.taraz@yahoo.com>, 
 "Joseph V. Lavigne" <jlavig88@gmail.com>, 
 Jakob Berg Jespersen <dev@berg.pm>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784484974; l=3391;
 i=dev@berg.pm; s=20260719; h=from:subject:message-id;
 bh=kg0xLxafLKprtnwgqyIDo9n04xyxelPV+r4CR3GjvHY=;
 b=3fk8pGcKAdK4eflTJ7iM8vQoY0UBTE6Ua3umfwDpfadkO8GmY46jhiIazKoCnKaja27MSqHYe
 DGANvkf3/UkA5vkOlvV4OG4WL79sGHkC4t48YGh7hho//nVu6dGUQup
X-Developer-Key: i=dev@berg.pm; a=ed25519;
 pk=b1r+eoJThwSQ/r5DjO7jrcosyrIsyhlOuKk9CBdvBxs=

On the Microsoft Surface Pro 7+, the rear camera's INT3472 device
(INT3472:01, sensor INT347A / ov8865) enumerates a GPIO of type 0x08
in its _DSM which the driver does not recognise, so it is left
unmapped:

  int3472-discrete INT3472:01: GPIO type 0x08 unknown; the sensor may
  not work

The DSDT shows this pin (0x0100AF08, pin 175, active-high) sitting
alongside a normal type-0x0b power-enable GPIO: it gates a second
sensor power rail. Because the type is unknown the rail is never
enabled, the ov8865's "dvdd" supply resolves to a dummy regulator, and
the sensor never probes.

Map type 0x08 for INT347A to a POWER_ENABLE regulator with con_id
"dvdd", the supply the in-tree ov8865 driver already requests, so no
sensor-driver change is needed. ("dvdd" rather than "avdd" because the
type-0x0b power-enable pin on this INT3472 is already registered as
"avdd".)

Type 0x08 is not in the driver's documented function list and is not
otherwise handled by mainline; based on the sensor's supply set and the
con_id that brings it up, it appears to be the DVDD (digital core
voltage) rail, the counterpart to the existing DOVDD (0x10) type.

Related out-of-tree work approached the same rail by adding a new "pwr1"
supply instead of the sensor's existing "dvdd" (linux-surface PR #1867
for the Surface Pro 9, PR #2201 for the Pro 7+ ov8865); neither was sent
upstream. Mapping to "dvdd" keeps the change contained to int3472.

With this change the SP7+ rear camera probes and streams reliably,
validated by over a month of use.

Link: https://github.com/linux-surface/linux-surface/pull/1867
Link: https://github.com/linux-surface/linux-surface/pull/2201
Cc: Tooraj Taraz <tooraj.taraz@yahoo.com>
Cc: Joseph V. Lavigne <jlavig88@gmail.com>
Signed-off-by: Jakob Berg Jespersen <dev@berg.pm>
---
0x08 is left as a bare literal rather than a named constant here; if
its canonical meaning is known I'm happy to add e.g.
INT3472_GPIO_TYPE_DVDD and/or handle it generically like DOVDD in v2.

This is my first kernel contribution, so please bear with me on any
process mistakes.
---
 drivers/platform/x86/intel/int3472/discrete.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index 115bb37577a1..98c7b9bc393f 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -164,6 +164,19 @@ static const struct int3472_gpio_map int3472_gpio_map[] = {
 		.con_id = "dvdd",
 		.enable_time_us = 45 * USEC_PER_MSEC,
 	},
+	{	/*
+		 * Surface Pro 7+ ov8865 (rear camera): type 0x08 is an
+		 * undocumented sensor power rail; left undriven the sensor
+		 * stays in a failed power state. "dvdd" rather than "avdd"
+		 * because this INT3472 also has a type 0x0b (power enable)
+		 * pin already registered as "avdd".
+		 */
+		.hid = "INT347A",
+		.type_from = 0x08,
+		.type_to = INT3472_GPIO_TYPE_POWER_ENABLE,
+		.con_id = "dvdd",
+		.enable_time_us = GPIO_REGULATOR_ENABLE_TIME,
+	},
 };
 
 static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3472, u8 *type,

---
base-commit: 2b3a5dabe89e330413af403246b648c1890f368f
change-id: 20260719-sp7plus-int3472-8f014b8de79c

Best regards,
--  
Jakob Berg Jespersen <dev@berg.pm>


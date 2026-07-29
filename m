Received: from mail-07.mail-europe.com (mail-07.mail-europe.com [188.165.51.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248FB41D625;
	Wed, 29 Jul 2026 11:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.51.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785323070; cv=none; b=kEL8JM7FKhYQ80yd0tE4sXnV34eU9xHrCDIfKYGrEg4PY/Q4g5Zl7tjKobxRrT88wKmb1DK9qRsz3XRPFvkJub62US0eyipGKULOPKwj7+j+RzzmSKILBghjbWOus8G00V9Wdr3u2rCXq5SxupYCf97JZzup0eH96Qqh9KCyBmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785323070; c=relaxed/simple;
	bh=E2lfEgxQBImzB+DKFmustU/lr4lMVg4zrf0QQBSaqi4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=L3RrHl/o1jGec0JChpAyxZNxzpjpq9ljoWAGf01+TrJV1sJEkBIkJ9suHr64qscC1obY8VcO3TecEgSMBLLlF7lx4vo+maMPSLgKBoMLNLexdwzKxHITBFoDNjW+lbKVBd2Zt05Z+1Goy7YkLRKmxcbve++LKqjiG8VjL0Lzr5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=berg.pm; spf=pass smtp.mailfrom=berg.pm; dkim=pass (2048-bit key) header.d=berg.pm header.i=@berg.pm header.b=hZzG3a5j; arc=none smtp.client-ip=188.165.51.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=berg.pm
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berg.pm
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berg.pm header.i=@berg.pm header.b="hZzG3a5j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=berg.pm;
	s=protonmail; t=1785323054; x=1785582254;
	bh=YgfM5M6g22ZTfQB64c3LPzDCXjqB25pCahsZXjIiwmc=;
	h=From:Date:Subject:Message-Id:To:Cc:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=hZzG3a5jwKxpaTqvpZ9mGmUHm6cg+60T868UQRFTSZQLbhW0OpJDg7NhVPxsnCS8j
	 kDYibh823jGUl2oVrPcdQYLk6h8leZuydr+1qq9+9nivD0MgWEJESeW+sAXyD+8SaA
	 j5aolGhTpFy6VnJ/damyYjPoGvmgeBdD/xxrUWNpOiQv6K/n4e5qKoZw+OqSfuIHCQ
	 ycUSVzI9PbtPLfIoHVtp3ktTc9g8optqW3b8rJnkzRfQBZY53eWGb9kCDPgeiwnE13
	 Eq/M3Sp3l6if7b17hzPmIx44O+xvqOxTHyP04doWo3S5V5Wq4b+eVpiAHzFXbwRofs
	 gkK9w9iXolhTg==
X-Pm-Submission-Id: 4h98bb4nGSz2ScmM
From: Jakob Berg Jespersen <dev@berg.pm>
Date: Wed, 29 Jul 2026 13:03:46 +0200
Subject: [PATCH v2] platform/x86: int3472: support the POWER1 GPIO type
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-sp7plus-int3472-v2-1-cdfaf97ac3ad@berg.pm>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQ6CMBBFr0JmbQ1TwIIr72FYQBlgjJamA0RDu
 LuAa5cvef/9BYQCk8A1WiDQzMKD20CfIrB95TpS3GwMOtaX2GChxBv/nESxG5PUaJW3MaZ13pA
 pLGwrH6jl91G8lz+WqX6QHffMbvQs4xA+x+WMu/e/PqNClWms0qTNLBZ4qyl0Z/+Ccl3XL8kaQ
 ie+AAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785323051; l=4384;
 i=dev@berg.pm; s=20260719; h=from:subject:message-id;
 bh=E2lfEgxQBImzB+DKFmustU/lr4lMVg4zrf0QQBSaqi4=;
 b=HEwHPotdM4vC/piNOj4I/oOFVJAqiuyp5sO7A9SoSqrJRQin3b5Lxj08FtnZrWCSL/qtm7sJu
 9pgPejFO5fbCgIayEvpOIzf3KCFoIZGZGbkH0rSN8OjtS4CiZz9PhjV
X-Developer-Key: i=dev@berg.pm; a=ed25519;
 pk=b1r+eoJThwSQ/r5DjO7jrcosyrIsyhlOuKk9CBdvBxs=

INT3472 can describe a second sensor power rail as a GPIO of type
POWER1 (0x08), which the driver does not recognise, so the rail is left
unmapped and never enabled:

  int3472-discrete INT3472:01: GPIO type 0x08 unknown; the sensor may
  not work

On the Microsoft Surface Pro 7+ the rear camera's INT3472 (INT347A,
ov8865) has such a pin; without it the ov8865 "dvdd" supply resolves to
a dummy regulator and the sensor never probes.

Define the POWER0 (0x07) and POWER1 (0x08) GPIO types and map POWER1 to
a regulator with con_id "dvdd" for all devices, the supply the in-tree
ov8865 driver already requests. POWER0 is defined but left unmapped, as
no device that uses it is known.

Out-of-tree work approached the same rail by exposing it to the sensor
as a new "pwr1" supply (linux-surface PR #1867 for the Surface Pro 9,
PR #2201 for the Pro 7+ ov8865); mapping POWER1 to the existing "dvdd"
keeps the change contained to int3472.

With this change the Surface Pro 7+ rear camera probes and streams
reliably.

Link: https://github.com/linux-surface/linux-surface/pull/1867
Link: https://github.com/linux-surface/linux-surface/pull/2201
Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Jakob Berg Jespersen <dev@berg.pm>
---
Changes in v2:

- Reworked from a per-device INT347A quirk into a generic mapping of the
  POWER1 (0x08) GPIO type to "dvdd" for all devices, per review.
- Added INT3472_GPIO_TYPE_POWER0 (0x07) and POWER1 (0x08) definitions;
  POWER0 is defined but left unmapped for now.
- Retested on the Surface Pro 7+ (kernel 7.1.5): the rear ov8865 probes,
  instantiates its VCM, and streams.
- Link to v1: https://patch.msgid.link/20260719-sp7plus-int3472-v1-1-521a43f5c191@berg.pm
---
 drivers/platform/x86/intel/int3472/discrete.c | 8 ++++++++
 include/linux/platform_data/x86/int3472.h     | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index 115bb37577a1..5be1b153c2d9 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -227,6 +227,10 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
 		*con_id = "avdd";
 		*gpio_flags = GPIO_ACTIVE_HIGH;
 		break;
+	case INT3472_GPIO_TYPE_POWER1:
+		*con_id = "dvdd";
+		*gpio_flags = GPIO_ACTIVE_HIGH;
+		break;
 	case INT3472_GPIO_TYPE_DOVDD:
 		*con_id = "dovdd";
 		*gpio_flags = GPIO_ACTIVE_HIGH;
@@ -257,6 +261,8 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
  * 0x00 Reset
  * 0x01 Power down
  * 0x02 Strobe
+ * 0x07 Power 0
+ * 0x08 Power 1
  * 0x0b Power enable
  * 0x0c Clock enable
  * 0x0d Privacy LED
@@ -343,6 +349,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 	case INT3472_GPIO_TYPE_PRIVACY_LED:
 	case INT3472_GPIO_TYPE_STROBE:
 	case INT3472_GPIO_TYPE_POWER_ENABLE:
+	case INT3472_GPIO_TYPE_POWER1:
 	case INT3472_GPIO_TYPE_DOVDD:
 	case INT3472_GPIO_TYPE_HANDSHAKE:
 		gpio = skl_int3472_gpiod_get_from_temp_lookup(int3472, agpio, con_id, gpio_flags);
@@ -369,6 +376,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 		case INT3472_GPIO_TYPE_POWER_ENABLE:
 			second_sensor = int3472->quirks.avdd_second_sensor;
 			fallthrough;
+		case INT3472_GPIO_TYPE_POWER1:
 		case INT3472_GPIO_TYPE_DOVDD:
 		case INT3472_GPIO_TYPE_HANDSHAKE:
 			ret = skl_int3472_register_regulator(int3472, gpio, enable_time_us,
diff --git a/include/linux/platform_data/x86/int3472.h b/include/linux/platform_data/x86/int3472.h
index a73841dfae27..b1040e36deb8 100644
--- a/include/linux/platform_data/x86/int3472.h
+++ b/include/linux/platform_data/x86/int3472.h
@@ -25,6 +25,8 @@
 #define INT3472_GPIO_TYPE_RESET					0x00
 #define INT3472_GPIO_TYPE_POWERDOWN				0x01
 #define INT3472_GPIO_TYPE_STROBE				0x02
+#define INT3472_GPIO_TYPE_POWER0				0x07
+#define INT3472_GPIO_TYPE_POWER1				0x08
 #define INT3472_GPIO_TYPE_POWER_ENABLE				0x0b
 #define INT3472_GPIO_TYPE_CLK_ENABLE				0x0c
 #define INT3472_GPIO_TYPE_PRIVACY_LED				0x0d

---
base-commit: 2b3a5dabe89e330413af403246b648c1890f368f
change-id: 20260719-sp7plus-int3472-8f014b8de79c

Best regards,
--  
Jakob Berg Jespersen <dev@berg.pm>


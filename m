Received: from mail-244108.protonmail.ch (mail-244108.protonmail.ch [109.224.244.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59C93264C7
	for <platform-driver-x86@vger.kernel.org>; Sat, 29 Aug 2026 08:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787992191; cv=none; b=O4UF8qTcMilHU99Xi2GpWk9nLxKKL0xyf52/Q46aiRubEXkKaN/2WuA/Tn2+iaoaQwtOWwuJOKsLuRYS+V/1rNFxREuLMlO4u0v0+I4umY+ijShKhJuxe6gWe6BCelC0GtMAC2H2FGqngZv63IokeFbq6G9MK/CTU18g8I0x4F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787992191; c=relaxed/simple;
	bh=17aXPwxiJwF69jf+c1HQ/RDCTJOMI6Tn1YRf/EMPGow=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ChX063uhsYJkVDSMChoqNwUT9Eir1wZmHe+2m2NMcVlx7Fp3lx6fOPN7/QEPdKIix0YQ8/v6UG1twdpVTvH2GXPIp1COVHUnsdUyl9r4Utk7nUTQ0Wt0WWvzKCQleMDmBlH65SeCqqlTIn6K+r1y8dgQMUbzLNEIEDsX0bKMbO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=berg.pm; spf=pass smtp.mailfrom=berg.pm; dkim=pass (2048-bit key) header.d=berg.pm header.i=@berg.pm header.b=a/Ip4aBb; arc=none smtp.client-ip=109.224.244.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=berg.pm
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berg.pm
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berg.pm header.i=@berg.pm header.b="a/Ip4aBb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=berg.pm;
	s=protonmail; t=1787992179; x=1788251379;
	bh=7oRmJ2JX9SjpY6C/SXCk9S84RaRvCnvAhCHlB7P4mR8=;
	h=From:Date:Subject:Message-Id:To:Cc:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=a/Ip4aBbJGeReuRd1WH0oAu3Yq7/WmH9H7bbUFEtOhX/TRTmrrEWG3vJh6GonFM1W
	 HI6BwREaaLaxGtLNjH5mp4hOPsM6ZPK3CLxgN9L/ZqdDpCDD6sqvMXNyd0MfOAnUqt
	 NT7xOZAba8qKETyE/Fv9XRmGpm50Ug02GKKPxvUW7tgg4O8jrJE2TguN85Jrkvay9E
	 YG0IG7HFfQ7KJkG3D+oDXcNykGVk35Rf/ClvVztToRdaH8j5Ji/qdl/vUYARGP1t7q
	 xv7ops7uoiq+hO2+giFTv+Qb6aWa4IHWOzqfp0Zg6RR59WY1h6B36vep0VeUiKimxo
	 zDf/2bFcv59Gg==
X-Pm-Submission-Id: 4hX7hw5gNHz2Schg
From: Jakob Berg Jespersen <dev@berg.pm>
Date: Sat, 29 Aug 2026 10:29:09 +0200
Subject: [PATCH v3] platform/x86: int3472: support the POWER1 GPIO type
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260829-sp7plus-int3472-v3-1-454b50485ce2@berg.pm>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNTQ7CIBgFr9KwFtMPWimuvIdxQflpMdoSaImm6
 d2FutCFLid5M29BQXurAzoWC/I62mDHIQHdFUj2Yug0tioxIiU5lAw4Do652xywHSZaMYIbU0L
 VNkozLlGynNfGPrbi+fLmMLdXLaecyYvehmn0z+0yQt79r0fAgGsCoqKmlsDh1Grf7d0d5XYkX
 zb5YZNkS2WE4UxIKtTHXtf1BYLqaFP8AAAA
X-Change-ID: 20260719-sp7plus-int3472-8f014b8de79c
To: Daniel Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Tooraj Taraz <tooraj.taraz@yahoo.com>, 
 "Joseph V. Lavigne" <jlavig88@gmail.com>, "D. Manresa" <dmanresa@gmail.com>, 
 Jakob Berg Jespersen <dev@berg.pm>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787992176; l=4742;
 i=dev@berg.pm; s=20260719; h=from:subject:message-id;
 bh=17aXPwxiJwF69jf+c1HQ/RDCTJOMI6Tn1YRf/EMPGow=;
 b=dbV30rfjQdGqZ21edpu8veocZUStpZAUfOfjUl9Vy1eFK+OjkqOx5HOI0JHeI79P5Fh/3LEWa
 3FbTlFhoVLQCyIihqGKjRvggxAufu8aC3rb+1uCwr8FRBeILl9gJ8Gy
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
Changes in v3:
- No functional changes; the patch is identical to v2, rebased onto
  current pdx86/for-next (which has since gained the multi-HID GPIO map
  entries and the IMX471 "vana" entries).
- Resent with linux-media@vger.kernel.org on Cc, as requested.
- Link to v2: https://patch.msgid.link/20260729-sp7plus-int3472-v2-1-cdfaf97ac3ad@berg.pm

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
index 6c729fcfce5d..6ab8e589fcd3 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -266,6 +266,10 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
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
@@ -296,6 +300,8 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
  * 0x00 Reset
  * 0x01 Power down
  * 0x02 Strobe
+ * 0x07 Power 0
+ * 0x08 Power 1
  * 0x0b Power enable
  * 0x0c Clock enable
  * 0x0d Privacy LED
@@ -382,6 +388,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 	case INT3472_GPIO_TYPE_PRIVACY_LED:
 	case INT3472_GPIO_TYPE_STROBE:
 	case INT3472_GPIO_TYPE_POWER_ENABLE:
+	case INT3472_GPIO_TYPE_POWER1:
 	case INT3472_GPIO_TYPE_DOVDD:
 	case INT3472_GPIO_TYPE_HANDSHAKE:
 		gpio = skl_int3472_gpiod_get_from_temp_lookup(int3472, agpio, con_id, gpio_flags);
@@ -408,6 +415,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
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
base-commit: 5b05bb3f6c5716fab6911e12d60dd1f43ad9806a
change-id: 20260719-sp7plus-int3472-8f014b8de79c

Best regards,
--  
Jakob Berg Jespersen <dev@berg.pm>


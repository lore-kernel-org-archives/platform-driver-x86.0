Received: from outbound.st.icloud.com (p-east2-cluster6-host5-snip4-10.eps.apple.com [57.103.76.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0892E06E4
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Jun 2026 14:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.76.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782744967; cv=none; b=n8DDNr7++bw7QDu+HFyiz+QSHdwOy5oIjaGVL+z4MrAKtOkyawHPCxWlA+rLXvIL/ky9mZW6JKBaIVX5Gql8VOedyi00lO8FbvuAcuBOgmGSgZK8VoJwgcEdMGkcMcFGkkfiZYe+xR0Ln0AbnteR9z4yq8nTYYzKU8EmjYXp/hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782744967; c=relaxed/simple;
	bh=kuUuGGEYjyC2XLjIlmcN5EHqcU3inWmrAkTPQ3nBjfs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=c73kBcqGdoClrJwbmXAefNHipRCGA39f4C2vT5Vw85X9LePAl/2g7nDjJQzQ4MFBAd/NYAITRYrvjrbrURhUmAiC1Z/LTQD3dBGfiurjUJaX3xP6o8GaPhlTg/AY1Sd23Bv0wIQfQnm4B8fJGHlOzdpkCjG245BUx9IwwllR4Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kursatabayli.dev; spf=pass smtp.mailfrom=kursatabayli.dev; dkim=pass (2048-bit key) header.d=kursatabayli.dev header.i=@kursatabayli.dev header.b=oiFu+7H5; arc=none smtp.client-ip=57.103.76.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kursatabayli.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kursatabayli.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kursatabayli.dev header.i=@kursatabayli.dev header.b="oiFu+7H5"
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-100-percent-11 (Postfix) with ESMTPS id 55078180458F;
	Mon, 29 Jun 2026 14:56:02 +0000 (UTC)
X-ICL-RepId: 019f13e1-548c-7b86-8935-ae04b75edce1
X-ICL-Out-Info: HUtFAUMHWwJACUgATUQeDx5WFlZNRAJCTQhBBkMGXAZeCEAGQwJbEhVdRVsIWwddMFINQR5WH1MSWAFfBBkPVwYZHldQXB5AA1gMUg9WEl4ZFxxWGxcZUU0MWFsIWwQPH0wMUQJCBVZeSgwdBFQHXQVdVlACWktCBEtFaFwFXBxAF0gdX2pLVhQEE0YfRApGEVsZSgFeRVYVT1heBFNWDkIJSgVdAVkLQQ1NBl8CRQNACE4LQAZGWhVVFFwtXB5AA1gMUg9WEl4ZFxxWGwlLRglJHQ4OQhhGH1QnVwJaClse
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kursatabayli.dev; s=sig1; t=1782744965; x=1785336965; bh=zuVP25zdYgKW1bi8uTrRjw1LGZXcNEgYz8C9CmRxV+k=; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:x-icloud-hme; b=oiFu+7H5JuLYkECpH9ylxnfyuwg2y1Ew+WtwqYznVXBAhm7anKI5BgGZbSJFxyiGLaGgKOUVttu2Y1G9ymrvOE1KkEYVg8U7pUaE8JerQxpa+V2extlI7HFsuXb7ODobpoIh3b9tWwd6WTcl3ZD1vCAdWRdwCjOHLWXHPfLr0Xua4zL54AAixps7oh2+HZoUvQagBayMKDeHI+zkvuuqCDx3zvwO0EXTS7qCxSsA1n90zbbCBKo3bXH2cyTLnhD/krHjGKm8zsv9kaeXOaxuGtnj4MgrLbFEZECZjdftMNagSp6qaEXgki5T8knXkRfoAIkSpRQQXZRLy7z7IGBT+g==
mail-alias-created-date: 1779124395950
Received: from hp (unknown [17.42.251.67])
	by p00-icloudmta-asmtp-us-east-1a-100-percent-11 (Postfix) with ESMTPSA id 4B62D18045BF;
	Mon, 29 Jun 2026 14:56:00 +0000 (UTC)
From: =?UTF-8?q?K=C3=BCr=C5=9Fat=20Abayl=C4=B1?= <hello@kursatabayli.dev>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?K=C3=BCr=C5=9Fat=20Abayl=C4=B1?= <hello@kursatabayli.dev>
Subject: [PATCH v2] platform/x86: hp-wmi: Add GPU MUX switch support
Date: Mon, 29 Jun 2026 17:55:25 +0300
Message-ID: <20260629145525.10168-1-hello@kursatabayli.dev>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEyNCBTYWx0ZWRfX10JWq8QeNZex
 g9jNmVxEu1Oc+0ZpBFMXYYzOqyELHxPnIApEHsduWQ0Tvj2s05a54EP2cLmMXhh6U8aYOBLs6jp
 qNQQ+ENGbatRSynfOj0bdl7+FVL7pSGzlZf7WliwAMA9Gj2NSJcyNkrNGVVufVqpTZDy5kMB5FI
 JnTfMjlbQUmuvRiaw9gzyHfIwHtJUyJD55JsRu+bLda2+QpoPr9zft9qvSqE64iNile5VPoDXEV
 bykXb/4Leb5YAPuvHlCikUYTn+FUhL/sdlPXBzBn5KwKellb/7i54QqSrhARg/yZ0cdqVPgBMcv
 o3xIlBBhg7oJ+BIHBuv
X-Proofpoint-ORIG-GUID: xNyNvvODoLu_0G8NyQZDWYRnVp_FK9IK
X-Proofpoint-GUID: xNyNvvODoLu_0G8NyQZDWYRnVp_FK9IK

Add support for querying and switching the graphics MUX mode on HP
systems via WMI. This introduces the 'gpu_mux_mode' sysfs attribute
under the hp-wmi platform device, allowing userspace tools to check
and safely switch between available graphics modes (e.g., UMA, Hybrid,
Discrete).

The hardware capabilities mask is primarily read using the modern
128-byte System Design Data query. However, to ensure backward
compatibility with older models, a fallback mechanism is implemented.
By mirroring the behavior of the Windows Omen Gaming Hub software, if
the modern query fails but the MUX WMI endpoint (0x52) responds
successfully to a read request, the driver defaults to a standard
Hybrid + Discrete support mask (0x06).

Signed-off-by: Kürşat Abaylı <hello@kursatabayli.dev>
---
Changes in v2:
 - Replaced hardcoded bitmask with GENMASK(6, 0).
 - Added specific defines for MUX modes instead of using raw BIT() macros.
 - Initialized arrays with {} instead of { 0 }.
 - Fixed reverse xmas-tree ordering for local variable declarations.
 - Removed empty lines between function calls and their return value checks.
 - Split ternary operators into standard if-statements for better readability.
 - Added missing <linux/array_size.h> include.
 - Removed unnecessary cast in hp_wmi_set_mux_mode.
---
 drivers/platform/x86/hp/hp-wmi.c | 138 +++++++++++++++++++++++++++++++
 1 file changed, 138 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 8ba286ed8721..d8e42cc9936b 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -14,6 +14,8 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/acpi.h>
+#include <linux/array_size.h>
+#include <linux/bits.h>
 #include <linux/cleanup.h>
 #include <linux/compiler_attributes.h>
 #include <linux/dmi.h>
@@ -55,9 +57,16 @@ enum hp_ec_offsets {
 	HP_OMEN_EC_THERMAL_PROFILE_OFFSET		= 0x95,
 };
 
+#define HPWMI_MUX_MODE_UMA		BIT(0)
+#define HPWMI_MUX_MODE_HYBRID		BIT(1)
+#define HPWMI_MUX_MODE_DISCRETE		BIT(2)
+#define HPWMI_MUX_MODE_OPTIMUS		BIT(3)
+
 #define HP_FAN_SPEED_AUTOMATIC	 0x00
 #define HP_POWER_LIMIT_DEFAULT	 0x00
 #define HP_POWER_LIMIT_NO_CHANGE 0xFF
+#define HPWMI_MUX_MODE_MASK		GENMASK(6, 0)
+#define HPWMI_MUX_LEGACY_MASK		(HPWMI_MUX_MODE_HYBRID | HPWMI_MUX_MODE_DISCRETE)
 
 #define zero_if_sup(tmp) (zero_insize_support?0:sizeof(tmp)) // use when zero insize is required
 
@@ -332,6 +341,7 @@ enum hp_wmi_commandtype {
 	HPWMI_POSTCODEERROR_QUERY	= 0x2a,
 	HPWMI_SYSTEM_DEVICE_MODE	= 0x40,
 	HPWMI_THERMAL_PROFILE_QUERY	= 0x4c,
+	HPWMI_GRAPHICS_MUX_QUERY	= 0x52,
 };
 
 struct victus_power_limits {
@@ -1124,12 +1134,139 @@ static int camera_shutter_input_setup(void)
 	return err;
 }
 
+static const u8 mux_bitmask_map[] = {
+	[0] = HPWMI_MUX_MODE_HYBRID,
+	[1] = HPWMI_MUX_MODE_DISCRETE,
+	[2] = HPWMI_MUX_MODE_OPTIMUS,
+	[3] = HPWMI_MUX_MODE_UMA,
+};
+
+static int hp_wmi_get_mux_supported_modes(u8 *supported)
+{
+	u8 legacy_buffer[4] = {};
+	u8 buffer[128] = {};
+	u32 req_packet = 0;
+	int ret;
+
+	if (!supported)
+		return -EINVAL;
+
+	/* Try modern BIOS design data query (128-byte buffer) */
+	ret = hp_wmi_perform_query(HPWMI_GET_SYSTEM_DESIGN_DATA, HPWMI_GM,
+				   buffer, zero_if_sup(req_packet), sizeof(buffer));
+	if (ret == 0) {
+		*supported = buffer[7];
+		return 0;
+	}
+
+	/*
+	 * (Fallback): Legacy BIOS behavior based on Omen Gaming Hub.
+	 * If the modern query is not supported, check if the MUX query endpoint
+	 * responds to a read request. If it succeeds, the hardware has MUX
+	 * capability but lacks the mode map, defaulting to Hybrid + Discrete.
+	 */
+	ret = hp_wmi_perform_query(HPWMI_GRAPHICS_MUX_QUERY, HPWMI_READ,
+				   legacy_buffer, sizeof(legacy_buffer), 0);
+	if (ret == 0) {
+		*supported = HPWMI_MUX_LEGACY_MASK;
+		return 0;
+	}
+
+	if (ret < 0)
+		return ret;
+	return -EINVAL;
+}
+
+static int hp_wmi_get_mux_mode(u8 *mode)
+{
+	u8 buffer[4] = {};
+	int ret;
+
+	if (!mode)
+		return -EINVAL;
+
+	ret = hp_wmi_perform_query(HPWMI_GRAPHICS_MUX_QUERY, HPWMI_READ,
+				   buffer, sizeof(buffer), sizeof(buffer));
+
+	if (ret < 0)
+		return ret;
+	if (ret > 0)
+		return -EINVAL;
+
+	/* Mask the highest bit, which might be used as a BIOS status flag */
+	*mode = buffer[0] & HPWMI_MUX_MODE_MASK;
+
+	return 0;
+}
+
+static int hp_wmi_set_mux_mode(u8 mode)
+{
+	u8 buffer[4] = { mode, 0x00, 0x00, 0x00 };
+	int ret;
+
+	ret = hp_wmi_perform_query(HPWMI_GRAPHICS_MUX_QUERY, HPWMI_WRITE,
+				   buffer, sizeof(buffer), sizeof(buffer));
+
+	if (ret < 0)
+		return ret;
+	if (ret > 0)
+		return -EINVAL;
+
+	return 0;
+}
+
+static ssize_t gpu_mux_mode_show(struct device *dev,
+				 struct device_attribute *attr,
+				 char *buf)
+{
+	u8 mode;
+	int ret;
+
+	ret = hp_wmi_get_mux_mode(&mode);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%u\n", mode);
+}
+
+static ssize_t gpu_mux_mode_store(struct device *dev,
+				  struct device_attribute *attr,
+				  const char *buf,
+				  size_t count)
+{
+	u32 requested;
+	u8 supported;
+	int ret;
+
+	ret = kstrtou32(buf, 0, &requested);
+	if (ret)
+		return ret;
+
+	if (requested >= ARRAY_SIZE(mux_bitmask_map))
+		return -EINVAL;
+
+	ret = hp_wmi_get_mux_supported_modes(&supported);
+	if (ret)
+		return ret;
+
+	/* Verify if the requested mode is allowed by the hardware mask */
+	if (!(supported & mux_bitmask_map[requested]))
+		return -EOPNOTSUPP;
+
+	ret = hp_wmi_set_mux_mode(requested);
+	if (ret)
+		return ret;
+
+	return count;
+}
+
 static DEVICE_ATTR_RO(display);
 static DEVICE_ATTR_RO(hddtemp);
 static DEVICE_ATTR_RW(als);
 static DEVICE_ATTR_RO(dock);
 static DEVICE_ATTR_RO(tablet);
 static DEVICE_ATTR_RW(postcode);
+static DEVICE_ATTR_RW(gpu_mux_mode);
 
 static struct attribute *hp_wmi_attrs[] = {
 	&dev_attr_display.attr,
@@ -1138,6 +1275,7 @@ static struct attribute *hp_wmi_attrs[] = {
 	&dev_attr_dock.attr,
 	&dev_attr_tablet.attr,
 	&dev_attr_postcode.attr,
+	&dev_attr_gpu_mux_mode.attr,
 	NULL,
 };
 ATTRIBUTE_GROUPS(hp_wmi);
-- 
2.54.0


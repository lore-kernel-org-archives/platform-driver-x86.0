Received: from outbound.ms.icloud.com (ms-2005b-snip4-1.eps.apple.com [57.103.72.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E2947668E
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Jul 2026 17:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.72.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784827706; cv=none; b=Du2BSHsPRY1/BXOOvqdcwghvh7h0D/CKf1sebiaJx3XjHWVYGYs/dNXkibMW6t0WwWSc9kHApkeWwGxQYp4e/9C70/Sm2zU23Yt9t4WukaZW5uim5lzBC97CeirNSga/vS0ou8DXpfRqa2ODKZR8rqEnEVeOVZbgYR//Fy/yWLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784827706; c=relaxed/simple;
	bh=stG+2aKT5byKnF4qL7UJSSFcjiGFy+lGhEfSvMx1Ixs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=M0ZuwLP0PeUEL2H98wdfoj7E2VJLhcvegl2FYn8qFKG1ThsFQS8et4JY99mK8VG0f63Fke5k64ZiwAi0TdhFROdiHZI2lPDva9CdMmiCNoYRhn93hSqUWm3aEOh11otUZTIAgT8Oys9PhpDMFReZRheSQCBUsIEGNDe1WmWMQb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kursatabayli.dev; spf=pass smtp.mailfrom=kursatabayli.dev; dkim=pass (2048-bit key) header.d=kursatabayli.dev header.i=@kursatabayli.dev header.b=WA+Zpwwr; arc=none smtp.client-ip=57.103.72.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kursatabayli.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kursatabayli.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kursatabayli.dev header.i=@kursatabayli.dev header.b="WA+Zpwwr"
Received: from outbound.ms.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-3a-100-percent-2 (Postfix) with ESMTPS id 3487718000BB;
	Thu, 23 Jul 2026 17:28:19 +0000 (UTC)
X-ICL-RepId: 019f9005-5fc9-7364-8926-0a93f8a62f8d
X-ICL-Out-Info: HUtFAUMHWwJACUgATUQeDx5WFlZNRAJCTQhPBUMPUxxBCkAdXwZfEhVdRVsIWwddMFINQR5WH1MSWAFfBBkPVwYZHldQXB5AA1gMUg9WEl4ZFxxWGxcZUU0MWFsIWwQPH0wMUQJCBVZeVAsdBFQHXQVdVlACWktCBEtFaFwFXBxAF0gdX2pLVhQEE0YfRApGEVsZSgFeRVYVT1heBFNWDkIJSgVdAFkBQQ5KBF4DRQNICk4CQAZGWhVVFFwtXB5AA1gMUg9WEl4ZFxxWGwlLRglJHQ4OQhhGH1QnVwJaClse
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kursatabayli.dev; s=sig1; t=1784827700; x=1787419700; bh=FWTCbapMUH+LMQYZvza6E4RhH3JnTJ4yoTaKIvZsHpg=; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:x-icloud-hme; b=WA+Zpwwr/uyx9PLQIaHgTn7BvL5OkY3GY0rmjq2GOZ+D/6CG5+llP4yuX9lcBVFDaE+DmSvLBfyuDry/LnIVy7vPC7Jxk6GrFkjsV1c5idK4ODmAQZvZH/u/Sp6s3FhQnK0hHNJ/hkMsHTagUPaxuj78hX9yc3I97cCSgER+Tu5IVe1g4Y3122VNxIadrJgqPpbJ3qjuqpdtNW78vXPz4VEzzaH+DtK9GtLUPqXrUgT1akP7s1Cgsp5KbMqqM0XzUf2csZT0byZyz4PL/bTgJsNHdSadVH7mYLZkHWWNS3fqCor410biNBwWMt5FLEpNZlQrvGMSfsbLdgVo06bDhg==
mail-alias-created-date: 1779124395950
Received: from localhost (unknown [17.57.154.37])
	by p00-icloudmta-asmtp-us-west-3a-100-percent-2 (Postfix) with ESMTPSA id 7D4C4180013F;
	Thu, 23 Jul 2026 17:28:17 +0000 (UTC)
From: =?UTF-8?q?K=C3=BCr=C5=9Fat=20Abayl=C4=B1?= <hello@kursatabayli.dev>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?K=C3=BCr=C5=9Fat=20Abayl=C4=B1?= <hello@kursatabayli.dev>
Subject: [PATCH v5] platform/x86: hp-wmi: Add GPU MUX switch support
Date: Thu, 23 Jul 2026 20:27:34 +0300
Message-ID: <20260723172734.18361-1-hello@kursatabayli.dev>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: HHptiWpySRvupeA5SPXZVvdT0VJtIo-Y
X-Proofpoint-ORIG-GUID: HHptiWpySRvupeA5SPXZVvdT0VJtIo-Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE3MCBTYWx0ZWRfX2hz3gwknx1ej
 i3j/+cGwRp1js5Vi+PWvKqx/KmgYzQMLKE1707wHDQV2P0zVvmZFYOdEJjxwIWB659G9vmA87gw
 CFktSqZ6XnayZ0C5+lyk7Kz/NRiNEzEMNhrSk6W7T9kpq+T1s7H8bdBM6ExEq9nLiTG6A56R7P4
 coNkwYpMgZjmIcXd1NjouMUOfq5idlunadDHPt0xvCSCNiTlMzg48nLFILHoBMqQmwDU+KGYUn/
 heh6ET8TW3jWOprhuKlQzzPMHeybfJFMXFuw3EEg4zpe3cXBpBU6In8dcFxg9ptkz/wa7RuhUJt
 wIT0F7BLYAaAlGslu3ARk1WGBlRTstea5Uu+JP85+5MlE61CeISacBqkizFZIM=
X-Authority-Info-Out: v=2.4 cv=aKP9aL9m c=1 sm=1 tr=0 ts=6a624f33
 cx=c_apl:c_pps:t_out a=qkKslKyYc0ctBTeLUVfTFg==:117 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=dzyXNlhAHSGWGBFdTecA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10

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
Changes in v5:
 - Reversed logic in hp_wmi_get_mux_supported_modes for better readability.

Changes in v4:
 - Removed empty lines between function calls and error handling.

Changes in v3:
 - Rebased for the for-next branch (no functional changes).

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
 drivers/platform/x86/hp/hp-wmi.c | 132 +++++++++++++++++++++++++++++++
 1 file changed, 132 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 5353d997d272..4504e9dc2e4a 100644
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
@@ -58,6 +60,12 @@ enum hp_ec_offsets {
 #define HP_FAN_SPEED_AUTOMATIC	 0x00
 #define HP_POWER_LIMIT_DEFAULT	 0x00
 #define HP_POWER_LIMIT_NO_CHANGE 0xFF
+#define HPWMI_MUX_MODE_UMA		BIT(0)
+#define HPWMI_MUX_MODE_HYBRID		BIT(1)
+#define HPWMI_MUX_MODE_DISCRETE		BIT(2)
+#define HPWMI_MUX_MODE_OPTIMUS		BIT(3)
+#define HPWMI_MUX_MODE_MASK		GENMASK(6, 0)
+#define HPWMI_MUX_LEGACY_MASK		(HPWMI_MUX_MODE_HYBRID | HPWMI_MUX_MODE_DISCRETE)
 
 #define zero_if_sup(tmp) (zero_insize_support?0:sizeof(tmp)) // use when zero insize is required
 
@@ -381,6 +389,7 @@ enum hp_wmi_commandtype {
 	HPWMI_POSTCODEERROR_QUERY	= 0x2a,
 	HPWMI_SYSTEM_DEVICE_MODE	= 0x40,
 	HPWMI_THERMAL_PROFILE_QUERY	= 0x4c,
+	HPWMI_GRAPHICS_MUX_QUERY	= 0x52,
 };
 
 struct victus_power_limits {
@@ -1171,12 +1180,134 @@ static int camera_shutter_input_setup(void)
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
+	if (ret < 0)
+		return ret;
+	if (ret > 0)
+		return -EINVAL;
+
+	*supported = HPWMI_MUX_LEGACY_MASK;
+	return 0;
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
+	if (ret < 0)
+		return ret;
+	if (ret > 0)
+		return -EINVAL;
+
+	/* Mask the highest bit, which might be used as a BIOS status flag */
+	*mode = buffer[0] & HPWMI_MUX_MODE_MASK;
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
@@ -1185,6 +1316,7 @@ static struct attribute *hp_wmi_attrs[] = {
 	&dev_attr_dock.attr,
 	&dev_attr_tablet.attr,
 	&dev_attr_postcode.attr,
+	&dev_attr_gpu_mux_mode.attr,
 	NULL,
 };
 ATTRIBUTE_GROUPS(hp_wmi);
-- 
2.55.0


Received: from outbound.st.icloud.com (st-2003k-snip4-8.eps.apple.com [57.103.77.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738CF39FD4
	for <platform-driver-x86@vger.kernel.org>; Sat, 11 Jul 2026 00:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.77.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783729066; cv=none; b=eAJ4KUNwX/HXmJZPs5QBu8NSep5trLnEPzcUPMaVIg3VCUfL4pyIUVTezbIJXtmqQ4JRTtzaagcE/HF54h+7A3TICoYchNknbECXJQ4ki/5ZRJP/iXFV0RmE0qEd/L1cP3Mx92Nmaie/Un9nVEWCml2ubCiZOYoEo4XFyi4yI5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783729066; c=relaxed/simple;
	bh=M8XXyBoUlD0PgivYsGBPxoGb5sWHuXZII69qZuzTqF4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CKr/ivQmwf5+u3ZVhH4YEAhpCTK0OoPGArmijz8a3albYJzHl53GdVlYsRrc/B+feDin15UpMHEcj7J46EBu8gfuzodTNwMDDGtclQimFx2pAZMNEWn6dFVSbwL5iI2qirHhQJlacmEz/hEYugl3nBg0s48FTYxJ4E6gIB+K7AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kursatabayli.dev; spf=pass smtp.mailfrom=kursatabayli.dev; dkim=pass (2048-bit key) header.d=kursatabayli.dev header.i=@kursatabayli.dev header.b=Awd7KBd8; arc=none smtp.client-ip=57.103.77.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kursatabayli.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kursatabayli.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kursatabayli.dev header.i=@kursatabayli.dev header.b="Awd7KBd8"
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-6 (Postfix) with ESMTPS id D6F10180029C;
	Sat, 11 Jul 2026 00:17:42 +0000 (UTC)
X-ICL-RepId: 019f4e89-83ba-7a08-8c97-653676fcec56
X-ICL-Out-Info: HUtFAUMHWwJACUgATUQeDx5WFlZNRAJCTQhBBkMGXAZeCEAFQwVYA1BcHA4FUgdeH3kTRh9ECkYRWxlKAV5FVhVPWFUJCgBHAkoZRwxVCkscUFZXCEFLQBMETRMFUgddTVYNRw9YHlwUFwtHQ14IXh9MHB0OWAYSAE0KDjYGWQVeCVYDQwU2EhRdRVgYRRhTBFgaUhRbAhwUXA4TAF4PD0wLSAFbB1wDQQlIAloFWBxBDUoEVBpaHxhcFF8CdwBHAkoZRwxVCkscUFZXCEFVEgRACFZQVB5BBFYVbAlYBlMZVw==
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kursatabayli.dev; s=sig1; t=1783729063; x=1786321063; bh=G7QYFNxWKTWdAyqN98/PImTZ6kC1KhYj5rz19O3B/UM=; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:x-icloud-hme; b=Awd7KBd84FrkWj8EVnBjrJ0jAzkPlOtndZD8a64aWNYsOmk9G902UCgM4nMTo6s0m5PiGBlVfOiyLqmn92AkcGMDNV8LDWVA++2VOlee//roccV9TGS6gPI2s1f044Q6nVmqWX8LjzlT+fMzlRGMrR2kdR2fYi8dABrZAEf6Tz+1tso9dXbd9/s3RuG94BNrewOR1R4exk9ddNKsRpzBwnNlb+mi8Q2iehaousPgYXhIR1kpdHgSKqbf2wjVj1EGOOUZA2AeIoQWeQ0JOB2/fj8ZJAtgIGu5sNgasWGE/8pO4McvvqKAm/k5igCjJBwU9gUId3LLzp+AjAw347AIVA==
mail-alias-created-date: 1779124395950
Received: from hp (unknown [17.42.251.67])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-6 (Postfix) with ESMTPSA id 87619180029E;
	Sat, 11 Jul 2026 00:17:41 +0000 (UTC)
From: =?UTF-8?q?K=C3=BCr=C5=9Fat=20Abayl=C4=B1?= <hello@kursatabayli.dev>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?K=C3=BCr=C5=9Fat=20Abayl=C4=B1?= <hello@kursatabayli.dev>
Subject: [PATCH v4] platform/x86: hp-wmi: Add GPU MUX switch support
Date: Sat, 11 Jul 2026 03:17:23 +0300
Message-ID: <20260711001723.14279-1-hello@kursatabayli.dev>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzExMDAwMCBTYWx0ZWRfX9kJJtnmuhE6K
 2nlo2T/ThMUCeUXeKZQzFYTbUHZpqCSvx+DJw9d4vuzUalq2B7cqy5l+l9W1bq7v9Qh92NjP7I9
 MUvwCXe3DLdFKAcrFv1ttf6Tdxetznaj3ivXId6XMSOETPnqOQRNsDMg4Ff29/20oE7lsSApfZY
 vaEmATpPW+g49Rh7DbyPsL4ohV1XCvUDKUnx0VEMisdg842ZU7vUjnOEcYFLG+LncT/CM1TDov6
 41mlbI6yIIGOnNf12V5kc9t5K3GuKIv6wf5RvkN6DOQHLlU24G0Zrn10vZGrUV//56Ix3at+iBR
 rFc1GoFe3Rp15uBOVUU
X-Proofpoint-ORIG-GUID: YcgVrSpUkq47coQUxLcbE4XlwFyLj3oj
X-Proofpoint-GUID: YcgVrSpUkq47coQUxLcbE4XlwFyLj3oj

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
 drivers/platform/x86/hp/hp-wmi.c | 134 +++++++++++++++++++++++++++++++
 1 file changed, 134 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 34c9b941bdd8..b5486caaec8a 100644
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
@@ -1173,12 +1182,136 @@ static int camera_shutter_input_setup(void)
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
@@ -1187,6 +1320,7 @@ static struct attribute *hp_wmi_attrs[] = {
 	&dev_attr_dock.attr,
 	&dev_attr_tablet.attr,
 	&dev_attr_postcode.attr,
+	&dev_attr_gpu_mux_mode.attr,
 	NULL,
 };
 ATTRIBUTE_GROUPS(hp_wmi);
-- 
2.55.0


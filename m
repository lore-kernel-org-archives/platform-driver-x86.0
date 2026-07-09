Received: from outbound.mr.icloud.com (mr-2006j-snip4-11.eps.apple.com [57.103.70.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD0A4499AA
	for <platform-driver-x86@vger.kernel.org>; Thu,  9 Jul 2026 22:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.70.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783634751; cv=none; b=c47ze64g2sKYZD5ZRu98KJLj41+aUimzFvkNfAZ6nU2eg1jHfpGutjMvEMiEjUaGWfglADIyCmctxi9gYW9zpubhoHOtqh3E1IqQQ24DNYkBBBG2VkVuYovCwWUthWEK8+9WYy3/Apsaf1mRCrHDom5bTlZySNyY8DHDnT/TDgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783634751; c=relaxed/simple;
	bh=+QVHjnyy0E01wVD+6BbGlR62S95kRpQROGwoo7iskRE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BPvXc9d8+ZwZbIVlw4NLkokKmfzK9ZMvAHP3S9gsG2sNW7kzXKB4Ry0GbhWoJb0uBM0HZ6coN0NN5xaajxV8rHbWCtL0fGQTrtkGBJeVHN/hP5xGb8awKJmLZPsIJUoar49jW6oynCbvq/JrsLxOK1PB2mmGXmjHZrr7p93hZ7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kursatabayli.dev; spf=pass smtp.mailfrom=kursatabayli.dev; dkim=pass (2048-bit key) header.d=kursatabayli.dev header.i=@kursatabayli.dev header.b=ODPFcGFs; arc=none smtp.client-ip=57.103.70.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kursatabayli.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kursatabayli.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kursatabayli.dev header.i=@kursatabayli.dev header.b="ODPFcGFs"
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-100-percent-2 (Postfix) with ESMTPS id F3EC91800468;
	Thu, 09 Jul 2026 22:05:45 +0000 (UTC)
X-ICL-RepId: 019f48ea-59dc-722d-81e2-39f16a04af06
X-ICL-Out-Info: HUtFAUMHWwJACUgATUQeDx5WFlZNRAJCTQhBBkMGXAZeCEAHQwZcBlBcHA4FUgdeH3kTRh9ECkYRWxlKAV5FVhVPWFUJCgBHAkoZRwxVCkscUFZXCEFLQBMETRMFUgddTVYNRw9YHlwUFxVBQ14IXh9MHB0OWAYSAE0KDjYGWQVeCVYDQwU2EhRdRVgYRRhTBFgaUhRbAhwUXA4TAF4PD0wLSAFbB1wCSQtKA1gGWRxCCU4CVBpaHxhcFF8CdwBHAkoZRwxVCkscUFZXCEFVEgRACFZQVB5BBFYVbAlYBlMZVw==
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kursatabayli.dev; s=sig1; t=1783634748; x=1786226748; bh=U/QnpNcuzc2iA8GgG+8oREZ1YmV/UBPemasgfqcXO2c=; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:x-icloud-hme; b=ODPFcGFs3ef+p6yBJXnrGXiKPKRCJNGB6bFo2u8vq8vMJR0hIYEMLJgf4jYNG95NGQama9Q554iPdhMQXx8o2Ow/qcxo4638uIbH0r45AtvwPG4PNDjZtjnilES8bxO/Ggvjzn8XrLZbVxM8CbNhgCLY6k3lt4QCT9zYY94wvTHqBS+fI4Q1SsD91ukK6axR2BcylGgJnpMtC/q+R0FO/5ANJztxOyDj/CoE6CHzJSSfAVKXiv4MFZ0y2Zo2WfGTiFXeKia6HK3vwBX3i8lXmKxH0PBQIA8/3JZWyHK1ya45gMnwpvrXWNbgL1sujtt1VODAugnLXCPqj0RSF2gtoA==
mail-alias-created-date: 1779124395950
Received: from hp (unknown [17.57.152.38])
	by p00-icloudmta-asmtp-us-west-2a-100-percent-2 (Postfix) with ESMTPSA id 6D5981800105;
	Thu, 09 Jul 2026 22:05:43 +0000 (UTC)
From: =?UTF-8?q?K=C3=BCr=C5=9Fat=20Abayl=C4=B1?= <hello@kursatabayli.dev>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?K=C3=BCr=C5=9Fat=20Abayl=C4=B1?= <hello@kursatabayli.dev>
Subject: [PATCH v3] platform/x86: hp-wmi: Add GPU MUX switch support
Date: Fri, 10 Jul 2026 01:05:12 +0300
Message-ID: <20260709220512.20619-1-hello@kursatabayli.dev>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDIyMiBTYWx0ZWRfX3onloVGvxKId
 gW50yGOrinzLWeL6DRweeRqhNbsz9fz4SlzjBGfv5lRveBBahgnUqt//LAsEULiJ1DfklSH4NNZ
 pIx7u3MZXGUnXatTE8VIG2LUDMVsxoQ91TWULWq70F5g+KfMA6ilpgzDLSU4wRx9l9yd7RbxXGc
 +fSodOm0Bdc0//yBhoUyxteMa+w1Qz5CzwurFlklQ4SC7VVDjVM0fYZ/7hOdjqS7i/RrZUJeWxn
 wt4dT+MEc+ECqZj4Xlo1FJPvkY5PDnG195/KLbls66NvHWg/wshuDklTWmFzAOG6coi0qph7Ang
 jNlEASHDwHBdfJFTgkA
X-Proofpoint-GUID: v1ow0Pc9JA3avUQXZU0IVcahQuoj88r6
X-Proofpoint-ORIG-GUID: v1ow0Pc9JA3avUQXZU0IVcahQuoj88r6

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
 drivers/platform/x86/hp/hp-wmi.c | 137 +++++++++++++++++++++++++++++++
 1 file changed, 137 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 34c9b941bdd8..3e50eaf6570c 100644
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
@@ -1173,12 +1182,139 @@ static int camera_shutter_input_setup(void)
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
@@ -1187,6 +1323,7 @@ static struct attribute *hp_wmi_attrs[] = {
 	&dev_attr_dock.attr,
 	&dev_attr_tablet.attr,
 	&dev_attr_postcode.attr,
+	&dev_attr_gpu_mux_mode.attr,
 	NULL,
 };
 ATTRIBUTE_GROUPS(hp_wmi);
-- 
2.55.0


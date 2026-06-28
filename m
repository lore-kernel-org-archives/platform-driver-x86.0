Received: from outbound.ci.icloud.com (ci-2002g-snip4-2.eps.apple.com [57.103.88.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A1A34CDD
	for <platform-driver-x86@vger.kernel.org>; Sun, 28 Jun 2026 00:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.88.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782606200; cv=none; b=njOQ0MGzlh5p9KSXfpXGSYVt0CKIjg7tvVBsK1WW40K0sPv6ypEmSWjUjr/rEjsdHHfGtkwVrNfM3k0/aMjCtTIHfesYqmRTN9eHSKS1sPM7dONz8x1KCvTYdeGGihCEZotlVK3c/I3ZgzzUMe+sMXCy2f8m41OQox288C4W56E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782606200; c=relaxed/simple;
	bh=9yUbW+G5aW68V0pmAfBQu9nH/JCLCDbNJleHgyFdmhs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=P0MdypPq97YxD2izRZ2j3o8Fsczf+z/5SmA+8LOr2Tt3+Zy/XlQ0f02t5vx4n9bOLylcJ1qJfHXG8T7dIQDAUF7HRUMICs3OY38UpieIAUOnBN/yzV79SQ7oanS2r5P4iH3hGXLkbbPD4JvQlu+5Kpj9h5kFzfJDOSFmgl77c+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kursatabayli.dev; spf=pass smtp.mailfrom=kursatabayli.dev; dkim=pass (2048-bit key) header.d=kursatabayli.dev header.i=@kursatabayli.dev header.b=KGtxcme/; arc=none smtp.client-ip=57.103.88.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kursatabayli.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kursatabayli.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kursatabayli.dev header.i=@kursatabayli.dev header.b="KGtxcme/"
Received: from outbound.ci.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-central-1k-100-percent-5 (Postfix) with ESMTPS id 4EC2C1800151;
	Sun, 28 Jun 2026 00:23:17 +0000 (UTC)
X-ICL-RepId: 019f0b9b-f200-727b-b7cf-969d116cd951
X-ICL-Out-Info: HUtFAUMHWwJACUgATUQeDx5WFlZNRAJCTQhBBkMGXAZeCEAHQwZSBVBcHA4FUgdeH3kTRh9ECkYRWxlKAV5FVhVPWFUJCgBHAkoZRwxVCkscUFZXCEFLQBMETRMFUgddTVYNRw9YHlwUFxtaQ14IXh9MHB0OWAYSAE0KDjYGWQVeCVYDQwU2EhRdRVgYRRhTBFgaUhRbAhwUXA4TAF4PD0wLSAFbB10ASAlIAVwDXxxBCkwFVRpaHxhcFF8CdwBHAkoZRwxVCkscUFZXCEFVEgRACFZQVB5BBFYVbAlYBlMZVw==
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kursatabayli.dev; s=sig1; t=1782606198; x=1785198198; bh=/AAVVMP3U2oZh2za24ud1L3+XyPti5/lpdreBt/Dof0=; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:x-icloud-hme; b=KGtxcme/x1/7JBXoQCYvW7JKX6Bt8f+7IHsKhm95Q8+fdta+kvzJMzAv8lsm1CyI3TN2RtIlQb8ERCNSImreIkct+MjIi2Xr4NrwuWCKr2S7ix8fVTdz9kJCEl4HbpFRAvlRWlmKWZssM0ZmZisqRnrfI4lPPXED6YKlrqXcvDOlmW7+7avK8LMPQbspYFRrztwPMkAxawPWiddC+K5RswzwkFwG2FtW7qUyeipe+a1Rk0L5dO4kghEIv4X2oqDZQuXXFA9IiwblYOYmHJPsVyN6mXDzT4x83hywBMgoIlYj+dYqsN1gOH3jWXXh3JCuudg1T5o0UE9WgNxDYXxD9w==
mail-alias-created-date: 1779124395950
Received: from hp (unknown [17.57.156.36])
	by p00-icloudmta-asmtp-us-central-1k-100-percent-5 (Postfix) with ESMTPSA id CE4AC180015C;
	Sun, 28 Jun 2026 00:23:15 +0000 (UTC)
From: =?UTF-8?q?K=C3=BCr=C5=9Fat=20Abayl=C4=B1?= <hello@kursatabayli.dev>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?K=C3=BCr=C5=9Fat=20Abayl=C4=B1?= <hello@kursatabayli.dev>
Subject: [PATCH] platform/x86: hp-wmi: Add GPU MUX switch support
Date: Sun, 28 Jun 2026 03:21:44 +0300
Message-ID: <20260628002144.13468-1-hello@kursatabayli.dev>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: rSjb5ghCPNHMouNf_Azo7a7NQ_g5Zm4m
X-Proofpoint-ORIG-GUID: rSjb5ghCPNHMouNf_Azo7a7NQ_g5Zm4m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDAwMiBTYWx0ZWRfXyOxL1Sru1d/t
 w+hNf2lagLt90fzPl5CVzq+VFqkP4K5HTZJ8DVwjBt+SpBPzbTsRjUuJ8ackHvnaEe2ZmVdJxy8
 xxC/788KYwWdv+wg29wRCDdEWMiPT165Km7bwUnbdMRZypqrLV7+9ga+J/3WJ8fTROOJWit0WSw
 nLBnfNGnBcBPEf3Fkz2HoqT4TxHlWHI+H13wbUSSnpyMSDcGf9lxzlalsoxePUy3aKmJwkdvVHU
 7R7+oarGegj6xzCS343EAIquPvcJB+OwobzzydKrRFYGLhM59c0gfUbZTqXw/QY+vWGvs5CNE1T
 IcKCIlTF7Wio0ahkgWB

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

The patch relies on the zero_if_sup() macro to handle input size
requirements safely across different BIOS implementations and uses
standard error handling paths.

Signed-off-by: Kürşat Abaylı <hello@kursatabayli.dev>
---
 drivers/platform/x86/hp/hp-wmi.c | 128 +++++++++++++++++++++++++++++++
 1 file changed, 128 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 8ba286ed8721..256e37d91767 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -14,6 +14,7 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/acpi.h>
+#include <linux/bits.h>
 #include <linux/cleanup.h>
 #include <linux/compiler_attributes.h>
 #include <linux/dmi.h>
@@ -58,6 +59,8 @@ enum hp_ec_offsets {
 #define HP_FAN_SPEED_AUTOMATIC	 0x00
 #define HP_POWER_LIMIT_DEFAULT	 0x00
 #define HP_POWER_LIMIT_NO_CHANGE 0xFF
+#define HPWMI_MUX_MODE_MASK 0x7F
+#define HPWMI_MUX_LEGACY_MASK (BIT(1) | BIT(2))
 
 #define zero_if_sup(tmp) (zero_insize_support?0:sizeof(tmp)) // use when zero insize is required
 
@@ -332,6 +335,7 @@ enum hp_wmi_commandtype {
 	HPWMI_POSTCODEERROR_QUERY	= 0x2a,
 	HPWMI_SYSTEM_DEVICE_MODE	= 0x40,
 	HPWMI_THERMAL_PROFILE_QUERY	= 0x4c,
+	HPWMI_GRAPHICS_MUX_QUERY	= 0x52,
 };
 
 struct victus_power_limits {
@@ -1124,12 +1128,135 @@ static int camera_shutter_input_setup(void)
 	return err;
 }
 
+static const u8 mux_bitmask_map[] = {
+	[0] = BIT(1), /* Hybrid */
+	[1] = BIT(2), /* Discrete */
+	[2] = BIT(3), /* Optimus */
+	[3] = BIT(0), /* UMA */
+};
+
+static int hp_wmi_get_mux_supported_modes(u8 *supported)
+{
+	u8 buffer[128] = { 0 };
+	u8 legacy_buffer[4] = { 0 };
+	u32 req_packet = 0;
+	int ret;
+
+	if (!supported)
+		return -EINVAL;
+
+	/* Try modern BIOS design data query (128-byte buffer) */
+	ret = hp_wmi_perform_query(HPWMI_GET_SYSTEM_DESIGN_DATA, HPWMI_GM,
+				   buffer, zero_if_sup(req_packet), sizeof(buffer));
+
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
+
+	if (ret == 0) {
+		*supported = HPWMI_MUX_LEGACY_MASK;
+		return 0;
+	}
+
+	return ret < 0 ? ret : -EINVAL;
+}
+
+static int hp_wmi_get_mux_mode(u8 *mode)
+{
+	u8 buffer[4] = { 0 };
+	int ret;
+
+	if (!mode)
+		return -EINVAL;
+
+	ret = hp_wmi_perform_query(HPWMI_GRAPHICS_MUX_QUERY, HPWMI_READ,
+				   buffer, sizeof(buffer), sizeof(buffer));
+
+	if (ret)
+		return ret < 0 ? ret : -EINVAL;
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
+	if (ret)
+		return ret < 0 ? ret : -EINVAL;
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
+	ret = hp_wmi_set_mux_mode((u8)requested);
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
@@ -1138,6 +1265,7 @@ static struct attribute *hp_wmi_attrs[] = {
 	&dev_attr_dock.attr,
 	&dev_attr_tablet.attr,
 	&dev_attr_postcode.attr,
+	&dev_attr_gpu_mux_mode.attr,
 	NULL,
 };
 ATTRIBUTE_GROUPS(hp_wmi);
-- 
2.54.0


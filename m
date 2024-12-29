Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25293800;
	Sun, 29 Dec 2024 00:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735431205; cv=none; b=qZBf6a+CDaR6eRJfx0N90ea0wDM3Ks+jmKyMWfCjokFe9JHJo3R/nYHZNfAFUSL0vwoYbxFprzyi2G8sepGh6sIqvlJky8N72uIO4LV9BkndypZJEDgVQVX0uDSLOhYMWzgRFdAEb+fMNUlOdBOqbbAuU2wD5jaxqG7GhGk8uyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735431205; c=relaxed/simple;
	bh=Ob/tQYlALdYZbOQggI1F8VZS06FDV1eKyuPY0BdhzKU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=H1WnonXk5kgdnkxfvS93F870o7Fbow3MAswguCaGB7+zQHP1BdH1Xp3l/qv7cOzOZk+57GNcG3VA50loCuJAeLO1kDgbhzUGZ8WSCpqcZSBm2ev4IzGSQqsSwLQoAYFHuI90DfUplltwzJrHewZFMB+uUJ8goCRODC6D1QMXdMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=XhhEFgzU; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="XhhEFgzU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1735431194; x=1736035994; i=w_armin@gmx.de;
	bh=v/hyv3Hyf4hdz80+kLOA7ASRaDZcSbcxaRdBc2AuExM=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=XhhEFgzUi1p8/qn/96GW+HkO/7p1MyVV/Edjuz5krXxfomYERDcw1eCUcyfnk9eu
	 0JZyTgvrTaTvD/uTIicVlBeAKDD+EKIhMbgxT/XRdsujM2dJM+y97P542p47eoLdS
	 FxWEKcv94rbF8RYRqVmIUs5B6aPOhKR2LSVHUQlwTwKZPs2aE8JFYD9gqo1yOHdeA
	 ty79Ay8doCteHwjG/YjrliL5hLpFhm5UN4GOaSGZBLrxGIgYWkUEP8CgVGh/Tx7WH
	 otfBljq0n9llj5bpwJO6QACcOyobB1ixiqiM0ARZ/UUs8z9cj9oNAGI+NE+W6Yqak
	 5gFWNDRp6HDl7mU3/Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-inspiron.fritz.box ([91.14.230.110]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MoO6C-1tpmLK0Etk-00q7ho; Sun, 29 Dec 2024 01:13:14 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: jlee@suse.com,
	hridesh699@gmail.com
Cc: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH] platform/x86: acer-wmi: Add helper functions for misc gaming settings
Date: Sun, 29 Dec 2024 01:13:08 +0100
Message-Id: <20241229001308.10064-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Ir0cVzEZvJmIi6qFie172jWJRbqjJGGyEfIfO7bQqYqBnKIifoJ
 Y+vsioVMFvzCP24cdwWUYlQ6XhcWWt6oKyrmcs88RExhzPJk5yGIzGXY4wnswhESCigPVds
 8nCMpIq5ksg7kUjeQauXVPVLNs+lJB0iEboQ8IvXJUqD3csXlAk7qSy0BaKaaPGyv0l2KHq
 PXlDKEacpozIMpl4IezHA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:kGAcRwGb0sQ=;3rOZcVT6NxMNels+4XBPY68+SnO
 jl5lyiklMW3h6/7raDh6JCigP8eleACDb07sMhsxAvkjB6jDNltCPDN0OiXPhhm4WLLwI31Mp
 pV1kskWASU8oYo5Te8f5IRv1l9G/7oe4f53+q6myaYGa8Ix6SaodMTj2YgGJTlmndoEmioov/
 u7Ol1y590rJhKn5hpgSYaPYJMNMHM02O4lWLlth14E33jvB2dFgt0mJIkuZrZJF9QZ4Hrb+jw
 PYbwYX/pkVHqWUWrv6iH0Ggkm7Kna20/wX73TLznpAVSYvI0rXN1A8JngBtTafo33rxAI+a3G
 SfQvv6J4trd/fTQ9j+LahgSp+XjLv88EpgFFoU1kixMZzLhhacjsC56KZkr4bI4nt3arslvN2
 2CpHNJcGVa6Jk1g+6p/rRdokiV9xt4Vnttl8wRCx5e+5A3ccU1ing9T3dAfnxltAmoo2eC2iH
 ebEf3Pmd9QAT1q/bv/pYbbYiDGS2Fjg2AXWQ3enNRMgcNItAf9BurV3fnRwdT3/pEWc1a86+4
 cLX2JOIJFP3Xv4DOiR8n+w5SNA4D1ROr6buzD+9qS+esy9VJ+hk6q7o0jjRLb1SYjUzOgppLs
 ULxpd9BMYvJaBaocdGAwYcOTiK2zsZZXC1dvs33CYKSIjAQcT0tb9tpYfqb+1ugUd+hhZWZpv
 IoUrINzEJk7NKb/wtq5E0E38Svm6w6R12HwbZ6TPhTv6fiPhjgr5YpubGLWHsZFpV2966jg3z
 iACajzSZ6ESMh8EWbWKE7jwoVEzNogtu3TnJnHr39s7UXPHS4uFX5LysKZbkdA/7/0xJs7+SN
 qF+3an44X07+ZSNhvaLiA7yYRxlq45/hBsVzTriSEw7hZs77o/U26HYVO00UiN38tFNtid4m/
 3tLIqHgd91LIAT6od/WRZ1m3kWTs82sZUzWA/SJcCCVVEMK+qLvCAQnmM3diP959UvN7W/vr2
 IFHVpO4AuXggLBykf7NH6oYhfnUDCeCm3Cx8UV+Isl1aG72nxZhHH/+zyfPITdRZ3pTsvAzyK
 cUKXZAP55y78AobjJfeHukKEtHtTLjgfRRSFqVIgNWQTyw6tyZO1z8nX+QlWMxORw520nD4dI
 tGwELHxjlP7rnniWexCS4LX1j/abbf

When getting and setting misc gaming settings, a special protocol
needs to be observed according to the ACPI AML code.

Add helper functions for this.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
This patch is intended to be used by Hridesh to improve the platform
profile handling of the acer-wmi driver. Since he requested to work
on the final patch himself i decided to mark this patch as an RFC
since it is incomplete.
=2D--
 drivers/platform/x86/acer-wmi.c | 93 +++++++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-w=
mi.c
index b3043d78a7b3..a71fab88e8c6 100644
=2D-- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -30,6 +30,7 @@
 #include <linux/input/sparse-keymap.h>
 #include <acpi/video.h>
 #include <linux/hwmon.h>
+#include <linux/unaligned.h>
 #include <linux/units.h>
 #include <linux/bitfield.h>

@@ -68,6 +69,7 @@ MODULE_LICENSE("GPL");
 #define ACER_WMID_GET_GAMING_SYS_INFO_METHODID 5
 #define ACER_WMID_SET_GAMING_FAN_BEHAVIOR 14
 #define ACER_WMID_SET_GAMING_MISC_SETTING_METHODID 22
+#define ACER_WMID_GET_GAMING_MISC_SETTING_METHODID 23

 #define ACER_PREDATOR_V4_THERMAL_PROFILE_EC_OFFSET 0x54

@@ -76,6 +78,10 @@ MODULE_LICENSE("GPL");
 #define ACER_PREDATOR_V4_SENSOR_READING_BIT_MASK GENMASK_ULL(23, 8)
 #define ACER_PREDATOR_V4_SUPPORTED_SENSORS_BIT_MASK GENMASK_ULL(39, 24)

+#define ACER_GAMING_MISC_SETTING_STATUS_MASK GENMASK_ULL(7, 0)
+#define ACER_GAMING_MISC_SETTING_INDEX_MASK GENMASK_ULL(7, 0)
+#define ACER_GAMING_MISC_SETTING_VALUE_MASK GENMASK_ULL(15, 8)
+
 /*
  * Acer ACPI method GUIDs
  */
@@ -115,6 +121,12 @@ enum acer_wmi_predator_v4_sensor_id {
 	ACER_WMID_SENSOR_GPU_TEMPERATURE	=3D 0x0A,
 };

+enum acer_wmi_gaming_misc_setting {
+	ACER_WMID_MISC_SETTING_OC_1			=3D 0x0005,
+	ACER_WMID_MISC_SETTING_OC_2			=3D 0x0007,
+	ACER_WMID_MISC_SETTING_PLATFORM_PROFILE		=3D 0x000B,
+};
+
 static const struct key_entry acer_wmi_keymap[] __initconst =3D {
 	{KE_KEY, 0x01, {KEY_WLAN} },     /* WiFi */
 	{KE_KEY, 0x03, {KEY_WLAN} },     /* WiFi */
@@ -1477,6 +1489,45 @@ WMI_gaming_execute_u64(u32 method_id, u64 in, u64 *=
out)
 	return status;
 }

+static int WMI_gaming_execute_u32_u64(u32 method_id, u32 in, u64 *out)
+{
+	struct acpi_buffer result =3D { ACPI_ALLOCATE_BUFFER, NULL };
+	struct acpi_buffer input =3D {
+		.length =3D sizeof(in),
+		.pointer =3D &in,
+	};
+	union acpi_object *obj;
+	acpi_status status;
+	int ret =3D 0;
+
+	status =3D wmi_evaluate_method(WMID_GUID4, 0, method_id, &input, &result=
);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	obj =3D result.pointer;
+	if (obj && out) {
+		switch (obj->type) {
+		case ACPI_TYPE_INTEGER:
+			*out =3D obj->integer.value;
+			break;
+		case ACPI_TYPE_BUFFER:
+			if (obj->buffer.length < sizeof(*out))
+				ret =3D -ENOMSG;
+			else
+				*out =3D get_unaligned_le64(obj->buffer.pointer);
+
+			break;
+		default:
+			ret =3D -ENOMSG;
+			break;
+		}
+	}
+
+	kfree(obj);
+
+	return ret;
+}
+
 static acpi_status WMID_gaming_set_u64(u64 value, u32 cap)
 {
 	u32 method_id =3D 0;
@@ -1544,6 +1595,48 @@ static int WMID_gaming_get_sys_info(u32 command, u6=
4 *out)
 	return 0;
 }

+static int WMID_gaming_set_misc_setting(enum acer_wmi_gaming_misc_setting=
 setting, u8 value)
+{
+	acpi_status status;
+	u64 input =3D 0;
+	u64 result;
+
+	input |=3D FIELD_PREP(ACER_GAMING_MISC_SETTING_INDEX_MASK, setting);
+	input |=3D FIELD_PREP(ACER_GAMING_MISC_SETTING_VALUE_MASK, value);
+
+	status =3D WMI_gaming_execute_u64(ACER_WMID_SET_GAMING_MISC_SETTING_METH=
ODID, input, &result);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	/* The return status must be zero for the operation to have succeeded */
+	if (FIELD_GET(ACER_GAMING_MISC_SETTING_STATUS_MASK, result))
+		return -EIO;
+
+	return 0;
+}
+
+static int WMID_gaming_get_misc_setting(enum acer_wmi_gaming_misc_setting=
 setting, u8 *value)
+{
+	u64 input =3D 0;
+	u64 result;
+	int ret;
+
+	input |=3D FIELD_PREP(ACER_GAMING_MISC_SETTING_INDEX_MASK, setting);
+
+	ret =3D WMI_gaming_execute_u32_u64(ACER_WMID_GET_GAMING_MISC_SETTING_MET=
HODID, input,
+					 &result);
+	if (ret < 0)
+		return ret;
+
+	/* The return status must be zero for the operation to have succeeded */
+	if (FIELD_GET(ACER_GAMING_MISC_SETTING_STATUS_MASK, result))
+		return -EIO;
+
+	*value =3D FIELD_GET(ACER_GAMING_MISC_SETTING_VALUE_MASK, result);
+
+	return 0;
+}
+
 static void WMID_gaming_set_fan_mode(u8 fan_mode)
 {
 	/* fan_mode =3D 1 is used for auto, fan_mode =3D 2 used for turbo*/
=2D-
2.39.5


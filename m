Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795362178;
	b=NG3GTu07aSUoqLgIFeIMPvoYUW61WuGIMsovqOlIZ7pPIGKCXZiBoRiI9c8QmvZ1VQl0
	 SlnP7GQ33cbwanwWnX867xkeKr3nspS288WaPHzM67dvffr9Uzfvo9x1NKJhc+zObHucn
	 3q9QXC1byD2wNEKAfEf9Jqx3hZH0of+mZ4SEhw6xmOXCpNz8aJ/zf/upLIU7fBPo/IbtX
	 59BI0LIBl9iKN1Wdbk/vcouTv++bFYVXm2CWGCk17qhpRqTgJao4WyxS8hfyixOcoZANT
	 P7Ts3mC2+mwRljvvPEi/n9+YCL9YGYSADNZosAn730B5fj7KKbcbtWqLBhnPJBOMyTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795362178;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ypCcNeGsS7bqGf8CxbvFqacBlvSS93bTPpYqyUFH1Dw=;
	b=JePbJ69eoseLuraLLOq7oMH3qUUbtF81M+Iz7M8VKEmBXw9YhKNDX14y+o9EAcwqImMn
	 fridAWJeQ9X2vwWMQkajT9OVLhOSQ7D5OUOT5vdWul7dgpD+W5BgWpZT2mt5Q2G1rLP+I
	 m7VUGTpJ8F52+D+j2btiFaYs4cWFS6F3Y63Y3p3UPAhkgpp8cEgumSsLrpCdnDGBFZgml
	 PuP+mvRyrA1Xa98bFtimdCIltSVHcYOs/hf4S8CwHNOTeSelqJ9gUdxXRGfHyKiIsIpTo
	 CAsqZ4Y56ntMtk0z4mDogmFLXmOtSAKQOEkdrPgpjqK/O3Q2NC0zGQWamMfJzZoFGlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=of0k34Iw;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30DA606A320
	for <platform-driver-x86@vger.kernel.org>; Sun, 22 Nov 2026 15:42:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B30DA606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=of0k34Iw
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so18437745e9.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 22 Nov 2026 07:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795362176; x=1795966976; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ypCcNeGsS7bqGf8CxbvFqacBlvSS93bTPpYqyUFH1Dw=;
        b=of0k34IwcCcIxhutwzTbM3FmESoTXZBZau31hSjgTeQGFF8lWH1QkVxCPlJdytmBfh
         dP3YvayomNnvJd5IXPCp6EE/5vHpIcK9eAgLvB1mSiECg7XszAoZy7HZaojlykqOloVH
         8OfBo6bXEHgNtgRrnvvQEyBfndrMUUOoj3QS0tM6wcPOhiiOTGJG5T05oc8czGJkgYln
         R1dIV8U/w/53d5uOW/4zXBkE037tDo2K9aOWxeMvsqzoYyt60zZ4huh4OkMPZQGanBUN
         n1FhaFWqGPNDh+CmuTBbpg64am3r+XqSYPLrL7vb75BRQ4vadnJ9IoZsuNd0UzyXCIaE
         2Beg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795362176; x=1795966976;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ypCcNeGsS7bqGf8CxbvFqacBlvSS93bTPpYqyUFH1Dw=;
        b=e72SrCRA9QWB/pqDY3HP2gBQWCO8DGncB3SVzgD9L6JhGbxKFXXOgBMLTLF3wEHKUz
         vxx8zOZnCML6VWYnM2BNQgBAgqc7OeQF5XbUn96PE5bcaCW6DKJZ5l0CpYyihoCu7QtB
         8EpxEao6SULuIZc8eIo7ud3mKY+r9U0duMGu0VpQDnqPk0STorNNJX9Dm9hgbnD79Jxl
         RVK9XqZbiaQCS2RhB7mGI82s1lui1gbHPc6TS3xBjsDgmeDEGOfLajbI0c87vNAF+UbU
         vxlgmHX2w6NGgZSQSemvoyP8tnTzkFjMoFWVWRJ9Ukm7c4usVsG2M43HDTeAlwS38rQz
         GkjQ==
X-Forwarded-Encrypted: i=1; AL+hErFQbmWNeacSt4CilviZGY3ZknvRU2Xx15O0l8SanCFBRlBRheWpLPrpnwtK7aCnx56pTtfYW3cjtbt41nTLehK7k3qb@vger.kernel.org
X-Gm-Message-State: APuU4Z/88MZl6eR40UkRA2I+SUpi5yqwpsq7vecIPWbNUs3/5M4yYPv3
	sN9RHfS9DMezNAmLwvq3Qt+KbbL1TWQjs9Z/NwbvH3eE/nNolXJOmrve
X-Gm-Gg: AZFdTZfdC5AMC4RVaNXd/Rl6U9t5McWcFRfEkx8Lm0UEnWqGyvLMe3cTDZG61ktDNXL
	3NibXm9z1ZAOURyZrIpKLuDNQL3oPUkMd9RJGkF2JwAugQU5Gcm+xljCjk3tpDPXeizRwkgAaVU
	sluVllgsYwBz0Y/GMsfu9mFEYyxmCeMulRVt0wgSaf5SNqbKJiIoVaRM11NcIitifpdR+cDZhjV
	w9gHKpDKsEckM5ARxKUsU2WHSz2VMvYkM6+xUPBGK76NgYuK8muLj0QKWlZmKn1skdkUPzQ/98O
	yE4pFhH6SJNiYujoIM8xE03R0z/gnT/2/DuWDlp3HGQNyP++vHrJGRB5KM4J2s9U2QUsTpM9h/6
	Ben5Sie8z6G585GPta8VFJDsR3aQkH5yJe6sbc7+LjlL5MFjhd3O4efsVYNAtiIp6Q23fkDQc1k
	yE75ZmhGIvKVeDhyE+Qo/466wosj2K/Bw+fzUmaC2PSDNfFxwzYY5igO/opnP/Tx0mV+8l+nVqg
	PvH3mZAjc8qGtkLhQgYxUzY+TIh66dKqe31aDNK4SdfRsVV9HXHXdtP0FtfylwQuWQ7EVCI2rdB
	pEGddOvhSF3dFqUr1YERWiTcCaKpVvoIaxizCeuXJRwEghhB2l6Eo0hgJDb3N5KEVzED
X-Received: by 2002:a05:600c:4515:b0:4bb:6f67:ca0b with SMTP id 5b1f17b1804b1-4bb888267f4mr193297675e9.29.1795362175884;
        Sun, 22 Nov 2026 07:42:55 -0800 (PST)
Received: from Zbook (178.115.144.251.wireless.dyn.drei.com. [178.115.144.251])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b2c5sm278469065e9.5.2026.11.22.07.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:42:55 -0800 (PST)
From: =?UTF-8?q?Hasan-H=C3=BCseyin=20Kayisci?= <kayiscihasan@gmail.com>
To: kayiscihasan@gmail.com,
	platform-driver-x86@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH 1/2] platform/x86: hp-wmi: Add fan speed readout for ZBook Studio G8
Date: Sun, 22 Nov 2026 16:42:24 +0100
Message-ID: <20261122154225.61211-2-kayiscihasan@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261122154225.61211-1-kayiscihasan@gmail.com>
References: <20261122154225.61211-1-kayiscihasan@gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The HP ZBook Studio G8 (board 8873) doesn't support the gaming notebook
fan WMI commands, so the hwmon device registered by hp-wmi exposes no
fan speed at all, only a pwm1_enable attribute that fails with -EINVAL.

Its firmware does report fan tachometer readings through the thermal
status query (0x28, page 0x07), which returns a 16-bit tachometer period
for each fan starting at byte 2. Convert the period to RPM the same way
the firmware's own \_TZ.GFRM method does.

Byte 0 of the reply is the index of the last fan with a non-zero
reading rather than a fan count, so take the fan count from the board
data instead. The firmware rejects the query unless the input size is
exactly 4 bytes.

Add a fan_count field to the fan profile parameters so boards can
provide a static fan count, and only treat a board as supporting manual
fan control when it also has a fan table, which this board doesn't.

Tested on a ZBook Studio G8 with BIOS T92 01.25.00: fan1_input and
fan2_input match the values from the EC tachometer registers.

This patch was written with the help of an AI coding assistant (Claude
Opus 5.5, via Claude Code), which disassembled the DSDT, probed the
firmware interfaces, and drafted the code and this changelog. All of it
was reviewed and tested on hardware by the submitter.

Signed-off-by: Hasan-Hüseyin Kayisci <kayiscihasan@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 96 +++++++++++++++++++++++++++-----
 1 file changed, 82 insertions(+), 14 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 0069af868..c4896435c 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -39,6 +39,7 @@
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/types.h>
+#include <linux/unaligned.h>
 #include <linux/workqueue.h>
 
 #include <acpi/battery.h>
@@ -148,6 +149,8 @@ static const struct thermal_profile_params omen_v1_no_ec_thermal_params = {
 
 struct hp_wmi_fan_profile_params {
 	int (*get_fan_speed)(int fan);
+	/* Number of fans, 0 to query it with HPWMI_FAN_COUNT_GET_QUERY */
+	int fan_count;
 	bool fan_table;
 };
 
@@ -183,6 +186,21 @@ static const struct hp_wmi_board_params omen_v1_no_ec_board_params = {
 	.fan_profile		= &victus_s_fan_profile_params,
 };
 
+static int hp_wmi_get_fan_speed_thermal_status(int fan);
+
+/*
+ * Business notebooks (e.g. ZBook) without the gaming fan commands, which
+ * report fan tachometer readings through the thermal status query.
+ */
+static const struct hp_wmi_fan_profile_params thermal_status_fan_profile_params = {
+	.get_fan_speed	= hp_wmi_get_fan_speed_thermal_status,
+	.fan_count	= 2,
+};
+
+static const struct hp_wmi_board_params thermal_status_board_params = {
+	.fan_profile		= &thermal_status_fan_profile_params,
+};
+
 static const struct hp_wmi_board_params *active_board_params;
 
 static const struct thermal_profile_params *hp_wmi_thermal_profile(void)
@@ -243,8 +261,13 @@ static const char * const victus_thermal_profile_boards[] = {
 	"8A26",
 };
 
-/* DMI board-specific feature data for Omen and Victus laptops. */
+/* DMI board-specific feature data for Omen, Victus and ZBook laptops. */
 static const struct dmi_system_id hp_wmi_feature_boards[] __initconst = {
+	{
+		/* HP ZBook Studio 15.6 inch G8 Mobile Workstation PC */
+		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8873") },
+		.driver_data = (void *)&thermal_status_board_params,
+	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8902") },
 		.driver_data = (void *)&omen_v1_legacy_board_params,
@@ -437,6 +460,7 @@ enum hp_wmi_commandtype {
 	HPWMI_HOTKEY_QUERY		= 0x0c,
 	HPWMI_FEATURE2_QUERY		= 0x0d,
 	HPWMI_WIRELESS2_QUERY		= 0x1b,
+	HPWMI_THERMAL_STATUS_QUERY	= 0x28,
 	HPWMI_POSTCODEERROR_QUERY	= 0x2a,
 	HPWMI_BATTERY_CHARGE_MODE	= 0x2b,
 	HPWMI_SYSTEM_DEVICE_MODE	= 0x40,
@@ -856,6 +880,43 @@ static int hp_wmi_get_fan_speed_victus_s(int fan)
 	return fan_data[fan] * 100;
 }
 
+/*
+ * Thermal status query, fan tachometer page. The output holds a 16-bit
+ * tachometer period per fan starting at byte 2. Byte 0 is the index of the
+ * last fan with a non-zero reading, so it can't be used as the fan count.
+ * The period is converted to RPM the same way the firmware does in its own
+ * \_TZ fan speed methods.
+ */
+#define HP_THERMAL_STATUS_FAN_TACH	0x07
+#define HP_THERMAL_STATUS_TACH_OFFSET	2
+#define HP_THERMAL_STATUS_MAX_FANS	2
+#define HP_FAN_TACH_PERIOD_TO_RPM	0x3c000
+
+static int hp_wmi_get_fan_speed_thermal_status(int fan)
+{
+	u8 data[128] = { HP_THERMAL_STATUS_FAN_TACH };
+	int ret, offset;
+	u16 period;
+
+	if (fan < 0 || fan >= HP_THERMAL_STATUS_MAX_FANS)
+		return -EINVAL;
+
+	/* The firmware rejects any input size other than 4 bytes */
+	ret = hp_wmi_perform_query(HPWMI_THERMAL_STATUS_QUERY, HPWMI_READ,
+				   data, sizeof(u32), sizeof(data));
+	if (ret)
+		return ret < 0 ? ret : -EINVAL;
+
+	offset = HP_THERMAL_STATUS_TACH_OFFSET + fan * sizeof(period);
+	period = get_unaligned_le16(&data[offset]);
+
+	/* A stopped fan reports an empty period */
+	if (!period)
+		return 0;
+
+	return DIV_ROUND_CLOSEST(HP_FAN_TACH_PERIOD_TO_RPM, period);
+}
+
 static int hp_wmi_read_int(int query)
 {
 	int val = 0, ret;
@@ -2271,7 +2332,7 @@ static bool hp_wmi_fan_control_supported(void)
 {
 	const struct hp_wmi_fan_profile_params *params = hp_wmi_fan_profile();
 
-	return params && params->get_fan_speed;
+	return params && params->get_fan_speed && params->fan_table;
 }
 
 static bool hp_wmi_fan_table_supported(void)
@@ -2291,6 +2352,16 @@ static int hp_wmi_get_active_fan_speed(int fan)
 	return params->get_fan_speed(fan);
 }
 
+static int hp_wmi_read_fan_speed(int fan)
+{
+	const struct hp_wmi_fan_profile_params *params = hp_wmi_fan_profile();
+
+	if (params && params->get_fan_speed)
+		return params->get_fan_speed(fan);
+
+	return hp_wmi_get_fan_speed(fan);
+}
+
 static int victus_s_gpu_thermal_profile_get(bool *ctgp_enable,
 					    bool *ppab_enable,
 					    u8 *dstate,
@@ -2963,13 +3034,8 @@ static umode_t hp_wmi_hwmon_is_visible(const void *data,
 	case hwmon_fan:
 		if (priv->fan_count <= 0)
 			return 0;
-		if (hp_wmi_fan_control_supported()) {
-			if (hp_wmi_get_active_fan_speed(channel) >= 0)
-				return 0444;
-		} else {
-			if (hp_wmi_get_fan_speed(channel) >= 0)
-				return 0444;
-		}
+		if (hp_wmi_read_fan_speed(channel) >= 0)
+			return 0444;
 		break;
 	default:
 		return 0;
@@ -2988,10 +3054,7 @@ static int hp_wmi_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
 	priv = dev_get_drvdata(dev);
 	switch (type) {
 	case hwmon_fan:
-		if (hp_wmi_fan_control_supported())
-			ret = hp_wmi_get_active_fan_speed(channel);
-		else
-			ret = hp_wmi_get_fan_speed(channel);
+		ret = hp_wmi_read_fan_speed(channel);
 		if (ret < 0)
 			return ret;
 		*val = ret;
@@ -3122,6 +3185,7 @@ static void hp_wmi_hwmon_keep_alive_handler(struct work_struct *work)
 
 static int hp_wmi_setup_fan_settings(struct hp_wmi_hwmon_priv *priv)
 {
+	const struct hp_wmi_fan_profile_params *params;
 	u8 fan_data[128] = { 0 };
 	struct victus_s_fan_table *fan_table;
 	u8 min_rpm, max_rpm;
@@ -3131,7 +3195,11 @@ static int hp_wmi_setup_fan_settings(struct hp_wmi_hwmon_priv *priv)
 
 	/* Default behaviour on hwmon init is automatic mode */
 	priv->mode = PWM_MODE_AUTO;
-	priv->fan_count = hp_wmi_get_fan_count_userdefine_trigger();
+	params = hp_wmi_fan_profile();
+	if (params && params->fan_count)
+		priv->fan_count = params->fan_count;
+	else
+		priv->fan_count = hp_wmi_get_fan_count_userdefine_trigger();
 
 	/* Bypass devices without fan control support. */
 	if (!hp_wmi_fan_table_supported())

base-commit: 9c82959c37bf69c2ace8a0f975cf2129ec1fd982
-- 
2.56.1


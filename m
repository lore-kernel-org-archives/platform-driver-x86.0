Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795271532;
	b=ZQxrif4jom/PJG5ImD7jOMakqFyYDMdwt++Wio9CnVchAs1+0VlMI7JIJG+QJaYn8kRA
	 AMZZpiIpQKOR2rDwRZU4303CM5ub4xFHVtcRbGFxrGB3RwekoTQ1iPlDveYuzycVLoUpI
	 1Pb0+kH7iXs4aW87ZM/Fj/RdnEatJLcM1euSN6YGlhIbaEq1Vu2NsR6ihWg0O5Qz1aDCH
	 jXE2ipQneLJXTM1lMFF0KHVClS0JPNL8FGo8aTNOFkWD5RsrcylC2cj3epW5UfUQuXOWm
	 JVgWSUUKO122QHoaEcysdnPxo+Q9PZIZ8vxNCmxiGDbJyZVzFmZuWa6fzpoZjf2dElQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795271532;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=1E7kAF5/dFESeUun+gH9niuyE7soc5wv4xkKkZEPwpU=;
	b=rJF2gK2OHsYBE6YQL/giRhxoiIRBe4yaw1qYW5C9MAB1/Uha+4MlsrnKmpFkpZaJoETu
	 eAf+3ryiBPYIvwSW+7bOmlft7dNkZaz+JXdXhiq9sGS3+jwa9UeEtkhJ1mLIOZa8FFEXi
	 yNFc0i0Bui4hJVaAriPUOEbUywCW3FoDKN2LrYaHD0pwXJ1zeAqIDdHUSg+zOyidd5oO2
	 fva0G2+OtOXkBW9MvEzg2OI345kWB5U/dxE7fbc9DMXBXCg/N2/aGlR4lAeuLabCOj7B/
	 15trQlRpS0By0rL2JYqauwU8bgMZWmj4Oo36q9CzILRqw6zoeCEkOy4imcW9UDT4szQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="e//cDxT+";
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843F4606A32A
	for <platform-driver-x86@vger.kernel.org>; Sat, 21 Nov 2026 14:32:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 843F4606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e//cDxT+
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so15948295e9.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 21 Nov 2026 06:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795271531; x=1795876331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1E7kAF5/dFESeUun+gH9niuyE7soc5wv4xkKkZEPwpU=;
        b=e//cDxT+0HzXsYFWra+iEspFsM2yk7+fyDypY3KOi5OBlQFllD7JXBVR8ylX8WIq39
         fOb21gIXF+fA7EJOnOeUQDj9QU8medaJbzNJ9SXGtX+0G4xSiDqYPytmAbewp2krpB6p
         DZEtsHObdJvNA2Kipl1uw8sF4xpSt7JbYp/Quuaq5jvNFbeRAB6D2i2sDwmgtmDTbodp
         QLhjZ2e/NM3ieBR5jKvAo6QW82fuQQCH0smzydPQDwCv4v66f69lQXKUjhhKkOo1fP6s
         GaOq5sm0fLC5R1GbBz9LfBxuXolceXHDmk+WqAMzckiymZCR36cf5lHWsQins2/jDBu1
         I4Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795271531; x=1795876331;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1E7kAF5/dFESeUun+gH9niuyE7soc5wv4xkKkZEPwpU=;
        b=MBmvi9DWeW0aeEjZi2+h0EAh5av2RacZLPdetri7y+CXNq9T/lDiWoxItstsa+RaXg
         RjKRflFCRzfrtVcIlzcqlsIWCC/gKdLmbCKmbpyFTdBDKnHCDekXTHvRsW2BQA4hD/n/
         Qolkd2u32YqxIxdhX5Ll9MfvCi3uoAvMFf3X823iEiYDGOfADIWXOpFDOnr/g2ptRbHG
         T1/65R7Eln3ER4gy7E6L/IJ07AEGs6URFVIDMCjROTmBisPx6hRTgP8jexasX49X0pA/
         F791F2xq7Gvv7wgy7Oa8cuZzrTEoeS21DMIxUZ6SczuBFuRafFoGvch8EmJrMOthmMVd
         pejA==
X-Gm-Message-State: APuU4Z84y2sypnndOYNgCvJNEhkCzTzf68HN6ENi18+FfyWYwfKM6Mhz
	N3e0ykzl2sOGdkTG7mHAIdCm7Ptts8Kt5frOC13Yz3KMrOUgnOGeRUCl
X-Gm-Gg: AZFdTZdsLf9MP59UJVRKQKVRkbgb/FdGrq84TdUY77IBiLKVFPk18pPmyv11XUMtsNu
	fmvebEDnTjGHwAFfdKe9CE9i0FWGW298Hp1kbcozun9iHEPCYbgtlNUTX9daUyG3NnuvRQbAwtM
	F4NBUA8DWIKn6HmYEquQJxacM5yYKO7e7xOujRCwsNiJcuVTfaStKAcSN9dr/UPvG5gUC+8Usr1
	Rzin890MNALlCuavSDwHld0g0t2onLZCUYaiVEja7Vx1bkHmGUGm6tJ0JWyQFP18hucTOOC9k7p
	WVgLnDJ6teqgfXq1cJZgUgUIDlszFxb1/loNo80AkWCr4pnj9J/acvree2VjpdiC6PP9ecr9s4j
	PzuLYxtuvP+wSJ8l20s9B+TlG8GAFILMoGE54WH0Y8bqw2C8Oto/RZbrlUloc/XBELt/drlC9bT
	RETHmewa6I3DdM0Nb7K8aZo13yENAuabxA196coaQzSOYEjtGX/el+x6yKCzPpIOgG51xI+q5Ie
	3GTngHntnBcPUuFKkqTdM5YOnGcrXwCenrFkCASjaCGevptprfDESHUgFuzPeGX/g4yehgWLBLk
	S8x6gTu24bzxjWRJ46CpP8gYtnNNqEYtgWvSQdP0mqsKDhwislc7jawMFSW1gm8=
X-Received: by 2002:a05:600c:674f:b0:4bb:7e4e:de69 with SMTP id 5b1f17b1804b1-4bb88814c37mr143877395e9.20.1795271530692;
        Sat, 21 Nov 2026 06:32:10 -0800 (PST)
Received: from archlinux.dns.quad9.net ([41.90.173.61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a1e8bsm170389035e9.9.2026.11.21.06.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 06:32:10 -0800 (PST)
From: Keane Mbae <keanembae@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	keanehatescoding <159132270+keanehatescoding@users.noreply.github.com>
Subject: [PATCH] platform/x86: hp-wmi: skip unsupported thermal profile and fan control
Date: Sat, 21 Nov 2026 17:32:04 +0300
Message-ID: <20261121143204.35492-1-keanembae@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: keanehatescoding <159132270+keanehatescoding@users.noreply.github.com>

On some HP business laptops, such as the HP 245 14 inch G10 Notebook
PC, the generic thermal profile fallback path probes
HPWMI_THERMAL_PROFILE_QUERY (0x4c) even though the BIOS does not
support it. When the BIOS returns an error such as 0x6, hp-wmi logs:

  hp_wmi: query 0x4c returned error 0x6

and thermal_profile_setup() fails. The failure is already ignored by
hp_wmi_bios_setup(), but the warning is noisy and the probe should be
quiet when the feature is unsupported.

Similarly, hp_wmi_hwmon_init() applies initial fan settings on systems
that report a fan count but do not support the legacy fan speed max
WMI command. On such systems this produces:

  hp-wmi hp-wmi: Failed to apply initial fan settings: -22

Add a quiet hp_wmi_perform_query() variant so unsupported thermal
profile probes do not emit warnings. If the generic thermal profile
query is not supported, skip platform profile registration.

For legacy fan control systems where the BIOS does not support the fan
speed max command, disable the fan hwmon attributes instead of warning
during initialization.

Reported-by: Keane <159132270+keanehatescoding@users.noreply.github.com>
Tested-on: HP 245 14 inch G10 Notebook PC (BIOS F.16)
Signed-off-by: Keane <159132270+keanehatescoding@users.noreply.github.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 44 ++++++++++++++++++++++++--------
 1 file changed, 34 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 52077833a..e0bb828b3 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -730,8 +730,9 @@ static inline int encode_outsize_for_pvsz(int outsize)
  *       buffer = kzalloc(128, GFP_KERNEL);
  *       ret = hp_wmi_perform_query(HPWMI_BATTERY_QUERY, HPWMI_READ, buffer, 1, 128)
  */
-static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
-				void *buffer, int insize, int outsize)
+static int __hp_wmi_perform_query(int query, enum hp_wmi_command command,
+				   void *buffer, int insize, int outsize,
+				   bool quiet)
 {
 	struct acpi_buffer input, output = { ACPI_ALLOCATE_BUFFER, NULL };
 	struct bios_return *bios_return;
@@ -772,7 +773,9 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
 
 	if (obj->type != ACPI_TYPE_BUFFER ||
 	    obj->buffer.length < sizeof(*bios_return)) {
-		pr_warn("query 0x%x returned wrong type or too small buffer\n", query);
+		if (!quiet)
+			pr_warn("query 0x%x returned wrong type or too small buffer\n",
+				query);
 		ret = -EINVAL;
 		goto out_free;
 	}
@@ -781,7 +784,8 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
 	ret = bios_return->return_code;
 
 	if (ret) {
-		if (ret != HPWMI_RET_UNKNOWN_COMMAND &&
+		if (!quiet &&
+		    ret != HPWMI_RET_UNKNOWN_COMMAND &&
 		    ret != HPWMI_RET_UNKNOWN_CMDTYPE)
 			pr_warn("query 0x%x returned error 0x%x\n", query, ret);
 		goto out_free;
@@ -801,6 +805,13 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
 	return ret;
 }
 
+static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
+				void *buffer, int insize, int outsize)
+{
+	return __hp_wmi_perform_query(query, command, buffer, insize, outsize,
+				      false);
+}
+
 /*
  * Calling this hp_wmi_get_fan_count_userdefine_trigger function also enables
  * and/or maintains the laptop in user defined thermal and fan states, instead
@@ -2760,10 +2771,15 @@ static int thermal_profile_setup(struct platform_device *device)
 
 		ops = &platform_profile_victus_s_ops;
 	} else {
-		tp = thermal_profile_get();
+		int val = 0;
 
-		if (tp < 0)
-			return tp;
+		err = __hp_wmi_perform_query(HPWMI_THERMAL_PROFILE_QUERY,
+					     HPWMI_READ, &val, zero_if_sup(val),
+					     sizeof(val), true);
+		if (err)
+			return 0;
+
+		tp = val;
 
 		/*
 		 * call thermal profile write command to ensure that the
@@ -2771,7 +2787,7 @@ static int thermal_profile_setup(struct platform_device *device)
 		 */
 		err = thermal_profile_set(tp);
 		if (err)
-			return err;
+			return 0;
 
 		ops = &hp_wmi_platform_profile_ops;
 	}
@@ -3222,8 +3238,16 @@ static int hp_wmi_hwmon_init(void)
 	}
 
 	ret = hp_wmi_apply_fan_settings(priv);
-	if (ret)
-		dev_warn(dev, "Failed to apply initial fan settings: %d\n", ret);
+	if (ret) {
+		if (!hp_wmi_fan_control_supported() && ret == -EINVAL) {
+			dev_dbg(dev,
+				"Fan control not supported by BIOS, disabling fan support\n");
+			priv->fan_count = 0;
+		} else {
+			dev_warn(dev, "Failed to apply initial fan settings: %d\n",
+				 ret);
+		}
+	}
 
 	return 0;
 }
-- 
2.56.1


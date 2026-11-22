Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795362179;
	b=3KtsjrDnG9GQwlBEX/0UCYzj54QYHI0Ql+/jkHPgu+5Fc5epWl53zQlrfKlVu4Nm4yKD
	 ueph3g/+dao2Qjrzd9fOCnV0Iwed4nJjcu39Ss1ZDDA24WC7J2LgU0zEFrUi7FP/5ISpH
	 d0l1VjkVhv5BEd7smYu32C8wWdlHc1BTLbnksNuav47972Ai5Q1ZKrfO59/QEB2iprgx8
	 CmGQoZ/0GSU1Bqs835e/8CZX3st/J6s56t/t6wvnUm1VBWjl7o5g4AyvIR87RuQDw+NzQ
	 C7rR/nE+mBXveoIA4oYZDLdAPD7/IV/0Q40+JfEVlRh/fabHuV+TwLvvIiQ7bSnU32Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795362179;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Qg4/Aednj/XG4EIdIsplSfVHGYfdioykpq0fUbEC4c4=;
	b=QIwYN7p+JY6iv570GtEdgh+3b1OJriP2df0YicRDrC/nvyG+z83Jy7j/2BC4M3dh0Den
	 5c/bkW/cXYC85jL+EDFT6O+szzYFMBiSn0l8J/JJuTAo5NS8VAoS7rMRa1ib03WnE5j64
	 BbIgkpQ+hE2DM+jvDI6McmzH6D2NWtK44MEFpJL++U+kCCKYpKWxTDr2yB5ZPgqzBVRP4
	 OVy3EWaVIZB5UAk085hKO1VDeDpU5+Hy49w1P03CIZhEz6i53gboMZvFL8ma4UoYYFv8Y
	 zeQsZo6nqlg+Gv+d771u/r7caneqCPq5mM3drGpo6A7B/YTf9j12AEcsoWxewvNeSyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yn0xwyza;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51E6606A320
	for <platform-driver-x86@vger.kernel.org>; Sun, 22 Nov 2026 15:42:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C51E6606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yn0xwyza
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so20932325e9.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 22 Nov 2026 07:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795362177; x=1795966977; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qg4/Aednj/XG4EIdIsplSfVHGYfdioykpq0fUbEC4c4=;
        b=Yn0xwyzaH00vML+x15n1390maFMo51yzPaL8K1Px6tajx6AWux6+deHyyN+PMB/LSx
         t4KO9cwu18hDj9ixdI/B6N508y6VMx480ThS8603Cy8lV8shrtcRWZLu8KZBe8QKvtGO
         0ByaHSmJijRe5CYt/5BvGcqaPeQ8FkoC3i0Sl1WqscA8kSsIl2QRE/9RKqg0WkTq2whm
         oC22Nofm11fTePCQZjuec/zJRIe7vDWmfo4mCknnyQqjGbLpXVC/vyKIulUEiCWqdIFc
         5X5Dt0xa7zqby/HnTY+wNVRdBMTs+zebwQxmVSoW9HQwuB0dLGmvzVE6SF2fgJQ4dTgs
         Zh/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795362177; x=1795966977;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qg4/Aednj/XG4EIdIsplSfVHGYfdioykpq0fUbEC4c4=;
        b=SPCjbY2Wh2tL6hberrEa9bazibOK6M9qheDlXRzsB6SoqNR8lyg3DtPcZVeNTj5qhx
         TX+wdESxJKivC3nyifBOaRuU1oBSzDghbzMDJWcoZC0E5x5IkvMj/hb7VhYCWptdnL1U
         3d7dH58XtuWZRgIs7Fsk3zAhWn6Ieaf725B9q519oIPcvBjJNYkFUJ2T4deFVUafHesd
         9qBnBAzLwfVcBHoZzmhKE3WAWxrpHtDgBpfwgNsSJ6Z70Iu/ZwUR83ikjOhDZ4s1g0Ck
         6RAtEoFVGpeyNtrCyQfjKeoxxA/lEkZkfnnOMg7ZpUR2jZnHqTfvJBjVT7qhR/Vaouc9
         epqw==
X-Forwarded-Encrypted: i=1; AL+hErEqkYEKLJnkpx99cK3jg8JGY4Xc6CQZmQ1K5F8aRdmPBE2+wsb1REGxi416CQBsn0fzJDXGXioJhTPO/PBqbNPQr4M+@vger.kernel.org
X-Gm-Message-State: APuU4Z+MET4BkJ0WEKIN9oqw6azUApVk4hZWCOSsS1+8UoCvygil98ko
	HDJhdLGuEk6ASxGF05KTCP9y/GKPYm8KzKGdFU2j1PZjRCmthYiiqxLeT/hbvkslfKS0TA==
X-Gm-Gg: AZFdTZegoJs4b45HCBtV4kRSzkU6Hve1h/0fLyJyjnZSMWxi4Dqg4Q5wx7taJrTOBrk
	exK6g+hoGqDpjh7ZV+eulDPuA7Miy5RuU/l1pJ4jJICSvBEh1T9X6a4vuu2UKccGBkq0ClrN/Cv
	dEe1XMTWvv4TCzm3B/Anmm5gH7NVdBauvAY0MLgKdZt51gGePnyDufKEqS836duVefwUf8OLlVa
	/j4dQWqBqVAc8zff90ltoUDTRCKF1nE65EyXZdnrhUqHqw8myIv3UdRaELASs+Y976ChXy8dG3I
	jcru7FZchdpmW+Z9R8F599Qh08juENxzMslr6bwGeNPkQWbf0NTyzmLwWV4eLuc3PWL1b6Wdusq
	q6bwjZhjGvB3LSY0XJuKCadvNI4PK+eEEh4zXn3hmD0yNX+TKBTxNqI8+qR3DihkSGNIH/OabSX
	SrB6aYVqsYo3DFarqz9W9zaVTfaId4a9+6wm0+pkwuy44vFriURMkO7tMVREB7F0EfglvjNwJjO
	hHOB8CC0kVdpA9FeNwoxEUVRk0Lq/cEDdqwIF8BCfTOejQ7WgYcmQLtcokLSH+6wmPD4GY0jO5K
	NxKIN2ZQmCTXbbV+jYq5tXp7ksZlDD+MSh79oj4mEfYJK0uxLV2SY/1mpryOyllvNhL/
X-Received: by 2002:a05:600c:468b:b0:4ab:cc03:7f60 with SMTP id 5b1f17b1804b1-4bb8881b511mr191548225e9.18.1795362177050;
        Sun, 22 Nov 2026 07:42:57 -0800 (PST)
Received: from Zbook (178.115.144.251.wireless.dyn.drei.com. [178.115.144.251])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b2c5sm278469065e9.5.2026.11.22.07.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:42:56 -0800 (PST)
From: =?UTF-8?q?Hasan-H=C3=BCseyin=20Kayisci?= <kayiscihasan@gmail.com>
To: kayiscihasan@gmail.com,
	platform-driver-x86@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH 2/2] platform/x86: hp-wmi: Support max fan mode on ZBook Studio G8
Date: Sun, 22 Nov 2026 16:42:25 +0100
Message-ID: <20261122154225.61211-3-kayiscihasan@gmail.com>
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

On the ZBook Studio G8 the HPWMI_FAN_SPEED_MAX_SET_QUERY command fails,
so writing pwm1_enable fails with -EINVAL and hwmon init logs "Failed
to apply initial fan settings: -22".

The EC on this board has a fan mode register at offset 0x2d, which the
DPTF IETM.IMOK method writes on Windows. The low nibble selects the mode
for the CPU fan and the high nibble for the GPU fan. Mode 0 is the
automatic fan curve and mode 1 holds the fans at the highest fixed
level the EC offers (about 4700 RPM on this machine, versus about 4100
RPM reached in automatic mode under sustained full CPU load). The EC
also accepts mode 2, a lower fixed level, which has no hwmon
equivalent and isn't exposed. Writes of other values are ignored.

Add an optional set_fan_speed_max callback to the fan profile
parameters and implement it for this board by writing the EC fan mode
register, so pwm1_enable 0 (full speed) and 2 (automatic) work. Manual
control (pwm1_enable 1) stays unsupported: the EC ignores host writes to
its fan target registers.

Tested on a ZBook Studio G8 with BIOS T92 01.25.00.

This patch was written with the help of an AI coding assistant (Claude
Opus 5.5, via Claude Code), which found the register by disassembling
the DSDT and probing the EC, and drafted the code and this changelog.
All of it was reviewed and tested on hardware by the submitter.

Signed-off-by: Hasan-Hüseyin Kayisci <kayiscihasan@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 34 ++++++++++++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index c4896435c..9e1729af4 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -63,6 +63,15 @@ enum hp_ec_offsets {
 	HP_OMEN_EC_THERMAL_PROFILE_OFFSET		= 0x95,
 };
 
+/*
+ * EC fan mode register on ZBook boards, also written by the DPTF IETM.IMOK
+ * method. Low nibble is the CPU fan, high nibble the GPU fan. 0 selects the
+ * automatic fan curve, 1 the highest fixed fan level.
+ */
+#define HP_EC_FAN_MODE_OFFSET	0x2d
+#define HP_EC_FAN_MODE_AUTO	0x00
+#define HP_EC_FAN_MODE_MAX	0x11
+
 #define HP_FAN_SPEED_AUTOMATIC	 0x00
 #define HP_POWER_LIMIT_DEFAULT	 0x00
 #define HP_POWER_LIMIT_NO_CHANGE 0xFF
@@ -151,6 +160,8 @@ struct hp_wmi_fan_profile_params {
 	int (*get_fan_speed)(int fan);
 	/* Number of fans, 0 to query it with HPWMI_FAN_COUNT_GET_QUERY */
 	int fan_count;
+	/* Optional, defaults to HPWMI_FAN_SPEED_MAX_SET_QUERY */
+	int (*set_fan_speed_max)(int enabled);
 	bool fan_table;
 };
 
@@ -187,14 +198,17 @@ static const struct hp_wmi_board_params omen_v1_no_ec_board_params = {
 };
 
 static int hp_wmi_get_fan_speed_thermal_status(int fan);
+static int hp_wmi_ec_fan_speed_max_set(int enabled);
+static const struct hp_wmi_fan_profile_params *hp_wmi_fan_profile(void);
 
 /*
  * Business notebooks (e.g. ZBook) without the gaming fan commands, which
  * report fan tachometer readings through the thermal status query.
  */
 static const struct hp_wmi_fan_profile_params thermal_status_fan_profile_params = {
-	.get_fan_speed	= hp_wmi_get_fan_speed_thermal_status,
-	.fan_count	= 2,
+	.get_fan_speed		= hp_wmi_get_fan_speed_thermal_status,
+	.fan_count		= 2,
+	.set_fan_speed_max	= hp_wmi_ec_fan_speed_max_set,
 };
 
 static const struct hp_wmi_board_params thermal_status_board_params = {
@@ -1226,10 +1240,26 @@ static int omen_thermal_profile_get(void)
 	return data;
 }
 
+static int hp_wmi_ec_fan_speed_max_set(int enabled)
+{
+	int ret;
+
+	ret = ec_write(HP_EC_FAN_MODE_OFFSET,
+		       enabled ? HP_EC_FAN_MODE_MAX : HP_EC_FAN_MODE_AUTO);
+	if (ret)
+		return ret;
+
+	return enabled;
+}
+
 static int hp_wmi_fan_speed_max_set(int enabled)
 {
+	const struct hp_wmi_fan_profile_params *params = hp_wmi_fan_profile();
 	int ret;
 
+	if (params && params->set_fan_speed_max)
+		return params->set_fan_speed_max(enabled);
+
 	ret = hp_wmi_perform_query(HPWMI_FAN_SPEED_MAX_SET_QUERY, HPWMI_GM,
 				   &enabled, sizeof(enabled), 0);
 
-- 
2.56.1


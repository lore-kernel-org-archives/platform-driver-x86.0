Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C5C3D6CDE
	for <platform-driver-x86@vger.kernel.org>; Thu,  6 Aug 2026 06:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785997174; cv=none; b=AfXMeb7Os7E5Tm8doPFIhavO0c4KMWGfutFSqOJW2eUdyvt+m6YFO+izcSAXMfaBMZ+fRyhYWeu2fPMqoNXMYx3Hs7SW9TCsCoSeiQC4xivUn4/pnsyLW/s+dbw0RRHdq0vTDB6ZGxxyVjviAcima/7xN/zUMoL1ENQOdUXgx7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785997174; c=relaxed/simple;
	bh=zjy3DM/QaBJdPB9fiA3TSFlNaHa643BeCXQOZVU9YUo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gP7Fkrh/CrJ7Os0YBCuoIl7B76WUf4UWW3Y1NgsCrAckoUT+aX1k6He2RhSrxNgZl+JMV2HY1nQRYmyMexEqFidgXuOVCWXunQmRTrzI+zjXVQhdyIfKDerCErba+1uV7X3IZNyuLxzscFLqWBPLuVOIAx6Dq2YGx1q4OIvpIgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CU63kMl5; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CU63kMl5"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c9e30214d8fso1615535a12.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 05 Aug 2026 23:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785997172; x=1786601972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=13GK/Pkt14QeRpMzLwZYpSIxC8YbzZ4AEzQYWK33yg0=;
        b=CU63kMl5L+MD4JhGFGj5PCw0CiVrhqIZGgEUDNQ4jvqFwmzfoD82ESS/KJhgcnF5cL
         PvjUVYT59ZhYJvLHGGR2Ma+JZHiYJ5NP0qE85w60vw30suB2Zs2tyJzGWE2onACPbrVZ
         XtLG99Y361IVMPtQWOu+WiixuUNu+TuTKPkLEHtKcIehiOlFPFU2DJAuMfplrzH0QV2S
         q+V35Nrn4mF0lSrxBVB7rFwtkVcFVIT097zGWJ87R21l/VDDkKEOJI3gd2bUfToYt9Gp
         SguAUGcO6jtPOtOj0OfUKN/FiWHEU91qoD1rL0ir+96M9ighE3/SV1+AN2e7yn8tDetF
         M62w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785997172; x=1786601972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=13GK/Pkt14QeRpMzLwZYpSIxC8YbzZ4AEzQYWK33yg0=;
        b=MGFVJ2k6Qw8qbq+gZpECXn/MjcOxZqEd8VFPtSPn5Ys5NX3qHizrMzYbnjC9IZ12a7
         cJw8g/pWK+yUJ14bVjkYQPWVT5q5leV60X5+wIrp1jK3LQcDOGrebRdNVwwP/jE84iD2
         BpPPoc8UTOde/hQ4l/I2Cg8VWrAbt1KGz3ZYF6SUKr0Amt0LsaPHLUDbBHF/TQ8Lf1/H
         rquqKF45i5y1BGWy+ogTILPerUtiobidrKOycJ8NA34nl/ot4Tbbs/uMk27Jlu/6ScBX
         J0Y2bzPpmxfjDIFbH1JBcjjA5znWuRCyZJ1mQAyX733ud9Causbnw72BQaDZTVBZamUy
         aKiw==
X-Forwarded-Encrypted: i=1; AHgh+RovFTVqWGlklTGnqpAF2tyqYtrIwBfIE9oI3ncnsfu1JEEUrIyoUUYHKKMJ7E4emIyfqbhqobaY9B+nsE1FMkaKRRBN@vger.kernel.org
X-Gm-Message-State: AOJu0YwpJAY+4jgH4oPTlf+0p7rwa3IBCzQqpyhOIore0Gx/f3ZzNesW
	CuklWVHrcsHw8x0PJw4JsjGdhTZV6R2Cj41xY68+mme7eodtMGxr1SlvMewJmA==
X-Gm-Gg: AR+sD13o/is3/XgeapKMik1jyn43mu0MTEQW9kKtzLE4b0wziZQPa9SXOk9xV4e03EO
	vmvf/bQushxFj1XUgRC5VMiedAPJavYuw2mfGXxPkqaXvmUvha53y8vHKzpXZOLLGXCQOAMqtLM
	HZ4QhPd+oWRhQWZhheBBP+sOpYPP9gKrbM5nis7Md4YnVw1GjgFTwuGeZGP+vc1AqOge27FVTgs
	2FXJh3fnkG8vRvU0zHJWfTJ0oPn4RWlQir55hyz1TZ7LVDoTUPcamBf3w6IS5Ao7SKQYAWVEWRg
	uCH92Vke5Xst6VN5/9nFIc4AVWjXcET6YT1qYH9pLii9jF1rZXRp79daSdUYyDMZR+BEeuDUfWP
	3PuQCtR2HGWXz7malXTLJVJ4JsTWDZvITnGeKXuEiJAIe9DKR0o4NZcgR9I6eR173DfqI8pLlwM
	Yks2+NnNTTq4YJYEoGj7Mr31xPrUxtkE9tFAf4zE+daVky5iF+/86s9EgKRguNPWRCxMlEgbRy6
	yaa/8SDWb5Bee3IB8Ba4FOHFLWt43KY4g/CZKRi37lEnItT9ZI=
X-Received: by 2002:a05:6a20:7283:b0:3c3:875d:c546 with SMTP id adf61e73a8af0-3cb85dbc639mr13789528637.7.1785997171774;
        Wed, 05 Aug 2026 23:19:31 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:d081:36b2:965:e66f])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca50acddsm21651689c88.3.2026.08.05.23.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 23:19:30 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>
Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Nitin Joshi <nitjoshi@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] platform/x86: thinkpad_acpi: convert conditional mutex locks to ACQUIRE_ERR()
Date: Wed,  5 Aug 2026 23:19:23 -0700
Message-ID: <20260806061925.625482-2-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
In-Reply-To: <20260806061925.625482-1-dmitry.torokhov@gmail.com>
References: <20260806061925.625482-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert conditional mutex_lock_killable() and mutex_lock_interruptible()
calls to ACQUIRE() and ACQUIRE_ERR() from linux/cleanup.h.

This eliminates explicit mutex_unlock() calls on return paths and
simplifies error handling across hotkey, brightness, volume, fan, and
dytc functions.

Assisted-by: Antigravity:gemini-3.6-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 153 ++++++++++----------
 1 file changed, 76 insertions(+), 77 deletions(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index beb85ea1103b..0d0d6fe7eecd 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -2671,8 +2671,10 @@ static ssize_t hotkey_mask_store(struct device *dev,
 	if (parse_strtoul(buf, 0xffffffffUL, &t))
 		return -EINVAL;
 
-	if (mutex_lock_killable(&hotkey_mutex))
-		return -ERESTARTSYS;
+	ACQUIRE(mutex_kill, guard)(&hotkey_mutex);
+	res = ACQUIRE_ERR(mutex_kill, &guard);
+	if (res)
+		return res;
 
 	res = hotkey_user_mask_set(t);
 
@@ -2680,8 +2682,6 @@ static ssize_t hotkey_mask_store(struct device *dev,
 	hotkey_poll_setup(true);
 #endif
 
-	mutex_unlock(&hotkey_mutex);
-
 	tpacpi_disclose_usertask("hotkey_mask", "set to 0x%08lx\n", t);
 
 	return (res) ? res : count;
@@ -2767,8 +2767,10 @@ static ssize_t hotkey_source_mask_store(struct device *dev,
 		((t & ~TPACPI_HKEY_NVRAM_KNOWN_MASK) != 0))
 		return -EINVAL;
 
-	if (mutex_lock_killable(&hotkey_mutex))
-		return -ERESTARTSYS;
+	ACQUIRE(mutex_kill, guard)(&hotkey_mutex);
+	rc = ACQUIRE_ERR(mutex_kill, &guard);
+	if (rc)
+		return rc;
 
 	HOTKEY_CONFIG_CRITICAL_START
 	hotkey_source_mask = t;
@@ -2782,8 +2784,6 @@ static ssize_t hotkey_source_mask_store(struct device *dev,
 	r_ev = hotkey_driver_mask & ~(hotkey_acpi_mask & hotkey_all_mask)
 		& ~hotkey_source_mask & TPACPI_HKEY_NVRAM_KNOWN_MASK;
 
-	mutex_unlock(&hotkey_mutex);
-
 	if (rc < 0)
 		pr_err("hotkey_source_mask: failed to update the firmware event mask!\n");
 
@@ -2811,18 +2811,19 @@ static ssize_t hotkey_poll_freq_store(struct device *dev,
 			    const char *buf, size_t count)
 {
 	unsigned long t;
+	int err;
 
 	if (parse_strtoul(buf, 25, &t))
 		return -EINVAL;
 
-	if (mutex_lock_killable(&hotkey_mutex))
-		return -ERESTARTSYS;
+	ACQUIRE(mutex_kill, guard)(&hotkey_mutex);
+	err = ACQUIRE_ERR(mutex_kill, &guard);
+	if (err)
+		return err;
 
 	hotkey_poll_set_freq(t);
 	hotkey_poll_setup(true);
 
-	mutex_unlock(&hotkey_mutex);
-
 	tpacpi_disclose_usertask("hotkey_poll_freq", "set to %lu\n", t);
 
 	return count;
@@ -3995,12 +3996,13 @@ static int hotkey_read(struct seq_file *m)
 		return 0;
 	}
 
-	if (mutex_lock_killable(&hotkey_mutex))
-		return -ERESTARTSYS;
+	ACQUIRE(mutex_kill, guard)(&hotkey_mutex);
+	res = ACQUIRE_ERR(mutex_kill, &guard);
+	if (res)
+		return res;
 	res = hotkey_status_get(&status);
 	if (!res)
 		res = hotkey_mask_get();
-	mutex_unlock(&hotkey_mutex);
 	if (res)
 		return res;
 
@@ -4033,8 +4035,10 @@ static int hotkey_write(char *buf)
 	if (!tp_features.hotkey)
 		return -ENODEV;
 
-	if (mutex_lock_killable(&hotkey_mutex))
-		return -ERESTARTSYS;
+	ACQUIRE(mutex_kill, guard)(&hotkey_mutex);
+	res = ACQUIRE_ERR(mutex_kill, &guard);
+	if (res)
+		return res;
 
 	mask = hotkey_user_mask;
 
@@ -4053,8 +4057,7 @@ static int hotkey_write(char *buf)
 		} else if (sscanf(cmd, "%x", &mask) == 1) {
 			/* mask set */
 		} else {
-			res = -EINVAL;
-			goto errexit;
+			return -EINVAL;
 		}
 	}
 
@@ -4064,8 +4067,6 @@ static int hotkey_write(char *buf)
 		res = hotkey_user_mask_set(mask);
 	}
 
-errexit:
-	mutex_unlock(&hotkey_mutex);
 	return res;
 }
 
@@ -6460,11 +6461,12 @@ static void tpacpi_brightness_checkpoint_nvram(void)
 	vdbg_printk(TPACPI_DBG_BRGHT,
 		"trying to checkpoint backlight level to NVRAM...\n");
 
-	if (mutex_lock_killable(&brightness_mutex) < 0)
+	ACQUIRE(mutex_kill, guard)(&brightness_mutex);
+	if (ACQUIRE_ERR(mutex_kill, &guard))
 		return;
 
 	if (unlikely(!acpi_ec_read(TP_EC_BACKLIGHT, &lec)))
-		goto unlock;
+		return;
 	lec &= TP_EC_BACKLIGHT_LVLMSK;
 	b_nvram = nvram_read_byte(TP_NVRAM_ADDR_BRIGHTNESS);
 
@@ -6482,9 +6484,6 @@ static void tpacpi_brightness_checkpoint_nvram(void)
 		vdbg_printk(TPACPI_DBG_BRGHT,
 			   "NVRAM backlight level already is %u (0x%02x)\n",
 			   (unsigned int) lec, (unsigned int) b_nvram);
-
-unlock:
-	mutex_unlock(&brightness_mutex);
 }
 
 
@@ -6562,8 +6561,9 @@ static int brightness_set(unsigned int value)
 	vdbg_printk(TPACPI_DBG_BRGHT,
 			"set backlight level to %d\n", value);
 
-	res = mutex_lock_killable(&brightness_mutex);
-	if (res < 0)
+	ACQUIRE(mutex_kill, guard)(&brightness_mutex);
+	res = ACQUIRE_ERR(mutex_kill, &guard);
+	if (res)
 		return res;
 
 	switch (brightness_mode) {
@@ -6578,7 +6578,6 @@ static int brightness_set(unsigned int value)
 		res = -ENXIO;
 	}
 
-	mutex_unlock(&brightness_mutex);
 	return res;
 }
 
@@ -6601,16 +6600,14 @@ static int brightness_get(struct backlight_device *bd)
 {
 	int status, res;
 
-	res = mutex_lock_killable(&brightness_mutex);
-	if (res < 0)
-		return 0;
+	ACQUIRE(mutex_kill, guard)(&brightness_mutex);
+	res = ACQUIRE_ERR(mutex_kill, &guard);
+	if (res)
+		return res;
 
 	res = tpacpi_brightness_get_raw(&status);
-
-	mutex_unlock(&brightness_mutex);
-
 	if (res < 0)
-		return 0;
+		return res;
 
 	return status & TP_EC_BACKLIGHT_LVLMSK;
 }
@@ -7073,11 +7070,12 @@ static void tpacpi_volume_checkpoint_nvram(void)
 	else
 		ec_mask = TP_EC_AUDIO_MUTESW_MSK | TP_EC_AUDIO_LVL_MSK;
 
-	if (mutex_lock_killable(&volume_mutex) < 0)
+	ACQUIRE(mutex_kill, guard)(&volume_mutex);
+	if (ACQUIRE_ERR(mutex_kill, &guard))
 		return;
 
 	if (unlikely(!acpi_ec_read(TP_EC_AUDIO, &lec)))
-		goto unlock;
+		return;
 	lec &= ec_mask;
 	b_nvram = nvram_read_byte(TP_NVRAM_ADDR_MIXER);
 
@@ -7094,9 +7092,6 @@ static void tpacpi_volume_checkpoint_nvram(void)
 			   "NVRAM mixer status already is 0x%02x (0x%02x)\n",
 			   (unsigned int) lec, (unsigned int) b_nvram);
 	}
-
-unlock:
-	mutex_unlock(&volume_mutex);
 }
 
 static int volume_get_status_ec(u8 *status)
@@ -7145,12 +7140,14 @@ static int __volume_set_mute_ec(const bool mute)
 	int rc;
 	u8 s, n;
 
-	if (mutex_lock_killable(&volume_mutex) < 0)
-		return -EINTR;
+	ACQUIRE(mutex_kill, guard)(&volume_mutex);
+	rc = ACQUIRE_ERR(mutex_kill, &guard);
+	if (rc)
+		return rc;
 
 	rc = volume_get_status_ec(&s);
 	if (rc)
-		goto unlock;
+		return rc;
 
 	n = (mute) ? s | TP_EC_AUDIO_MUTESW_MSK :
 		     s & ~TP_EC_AUDIO_MUTESW_MSK;
@@ -7161,8 +7158,6 @@ static int __volume_set_mute_ec(const bool mute)
 			rc = 1;
 	}
 
-unlock:
-	mutex_unlock(&volume_mutex);
 	return rc;
 }
 
@@ -7193,12 +7188,14 @@ static int __volume_set_volume_ec(const u8 vol)
 	if (vol > TP_EC_VOLUME_MAX)
 		return -EINVAL;
 
-	if (mutex_lock_killable(&volume_mutex) < 0)
-		return -EINTR;
+	ACQUIRE(mutex_kill, guard)(&volume_mutex);
+	rc = ACQUIRE_ERR(mutex_kill, &guard);
+	if (rc)
+		return rc;
 
 	rc = volume_get_status_ec(&s);
 	if (rc)
-		goto unlock;
+		return rc;
 
 	n = (s & ~TP_EC_AUDIO_LVL_MSK) | vol;
 
@@ -7208,8 +7205,6 @@ static int __volume_set_volume_ec(const u8 vol)
 			rc = 1;
 	}
 
-unlock:
-	mutex_unlock(&volume_mutex);
 	return rc;
 }
 
@@ -8113,13 +8108,14 @@ static int fan_get_status_safe(u8 *status)
 	int rc;
 	u8 s;
 
-	if (mutex_lock_killable(&fan_mutex))
-		return -ERESTARTSYS;
+	ACQUIRE(mutex_kill, guard)(&fan_mutex);
+	rc = ACQUIRE_ERR(mutex_kill, &guard);
+	if (rc)
+		return rc;
 	rc = fan_get_status(&s);
 	/* NS EC doesn't have register with level settings */
 	if (!rc && !fan_with_ns_addr)
 		fan_update_desired_level(s);
-	mutex_unlock(&fan_mutex);
 
 	if (rc)
 		return rc;
@@ -8312,8 +8308,10 @@ static int fan_set_level_safe(int level)
 	if (!fan_control_allowed)
 		return -EPERM;
 
-	if (mutex_lock_killable(&fan_mutex))
-		return -ERESTARTSYS;
+	ACQUIRE(mutex_kill, guard)(&fan_mutex);
+	rc = ACQUIRE_ERR(mutex_kill, &guard);
+	if (rc)
+		return rc;
 
 	if (level == TPACPI_FAN_LAST_LEVEL)
 		level = fan_control_desired_level;
@@ -8322,7 +8320,6 @@ static int fan_set_level_safe(int level)
 	if (!rc)
 		fan_update_desired_level(level);
 
-	mutex_unlock(&fan_mutex);
 	return rc;
 }
 
@@ -8334,8 +8331,10 @@ static int fan_set_enable(void)
 	if (!fan_control_allowed)
 		return -EPERM;
 
-	if (mutex_lock_killable(&fan_mutex))
-		return -ERESTARTSYS;
+	ACQUIRE(mutex_kill, guard)(&fan_mutex);
+	rc = ACQUIRE_ERR(mutex_kill, &guard);
+	if (rc)
+		return rc;
 
 	switch (fan_control_access_mode) {
 	case TPACPI_FAN_WR_ACPI_FANS:
@@ -8391,8 +8390,6 @@ static int fan_set_enable(void)
 		rc = -ENXIO;
 	}
 
-	mutex_unlock(&fan_mutex);
-
 	if (!rc)
 		vdbg_printk(TPACPI_DBG_FAN,
 			"fan control: set fan control register to 0x%02x\n",
@@ -8407,8 +8404,10 @@ static int fan_set_disable(void)
 	if (!fan_control_allowed)
 		return -EPERM;
 
-	if (mutex_lock_killable(&fan_mutex))
-		return -ERESTARTSYS;
+	ACQUIRE(mutex_kill, guard)(&fan_mutex);
+	rc = ACQUIRE_ERR(mutex_kill, &guard);
+	if (rc)
+		return rc;
 
 	rc = 0;
 	switch (fan_control_access_mode) {
@@ -8453,7 +8452,6 @@ static int fan_set_disable(void)
 		vdbg_printk(TPACPI_DBG_FAN,
 			"fan control: set fan control register to 0\n");
 
-	mutex_unlock(&fan_mutex);
 	return rc;
 }
 
@@ -8464,8 +8462,10 @@ static int fan_set_speed(int speed)
 	if (!fan_control_allowed)
 		return -EPERM;
 
-	if (mutex_lock_killable(&fan_mutex))
-		return -ERESTARTSYS;
+	ACQUIRE(mutex_kill, guard)(&fan_mutex);
+	rc = ACQUIRE_ERR(mutex_kill, &guard);
+	if (rc)
+		return rc;
 
 	rc = 0;
 	switch (fan_control_access_mode) {
@@ -8499,7 +8499,6 @@ static int fan_set_speed(int speed)
 		rc = -ENXIO;
 	}
 
-	mutex_unlock(&fan_mutex);
 	return rc;
 }
 
@@ -8659,8 +8658,10 @@ static ssize_t fan_pwm1_store(struct device *dev,
 	/* scale down from 0-255 to 0-7 */
 	newlevel = (s >> 5) & 0x07;
 
-	if (mutex_lock_killable(&fan_mutex))
-		return -ERESTARTSYS;
+	ACQUIRE(mutex_kill, guard)(&fan_mutex);
+	rc = ACQUIRE_ERR(mutex_kill, &guard);
+	if (rc)
+		return rc;
 
 	rc = fan_get_status(&status);
 	if (!rc && (status &
@@ -8674,7 +8675,6 @@ static ssize_t fan_pwm1_store(struct device *dev,
 		}
 	}
 
-	mutex_unlock(&fan_mutex);
 	return (rc) ? rc : count;
 }
 
@@ -10522,13 +10522,14 @@ static int dytc_profile_set(struct device *dev,
 	int output;
 	int err;
 
-	err = mutex_lock_interruptible(&dytc_mutex);
+	ACQUIRE(mutex_intr, guard)(&dytc_mutex);
+	err = ACQUIRE_ERR(mutex_intr, &guard);
 	if (err)
 		return err;
 
 	err = convert_profile_to_dytc(profile, &perfmode);
 	if (err)
-		goto unlock;
+		return err;
 
 	if (dytc_capabilities & BIT(DYTC_FC_MMC)) {
 		if (profile == PLATFORM_PROFILE_BALANCED) {
@@ -10540,18 +10541,18 @@ static int dytc_profile_set(struct device *dev,
 			 */
 			err = dytc_cql_command(DYTC_CMD_RESET, &output);
 			if (err)
-				goto unlock;
+				return err;
 		} else {
 			/* Determine if we are in CQL mode. This alters the commands we do */
 			err = dytc_cql_command(DYTC_SET_COMMAND(DYTC_FUNCTION_MMC, perfmode, 1),
 						&output);
 			if (err)
-				goto unlock;
+				return err;
 		}
 	} else if (dytc_capabilities & BIT(DYTC_FC_PSC)) {
 		err = dytc_command(DYTC_SET_COMMAND(DYTC_FUNCTION_PSC, perfmode, 1), &output);
 		if (err)
-			goto unlock;
+			return err;
 
 		/* system supports AMT, activate it when on balanced */
 		if (dytc_capabilities & BIT(DYTC_FC_AMT))
@@ -10559,8 +10560,6 @@ static int dytc_profile_set(struct device *dev,
 	}
 	/* Success - update current profile */
 	dytc_current_profile = profile;
-unlock:
-	mutex_unlock(&dytc_mutex);
 	return err;
 }
 
-- 
2.55.0.679.g6767b8d81c-goog


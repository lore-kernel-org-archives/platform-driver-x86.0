Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7673A6417
	for <platform-driver-x86@vger.kernel.org>; Wed, 30 Sep 2026 05:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790744510; cv=none; b=XKuNC3FwDOwjpGEDTbawfGxMvATZcqPu8QRSPK2jWcjSADQVHPQ3H0kCDUJ7PwlijjJPOMhH8g6vjUZy7lcFbkLMrNJtgOGbpXnx+fJLgFxeH4L1GMQHr6rX/9hjXZda159+p2PSujfUoMZUXu3d0AgbIuL/IiusXkjvrudSXQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790744510; c=relaxed/simple;
	bh=34NHeeew8a+C/BJ5FD3D2Jp9GfF6ip0vbozr89vl320=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W+KtqV+fmaQIBE6XpVnBPum51Gd2oLWSyCeSgy5L3hk1fyOpLmJ4wJdWljt5Exd7zj5n5jL5M1b4ZsPJXE6y+Nai+QVecYj25o4r/puA1HtaFHKe+iVCoVOyQQZzOYtdstldIxMOfosUU/FHLivBVAveJBPwfS5mPiM3S91sSBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h56NGiDc; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h56NGiDc"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e630052ebso5572241eec.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 29 Sep 2026 22:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790744507; x=1791349307; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FCPUMpLJM+8xlJ2oTVwIzggzPLYtzSwY7hzTqZq/pJk=;
        b=h56NGiDc5X4AiXF1i6DFbFbgLT74JF8N5XRrgR0obvsWMPQQY8iEeadebEswUVWX+/
         I99SSkXLifAo7Uo7kTkTN8liZWyK+fJlSUtUIbYsiMfiqoUumpl0mGp8SvRicBn9Dpv+
         tTEuPDD6Dn8lKkPLYObiWNHlHbC/4oELO7dazL/vFfcNrRSCe3g2GarJGLIiVZn6tTPD
         UFl2w/Kq2d+dOAg198r3P0y0TcOYvRn6NTZT2q8OhYzNIjYqLudk5CfISrKiQHFuh8jz
         G++qJO0yoy6pgZ97x493gH0p96RIaD5YXPMKWw2xRFbfTegTczmEctUFKRe5ZszdedIg
         A65A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790744507; x=1791349307;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FCPUMpLJM+8xlJ2oTVwIzggzPLYtzSwY7hzTqZq/pJk=;
        b=l1RgiYlmv+LJbokFNwXqkHuyEE+Isg0ko3rK4lTmtGZCrmTLB+DgQTl6B8evKKYZa7
         5BdqDf7VezVD6WsNRwP5S6kUB24PMLYelnG75lw7gHirx520TCkIDzvlbXaNh1kG90Y5
         wjdIINBMVIK12AHiFM9k768dQwI7NmhKBuEb6Pxw3FimOhmETjPzTKi1+WvwsE7A6j+Z
         WDG3Xu4IoCTIoTmfN9Vc5KUxBuBeu9z+YXbrCjY6TSexuwwdOSQ0uu+Bk24tm+OKUYPT
         cOpNbyh58OodtArnd9itcLm5AbObLyKvnic8wfCpa0DOJQjcPdMk8/wpH80RRNktkFyi
         Fvzw==
X-Forwarded-Encrypted: i=1; AKwUvBzvQejYZDJfCIg64mf77ekxpVJTNFjt/W0oH7m6XXr+Ra4erFDh3w0sIlEfo+rOdbQgESrS7MQAGTnP/RW0/oRk09MU@vger.kernel.org
X-Gm-Message-State: AFq9FYLvncW9CclEXq6EVCKK3q1O4WSHBS82ux/7/n+Jo4kcxLiq0ZAm
	2+aDnPkv1X5X0fKOWse8EnfbsPLnLgDCn1BcaloKik4vallCBM8BsxT9
X-Gm-Gg: AYBFou1SbVx3H+wYlxbDYaW/rW32hG5VWW4Brgsa9UTu3MViZqUVAlNpw1DZWjDblgX
	sfo56HDqqln7mrHyEV6kIa9Mhzp9FfCzz2+7Add3xDT6ZNACfaf9hfWiy7A7PsyFW5QKtH98QH+
	ki18mVR9g2bwr8B0h4UE8DSO2SteEnvHs8s4diM2x+rvbc4SnUI1mMyzzzqK/W2sFgTQq9ckm8B
	D9Cdub8MchbHPltDVSBhnAtEMBhTaG5ozA4w321hhJniZxksnucMTPjKTqlMfjBLGK/Fvw1YXLj
	TcSPc5TIgSDL83zLZQaxsqGWJ8tHs4mgMMKfGdGpOsW28njj9/X6W/S1lvGA8vIqSQbDn1dqptY
	nzzNB7+ot81HwHF6UgXPCME6s7aeT4vNQIbGO11gnImedrS6/tUysCrAypzty1hwOOwGXIxITTP
	rDzdWw6HkUH1fIypsMc/iKsKX0i2jRr2RY43ni47CRR1JN41AL15P//jE4QGdKKmQDRBRA8dlz0
	mRPTNMOCw0AuGOHIkiVFlod/ml0n9bm6LS3/y9cJu3Pd2zExxo+8+EKHAqLxhdc5O2L4U05Xw==
X-Received: by 2002:a05:693c:41d0:20b0:33f:3ad7:fe5b with SMTP id 5a478bee46e88-34cd906e092mr584390eec.3.1790744506974;
        Tue, 29 Sep 2026 22:01:46 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:101a:5ce6:a15e:d8ca])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34cf613b0c4sm778125eec.28.2026.09.29.22.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 22:01:46 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Tue, 29 Sep 2026 21:59:10 -0700
Subject: [PATCH v2 1/2] platform/x86: thinkpad_acpi: convert conditional
 mutex locks to ACQUIRE_ERR()
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260929-thinkpad-acpi-cleanup-v2-1-88e176953a4b@gmail.com>
References: <20260929-thinkpad-acpi-cleanup-v2-0-88e176953a4b@gmail.com>
In-Reply-To: <20260929-thinkpad-acpi-cleanup-v2-0-88e176953a4b@gmail.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>
Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Nitin Joshi <nitjoshi@gmail.com>, platform-driver-x86@vger.kernel.org, 
 ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Ali_Ahmet_Memi=C5=9F?= <aliamemis@disroot.org>
X-Mailer: b4 0.17-dev-6c14f

Convert conditional mutex_lock_killable() and mutex_lock_interruptible()
calls to ACQUIRE() and ACQUIRE_ERR() from linux/cleanup.h.

This eliminates explicit mutex_unlock() calls on return paths and
simplifies error handling across hotkey, brightness, volume, fan, and
dytc functions.

Assisted-by: LLM
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Tested-by: Ali Ahmet Memiş <aliamemis@disroot.org>
Tested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 148 ++++++++++++++--------------
 1 file changed, 73 insertions(+), 75 deletions(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 1225b01ed14d..645df773fe63 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -2676,8 +2676,10 @@ static ssize_t hotkey_mask_store(struct device *dev,
 	if (parse_strtoul(buf, 0xffffffffUL, &t))
 		return -EINVAL;
 
-	if (mutex_lock_killable(&hotkey_mutex))
-		return -ERESTARTSYS;
+	ACQUIRE(mutex_kill, guard)(&hotkey_mutex);
+	res = ACQUIRE_ERR(mutex_kill, &guard);
+	if (res)
+		return res;
 
 	res = hotkey_user_mask_set(t);
 
@@ -2685,8 +2687,6 @@ static ssize_t hotkey_mask_store(struct device *dev,
 	hotkey_poll_setup(true);
 #endif
 
-	mutex_unlock(&hotkey_mutex);
-
 	tpacpi_disclose_usertask("hotkey_mask", "set to 0x%08lx\n", t);
 
 	return (res) ? res : count;
@@ -2772,8 +2772,10 @@ static ssize_t hotkey_source_mask_store(struct device *dev,
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
@@ -2787,8 +2789,6 @@ static ssize_t hotkey_source_mask_store(struct device *dev,
 	r_ev = hotkey_driver_mask & ~(hotkey_acpi_mask & hotkey_all_mask)
 		& ~hotkey_source_mask & TPACPI_HKEY_NVRAM_KNOWN_MASK;
 
-	mutex_unlock(&hotkey_mutex);
-
 	if (rc < 0)
 		pr_err("hotkey_source_mask: failed to update the firmware event mask!\n");
 
@@ -2816,18 +2816,19 @@ static ssize_t hotkey_poll_freq_store(struct device *dev,
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
@@ -4066,12 +4067,13 @@ static int hotkey_read(struct seq_file *m)
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
 
@@ -4104,8 +4106,10 @@ static int hotkey_write(char *buf)
 	if (!tp_features.hotkey)
 		return -ENODEV;
 
-	if (mutex_lock_killable(&hotkey_mutex))
-		return -ERESTARTSYS;
+	ACQUIRE(mutex_kill, guard)(&hotkey_mutex);
+	res = ACQUIRE_ERR(mutex_kill, &guard);
+	if (res)
+		return res;
 
 	mask = hotkey_user_mask;
 
@@ -4124,8 +4128,7 @@ static int hotkey_write(char *buf)
 		} else if (sscanf(cmd, "%x", &mask) == 1) {
 			/* mask set */
 		} else {
-			res = -EINVAL;
-			goto errexit;
+			return -EINVAL;
 		}
 	}
 
@@ -4135,8 +4138,6 @@ static int hotkey_write(char *buf)
 		res = hotkey_user_mask_set(mask);
 	}
 
-errexit:
-	mutex_unlock(&hotkey_mutex);
 	return res;
 }
 
@@ -6544,11 +6545,12 @@ static void tpacpi_brightness_checkpoint_nvram(void)
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
 
@@ -6566,9 +6568,6 @@ static void tpacpi_brightness_checkpoint_nvram(void)
 		vdbg_printk(TPACPI_DBG_BRGHT,
 			   "NVRAM backlight level already is %u (0x%02x)\n",
 			   (unsigned int) lec, (unsigned int) b_nvram);
-
-unlock:
-	mutex_unlock(&brightness_mutex);
 }
 
 
@@ -6646,8 +6645,9 @@ static int brightness_set(unsigned int value)
 	vdbg_printk(TPACPI_DBG_BRGHT,
 			"set backlight level to %d\n", value);
 
-	res = mutex_lock_killable(&brightness_mutex);
-	if (res < 0)
+	ACQUIRE(mutex_kill, guard)(&brightness_mutex);
+	res = ACQUIRE_ERR(mutex_kill, &guard);
+	if (res)
 		return res;
 
 	switch (brightness_mode) {
@@ -6662,7 +6662,6 @@ static int brightness_set(unsigned int value)
 		res = -ENXIO;
 	}
 
-	mutex_unlock(&brightness_mutex);
 	return res;
 }
 
@@ -6685,14 +6684,11 @@ static int brightness_get(struct backlight_device *bd)
 {
 	int status, res;
 
-	res = mutex_lock_killable(&brightness_mutex);
-	if (res < 0)
+	ACQUIRE(mutex_kill, guard)(&brightness_mutex);
+	if (ACQUIRE_ERR(mutex_kill, &guard))
 		return 0;
 
 	res = tpacpi_brightness_get_raw(&status);
-
-	mutex_unlock(&brightness_mutex);
-
 	if (res < 0)
 		return 0;
 
@@ -7157,11 +7153,12 @@ static void tpacpi_volume_checkpoint_nvram(void)
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
 
@@ -7178,9 +7175,6 @@ static void tpacpi_volume_checkpoint_nvram(void)
 			   "NVRAM mixer status already is 0x%02x (0x%02x)\n",
 			   (unsigned int) lec, (unsigned int) b_nvram);
 	}
-
-unlock:
-	mutex_unlock(&volume_mutex);
 }
 
 static int volume_get_status_ec(u8 *status)
@@ -7229,12 +7223,14 @@ static int __volume_set_mute_ec(const bool mute)
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
@@ -7245,8 +7241,6 @@ static int __volume_set_mute_ec(const bool mute)
 			rc = 1;
 	}
 
-unlock:
-	mutex_unlock(&volume_mutex);
 	return rc;
 }
 
@@ -7277,12 +7271,14 @@ static int __volume_set_volume_ec(const u8 vol)
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
 
@@ -7292,8 +7288,6 @@ static int __volume_set_volume_ec(const u8 vol)
 			rc = 1;
 	}
 
-unlock:
-	mutex_unlock(&volume_mutex);
 	return rc;
 }
 
@@ -8197,13 +8191,14 @@ static int fan_get_status_safe(u8 *status)
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
@@ -8396,8 +8391,10 @@ static int fan_set_level_safe(int level)
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
@@ -8406,7 +8403,6 @@ static int fan_set_level_safe(int level)
 	if (!rc)
 		fan_update_desired_level(level);
 
-	mutex_unlock(&fan_mutex);
 	return rc;
 }
 
@@ -8418,8 +8414,10 @@ static int fan_set_enable(void)
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
@@ -8475,8 +8473,6 @@ static int fan_set_enable(void)
 		rc = -ENXIO;
 	}
 
-	mutex_unlock(&fan_mutex);
-
 	if (!rc)
 		vdbg_printk(TPACPI_DBG_FAN,
 			"fan control: set fan control register to 0x%02x\n",
@@ -8491,8 +8487,10 @@ static int fan_set_disable(void)
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
@@ -8537,7 +8535,6 @@ static int fan_set_disable(void)
 		vdbg_printk(TPACPI_DBG_FAN,
 			"fan control: set fan control register to 0\n");
 
-	mutex_unlock(&fan_mutex);
 	return rc;
 }
 
@@ -8548,8 +8545,10 @@ static int fan_set_speed(int speed)
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
@@ -8583,7 +8582,6 @@ static int fan_set_speed(int speed)
 		rc = -ENXIO;
 	}
 
-	mutex_unlock(&fan_mutex);
 	return rc;
 }
 
@@ -8743,8 +8741,10 @@ static ssize_t fan_pwm1_store(struct device *dev,
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
@@ -8758,7 +8758,6 @@ static ssize_t fan_pwm1_store(struct device *dev,
 		}
 	}
 
-	mutex_unlock(&fan_mutex);
 	return (rc) ? rc : count;
 }
 
@@ -10609,13 +10608,14 @@ static int dytc_profile_set(struct device *dev,
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
@@ -10627,18 +10627,18 @@ static int dytc_profile_set(struct device *dev,
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
@@ -10646,8 +10646,6 @@ static int dytc_profile_set(struct device *dev,
 	}
 	/* Success - update current profile */
 	dytc_current_profile = profile;
-unlock:
-	mutex_unlock(&dytc_mutex);
 	return err;
 }
 

-- 
2.56.0.rc1.315.gc6ed9934b7-goog


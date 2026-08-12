Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBA232FA30;
	Wed, 12 Aug 2026 18:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786560830; cv=none; b=FQ+SQxqyjZ4hjswDv09VP+54HA0Iboyabm2okcloeJyK2YzAf3FW+h3Yw6hqNa5AET1+vWorXCHjQBIW9OzbDCH9l3+8cVRWbIGiZS9gmcqC6AlOYOFWI9VYzshbP1bjmwrc/2vVt111irMpOVn4Jp2V1W8H1u7d0OlNpnoWiw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786560830; c=relaxed/simple;
	bh=LfsJnlE6UcH6SkJqiFvBHWnA7cej0HF6M7lE8gTLbh0=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=fiuFZeZgQ91VGilw6LiYh57puip/gJiwSMVK4JGbOWkGBzfSJpPR4BI+z9PpoQafebVJUUr9FBl/LoONwYoR3KPREmyT/4iRmDj9aWFcM87CAnnB41ks/T0Ki7iXcwfEaJSsoq6CEtVSnjmuyGYorQnCEn8+TWVMIsENXWdKho0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=Wpg/RVz5; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=bBJcnoK8; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="Wpg/RVz5";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="bBJcnoK8"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id AB5B5EC01AD;
	Wed, 12 Aug 2026 14:53:47 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Wed, 12 Aug 2026 14:53:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1786560827;
	 x=1786647227; bh=zTEEM3MQ6FtRypt6R7xZcTFxzGWFmCRhI6Fd5DclUqY=; b=
	Wpg/RVz5kDxvICBJyAet0TQ74ihSSdwMDO0UrXpfDewDH8qZ00I6ymEpgo54Zz5f
	Uftvj9+4Hw9KdFiDtnlqo1RYnd53CO5A9hmHpiVaOp7ozAi6M4oUoPPGqs+fgEY/
	zMMz2C7/PZXe6zHxYm/AzbPw/R019GorJ+KLD3dlADgA8MzGdREhc+OU9gQKPTsF
	2VRdjDoO3UMbez7p7w+rjYFGysUBBHSQp0SFS07119MtBPzZhNkpX5HbEjNE2jSE
	NmWjw1CHRG/bbsthqdpCObv2qkr9Ls6tGdk0ntpuY8F71VldEUQR6KF4ttzjUtan
	QwCvlaRbzxbp+0w2PLZGJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786560827; x=
	1786647227; bh=zTEEM3MQ6FtRypt6R7xZcTFxzGWFmCRhI6Fd5DclUqY=; b=b
	BJcnoK8Bk/1LykjSygg4qaNnm94AyYH4q1rhMVrQNrLsxwLpVs011hRfeTDyuAJd
	q6IbUHnLlqcoiJSYmJzV5SAgpBDj9dpMA/3XrcdJLMGke3vmDaCASPFQsUq8OROq
	N6UCprNR6BJJIX5pqyiZkttHS4NCZYtz9E7NTHRgh0rJQkjphtS8UBvvQioKLgCr
	Aenpg8y657iFZL3f10K7jrTQBhuforN3qII7EkjAZrSbr6l9QRFC+DyGMttZ4s15
	ekV11FBTfAgtjo8gGMZv85wlfdgiHsOp+QRp+lgazuKc1whH3pF3lj8MQ7TadlYT
	f8xDP2eXicS4JCfO62J2A==
X-ME-Sender: <xms:O8F8apr4uhi2HtZYr4pcR34QdNgfN1Ot_x9vH_Vg9JDVYpglKJGOaw>
    <xme:O8F8amcJfRhH_83Xr7AWDqzYtJIimwXRmVJK-Ws_98nhcTYaHaAZHeYRXNAs-R5rJ
    4uofZDtRZk2nCZn-IhosYLFwYcg09tkKuHhN1AekumQ3LOC1WeT-PA>
X-ME-Proxy-Cause: dmFkZTFQjbKgEh0vz5KD9oBYiBOVtwQKeBpsdY1x6rrXmbolkVWhkzuzzRUIcY53FVbV7F
    17CNZljpqc6e1pUi2/U+DP3014fY87JgnQOTq7tkQfv+mhgP63aVIBdRXAzuwcsiOP6A7M
    HN3zep3DVIh7GGUj2c7I8rnHE18LlCN13Oqdf+4xfO8jb+iAtmPspwwSFbn1Vb6OgYLYpt
    p4LcUyM3wh8e1WBvsmHgJdHpKw0yxlxaqzO/3fURFrVVCcXPRNdVDgsQt092/DaoxFerR3
    BhUf4v1NmESImJWlkVtT6ZvDXfMLcUoW9InhTpEX4dnFwSGtUP8wRWGh8qiXLx18oqirc7
    gkQ+sUQJz+9qWLCzVkxheZmIchWIHxiIkaUkT06WZEqDNodVYjhw+2gV2FvvmPPUzQzqVP
    At9y6AmuykXQZzy232IV2Eq2r2PA9t1QQuczaDMr+0D247/tmm8ecfI9tVgBLPUq/wxSuw
    zAaKO3lPAL4yo4rkroMbVLklyqy0xxy3jlGoNgj4I7I/dl5kENmu2CO6NBdEmNs3W6l0+1
    6a/HG5tx08DDONT2JCAx9sQVPEKMOrv5Jw5e+BQA6PMWk3e7wrBU+dbPOOcrEgOsc+JekE
    R7QpTNb8h51nEQhV8AdLbCJSPF4DnU9/Zza2orPJ1RpgaEP+yhvcSn3FsCOQ
X-ME-Proxy: <xmx:O8F8aoVsUcEgouuZzAfa1tWiVxrCFbMgkkOsO9EZwBNBQ3sCiVZf8g>
    <xmx:O8F8aikqybBgD1j3ByGDFBMCqWgbMf2y8XrxqWMNJHuMfQdr6xGadQ>
    <xmx:O8F8anMyFAEzhKdIagTxq0uY1o9BW1sWudHYL6EqBQhWY67YOKIWnQ>
    <xmx:O8F8aqLdYpkaBD6mdknUH534kDDCSZWmFKDFKGn4Dbe7xgmruLuRiw>
    <xmx:O8F8alRRi_hEFUA5YfDv-_pFqlGolg5XF15-6qn88qrdVH4qLF32JYHG>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 2C6E42CE0078; Wed, 12 Aug 2026 14:53:47 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AKW0N1QqFkWF
Date: Wed, 12 Aug 2026 14:53:26 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>
Cc: "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Nitin Joshi" <nitjoshi@gmail.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Message-Id: <f4edf04b-d243-4fe6-a4fc-66b944f39071@app.fastmail.com>
In-Reply-To: <20260806061925.625482-2-dmitry.torokhov@gmail.com>
References: <20260806061925.625482-1-dmitry.torokhov@gmail.com>
 <20260806061925.625482-2-dmitry.torokhov@gmail.com>
Subject: Re: [PATCH 2/3] platform/x86: thinkpad_acpi: convert conditional mutex locks
 to ACQUIRE_ERR()
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Thanks Dmitry,

On Thu, Aug 6, 2026, at 2:19 AM, Dmitry Torokhov wrote:
> Convert conditional mutex_lock_killable() and mutex_lock_interruptible()
> calls to ACQUIRE() and ACQUIRE_ERR() from linux/cleanup.h.
>
> This eliminates explicit mutex_unlock() calls on return paths and
> simplifies error handling across hotkey, brightness, volume, fan, and
> dytc functions.
>
> Assisted-by: Antigravity:gemini-3.6-flash
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/platform/x86/lenovo/thinkpad_acpi.c | 153 ++++++++++----------
>  1 file changed, 76 insertions(+), 77 deletions(-)
>
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c 
> b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> index beb85ea1103b..0d0d6fe7eecd 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -2671,8 +2671,10 @@ static ssize_t hotkey_mask_store(struct device 
> *dev,
>  	if (parse_strtoul(buf, 0xffffffffUL, &t))
>  		return -EINVAL;
> 
> -	if (mutex_lock_killable(&hotkey_mutex))
> -		return -ERESTARTSYS;
> +	ACQUIRE(mutex_kill, guard)(&hotkey_mutex);
> +	res = ACQUIRE_ERR(mutex_kill, &guard);
> +	if (res)
> +		return res;
> 
>  	res = hotkey_user_mask_set(t);
> 
> @@ -2680,8 +2682,6 @@ static ssize_t hotkey_mask_store(struct device *dev,
>  	hotkey_poll_setup(true);
>  #endif
> 
> -	mutex_unlock(&hotkey_mutex);
> -
>  	tpacpi_disclose_usertask("hotkey_mask", "set to 0x%08lx\n", t);
> 
>  	return (res) ? res : count;
> @@ -2767,8 +2767,10 @@ static ssize_t hotkey_source_mask_store(struct 
> device *dev,
>  		((t & ~TPACPI_HKEY_NVRAM_KNOWN_MASK) != 0))
>  		return -EINVAL;
> 
> -	if (mutex_lock_killable(&hotkey_mutex))
> -		return -ERESTARTSYS;
> +	ACQUIRE(mutex_kill, guard)(&hotkey_mutex);
> +	rc = ACQUIRE_ERR(mutex_kill, &guard);
> +	if (rc)
> +		return rc;
> 
>  	HOTKEY_CONFIG_CRITICAL_START
>  	hotkey_source_mask = t;
> @@ -2782,8 +2784,6 @@ static ssize_t hotkey_source_mask_store(struct 
> device *dev,
>  	r_ev = hotkey_driver_mask & ~(hotkey_acpi_mask & hotkey_all_mask)
>  		& ~hotkey_source_mask & TPACPI_HKEY_NVRAM_KNOWN_MASK;
> 
> -	mutex_unlock(&hotkey_mutex);
> -
>  	if (rc < 0)
>  		pr_err("hotkey_source_mask: failed to update the firmware event mask!\n");
> 
> @@ -2811,18 +2811,19 @@ static ssize_t hotkey_poll_freq_store(struct 
> device *dev,
>  			    const char *buf, size_t count)
>  {
>  	unsigned long t;
> +	int err;
> 
>  	if (parse_strtoul(buf, 25, &t))
>  		return -EINVAL;
> 
> -	if (mutex_lock_killable(&hotkey_mutex))
> -		return -ERESTARTSYS;
> +	ACQUIRE(mutex_kill, guard)(&hotkey_mutex);
> +	err = ACQUIRE_ERR(mutex_kill, &guard);
> +	if (err)
> +		return err;
> 
>  	hotkey_poll_set_freq(t);
>  	hotkey_poll_setup(true);
> 
> -	mutex_unlock(&hotkey_mutex);
> -
>  	tpacpi_disclose_usertask("hotkey_poll_freq", "set to %lu\n", t);
> 
>  	return count;
> @@ -3995,12 +3996,13 @@ static int hotkey_read(struct seq_file *m)
>  		return 0;
>  	}
> 
> -	if (mutex_lock_killable(&hotkey_mutex))
> -		return -ERESTARTSYS;
> +	ACQUIRE(mutex_kill, guard)(&hotkey_mutex);
> +	res = ACQUIRE_ERR(mutex_kill, &guard);
> +	if (res)
> +		return res;
>  	res = hotkey_status_get(&status);
>  	if (!res)
>  		res = hotkey_mask_get();
> -	mutex_unlock(&hotkey_mutex);
>  	if (res)
>  		return res;
> 
> @@ -4033,8 +4035,10 @@ static int hotkey_write(char *buf)
>  	if (!tp_features.hotkey)
>  		return -ENODEV;
> 
> -	if (mutex_lock_killable(&hotkey_mutex))
> -		return -ERESTARTSYS;
> +	ACQUIRE(mutex_kill, guard)(&hotkey_mutex);
> +	res = ACQUIRE_ERR(mutex_kill, &guard);
> +	if (res)
> +		return res;
> 
>  	mask = hotkey_user_mask;
> 
> @@ -4053,8 +4057,7 @@ static int hotkey_write(char *buf)
>  		} else if (sscanf(cmd, "%x", &mask) == 1) {
>  			/* mask set */
>  		} else {
> -			res = -EINVAL;
> -			goto errexit;
> +			return -EINVAL;
>  		}
>  	}
> 
> @@ -4064,8 +4067,6 @@ static int hotkey_write(char *buf)
>  		res = hotkey_user_mask_set(mask);
>  	}
> 
> -errexit:
> -	mutex_unlock(&hotkey_mutex);
>  	return res;
>  }
> 
> @@ -6460,11 +6461,12 @@ static void tpacpi_brightness_checkpoint_nvram(void)
>  	vdbg_printk(TPACPI_DBG_BRGHT,
>  		"trying to checkpoint backlight level to NVRAM...\n");
> 
> -	if (mutex_lock_killable(&brightness_mutex) < 0)
> +	ACQUIRE(mutex_kill, guard)(&brightness_mutex);
> +	if (ACQUIRE_ERR(mutex_kill, &guard))
>  		return;
> 
>  	if (unlikely(!acpi_ec_read(TP_EC_BACKLIGHT, &lec)))
> -		goto unlock;
> +		return;
>  	lec &= TP_EC_BACKLIGHT_LVLMSK;
>  	b_nvram = nvram_read_byte(TP_NVRAM_ADDR_BRIGHTNESS);
> 
> @@ -6482,9 +6484,6 @@ static void tpacpi_brightness_checkpoint_nvram(void)
>  		vdbg_printk(TPACPI_DBG_BRGHT,
>  			   "NVRAM backlight level already is %u (0x%02x)\n",
>  			   (unsigned int) lec, (unsigned int) b_nvram);
> -
> -unlock:
> -	mutex_unlock(&brightness_mutex);
>  }
> 
> 
> @@ -6562,8 +6561,9 @@ static int brightness_set(unsigned int value)
>  	vdbg_printk(TPACPI_DBG_BRGHT,
>  			"set backlight level to %d\n", value);
> 
> -	res = mutex_lock_killable(&brightness_mutex);
> -	if (res < 0)
> +	ACQUIRE(mutex_kill, guard)(&brightness_mutex);
> +	res = ACQUIRE_ERR(mutex_kill, &guard);
> +	if (res)
>  		return res;
> 
>  	switch (brightness_mode) {
> @@ -6578,7 +6578,6 @@ static int brightness_set(unsigned int value)
>  		res = -ENXIO;
>  	}
> 
> -	mutex_unlock(&brightness_mutex);
>  	return res;
>  }
> 
> @@ -6601,16 +6600,14 @@ static int brightness_get(struct backlight_device *bd)
>  {
>  	int status, res;
> 
> -	res = mutex_lock_killable(&brightness_mutex);
> -	if (res < 0)
> -		return 0;
> +	ACQUIRE(mutex_kill, guard)(&brightness_mutex);
> +	res = ACQUIRE_ERR(mutex_kill, &guard);
> +	if (res)
> +		return res;
> 
>  	res = tpacpi_brightness_get_raw(&status);
> -
> -	mutex_unlock(&brightness_mutex);
> -
>  	if (res < 0)
> -		return 0;
> +		return res;
> 
>  	return status & TP_EC_BACKLIGHT_LVLMSK;
>  }
> @@ -7073,11 +7070,12 @@ static void tpacpi_volume_checkpoint_nvram(void)
>  	else
>  		ec_mask = TP_EC_AUDIO_MUTESW_MSK | TP_EC_AUDIO_LVL_MSK;
> 
> -	if (mutex_lock_killable(&volume_mutex) < 0)
> +	ACQUIRE(mutex_kill, guard)(&volume_mutex);
> +	if (ACQUIRE_ERR(mutex_kill, &guard))
>  		return;
> 
>  	if (unlikely(!acpi_ec_read(TP_EC_AUDIO, &lec)))
> -		goto unlock;
> +		return;
>  	lec &= ec_mask;
>  	b_nvram = nvram_read_byte(TP_NVRAM_ADDR_MIXER);
> 
> @@ -7094,9 +7092,6 @@ static void tpacpi_volume_checkpoint_nvram(void)
>  			   "NVRAM mixer status already is 0x%02x (0x%02x)\n",
>  			   (unsigned int) lec, (unsigned int) b_nvram);
>  	}
> -
> -unlock:
> -	mutex_unlock(&volume_mutex);
>  }
> 
>  static int volume_get_status_ec(u8 *status)
> @@ -7145,12 +7140,14 @@ static int __volume_set_mute_ec(const bool mute)
>  	int rc;
>  	u8 s, n;
> 
> -	if (mutex_lock_killable(&volume_mutex) < 0)
> -		return -EINTR;
> +	ACQUIRE(mutex_kill, guard)(&volume_mutex);
> +	rc = ACQUIRE_ERR(mutex_kill, &guard);
> +	if (rc)
> +		return rc;
> 
>  	rc = volume_get_status_ec(&s);
>  	if (rc)
> -		goto unlock;
> +		return rc;
> 
>  	n = (mute) ? s | TP_EC_AUDIO_MUTESW_MSK :
>  		     s & ~TP_EC_AUDIO_MUTESW_MSK;
> @@ -7161,8 +7158,6 @@ static int __volume_set_mute_ec(const bool mute)
>  			rc = 1;
>  	}
> 
> -unlock:
> -	mutex_unlock(&volume_mutex);
>  	return rc;
>  }
> 
> @@ -7193,12 +7188,14 @@ static int __volume_set_volume_ec(const u8 vol)
>  	if (vol > TP_EC_VOLUME_MAX)
>  		return -EINVAL;
> 
> -	if (mutex_lock_killable(&volume_mutex) < 0)
> -		return -EINTR;
> +	ACQUIRE(mutex_kill, guard)(&volume_mutex);
> +	rc = ACQUIRE_ERR(mutex_kill, &guard);
> +	if (rc)
> +		return rc;
> 
>  	rc = volume_get_status_ec(&s);
>  	if (rc)
> -		goto unlock;
> +		return rc;
> 
>  	n = (s & ~TP_EC_AUDIO_LVL_MSK) | vol;
> 
> @@ -7208,8 +7205,6 @@ static int __volume_set_volume_ec(const u8 vol)
>  			rc = 1;
>  	}
> 
> -unlock:
> -	mutex_unlock(&volume_mutex);
>  	return rc;
>  }
> 
> @@ -8113,13 +8108,14 @@ static int fan_get_status_safe(u8 *status)
>  	int rc;
>  	u8 s;
> 
> -	if (mutex_lock_killable(&fan_mutex))
> -		return -ERESTARTSYS;
> +	ACQUIRE(mutex_kill, guard)(&fan_mutex);
> +	rc = ACQUIRE_ERR(mutex_kill, &guard);
> +	if (rc)
> +		return rc;
>  	rc = fan_get_status(&s);
>  	/* NS EC doesn't have register with level settings */
>  	if (!rc && !fan_with_ns_addr)
>  		fan_update_desired_level(s);
> -	mutex_unlock(&fan_mutex);
> 
>  	if (rc)
>  		return rc;
> @@ -8312,8 +8308,10 @@ static int fan_set_level_safe(int level)
>  	if (!fan_control_allowed)
>  		return -EPERM;
> 
> -	if (mutex_lock_killable(&fan_mutex))
> -		return -ERESTARTSYS;
> +	ACQUIRE(mutex_kill, guard)(&fan_mutex);
> +	rc = ACQUIRE_ERR(mutex_kill, &guard);
> +	if (rc)
> +		return rc;
> 
>  	if (level == TPACPI_FAN_LAST_LEVEL)
>  		level = fan_control_desired_level;
> @@ -8322,7 +8320,6 @@ static int fan_set_level_safe(int level)
>  	if (!rc)
>  		fan_update_desired_level(level);
> 
> -	mutex_unlock(&fan_mutex);
>  	return rc;
>  }
> 
> @@ -8334,8 +8331,10 @@ static int fan_set_enable(void)
>  	if (!fan_control_allowed)
>  		return -EPERM;
> 
> -	if (mutex_lock_killable(&fan_mutex))
> -		return -ERESTARTSYS;
> +	ACQUIRE(mutex_kill, guard)(&fan_mutex);
> +	rc = ACQUIRE_ERR(mutex_kill, &guard);
> +	if (rc)
> +		return rc;
> 
>  	switch (fan_control_access_mode) {
>  	case TPACPI_FAN_WR_ACPI_FANS:
> @@ -8391,8 +8390,6 @@ static int fan_set_enable(void)
>  		rc = -ENXIO;
>  	}
> 
> -	mutex_unlock(&fan_mutex);
> -
>  	if (!rc)
>  		vdbg_printk(TPACPI_DBG_FAN,
>  			"fan control: set fan control register to 0x%02x\n",
> @@ -8407,8 +8404,10 @@ static int fan_set_disable(void)
>  	if (!fan_control_allowed)
>  		return -EPERM;
> 
> -	if (mutex_lock_killable(&fan_mutex))
> -		return -ERESTARTSYS;
> +	ACQUIRE(mutex_kill, guard)(&fan_mutex);
> +	rc = ACQUIRE_ERR(mutex_kill, &guard);
> +	if (rc)
> +		return rc;
> 
>  	rc = 0;
>  	switch (fan_control_access_mode) {
> @@ -8453,7 +8452,6 @@ static int fan_set_disable(void)
>  		vdbg_printk(TPACPI_DBG_FAN,
>  			"fan control: set fan control register to 0\n");
> 
> -	mutex_unlock(&fan_mutex);
>  	return rc;
>  }
> 
> @@ -8464,8 +8462,10 @@ static int fan_set_speed(int speed)
>  	if (!fan_control_allowed)
>  		return -EPERM;
> 
> -	if (mutex_lock_killable(&fan_mutex))
> -		return -ERESTARTSYS;
> +	ACQUIRE(mutex_kill, guard)(&fan_mutex);
> +	rc = ACQUIRE_ERR(mutex_kill, &guard);
> +	if (rc)
> +		return rc;
> 
>  	rc = 0;
>  	switch (fan_control_access_mode) {
> @@ -8499,7 +8499,6 @@ static int fan_set_speed(int speed)
>  		rc = -ENXIO;
>  	}
> 
> -	mutex_unlock(&fan_mutex);
>  	return rc;
>  }
> 
> @@ -8659,8 +8658,10 @@ static ssize_t fan_pwm1_store(struct device *dev,
>  	/* scale down from 0-255 to 0-7 */
>  	newlevel = (s >> 5) & 0x07;
> 
> -	if (mutex_lock_killable(&fan_mutex))
> -		return -ERESTARTSYS;
> +	ACQUIRE(mutex_kill, guard)(&fan_mutex);
> +	rc = ACQUIRE_ERR(mutex_kill, &guard);
> +	if (rc)
> +		return rc;
> 
>  	rc = fan_get_status(&status);
>  	if (!rc && (status &
> @@ -8674,7 +8675,6 @@ static ssize_t fan_pwm1_store(struct device *dev,
>  		}
>  	}
> 
> -	mutex_unlock(&fan_mutex);
>  	return (rc) ? rc : count;
>  }
> 
> @@ -10522,13 +10522,14 @@ static int dytc_profile_set(struct device *dev,
>  	int output;
>  	int err;
> 
> -	err = mutex_lock_interruptible(&dytc_mutex);
> +	ACQUIRE(mutex_intr, guard)(&dytc_mutex);
> +	err = ACQUIRE_ERR(mutex_intr, &guard);
>  	if (err)
>  		return err;
> 
>  	err = convert_profile_to_dytc(profile, &perfmode);
>  	if (err)
> -		goto unlock;
> +		return err;
> 
>  	if (dytc_capabilities & BIT(DYTC_FC_MMC)) {
>  		if (profile == PLATFORM_PROFILE_BALANCED) {
> @@ -10540,18 +10541,18 @@ static int dytc_profile_set(struct device 
> *dev,
>  			 */
>  			err = dytc_cql_command(DYTC_CMD_RESET, &output);
>  			if (err)
> -				goto unlock;
> +				return err;
>  		} else {
>  			/* Determine if we are in CQL mode. This alters the commands we do 
> */
>  			err = dytc_cql_command(DYTC_SET_COMMAND(DYTC_FUNCTION_MMC, 
> perfmode, 1),
>  						&output);
>  			if (err)
> -				goto unlock;
> +				return err;
>  		}
>  	} else if (dytc_capabilities & BIT(DYTC_FC_PSC)) {
>  		err = dytc_command(DYTC_SET_COMMAND(DYTC_FUNCTION_PSC, perfmode, 1), 
> &output);
>  		if (err)
> -			goto unlock;
> +			return err;
> 
>  		/* system supports AMT, activate it when on balanced */
>  		if (dytc_capabilities & BIT(DYTC_FC_AMT))
> @@ -10559,8 +10560,6 @@ static int dytc_profile_set(struct device *dev,
>  	}
>  	/* Success - update current profile */
>  	dytc_current_profile = profile;
> -unlock:
> -	mutex_unlock(&dytc_mutex);
>  	return err;
>  }
> 
> -- 
> 2.55.0.679.g6767b8d81c-goog

I've not come across ACQUIRE & ACQUIRE_KILL before - so this was all new to me.
I went and did some reading and all the above looks good to me, and looks like a valid clean-up.
But my reviewed-by tag does come with reduced value....

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>

Thanks for the learning experience. I will aim to go and try this out (and the other patches in the series) on some HW in the near future.

Mark

Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9863C584E
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 May 2026 14:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779372731; cv=none; b=RtcvWQfay9CphNJm36ZOd2hSRQR4oQ5zUyDnSMAj+PAEfWSTk+vU4naStlF78gxtl3CWSLeijWUDNRy2kACnFn6QPcBeIDjNne53adbqMiJit7xWqBCwTlKNQqzGpYpJhWt/nIajegx/iyS9n7q5+frK7eNr/68oG4Zs4nnIgsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779372731; c=relaxed/simple;
	bh=UwPvoSh6W/Hu+LXAbe+uHPDi3iybbVGbmk43Pslkwg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o61d0bFiHuTgYfCS3nSZiUmJfwr/hwEi/YJl+qtiKDdZQ7IHjiKfHjCTFUpYGbXGqZa2YTfK1ssR2len7aYAJh2OWiG2MOemqnBdimiBufCrdzqyv5tK0VWhtjf9JvyuIvT/dqGOT5Tel0KLENHKZ+oVTRzoiMfDnu+6rC3fmsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zbokt+3G; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zbokt+3G"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c7ffe8eeaf2so2657579a12.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 21 May 2026 07:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779372730; x=1779977530; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZnB9rdsnln4FJy2dU9qgVSNfKDFhZ+bnQ40oeOXvJuE=;
        b=Zbokt+3Gf7RlI2nwBQzz0zrmUvEin823SeTTBikRsDmievj8bZNYZ+Eq/x8MWmRVnR
         YIrzqoecjlmuJc3HbpbZbFiDC+O6AG15CHVSdy39jcROQRPPh/ex+S2VU7KX4Won9BkZ
         n3Zc65B22i7C+rIeOR996Jsw7JZ9obxzppjX/ZOcoVCKR7qEMtGkJqQdS0GUQPGxutDM
         ggYcY9Z/NBXdJtxlQ0styCkXwR978teTvBnT3ZXXlHHqkerQGn50rWZ+I2MLSrpJ0i3l
         T5h54mjHA0u7KWPHFPCBWia1TBBAi8emTrR8OPgOOAHGsP8lV6Lx5ByESe9cwV/tpKr1
         BmAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779372730; x=1779977530;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZnB9rdsnln4FJy2dU9qgVSNfKDFhZ+bnQ40oeOXvJuE=;
        b=GftCHc/q15Hqa8IIZW6umEgWxA/7W6K7m0JMr6ciiAzbXdFElgMv/mrsYlOayvQA8E
         z+ew3Aq+1f9hMeHLAe1CFYyK3uuckd9dhYqs2Uvq/r+EBOehGr5CpicP5utN3z7Bxfii
         JT+umBkRtm4WNSdnQyZzYSvu0JGtqYTFrJFpWkYutsIvFWJeTRAXYRVFv8+/x3TIX8Fr
         hGlvx4WIFn8GJxjvru/lCqurhdLrL0+mRNw+e9ozjiu06srSDf0/qjXjBqh9VG49H5oO
         Fhve6Mi9P/mQbR8nQvJeDW45c1BZSAGKVuKqc/v0k6o62Z2N54y62CPcTsULIUSYvAf3
         nRiQ==
X-Gm-Message-State: AOJu0Yy3nSD16wAT//HFXb3EjhBsCQXMoXUCRM253n502n+rhVGTxTAV
	pvC9yQVUen/Y3oUsybEHwSRYZgJrAbJWfsXZ1yYoVAjZdK8pFLl0rPOI9nC4Dg==
X-Gm-Gg: Acq92OHT45aiz4U/O0y1umh86HbFWFsRAUkWuMm6cgLSz6/2eKUVFYKUsPS6ZmfkvIB
	iPv2CjwPXSIRKST06MwxBhABvwEkbTmPQQ2gkAlKbFIJCzuaf5hqhq1KOIMk+QrTY1rO5utEY+R
	glFK7JrxhUH5aIMXxO8nYziuIOI4YZcQHBTQNm5GqQRm8R5/mEdyAgFFLht8SbCmwRqF8t9E7RJ
	yHf388J1ud3exGLWLJwFufAbs2ycsq5VCLagdXMnpbGwREnHLhhJVbJGa/lj4NHFCXNxB0Ao3Rm
	QPYV50qSljhK4lBrV+lt3gc05iac+7JhXnvJKXw0jjmkJ/f9g5NITDCtFCafB9Ouqs4QY0HeNSF
	uXL9iVe2CnxsGqtjIVSWeL7NOwujOTm1ZjBzd4eBrWnAX9IjwQEQ69Y45ROjD+qgAPVahoedbeF
	hIzWXiLmU5UtidMXrC44H9f83RQQx5W5f65SUU3n8wZRJshrq6/8Pd4oXx9NH7pQYB5IJDyoOW7
	+qJdp3VlCcwsAeYq6hMQ+shTYHyC74=
X-Received: by 2002:a17:90b:514b:b0:368:ed92:6f5 with SMTP id 98e67ed59e1d1-36a4510cffdmr3198979a91.4.1779372729844;
        Thu, 21 May 2026 07:12:09 -0700 (PDT)
Received: from archlinux ([2405:201:1b:225f:72b8:b88f:97ce:a863])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a3d2083ecsm3808878a91.16.2026.05.21.07.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 07:12:09 -0700 (PDT)
Date: Thu, 21 May 2026 19:42:06 +0530
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: Radhey Kalra <radheykalra901@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com
Subject: Re: [PATCH v6 3/4] platform/x86: hp-wmi: Skip zero GPU RPM rows for
 fan speed delta
Message-ID: <ag8QsXGZziywo0SX@archlinux>
References: <20260521133351.1512718-1-radheykalra901@gmail.com>
 <20260521133351.1512718-4-radheykalra901@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20260521133351.1512718-4-radheykalra901@gmail.com>

On Thu, May 21, 2026 at 07:03:50PM +0530, Radhey Kalra wrote:
>Some Victus fan tables start with a CPU RPM value while the GPU RPM
>field is zero. On board 8A3D the first row is cpu=23, gpu=0, noise=25,
>followed by cpu=24, gpu=22, noise=26.
>
>Derive gpu_delta from the first row that contains a non-zero GPU RPM
>instead of unconditionally using row 0.

I agree, this is essential for fan-control to work sensibly. But I just
want to give Ilpo Jarvinen a quick heads-up because this would likely
cause conflict with foobisdweik's patch [1], as they would (probably)
remove gpu_delta in v2 [2]

[1]: https://lore.kernel.org/platform-driver-x86/20260513193916.84673-3-dweikmferris@gmail.com
[2]: https://lore.kernel.org/platform-driver-x86/ag2DCOGyCt7MBUL6@archlinux

>Signed-off-by: Radhey Kalra <radheykalra901@gmail.com>
>---
> drivers/platform/x86/hp/hp-wmi.c | 8 ++++++--
> 1 file changed, 6 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
>index ae2abb9..dcfffe6 100644
>--- a/drivers/platform/x86/hp/hp-wmi.c
>+++ b/drivers/platform/x86/hp/hp-wmi.c
>@@ -2666,6 +2666,7 @@ static int hp_wmi_setup_fan_settings(struct hp_wmi_hwmon_priv *priv)
> 	u8 min_rpm, max_rpm;
> 	u8 cpu_rpm, gpu_rpm, noise_db;
> 	int gpu_delta, i, num_entries, ret;
>+	bool gpu_delta_found = false;
> 	size_t header_size, entry_size;
>
> 	/* Default behaviour on hwmon init is automatic mode */
>@@ -2706,12 +2707,15 @@ static int hp_wmi_setup_fan_settings(struct hp_wmi_hwmon_priv *priv)
> 			min_rpm = cpu_rpm;
> 		if (cpu_rpm > max_rpm)
> 			max_rpm = cpu_rpm;
>+		if (!gpu_delta_found && gpu_rpm > 0) {
>+			gpu_delta = gpu_rpm - cpu_rpm;
>+			gpu_delta_found = true;
>+		}
> 	}
>
>-	if (min_rpm == U8_MAX || max_rpm == 0)
>+	if (min_rpm == U8_MAX || max_rpm == 0 || !gpu_delta_found)
> 		return -EINVAL;
>
>-	gpu_delta = fan_table->entries[0].gpu_rpm - fan_table->entries[0].cpu_rpm;
> 	priv->min_rpm = min_rpm;
> 	priv->max_rpm = max_rpm;
> 	priv->gpu_delta = gpu_delta;
>-- 
>2.54.0
>

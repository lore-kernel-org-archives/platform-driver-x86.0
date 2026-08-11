Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5429D37F323
	for <platform-driver-x86@vger.kernel.org>; Tue, 11 Aug 2026 18:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786474213; cv=none; b=Ti27If3bB33MZE2KGnzSD891cihhyKh6rtcAlDv9maAD6aMd+Mk+av6HgmR0Ktyb4JAnIVsU2TgY6GXEuUMEw2mjytiw2+e2Tt72MWaIAQaGir4cyTbK0zj8KEmwl/8p2/0ZpGbtfIoDBZas6s3MZ40BlJOHVxHD1YDMQUnhobE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786474213; c=relaxed/simple;
	bh=/XndPrnbkW/+T4iyC4fdQzl3+nRdbMmQ10eWKLyZ1V0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GUilNPJXvfXXV1nAUoODMjXgyiNWMIFy/rzDezJay4SMavgpT/e570j2ENQhoE0iH+CVWXpqYE0C9Xd93sz5nzdxCbR2uwpk2h9u/f95T0HwFLFoKwk+nqREZQVvQCWUc/eeuA2AhLTLk/leUklHia3ZNT63r46r0GPH92IqSvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=L49HxtsT; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="L49HxtsT"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-ca80d708489so149681a12.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Aug 2026 11:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786474212; x=1787079012; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GnHJCm2ZqOWuDJ2d9OnSHmMgxlAtHC/PNWplMTJtneE=;
        b=L49HxtsTMObXboaJMXw+WlMDVrSxl5/Us01Vni3cNW+fMBYPmr9m8WFReEHodBYDaP
         PD/xdbAvE9dNK9UJy42h5xfohGEfoEK7P30YzqGLBlUkwZ/+5FKf6Z7PCOiVBBMRyzSK
         O3EXPJTIwCxfgCw/ya2wNOY2f3zq8rRXKs33E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786474212; x=1787079012;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GnHJCm2ZqOWuDJ2d9OnSHmMgxlAtHC/PNWplMTJtneE=;
        b=BsJ4QwqzisicA3nG1N1zo3010IKi1+rz53vx44j2T/q8H1Wa9aE/s0NY5SY8sJWe1L
         0JaPlvsbCou8jZ4kB9uuOEwVn20r6/WmvOBlwR20zu2SAg8RMAwh6J8X46s3ma7EM/PJ
         18ZybZOlX9N8+fAjbXVsojKn8xewb9CL3ouxf91tjzQozmHprqB+V/iNr1QPoDqNnuQU
         zTV7AKcHHj6CDE+/JHDrcA+9kdb1HMkdPRGw8c9PoWO2N57MbGAzY6wWmYlMttRdC8Bs
         rqFN6pYXwSRdTAv4MT6i8xbnh+8q9hwguRlCGA4/EwEZL1c7kBZLKXHA2Vl1ghsjQRlp
         AuBw==
X-Forwarded-Encrypted: i=1; AHgh+RrfTIKGkmFwQAx1JxF7jpY2OKNm1M0lXHa7+Kcg8O4U4wVqYx6q5dj3ZzLczkH1gvrb0v7xmYMW+cA8SgVXpR+Y76KN@vger.kernel.org
X-Gm-Message-State: AOJu0YxKFfWvdqZQNJ0WkPv1vgL0sOyxLJsPHGTsIP2kMszK4cF/4z4L
	suUtdxFNDWAb/isAZnspp+HrvK/pyYifWlZmpFJwFJMtdPj0S+k1dSihf6wszgByDw==
X-Gm-Gg: AR+sD13lzDYOBLOAygpwv2mUZnbopDL1nsKlPM2Qz4iLdvAaraXH1kXv9VwifslRHYk
	4H0+rJ9Y1yufnM/JtFcwcTIkjAf8YnpO+zmTuzfDAsXOMD7G2P30DgCMCqyUtPwVmLEXdCwzZxg
	TqXw7S2X7qmLhvYFVMW0Vxvs/MuHo5LEiivS3Cg0A1CmNHNGXKZuBzZTO1l4Cd3ZSMwDa2FCiSe
	C3AG1oh/X0R4gZk3bmi5vGH2jVonjq7pJlTmZmI4ZnFx05Aga+3C/wwgNacQhV1TRE3yw7MB1Vv
	uImMfnOqTexi2o/QOKiyJl8YvMws5LV5Q77/MUecycVCwlL4+0BM14KIQgxqVTB3AOcyQno3mn0
	dWdJgbMB+0CNbO0m4bFP4+O0HjxpY1SzimrCRKSo4Wn5DjYT57zVc8gJ0pJdghI2FXE4hCIbska
	vL5za18TcJfyBPNLty3MAij75uxm6LhnC6ZnBHRDVUzmMUeiCggWs4N2cHXfv1dDb0A4ETlXDp4
	rTMbnd6emOu/DV0gjnt3orRSlM=
X-Received: by 2002:a05:6a21:3117:b0:3bf:b7e8:68ab with SMTP id adf61e73a8af0-3cc377db1cemr3285344637.2.1786474211555;
        Tue, 11 Aug 2026 11:50:11 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:79fa:d268:80cb:4947])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1412458a390sm1677688c88.14.2026.08.11.11.50.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 11:50:10 -0700 (PDT)
Date: Tue, 11 Aug 2026 11:50:07 -0700
From: Brian Norris <briannorris@chromium.org>
To: Sean Rhodes <sean@starlabs.systems>
Cc: chrome-platform@lists.linux.dev, corentin.chary@gmail.com,
	luke@ljones.dev, denis.benato@linux.dev, hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com, prasanth.ksr@dell.com,
	jorge.lopez2@hp.com, mpearson-lenovo@squebb.ca,
	derekjohn.clark@gmail.com, josh@joshuagrisham.com,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	Dell.Client.Kernel@dell.com, florian.fainelli@broadcom.com,
	chenhuacai@kernel.org, mst@redhat.com, wenst@chromium.org,
	tzungbi@kernel.org, jwerner@chromium.org, tzimmermann@suse.de,
	javierm@redhat.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
	krzysztof.kozlowski@oss.qualcomm.com, andersson@kernel.org,
	geert@linux-m68k.org, dmitry.baryshkov@oss.qualcomm.com,
	arnd@arndb.de, ebiggers@kernel.org, luca.weiss@fairphone.com,
	michal.simek@amd.com, sven@kernel.org, u.kleine-koenig@baylibre.com,
	bhelgaas@google.com, dakr@kernel.org, o-takashi@sakamocchi.jp,
	titouan.ameline@gmail.com, kees@kernel.org,
	dri-devel@lists.freedesktop.org, oliver@liuxiaozhen.dev
Subject: Re: [PATCH v12 4/4] firmware: coreboot: Add CFR firmware attributes
 driver
Message-ID: <antu3wHFDzxMXBKd@google.com>
References: <CABtds-2qyH84oOG_JhXN6eNQOV9H9vhQvSG4JCv5E+r9VdwKcw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABtds-2qyH84oOG_JhXN6eNQOV9H9vhQvSG4JCv5E+r9VdwKcw@mail.gmail.com>

On Thu, Aug 06, 2026 at 01:28:39PM -0700, Sean Rhodes wrote:
> coreboot can publish a CFR tree in its coreboot table to describe
> firmware setup options. Add a firmware-attributes driver for that table
> entry under the coreboot firmware driver directory.
...

Kind of a large driver, but in a partial pass, nothing jumps out as too
scary to me.

> diff --git a/drivers/firmware/coreboot/coreboot-cfr.c
> b/drivers/firmware/coreboot/coreboot-cfr.c
> new file mode 100644
> index 000000000000..54aae1442bcc
> --- /dev/null
> +++ b/drivers/firmware/coreboot/coreboot-cfr.c
> @@ -0,0 +1,1208 @@
...
> +static int coreboot_cfr_apply_runtime(struct coreboot_cfr_setting *setting)
> +{
> +#ifdef CONFIG_X86

What's X86-specific in here? Are you just needing inb()/outb()? That
seems like you could 'depend on HAS_IOPORT', or #ifdef
CONFIG_HAS_IOPORT.

> +	u8 status;
> +
> +	if (setting->runtime_apply_method != CFR_RUNTIME_APPLY_APM_CNT)
> +		return -EOPNOTSUPP;
> +
> +	outb((u8)setting->runtime_apply_id, COREBOOT_CFR_APM_STS_PORT);
> +	outb(COREBOOT_CFR_APM_APPLY_CMD, COREBOOT_CFR_APM_CNT_PORT);
> +	status = inb(COREBOOT_CFR_APM_STS_PORT);
> +	if (status)
> +		return -EIO;
> +
> +	return 0;
> +#else
> +	return -EOPNOTSUPP;
> +#endif
> +}
> +

Brian

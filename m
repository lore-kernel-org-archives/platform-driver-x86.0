Received: from mail.ptr1337.dev (mail.ptr1337.dev [202.61.224.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050063815E3;
	Mon, 20 Apr 2026 06:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.61.224.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776667413; cv=none; b=lcqckGbiiOvUHcWwt5fj8oDseBDKzWyCLVhb3+hTN3WSSXmIIL4aaM5wmDjnDLM2Eqvp99bF4zWpO614w+j6TpmVB+tCt5FSstm6MQqW5yUS+jF5wgWmAMcBRVxY//4kDQtj7bHNz3lTSpRkbn0sJYm0k6LKQH5mJ6dTrYQBIok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776667413; c=relaxed/simple;
	bh=CVZW9gXroFrKcCQNq1PIAeaql3ZD46InNoYJrjg6+O8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jzsvjp47ry39ve05ZyvyQzsOusjctgrS0dtrfB6O19chkA3h1RToDQZshZQbP33snt9ZSe0WBcG+kA60Djk98zJzSW1AA3ahxns/x2UMgGpK0oIqRxtREYE2vEnInSFBK3dCqDa9LqrfyIwJIh+BRVjbZnpCmNzVRHS3+fNQXo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cachyos.org; spf=pass smtp.mailfrom=cachyos.org; dkim=pass (2048-bit key) header.d=cachyos.org header.i=@cachyos.org header.b=JefWVdz+; arc=none smtp.client-ip=202.61.224.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cachyos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cachyos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cachyos.org header.i=@cachyos.org header.b="JefWVdz+"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C31E628615F;
	Mon, 20 Apr 2026 08:43:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cachyos.org; s=dkim;
	t=1776667403; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LJzWLZFEISX35Rs59uBo9hOgtFtOe+3g7cfjbMX2Qmk=;
	b=JefWVdz+ilprFWkAbkbM8oD5TzD8lp52/7zlaJhchevXGEw6b1oHf+soiPt9P4Aksjaum9
	qx7J9h4Gbwh8QpjSBUDKqABhGp0L/jNSrozsJExKNb7dvnzcRgxLtdBlXz4zT86YPcn3eT
	xaiagydwdiW8FaZsaNsFzzZf2/8GDLkLYRqV9x0wbo0vgoiuTMlOKJrb/Gwo/P8rE78iej
	D9fJa/iPOVgpMIKYITr19mqP/IpkdZPjOwIBpf35qAs+dHWO1A2E93ENc/JT3Smi1PhK+V
	eeMm06+sbrFt1SXgNmGYsvHvSmvMZUPFIz92PeD6rgYXNMsea3t0J90AE8z3rQ==
Message-ID: <26976b47-8886-4f3c-bdbd-c15e6ac7c44c@cachyos.org>
Date: Mon, 20 Apr 2026 06:43:00 +0000
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v1] ALSA: hda/tas2781: Fix sound abnormal issue on some
 SPI device
To: Baojun Xu <baojun.xu@ti.com>, tiwai@suse.de, hansg@kernel.org
Cc: ilpo.jarvinen@linux.intel.com, broonie@kernel.org,
 andriy.shevchenko@linux.intel.com, shenghao-ding@ti.com,
 13916275206@139.com, platform-driver-x86@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 letitia.tsai@hp.com, bill.yu@canonical.com
References: <20260418055030.765-1-baojun.xu@ti.com>
From: Eric Naim <dnaim@cachyos.org>
In-Reply-To: <20260418055030.765-1-baojun.xu@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 4/18/26 1:50 PM, Baojun Xu wrote:
> In the SPI driver probe, the chip ID must be set to TAS2781. Without this
> initialization, calibration data fails to load correctly, causing audio
> abnormalities on some devices.
> And update the register bulk read API to handle the distinct requirements
> of SPI and I2C devices.
> 
> Fixes: 05ac3846ffe5 ("ALSA: hda/tas2781: A workaround solution to lower-vol issue among lower calibrated-impedance micro-speaker on TAS2781")
> Signed-off-by: Baojun Xu <baojun.xu@ti.com>
> ---
>  sound/hda/codecs/side-codecs/tas2781_hda_spi.c | 1 +
>  sound/soc/codecs/tas2781-fmwlib.c              | 7 +++----
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/hda/codecs/side-codecs/tas2781_hda_spi.c b/sound/hda/codecs/side-codecs/tas2781_hda_spi.c
> index f860e0eb7602..560f2385212d 100644
> --- a/sound/hda/codecs/side-codecs/tas2781_hda_spi.c
> +++ b/sound/hda/codecs/side-codecs/tas2781_hda_spi.c
> @@ -788,6 +788,7 @@ static int tas2781_hda_spi_probe(struct spi_device *spi)
>  	}
>  	if (strstr(dev_name(&spi->dev), "TXNW2781")) {
>  		device_name = "TXNW2781";
> +		tas_hda->priv->chip_id = TAS2781;
>  	} else {
>  		dev_err(tas_priv->dev, "Unmatched spi dev %s\n",
>  			dev_name(&spi->dev));
> diff --git a/sound/soc/codecs/tas2781-fmwlib.c b/sound/soc/codecs/tas2781-fmwlib.c
> index a1d86bd309f4..885e0b6fed00 100644
> --- a/sound/soc/codecs/tas2781-fmwlib.c
> +++ b/sound/soc/codecs/tas2781-fmwlib.c
> @@ -2487,7 +2487,7 @@ static int tas2781_cali_preproc(struct tasdevice_priv *priv, int i)
>  		if (spec == NULL)
>  			return -ENOMEM;
>  		priv->tasdevice[i].cali_specific = spec;
> -		rc = tasdevice_dev_bulk_read(priv, i, p->r0_reg, r0_deflt, 4);
> +		rc = priv->dev_bulk_read(priv, i, p->r0_reg, r0_deflt, 4);
>  		if (rc < 0) {
>  			dev_err(priv->dev, "invalid RE from %d = %d\n", i, rc);
>  			return rc;
> @@ -2511,9 +2511,8 @@ static int tas2781_cali_preproc(struct tasdevice_priv *priv, int i)
>  				TASDEVICE_REG(0, 0x1b, 0x34) :
>  				TASDEVICE_REG(0, 0x18, 0x1c);
>  
> -			rc = tasdevice_dev_bulk_read(priv, i,
> -						      spec->sin_gni_reg,
> -						      spec->sin_gni, 4);
> +			rc = priv->dev_bulk_read(priv, i, spec->sin_gni_reg,
> +						 spec->sin_gni, 4);
>  			if (rc < 0) {
>  				dev_err(priv->dev, "wrong sinegaini %d = %d\n",
>  					i, rc);

Hi Baojun, will this fix
https://lore.kernel.org/linux-sound/20260315160939.191265-1-dnaim@cachyos.org/ ?

Similarly, I noticed that something like the above was merged upstream, commit
0bdf27abaf894.

-- 
Regards,
  Eric

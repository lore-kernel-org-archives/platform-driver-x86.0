Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841AA3A1A38;
	Tue, 31 Mar 2026 13:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774962448; cv=none; b=pkDSQY/m995vhjntr1TuMoy4x8MDnfuuvb2oCpvYnxSyyx/B0mdnDx8BNq4CUnyZSY4urXkpLZlzra6LmiByunI0bJlCVqMXiAAcRRQb4MZFP4in5FOTY4fey+vnFmTOdJqtMqNY8d9fKI8fQyyiKwb5DDfLE09yEnu7DzPcXeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774962448; c=relaxed/simple;
	bh=m/dQNNCdf8VzbAgSsY0f/5y0oTkZH00K8z6PqbqlnRM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=iFGUKodKuC9W1GgvGqOMrQXWyH18CdKjMMR8cOtGUhDNRqnO4jNzdCMhnlxRN6nqVi/U8u35r4ESdZj07+QTk8hybbpOjw5h8ekufRn3Pca8tiwy5iL2qB1+K/6s+UkFYj8Ryz1FtySb/5XGCtfOSsz9G1L27tBDLxwGCod6DU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mVDzcQGg; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mVDzcQGg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774962447; x=1806498447;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=m/dQNNCdf8VzbAgSsY0f/5y0oTkZH00K8z6PqbqlnRM=;
  b=mVDzcQGg/ksIV/z31ULy28z490yojl4qx92W0da35BkkbCVbfMbKSxLY
   YHcrL91mxHjBt2W+bphlNDQPVOaw69EzPV55OypAez79Pf4E7OQPoSiOp
   2lENsh9sB8mNa94S5Qdduul+5DET3XmaBsjW7VJraNBd5zygfOiKewEXR
   JqklL12oKoUw5kKnDNjVU+wj41yL5XCk01RK25Cx2+KEVv/b/IyWx1ueA
   F3DlatcUZfpBNM1eYh0HQimU0jbtx3bRtjwtp4mMQnigUws4JrfFdXpTE
   bQpV5fbRV4LrG8LeP1t/4jl2ZdhnDveMi0MMSDNSZcJhxLckr0WmaXhXZ
   A==;
X-CSE-ConnectionGUID: m981/9CQTZG+X60orEKNyg==
X-CSE-MsgGUID: eksk5bJPTXGb4SIloYwQCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="86272852"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="86272852"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 06:07:26 -0700
X-CSE-ConnectionGUID: NRUdnOiER7iwtb4WrbP2Pw==
X-CSE-MsgGUID: tnmgfyA9S9iRV4WqadeC4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="249580310"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.6])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 06:07:22 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 31 Mar 2026 16:07:18 +0300 (EEST)
To: Ethan Tidmore <ethantidmore06@gmail.com>
cc: Corentin Chary <corentin.chary@gmail.com>, 
    "Luke D . Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
    Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] platform/x86: asus-wmi: Refactor control flow
In-Reply-To: <20260326231154.856729-3-ethantidmore06@gmail.com>
Message-ID: <3d612e74-f224-1dd1-11d8-3d25592614d6@linux.intel.com>
References: <20260326231154.856729-1-ethantidmore06@gmail.com> <20260326231154.856729-3-ethantidmore06@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 26 Mar 2026, Ethan Tidmore wrote:

> Refactor control flow in update_screenpad_bl_status() to avoid
> unnecessary if statements and error checking.
> 
> Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
> ---
>  drivers/platform/x86/asus-wmi.c | 22 +++++++---------------
>  1 file changed, 7 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 80144c412b90..f8e389c54fe4 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -4422,25 +4422,17 @@ static int read_screenpad_brightness(struct backlight_device *bd)
>  static int update_screenpad_bl_status(struct backlight_device *bd)
>  {
>  	u32 ctrl_param = bd->props.brightness;
> -	int err = 0;
> +	int err;
>  
> -	if (bd->props.power) {
> -		err = asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_POWER, 1, NULL);
> -		if (err < 0)
> -			return err;
> +	if (!bd->props.power)
> +		return asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_POWER, 0, NULL);
>  
> -		err = asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_LIGHT, ctrl_param, NULL);
> -		if (err < 0)
> -			return err;
> -	}
>  
> -	if (!bd->props.power) {
> -		err = asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_POWER, 0, NULL);
> -		if (err < 0)
> -			return err;
> -	}
> +	err = asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_POWER, 1, NULL);

Couldn't this 0 / 1 variation be handled without if?

> +	if (err < 0)
> +		return err;
>  
> -	return err;
> +	return asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_LIGHT, ctrl_param, NULL);
>  }
>  
>  static const struct backlight_ops asus_screenpad_bl_ops = {
> 

-- 
 i.


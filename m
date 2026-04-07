Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170D8211A09;
	Tue,  7 Apr 2026 08:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775549281; cv=none; b=fRsX0qNbFEdXpwBs9C5yDpxk1QLZ3zBQI1ozEQ59Ix+TwL4jOv7NZCBvle6bZkQRkMqtIhogCH4GXXPG8YFBvou88+kWhURLBTODk6xEMaV1xboM2/57zqYFa/D1HL6dW8geYVmxwICDFTQIfmM19dZo6SIiukDOZEJyH7ZjRxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775549281; c=relaxed/simple;
	bh=iut05yct6f7w/13JsHfR6bITOW3taCtdjMA4csq8fRk=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=LScpvfQ/H4f3+ZBpWdD2fUROn2DAUYvCKL5OCbJNoChXZ/GoNsMMflGlKcW83v8z+fvOGSKtz45YDU7TrtKyz9StufmY8+pGLILcUCRlgKZofRY1p3DOpkJWDC09pLIiIDLKamrqjZBwh0bTvew84oRZvhB/dn+9ccdScuZQuJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K0N0xsxy; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K0N0xsxy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775549280; x=1807085280;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=iut05yct6f7w/13JsHfR6bITOW3taCtdjMA4csq8fRk=;
  b=K0N0xsxyZGK0Lc6aAT7hXIxQQSoidt6f4yqaLww5fbu/+qjyjTyakS/d
   8qQMPsVhS6OauNgWmZvV4d/AwGTGOqq4g3R/HaTW1oaDlwxPhI750bE1s
   cPf2oidJD7Ssl3Pz9tgskDN5NWVttmnxksBlb5wYq0jX1WuIyAPWVw0KY
   AU2k17+GfQd5ij95Nd3FGKUzxP1mED74bRW7aGdHAjKBNntQLELOXx8wC
   81TzZoXFJFNYIWgZN45HNGDs+bkSS/4i/8wu3uj7wwQ2UH64ooc5xOBoD
   eHpXx5XazP7xejgC5IrPpe8Yx4WutAsBFwvlrJfVbudJ8GmOpgyqNVK+S
   Q==;
X-CSE-ConnectionGUID: Xz19aWpFT6KlkCW67OMC4g==
X-CSE-MsgGUID: YA18C2qsT920CuLTKZsIbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76696094"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="76696094"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 01:08:00 -0700
X-CSE-ConnectionGUID: wUcN6CWsSKGQmSjz/nh0oQ==
X-CSE-MsgGUID: L1dOPlYlTDi4P0du2600Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="225353001"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.110])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 01:07:57 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 7 Apr 2026 11:07:54 +0300 (EEST)
To: Emre Cecanpunar <emreleno@gmail.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>, krishna.chomal108@gmail.com, 
    edip@medip.dev
Subject: Re: [PATCH v3 5/5] platform/x86: hp-wmi: add locking for concurrent
 hwmon access
In-Reply-To: <20260405144502.24944-6-emreleno@gmail.com>
Message-ID: <7809193b-d125-d57f-4875-ce1bc7cbc52f@linux.intel.com>
References: <20260405144502.24944-1-emreleno@gmail.com> <20260405144502.24944-6-emreleno@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 5 Apr 2026, Emre Cecanpunar wrote:

> hp_wmi_hwmon_priv.mode and .pwm are written by hp_wmi_hwmon_write() in
> sysfs context and read by hp_wmi_hwmon_keep_alive_handler() in a
> workqueue. A concurrent write and keep-alive expiry can observe an
> inconsistent mode/pwm pair (e.g. mode=MANUAL with a stale pwm).
> 
> Add a mutex to hp_wmi_hwmon_priv protecting mode and pwm. Hold it in
> hp_wmi_hwmon_write() across the field update and apply call, and in
> hp_wmi_hwmon_keep_alive_handler() before calling apply.
> 
> In hp_wmi_hwmon_read(), only the pwm_enable path reads priv->mode; use
> scoped_guard() there to avoid holding the lock across unrelated WMI
> calls.
> 
> Fixes: c203c59fb5de ("platform/x86: hp-wmi: implement fan keep-alive")
> Signed-off-by: Emre Cecanpunar <emreleno@gmail.com>
> ---
>  drivers/platform/x86/hp/hp-wmi.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index db72ad9da0a5..1096fb46cbcd 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -453,6 +453,7 @@ enum pwm_modes {
>  };
>  
>  struct hp_wmi_hwmon_priv {
> +	struct mutex lock;	/* protects mode, pwm */
>  	u8 min_rpm;
>  	u8 max_rpm;
>  	int gpu_delta;
> @@ -2422,6 +2423,7 @@ static int hp_wmi_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
>  {
>  	struct hp_wmi_hwmon_priv *priv;
>  	int rpm, ret;
> +	u8 mode;
>  
>  	priv = dev_get_drvdata(dev);
>  	switch (type) {
> @@ -2445,11 +2447,13 @@ static int hp_wmi_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
>  			*val = rpm_to_pwm(rpm / 100, priv);
>  			return 0;
>  		}
> -		switch (priv->mode) {
> +		scoped_guard(mutex, &priv->lock)
> +			mode = priv->mode;
> +		switch (mode) {
>  		case PWM_MODE_MAX:
>  		case PWM_MODE_MANUAL:
>  		case PWM_MODE_AUTO:
> -			*val = priv->mode;
> +			*val = mode;
>  			return 0;
>  		default:
>  			/* shouldn't happen */
> @@ -2467,6 +2471,7 @@ static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
>  	int rpm;
>  
>  	priv = dev_get_drvdata(dev);
> +	guard(mutex)(&priv->lock);
>  	switch (type) {
>  	case hwmon_pwm:
>  		if (attr == hwmon_pwm_input) {
> @@ -2535,6 +2540,8 @@ static void hp_wmi_hwmon_keep_alive_handler(struct work_struct *work)
>  
>  	dwork = to_delayed_work(work);
>  	priv = container_of(dwork, struct hp_wmi_hwmon_priv, keep_alive_dwork);
> +
> +	guard(mutex)(&priv->lock);
>  	/*
>  	 * Re-apply the current hwmon context settings.
>  	 * NOTE: hp_wmi_apply_fan_settings will handle the re-scheduling.
> @@ -2592,6 +2599,8 @@ static int hp_wmi_hwmon_init(void)
>  	if (!priv)
>  		return -ENOMEM;
>  
> +	mutex_init(&priv->lock);

Please use devm_mutex_init() so you don't need to deinit it manually with 
mutex_destroy(). While changing that, don't forget that devm_*() can fail 
so remember to handle the error.

-- 
 i.


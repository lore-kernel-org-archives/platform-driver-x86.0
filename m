Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722AA19CCEC;
	Fri, 17 Jan 2025 17:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737133316; cv=none; b=QyEkeHsK9IvqlQK91IDE7NPf8bfCifNHEjfxQs0fgiUfc1+ttwnX39/p1suvtIR2oDrWaGindCNuA8nvgn5bB5YlYjy6wRrGKJlXNfLU1ZpAWulB0cPmyhO9Zh0Gxr44tWlkpr+jc5TAQv6avRw33a9Ge3WqLoX90gBrO+Vi3y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737133316; c=relaxed/simple;
	bh=Zak9Rk0Ugc3hdlJ672YO13qQzG8eT3IoV9mYHq5dHdo=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=oVyBugz9m5o4C7A1g2VcAE1yCbGvss5WqpxCBvIJDVNIZmv9lgHRQ+Is2eWIqH+Xein0DTTrnAg6nrp0jzfHXHTmT1psgUQtEjl00x92+KPSVuA1iOJHEiP+mA+fSiBNV7jvfVOO3X2uLMGFIVSYB7yUXiSIZ18aDIaCPMpih6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hPu8TyA/; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hPu8TyA/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737133314; x=1768669314;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Zak9Rk0Ugc3hdlJ672YO13qQzG8eT3IoV9mYHq5dHdo=;
  b=hPu8TyA/POPIj/ifj+DJy7CVsSkRP8iJQchWg3hfiKOoXpAn3+hZAUkW
   1ud2ZvcxNuxL85XvoOkhJJlJdPWEs1H2QZcfwG1wj/Ftcqt6pHxQ+7JdB
   v0EA1plhyXBH/p+vI/kmUR1W8s/p+Ke8MiPJcGLmH0QPByfx7uHsOpRDh
   VryOfcE2+2QJ1Msb7hH5S+C1NGYYz0z0X5pggyArdXYzmw1CTyWihzt1Q
   H431dDfrDtKuW+Cb6mmmTWhPdQ0SfWtoKObDSBI/Deadjt4u7acGEuNwb
   XN4YDLT4FURKxiPP5YJmrFCGJaS6O6nkNjMWWlIlF8OfyM7jOJmBxW3mu
   w==;
X-CSE-ConnectionGUID: QrfVv34MSQ6ABPYWg+/mBA==
X-CSE-MsgGUID: Q2o+zOpbTomP3pObScjy3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="48234345"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="48234345"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 09:01:54 -0800
X-CSE-ConnectionGUID: zohtRfqrRQyBnHruY2TdTA==
X-CSE-MsgGUID: a/xLw8J0RuiZiePkREEQTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="110846239"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.76])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 09:01:51 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 17 Jan 2025 19:01:48 +0200 (EET)
To: Ai Chao <aichao@kylinos.cn>
cc: Hans de Goede <hdegoede@redhat.com>, vadimp@nvidia.com, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/mellanox: mlxreg-io: use sysfs_emit() instead
 of sprintf()
In-Reply-To: <20250116081129.2902274-1-aichao@kylinos.cn>
Message-ID: <92bf6914-1fa8-124e-69c9-36cb31586e0a@linux.intel.com>
References: <20250116081129.2902274-1-aichao@kylinos.cn>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 16 Jan 2025, Ai Chao wrote:

> Follow the advice in Documentation/filesystems/sysfs.rst:
> show() should only use sysfs_emit() or sysfs_emit_at() when formatting
> the value to be returned to user space.
> 
> Signed-off-by: Ai Chao <aichao@kylinos.cn>

Hi,

I've now applied these 3 into the review-ilpo-next branch. Next time, 
however, please make a patch series out of cleanups of same kind so it'll 
be easier for me to handle them as a single set of patches. Thank you.

-- 
 i.

> ---
>  drivers/platform/mellanox/mlxreg-io.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/mellanox/mlxreg-io.c b/drivers/platform/mellanox/mlxreg-io.c
> index 595276206baf..97fefe6c38d1 100644
> --- a/drivers/platform/mellanox/mlxreg-io.c
> +++ b/drivers/platform/mellanox/mlxreg-io.c
> @@ -126,7 +126,7 @@ mlxreg_io_attr_show(struct device *dev, struct device_attribute *attr,
>  
>  	mutex_unlock(&priv->io_lock);
>  
> -	return sprintf(buf, "%u\n", regval);
> +	return sysfs_emit(buf, "%u\n", regval);
>  
>  access_error:
>  	mutex_unlock(&priv->io_lock);
> 

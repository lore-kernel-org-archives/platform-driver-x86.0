Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664FE368276;
	Tue, 24 Feb 2026 08:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771923077; cv=none; b=jFsrKx8QWQPIvEfSNCKJLXzJKxS3OUklRx5ateuTpZwvhqzQ8kgxi8gm9xoGJRUW76MuJefyEZhWiyQTLu4kJtOr8gf84+PDBXkyyBud24imDCBnCw1tqNJR11sKRRgR8j4LA++mMvZwsI8Odiegz+E0CoiigPgbzJwx3W6Za+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771923077; c=relaxed/simple;
	bh=aIutRQHoucjMHHa3N8jUu8kQoy0zU+7dzeNs1KnKmAc=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=mIfkHxeJ3r/jai777WQPVYl0d/Z0ViVt6v/TvWBjnJkEoQ/Re+NbP28T6SCFOvK2k0JFNgMHFRVSatVh7WO62CGsxASpJFVLjsHJtAW/Jt6v1wrtRrim0IyX6pbBv5R6x0EpR5YuFzuCD2NTafh7AXf6/Z9cS1pEeZlAT436b9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dPWKIAed; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dPWKIAed"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771923076; x=1803459076;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=aIutRQHoucjMHHa3N8jUu8kQoy0zU+7dzeNs1KnKmAc=;
  b=dPWKIAedf2qYmKrR8aqkKIVO/YIjeIl8y7JQ9XICwlCFxiEb46uQSkmL
   GCBoCZieB8k0gLCm5oNFs/GX3r+bZvIyW/GJtmpanDNSXImIdVAMnbl3/
   jFvh+mMSFJ8MP8Tb9T8ocwalLmNriKwe0thSjv/srO2gULiFOBywosZEE
   nWsHO7EzxBoAU9skcHfS73mLBgCFQGbjoGCa1vhDZIAZHPBPyrtmAkojN
   Us5TWZ/Kkmes2kFYe2H/He7WOYjt8CP1P1fdTd1J4uFzuMg9keHul7ZIH
   XZS2qBMm+1UsuHR/PcZgublowaiTTzuBx+iew0/9/EDMfY3d+wp0/1H6f
   A==;
X-CSE-ConnectionGUID: kvhq+ZoAQcyTq1arJyQLwA==
X-CSE-MsgGUID: mLrxoGiMRTeezwHw+Igcdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="83554219"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="83554219"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 00:51:16 -0800
X-CSE-ConnectionGUID: AhE97jWwRwKBuyQel0CsdQ==
X-CSE-MsgGUID: umhkQOHSTLmcjIh+dcd2Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="246419031"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.133])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 00:51:12 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 24 Feb 2026 10:51:09 +0200 (EET)
To: "Derek J. Clark" <derekjohn.clark@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
    Armin Wolf <W_Armin@gmx.de>, Jonathan Corbet <corbet@lwn.net>, 
    Rong Zhang <i@rong.moe>, Kurt Borja <kuurtb@gmail.com>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 5/6] platform-x86: lenovo-wmi-other: Rename
 LWMI_OM_FW_ATTR_BASE_PATH
In-Reply-To: <20260224043200.2680384-6-derekjohn.clark@gmail.com>
Message-ID: <feffe361-7013-14a2-093a-8e2d826b2282@linux.intel.com>
References: <20260224043200.2680384-1-derekjohn.clark@gmail.com> <20260224043200.2680384-6-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 24 Feb 2026, Derek J. Clark wrote:

> In the next patch a power supply extension is added which requires
> a name attribute. Instead of creating another const macro with the
> same information, replace LWMI_OM_FW_ATTR_BASE_PATH with
> LWMI_OM_NAME and use that for firmware attributes and power supply

This doesn't match the code change??

> extension.
> 
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
>  drivers/platform/x86/lenovo/wmi-other.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
> index 67768f6a50e0..7f0d5a17b44f 100644
> --- a/drivers/platform/x86/lenovo/wmi-other.c
> +++ b/drivers/platform/x86/lenovo/wmi-other.c
> @@ -90,13 +90,13 @@ enum lwmi_feature_id_gpu {
>  #define LWMI_FAN_NR 4
>  #define LWMI_FAN_ID(x) ((x) + LWMI_FAN_ID_BASE)
>  
> +#define LWMI_FAN_DIV 100
> +
>  #define LWMI_ATTR_ID_FAN_RPM(x)                                   \
>  	LWMI_ATTR_ID(LWMI_DEVICE_ID_FAN, LWMI_FEATURE_ID_FAN_RPM, \
>  		     LWMI_GZ_THERMAL_MODE_NONE, LWMI_FAN_ID(x))
>  
> -#define LWMI_FAN_DIV 100

Unrelated change.

> -
> -#define LWMI_OM_FW_ATTR_BASE_PATH "lenovo-wmi-other"
> +#define LWMI_OM_SYSFS_NAME "lenovo-wmi-other"
>  #define LWMI_OM_HWMON_NAME "lenovo_wmi_other"
>  
>  static BLOCKING_NOTIFIER_HEAD(om_chain_head);
> @@ -1233,8 +1233,7 @@ static int lwmi_om_fw_attr_add(struct lwmi_om_priv *priv)
>  
>  	priv->fw_attr_dev = device_create(&firmware_attributes_class, NULL,
>  					  MKDEV(0, 0), NULL, "%s-%u",
> -					  LWMI_OM_FW_ATTR_BASE_PATH,
> -					  priv->ida_id);
> +					  LWMI_OM_SYSFS_NAME, priv->ida_id);
>  	if (IS_ERR(priv->fw_attr_dev)) {
>  		err = PTR_ERR(priv->fw_attr_dev);
>  		goto err_free_ida;
> 

-- 
 i.


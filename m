Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E390F1F30A9;
	Tue, 24 Feb 2026 08:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771922538; cv=none; b=q8gHdtl0+LZKWsbkXJ8xbK9dN6IefoqHNa7rXWW7xwuFBYMYwJ07FrCfk4zG4guikY1r6N3yVR15cRwnLw127VayrEI9xB5wUQtyzpcc1uGlZWQr8gocEJpvIoUZfnoWLPXGQWDvWrnoG1unUbruOmAojPTtHSFcuoGgOlfei58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771922538; c=relaxed/simple;
	bh=4vIe/QMBKYy5kpIqRPd3ZXsHx5eF0dAE61BCdYJemEM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=pTPxbwSuKU8qst3QEaw3RwSMUyItJwBEcN31sDWbuPHsjGOG4q/ywQe7eDKTd6yy4VadK7OkAN9HZYcyJQz15Q0yYUinj142ABCM0zGP5fd5kGvQ5y5scUaVZDowYZ6isxiwDz7YbhEDPDzjX8Emz7MPEkX685lGn47wsGSnCDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bfxhCKbV; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bfxhCKbV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771922537; x=1803458537;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=4vIe/QMBKYy5kpIqRPd3ZXsHx5eF0dAE61BCdYJemEM=;
  b=bfxhCKbVw6HEU8ukhy7ahg6X7imXh6kdNeCBLguEdn56SRY8Z94hN8x5
   mLgIg77wctU0oRAfcXwLl6P0j/5L0uMuFHfWZmRRFO2gZCNGUCGMlJy/L
   BGSX/7zGeCmAHnUz4AYuUAmPZ94xs/G9tZz8HdG9obgpdrs1wHUxqfjky
   Srg00AtxriUg0t1dByT2oBgY8L5wbaBsyjiLdI8LJNXeN3OxKE22eGlWb
   0ldElbEaYLjx4fdgIGx4jcHpt5QpcB4SRpM9osfJtykLGxW2DDU4njHsV
   rDf01MiiqV7yFuKMHgEK6NUo5gGvcH3VfUEHRaKdyBxwyseIC7KmNbJ7P
   A==;
X-CSE-ConnectionGUID: dC9Vro4FSYyUgJSHOgFi2Q==
X-CSE-MsgGUID: CXiby3H9TZ2IRybIfCwa6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="83553391"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="83553391"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 00:42:15 -0800
X-CSE-ConnectionGUID: 3wVL7pDrRheG5tikFQf7fw==
X-CSE-MsgGUID: dVV4d19sS2G3JRWT8TKJHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="220355817"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.133])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 00:42:11 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 24 Feb 2026 10:42:08 +0200 (EET)
To: "Derek J. Clark" <derekjohn.clark@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
    Armin Wolf <W_Armin@gmx.de>, Jonathan Corbet <corbet@lwn.net>, 
    Rong Zhang <i@rong.moe>, Kurt Borja <kuurtb@gmail.com>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/6] platform/x86: lenovo-wmi-other: Add LWMI_ATTR_ID
 Macro
In-Reply-To: <20260224043200.2680384-2-derekjohn.clark@gmail.com>
Message-ID: <c8031935-0dab-59d0-a23f-b93c203ef95f@linux.intel.com>
References: <20260224043200.2680384-1-derekjohn.clark@gmail.com> <20260224043200.2680384-2-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 24 Feb 2026, Derek J. Clark wrote:

> Adds LWMI_ATTR_ID macro. In the same vein as LWMI_ATTR_ID_FAN_RPM,
> but as a generic, to de-duplicate attribute_id assignment biolerplate.
> 
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
>  drivers/platform/x86/lenovo/wmi-capdata.h  |  6 ++++
>  drivers/platform/x86/lenovo/wmi-gamezone.h |  1 +
>  drivers/platform/x86/lenovo/wmi-other.c    | 36 ++++++----------------
>  3 files changed, 17 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/platform/x86/lenovo/wmi-capdata.h b/drivers/platform/x86/lenovo/wmi-capdata.h
> index 8c1df3efcc55..27202e2dc8a5 100644
> --- a/drivers/platform/x86/lenovo/wmi-capdata.h
> +++ b/drivers/platform/x86/lenovo/wmi-capdata.h
> @@ -17,6 +17,12 @@
>  #define LWMI_ATTR_MODE_ID_MASK	GENMASK(15, 8)
>  #define LWMI_ATTR_TYPE_ID_MASK	GENMASK(7, 0)
>  
> +#define LWMI_ATTR_ID(dev, feat, mode, type) \
> +	(FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, dev) | \
> +	 FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, feat) | \
> +	 FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, mode) | \
> +	 FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, type))

Why does this need to be macro? Static inline would have proper types.

> +
>  #define LWMI_DEVICE_ID_FAN	0x04
>  
>  struct component_match;
> diff --git a/drivers/platform/x86/lenovo/wmi-gamezone.h b/drivers/platform/x86/lenovo/wmi-gamezone.h
> index 6b163a5eeb95..ddb919cf6c36 100644
> --- a/drivers/platform/x86/lenovo/wmi-gamezone.h
> +++ b/drivers/platform/x86/lenovo/wmi-gamezone.h
> @@ -10,6 +10,7 @@ enum gamezone_events_type {
>  };
>  
>  enum thermal_mode {
> +	LWMI_GZ_THERMAL_MODE_NONE =	   0x00,
>  	LWMI_GZ_THERMAL_MODE_QUIET =	   0x01,
>  	LWMI_GZ_THERMAL_MODE_BALANCED =	   0x02,
>  	LWMI_GZ_THERMAL_MODE_PERFORMANCE = 0x03,
> diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
> index 6040f45aa2b0..95886df39c8d 100644
> --- a/drivers/platform/x86/lenovo/wmi-other.c
> +++ b/drivers/platform/x86/lenovo/wmi-other.c
> @@ -71,10 +71,9 @@
>  #define LWMI_FAN_NR 4
>  #define LWMI_FAN_ID(x) ((x) + LWMI_FAN_ID_BASE)
>  
> -#define LWMI_ATTR_ID_FAN_RPM(x)						\
> -	(FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, LWMI_DEVICE_ID_FAN) |	\
> -	 FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, LWMI_FEATURE_ID_FAN_RPM) |	\
> -	 FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, LWMI_FAN_ID(x)))
> +#define LWMI_ATTR_ID_FAN_RPM(x)                                   \
> +	LWMI_ATTR_ID(LWMI_DEVICE_ID_FAN, LWMI_FEATURE_ID_FAN_RPM, \
> +		     LWMI_GZ_THERMAL_MODE_NONE, LWMI_FAN_ID(x))
>  
>  #define LWMI_FAN_DIV 100
>  
> @@ -716,12 +715,8 @@ static ssize_t attr_capdata01_show(struct kobject *kobj,
>  	u32 attribute_id;
>  	int value, ret;
>  
> -	attribute_id =
> -		FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_id) |
> -		FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
> -		FIELD_PREP(LWMI_ATTR_MODE_ID_MASK,
> -			   LWMI_GZ_THERMAL_MODE_CUSTOM) |
> -		FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
> +	attribute_id = LWMI_ATTR_ID(tunable_attr->device_id, tunable_attr->feature_id,
> +				    LWMI_GZ_THERMAL_MODE_CUSTOM, tunable_attr->type_id);
>  
>  	ret = lwmi_cd01_get_data(priv->cd01_list, attribute_id, &capdata);
>  	if (ret)
> @@ -776,7 +771,6 @@ static ssize_t attr_current_value_store(struct kobject *kobj,
>  	struct wmi_method_args_32 args;
>  	struct capdata01 capdata;
>  	enum thermal_mode mode;
> -	u32 attribute_id;
>  	u32 value;
>  	int ret;
>  
> @@ -787,13 +781,10 @@ static ssize_t attr_current_value_store(struct kobject *kobj,
>  	if (mode != LWMI_GZ_THERMAL_MODE_CUSTOM)
>  		return -EBUSY;
>  
> -	attribute_id =
> -		FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_id) |
> -		FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
> -		FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, mode) |
> -		FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
> +	args.arg0 = LWMI_ATTR_ID(tunable_attr->device_id, tunable_attr->feature_id,
> +				 mode, tunable_attr->type_id);
>  
> -	ret = lwmi_cd01_get_data(priv->cd01_list, attribute_id, &capdata);
> +	ret = lwmi_cd01_get_data(priv->cd01_list, args.arg0, &capdata);
>  	if (ret)
>  		return ret;
>  
> @@ -804,7 +795,6 @@ static ssize_t attr_current_value_store(struct kobject *kobj,
>  	if (value < capdata.min_value || value > capdata.max_value)
>  		return -EINVAL;
>  
> -	args.arg0 = attribute_id;
>  	args.arg1 = value;
>  
>  	ret = lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_SET,
> @@ -838,7 +828,6 @@ static ssize_t attr_current_value_show(struct kobject *kobj,
>  	struct lwmi_om_priv *priv = dev_get_drvdata(tunable_attr->dev);
>  	struct wmi_method_args_32 args;
>  	enum thermal_mode mode;
> -	u32 attribute_id;
>  	int retval;
>  	int ret;
>  
> @@ -846,13 +835,8 @@ static ssize_t attr_current_value_show(struct kobject *kobj,
>  	if (ret)
>  		return ret;
>  
> -	attribute_id =
> -		FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_id) |
> -		FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
> -		FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, mode) |
> -		FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
> -
> -	args.arg0 = attribute_id;
> +	args.arg0 = LWMI_ATTR_ID(tunable_attr->device_id, tunable_attr->feature_id,
> +				 mode, tunable_attr->type_id);
>  
>  	ret = lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_GET,
>  				    (unsigned char *)&args, sizeof(args),
> 

-- 
 i.


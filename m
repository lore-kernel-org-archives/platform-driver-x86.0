Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7AA3ED5D0;
	Fri,  8 May 2026 14:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778250131; cv=none; b=HEtWMGf882kRI9vKVlSlbooU+gO037rN/blCDBUyo3jzpC2iJXTY5hitxUmtwW0R+T0mgypEnDQbRKvdP2y/EuSmMM/7mINoDXLtUBD5M4O83GKw8x6bjVEgAIW8q/qQpmhKzurWbb/7fkTdxUYotMBzrP+nGgD5TqXZZNPT8VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778250131; c=relaxed/simple;
	bh=v7afZcacPM2gJOIIA91rEM2iysrWC0ISbOfxDCx9BSA=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Fjz3c8tQawSlsRPDs/YXoBF2OWg0sv14C487Do19ks/nlsMsLhWZpsLofZyNK1SvrC7wQTa+4HMD7bNX/MTl6cJTJ4EnnJK0sQ9geRHyzCiTL98PdaoTfUh304vea0vlIIDnWN3/AkzW4i4wrkcZx8OEhFih8pKG0GielPAshw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m3hwuWfS; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m3hwuWfS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778250130; x=1809786130;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=v7afZcacPM2gJOIIA91rEM2iysrWC0ISbOfxDCx9BSA=;
  b=m3hwuWfS+kCdqeo2+Ovo/XHUghIbAIxB+jzjNt41SUfnZeO5yi56/FYn
   Jw1CC69/SODWtN3RGAReHp6357I12siDzrnIHAp2JF8nQb5R5RdCCGQku
   tvmJXdhuPHGs4P8oY+S/10ja90HW//Edb/IMXPctH8D+5v2SfyeV0g3Ox
   uZsyanJm08ZM1QvnM9qFUhnjB6DCFg3WLdbZK8NNcH2vpwxPnfLwCAevj
   q5na+I/PLYmv2JAxN69V+9STizFGGCvUM9G7MMdvUJx4JUogl9WuGRwM+
   HILfuDaPnXjELoifmBpr+G999V/lpRC/Mnr+XNctjB5iJQiZzNKOC0ILS
   w==;
X-CSE-ConnectionGUID: f/ePAdlBTCi96bA7zzufiQ==
X-CSE-MsgGUID: asSqokD8ShKbke+S83cKwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="79157841"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="79157841"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 07:22:09 -0700
X-CSE-ConnectionGUID: TC9zmMPXSlap/1QE5kyIhg==
X-CSE-MsgGUID: PWVu5hs9S1iLODpo/h3rzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="260227550"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.100])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 07:22:04 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 8 May 2026 17:22:00 +0300 (EEST)
To: "Derek J. Clark" <derekjohn.clark@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
    Armin Wolf <W_Armin@gmx.de>, Jonathan Corbet <corbet@lwn.net>, 
    Rong Zhang <i@rong.moe>, Kurt Borja <kuurtb@gmail.com>, 
    "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>, 
    =?ISO-8859-15?Q?N=EDcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>, 
    marshall@shzj.cc, hyacinth@shzj.cc, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH v11 04/15] platform/x86: lenovo-wmi-other: Zero initialize
 WMI arguments
In-Reply-To: <20260507180507.912966-5-derekjohn.clark@gmail.com>
Message-ID: <10f8f349-8777-cada-8242-250aa27dc933@linux.intel.com>
References: <20260507180507.912966-1-derekjohn.clark@gmail.com> <20260507180507.912966-5-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 7 May 2026, Derek J. Clark wrote:

> Adds explicit initialization of wmi_method_args_32 declarations with
> zero values to prevent uninitialized data from being sent to the device
> BIOS when passed.
> 
> No functional change intended.

Missing empty line.

> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Fixes: 22024ac5366f ("platform/x86: Add Lenovo Gamezone WMI Driver")
> Fixes: edc4b183b794 ("platform/x86: Add Lenovo Other Mode WMI Driver")
> Reported-by: Rong Zhang <i@rong.moe>
> Closes: https://lore.kernel.org/platform-driver-x86/95c7e7b539dd0af41189c754fcd35cec5b6fe182.camel@rong.moe/
> Cc: stable@vger.kernel.org
> Reviewed-by: Rong Zhang <i@rong.moe>
> Tested-by: Rong Zhang <i@rong.moe>
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
> v7:
>   - Include lwmi_gz_profile_set() fix as well.
> ---
>  drivers/platform/x86/lenovo/wmi-gamezone.c | 2 +-
>  drivers/platform/x86/lenovo/wmi-other.c    | 6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/lenovo/wmi-gamezone.c b/drivers/platform/x86/lenovo/wmi-gamezone.c
> index 381836d29a96..ca559e6c031d 100644
> --- a/drivers/platform/x86/lenovo/wmi-gamezone.c
> +++ b/drivers/platform/x86/lenovo/wmi-gamezone.c
> @@ -203,7 +203,7 @@ static int lwmi_gz_profile_set(struct device *dev,
>  			       enum platform_profile_option profile)
>  {
>  	struct lwmi_gz_priv *priv = dev_get_drvdata(dev);
> -	struct wmi_method_args_32 args;
> +	struct wmi_method_args_32 args = {};
>  	enum thermal_mode mode;
>  	int ret;
>  
> diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
> index a6be3463341c..1e06b894cfcc 100644
> --- a/drivers/platform/x86/lenovo/wmi-other.c
> +++ b/drivers/platform/x86/lenovo/wmi-other.c
> @@ -166,7 +166,7 @@ MODULE_PARM_DESC(relax_fan_constraint,
>   */
>  static int lwmi_om_fan_get_set(struct lwmi_om_priv *priv, int channel, u32 *val, bool set)
>  {
> -	struct wmi_method_args_32 args;
> +	struct wmi_method_args_32 args = {};
>  	u32 method_id, retval;
>  	int err;
>  
> @@ -773,7 +773,7 @@ static ssize_t attr_current_value_store(struct kobject *kobj,
>  					struct tunable_attr_01 *tunable_attr)
>  {
>  	struct lwmi_om_priv *priv = dev_get_drvdata(tunable_attr->dev);
> -	struct wmi_method_args_32 args;
> +	struct wmi_method_args_32 args = {};
>  	struct capdata01 capdata;
>  	enum thermal_mode mode;
>  	u32 attribute_id;
> @@ -836,7 +836,7 @@ static ssize_t attr_current_value_show(struct kobject *kobj,
>  				       struct tunable_attr_01 *tunable_attr)
>  {
>  	struct lwmi_om_priv *priv = dev_get_drvdata(tunable_attr->dev);
> -	struct wmi_method_args_32 args;
> +	struct wmi_method_args_32 args = {};
>  	enum thermal_mode mode;
>  	u32 attribute_id;
>  	int retval;
> 

-- 
 i.


Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C434D145FF4
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Jul 2024 11:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722254108; cv=none; b=RvSWbBdKFfC+ZpOlVCX3fpCT5Grz9rPAeTIXGr/hpZvCOCWF6U65Jt31vSuKae9nqvW9oICTTa49bT8d3u58wTYWWDgOUGX11/BXDDZjOx4KgddxFwwe9V1d+Uf90eyZnR0VLA90HijW8VoG4/pxzWWLYxRY8J+1WKEhysEGB8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722254108; c=relaxed/simple;
	bh=QXEoSc+2bonPy42eCJkisCt1tRxqm1LJwcCtRrWQzLY=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=dDWGI3kMfeNTToAGSJiJKugA99xqRn+zAD/ro9b6xveJbslzVRpySYD52gdhDKPCPQHSe8li/q2HdAj+KhA0WZ0StZgj7i131smSRPGfxdaWpkMJY+FnEC3oDLbbXSj6pDZrBVar8VHLgrrRROW3ZIeS43DFEIwzrWMpSRpU+UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m3raI2bu; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m3raI2bu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722254106; x=1753790106;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=QXEoSc+2bonPy42eCJkisCt1tRxqm1LJwcCtRrWQzLY=;
  b=m3raI2buJ/xO2v/aHyAG7A4LTQTY6pYgzhFZpUPqm001u9oHFp29IJsn
   wzpsulweUhbNt1WCGocWXq8GNqSzNqm2KWPiYvHfcxtkMERC3AsM2iqHo
   25MLrgsRSfRPrhhOuHsyVySCxUe3AS/PHA7SWLYh/rEldjRczbghkm3NY
   7q6vQCrVW/CsdpyhIehLsPLPtODCxddSyDQvhbecOjfAr/8ebnpUJjba4
   2BXhNPd9aO+/9uoy0USfw3o5HzovQqNohTZ3gKjTlZSC+13dgeYAmkRxi
   X4pNwTyNPmxGap1YrCffGLpPW1AYoPNes12uxjqEDbJi6lNslrUTCHagM
   w==;
X-CSE-ConnectionGUID: 9W7khwl9T+awpDouUpeU0g==
X-CSE-MsgGUID: 5sKmXhm4Rk2dCYoYWnNHew==
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="22912525"
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; 
   d="scan'208";a="22912525"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 04:55:06 -0700
X-CSE-ConnectionGUID: H7dAxraoSuq/uk4Qu82N6g==
X-CSE-MsgGUID: 2OuLiIgwRUqp99IvCGIPlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; 
   d="scan'208";a="53613271"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.245.151])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 04:55:04 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 29 Jul 2024 14:55:00 +0300 (EEST)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    Patil.Reddy@amd.com
Subject: Re: [PATCH 2/2] platform/x86/amd/pmf: Fix to Update HPD Data When
 ALS is Disabled
In-Reply-To: <20240723132451.3488326-2-Shyam-sundar.S-k@amd.com>
Message-ID: <cdbf07d3-1d9c-f1bc-d548-c3509d5586dd@linux.intel.com>
References: <20240723132451.3488326-1-Shyam-sundar.S-k@amd.com> <20240723132451.3488326-2-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 23 Jul 2024, Shyam Sundar S K wrote:

> If the Ambient Light Sensor (ALS) is disabled, the current code in the PMF
> driver does not query for Human Presence Detection (HPD) data in
> amd_pmf_get_sensor_info(). As a result, stale HPD data is used by PMF-TA
> to evaluate policy conditions, leading to unexpected behavior in the policy
> output actions.
> 
> To resolve this issue, modify the PMF driver to query HPD data
> independently of ALS.
> 
> With this change, amd_pmf_get_sensor_info() now returns void instead of
> int.
> 
> Fixes: cedecdba60f4 ("platform/x86/amd/pmf: Get ambient light information from AMD SFH driver")
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/spc.c | 33 +++++++++++++++---------------
>  1 file changed, 16 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
> index a3dec14c3004..d9e60d63553c 100644
> --- a/drivers/platform/x86/amd/pmf/spc.c
> +++ b/drivers/platform/x86/amd/pmf/spc.c
> @@ -150,7 +150,7 @@ static int amd_pmf_get_slider_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_
>  	return 0;
>  }
>  
> -static int amd_pmf_get_sensor_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
> +static void amd_pmf_get_sensor_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
>  {
>  	struct amd_sfh_info sfh_info;
>  	int ret;
> @@ -160,26 +160,25 @@ static int amd_pmf_get_sensor_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_
>  	if (!ret)
>  		in->ev_info.ambient_light = sfh_info.ambient_light;
>  	else
> -		return ret;
> +		dev_dbg(dev->dev, "ALS is not enabled\n");
>  
>  	/* get HPD data */
>  	ret = amd_get_sfh_info(&sfh_info, MT_HPD);
> -	if (ret)
> -		return ret;
> -
> -	switch (sfh_info.user_present) {
> -	case SFH_NOT_DETECTED:
> -		in->ev_info.user_present = 0xff; /* assume no sensors connected */
> -		break;
> -	case SFH_USER_PRESENT:
> -		in->ev_info.user_present = 1;
> -		break;
> -	case SFH_USER_AWAY:
> -		in->ev_info.user_present = 0;
> -		break;
> +	if (!ret) {
> +		switch (sfh_info.user_present) {
> +		case SFH_NOT_DETECTED:
> +			in->ev_info.user_present = 0xff; /* assume no sensors connected */
> +			break;
> +		case SFH_USER_PRESENT:
> +			in->ev_info.user_present = 1;
> +			break;
> +		case SFH_USER_AWAY:
> +			in->ev_info.user_present = 0;
> +			break;
> +		}
> +	} else {
> +		dev_dbg(dev->dev, "HPD is not enabled\n");

Is it okay to leave in->ev_info.user_present as 0 this case? Should it be 
set to same as with SFH_NOT_DETECTED?

...I now realize your print out doesn't cover that case at all and 
user_present is not used for anything else than debug printing.

-- 
 i.

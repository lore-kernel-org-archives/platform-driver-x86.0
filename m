Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450DF3A8C0
	for <platform-driver-x86@vger.kernel.org>; Fri, 29 Mar 2024 18:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711738193; cv=none; b=dBwCVrHELU/F+O1Bs8yovHRjgIp/beugeOS63SSqq/N5zy1wJjoFn8QrF5UMXO9rs8MDrpAJmigu/uiih8+Jw39nmlBcmn5SQoq17MdSOF6OesYWk9kNaIDw2/TC8dfG8oFc8mMulrDzPwrQXmTQ0oX5GlanjIA0xhAxO6uznHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711738193; c=relaxed/simple;
	bh=gmfHhI8RmfDDL7c91uDBGZ1rX1YSvB2mlPO3F7a8yeU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fAFrQMdbH7T6gM0TuDq3MmFp0Dyf2puiitz/MODZA19oz3BoRuSp3ehrxVK6SJ5QoM15hg6ut4acjz27c4RsucIugs8wT1wBLzB9UA1rJcJ7fPcM2UMf+ZarmUsvZhLB2W6QMIfsYc2OSCBgACeoRZCwtsB5QsY5pSZ/BL8dz2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZSzB+Et+; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZSzB+Et+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711738191; x=1743274191;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=gmfHhI8RmfDDL7c91uDBGZ1rX1YSvB2mlPO3F7a8yeU=;
  b=ZSzB+Et+pPnOy32jdd5+uPLfYNAnbvyq19nTZMTmfy9nVl8S2aC+2SFq
   xAZoDtJtj789tF2zvr8KrxIW6p1IEseOGfTQnCk4q0MkWlQc2suT554kI
   K7p7CnKlzLNWIsFVS3O4H/O1U++RV72l4yijdujYB2rFL2nfjWc/jra/D
   zbF0tidAqzv+nT2N4MxDDIm0pjIfxMJ+omeLChowMZfqBmDeFXK47JHjr
   ryHsbFQiHEl9Zw3Y+cKXgDYdllXagOdx/948ivmfU/SlnKFhVxRH7VRHa
   A2nePVp4dI/kZrZWn6dFYTuLzPlYSlWbGLm6lE5ap5cmrzjPTHddtZh6w
   w==;
X-CSE-ConnectionGUID: HyJzzFfiQCOUXCT/L26spQ==
X-CSE-MsgGUID: 6O9wLP1MRrisIO9vEBMHJA==
X-IronPort-AV: E=McAfee;i="6600,9927,11028"; a="6790008"
X-IronPort-AV: E=Sophos;i="6.07,165,1708416000"; 
   d="scan'208";a="6790008"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2024 11:49:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,165,1708416000"; 
   d="scan'208";a="21507618"
Received: from hkannan-mobl.amr.corp.intel.com (HELO [10.209.48.27]) ([10.209.48.27])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2024 11:49:50 -0700
Message-ID: <030a3bb8-6246-4289-b188-65ad3fc72d62@linux.intel.com>
Date: Fri, 29 Mar 2024 11:49:49 -0700
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] platform/x86: intel-vbtn: Use acpi_has_method to
 check for switch
To: Gwendal Grignou <gwendal@chromium.org>, hdegoede@redhat.com
Cc: platform-driver-x86@vger.kernel.org
References: <20240329143206.2977734-1-gwendal@chromium.org>
 <20240329143206.2977734-2-gwendal@chromium.org>
Content-Language: en-US
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20240329143206.2977734-2-gwendal@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 3/29/24 7:32 AM, Gwendal Grignou wrote:
> To mimic how we check if the device has virtual buttons,
> acpi_has_method(..."VBDL"), use the same method for checking virtual
> switch presence.

if possible don't use words like we/I in the commit log.

Other wise, it looks fine.

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

>
> Signed-off-by: Gwendal Grignou <gwendal@chromium.org>
> ---
>  drivers/platform/x86/intel/vbtn.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/drivers/platform/x86/intel/vbtn.c b/drivers/platform/x86/intel/vbtn.c
> index 084c355c86f5f..48f0ac19d6ddf 100644
> --- a/drivers/platform/x86/intel/vbtn.c
> +++ b/drivers/platform/x86/intel/vbtn.c
> @@ -258,9 +258,6 @@ static const struct dmi_system_id dmi_switches_allow_list[] = {
>  
>  static bool intel_vbtn_has_switches(acpi_handle handle, bool dual_accel)
>  {
> -	unsigned long long vgbs;
> -	acpi_status status;
> -
>  	/* See dual_accel_detect.h for more info */
>  	if (dual_accel)
>  		return false;
> @@ -268,8 +265,7 @@ static bool intel_vbtn_has_switches(acpi_handle handle, bool dual_accel)
>  	if (!dmi_check_system(dmi_switches_allow_list))
>  		return false;
>  
> -	status = acpi_evaluate_integer(handle, "VGBS", NULL, &vgbs);
> -	return ACPI_SUCCESS(status);
> +	return acpi_has_method(handle, "VGBS");
>  }
>  
>  static int intel_vbtn_probe(struct platform_device *device)

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer


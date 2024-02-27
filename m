Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BBF2557E
	for <platform-driver-x86@vger.kernel.org>; Tue, 27 Feb 2024 18:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709059668; cv=none; b=CF+ebc7XMKOWNvJHW+BI5AznjK4hiRfKwp5j2lZQ9jdtzUUf46+d2ZgGWJUhwWi3MTPmHRzs02bLA9McGDwSwExMKGvBIcN57+TI1E0d7/QUAX1busj/dm6XAOE+ok+iFNPwl9ly7dH2lDNjPl9RmI7zUS/D3j7Za3eKEaId7O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709059668; c=relaxed/simple;
	bh=jVW0cNwMu/mfYLdtu5XOyC3FFVCWH7JRj/rTOyTf40U=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=qzq6UjcPG5e1p37wPHBwwt8UJ8C1T5rs5PyudK4P7IsoafJCSFmLj+qL9B88Q0qJcJ4pV/Gsx2pswQPZblvtikNwi7LV9aJVZrI4l8SQCWsyYXCK6epkloXQ8cONwqzKcmtqbdHA657kk9dsSgp3Jw+uf9IrV2BK8H8rhesTj1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EWzZsg9Z; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EWzZsg9Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709059666; x=1740595666;
  h=message-id:date:mime-version:from:subject:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=jVW0cNwMu/mfYLdtu5XOyC3FFVCWH7JRj/rTOyTf40U=;
  b=EWzZsg9Z52Pw5JsuIKfeGH9EcWBJRJ0R4fbgPosC1+Cjkgz9+H6rdGvU
   tZ23h2FbAr1jAe9/xD+Rzb8b7hZOMt/wRSLLCBAxDx8ByOJxUpNmk2BSV
   dyAZ3kSGxw7yZgKs8D2cL5kDDocB+L9TOwsdfuHCueyfEkpNkHZW8+2/u
   ElxdPsOp9TQewWfcmRJuUOe36K147/PJxsB1Vw7CPzSQreIG/F/S72HJn
   Top0Y2RlmDzmWi3VvEMxrkk0iEcW3fy0jjoKEbw84E8k75Ga7SVN2zqel
   2V917Fi/WkopiAPgJC0Lqoa+S0AumJ11y38Qws5rBfZGujJ6RejkQxzTL
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="6371632"
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; 
   d="scan'208";a="6371632"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2024 10:47:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; 
   d="scan'208";a="11809288"
Received: from dschro4x-mobl.amr.corp.intel.com (HELO [10.212.137.190]) ([10.212.137.190])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2024 10:47:42 -0800
Message-ID: <e0398e3c-7ad0-486c-9959-add18a9741ac@linux.intel.com>
Date: Tue, 27 Feb 2024 10:47:40 -0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: Re: [PATCH 1/7] platform/x86/amd/pmf: Differentiate PMF ACPI versions
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20240227125520.3153140-1-Shyam-sundar.S-k@amd.com>
 <20240227125520.3153140-2-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
In-Reply-To: <20240227125520.3153140-2-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 2/27/24 4:55 AM, Shyam Sundar S K wrote:
> For family 1AH, certain PMF features have been enhanced - leading to a
> newer APMF (AMD PMF) spec (BIOS and PMF driver interface) called v2.
>
> This information would be fed into the if_version field of the
> verify_interface method of the APMF call from the BIOS.
>
> Use this information to store the version number to differentiate
> between v1 or v2 and also store the information into the PMF private
> data structure, as this information would be required for further code
> branching to support the latest silicon.
>
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
Looks good to me.

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

>  drivers/platform/x86/amd/pmf/acpi.c | 6 ++++--
>  drivers/platform/x86/amd/pmf/pmf.h  | 1 +
>  2 files changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
> index f2eb07ef855a..1f287a147c57 100644
> --- a/drivers/platform/x86/amd/pmf/acpi.c
> +++ b/drivers/platform/x86/amd/pmf/acpi.c
> @@ -218,8 +218,10 @@ static int apmf_if_verify_interface(struct amd_pmf_dev *pdev)
>  		return err;
>  
>  	pdev->supported_func = output.supported_functions;
> -	dev_dbg(pdev->dev, "supported functions:0x%x notifications:0x%x\n",
> -		output.supported_functions, output.notification_mask);
> +	dev_dbg(pdev->dev, "supported functions:0x%x notifications:0x%x version:%u\n",
> +		output.supported_functions, output.notification_mask, output.version);
> +
> +	pdev->pmf_if_version = output.version;
>  
>  	return 0;
>  }
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 66cae1cca73c..e51ac981af73 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -231,6 +231,7 @@ struct amd_pmf_dev {
>  	u64 policy_addr;
>  	void *policy_base;
>  	bool smart_pc_enabled;
> +	u16 pmf_if_version;
>  };
>  
>  struct apmf_sps_prop_granular {

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer


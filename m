Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E7C46531
	for <platform-driver-x86@vger.kernel.org>; Wed, 27 Dec 2023 17:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KFraookh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703699211; x=1735235211;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=WZcgS/CkdFWUabdvOZJ1S6nQ1soBn3by4pIURzL0e3c=;
  b=KFraookhyyqIivpvyNx8MURe32SYJ7fUceW5fit1+zrI7R70e613w2fM
   VVUSWl1dEmf/whYCG5Cs5qitnaWpQDsXtagh3PvoEN3IyS17R8RpERuhy
   6vDPiZQGAK9vSCPX4CcERis4fiNPBDS8imgjE3qnJLvp4/n+Nav/fdJYd
   Wm0nFvkk2wRWhsE/SsvAKkMFa+s+DcEGix8T+8rdXSNsV93mzn4GzsHpT
   mpA/oKIUCnVTvvAV5NqWSr/+YTfFJTJrtvmn06aWjfthW5Np5r0ESYeAi
   xUzuC6iXCYkFZAiyrlZ6t9N8ESvw9MW+Bo26/TWgKSLUQ0eLbLFb6VLwt
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="460797716"
X-IronPort-AV: E=Sophos;i="6.04,309,1695711600"; 
   d="scan'208";a="460797716"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2023 09:46:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="1025439336"
X-IronPort-AV: E=Sophos;i="6.04,309,1695711600"; 
   d="scan'208";a="1025439336"
Received: from hrmarapi-mobl1.ger.corp.intel.com ([10.249.35.233])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2023 09:46:48 -0800
Date: Wed, 27 Dec 2023 19:46:46 +0200 (EET)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org, 
    Sanket.Goswami@amd.com, mario.limonciello@amd.com, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH RESEND 6/6] platform/x86/amd/pmc: Modify SMU message port
 for latest AMD platform
In-Reply-To: <20231227063749.1780900-7-Shyam-sundar.S-k@amd.com>
Message-ID: <46588b85-afda-28ce-7e92-9c14e23bf346@linux.intel.com>
References: <20231227063749.1780900-1-Shyam-sundar.S-k@amd.com> <20231227063749.1780900-7-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 27 Dec 2023, Shyam Sundar S K wrote:

> The latest platforms use a different SMU message port(0x938) from the one
> currently being used (0x538). Make code changes to adapt to this new
> information.
> 
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmc/pmc.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index c8d86dd392ce..acac2a4194d4 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -31,7 +31,6 @@
>  #include "pmc.h"
>  
>  /* SMU communication registers */
> -#define AMD_PMC_REGISTER_MESSAGE	0x538
>  #define AMD_PMC_REGISTER_RESPONSE	0x980
>  #define AMD_PMC_REGISTER_ARGUMENT	0x9BC
>  
> @@ -362,14 +361,17 @@ static void amd_pmc_get_ip_info(struct amd_pmc_dev *dev)
>  	case AMD_CPU_ID_CB:
>  		dev->num_ips = 12;
>  		dev->s2d_msg_id = 0xBE;
> +		dev->smu_msg = 0x538;
>  		break;
>  	case AMD_CPU_ID_PS:
>  		dev->num_ips = 21;
>  		dev->s2d_msg_id = 0x85;
> +		dev->smu_msg = 0x538;
>  		break;
>  	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
>  		dev->num_ips = 22;
>  		dev->s2d_msg_id = 0xDE;
> +		dev->smu_msg = 0x938;
>  		break;
>  	}
>  }
> @@ -673,7 +675,7 @@ static void amd_pmc_dump_registers(struct amd_pmc_dev *dev)
>  		argument = AMD_S2D_REGISTER_ARGUMENT;
>  		response = AMD_S2D_REGISTER_RESPONSE;
>  	} else {
> -		message = AMD_PMC_REGISTER_MESSAGE;
> +		message = dev->smu_msg;
>  		argument = AMD_PMC_REGISTER_ARGUMENT;
>  		response = AMD_PMC_REGISTER_RESPONSE;
>  	}
> @@ -700,7 +702,7 @@ static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg,
>  		argument = AMD_S2D_REGISTER_ARGUMENT;
>  		response = AMD_S2D_REGISTER_RESPONSE;
>  	} else {
> -		message = AMD_PMC_REGISTER_MESSAGE;
> +		message = dev->smu_msg;
>  		argument = AMD_PMC_REGISTER_ARGUMENT;
>  		response = AMD_PMC_REGISTER_RESPONSE;
>  	}
> 

You forgot to git add the field into the struct?

-- 
 i.


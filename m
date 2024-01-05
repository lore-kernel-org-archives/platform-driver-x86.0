Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DDF622EF8
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Jan 2024 09:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mp9/mczW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704447409; x=1735983409;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=WBONqL5c2DyqO/LZaHiHH/6a7DyFD61uG+xh0ITDNYY=;
  b=Mp9/mczWjFY6vpMgXR/iScJuEUVbB1rhCzdCry6p29FFAGMaPb1vOq85
   ygCHofECOnjKs2Lt9ZxOZ8KHnlxVI/IUUKb/lD1R3/hvoitxLMaI/CeoA
   QWsmUOdU9IdoHMvGZwD7NN1x+IpZcqHBj01JC0kGcbpfbGpt4VJAW2H74
   kc9Pkjpz/CDYgjlktDI/+zUkl8DdEPEwJVS6qwRsWFTY1fczuDNBkY5Zg
   jfchMzcAUp9kRZJ63nR/f2OX4V8nBcchwKP0WjbwWTajNXITqUvKlploq
   WZkzWizhI3bHve6Y8p0ad5LDMBIuQZoDkHLiWZUBPSDOcibJ3IHqjSe4B
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="400234106"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; 
   d="scan'208";a="400234106"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2024 01:36:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="851090645"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; 
   d="scan'208";a="851090645"
Received: from gchung-mobl.gar.corp.intel.com (HELO hschroed-mobl1.ger.corp.intel.com) ([10.252.52.104])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2024 01:36:46 -0800
Date: Fri, 5 Jan 2024 11:36:44 +0200 (EET)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Suma Hegde <suma.hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: Re: [PATCH v4 8/9] platform/x86/amd/hsmp: Check num_sockets against
 MAX_AMD_SOCKETS
In-Reply-To: <20240105074618.1667898-9-suma.hegde@amd.com>
Message-ID: <c72d58c-d8d2-9470-e59e-7e533fc25a0@linux.intel.com>
References: <20240105074618.1667898-1-suma.hegde@amd.com> <20240105074618.1667898-9-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1169020550-1704447408=:1746"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1169020550-1704447408=:1746
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT

On Fri, 5 Jan 2024, Suma Hegde wrote:

> AMD supports connecting up to 8 AMD EPYCs in a system.
> Hence, verify the num_sockets returned from amd_nb_num().
> Also remove the WARN_ON() since the num_sockets is already verified.
> 
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Reviewed-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
> ---
> Changes since v3:
> New patch
> 
>  drivers/platform/x86/amd/hsmp.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
> index 05255102e0a0..99bebb0ca5a9 100644
> --- a/drivers/platform/x86/amd/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp.c
> @@ -62,6 +62,8 @@
>  #define MSG_ARGOFF_STR		"MsgArgOffset"
>  #define MSG_RESPOFF_STR		"MsgRspOffset"
>  
> +#define MAX_AMD_SOCKETS 8
> +
>  struct hsmp_mbaddr_info {
>  	u32 base_addr;
>  	u32 msg_id_off;
> @@ -671,10 +673,6 @@ static int hsmp_create_non_acpi_sysfs_if(struct device *dev)
>  	struct attribute_group *attr_grp;
>  	u16 i;
>  
> -	/* String formatting is currently limited to u8 sockets */
> -	if (WARN_ON(plat_dev.num_sockets > U8_MAX))
> -		return -ERANGE;
> -
>  	hsmp_attr_grps = devm_kzalloc(dev, sizeof(struct attribute_group *) *
>  				      (plat_dev.num_sockets + 1), GFP_KERNEL);
>  	if (!hsmp_attr_grps)
> @@ -925,7 +923,7 @@ static int __init hsmp_plt_init(void)
>  	 * if we have N SMN/DF interfaces that ideally means N sockets
>  	 */
>  	plat_dev.num_sockets = amd_nb_num();
> -	if (plat_dev.num_sockets == 0)
> +	if (plat_dev.num_sockets == 0 || plat_dev.num_sockets > MAX_AMD_SOCKETS)
>  		return ret;
>  
>  	ret = platform_driver_register(&amd_hsmp_driver);
> 

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

-- 
 i.

--8323329-1169020550-1704447408=:1746--

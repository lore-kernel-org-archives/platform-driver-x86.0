Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDD547A67
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 Dec 2023 17:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B6w4R52w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703094006; x=1734630006;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=27jbMqdFwCc+fMnuBvuVbQBPmbx6Wu1/5Lx/ncWFfoY=;
  b=B6w4R52wAwi8IjH1euSpIF/dslZpg8CzRcPKGvit8TzCjeajtttqG1e0
   Qi5yMLaW8ouvjfIJjaTWpT+jO0FqNXvfkQouHrL2b/vxwYOIR12aBgTS8
   vV2AS78xps0fBkxw9l+kTayddVbI6s17dgpfuEV4uW0FnFC4NYKgdMfIC
   CbB/i57Je5k5gYCXhxQoK+dqhvPpyisXWFkX+EYLBYjbHnEMSCyZhrcou
   YP/jiPdxmbjY0avgdUpVHeH9sN/5GNWaDvh1ftPQG1jAbIBp8yA3MMMot
   Y7fhsWZij02+PLzxb626tT8ROoANPAMmbQCjacWMN6MA25U4qjumu3Oj4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="399681918"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="399681918"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 09:40:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="899789443"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="899789443"
Received: from alobakin-mobl.ger.corp.intel.com ([10.252.50.56])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 09:40:04 -0800
Date: Wed, 20 Dec 2023 19:40:01 +0200 (EET)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Suma Hegde <suma.hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: Re: [PATCH v2 7/7] platform/x86: Non-ACPI support for AMD
 F1A_M00~0Fh
In-Reply-To: <20231220165528.1351200-8-suma.hegde@amd.com>
Message-ID: <bf2f6ccf-4bc8-a9e0-ff9c-c77a16d4e99@linux.intel.com>
References: <20231220165528.1351200-1-suma.hegde@amd.com> <20231220165528.1351200-8-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-990351832-1703094005=:1807"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-990351832-1703094005=:1807
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT

On Wed, 20 Dec 2023, Suma Hegde wrote:

> AMD EPYC family 0x1A and Model 0x0-0xF are having different
> mailbox message ID offset compared to previous
> platforms. In case of ACPI based BIOS, this information will be read
> from ACPI table, for non ACPI BIOS, this needs to be #defined.

non-ACPI

> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> 
> Changes since v1:
> Add "Reviewed-by: Hans de Goede <hdegoede@redhat.com>"
> 
> ---
>  drivers/platform/x86/amd/hsmp.c | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
> index 726ba73e23dd..95afea56d333 100644
> --- a/drivers/platform/x86/amd/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp.c
> @@ -44,6 +44,7 @@
>   */
>  #define SMN_HSMP_BASE		0x3B00000
>  #define SMN_HSMP_MSG_ID		0x0010534
> +#define SMN_HSMP_MSG_ID_F1A_M0H	0x0010934
>  #define SMN_HSMP_MSG_RESP	0x0010980
>  #define SMN_HSMP_MSG_DATA	0x00109E0
>  
> @@ -712,6 +713,15 @@ static int hsmp_cache_proto_ver(u16 sock_ind)
>  	return ret;
>  }
>  
> +static inline bool is_f1a_m0h(void)
> +{
> +	if (boot_cpu_data.x86 == 0x1A &&
> +	    (boot_cpu_data.x86_model >= 0x00 && boot_cpu_data.x86_model <= 0x0F))
> +		return true;
> +
> +	return false;
> +}
> +
>  static int initialize_platdev(struct device *dev)
>  {
>  	int ret, i;
> @@ -723,7 +733,16 @@ static int initialize_platdev(struct device *dev)
>  		plat_dev.sock[i].sock_ind		= i;
>  		plat_dev.sock[i].dev			= dev;
>  		plat_dev.sock[i].mbinfo.base_addr	= SMN_HSMP_BASE;
> -		plat_dev.sock[i].mbinfo.msg_id_off	= SMN_HSMP_MSG_ID;
> +
> +		/*
> +		 * This is a tranisitional change from non ACPI to ACPI, only
> +		 * family 0x1A, model 0x00 platform is supported for both ACPI and non ACPI.

non-ACPI x2

> +		 */
> +		if (is_f1a_m0h())
> +			plat_dev.sock[i].mbinfo.msg_id_off	= SMN_HSMP_MSG_ID_F1A_M0H;
> +		else
> +			plat_dev.sock[i].mbinfo.msg_id_off      = SMN_HSMP_MSG_ID;

You could have made all these lines shorter if you'd have added an local 
variable for sock = &plat_dev.sock[i] (in the earlier patch where this was 
introduced).

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

-- 
 i.

--8323329-990351832-1703094005=:1807--

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1512AF9DA
	for <platform-driver-x86@vger.kernel.org>; Fri, 22 Dec 2023 08:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YWgjRveF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703233473; x=1734769473;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=dE5+QUY3zzKCGT2EwHEq7KdcM4EdS6i+AlV6NpyFTLU=;
  b=YWgjRveFueA6ulCjk7eG6vPtbl1IlpUWhumcqUK4JE7FjdV7BdinafUy
   LhKf8ql4FLl6khv9JkCcxcFr9zVV2RkfPJuX06pZPqLlJJHqnJsvcnEcc
   7Vzvu4w0rpGsIckQ2ZRA/fXkc610kdcLKZlOCAnexOTFlSqMPqogEcHe+
   9/HA77oJKsrKoI4rKxpIg5okVJxsM7KAwFYHHVIylG7eNFL1LmYx95G2H
   MUBT/r6hCzLv3970jfbM6BXsWkweqCNJXb8RR/Bh3UbnVwtpR9o1g9eBa
   qcQoTWc8Y84QZTRNk5Av8xBxq//ANopsrWGe/bBAU4BwqK4/6UijAAI2/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="3341162"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="3341162"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2023 00:24:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="11395777"
Received: from mschutz-mobl.ger.corp.intel.com ([10.251.210.169])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2023 00:24:29 -0800
Date: Fri, 22 Dec 2023 10:24:22 +0200 (EET)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Suma Hegde <suma.hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: Re: [PATCH v3 7/7] platform/x86: Non-ACPI support for AMD
 F1A_M00~0Fh
In-Reply-To: <20231221172114.1569559-7-suma.hegde@amd.com>
Message-ID: <3ee53cf-2cc-7e43-e8c0-46fa5b203f90@linux.intel.com>
References: <20231221172114.1569559-1-suma.hegde@amd.com> <20231221172114.1569559-7-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1091252669-1703233422=:1692"
Content-ID: <6373f2d7-10b8-151e-be4-20d76363c023@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1091252669-1703233422=:1692
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: 8BIT
Content-ID: <aaba7eca-f9e-dc4b-af9a-9c9ac0d0cc24@linux.intel.com>

On Thu, 21 Dec 2023, Suma Hegde wrote:

> AMD EPYC family 0x1A and Model 0x0-0xF are having different
> mailbox message ID offset compared to previous
> platforms. In case of ACPI based BIOS, this information will be read
> from ACPI table, for non-ACPI BIOS, this needs to be #defined.
> 
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> 
> ---
> Changes since v1:
> Add "Reviewed-by: Hans de Goede <hdegoede@redhat.com>"
> Changes since v2:
> 1. Change "non ACPI" to "non-ACPI"
> 2. Add "Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>"
> 
>  drivers/platform/x86/amd/hsmp.c | 23 +++++++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
> index 46924c572055..cc5e5e8124c9 100644
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
>  static int init_socket_objects(struct device *dev)
>  {
>  	struct hsmp_socket *sock;
> @@ -725,10 +735,19 @@ static int init_socket_objects(struct device *dev)
>  		sock->sock_ind			= i;
>  		sock->dev			= dev;
>  		sock->mbinfo.base_addr		= SMN_HSMP_BASE;
> -		sock->mbinfo.msg_id_off		= SMN_HSMP_MSG_ID;
> +		sema_init(&sock->hsmp_sem, 1);
> +
> +		/*
> +		 * This is a tranisitional change from non-ACPI to ACPI, only

transitional ?


-- 
 i.
--8323329-1091252669-1703233422=:1692--

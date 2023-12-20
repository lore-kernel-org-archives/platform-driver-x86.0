Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7587846B9C
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 Dec 2023 17:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZA5bcraP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703091863; x=1734627863;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=51M0LglwOBN76CPI4fn0TN8dW+VOhb1KJJ54/6IFqxg=;
  b=ZA5bcraPKJ4oblqVSFegBUyEl8sj1Iwfxzt5gBcbniGgS5ZkjvcWMuCS
   uBsXflggkMzSNUvoDkaEAoQR/Qs+o4fYJxbItFnmkfxwC6hylKaJseQmC
   MYa4q+ZGdnwzUg2MtZApX677XkjFuxAkCrcA28d9Ewj+dd0Q47ftNKEVZ
   wQo8zCCLlkXWT1FEOa1GAOb//8Bik3s4FdYQCOCkhFzBERql1hlBj6zO2
   Gs79/7WDgviHuKiQv29r79yrxoo2qOy27luplF3Uuobehg79o76pbicam
   f0EAsrByEdpOPA71swHSBbtUqFsJrh0V7zj1lvOcK46EMY4X2sRj33F4s
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="17398359"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="17398359"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 09:04:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="752628504"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="752628504"
Received: from alobakin-mobl.ger.corp.intel.com ([10.252.50.56])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 09:04:18 -0800
Date: Wed, 20 Dec 2023 19:04:16 +0200 (EET)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Suma Hegde <suma.hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: Re: [PATCH v2 1/7] platform/x86: Move hsmp_test to probe
In-Reply-To: <20231220165528.1351200-2-suma.hegde@amd.com>
Message-ID: <691164aa-ac23-6318-594f-dfedd0135556@linux.intel.com>
References: <20231220165528.1351200-1-suma.hegde@amd.com> <20231220165528.1351200-2-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1012615033-1703091860=:1807"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1012615033-1703091860=:1807
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT

On Wed, 20 Dec 2023, Suma Hegde wrote:

> This is in advance to supporting ACPI based probe.
> 
> In case of non-ACPI driver, hsmp_test() can be
> performed either in plat init() or in probe().
> 
> however, in case of ACPI probing, hsmp_test() cannot
> be called in init(), as the mailbox reg offsets and
> base addresses are read from ACPI table in the probe().
> 
> Hence, move hsmp_test() to probe as preparation for
> ACPI support.
> 
> Also use hsmp_send_message() directly in hsmp_test()
> as the semaphore is already initialized in probe.
> 
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> 
> Changed since v1:
> 1. Add "Reviewed-by: Hans de Goede <hdegoede@redhat.com>"
> 
> ---
>  drivers/platform/x86/amd/hsmp.c | 30 +++++++++++-------------------
>  1 file changed, 11 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
> index b55d80e29139..3c17b488f4f8 100644
> --- a/drivers/platform/x86/amd/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp.c
> @@ -244,12 +244,7 @@ EXPORT_SYMBOL_GPL(hsmp_send_message);
>  static int hsmp_test(u16 sock_ind, u32 value)
>  {
>  	struct hsmp_message msg = { 0 };
> -	struct amd_northbridge *nb;
> -	int ret = -ENODEV;
> -
> -	nb = node_to_amd_nb(sock_ind);
> -	if (!nb || !nb->root)
> -		return ret;
> +	int ret;
>  
>  	/*
>  	 * Test the hsmp port by performing TEST command. The test message
> @@ -261,7 +256,7 @@ static int hsmp_test(u16 sock_ind, u32 value)
>  	msg.args[0]	= value;
>  	msg.sock_ind	= sock_ind;
>  
> -	ret = __hsmp_send_message(nb->root, &msg);
> +	ret = hsmp_send_message(&msg);
>  	if (ret)
>  		return ret;
>  
> @@ -504,6 +499,15 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
>  	for (i = 0; i < plat_dev.num_sockets; i++) {
>  		sema_init(&plat_dev.sock[i].hsmp_sem, 1);
>  		plat_dev.sock[i].sock_ind = i;
> +
> +		/* Test the hsmp interface on each socket */
> +		ret = hsmp_test(i, 0xDEADBEEF);
> +		if (ret) {
> +			pr_err("HSMP test message failed on Fam:%x model:%x\n",
> +			       boot_cpu_data.x86, boot_cpu_data.x86_model);
> +			pr_err("Is HSMP disabled in BIOS ?\n");
> +			return ret;
> +		}
>  	}
>  
>  	plat_dev.hsmp_device.name	= HSMP_CDEV_NAME;
> @@ -544,7 +548,6 @@ static struct platform_device *amd_hsmp_platdev;
>  static int __init hsmp_plt_init(void)
>  {
>  	int ret = -ENODEV;
> -	int i;
>  
>  	if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD || boot_cpu_data.x86 < 0x19) {
>  		pr_err("HSMP is not supported on Family:%x model:%x\n",
> @@ -560,17 +563,6 @@ static int __init hsmp_plt_init(void)
>  	if (plat_dev.num_sockets == 0)
>  		return ret;
>  
> -	/* Test the hsmp interface on each socket */
> -	for (i = 0; i < plat_dev.num_sockets; i++) {
> -		ret = hsmp_test(i, 0xDEADBEEF);
> -		if (ret) {
> -			pr_err("HSMP test message failed on Fam:%x model:%x\n",
> -			       boot_cpu_data.x86, boot_cpu_data.x86_model);
> -			pr_err("Is HSMP disabled in BIOS ?\n");
> -			return ret;
> -		}
> -	}
> -
>  	ret = platform_driver_register(&amd_hsmp_driver);
>  	if (ret)
>  		return ret;
> 

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

-- 
 i.

--8323329-1012615033-1703091860=:1807--

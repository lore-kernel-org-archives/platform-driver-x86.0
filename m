Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B41F1373
	for <platform-driver-x86@vger.kernel.org>; Thu,  7 Nov 2024 11:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730977327; cv=none; b=uGC9vqERQ48soGGRIpPeUNKMop6ZhQdZG10FZONvVAxFQkZ8JcuI9Md4X9W45enmScCViPzI0CjQbxOLnOfdWvL5Tq1H8QYJ3Vf1E3yF5tshHdgshTOHhDh3NRAM/Rtkc1R4KzK8mw1SXg1I5tmcHeuOgLd8PKKwEQAuAOIxElw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730977327; c=relaxed/simple;
	bh=UitSkqYjiNRfkvu6lcqsJEEnx6oAA36A7RiuZQcux+o=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=hzzu+BAmq73bwJVp2FDoajur/bq2+NNI/gIiN8enXSOKLjs/vIuLQ1pMfDtUqPxhCrglKxv1czvzjzQzunKTGxw67NRrrieMJ673zDfVA6LdW6lZkmGHO/agYY8a/5nsNJysZL1K84j11Ea4NfOpAWZRErmOsxJTYh8MID/RoYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G2ikhaLp; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G2ikhaLp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730977326; x=1762513326;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=UitSkqYjiNRfkvu6lcqsJEEnx6oAA36A7RiuZQcux+o=;
  b=G2ikhaLp3quvkhm1MqVnbWkwNhMQRuJxVy/aTjgfKy2NsiJZLeCX3aqB
   kHIWOzulAFVy6QEVL7ciTVY3cMu2uQvt0B0k5gK7qImZ5bne7RFnehiTu
   G3eqNa5CELlSftHxjYaiMXy3bwBu4oIwYj8owTAh440ooXIua/gTPGJrg
   apmnzuuv9Coc0a4N8v9UKYQ+uU1W80sfvHKbpHf8STTsPHJF8a02uT3VF
   tevorr/oA7sqkXd1xHmMYjDUJ1tjDE+96GKIF0CaOClGEq9xGcRBrdjuD
   ueQbedlVHhQ21STNXum2t61VEj+aDo871uLV3ymkYAZOwu06Ln4YwAGXV
   g==;
X-CSE-ConnectionGUID: ht1KdeXpTEmZVcdmgDN2SA==
X-CSE-MsgGUID: X2eQ18hpT7qrhAE1ZHCu1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41366376"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="41366376"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 03:02:06 -0800
X-CSE-ConnectionGUID: SwdwI4B5TwCxmFZVtQ/Qew==
X-CSE-MsgGUID: tfoPTO6HSEGk7j/S90Daeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="115851562"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.4])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 03:02:04 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 7 Nov 2024 13:02:00 +0200 (EET)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, Sanket.Goswami@amd.com, 
    platform-driver-x86@vger.kernel.org, 
    Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v4 08/11] platform/x86/amd/pmc: Update IP information
 structure for newer SoCs
In-Reply-To: <20241107072714.943423-9-Shyam-sundar.S-k@amd.com>
Message-ID: <10edabc3-5fe0-15eb-028b-89a0a4e30cb3@linux.intel.com>
References: <20241107072714.943423-1-Shyam-sundar.S-k@amd.com> <20241107072714.943423-9-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 7 Nov 2024, Shyam Sundar S K wrote:

> The latest AMD processors include additional IP blocks that must be turned
> off before transitioning to low power. PMFW provides an interface to
> retrieve debug information from each IP block, which is useful for
> diagnosing issues if the system fails to enter or exit low power states,
> or for profiling which IP block takes more time. Add support for using
> this information within the driver.
> 
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmc/pmc.c | 42 +++++++++++++++++++++++++++---
>  drivers/platform/x86/amd/pmc/pmc.h |  1 +
>  2 files changed, 40 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index 7c3204110bf8..5b99845d0914 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -95,6 +95,34 @@ struct amd_pmc_bit_map {
>  	u32 bit_mask;
>  };
>  
> +static const struct amd_pmc_bit_map soc15_ip_blk_v2[] = {
> +	{"DISPLAY",     BIT(0)},
> +	{"CPU",         BIT(1)},
> +	{"GFX",         BIT(2)},
> +	{"VDD",         BIT(3)},
> +	{"VDD_CCX",     BIT(4)},
> +	{"ACP",         BIT(5)},
> +	{"VCN_0",       BIT(6)},
> +	{"VCN_1",       BIT(7)},
> +	{"ISP",         BIT(8)},
> +	{"NBIO",        BIT(9)},
> +	{"DF",          BIT(10)},
> +	{"USB3_0",      BIT(11)},
> +	{"USB3_1",      BIT(12)},
> +	{"LAPIC",       BIT(13)},
> +	{"USB3_2",      BIT(14)},
> +	{"USB4_RT0",	BIT(15)},
> +	{"USB4_RT1",	BIT(16)},
> +	{"USB4_0",      BIT(17)},
> +	{"USB4_1",      BIT(18)},
> +	{"MPM",         BIT(19)},
> +	{"JPEG_0",      BIT(20)},
> +	{"JPEG_1",      BIT(21)},
> +	{"IPU",         BIT(22)},
> +	{"UMSCH",       BIT(23)},
> +	{"VPE",         BIT(24)},
> +};
> +
>  static const struct amd_pmc_bit_map soc15_ip_blk[] = {
>  	{"DISPLAY",	BIT(0)},
>  	{"CPU",		BIT(1)},
> @@ -162,14 +190,22 @@ static void amd_pmc_get_ip_info(struct amd_pmc_dev *dev)
>  	case AMD_CPU_ID_CB:
>  		dev->num_ips = 12;
>  		dev->smu_msg = 0x538;
> +		dev->ips_ptr = (struct amd_pmc_bit_map *)soc15_ip_blk;
>  		break;
>  	case AMD_CPU_ID_PS:
>  		dev->num_ips = 21;
>  		dev->smu_msg = 0x538;
> +		dev->ips_ptr = (struct amd_pmc_bit_map *)soc15_ip_blk;

Could you please put num_ips and ips_ptr lines next to each other as they 
kind of belong together.

I'm a bit surprised you need the casts in these assignments. ...Surprised 
enough I finally went to check what's going on.

And sadly... It turns out you needed the cast only to get rid of const 
which is very bad practice. You really should almost never do that.

The correct solution is highlighted below.

>  		break;
>  	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
>  	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
> -		dev->num_ips = ARRAY_SIZE(soc15_ip_blk);
> +		if (boot_cpu_data.x86_model == 0x70) {
> +			dev->num_ips = ARRAY_SIZE(soc15_ip_blk_v2);
> +			dev->ips_ptr = (struct amd_pmc_bit_map *)soc15_ip_blk_v2;
> +		} else {
> +			dev->num_ips = ARRAY_SIZE(soc15_ip_blk);
> +			dev->ips_ptr = (struct amd_pmc_bit_map *)soc15_ip_blk;
> +		}
>  		dev->smu_msg = 0x938;
>  		break;
>  	}
> @@ -337,8 +373,8 @@ static int smu_fw_info_show(struct seq_file *s, void *unused)
>  
>  	seq_puts(s, "\n=== Active time (in us) ===\n");
>  	for (idx = 0 ; idx < dev->num_ips ; idx++) {
> -		if (soc15_ip_blk[idx].bit_mask & dev->active_ips)
> -			seq_printf(s, "%-8s : %lld\n", soc15_ip_blk[idx].name,
> +		if (dev->ips_ptr[idx].bit_mask & dev->active_ips)
> +			seq_printf(s, "%-8s : %lld\n", dev->ips_ptr[idx].name,
>  				   table.timecondition_notmet_lastcapture[idx]);
>  	}
>  
> diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
> index 69870013c0fc..f6d9a7c37588 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.h
> +++ b/drivers/platform/x86/amd/pmc/pmc.h
> @@ -62,6 +62,7 @@ struct amd_pmc_dev {
>  	bool disable_8042_wakeup;
>  	struct amd_mp2_dev *mp2;
>  	struct stb_arg stb_arg;
> +	struct amd_pmc_bit_map *ips_ptr;

const struct

--
 i.

>  };
>  
>  void amd_pmc_process_restore_quirks(struct amd_pmc_dev *dev);
> 

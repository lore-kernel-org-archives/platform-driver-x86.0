Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBDA63DEAD0;
	Wed,  1 Apr 2026 11:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775042628; cv=none; b=M1PuXRCp7zUSmpJQsH6J70TclIePeV6Gop5d8YbdlsPl71JVwCugioN0pOac3PPowgMZlS2pK+jLeBMDFJU+165URVBQ7SmdIGtoLcE6yB3uHQvLzEDJUqX/k5F/Cz79/3fb+4QgSuKzU/R4VZ8l7uNjOORFDBstcPKcMQ9VLUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775042628; c=relaxed/simple;
	bh=vrCddiHDC3BxcSuQbR7/j0jAckkMnKFzN4OmEEEbbe8=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ldoamL4v5NDi92ji+uk27Fj3YzkjyZkgS3anigwyP085NN3JlkBTNBgKg7/gumAUGPkjggS868vobolVucVMGcByMFn79QeoBvR96nfUAiH+bBIVrHCio7lUZ46deUySjhk0WvWwqWJwF860FumyF3lvmI4U3Zd60kYw7eWNxSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HtwQQnAq; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HtwQQnAq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775042626; x=1806578626;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=vrCddiHDC3BxcSuQbR7/j0jAckkMnKFzN4OmEEEbbe8=;
  b=HtwQQnAqqBvRadDiZ7e7xRPWTQhcpzm1qyEpBxSK3uf1sW3vMoF9Z9QG
   dVo2B+cPUHBePHnvas2nQxKtGhDxLTqntZvu3nSs5f4Y2Zhti3TB2J6Nc
   2oS9fFC+ZnNutOC7zUZCutmemHTiTkDKS63IMJj/9MFJo1yJv+BPZVo2L
   kaX5BXals+nsl/8VBs32QX0r9mV/JWlVB/G2BT3Fa2dawaVmliEqvPQF+
   WI51TWs77/zg31gMnLt8eq8EsTDwn/UlIjuL3xXjpJT2vRJFzT40r8a/Y
   TynVmJw2sahLv4drrQsB2DPd2I1YhjoTTSQt8e3iv5ikCZREH9CLegn3N
   w==;
X-CSE-ConnectionGUID: vaEDjVGrTSO6gSKHHLzpFw==
X-CSE-MsgGUID: 3hl0Klj+SXKbnTiSfupcbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="86380157"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="86380157"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 04:23:37 -0700
X-CSE-ConnectionGUID: ytXxRvT6Tva7re62yn+9Ag==
X-CSE-MsgGUID: c017/qLdQRKlIcxL/0gV3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="226512294"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.192])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 04:23:35 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 1 Apr 2026 14:23:31 +0300 (EEST)
To: Krishna Chomal <krishna.chomal108@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/4] platform/x86: hp-wmi: fix fan table parsing
In-Reply-To: <20260401111748.106970-2-krishna.chomal108@gmail.com>
Message-ID: <f2b397ea-cc1a-e27a-b5e6-20c18bcb95b3@linux.intel.com>
References: <20260401111748.106970-1-krishna.chomal108@gmail.com> <20260401111748.106970-2-krishna.chomal108@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 1 Apr 2026, Krishna Chomal wrote:

> For Victus S devices, the BIOS fan table header was being incorrectly
> parsed as:
> struct {
> 	u8 unknown;
> 	u8 num_entries;
> }
> 
> The first field should be num_fans and the second should be unknown. It
> is pure coincidence that interpreting an "unknown" field as "num_entries"

So this coincidence is that both fields happened to contain the same 
value? Or (same or) smaller?

-- 
 i.

> worked on multiple device, however for board 8D87 (in an upcoming patch),
> this assumption fails, and the hp-wmi driver fails to load.
> 
> We fix this by correcting the header definition and compensating for
> num_entries by parsing each entry of the fan table until an all-NULL row
> is obtained, mirroring the behavior of OMEN Gaming Hub on Windows.
> 
> Fixes: 46be1453e6e6 ("platform/x86: hp-wmi: add manual fan control for Victus S models")
> Signed-off-by: Krishna Chomal <krishna.chomal108@gmail.com>
> ---
>  drivers/platform/x86/hp/hp-wmi.c | 41 +++++++++++++++++++++++++-------
>  1 file changed, 33 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index 304d9ac63c8a..d630b7f6e146 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -433,14 +433,14 @@ struct hp_wmi_hwmon_priv {
>  };
>  
>  struct victus_s_fan_table_header {
> +	u8 num_fans;
>  	u8 unknown;
> -	u8 num_entries;
>  } __packed;
>  
>  struct victus_s_fan_table_entry {
>  	u8 cpu_rpm;
>  	u8 gpu_rpm;
> -	u8 unknown;
> +	u8 noise_db;
>  } __packed;
>  
>  struct victus_s_fan_table {
> @@ -2514,7 +2514,9 @@ static int hp_wmi_setup_fan_settings(struct hp_wmi_hwmon_priv *priv)
>  	u8 fan_data[128] = { 0 };
>  	struct victus_s_fan_table *fan_table;
>  	u8 min_rpm, max_rpm, gpu_delta;
> -	int ret;
> +	u8 cpu_rpm, gpu_rpm, noise_db;
> +	int ret, num_entries, i;
> +	size_t header_size, entry_size;
>  
>  	/* Default behaviour on hwmon init is automatic mode */
>  	priv->mode = PWM_MODE_AUTO;
> @@ -2529,13 +2531,36 @@ static int hp_wmi_setup_fan_settings(struct hp_wmi_hwmon_priv *priv)
>  		return ret;
>  
>  	fan_table = (struct victus_s_fan_table *)fan_data;
> -	if (fan_table->header.num_entries == 0 ||
> -	    sizeof(struct victus_s_fan_table_header) +
> -	    sizeof(struct victus_s_fan_table_entry) * fan_table->header.num_entries > sizeof(fan_data))
> +	if (fan_table->header.num_fans == 0)
> +		return -EINVAL;
> +
> +	header_size = sizeof(struct victus_s_fan_table_header);
> +	entry_size = sizeof(struct victus_s_fan_table_entry);
> +	num_entries = (sizeof(fan_data) - header_size) / entry_size;
> +	min_rpm = U8_MAX;
> +	max_rpm = 0;
> +
> +	for (i = 0 ; i < num_entries ; i++) {
> +		cpu_rpm = fan_table->entries[i].cpu_rpm;
> +		gpu_rpm = fan_table->entries[i].gpu_rpm;
> +		noise_db = fan_table->entries[i].noise_db;
> +
> +		/*
> +		 * On some devices, the fan table is truncated with an all-zero row,
> +		 * hence we stop parsing here.
> +		 */
> +		if (cpu_rpm == 0 && gpu_rpm == 0 && noise_db == 0)
> +			break;
> +
> +		if (cpu_rpm < min_rpm)
> +			min_rpm = cpu_rpm;
> +		if (cpu_rpm > max_rpm)
> +			max_rpm = cpu_rpm;
> +	}
> +
> +	if (min_rpm == U8_MAX || max_rpm == 0)
>  		return -EINVAL;
>  
> -	min_rpm = fan_table->entries[0].cpu_rpm;
> -	max_rpm = fan_table->entries[fan_table->header.num_entries - 1].cpu_rpm;
>  	gpu_delta = fan_table->entries[0].gpu_rpm - fan_table->entries[0].cpu_rpm;
>  	priv->min_rpm = min_rpm;
>  	priv->max_rpm = max_rpm;
> 

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2CB3793A8;
	Mon, 11 May 2026 12:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778502675; cv=none; b=iO01pRUNdWJGBMR0pNOEAcoaQJXYz/q9klADSd92koBFMApBaZ3GbSHjE1ydAaIPburyBsRqWNAD+ebciEWT0I7eMslOR1ExtA5FsnzcjQRGfVhsFkvHT7+66IyWYtChYbgZ0I2zN5Oghw9/03rZapDFQasj8IL7qjUdNSLXmhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778502675; c=relaxed/simple;
	bh=dWC3ocj1PvYR7ADsFzzlPhHZfNBAX4VjctKddktRVaQ=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=TNvByNreDJGF5S937SR+vmzyB+CGxr+5IziWbD7uWrtefyjct+sSY7yaxdgkqkc+WmQO48rZFTwv5IBIv5z/XKEIMQFzq9cbfqPOel+OCLDZ5njpE4hqVE4AbkdYZDiUOgTuNwuNWcEnv7OjpjIAGmg/lr7U2c26m4kZ4ns8RaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OyVCQb43; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OyVCQb43"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778502674; x=1810038674;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=dWC3ocj1PvYR7ADsFzzlPhHZfNBAX4VjctKddktRVaQ=;
  b=OyVCQb43kPSI7OzOtXEf5byx2l0n2nt8p0pvfJtyr2KVNXSkDMg3oauK
   ZBLxmSkPfcNrSldYSyKmshWDOW2AWCKgsHezYz0FkdrtCumgKT1zoWicr
   TqgPKEki30wfK2VM5Xk3fmmxQ5+lPDg2VNB2e+iooKV2O/gDGmGW8v4ir
   ak0bwSrvA093sQIUyHAvL5iCI+eJ/nHPdgq/4Ok0mqHqWqpixTFUVN9aE
   dqHkJEgmo7TAQfF09iwbHsr9TXi54gAvAldriEt18vrZonCuKUGiJKc/q
   MvRuEK+tRLv9b0cRPgUI1/UtLnaxvApnFlNNz4RWKw5Ktmqgfq5L84kmS
   w==;
X-CSE-ConnectionGUID: Wl4OKTG3QaSZXKE3dR+KYg==
X-CSE-MsgGUID: 5CLFb4IvRkmdjRebX/4gTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="82999946"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="82999946"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 05:31:11 -0700
X-CSE-ConnectionGUID: vqupcd26QoK2OHfI5B3t5A==
X-CSE-MsgGUID: j/2VwtKQTTWXexkvQx4QfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="275571417"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.28])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 05:31:09 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 11 May 2026 15:31:05 +0300 (EEST)
To: Daniel Gibson <daniel@gibson.sh>
cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
    Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/5] platform/x86/amd/pmc: Check for intermediate
 wakeup in function
In-Reply-To: <20260509013105.816339-2-daniel@gibson.sh>
Message-ID: <be336ea2-7d9c-2187-2f6c-d8841006e1dc@linux.intel.com>
References: <20260509013105.816339-1-daniel@gibson.sh> <20260509013105.816339-2-daniel@gibson.sh>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 9 May 2026, Daniel Gibson wrote:

> This slightly refactors code introduced by the

Avoid starting changelog with "This" or "This patch" but use imperative 
tone instead. You can start with "Refactor code ..."

> "pmc: Require at least 2.5 seconds between HW sleep cycles"

Please always use the canonical commit reference format (see 
Documentation/process/submitting-patches.rst for detail).

It's on the borderline if the origin of the code even matters that much 
but since you're adding the (nice) comment, I guess it is easier to figure 
out where that came from by having the reference in place.

> commit
> to allow adding different conditions for that delay later.

later -> in an upcoming change

> 
> References: 9f5595d5f03f ("platform/x86/amd: pmc: Require at least 2.5 seconds between HW sleep cycles")

Drop this.

> Signed-off-by: Daniel Gibson <daniel@gibson.sh>
> ---
>  drivers/platform/x86/amd/pmc/pmc.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index cae3fcafd4d7..2b9e5730170a 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -598,6 +598,19 @@ static int amd_pmc_verify_czn_rtc(struct amd_pmc_dev *pdev, u32 *arg)
>  	return rc;
>  }
>  
> +static bool amd_pmc_intermediate_wakeup_need_delay(struct amd_pmc_dev *pdev)
> +{
> +	/*
> +	 * Starting a new HW sleep cycle right after waking from one
> +	 * can cause electrical problems triggering the over voltage protection.
> +	 * That is avoided by delaying the next suspend a bit, see also
> +	 * https://lore.kernel.org/all/20250414162446.3853194-1-superm1@kernel.org/
> +	 */
> +	struct smu_metrics table;
> +
> +	return get_metrics_table(pdev, &table) == 0 && table.s0i3_last_entry_status;
> +}
> +
>  static void amd_pmc_s2idle_prepare(void)
>  {
>  	struct amd_pmc_dev *pdev = &pmc;
> @@ -632,11 +645,9 @@ static void amd_pmc_s2idle_prepare(void)
>  static void amd_pmc_s2idle_check(void)
>  {
>  	struct amd_pmc_dev *pdev = &pmc;
> -	struct smu_metrics table;
>  	int rc;
>  
> -	/* Avoid triggering OVP */
> -	if (!get_metrics_table(pdev, &table) && table.s0i3_last_entry_status)
> +	if (amd_pmc_intermediate_wakeup_need_delay(pdev))
>  		msleep(2500);
>  
>  	/* Dump the IdleMask before we add to the STB */
> 

-- 
 i.


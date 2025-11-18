Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B2F364038
	for <platform-driver-x86@vger.kernel.org>; Tue, 18 Nov 2025 15:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763480193; cv=none; b=MCc+ckqxovnFYnumOIxMrVozcSwHeS5Zm2zlpCxU5r/dESsMS0EGm1amS/wVc8NLBj0NAi7dPebo/fJH0z57eWWYQknrlpYKJwNcV8dS6ltghxNnSUwOBeX29lbo5wFVD7QIWwGvDKOvdQgCCUqcJYAw4l2Csv8E38jQATQ0LrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763480193; c=relaxed/simple;
	bh=X/lxv38EsYW7NdFbCjj8QtfuvnOTKD365irYB26RmHY=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=LotBfkL7yD8WVc8PLOxyH1vwX9UpgGCbhwaa0pz5JI+mlPJz+3OJEeDCUn3EU+jHan6fV2nzrLDBuO7fESPBPIbWiJdbZsxypT3d2VOOJbZ3e570Z2LDgkajU61oJTSDefZASZYipTZgkEyBBBxwxTw4ymfuLE0CLYGWmqrf3rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LCwlYx/N; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LCwlYx/N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763480191; x=1795016191;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=X/lxv38EsYW7NdFbCjj8QtfuvnOTKD365irYB26RmHY=;
  b=LCwlYx/N5V+IRtmfv06lfDvP+8IVdeb6K8eJ6iOw5qtPQIuss/19soDx
   zzAvjtd6o0wMIohNZ8QIMt8dUmqeAC1DCQLJ7fMNPLzrYWqXS7GAZT+J+
   Xd0LhB0kB0HSpLJ21MC29pc1BSb6KR8W9uUGioFlrMXxDqXmaVz48MXTa
   dWxjbcGjZEDk9qiDVw49lFRmZhuuE1ph14Zw4ecIJZXKqDUumU3nUyw7C
   y8FVrGUpYfJrWB0cLcwossD6joTdo56eaXeNfY8ItDBTyjB6WiuPH+NRU
   mEQqjsTLvEjBV2of/16MB5zXgfrIPguupe6qVREY00ymUya4rEkunqtQf
   w==;
X-CSE-ConnectionGUID: XUCWdnD6TD2IKSe/WZYV9Q==
X-CSE-MsgGUID: O7SX2Cv/SP261O//IqInWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="76857112"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="76857112"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 07:36:30 -0800
X-CSE-ConnectionGUID: ixeg3vxiRaCRxlLQCw9maA==
X-CSE-MsgGUID: RbRzk8VFRj2wYYo4xxmL9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="195241569"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.74])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 07:36:27 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 18 Nov 2025 17:36:23 +0200 (EET)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    Patil.Reddy@amd.com, mario.limonciello@amd.com, lizhi.hou@amd.com
Subject: Re: [PATCH v2 1/5] platform/x86/amd/pmf: Rename IPU metrics fields
 to NPU for consistency
In-Reply-To: <20251111063737.4156385-2-Shyam-sundar.S-k@amd.com>
Message-ID: <986701df-5cb5-afe9-1873-f7b40e334554@linux.intel.com>
References: <20251111063737.4156385-1-Shyam-sundar.S-k@amd.com> <20251111063737.4156385-2-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-962938258-1763480183=:1205"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-962938258-1763480183=:1205
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 11 Nov 2025, Shyam Sundar S K wrote:

> Update smu_pmf_metrics_v2 to use NPU terminology instead of IPU. This
> aligns the driver with current firmware/hardware naming and fixes the
> mismatch. There is no functional change and no impact to the struct layou=
t
> and only field names are updated.
>=20
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

You really needed 2 people to "develop" this?? :-/

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.


> ---
>  drivers/platform/x86/amd/pmf/pmf.h | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/am=
d/pmf/pmf.h
> index bd19f2a6bc78..6ea5380f3b23 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -243,12 +243,12 @@ struct smu_pmf_metrics_v2 {
>  =09u16 vclk_freq;=09=09=09/* MHz */
>  =09u16 vcn_activity;=09=09/* VCN busy % [0-100] */
>  =09u16 vpeclk_freq;=09=09/* MHz */
> -=09u16 ipuclk_freq;=09=09/* MHz */
> -=09u16 ipu_busy[8];=09=09/* NPU busy % [0-100] */
> +=09u16 npuclk_freq;=09=09/* MHz */
> +=09u16 npu_busy[8];=09=09/* NPU busy % [0-100] */
>  =09u16 dram_reads;=09=09=09/* MB/sec */
>  =09u16 dram_writes;=09=09/* MB/sec */
>  =09u16 core_c0residency[16];=09/* C0 residency % [0-100] */
> -=09u16 ipu_power;=09=09=09/* mW */
> +=09u16 npu_power;=09=09=09/* mW */
>  =09u32 apu_power;=09=09=09/* mW */
>  =09u32 gfx_power;=09=09=09/* mW */
>  =09u32 dgpu_power;=09=09=09/* mW */
> @@ -257,9 +257,9 @@ struct smu_pmf_metrics_v2 {
>  =09u32 filter_alpha_value;=09=09/* time constant [us] */
>  =09u32 metrics_counter;
>  =09u16 memclk_freq;=09=09/* MHz */
> -=09u16 mpipuclk_freq;=09=09/* MHz */
> -=09u16 ipu_reads;=09=09=09/* MB/sec */
> -=09u16 ipu_writes;=09=09=09/* MB/sec */
> +=09u16 mpnpuclk_freq;=09=09/* MHz */
> +=09u16 npu_reads;=09=09=09/* MB/sec */
> +=09u16 npu_writes;=09=09=09/* MB/sec */
>  =09u32 throttle_residency_prochot;
>  =09u32 throttle_residency_spl;
>  =09u32 throttle_residency_fppt;
>=20
--8323328-962938258-1763480183=:1205--

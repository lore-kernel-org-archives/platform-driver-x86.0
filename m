Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795433796;
	b=exFG+U9ueGtFeIxhFgd5AV1RmBQTI9hyvKLpV4anCRHNSWScSu0NyJVmUSTjffoSrFmH
	 1te5tpX94WMsSQPvjcxKdY+v9PJTBNpmXi3VnoVvbGoKinuB5pplo5syrfmA8W/XwWV3Y
	 ot8gWUf2U99qWTdirn1geYu9jOXpSj/RpDKZlQDuNx4A8Q8RF1wcaruKiGxLUtGyBW6jf
	 nzABB4BA2ccYj1f3rXp6qGHTvHg9Y7bspUNqrmJxbOwLyOu5JYuz8Ifn/VjvQYQfBQ7q1
	 E2Nf2FtYGttUl/eaZUIHI7Wk+WzUoc9OhDFv/vcJEzU8dxy0UJjrodcP7pZ0T9Gb3zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795433796;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=p2yackOVtXVBuNZ33IwauMILS5krDqJSWVl5MUjlJlQ=;
	b=0BoIyxNlhtIawFmwTckOjTzdovdywI/SXvUzWse8EfU4X7i+aS07KGfZD1e3jFB0xVBa
	 Bkq9gb+30GqU5DqUl547QvQCLb8swf2OsTQDUjLJ3ibJJcl21fE4rZJcygvcXOVpel0Z2
	 WhRKk2x885slwsOAivnDwbSto/4nhEWT0u4DD2PWALvzNjDf+yRZsFpPuedOnPx+izgl2
	 pV7tmpa7XulZyVYKxjo7Ly/Wx4NJO3/RXCuYHOJAR4Bkif4A6qxxj5n7Fg3GQ7CAiU8Bn
	 L80xwbomGyzmobP+mRHkW/2yT17lXns4rRu4u04SO1MSlqHnYIOt6jlF2ZVEFE+tQ9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="XxE0Ur5/";
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB416606A31E
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Nov 2026 11:36:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB416606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XxE0Ur5/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795433796; x=1826969796;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=0ZdZ5V6aq/JPKsVJv2Ym0QjrIwr3t0e3o1UfnrLB5/g=;
  b=XxE0Ur5/o7d2CwLK6z1AYLQpBFWoaCnq1nAvOtbp4jxsiFdGZnO8UptV
   jWsZblGWLe3IU8vFxEHoNAwe0fxJQ9wkUD/peXQjtM3YuP7DyRvHZjMl8
   +PzN50JxobLSgjL9Z25l/B0G8DMg2yrXyW7kqWz6D9u+1mwZD42UAkZcB
   H5yJJBmJzwhqhw8XnmoP1GaUHKzgzwJ7uOn+yNtjvWqttpgPQ9awlvFZk
   7L+s8BBZdSu9yRxdGF1K7YDt57lMDW2jFwbd7W7lTfsJd2ayK3XqUUp1O
   HxarYUrK21R0iUD7k4xr9sGyk5/Swf2bzaijvE11wWhyON/h3whS+mspn
   Q==;
X-CSE-ConnectionGUID: d9FkYPhuROq1O9hynDzwIA==
X-CSE-MsgGUID: 0Kglpm3nSrWejiumo6Xprw==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4219503"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4219503"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 03:36:36 -0800
X-CSE-ConnectionGUID: Re9bNQGESteBaLHnMYgTOg==
X-CSE-MsgGUID: WQKEPeETRR+BhL/NdWroOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11697289"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.225])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 03:36:30 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 23 Nov 2026 13:36:26 +0200 (EET)
To: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
cc: platform-driver-x86@vger.kernel.org, Suma.Hegde@amd.com, 
    NaveenKrishna.Chatradhi@amd.com
Subject: Re: [PATCH 01/26] platform/x86/amd/hsmp: Drop _input from socket
 sysfs names
In-Reply-To: <129415f212369a0581b48c1992191c0fb61b4a0d.1793602633.git.Muthusamy.Ramalingam@amd.com>
Message-ID: <eed1215c-533a-c2d0-60f7-099052ab2a77@linux.intel.com>
References: <cover.1793602633.git.Muthusamy.Ramalingam@amd.com> <129415f212369a0581b48c1992191c0fb61b4a0d.1793602633.git.Muthusamy.Ramalingam@amd.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 2 Nov 2026, Muthusamy Ramalingam wrote:

> These socket files are not hwmon attributes. Name them for the value
> they report.
>
> Co-developed-by: Suma Hegde <Suma.Hegde@amd.com>
> Signed-off-by: Suma Hegde <Suma.Hegde@amd.com>
> Signed-off-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
> ---
>  Documentation/arch/x86/amd_hsmp.rst  |  12 +--
>  drivers/platform/x86/amd/hsmp/acpi.c |  24 +++---
>  drivers/platform/x86/amd/hsmp/plat.c | 112 +++++++++++++--------------
>  3 files changed, 74 insertions(+), 74 deletions(-)
> 
> diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
> index bd29ab9dd2385..6384935e7fe16 100644
> --- a/Documentation/arch/x86/amd_hsmp.rst
> +++ b/Documentation/arch/x86/amd_hsmp.rst
> @@ -97,19 +97,19 @@ directory under amd_hsmp/socket/.
>  A file that is normally readable and writable is created read-only or
>  write-only when the platform enables only that direction of the message.
>  
> -* c0_residency_input: Percentage of cores in C0 state.
> +* c0_residency: Percentage of cores in C0 state.
>  * prochot_status: Reports 1 if the processor is at thermal threshold value,
>    0 otherwise.
>  * smu_fw_version: SMU firmware version.
>  * protocol_version: HSMP interface version.
>  * ddr_max_bw: Theoretical maximum DDR bandwidth in GB/s.
> -* ddr_utilised_bw_input: Current utilized DDR bandwidth in GB/s.
> -* ddr_utilised_bw_perc_input(%): Percentage of current utilized DDR bandwidth.
> -* mclk_input: Memory clock in MHz.
> -* fclk_input: Fabric clock in MHz.
> +* ddr_utilised_bw: Current utilized DDR bandwidth in GB/s.
> +* ddr_utilised_bw_perc: Percentage of current utilized DDR bandwidth.
> +* mclk: Memory clock in MHz.
> +* fclk: Fabric clock in MHz.
>  * clk_fmax: Maximum frequency of socket in MHz.
>  * clk_fmin: Minimum frequency of socket in MHz.
> -* cclk_freq_limit_input: Core clock frequency limit per socket in MHz.
> +* cclk_freq_limit: Core clock frequency limit per socket in MHz.
>  * pwr_current_active_freq_limit: Current active frequency limit of socket
>    in MHz.
>  * pwr_current_active_freq_limit_source: Source of current active frequency
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
> index 9da4d9fb88be2..d7a7c40e40ccf 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -515,16 +515,16 @@ static const struct bin_attribute *hsmp_attr_list[] = {
>  	HSMP_SYS_ATTR(_name, _name, _mode, NULL, _store, U16_MAX,	\
>  		      _msg_id, _msg_id)
>  
> -HSMP_DEV_ATTR(c0_residency_input, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444);
> +HSMP_DEV_ATTR(c0_residency, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444);
>  HSMP_DEV_ATTR(prochot_status, HSMP_GET_PROC_HOT, hsmp_msg_resp32_show, 0444);
>  HSMP_DEV_ATTR(smu_fw_version, HSMP_GET_SMU_VER, hsmp_msg_fw_ver_show, 0444);
>  HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_show, 0444);
> -HSMP_DEV_ATTR(cclk_freq_limit_input, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444);
> +HSMP_DEV_ATTR(cclk_freq_limit, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444);
>  HSMP_DEV_ATTR(ddr_max_bw, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_max_bw_show, 0444);
> -HSMP_DEV_ATTR(ddr_utilised_bw_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444);
> -HSMP_DEV_ATTR(ddr_utilised_bw_perc_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_perc_show, 0444);
> -HSMP_DEV_ATTR(fclk_input, HSMP_GET_FCLK_MCLK, hsmp_fclk_show, 0444);
> -HSMP_DEV_ATTR(mclk_input, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444);
> +HSMP_DEV_ATTR(ddr_utilised_bw, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444);
> +HSMP_DEV_ATTR(ddr_utilised_bw_perc, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_perc_show, 0444);
> +HSMP_DEV_ATTR(fclk, HSMP_GET_FCLK_MCLK, hsmp_fclk_show, 0444);
> +HSMP_DEV_ATTR(mclk, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444);
>  HSMP_DEV_ATTR(clk_fmax, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmax_show, 0444);
>  HSMP_DEV_ATTR(clk_fmin, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmin_show, 0444);
>  HSMP_DEV_ATTR(pwr_current_active_freq_limit, HSMP_GET_SOCKET_FREQ_LIMIT,
> @@ -552,16 +552,16 @@ HSMP_DEV_ATTR_RW(rail_iso_freq_policy, HSMP_CPU_RAIL_ISO_FREQ_POLICY,
>  		 hsmp_rail_iso_freq_policy_show, hsmp_rail_iso_freq_policy_store, 0644);
>  
>  static struct attribute *hsmp_dev_attr_list[] = {
> -	&hattr_c0_residency_input.dattr.attr,
> +	&hattr_c0_residency.dattr.attr,
>  	&hattr_prochot_status.dattr.attr,
>  	&hattr_smu_fw_version.dattr.attr,
>  	&hattr_protocol_version.dattr.attr,
> -	&hattr_cclk_freq_limit_input.dattr.attr,
> +	&hattr_cclk_freq_limit.dattr.attr,
>  	&hattr_ddr_max_bw.dattr.attr,
> -	&hattr_ddr_utilised_bw_input.dattr.attr,
> -	&hattr_ddr_utilised_bw_perc_input.dattr.attr,
> -	&hattr_fclk_input.dattr.attr,
> -	&hattr_mclk_input.dattr.attr,
> +	&hattr_ddr_utilised_bw.dattr.attr,
> +	&hattr_ddr_utilised_bw_perc.dattr.attr,
> +	&hattr_fclk.dattr.attr,
> +	&hattr_mclk.dattr.attr,

Does this break ABI?

>  	&hattr_clk_fmax.dattr.attr,
>  	&hattr_clk_fmin.dattr.attr,
>  	&hattr_pwr_current_active_freq_limit.dattr.attr,
> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
> index 2385827b7ae8a..c246a996e2d4c 100644
> --- a/drivers/platform/x86/amd/hsmp/plat.c
> +++ b/drivers/platform/x86/amd/hsmp/plat.c
> @@ -215,14 +215,14 @@ HSMP_DEV_ATTR_W(_name, _msg_id, _store, _mode, 5); \
>  HSMP_DEV_ATTR_W(_name, _msg_id, _store, _mode, 6); \
>  HSMP_DEV_ATTR_W(_name, _msg_id, _store, _mode, 7)
>  
> -HSMP_DEV_ATTR(c0_residency_input, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444, 0);
> -HSMP_DEV_ATTR(c0_residency_input, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444, 1);
> -HSMP_DEV_ATTR(c0_residency_input, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444, 2);
> -HSMP_DEV_ATTR(c0_residency_input, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444, 3);
> -HSMP_DEV_ATTR(c0_residency_input, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444, 4);
> -HSMP_DEV_ATTR(c0_residency_input, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444, 5);
> -HSMP_DEV_ATTR(c0_residency_input, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444, 6);
> -HSMP_DEV_ATTR(c0_residency_input, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444, 7);
> +HSMP_DEV_ATTR(c0_residency, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444, 0);
> +HSMP_DEV_ATTR(c0_residency, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444, 1);
> +HSMP_DEV_ATTR(c0_residency, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444, 2);
> +HSMP_DEV_ATTR(c0_residency, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444, 3);
> +HSMP_DEV_ATTR(c0_residency, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444, 4);
> +HSMP_DEV_ATTR(c0_residency, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444, 5);
> +HSMP_DEV_ATTR(c0_residency, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444, 6);
> +HSMP_DEV_ATTR(c0_residency, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444, 7);
>  
>  HSMP_DEV_ATTR(smu_fw_version, HSMP_GET_SMU_VER, hsmp_msg_fw_ver_show, 0444, 0);
>  HSMP_DEV_ATTR(smu_fw_version, HSMP_GET_SMU_VER, hsmp_msg_fw_ver_show, 0444, 1);
> @@ -260,58 +260,58 @@ HSMP_DEV_ATTR(ddr_max_bw, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_max_bw_show, 0444, 5)
>  HSMP_DEV_ATTR(ddr_max_bw, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_max_bw_show, 0444, 6);
>  HSMP_DEV_ATTR(ddr_max_bw, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_max_bw_show, 0444, 7);
>  
> -HSMP_DEV_ATTR(ddr_utilised_bw_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444, 0);
> -HSMP_DEV_ATTR(ddr_utilised_bw_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444, 1);
> -HSMP_DEV_ATTR(ddr_utilised_bw_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444, 2);
> -HSMP_DEV_ATTR(ddr_utilised_bw_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444, 3);
> -HSMP_DEV_ATTR(ddr_utilised_bw_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444, 4);
> -HSMP_DEV_ATTR(ddr_utilised_bw_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444, 5);
> -HSMP_DEV_ATTR(ddr_utilised_bw_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444, 6);
> -HSMP_DEV_ATTR(ddr_utilised_bw_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444, 7);
> +HSMP_DEV_ATTR(ddr_utilised_bw, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444, 0);
> +HSMP_DEV_ATTR(ddr_utilised_bw, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444, 1);
> +HSMP_DEV_ATTR(ddr_utilised_bw, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444, 2);
> +HSMP_DEV_ATTR(ddr_utilised_bw, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444, 3);
> +HSMP_DEV_ATTR(ddr_utilised_bw, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444, 4);
> +HSMP_DEV_ATTR(ddr_utilised_bw, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444, 5);
> +HSMP_DEV_ATTR(ddr_utilised_bw, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444, 6);
> +HSMP_DEV_ATTR(ddr_utilised_bw, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444, 7);
>  
> -HSMP_DEV_ATTR(ddr_utilised_bw_perc_input, HSMP_GET_DDR_BANDWIDTH,
> +HSMP_DEV_ATTR(ddr_utilised_bw_perc, HSMP_GET_DDR_BANDWIDTH,
>  	      hsmp_ddr_util_bw_perc_show, 0444, 0);
> -HSMP_DEV_ATTR(ddr_utilised_bw_perc_input, HSMP_GET_DDR_BANDWIDTH,
> +HSMP_DEV_ATTR(ddr_utilised_bw_perc, HSMP_GET_DDR_BANDWIDTH,
>  	      hsmp_ddr_util_bw_perc_show, 0444, 1);
> -HSMP_DEV_ATTR(ddr_utilised_bw_perc_input, HSMP_GET_DDR_BANDWIDTH,
> +HSMP_DEV_ATTR(ddr_utilised_bw_perc, HSMP_GET_DDR_BANDWIDTH,
>  	      hsmp_ddr_util_bw_perc_show, 0444, 2);
> -HSMP_DEV_ATTR(ddr_utilised_bw_perc_input, HSMP_GET_DDR_BANDWIDTH,
> +HSMP_DEV_ATTR(ddr_utilised_bw_perc, HSMP_GET_DDR_BANDWIDTH,
>  	      hsmp_ddr_util_bw_perc_show, 0444, 3);
> -HSMP_DEV_ATTR(ddr_utilised_bw_perc_input, HSMP_GET_DDR_BANDWIDTH,
> +HSMP_DEV_ATTR(ddr_utilised_bw_perc, HSMP_GET_DDR_BANDWIDTH,
>  	      hsmp_ddr_util_bw_perc_show, 0444, 4);
> -HSMP_DEV_ATTR(ddr_utilised_bw_perc_input, HSMP_GET_DDR_BANDWIDTH,
> +HSMP_DEV_ATTR(ddr_utilised_bw_perc, HSMP_GET_DDR_BANDWIDTH,
>  	      hsmp_ddr_util_bw_perc_show, 0444, 5);
> -HSMP_DEV_ATTR(ddr_utilised_bw_perc_input, HSMP_GET_DDR_BANDWIDTH,
> +HSMP_DEV_ATTR(ddr_utilised_bw_perc, HSMP_GET_DDR_BANDWIDTH,
>  	      hsmp_ddr_util_bw_perc_show, 0444, 6);
> -HSMP_DEV_ATTR(ddr_utilised_bw_perc_input, HSMP_GET_DDR_BANDWIDTH,
> +HSMP_DEV_ATTR(ddr_utilised_bw_perc, HSMP_GET_DDR_BANDWIDTH,
>  	      hsmp_ddr_util_bw_perc_show, 0444, 7);
>  
> -HSMP_DEV_ATTR(cclk_freq_limit_input, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444, 0);
> -HSMP_DEV_ATTR(cclk_freq_limit_input, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444, 1);
> -HSMP_DEV_ATTR(cclk_freq_limit_input, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444, 2);
> -HSMP_DEV_ATTR(cclk_freq_limit_input, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444, 3);
> -HSMP_DEV_ATTR(cclk_freq_limit_input, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444, 4);
> -HSMP_DEV_ATTR(cclk_freq_limit_input, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444, 5);
> -HSMP_DEV_ATTR(cclk_freq_limit_input, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444, 6);
> -HSMP_DEV_ATTR(cclk_freq_limit_input, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444, 7);
> -
> -HSMP_DEV_ATTR(fclk_input, HSMP_GET_FCLK_MCLK, hsmp_fclk_show, 0444, 0);
> -HSMP_DEV_ATTR(fclk_input, HSMP_GET_FCLK_MCLK, hsmp_fclk_show, 0444, 1);
> -HSMP_DEV_ATTR(fclk_input, HSMP_GET_FCLK_MCLK, hsmp_fclk_show, 0444, 2);
> -HSMP_DEV_ATTR(fclk_input, HSMP_GET_FCLK_MCLK, hsmp_fclk_show, 0444, 3);
> -HSMP_DEV_ATTR(fclk_input, HSMP_GET_FCLK_MCLK, hsmp_fclk_show, 0444, 4);
> -HSMP_DEV_ATTR(fclk_input, HSMP_GET_FCLK_MCLK, hsmp_fclk_show, 0444, 5);
> -HSMP_DEV_ATTR(fclk_input, HSMP_GET_FCLK_MCLK, hsmp_fclk_show, 0444, 6);
> -HSMP_DEV_ATTR(fclk_input, HSMP_GET_FCLK_MCLK, hsmp_fclk_show, 0444, 7);
> -
> -HSMP_DEV_ATTR(mclk_input, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444, 0);
> -HSMP_DEV_ATTR(mclk_input, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444, 1);
> -HSMP_DEV_ATTR(mclk_input, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444, 2);
> -HSMP_DEV_ATTR(mclk_input, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444, 3);
> -HSMP_DEV_ATTR(mclk_input, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444, 4);
> -HSMP_DEV_ATTR(mclk_input, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444, 5);
> -HSMP_DEV_ATTR(mclk_input, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444, 6);
> -HSMP_DEV_ATTR(mclk_input, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444, 7);
> +HSMP_DEV_ATTR(cclk_freq_limit, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444, 0);
> +HSMP_DEV_ATTR(cclk_freq_limit, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444, 1);
> +HSMP_DEV_ATTR(cclk_freq_limit, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444, 2);
> +HSMP_DEV_ATTR(cclk_freq_limit, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444, 3);
> +HSMP_DEV_ATTR(cclk_freq_limit, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444, 4);
> +HSMP_DEV_ATTR(cclk_freq_limit, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444, 5);
> +HSMP_DEV_ATTR(cclk_freq_limit, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444, 6);
> +HSMP_DEV_ATTR(cclk_freq_limit, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444, 7);
> +
> +HSMP_DEV_ATTR(fclk, HSMP_GET_FCLK_MCLK, hsmp_fclk_show, 0444, 0);
> +HSMP_DEV_ATTR(fclk, HSMP_GET_FCLK_MCLK, hsmp_fclk_show, 0444, 1);
> +HSMP_DEV_ATTR(fclk, HSMP_GET_FCLK_MCLK, hsmp_fclk_show, 0444, 2);
> +HSMP_DEV_ATTR(fclk, HSMP_GET_FCLK_MCLK, hsmp_fclk_show, 0444, 3);
> +HSMP_DEV_ATTR(fclk, HSMP_GET_FCLK_MCLK, hsmp_fclk_show, 0444, 4);
> +HSMP_DEV_ATTR(fclk, HSMP_GET_FCLK_MCLK, hsmp_fclk_show, 0444, 5);
> +HSMP_DEV_ATTR(fclk, HSMP_GET_FCLK_MCLK, hsmp_fclk_show, 0444, 6);
> +HSMP_DEV_ATTR(fclk, HSMP_GET_FCLK_MCLK, hsmp_fclk_show, 0444, 7);
> +
> +HSMP_DEV_ATTR(mclk, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444, 0);
> +HSMP_DEV_ATTR(mclk, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444, 1);
> +HSMP_DEV_ATTR(mclk, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444, 2);
> +HSMP_DEV_ATTR(mclk, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444, 3);
> +HSMP_DEV_ATTR(mclk, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444, 4);
> +HSMP_DEV_ATTR(mclk, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444, 5);
> +HSMP_DEV_ATTR(mclk, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444, 6);
> +HSMP_DEV_ATTR(mclk, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444, 7);
>  
>  HSMP_DEV_ATTR(clk_fmax, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmax_show, 0444, 0);
>  HSMP_DEV_ATTR(clk_fmax, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmax_show, 0444, 1);
> @@ -391,16 +391,16 @@ HSMP_DEV_ATTR_RW_X8(rail_iso_freq_policy, HSMP_CPU_RAIL_ISO_FREQ_POLICY,
>  
>  #define HSMP_DEV_ATTR_LIST(_name, _sock_ind)				       \
>  static struct attribute _name[] = {					       \
> -	&hattr_c0_residency_input##_sock_ind.dattr.attr,		       \
> +	&hattr_c0_residency##_sock_ind.dattr.attr,		       \
>  	&hattr_prochot_status##_sock_ind.dattr.attr,			       \
>  	&hattr_smu_fw_version##_sock_ind.dattr.attr,			       \
>  	&hattr_protocol_version##_sock_ind.dattr.attr,			       \
> -	&hattr_cclk_freq_limit_input##_sock_ind.dattr.attr,		       \
> +	&hattr_cclk_freq_limit##_sock_ind.dattr.attr,		       \
>  	&hattr_ddr_max_bw##_sock_ind.dattr.attr,			       \
> -	&hattr_ddr_utilised_bw_input##_sock_ind.dattr.attr,		       \
> -	&hattr_ddr_utilised_bw_perc_input##_sock_ind.dattr.attr,	       \
> -	&hattr_fclk_input##_sock_ind.dattr.attr,			       \
> -	&hattr_mclk_input##_sock_ind.dattr.attr,			       \
> +	&hattr_ddr_utilised_bw##_sock_ind.dattr.attr,		       \
> +	&hattr_ddr_utilised_bw_perc##_sock_ind.dattr.attr,	       \
> +	&hattr_fclk##_sock_ind.dattr.attr,			       \
> +	&hattr_mclk##_sock_ind.dattr.attr,			       \
>  	&hattr_clk_fmax##_sock_ind.dattr.attr,				       \
>  	&hattr_clk_fmin##_sock_ind.dattr.attr,				       \
>  	&hattr_pwr_current_active_freq_limit##_sock_ind.dattr.attr,	       \
> 

-- 
 i.


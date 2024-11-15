Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B8C1D5AC9
	for <platform-driver-x86@vger.kernel.org>; Fri, 15 Nov 2024 16:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731689659; cv=none; b=J9djevZOYnP5Ka2oI5+VPyzhgcRr/Jjxo/pNP7n02TJ8kvUvQdbPuArNPRc13Tz3U9jflO+71PNzRtJlmG7o6uLP6un8MvZuRMcHjy6h8LTY+CVScHp04fXZxvDjNa/NbQMOVGgqHSj8MamV3NQBOPa7Sk07cHCy4QUkA8B757M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731689659; c=relaxed/simple;
	bh=NZVxMzEVt5TH63UZ/PIY1r4uAIzODVRDxbdQRJe9jYs=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=O1QeGHLxqvx8jvuQWeLJe4yC33SiqH9RY5Gk/Y/9Rcy39UoOt0GJZc8YA4ddye4QOjONnimhmKRp3mXLd83tg3qo52hlbKIqsTJq2+LSUCEVkLsou/7a4i8Z8KfzYhiLErMW5AzoleaeJr2RN/84E0IsJjMzX7ObCWXY6QmxG8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E2W8Ety4; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E2W8Ety4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731689657; x=1763225657;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=NZVxMzEVt5TH63UZ/PIY1r4uAIzODVRDxbdQRJe9jYs=;
  b=E2W8Ety4V8B9AKmUTn2I6FEptBL6ugb7Mb+xhalWLHIVevn8d614b6mr
   1d2X94G8VO/gaFLesc6XN5uQBPcmCWKpkgEea5/Cjg9gTAlFnzbyy6mar
   erOR/9NLf/0Svl3Yy9HOPWMt48SUdynm6sGfYUuRIKLcDJX2DlR/IWoII
   OqlYmlanPVgt4otcXCcCeuvEk6YS6HGM7AoBVrJv5PPyyU27RaH/L5Gzi
   NUaRBavLzpVr4K23V+wBdhEm+FxZIFwzTsjiz92vCdXQAzIyIXDYkgDtx
   T4Veq4Ctetpq/BDSVDW59IBWYzMiT6MScAGV+PRl0+hM+Y2bPhW+jkIB/
   Q==;
X-CSE-ConnectionGUID: bQGBfuhKThm6TBw0BBfq/Q==
X-CSE-MsgGUID: 5PE9IceFQyOwYFJvLwzsrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11257"; a="49136018"
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; 
   d="scan'208";a="49136018"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2024 08:54:16 -0800
X-CSE-ConnectionGUID: HiSGt/QWSFay9/AaYDg65Q==
X-CSE-MsgGUID: HEq8LR/cTju3nfeSaRD32Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; 
   d="scan'208";a="88774193"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.142])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2024 08:54:14 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 15 Nov 2024 18:54:10 +0200 (EET)
To: Suma Hegde <suma.hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Subject: Re: [v2] platform/x86/amd/hsmp: Add support for HSMP protocol version
 7 messages
In-Reply-To: <20241115120054.463325-1-suma.hegde@amd.com>
Message-ID: <1b888514-9e7b-257f-f51f-e050410ada6c@linux.intel.com>
References: <20241115120054.463325-1-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 15 Nov 2024, Suma Hegde wrote:

> Following new HSMP messages are available on family 0x1A, model 0x00-0x1F
> platforms with protocol version 7. Add support for them in the driver.
> - SetXgmiPstateRange(26h)
> - CpuRailIsoFreqPolicy(27h)
> - DfcEnable(28h)
> - GetRaplUnit(30h)
> - GetRaplCoreCounter(31h)
> - GetRaplPackageCounter(32h)
> 
> Also update HSMP message PwrEfficiencyModeSelection-21h. This message is
> updated to include GET option in recent firmware.
> 
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> ---
> This patch is rebased on "review-ilpo" branch.
> 
> Changes since v1:
> 1. Common check is moved out of if else ladder in validate_message().
> 2. Code comments are modified in validate_message().
> 
>  arch/x86/include/uapi/asm/amd_hsmp.h | 64 +++++++++++++++++++++++++++-
>  drivers/platform/x86/amd/hsmp/hsmp.c | 46 +++++++++++++++++---
>  2 files changed, 102 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h b/arch/x86/include/uapi/asm/amd_hsmp.h
> index e5d182c7373c..c83a5a7103b5 100644
> --- a/arch/x86/include/uapi/asm/amd_hsmp.h
> +++ b/arch/x86/include/uapi/asm/amd_hsmp.h
> @@ -50,6 +50,12 @@ enum hsmp_message_ids {
>  	HSMP_GET_METRIC_TABLE_VER,	/* 23h Get metrics table version */
>  	HSMP_GET_METRIC_TABLE,		/* 24h Get metrics table */
>  	HSMP_GET_METRIC_TABLE_DRAM_ADDR,/* 25h Get metrics table dram address */
> +	HSMP_SET_XGMI_PSTATE_RANGE,	/* 26h Set xGMI P-state range */
> +	HSMP_CPU_RAIL_ISO_FREQ_POLICY,	/* 27h Get/Set Cpu Iso frequency policy */
> +	HSMP_DFC_ENABLE_CTRL,		/* 28h Enable/Disable DF C-state */
> +	HSMP_GET_RAPL_UNITS = 0x30,	/* 30h Get scaling factor for energy */
> +	HSMP_GET_RAPL_CORE_COUNTER,	/* 31h Get core energy counter value */
> +	HSMP_GET_RAPL_PACKAGE_COUNTER,	/* 32h Get package energy counter value */
>  	HSMP_MSG_ID_MAX,
>  };
>  
> @@ -65,6 +71,7 @@ enum hsmp_msg_type {
>  	HSMP_RSVD = -1,
>  	HSMP_SET  = 0,
>  	HSMP_GET  = 1,
> +	HSMP_SET_GET	= 2,
>  };
>  
>  enum hsmp_proto_versions {
> @@ -72,7 +79,8 @@ enum hsmp_proto_versions {
>  	HSMP_PROTO_VER3,
>  	HSMP_PROTO_VER4,
>  	HSMP_PROTO_VER5,
> -	HSMP_PROTO_VER6
> +	HSMP_PROTO_VER6,
> +	HSMP_PROTO_VER7
>  };
>  
>  struct hsmp_msg_desc {
> @@ -299,7 +307,7 @@ static const struct hsmp_msg_desc hsmp_msg_desc_table[] = {
>  	 * HSMP_SET_POWER_MODE, num_args = 1, response_sz = 0
>  	 * input: args[0] = power efficiency mode[2:0]
>  	 */
> -	{1, 0, HSMP_SET},
> +	{1, 1, HSMP_SET_GET},
>  
>  	/*
>  	 * HSMP_SET_PSTATE_MAX_MIN, num_args = 1, response_sz = 0
> @@ -324,6 +332,58 @@ static const struct hsmp_msg_desc hsmp_msg_desc_table[] = {
>  	 * output: args[1] = upper 32 bits of the address
>  	 */
>  	{0, 2, HSMP_GET},
> +
> +	/*
> +	 * HSMP_SET_XGMI_PSTATE_RANGE, num_args = 1, response_sz = 0
> +	 * input: args[0] = min xGMI p-state[15:8] + max xGMI p-state[7:0]
> +	 */
> +	{1, 0, HSMP_SET},
> +
> +	/*
> +	 * HSMP_CPU_RAIL_ISO_FREQ_POLICY, num_args = 1, response_sz = 1
> +	 * input: args[0] = set/get policy[31] +
> +	 * disable/enable independent control[0]
> +	 * output: args[0] = current policy[0]
> +	 */
> +	{1, 1, HSMP_SET_GET},
> +
> +	/*
> +	 * HSMP_DFC_ENABLE_CTRL, num_args = 1, response_sz = 1
> +	 * input: args[0] = set/get policy[31] + enable/disable DFC[0]
> +	 * output: args[0] = current policy[0]
> +	 */
> +	{1, 1, HSMP_SET_GET},
> +
> +	/* RESERVED(0x29-0x2f) */
> +	{0, 0, HSMP_RSVD},
> +	{0, 0, HSMP_RSVD},
> +	{0, 0, HSMP_RSVD},
> +	{0, 0, HSMP_RSVD},
> +	{0, 0, HSMP_RSVD},
> +	{0, 0, HSMP_RSVD},
> +	{0, 0, HSMP_RSVD},
> +
> +	/*
> +	 * HSMP_GET_RAPL_UNITS, response_sz = 1
> +	 * output: args[0] = tu value[19:16] + esu value[12:8]
> +	 */
> +	{0, 1, HSMP_GET},
> +
> +	/*
> +	 * HSMP_GET_RAPL_CORE_COUNTER, num_args = 1, response_sz = 1
> +	 * input: args[0] = apic id[15:0]
> +	 * output: args[0] = lower 32 bits of energy
> +	 * output: args[1] = upper 32 bits of energy
> +	 */
> +	{1, 2, HSMP_GET},
> +
> +	/*
> +	 * HSMP_GET_RAPL_PACKAGE_COUNTER, num_args = 0, response_sz = 1
> +	 * output: args[0] = lower 32 bits of energy
> +	 * output: args[1] = upper 32 bits of energy
> +	 */
> +	{0, 2, HSMP_GET},
> +
>  };
>  
>  /* Metrics table (supported only with proto version 6) */
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
> index f29dd93fbf0b..f28b881db8e8 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
> @@ -33,7 +33,7 @@
>  #define HSMP_WR			true
>  #define HSMP_RD			false
>  
> -#define DRIVER_VERSION		"2.3"
> +#define DRIVER_VERSION		"2.4"
>  
>  static struct hsmp_plat_device hsmp_pdev;
>  
> @@ -167,11 +167,28 @@ static int validate_message(struct hsmp_message *msg)
>  	if (hsmp_msg_desc_table[msg->msg_id].type == HSMP_RSVD)
>  		return -ENOMSG;
>  
> -	/* num_args and response_sz against the HSMP spec */
> -	if (msg->num_args != hsmp_msg_desc_table[msg->msg_id].num_args ||
> -	    msg->response_sz != hsmp_msg_desc_table[msg->msg_id].response_sz)
> +	/*
> +	 * num_args passed by user should match the num_args specified in
> +	 * message description table.
> +	 */
> +	if (msg->num_args != hsmp_msg_desc_table[msg->msg_id].num_args)
>  		return -EINVAL;
>  
> +	/*
> +	 * Some older HSMP SET messages are updated to add GET in the same message.
> +	 * In these messages, GET returns the current value and SET also returns
> +	 * the successfully set value. To support this GET and SET in same message
> +	 * while maintaining backward compatibility for the HSMP users,
> +	 * hsmp_msg_desc_table[] indicates only maximum allowed response_sz.
> +	 */
> +	if (hsmp_msg_desc_table[msg->msg_id].type == HSMP_SET_GET) {
> +		if (msg->response_sz > hsmp_msg_desc_table[msg->msg_id].response_sz)
> +			return -EINVAL;
> +	} else {
> +		/* only HSMP_SET or HSMP_GET messages go through this strict check */
> +		if (msg->response_sz != hsmp_msg_desc_table[msg->msg_id].response_sz)
> +			return -EINVAL;
> +	}
>  	return 0;
>  }
>  
> @@ -239,6 +256,23 @@ int hsmp_test(u16 sock_ind, u32 value)
>  }
>  EXPORT_SYMBOL_NS_GPL(hsmp_test, AMD_HSMP);
>  
> +static bool is_get_msg(struct hsmp_message *msg)
> +{
> +	if (hsmp_msg_desc_table[msg->msg_id].type == HSMP_GET)
> +		return true;
> +
> +	if (hsmp_msg_desc_table[msg->msg_id].type == HSMP_SET_GET) {
> +		/*
> +		 * When same message numbers are used for both GET and SET operation,
> +		 * bit:31 indicates whether its SET or GET operation.
> +		 */
> +		if (msg->args[0] & BIT(31))

I'm sorry I missed this earlier, but the BIT(31) should be made a #define 
and you can place that comment next to the define. I think when named 
properly, the code itself will become self-explanary and won't need extra 
comment.

You could also use && instead of nested if()s since all you want to do is 
return true.

-- 
 i.


> +			return true;
> +	}
> +
> +	return false;
> +}
> +
>  long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
>  {
>  	int __user *arguser = (int  __user *)arg;
> @@ -261,7 +295,7 @@ long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
>  		 * Device is opened in O_WRONLY mode
>  		 * Execute only set/configure commands
>  		 */
> -		if (hsmp_msg_desc_table[msg.msg_id].type != HSMP_SET)
> +		if (is_get_msg(&msg))
>  			return -EPERM;
>  		break;
>  	case FMODE_READ:
> @@ -269,7 +303,7 @@ long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
>  		 * Device is opened in O_RDONLY mode
>  		 * Execute only get/monitor commands
>  		 */
> -		if (hsmp_msg_desc_table[msg.msg_id].type != HSMP_GET)
> +		if (!is_get_msg(&msg))
>  			return -EPERM;
>  		break;
>  	case FMODE_READ | FMODE_WRITE:
> 

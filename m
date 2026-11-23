Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795434979;
	b=lqzIyhR30/08atIPVZhqdtRJmDQb5GO4X4q2xdYosDINFqsFhUjYLMHwAbWdNMUemoAf
	 wn45bSPMRDK56BOBEbjTgX4Ilm4Y+uBuBFkH+IxswY3SHHQZCrJABSQ4yDtjjtWZi1FSU
	 G6an1/XNQz4on+DIxUWU8KwjX1nKGa6n8UBSrPCvLpoc2CjV3iIyQma5+eF3PteZxtV7I
	 X4bhRr2fPOHMN79KaNOiJ5L4Dmv4f2D/9Hw3YI90Oh/boPu1ZXjoAR8lbnNCLxCHtpVen
	 1ZAWmNfmT4aYlnf4FIk0MiVKZ9Sb6OXO0WXvW6r43bByvugKjcMDW3J4kW2q7d08wQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795434979;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=erJS+WwhMzT0wh3HanYAg8PFawrNriJEWp/57t3Aquc=;
	b=ZRtlRw1qmf7xQ+4VB0ZY+ht1WCuixC1O8C45PO/uZF9GAmki7uDNeUsZnAxNmK6E0QdB
	 C2GtF0ochiBVI5ZSAo+teFKRpVHF1E0E++oZFNpyv02Y+OdR7Y6OzwlNynujiiMI89yEH
	 yRlTNECxk7hcnQjnEQqu0PF4snEw65YG8sj/Vcfwoc5scOzVJxQ4vh+e07LX8rQzyP16B
	 9I4/UaduuK+aixabU2K1MqC2LcCYhiGF50NMrmrWfP3dJc248l/z/ICdxwegNxnY/rYIl
	 +FHogJJO05TrJ7B0kvYgFzrXbniJ35MNvDu4P9kgUULEet4ve6L2xwD9GD/jGSE2nVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C3kRfv1s;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59341606A31A
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Nov 2026 11:56:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59341606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C3kRfv1s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795434980; x=1826970980;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=0aHtNrdfF/sedCqq6OxZ2RqUqx7gMrTP4gyGZQ/Mb+0=;
  b=C3kRfv1s/XshlvTtPEI6MHbbIREjlGRzmSr+OfDae+OkJcAhCZVNV+3n
   Lw6JU6O5kfIPl3epQ5LOXYMe1Ye4xD37WBkc7VE9fFCoMbb886Yz0/ivc
   KdvkO/5ZkQj9477sNrpWi5Nehell6IyNDlRnPHHhzFpFraBO5NOdzS1GS
   gU7L5dDEiWk0Cs/yfn66i+KEsFIUUfWiUoqiScG9qDlF1rzdQAZ8SY9Iq
   fXmQjYVL2VJ+kOTITfZQPBAxucuzOrUBFR+jUdgUx/DItZK+c444m88Py
   n87nAhk6ihR8GZE7I95uOJcyQSKylitNOx6VId24rENz3mFchIRaThqHD
   g==;
X-CSE-ConnectionGUID: DX0YLPF/SWSRlo6IzvQ1Fg==
X-CSE-MsgGUID: aUjF4llpS0KkEzn5ME1L5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4251541"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4251541"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 03:56:19 -0800
X-CSE-ConnectionGUID: QBTiVHkEQ/K0K4bvspUIEA==
X-CSE-MsgGUID: jGSrX8gpS4iyZbrya9T19g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11220188"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.225])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 03:56:17 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 23 Nov 2026 13:56:13 +0200 (EET)
To: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com, 
    Suma.Hegde@amd.com, NaveenKrishna.Chatradhi@amd.com
Subject: Re: [PATCH 19/26] platform/x86/amd/hsmp: Add cclk_floor_limit sysfs
 file
In-Reply-To: <48c77463a94a754dc700365f617f79ccbdf5f5fb.1793602633.git.Muthusamy.Ramalingam@amd.com>
Message-ID: <91521140-c12d-e0f6-9912-859cef4611a4@linux.intel.com>
References: <cover.1793602633.git.Muthusamy.Ramalingam@amd.com> <48c77463a94a754dc700365f617f79ccbdf5f5fb.1793602633.git.Muthusamy.Ramalingam@amd.com>
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

> Expose HSMP_SET_GET_FLOOR_LIMIT as a write-only socket file on both the
> ACPI and platform drivers. A write uses operation 01 and sets the floor
> for every core on the socket. The frequency is a 16-bit MHz field.
> 
> Co-developed-by: Suma Hegde <Suma.Hegde@amd.com>
> Signed-off-by: Suma Hegde <Suma.Hegde@amd.com>
> Signed-off-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
> ---
>  Documentation/arch/x86/amd_hsmp.rst   |  2 ++
>  drivers/platform/x86/amd/hsmp/acpi.c  |  3 ++
>  drivers/platform/x86/amd/hsmp/plat.c  |  3 ++
>  drivers/platform/x86/amd/hsmp/sysfs.c | 47 +++++++++++++++++++++++++--
>  drivers/platform/x86/amd/hsmp/sysfs.h |  3 ++
>  5 files changed, 56 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
> index 093468aa52eb2..30401c168c503 100644
> --- a/Documentation/arch/x86/amd_hsmp.rst
> +++ b/Documentation/arch/x86/amd_hsmp.rst
> @@ -189,6 +189,8 @@ write-only when the platform enables only that direction of the message.
>  * socket_power_limit_max: Maximum socket power limit in mWatts (read only).
>  * cclk_boost_limit: Socket boost limit in MHz (write only). Accepted range
>    is 100-10000 MHz.
> +* cclk_floor_limit: Socket floor limit in MHz (write only). A write sets
> +  the floor for every core on the socket. It is a 16-bit value.
>  * tdelta: Socket thermal behaviour (read only).
>  * apb_disable: Read/write. 1 disables APB, 0 enables it.
>  * dfc_enable: Read/write DF C-state enable. 1 enables, 0 disables.
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
> index 935cca42b642b..35c2085b67e42 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -666,6 +666,8 @@ HSMP_SYS_ATTR(svi3_max_temperature, svi3_max_temperature, 0444,
>  	      HSMP_GET_SVI3_VR_CTRL_TEMP, HSMP_GET_SVI3_VR_CTRL_TEMP);
>  HSMP_DEV_ATTR_W(cclk_boost_limit, HSMP_SET_BOOST_LIMIT_SOCKET,
>  		hsmp_cclk_boost_limit_store, 0200);
> +HSMP_DEV_ATTR_W(cclk_floor_limit, HSMP_SET_GET_FLOOR_LIMIT,
> +		hsmp_cclk_floor_limit_store, 0200);
>  HSMP_DEV_ATTR_RW(apb_disable, HSMP_SET_DF_PSTATE, HSMP_SET_DF_PSTATE,
>  		 hsmp_apb_disable_show, hsmp_apb_disable_store, 0644);
>  HSMP_DEV_ATTR_RW(dfc_enable, HSMP_DFC_ENABLE_CTRL, HSMP_DFC_ENABLE_CTRL,
> @@ -832,6 +834,7 @@ static struct attribute *hsmp_dev_attr_list[] = {
>  	&hattr_dimm_sb_set.dattr.attr,
>  	&hattr_socket_power.dattr.attr,
>  	&hattr_cclk_boost_limit.dattr.attr,
> +	&hattr_cclk_floor_limit.dattr.attr,
>  	&hattr_tdelta.dattr.attr,
>  	&hattr_apb_disable.dattr.attr,
>  	&hattr_cc6_enable.dattr.attr,
> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
> index 2c6d460c56d3a..aedc71027b28c 100644
> --- a/drivers/platform/x86/amd/hsmp/plat.c
> +++ b/drivers/platform/x86/amd/hsmp/plat.c
> @@ -1862,6 +1862,8 @@ HSMP_DEV_ATTR_X8(socket_power, HSMP_GET_SOCKET_POWER, hsmp_msg_resp32_show,
>  		 0444);
>  HSMP_DEV_ATTR_W_X8(cclk_boost_limit, HSMP_SET_BOOST_LIMIT_SOCKET,
>  		   hsmp_cclk_boost_limit_store, 0200);
> +HSMP_DEV_ATTR_W_X8(cclk_floor_limit, HSMP_SET_GET_FLOOR_LIMIT,
> +		   hsmp_cclk_floor_limit_store, 0200);
>  HSMP_DEV_ATTR_X8(tdelta, HSMP_READ_TDELTA, hsmp_msg_resp32_show, 0444);
>  HSMP_DEV_ATTR_RW_X8(apb_disable, HSMP_SET_DF_PSTATE, HSMP_SET_DF_PSTATE,
>  		    hsmp_apb_disable_show, hsmp_apb_disable_store, 0644);
> @@ -1906,6 +1908,7 @@ static struct attribute _name[] = {					       \
>  	&hattr_dimm_sb_set##_sock_ind.dattr.attr,			       \
>  	&hattr_socket_power##_sock_ind.dattr.attr,			       \
>  	&hattr_cclk_boost_limit##_sock_ind.dattr.attr,		       \
> +	&hattr_cclk_floor_limit##_sock_ind.dattr.attr,		       \
>  	&hattr_tdelta##_sock_ind.dattr.attr,				       \
>  	&hattr_apb_disable##_sock_ind.dattr.attr,			       \
>  	&hattr_cc6_enable##_sock_ind.dattr.attr,			       \
> diff --git a/drivers/platform/x86/amd/hsmp/sysfs.c b/drivers/platform/x86/amd/hsmp/sysfs.c
> index 8fe67421ef6fc..8872f63e218df 100644
> --- a/drivers/platform/x86/amd/hsmp/sysfs.c
> +++ b/drivers/platform/x86/amd/hsmp/sysfs.c
> @@ -560,6 +560,48 @@ ssize_t hsmp_cclk_boost_limit_store(struct device *dev,
>  	return count;
>  }
>  
> +ssize_t hsmp_cclk_floor_limit_store(struct device *dev,
> +				    struct device_attribute *attr,
> +				    const char *buf, size_t count)
> +{
> +	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> +	struct hsmp_message msg = {};
> +	unsigned long val;
> +	int ret;
> +
> +	ret = kstrtoul(buf, 10, &val);
> +	if (ret) {
> +		hsmp_err(dev, "cclk_floor_limit", HSMP_ERR_PARSE, "unit=MHz");
> +		return ret;
> +	}
> +
> +	/*
> +	 * Op 01 sets the floor for every core on the socket. The frequency
> +	 * is a 16-bit MHz field. Firmware clamps it to the platform minimum
> +	 * and maximum, so reject only a field overflow.
> +	 */
> +	if (val > U16_MAX) {
> +		hsmp_err(dev, "cclk_floor_limit", HSMP_ERR_RANGE,
> +			 "got=%lu valid=0-%u unit=MHz", val, U16_MAX);
> +		return -EINVAL;
> +	}
> +
> +	msg.msg_id = HSMP_SET_GET_FLOOR_LIMIT;
> +	msg.sock_ind = hsmp_sysfs_sock_ind(dev, hattr);
> +	msg.num_args = 1;
> +	msg.response_sz = 0;
> +	msg.args[0] = BIT(30) | val;

Is this mistyped GET ?

> +
> +	ret = hsmp_send_message(&msg);
> +	if (ret) {
> +		hsmp_err(dev, "cclk_floor_limit", HSMP_ERR_HW,
> +			 "val=%lu unit=MHz rc=%d", val, ret);
> +		return ret;
> +	}
> +
> +	return count;
> +}
> +
>  /* APB disable show function - reads current APB enable/disable status */
>  ssize_t hsmp_apb_disable_show(struct device *dev,
>  			      struct device_attribute *attr,
> @@ -1909,8 +1951,9 @@ static struct hsmp_cpu_info *hsmp_cpu_from_kobj(struct kobject *kobj)
>  /*
>   * HSMP_SET_GET_FLOOR_LIMIT args[0]:
>   * op[31:30] + apic id[27:16] + floor frequency MHz[15:0].
> - * op 0 sets the per-core floor, op 2 reads it, op 3 reads the
> - * effective floor. The frequency field is reserved on a get.
> + * op 0 sets the per-core floor, op 1 sets every core on the socket,
> + * op 2 reads the per-core floor, and op 3 reads the effective floor.
> + * The frequency field is reserved on a get.
>   */
>  static u32 hsmp_floor_arg(u32 op, u32 apic_id, u32 mhz)
>  {
> diff --git a/drivers/platform/x86/amd/hsmp/sysfs.h b/drivers/platform/x86/amd/hsmp/sysfs.h
> index 716d9e4493a1b..8d3a9021ef18e 100644
> --- a/drivers/platform/x86/amd/hsmp/sysfs.h
> +++ b/drivers/platform/x86/amd/hsmp/sysfs.h
> @@ -112,6 +112,9 @@ ssize_t hsmp_rail_iso_freq_policy_store(struct device *dev,
>  ssize_t hsmp_cclk_boost_limit_store(struct device *dev,
>  				       struct device_attribute *attr,
>  				       const char *buf, size_t count);
> +ssize_t hsmp_cclk_floor_limit_store(struct device *dev,
> +				    struct device_attribute *attr,
> +				    const char *buf, size_t count);
>  ssize_t hsmp_apb_disable_show(struct device *dev, struct device_attribute *attr,
>  			      char *buf);
>  ssize_t hsmp_apb_disable_store(struct device *dev, struct device_attribute *attr,
> 

-- 
 i.


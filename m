Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795433732;
	b=4rpXyEzY/hfYr/GinstUDFUMpqUAQH4DgRXg0deRIQtpq+RbLJSeUJvAx1QtLUqZ2UZe
	 a3M2fZMRrj7JGIpV0GhyneqSqkgXlK8ku3QH7J0C6cLrov60RZHWxTXkvdYQ0s5d3y39R
	 T4+IUk0uHTu7kQpFGCy++RMQu9OOwBrQRFfhOTpB6iYfr7sG+Udoic8MFhbvbF+Y0DAKC
	 up4Eg5kF2uATy/65lla8wA1au0pAZ28XKM6LWFNq+CexCEkAQ5gHCadrjeHLMhbU6ZiAF
	 ZSdLGtyWauYW1ocq4MjfE5ElPSH9Wf9dtsMBQyeGOTTS/Md7DUIKtE0LGZMZfujLdOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795433732;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=QRnMCivR4v5kyJzcxPn+FgtOW/7wyaAl3UH5BD3U1Nc=;
	b=Fq2+eq97WSaUwAwUxckDxIRnl8pk2gofSfSvDS8W359PBqqufRCao37lH/jx10wSSCAp
	 cgDUup2JnFOR6h4EiAO1DJVFfO8Yc7v8IkdH3v7v7pIVzojHFnF0tSiMvY7IzxLKxp+/n
	 x4qhs1+skPZ6hAEhQbTAzQkr0DNypnA2jNyHkNgHEkOUM2mHimiPOlbFGvKeGULdKDFWo
	 QnW+nORGFf23AqTT8bQJfNW5Q6cvDgslWisantuNf67fUskNRpRdI65aAD10vSg6+u3Dj
	 EIJjIijSnFV3ipbD/FwDOHpDL0G1bLonxYW0o9ZSnRL4AVuGT7tA+2JPLEglpvhk5Jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IvnQw+Zt;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CDC8606A31E
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Nov 2026 11:35:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CDC8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IvnQw+Zt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795433733; x=1826969733;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=m5BhJM2HKtAeU7ApvzSoEDdHApe9m8hGttUSWV4IbnA=;
  b=IvnQw+Zt6iAtGAPCMR6koxNfh+TF3ObzLtvnRgkGK8GIEK4+mrIk6uVI
   uKPwMga/zoCuX/VPLDAWZqTz5Lx3X/+hSMSMFD8c87YMFIIp0yLie8qyX
   qyB/tRt2UzIN7yg5zEA8hzOFM1NT0KOjvBS6MzjGPq+4gEKq58audtEfb
   BsfhMUGglECsOtWILNaKA3KeU4i+o7nrM5MFBZbg+coJkmFusqfuFZn8k
   M99qW+JU+mc+WlX3yfLFj4hY/PmTDdDRyJ0U/C8Ni3RCZIPJMReh6gdZD
   m7F1P6ThIth707iNryX3OE0GJUAI7ebZ6Y5rT2afieRGnQaaXntjxNHf1
   w==;
X-CSE-ConnectionGUID: 3N5jxG+FT+CieCV9WQkq9Q==
X-CSE-MsgGUID: j5I9QveSR8qNbNADvoL1oA==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4111502"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4111502"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 03:35:32 -0800
X-CSE-ConnectionGUID: 5GM2mUFkRMy3NhbN98K0lg==
X-CSE-MsgGUID: ZqSbQgrmTBGkLuvJgdc+sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11475024"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.225])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 03:35:30 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 23 Nov 2026 13:35:26 +0200 (EET)
To: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
cc: platform-driver-x86@vger.kernel.org, Suma.Hegde@amd.com, 
    NaveenKrishna.Chatradhi@amd.com
Subject: Re: [PATCH 08/26] platform/x86/amd/hsmp: Add xgmi_width sysfs file
In-Reply-To: <cdaa48d5e1d276de212ead62d9ddcc7316411d15.1793602633.git.Muthusamy.Ramalingam@amd.com>
Message-ID: <69c9f6ce-7927-4ee2-ab68-0f0d3a17ead1@linux.intel.com>
References: <cover.1793602633.git.Muthusamy.Ramalingam@amd.com> <cdaa48d5e1d276de212ead62d9ddcc7316411d15.1793602633.git.Muthusamy.Ramalingam@amd.com>
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

> Add a read/write socket file for the xGMI link-width range on both the
> ACPI and platform drivers.
> 
> Read and write are differentiated by bit 31. Setting the bit selects a
> read, and resetting it selects a write. A read returns the minimum and
> maximum widths. A write takes "min max", with the minimum in bits
> [15:8] and the maximum in bits [7:0]. 0 is x4, 1 is x8, and 2 is x16.
> Each value is an 8-bit field. Extra arguments are rejected. Firmware
> rejects an unsupported width.
> 
> Co-developed-by: Suma Hegde <Suma.Hegde@amd.com>
> Signed-off-by: Suma Hegde <Suma.Hegde@amd.com>
> Signed-off-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
> ---
>  Documentation/arch/x86/amd_hsmp.rst   |  3 +
>  drivers/platform/x86/amd/hsmp/acpi.c  |  3 +
>  drivers/platform/x86/amd/hsmp/plat.c  |  4 ++
>  drivers/platform/x86/amd/hsmp/sysfs.c | 79 +++++++++++++++++++++++++++
>  drivers/platform/x86/amd/hsmp/sysfs.h |  4 ++
>  5 files changed, 93 insertions(+)
> 
> diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
> index 694997308ffa9..134c94e71b006 100644
> --- a/Documentation/arch/x86/amd_hsmp.rst
> +++ b/Documentation/arch/x86/amd_hsmp.rst
> @@ -122,6 +122,9 @@ write-only when the platform enables only that direction of the message.
>  * df_pstate_range: Read/write DF P-state range as "min max". Each value
>    is an 8-bit field. 0 is the highest performance. Extra arguments are
>    rejected. Firmware rejects unsupported P-states.
> +* xgmi_width: Read/write xGMI link width range as "min max".
> +  0 is x4, 1 is x8, and 2 is x16. Each value is an 8-bit field.
> +  Extra arguments are rejected. Firmware rejects unsupported widths.
>  * socket_power_limit_max: Maximum socket power limit in mWatts (read only).
>  * cclk_boost_limit: Socket boost limit in MHz (write only). Accepted range
>    is 100-10000 MHz.
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
> index 417fca04a722f..4f4170d191850 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -541,6 +541,8 @@ HSMP_DEV_ATTR_RW(sdps_limit, HSMP_SDPS_LIMIT, HSMP_SDPS_LIMIT,
>  		 hsmp_sdps_limit_show, hsmp_sdps_limit_store, 0644);
>  HSMP_DEV_ATTR_RW(df_pstate_range, HSMP_SET_PSTATE_MAX_MIN, HSMP_SET_PSTATE_MAX_MIN,
>  		 hsmp_df_pstate_range_show, hsmp_df_pstate_range_store, 0644);
> +HSMP_DEV_ATTR_RW(xgmi_width, HSMP_SET_XGMI_LINK_WIDTH, HSMP_SET_XGMI_LINK_WIDTH,
> +		 hsmp_xgmi_width_show, hsmp_xgmi_width_store, 0644);
>  HSMP_DEV_ATTR_W(cclk_boost_limit, HSMP_SET_BOOST_LIMIT_SOCKET,
>  		hsmp_cclk_boost_limit_store, 0200);
>  HSMP_DEV_ATTR_RW(apb_disable, HSMP_SET_DF_PSTATE, HSMP_SET_DF_PSTATE,
> @@ -574,6 +576,7 @@ static struct attribute *hsmp_dev_attr_list[] = {
>  	&hattr_socket_power_limit.dattr.attr,
>  	&hattr_sdps_limit.dattr.attr,
>  	&hattr_df_pstate_range.dattr.attr,
> +	&hattr_xgmi_width.dattr.attr,
>  	&hattr_socket_power.dattr.attr,
>  	&hattr_cclk_boost_limit.dattr.attr,
>  	&hattr_tdelta.dattr.attr,
> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
> index 3deb5480495dc..2c09a48b70471 100644
> --- a/drivers/platform/x86/amd/hsmp/plat.c
> +++ b/drivers/platform/x86/amd/hsmp/plat.c
> @@ -377,6 +377,9 @@ HSMP_DEV_ATTR_RW_X8(df_pstate_range, HSMP_SET_PSTATE_MAX_MIN,
>  		    HSMP_SET_PSTATE_MAX_MIN,
>  		    hsmp_df_pstate_range_show, hsmp_df_pstate_range_store,
>  		    0644);
> +HSMP_DEV_ATTR_RW_X8(xgmi_width, HSMP_SET_XGMI_LINK_WIDTH,
> +		    HSMP_SET_XGMI_LINK_WIDTH,
> +		    hsmp_xgmi_width_show, hsmp_xgmi_width_store, 0644);
>  HSMP_DEV_ATTR_X8(socket_power, HSMP_GET_SOCKET_POWER, hsmp_msg_resp32_show,
>  		 0444);
>  HSMP_DEV_ATTR_W_X8(cclk_boost_limit, HSMP_SET_BOOST_LIMIT_SOCKET,
> @@ -415,6 +418,7 @@ static struct attribute _name[] = {					       \
>  	&hattr_socket_power_limit##_sock_ind.dattr.attr,		       \
>  	&hattr_sdps_limit##_sock_ind.dattr.attr,			       \
>  	&hattr_df_pstate_range##_sock_ind.dattr.attr,			       \
> +	&hattr_xgmi_width##_sock_ind.dattr.attr,			       \
>  	&hattr_socket_power##_sock_ind.dattr.attr,			       \
>  	&hattr_cclk_boost_limit##_sock_ind.dattr.attr,		       \
>  	&hattr_tdelta##_sock_ind.dattr.attr,				       \
> diff --git a/drivers/platform/x86/amd/hsmp/sysfs.c b/drivers/platform/x86/amd/hsmp/sysfs.c
> index 8f10281cb97c1..4726b3dcdda3d 100644
> --- a/drivers/platform/x86/amd/hsmp/sysfs.c
> +++ b/drivers/platform/x86/amd/hsmp/sysfs.c
> @@ -812,6 +812,85 @@ ssize_t hsmp_df_pstate_range_store(struct device *dev,
>  	return count;
>  }
>  
> +/* xGMI width show function - reads current min and max link width */
> +ssize_t hsmp_xgmi_width_show(struct device *dev,
> +			     struct device_attribute *attr,
> +			     char *buf)
> +{
> +	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> +	struct hsmp_message msg = {};

This is the correct form :-).

> +	u32 min_width, max_width;
> +	int ret;
> +
> +	/* Set bit 31 to indicate GET operation for HSMP_SET_GET type messages */

Drop.

> +	msg.msg_id = HSMP_SET_XGMI_LINK_WIDTH;
> +	msg.sock_ind = hsmp_sysfs_sock_ind(dev, hattr);
> +	msg.num_args = 1;
> +	msg.response_sz = 1;
> +	msg.args[0] = BIT(31);  /* GET operation */

You know the drill.

> +
> +	ret = hsmp_send_message(&msg);
> +	if (ret)
> +		return ret;
> +
> +	/* Extract min width[15:8] and max width[7:0] */
> +	min_width = (msg.args[0] >> 8) & 0xFF;
> +	max_width = msg.args[0] & 0xFF;

As with the other patches.

> +
> +	return sysfs_emit(buf, "%u %u\n", min_width, max_width);
> +}
> +
> +/* xGMI width store function - sets min and max link width */
> +ssize_t hsmp_xgmi_width_store(struct device *dev,
> +			      struct device_attribute *attr,
> +			      const char *buf, size_t count)
> +{
> +	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> +	struct hsmp_message msg = {};
> +	u32 min_width, max_width;
> +	u32 vals[2];
> +	int ret;
> +	int got;
> +
> +	/* Parse input in format: "min_width max_width" */
> +	ret = hsmp_parse_u32_args(buf, vals, 2, 10, &got);
> +	if (ret) {
> +		hsmp_err(dev, "xgmi_width", HSMP_ERR_ARGC,
> +			 "want=2 got=%d fmt=\"min max\"", got);
> +		return -EINVAL;
> +	}
> +	min_width = vals[0];
> +	max_width = vals[1];
> +
> +	/* Min and max are 8-bit fields. Firmware rejects unsupported widths. */
> +	if (min_width > 0xFF || max_width > 0xFF) {
> +		hsmp_err(dev, "xgmi_width", HSMP_ERR_RANGE,
> +			 "min=%u max=%u valid=0-255", min_width, max_width);
> +		return -EINVAL;
> +	}
> +
> +	/* Clear bit 31 for SET operation, pack min[15:8] and max[7:0] */
> +	msg.msg_id = HSMP_SET_XGMI_LINK_WIDTH;
> +	msg.sock_ind = hsmp_sysfs_sock_ind(dev, hattr);
> +	msg.num_args = 1;
> +	msg.response_sz = 1;
> +	msg.args[0] = (min_width << 8) | max_width;

Same, the same times n in the above.

> +
> +	ret = hsmp_send_message(&msg);
> +	if (ret) {
> +		if (max_width < min_width)

Here you have this the expected way around.

Braces.

> +			hsmp_err(dev, "xgmi_width", HSMP_ERR_ORDER,
> +				 "min=%u max=%u rule=max>=min rc=%d",
> +				  min_width, max_width, ret);
> +		else
> +			hsmp_err(dev, "xgmi_width", HSMP_ERR_HW,
> +				 "min=%u max=%u rc=%d", min_width, max_width, ret);
> +		return ret;
> +	}
> +
> +	return count;
> +}
> +
>  static ssize_t boost_limit_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
>  {
>  	struct hsmp_cpu_info *cpu_info = NULL;
> diff --git a/drivers/platform/x86/amd/hsmp/sysfs.h b/drivers/platform/x86/amd/hsmp/sysfs.h
> index 9631b9067c142..58340e0544af6 100644
> --- a/drivers/platform/x86/amd/hsmp/sysfs.h
> +++ b/drivers/platform/x86/amd/hsmp/sysfs.h
> @@ -115,6 +115,10 @@ ssize_t hsmp_df_pstate_range_show(struct device *dev,
>  ssize_t hsmp_df_pstate_range_store(struct device *dev,
>  				   struct device_attribute *attr,
>  				   const char *buf, size_t count);
> +ssize_t hsmp_xgmi_width_show(struct device *dev, struct device_attribute *attr,
> +			     char *buf);
> +ssize_t hsmp_xgmi_width_store(struct device *dev, struct device_attribute *attr,
> +			      const char *buf, size_t count);
>  
>  void hsmp_create_per_cpu_kobjects(struct device *dev, struct kobject *cpu_parent,
>  				  struct hsmp_socket *sock);
> 

-- 
 i.


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432526;
	b=ze8Dxc+IPmIGNXjgyfLGpqkBRFNlxafxk1s/u3+pF9VyMxnkrNsyrTy8CiHX7C8wONBO
	 TzoXezYWfHPdiolL79AURe1P7xhra9gDvtdGGAhylzRLEU7yWO7Kv1CKAxYyh9jKzk6B6
	 TmSeNawwlzkVf7FHox04lHgiXT9FPxqdMnOkTKmPCKRwMDfaPHPXQgXaLnv2p+3Htcuq5
	 trsXCV27XTbSUncUKa3Ebyj/B4NVswCn96qxfpavmDrOzDC2jfbTGNyOo9dSRK7mx2xDO
	 OZS43xsWhgYBjB4diKfkOKF969CNjKnjnXFUinqQNBtmJ4Jqm9sgnm9pY+SmifZhT8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432526;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=rTcSwElr3CnwHC4peumTmQHuL1ouKrjkXNOexTK+/eU=;
	b=CSFOMMvGpOjCg1RZo6LHxZbZqyq6jxCRIgZTM/VAEW8cMRvFp+DUe20KuzZ2+YjENIJz
	 +QjLHa1O3/lmZ5xBDTEXijbzbfmXlYi7qP85aAJkd3knOym5PYyy0rwAI7Yn+J0Zmk9Wm
	 WEX8uAWd6TiNRl1shsPcG60iQIKzQB23aCIndXWppmrOcX7Tk2yQqxAp/3M2M0QOYoPQC
	 vhu2Bz0ztEnu8zDUg53A2jyO0QXMTT/CmNHfJfKRhq4oOqd7e0LxOvpU0fPw7n9+tpAGy
	 V239SnI8zXozpV8jxZJE6qP7XMqlIW2VLnBjQLLIWM7aasiODmGX709ubHRTCFlO9Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SM0kndRi;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10201606A31E
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Nov 2026 11:15:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10201606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SM0kndRi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795432526; x=1826968526;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=WnV0Lx7uNt0W5MaGoPnGXr/nHpSoxVnfr4SmkKadavg=;
  b=SM0kndRiwVVtYdfdcft/oMi2ZI0bc670aLCEDiNbTJkEzGYqsvSWxbpm
   OzGBvFdWS+Wh9R82mVDFtgaUD47qUuT512j2uPnUzU7JkWjtdNJF12fYw
   Wym1t0ZADCxqMNYhrFFZCmAn/zFk1NO73q1YS8BHf8VSm1BKXzOPAi7Tv
   iixB42SUiyGHYMZt7RIJQnAPf2sD50eCMVWK1KY7k1sTp4rzZ4sTdbfpm
   1szUbM+ydrOcqdodR09rYD7DMCLtaWChvJaDWMVyq47BKnSH828i7UeXw
   Chj9VcPZG2Z4/ZX7q9OWzBJ6ek1UxwJd4/OJFcw3Z5laqhPEBrw8VMXwb
   w==;
X-CSE-ConnectionGUID: XCs81E4XRyeHL5F6a4OVig==
X-CSE-MsgGUID: aOtdSxkqTAq+sviHUhqHmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4129629"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4129629"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 03:15:25 -0800
X-CSE-ConnectionGUID: rFpixqhkTziocFRJToKK6w==
X-CSE-MsgGUID: v/xJleVURA2Lmc7pt7CgPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11693031"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.225])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 03:15:23 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 23 Nov 2026 13:15:20 +0200 (EET)
To: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
cc: platform-driver-x86@vger.kernel.org, Suma.Hegde@amd.com, 
    NaveenKrishna.Chatradhi@amd.com
Subject: Re: [PATCH 06/26] platform/x86/amd/hsmp: Add sdps_limit sysfs file
In-Reply-To: <6f2d944db032009390ad2d47ef78c1d1b02e7fe5.1793602633.git.Muthusamy.Ramalingam@amd.com>
Message-ID: <487b3b7c-c5c2-d51b-d5c0-9fed82ef604a@linux.intel.com>
References: <cover.1793602633.git.Muthusamy.Ramalingam@amd.com> <6f2d944db032009390ad2d47ef78c1d1b02e7fe5.1793602633.git.Muthusamy.Ramalingam@amd.com>
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

> Expose HSMP_SDPS_LIMIT as a read/write socket file on both the ACPI
> and platform drivers. For a read, set bit 31. For a write, reset bit
> 31 and store the limit in bits [30:0]. A write accepts any value that
> fits in that field. Firmware clamps it to the platform range.
> 
> Co-developed-by: Suma Hegde <Suma.Hegde@amd.com>
> Signed-off-by: Suma Hegde <Suma.Hegde@amd.com>
> Signed-off-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
> ---
>  Documentation/arch/x86/amd_hsmp.rst   |  2 +
>  drivers/platform/x86/amd/hsmp/acpi.c  |  3 ++
>  drivers/platform/x86/amd/hsmp/plat.c  |  3 ++
>  drivers/platform/x86/amd/hsmp/sysfs.c | 67 +++++++++++++++++++++++++++
>  drivers/platform/x86/amd/hsmp/sysfs.h |  4 ++
>  5 files changed, 79 insertions(+)
> 
> diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
> index 44a7da87e5907..1fc4727b48726 100644
> --- a/Documentation/arch/x86/amd_hsmp.rst
> +++ b/Documentation/arch/x86/amd_hsmp.rst
> @@ -117,6 +117,8 @@ write-only when the platform enables only that direction of the message.
>  * socket_power: Average package power in mWatts (read only).
>  * socket_power_limit: Current socket power limit in mWatts. A write is a
>    32-bit value. Firmware clamps it to the platform range.
> +* sdps_limit: Read/write SDPS limit in mWatts. A write uses bits [30:0].
> +  Firmware clamps it to the platform range.
>  * socket_power_limit_max: Maximum socket power limit in mWatts (read only).
>  * cclk_boost_limit: Socket boost limit in MHz (write only). Accepted range
>    is 100-10000 MHz.
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
> index 6bbcc2f7e6a30..4c9f6c6843304 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -537,6 +537,8 @@ HSMP_DEV_ATTR(tdelta, HSMP_READ_TDELTA, hsmp_msg_resp32_show, 0444);
>  HSMP_DEV_ATTR_RW(socket_power_limit, HSMP_GET_SOCKET_POWER_LIMIT,
>  		 HSMP_SET_SOCKET_POWER_LIMIT,
>  		 hsmp_socket_power_limit_show, hsmp_socket_power_limit_store, 0644);
> +HSMP_DEV_ATTR_RW(sdps_limit, HSMP_SDPS_LIMIT, HSMP_SDPS_LIMIT,
> +		 hsmp_sdps_limit_show, hsmp_sdps_limit_store, 0644);
>  HSMP_DEV_ATTR_W(cclk_boost_limit, HSMP_SET_BOOST_LIMIT_SOCKET,
>  		hsmp_cclk_boost_limit_store, 0200);
>  HSMP_DEV_ATTR_RW(apb_disable, HSMP_SET_DF_PSTATE, HSMP_SET_DF_PSTATE,
> @@ -568,6 +570,7 @@ static struct attribute *hsmp_dev_attr_list[] = {
>  	&hattr_pwr_current_active_freq_limit_source.dattr.attr,
>  	&hattr_socket_power_limit_max.dattr.attr,
>  	&hattr_socket_power_limit.dattr.attr,
> +	&hattr_sdps_limit.dattr.attr,
>  	&hattr_socket_power.dattr.attr,
>  	&hattr_cclk_boost_limit.dattr.attr,
>  	&hattr_tdelta.dattr.attr,
> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
> index ba8274e5bfb4a..6f4250cfc1f4a 100644
> --- a/drivers/platform/x86/amd/hsmp/plat.c
> +++ b/drivers/platform/x86/amd/hsmp/plat.c
> @@ -371,6 +371,8 @@ HSMP_DEV_ATTR_RW_X8(socket_power_limit, HSMP_GET_SOCKET_POWER_LIMIT,
>  		    HSMP_SET_SOCKET_POWER_LIMIT,
>  		    hsmp_socket_power_limit_show,
>  		    hsmp_socket_power_limit_store, 0644);
> +HSMP_DEV_ATTR_RW_X8(sdps_limit, HSMP_SDPS_LIMIT, HSMP_SDPS_LIMIT,
> +		    hsmp_sdps_limit_show, hsmp_sdps_limit_store, 0644);
>  HSMP_DEV_ATTR_X8(socket_power, HSMP_GET_SOCKET_POWER, hsmp_msg_resp32_show,
>  		 0444);
>  HSMP_DEV_ATTR_W_X8(cclk_boost_limit, HSMP_SET_BOOST_LIMIT_SOCKET,
> @@ -407,6 +409,7 @@ static struct attribute _name[] = {					       \
>  	&hattr_pwr_current_active_freq_limit_source##_sock_ind.dattr.attr,     \
>  	&hattr_socket_power_limit_max##_sock_ind.dattr.attr,		       \
>  	&hattr_socket_power_limit##_sock_ind.dattr.attr,		       \
> +	&hattr_sdps_limit##_sock_ind.dattr.attr,			       \
>  	&hattr_socket_power##_sock_ind.dattr.attr,			       \
>  	&hattr_cclk_boost_limit##_sock_ind.dattr.attr,		       \
>  	&hattr_tdelta##_sock_ind.dattr.attr,				       \
> diff --git a/drivers/platform/x86/amd/hsmp/sysfs.c b/drivers/platform/x86/amd/hsmp/sysfs.c
> index bc1b349468978..01363b0b92fd7 100644
> --- a/drivers/platform/x86/amd/hsmp/sysfs.c
> +++ b/drivers/platform/x86/amd/hsmp/sysfs.c
> @@ -629,6 +629,73 @@ ssize_t hsmp_socket_power_limit_store(struct device *dev,
>  	return count;
>  }
>  
> +/* SDPS limit show function - reads current SDPS limit */
> +ssize_t hsmp_sdps_limit_show(struct device *dev,
> +			     struct device_attribute *attr,
> +			     char *buf)
> +{
> +	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> +	struct hsmp_message msg = {};
> +	int ret;
> +
> +	/* Set bit 31 to indicate GET operation for HSMP_SET_GET type messages */
> +	msg.msg_id = HSMP_SDPS_LIMIT;
> +	msg.sock_ind = hsmp_sysfs_sock_ind(dev, hattr);
> +	msg.num_args = 1;
> +	msg.response_sz = 1;
> +	msg.args[0] = BIT(31);  /* GET operation */

Don't we have a define for this? CHECK_GET_BIT? Though that looks
suboptimally named, its "GET_BIT", not "CHECK" except when used for 
checking, so you might want to refactor that

Get rid of comments telling what the define name already tells us (x2).

> +
> +	ret = hsmp_send_message(&msg);
> +	if (ret)
> +		return ret;
> +
> +	/* Return current SDPS limit in mWatts (bits [30:0]) */
> +	return sysfs_emit(buf, "%lu\n", msg.args[0] & GENMASK(30, 0));

Add a proper named define for this, do not extract fields with inline 
genmasks. The comment is then quite unnecessary (if something has to be 
added, put it next to the define).

> +}
> +
> +/* SDPS limit store function - sets SDPS limit */
> +ssize_t hsmp_sdps_limit_store(struct device *dev,
> +			      struct device_attribute *attr,
> +			      const char *buf, size_t count)
> +{
> +	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> +	struct hsmp_message msg = {};
> +	unsigned long val;
> +	int ret;
> +
> +	ret = kstrtoul(buf, 10, &val);
> +	if (ret) {
> +		hsmp_err(dev, "sdps_limit", HSMP_ERR_PARSE, "unit=mW");
> +		return ret;
> +	}
> +
> +	/*
> +	 * The SDPS limit occupies bits [30:0]. Firmware clamps it to the
> +	 * platform minimum and maximum, so reject only a field overflow.
> +	 */
> +	if (val > GENMASK(30, 0)) {

FIELD_MAX(the named define from above).

> +		hsmp_err(dev, "sdps_limit", HSMP_ERR_RANGE,
> +			 "got=%lu valid=0-2147483647 unit=mW", val);

%d + FIELD_MAX(...)

> +		return -EINVAL;
> +	}
> +
> +	/* Clear bit 31 for SET operation, set SDPS limit value in bits [30:0] */

That's not what the code does, it does not clear any bits AFAICT! Do not 
state bogus claims in comments. This looks largely unnecessary comment 
after you name the field with a define.

> +	msg.msg_id = HSMP_SDPS_LIMIT;
> +	msg.sock_ind = hsmp_sysfs_sock_ind(dev, hattr);
> +	msg.num_args = 1;
> +	msg.response_sz = 1;
> +	msg.args[0] = val & GENMASK(30, 0);

FIELD_PREP()

> +
> +	ret = hsmp_send_message(&msg);
> +	if (ret) {
> +		hsmp_err(dev, "sdps_limit", HSMP_ERR_HW,
> +			 "val=%lu unit=mW rc=%d", val, ret);
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
> index aae932079ab70..bf5bac77102d3 100644
> --- a/drivers/platform/x86/amd/hsmp/sysfs.h
> +++ b/drivers/platform/x86/amd/hsmp/sysfs.h
> @@ -106,6 +106,10 @@ ssize_t hsmp_socket_power_limit_show(struct device *dev,
>  ssize_t hsmp_socket_power_limit_store(struct device *dev,
>  				      struct device_attribute *attr,
>  				      const char *buf, size_t count);
> +ssize_t hsmp_sdps_limit_show(struct device *dev, struct device_attribute *attr,
> +			     char *buf);
> +ssize_t hsmp_sdps_limit_store(struct device *dev, struct device_attribute *attr,
> +			      const char *buf, size_t count);
>  
>  void hsmp_create_per_cpu_kobjects(struct device *dev, struct kobject *cpu_parent,
>  				  struct hsmp_socket *sock);
> 

-- 
 i.


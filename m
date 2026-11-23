Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795433556;
	b=jETDIzLa5q9TVkEm5Wo7QDJgCltWz8z7AUCGCIjbCxBdjAu+fuhD6vAPrUgiVwHIIjni
	 nDdGZ6Cdn59r4lu4bY1qqw2quD0V+IbsSwYBnXkt5gHkLvuo9P71+Yk0Pnn1Q7MBukPlO
	 CzBtT5CwoLEKGS5sbWXgQGOpEMQ50xFL20UAGfXu/mdWAtAX6hFJ/qDyMO7+w8ZfN/j7b
	 9HK8swpneMkgGXETaGFu+5yYJBeubbQ3ToFXlhu2blf4F+DsE83SJeEuZAKFfYNwpFtrb
	 ifP7Cjj9vlQK1YbXl4zi5SH00YaoLfu3vc4WrJvAX0h3MCsjGd0DupLPgqcWBrcbQqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795433556;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=0CZXKNqWbOI99JTego1dLswCjUR10F+MmMy9D9UpXeo=;
	b=mSsxVd+4RI6b2la8k1Jdw+Po/K7Ak4kG1+KoJwzVV7anORrxvF4OaiKHKl0j85qDQUAo
	 hvXrWOjfDZNm6wAeV+ju/VDefksyZ5xyc7c5FyDPgqcqDg6P+E3J5LlUmvzn0itVHjIf9
	 0xDOAjZSTNyEN0AK6phH2qmyB0TdQRZi2MMmxCiVaVA6sZ8JOKd38zR7T+bqfIeTwWJlR
	 9deZyKpJKtQFfMPk2PRX7aVypHwjek1loRnQiKRJ3dxQigQYvutze3GfQPBviWEg9dib+
	 uKDFLWw5bbveC3JQE390wi9uvxTj/HAsSCie17EDSCRrQvf08qNeNhRPLy+8ElHIohw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EgccJqc8;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86EDD606A31A
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Nov 2026 11:32:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86EDD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EgccJqc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795433556; x=1826969556;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=YhwMV71x3ScGefFYQ4wFJkZBKOs4fsObShMpph5eLjo=;
  b=EgccJqc87DyEnfzYmSPW5nVzwwJ1KSfTJjVOe1rMXSbmQ6hozIcND/Qt
   zfMEZ0fmlkRdCdhKy3OmdlSBzgpxuPegAidKwkSPsIABG3XHMsRi54uo/
   6IrZ26WyovjBjwDPBFjCED8+sCqbD9srh6EtJHI5NLbpa6PGgiu/+zYZD
   uyDbaK6HQJ9K/Ix/EiYTV9t2XC/51g+hWoN6696U5JdoyRRM4j2xEdJXP
   Ah+gINkDjDRPtuG+1wXoAooUn5vH7mOoxKyqMNadG8QO6HJ4jxzXgwLdo
   nMJVrBzpAWkKleRcz6mkAbCKiZV/wm0ji1QKeAkxARWAe6vKBpHT3qyN+
   Q==;
X-CSE-ConnectionGUID: KnQSD7S+SEiGncvLIhUcpA==
X-CSE-MsgGUID: 1QPhopnRRVmdffql6HEb4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4219215"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4219215"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 03:32:35 -0800
X-CSE-ConnectionGUID: uuaDtcj+QMCUYR+SufIsfw==
X-CSE-MsgGUID: k3LBO+WfS9i07Vu/OVOAzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11153197"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.225])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 03:32:33 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 23 Nov 2026 13:32:29 +0200 (EET)
To: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
cc: platform-driver-x86@vger.kernel.org, Suma.Hegde@amd.com, 
    NaveenKrishna.Chatradhi@amd.com
Subject: Re: [PATCH 07/26] platform/x86/amd/hsmp: Add df_pstate_range sysfs
 file
In-Reply-To: <f441bef698cd6cdc7d6ca2067833542ab49a31b1.1793602633.git.Muthusamy.Ramalingam@amd.com>
Message-ID: <2011d6bf-fe58-af5e-a28c-64b030806884@linux.intel.com>
References: <cover.1793602633.git.Muthusamy.Ramalingam@amd.com> <f441bef698cd6cdc7d6ca2067833542ab49a31b1.1793602633.git.Muthusamy.Ramalingam@amd.com>
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

> Expose HSMP_SET_PSTATE_MAX_MIN as a read/write socket file on both the
> ACPI and platform drivers. Read and write are differentiated by bit 31.
> Setting the bit selects a read, and resetting it selects a write. A
> read returns the minimum and maximum DF P-states. A write takes
> "min max". Each value is an 8-bit field. Extra arguments are rejected.
> Firmware rejects unsupported P-states.
> 
> Co-developed-by: Suma Hegde <Suma.Hegde@amd.com>
> Signed-off-by: Suma Hegde <Suma.Hegde@amd.com>
> Signed-off-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
> ---
>  Documentation/arch/x86/amd_hsmp.rst   |   3 +
>  drivers/platform/x86/amd/hsmp/acpi.c  |   3 +
>  drivers/platform/x86/amd/hsmp/plat.c  |   5 ++
>  drivers/platform/x86/amd/hsmp/sysfs.c | 116 ++++++++++++++++++++++++++
>  drivers/platform/x86/amd/hsmp/sysfs.h |   5 ++
>  5 files changed, 132 insertions(+)
> 
> diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
> index 1fc4727b48726..694997308ffa9 100644
> --- a/Documentation/arch/x86/amd_hsmp.rst
> +++ b/Documentation/arch/x86/amd_hsmp.rst
> @@ -119,6 +119,9 @@ write-only when the platform enables only that direction of the message.
>    32-bit value. Firmware clamps it to the platform range.
>  * sdps_limit: Read/write SDPS limit in mWatts. A write uses bits [30:0].
>    Firmware clamps it to the platform range.
> +* df_pstate_range: Read/write DF P-state range as "min max". Each value
> +  is an 8-bit field. 0 is the highest performance. Extra arguments are
> +  rejected. Firmware rejects unsupported P-states.
>  * socket_power_limit_max: Maximum socket power limit in mWatts (read only).
>  * cclk_boost_limit: Socket boost limit in MHz (write only). Accepted range
>    is 100-10000 MHz.
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
> index 4c9f6c6843304..417fca04a722f 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -539,6 +539,8 @@ HSMP_DEV_ATTR_RW(socket_power_limit, HSMP_GET_SOCKET_POWER_LIMIT,
>  		 hsmp_socket_power_limit_show, hsmp_socket_power_limit_store, 0644);
>  HSMP_DEV_ATTR_RW(sdps_limit, HSMP_SDPS_LIMIT, HSMP_SDPS_LIMIT,
>  		 hsmp_sdps_limit_show, hsmp_sdps_limit_store, 0644);
> +HSMP_DEV_ATTR_RW(df_pstate_range, HSMP_SET_PSTATE_MAX_MIN, HSMP_SET_PSTATE_MAX_MIN,
> +		 hsmp_df_pstate_range_show, hsmp_df_pstate_range_store, 0644);
>  HSMP_DEV_ATTR_W(cclk_boost_limit, HSMP_SET_BOOST_LIMIT_SOCKET,
>  		hsmp_cclk_boost_limit_store, 0200);
>  HSMP_DEV_ATTR_RW(apb_disable, HSMP_SET_DF_PSTATE, HSMP_SET_DF_PSTATE,
> @@ -571,6 +573,7 @@ static struct attribute *hsmp_dev_attr_list[] = {
>  	&hattr_socket_power_limit_max.dattr.attr,
>  	&hattr_socket_power_limit.dattr.attr,
>  	&hattr_sdps_limit.dattr.attr,
> +	&hattr_df_pstate_range.dattr.attr,
>  	&hattr_socket_power.dattr.attr,
>  	&hattr_cclk_boost_limit.dattr.attr,
>  	&hattr_tdelta.dattr.attr,
> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
> index 6f4250cfc1f4a..3deb5480495dc 100644
> --- a/drivers/platform/x86/amd/hsmp/plat.c
> +++ b/drivers/platform/x86/amd/hsmp/plat.c
> @@ -373,6 +373,10 @@ HSMP_DEV_ATTR_RW_X8(socket_power_limit, HSMP_GET_SOCKET_POWER_LIMIT,
>  		    hsmp_socket_power_limit_store, 0644);
>  HSMP_DEV_ATTR_RW_X8(sdps_limit, HSMP_SDPS_LIMIT, HSMP_SDPS_LIMIT,
>  		    hsmp_sdps_limit_show, hsmp_sdps_limit_store, 0644);
> +HSMP_DEV_ATTR_RW_X8(df_pstate_range, HSMP_SET_PSTATE_MAX_MIN,
> +		    HSMP_SET_PSTATE_MAX_MIN,
> +		    hsmp_df_pstate_range_show, hsmp_df_pstate_range_store,
> +		    0644);
>  HSMP_DEV_ATTR_X8(socket_power, HSMP_GET_SOCKET_POWER, hsmp_msg_resp32_show,
>  		 0444);
>  HSMP_DEV_ATTR_W_X8(cclk_boost_limit, HSMP_SET_BOOST_LIMIT_SOCKET,
> @@ -410,6 +414,7 @@ static struct attribute _name[] = {					       \
>  	&hattr_socket_power_limit_max##_sock_ind.dattr.attr,		       \
>  	&hattr_socket_power_limit##_sock_ind.dattr.attr,		       \
>  	&hattr_sdps_limit##_sock_ind.dattr.attr,			       \
> +	&hattr_df_pstate_range##_sock_ind.dattr.attr,			       \
>  	&hattr_socket_power##_sock_ind.dattr.attr,			       \
>  	&hattr_cclk_boost_limit##_sock_ind.dattr.attr,		       \
>  	&hattr_tdelta##_sock_ind.dattr.attr,				       \
> diff --git a/drivers/platform/x86/amd/hsmp/sysfs.c b/drivers/platform/x86/amd/hsmp/sysfs.c
> index 01363b0b92fd7..8f10281cb97c1 100644
> --- a/drivers/platform/x86/amd/hsmp/sysfs.c
> +++ b/drivers/platform/x86/amd/hsmp/sysfs.c
> @@ -14,6 +14,7 @@
>  #include <linux/kstrtox.h>
>  #include <linux/limits.h>
>  #include <linux/smp.h>
> +#include <linux/string.h>
>  #include <linux/sysfs.h>
>  #include <linux/topology.h>
>  
> @@ -696,6 +697,121 @@ ssize_t hsmp_sdps_limit_store(struct device *dev,
>  	return count;
>  }
>  
> +/* Multi-field stores copy the write into this buffer before tokenizing. */
> +#define HSMP_PARSE_BUFSZ	80
> +
> +/*
> + * Parse exactly @n whitespace-separated unsigned integers. base 10 accepts
> + * decimal. base 0 also accepts 0x hex and leading-zero octal. Too few
> + * tokens, extra tokens, and a value that does not fit in u32 are rejected.
> + * On failure, *@got is the number of whitespace-separated tokens present.
> + */
> +static int hsmp_parse_u32_args(const char *buf, u32 *vals, int n,
> +			       unsigned int base, int *got)
> +{
> +	char tmp[HSMP_PARSE_BUFSZ];
> +	char *s, *tok;
> +	int i = 0;
> +
> +	*got = 0;
> +	if (strscpy(tmp, buf, sizeof(tmp)) < 0)

2-args version.

> +		return -EINVAL;
> +
> +	s = tmp;
> +	while ((tok = strsep(&s, " \t\n")) != NULL) {
> +		if (*tok == '\0')
> +			continue;
> +		(*got)++;

Can this be named better? And I really don't get why this is useful number 
to return at all if kstrtou32() fails for some tokens so care to explain?

> +		if (i < n && !kstrtou32(tok, base, &vals[i]))

What about invalid values? Shouldn't it reject the whole input with 
-EINVAL?

> +			i++;
> +	}
> +
> +	return (i == n && *got == n) ? 0 : -EINVAL;

Looks a bit complicated for me.

I'd tend to think it should just reject all invalid inputs instead of 
trying to conceal the parsing problems.

> +}
> +
> +/* DF P-state range show function - reads current min and max DF P-states */
> +ssize_t hsmp_df_pstate_range_show(struct device *dev,
> +				  struct device_attribute *attr,
> +				  char *buf)
> +{
> +	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> +	struct hsmp_message msg = { 0 };

= {}; is enough to initialize

> +	u32 min_pstate, max_pstate;
> +	int ret;
> +
> +	/* Set bit 31 to indicate GET operation for HSMP_SET_GET type messages */
> +	msg.msg_id = HSMP_SET_PSTATE_MAX_MIN;
> +	msg.sock_ind = hsmp_sysfs_sock_ind(dev, hattr);
> +	msg.num_args = 1;
> +	msg.response_sz = 1;
> +	msg.args[0] = BIT(31);  /* GET operation */

Use define.

> +
> +	ret = hsmp_send_message(&msg);
> +	if (ret)
> +		return ret;
> +
> +	/* Extract min DF P-state[15:8] and max DF P-state[7:0] */
> +	min_pstate = (msg.args[0] >> 8) & 0xFF;
> +	max_pstate = msg.args[0] & 0xFF;

Named defines + FIELD_GET() + remove comments from here.

> +
> +	return sysfs_emit(buf, "%u %u\n", min_pstate, max_pstate);
> +}
> +
> +/* DF P-state range store function - sets min and max DF P-states */
> +ssize_t hsmp_df_pstate_range_store(struct device *dev,
> +				   struct device_attribute *attr,
> +				   const char *buf, size_t count)
> +{
> +	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> +	struct hsmp_message msg = { 0 };

{}

> +	u32 min_pstate, max_pstate;
> +	u32 vals[2];
> +	int ret;
> +	int got;
> +
> +	/* Parse input in format: "min_pstate max_pstate" */
> +	ret = hsmp_parse_u32_args(buf, vals, 2, 10, &got);
> +	if (ret) {
> +		hsmp_err(dev, "df_pstate_range", HSMP_ERR_ARGC,
> +			 "want=2 got=%d fmt=\"min max\"", got);

Here it even lies to the user, there were not necessarily 2 valid numbers 
even if it would say want=2 got=2.

> +		return -EINVAL;
> +	}
> +	min_pstate = vals[0];
> +	max_pstate = vals[1];
> +
> +	/* Min and max are 8-bit fields. Firmware rejects unsupported P-states. */
> +	if (min_pstate > 0xFF || max_pstate > 0xFF) {

> FIELD_MAX(...)

> +		hsmp_err(dev, "df_pstate_range", HSMP_ERR_RANGE,
> +			 "min=%u max=%u valid=0-255", min_pstate, max_pstate);
> +		return -EINVAL;
> +	}
> +
> +	/* Clear bit 31 for SET operation, pack min[15:8] and max[7:0] */

Remove.

> +	msg.msg_id = HSMP_SET_PSTATE_MAX_MIN;
> +	msg.sock_ind = hsmp_sysfs_sock_ind(dev, hattr);
> +	msg.num_args = 1;
> +	msg.response_sz = 1;
> +	msg.args[0] = (min_pstate << 8) | max_pstate;

FIELD_PREP() | FIELD_PREP()

> +
> +	ret = hsmp_send_message(&msg);
> +	if (ret) {
> +		if (max_pstate > min_pstate)
> +			hsmp_err(dev, "df_pstate_range", HSMP_ERR_ORDER,
> +				 "min=%u max=%u rule=max<=min rc=%d",

This says max <= min but your code checks the opposite condition??

Should max <= min be returning -EINVAL before even attempting to send the 
message? Does that ever make sense?

Use braces for multi-line blocks even if they're just one statement.

> +				  min_pstate, max_pstate, ret);
> +		else if (min_pstate > 2 || max_pstate > 2)

This too looks -EINVAL case if there's a known "max" state like this code 
implie? And why isn't it put into a named define?

It looks very odd to do these checks only after the fact in error 
handling. It's as if you're putting cart before the horse.

> +			hsmp_err(dev, "df_pstate_range", HSMP_ERR_RANGE,
> +				 "min=%u max=%u valid=0-2 rc=%d",

%d + max state define.

> +				  min_pstate, max_pstate, ret);
> +		else
> +			hsmp_err(dev, "df_pstate_range", HSMP_ERR_HW,
> +				 "min=%u max=%u rc=%d", min_pstate, max_pstate, ret);
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
> index bf5bac77102d3..9631b9067c142 100644
> --- a/drivers/platform/x86/amd/hsmp/sysfs.h
> +++ b/drivers/platform/x86/amd/hsmp/sysfs.h
> @@ -110,6 +110,11 @@ ssize_t hsmp_sdps_limit_show(struct device *dev, struct device_attribute *attr,
>  			     char *buf);
>  ssize_t hsmp_sdps_limit_store(struct device *dev, struct device_attribute *attr,
>  			      const char *buf, size_t count);
> +ssize_t hsmp_df_pstate_range_show(struct device *dev,
> +				  struct device_attribute *attr, char *buf);
> +ssize_t hsmp_df_pstate_range_store(struct device *dev,
> +				   struct device_attribute *attr,
> +				   const char *buf, size_t count);
>  
>  void hsmp_create_per_cpu_kobjects(struct device *dev, struct kobject *cpu_parent,
>  				  struct hsmp_socket *sock);
> 

-- 
 i.


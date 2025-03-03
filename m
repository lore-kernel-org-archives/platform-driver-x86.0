Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA951F0E4F
	for <platform-driver-x86@vger.kernel.org>; Mon,  3 Mar 2025 13:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741008715; cv=none; b=WS3qEgFszoZsw+8dPmZzyTw0arnA22jijMG3NyuLKxXQ/c5At115A6098cKoSK+nl9RU6QQkZYvFTBiUEO8FEvuuaBs2cCR3m7rEyl+DsJcodi/TdiEB+v+aBFLKdhzUY10/Xxt3PbcRiBH1qTycGwXfONtcTloa724G29jmM5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741008715; c=relaxed/simple;
	bh=aFavGEu8Fa81xNpVl7EtFBWBsNDq8YLcVx6PlmMwoEI=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=SMhnZTPtYF+KFkMQuYW61CnXpGQoNeSfOJzLCaZiB4H8g0ER6JivYNtMvOwNWARljlEiTnbRTxUZhzBCPqWRrMBstJfSpEW5wf99OhUKCupunH1mZdW3PH6BKJSBQ0/4adBi836kjedKH0GkEyAeK2CwQzl8LxnXE8zxso9D3qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZmCQJbvQ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZmCQJbvQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741008713; x=1772544713;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=aFavGEu8Fa81xNpVl7EtFBWBsNDq8YLcVx6PlmMwoEI=;
  b=ZmCQJbvQT5uNjVN2M7QCuC2SLQd2Bnz7XnVrBEzjpSwESC/nuVaATF2w
   z4RoY8KRJ5i8Dg3xSRVnpI0M8gxTbXwszWV4aVRM2YABxYjr5RUiYP+W+
   +uMZERS2WK/zaLq4lavLXb5xQh7GQ19zG3WCxT4DjvzDqDLB2ZYWq79GV
   7FT9oCV0YorXlL4GMfGkqk5BOIf0+aKRlgY6Ic2zfdUcQr8FnCek1jJkv
   s2PJIrUBBc2AwGM5wvZPjCOvocItUfZVXTRvzC0cXKU9qjS8GVNeso5mW
   CD6d2Z21l1sUiVNO8Ts2rwEd3Et1Q4QLEzelhuObHD++IGw5Fx8W0lkLF
   g==;
X-CSE-ConnectionGUID: IexT3BplRMyEt87ZMak41w==
X-CSE-MsgGUID: I1/mjh8bRW+SFGoQ1s3MsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="52521063"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="52521063"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 05:31:51 -0800
X-CSE-ConnectionGUID: oXJB976LR2GQIF9mw5UK1w==
X-CSE-MsgGUID: +jyAD6MsQ3iYduC4lnhKqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="123003346"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.14])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 05:31:49 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 3 Mar 2025 15:31:46 +0200 (EET)
To: Suma Hegde <suma.hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Subject: Re: [PATCH 3/3] platform/x86/amd/hsmp: acpi: Add sysfs files to show
 HSMP telemetry
In-Reply-To: <20250218123905.51984-4-suma.hegde@amd.com>
Message-ID: <17f9bfa5-8b7c-72f6-4179-23abebbe6a98@linux.intel.com>
References: <20250218123905.51984-1-suma.hegde@amd.com> <20250218123905.51984-4-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 18 Feb 2025, Suma Hegde wrote:

> Make frequently fetched telemetry available via sysfs interface.
> 
> Create following sysfs files per acpi device node.
> * c0_residency_input
> * prochot_status
> * smu_fw_version
> * protocol_version
> * ddr_max_bw(GB/s)
> * ddr_utilised_bw_input(GB/s)
> * ddr_utilised_bw_perc_input(%)
> * mclk_input(MHz)
> * fclk_input(MHz)
> * clk_fmax(MHz)
> * clk_fmin(MHz)
> * cclk_freq_limit_input(MHz)
> * pwr_current_active_freq_limit(MHz)
> * pwr_current_active_freq_limit_source
> 
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> ---
>  Documentation/arch/x86/amd_hsmp.rst  |  19 ++
>  drivers/platform/x86/amd/hsmp/acpi.c | 269 +++++++++++++++++++++++++++
>  drivers/platform/x86/amd/hsmp/hsmp.c |  21 +++
>  drivers/platform/x86/amd/hsmp/hsmp.h |   1 +
>  4 files changed, 310 insertions(+)
> 
> diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
> index 9e5fef538f4f..1bd13279461f 100644
> --- a/Documentation/arch/x86/amd_hsmp.rst
> +++ b/Documentation/arch/x86/amd_hsmp.rst
> @@ -71,6 +71,25 @@ Note: lseek() is not supported as entire metrics table is read.
>  Metrics table definitions will be documented as part of Public PPR.
>  The same is defined in the amd_hsmp.h header.
>  
> +2. HSMP telemetry sysfs files
> +
> +Following sysfs file are available at /sys/devices/platform/AMDI0097:0X/.
> +
> +* c0_residency_input : percentage of cores in C0 state
> +* prochot_status :  reports 1 if socket is in prochot, 0 otherwhile
> +* smu_fw_version : SMU firmware version
> +* protocol_version : HSMP interface version
> +* ddr_max_bw : theoretical maximum ddr bw in GB/s
> +* ddr_utilised_bw_input: current utilized ddr bw in GB/s
> +* ddr_utilised_bw_perc_input(%): Percentage of current utilized ddr bw
> +* mclk_input : memory clock in MHz
> +* fclk_input: fabric clock in MHz
> +* clk_fmax : max frequency of socket in MHz
> +* clk_fmin : min frequency of socket in MHz
> +* cclk_freq_limit_input : core clock frequency limit per socket in MHz
> +* pwr_current_active_freq_limit: current active frequency limit of socket in MHz
> +* pwr_current_active_freq_limit_source: source of current active frequency limit
> +
>  ACPI device object format
>  =========================
>  The ACPI object format expected from the amd_hsmp driver
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
> index f73b6aedb986..5c327f94032a 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -36,6 +36,11 @@
>  
>  static struct hsmp_plat_device *hsmp_pdev;
>  
> +struct hsmp_sys_attr {
> +	struct device_attribute dattr;
> +	u32 msg_id;
> +};
> +
>  static int amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
>  			      u32 *value, bool write)
>  {
> @@ -243,6 +248,226 @@ static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
>  	return 0;
>  }
>  
> +static umode_t hsmp_is_sock_dev_attr_visible(struct kobject *kobj,
> +					     struct attribute *attr, int id)
> +{
> +	return attr->mode;
> +}
> +
> +#define to_hsmp_sys_attr(__attr) container_of(__attr, struct hsmp_sys_attr, dattr)
> +
> +static ssize_t hsmp_msg_resp32_show(struct device *dev, struct device_attribute *attr,
> +				    char *buf)
> +{
> +	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> +	struct hsmp_socket *sock = dev_get_drvdata(dev);
> +	u32 data;
> +	int ret;
> +
> +	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
> +	if (!ret)

Please reverse the logic in these constructs and return error in early 
instead.

> +		return sysfs_emit(buf, "%u\n", data);
> +
> +	return ret;
> +}
> +
> +static ssize_t hsmp_ddr_max_bw_show(struct device *dev, struct device_attribute *attr,
> +				    char *buf)
> +{
> +	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> +	struct hsmp_socket *sock = dev_get_drvdata(dev);
> +	u32 data;
> +	int ret;
> +	u16 mbw;
> +
> +	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
> +	if (!ret) {
> +		mbw = data >> 20;

Is this 20 log2(SZ_1M), which should be coded instead if that's the case?
Or should this define a named field and use FIELD_GET()?

> +		return sysfs_emit(buf, "%u\n", mbw);
> +	}
> +
> +	return ret;
> +}
> +
> +static ssize_t hsmp_ddr_util_bw_show(struct device *dev, struct device_attribute *attr,
> +				     char *buf)
> +{
> +	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> +	struct hsmp_socket *sock = dev_get_drvdata(dev);
> +	u32 data;
> +	int ret;
> +	u16 ubw;
> +
> +	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
> +	if (!ret) {
> +		ubw = (data >> 8) & GENMASK(12, 0);

Please name with a define and use FIELD_GET(), don't forget to add the 
header if not already there.

> +		return sysfs_emit(buf, "%u\n", ubw);
> +	}
> +
> +	return ret;
> +}
> +
> +static ssize_t hsmp_ddr_util_bw_perc_show(struct device *dev, struct device_attribute *attr,
> +					  char *buf)
> +{
> +	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> +	struct hsmp_socket *sock = dev_get_drvdata(dev);
> +	u32 data;
> +	int ret;
> +	u8 perc;
> +
> +	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
> +	if (!ret) {
> +		perc = data & GENMASK(7, 0);

Ditto.

> +		return sysfs_emit(buf, "%u\n", perc);
> +	}
> +
> +	return ret;
> +}
> +
> +static ssize_t hsmp_msg_fw_ver_show(struct device *dev, struct device_attribute *attr,
> +				    char *buf)
> +{
> +	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> +	struct hsmp_socket *sock = dev_get_drvdata(dev);
> +	u32 data;
> +	u8 major;
> +	u8 minor;
> +	u8 debug;
> +	int ret;
> +
> +	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
> +	if (!ret) {
> +		major = data >> 16 & GENMASK(7, 0);
> +		minor = data >> 8 & GENMASK(7, 0);
> +		debug = data & GENMASK(7, 0);

Ditto.

> +		return sysfs_emit(buf, "%u.%u.%u\n", major, minor, debug);

You could just make the FIELD_GET() calls within the sysfs_emit()'s 
arguments and remove the local variables.

> +	}
> +	return ret;
> +}
> +
> +static ssize_t hsmp_fclk_show(struct device *dev, struct device_attribute *attr,
> +			      char *buf)
> +{
> +	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> +	struct hsmp_socket *sock = dev_get_drvdata(dev);
> +	u32 data[2];
> +	int ret;
> +
> +	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, data, 2);
> +	if (!ret)
> +		return sysfs_emit(buf, "%u\n", data[0]);
> +
> +	return ret;
> +}
> +
> +static ssize_t hsmp_mclk_show(struct device *dev, struct device_attribute *attr,
> +			      char *buf)
> +{
> +	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> +	struct hsmp_socket *sock = dev_get_drvdata(dev);
> +	u32 data[2];
> +	int ret;
> +
> +	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, data, 2);
> +	if (!ret)
> +		return sysfs_emit(buf, "%u\n", data[1]);
> +
> +	return ret;
> +}
> +
> +static ssize_t hsmp_clk_fmax_show(struct device *dev, struct device_attribute *attr,
> +				  char *buf)
> +{
> +	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> +	struct hsmp_socket *sock = dev_get_drvdata(dev);
> +	u32 data;
> +	u16 fmax;
> +	int ret;
> +
> +	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
> +	if (!ret) {
> +		fmax = (data >> 16) & GENMASK(15, 0);
> +		return sysfs_emit(buf, "%u\n", fmax);
> +	}
> +
> +	return ret;
> +}
> +
> +static ssize_t hsmp_clk_fmin_show(struct device *dev, struct device_attribute *attr,
> +				  char *buf)
> +{
> +	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> +	struct hsmp_socket *sock = dev_get_drvdata(dev);
> +	u32 data;
> +	u16 fmin;
> +	int ret;
> +
> +	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
> +	if (!ret) {
> +		fmin = data & GENMASK(15, 0);
> +		return sysfs_emit(buf, "%u\n", fmin);
> +	}
> +
> +	return ret;
> +}
> +
> +static ssize_t hsmp_freq_limit_show(struct device *dev, struct device_attribute *attr,
> +				    char *buf)
> +{
> +	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> +	struct hsmp_socket *sock = dev_get_drvdata(dev);
> +	u16 freq_limit;
> +	u32 data;
> +	int ret;
> +
> +	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
> +	if (!ret) {
> +		freq_limit = data >> 16 & GENMASK(15, 0);
> +		return sysfs_emit(buf, "%u\n", freq_limit);
> +	}
> +
> +	return ret;
> +}
> +
> +static const char * const freqlimit_srcnames[] = {
> +	"cHTC-Active",
> +	"PROCHOT",
> +	"TDC limit",
> +	"PPT Limit",
> +	"OPN Max",
> +	"Reliability Limit",
> +	"APML Agent",
> +	"HSMP Agent"
> +};
> +
> +static ssize_t hsmp_freq_limit_source_show(struct device *dev, struct device_attribute *attr,
> +					   char *buf)
> +{
> +	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> +	struct hsmp_socket *sock = dev_get_drvdata(dev);
> +	u32 index = 0;
> +	int len = 0;
> +	u16 src_ind;
> +	u32 data;
> +	int ret;
> +
> +	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
> +	if (!ret) {
> +		src_ind = data & GENMASK(15, 0);
> +		while (src_ind != 0 && index < ARRAY_SIZE(freqlimit_srcnames)) {
> +			if ((src_ind & 1) == 1)

It would be more obvious to iterate the array indexes with a for loop.

> +				len += sysfs_emit_at(buf, len, "%s ", freqlimit_srcnames[index]);
> +			index += 1;
> +			src_ind = src_ind >> 1;
> +		}
> +		len += sysfs_emit_at(buf, len, "\n");
> +		return len;
> +	}
> +
> +	return ret;
> +}
> +
>  static int init_acpi(struct device *dev)
>  {
>  	u16 sock_ind;
> @@ -280,6 +505,7 @@ static int init_acpi(struct device *dev)
>  		if (ret)
>  			dev_err(dev, "Failed to init metric table\n");
>  	}
> +	dev_set_drvdata(dev, &hsmp_pdev->sock[sock_ind]);
>  
>  	return ret;
>  }
> @@ -295,9 +521,52 @@ static const struct bin_attribute *hsmp_attr_list[] = {
>  	NULL
>  };
>  
> +#define HSMP_DEV_ATTR(_name, _msg_id, _show, _mode)	\
> +static struct hsmp_sys_attr hattr_##_name = {		\
> +	.dattr = __ATTR(_name, _mode, _show, NULL),	\
> +	.msg_id = _msg_id				\
> +}
> +
> +HSMP_DEV_ATTR(c0_residency_input, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444);
> +HSMP_DEV_ATTR(prochot_status, HSMP_GET_PROC_HOT, hsmp_msg_resp32_show, 0444);
> +HSMP_DEV_ATTR(smu_fw_version, HSMP_GET_SMU_VER, hsmp_msg_fw_ver_show, 0444);
> +HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_show, 0444);
> +HSMP_DEV_ATTR(cclk_freq_limit_input, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444);
> +HSMP_DEV_ATTR(ddr_max_bw, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_max_bw_show, 0444);
> +HSMP_DEV_ATTR(ddr_utilised_bw_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444);
> +HSMP_DEV_ATTR(ddr_utilised_bw_perc_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_perc_show, 0444);
> +HSMP_DEV_ATTR(fclk_input, HSMP_GET_FCLK_MCLK, hsmp_fclk_show, 0444);
> +HSMP_DEV_ATTR(mclk_input, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444);
> +HSMP_DEV_ATTR(clk_fmax, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmax_show, 0444);
> +HSMP_DEV_ATTR(clk_fmin, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmin_show, 0444);
> +HSMP_DEV_ATTR(pwr_current_active_freq_limit, HSMP_GET_SOCKET_FREQ_LIMIT,
> +	      hsmp_freq_limit_show, 0444);
> +HSMP_DEV_ATTR(pwr_current_active_freq_limit_source, HSMP_GET_SOCKET_FREQ_LIMIT,
> +	      hsmp_freq_limit_source_show, 0444);
> +
> +static struct attribute *hsmp_dev_attr_list[] = {
> +	&hattr_c0_residency_input.dattr.attr,
> +	&hattr_prochot_status.dattr.attr,
> +	&hattr_smu_fw_version.dattr.attr,
> +	&hattr_protocol_version.dattr.attr,
> +	&hattr_cclk_freq_limit_input.dattr.attr,
> +	&hattr_ddr_max_bw.dattr.attr,
> +	&hattr_ddr_utilised_bw_input.dattr.attr,
> +	&hattr_ddr_utilised_bw_perc_input.dattr.attr,
> +	&hattr_fclk_input.dattr.attr,
> +	&hattr_mclk_input.dattr.attr,
> +	&hattr_clk_fmax.dattr.attr,
> +	&hattr_clk_fmin.dattr.attr,
> +	&hattr_pwr_current_active_freq_limit.dattr.attr,
> +	&hattr_pwr_current_active_freq_limit_source.dattr.attr,
> +	NULL,
> +};
> +
>  static const struct attribute_group hsmp_attr_grp = {
>  	.bin_attrs_new = hsmp_attr_list,
> +	.attrs = hsmp_dev_attr_list,
>  	.is_bin_visible = hsmp_is_sock_attr_visible,
> +	.is_visible = hsmp_is_sock_dev_attr_visible,
>  };
>  
>  static const struct attribute_group *hsmp_groups[] = {
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
> index 8c05e1415820..65d37605bf88 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
> @@ -229,6 +229,27 @@ int hsmp_send_message(struct hsmp_message *msg)
>  }
>  EXPORT_SYMBOL_NS_GPL(hsmp_send_message, "AMD_HSMP");
>  
> +int hsmp_msg_get_nargs(u16 sock_ind, u32 msg_id, u32 *data, u8 n)
> +{
> +	struct hsmp_message msg = { 0 };
> +	int ret;
> +	int i;
> +
> +	if (!data)
> +		return -EINVAL;
> +	msg.msg_id = msg_id;
> +	msg.sock_ind = sock_ind;
> +	msg.response_sz = n;
> +
> +	ret = hsmp_send_message(&msg);
> +	if (!ret) {

Reverse logic.

> +		for (i = 0; i < n; i++)
> +			data[i] = msg.args[i];
> +	}
> +	return ret;
> +}
> +EXPORT_SYMBOL_NS_GPL(hsmp_msg_get_nargs, "AMD_HSMP");
> +
>  int hsmp_test(u16 sock_ind, u32 value)
>  {
>  	struct hsmp_message msg = { 0 };
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
> index e0227247c995..78cf63cf2613 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
> @@ -75,4 +75,5 @@ int hsmp_get_tbl_dram_base(u16 sock_ind);
>  ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size);
>  struct hsmp_plat_device *get_hsmp_pdev(void);
>  int hsmp_create_sensor(struct device *dev, struct hsmp_plat_device *pdev);
> +int hsmp_msg_get_nargs(u16 sock_ind, u32 msg_id, u32 *data, u8 n);
>  #endif /* HSMP_H */
> 

-- 
 i.


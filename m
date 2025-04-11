Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08FB22129B
	for <platform-driver-x86@vger.kernel.org>; Fri, 11 Apr 2025 11:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744369406; cv=none; b=hdlaEIkyOvYozX5qlruCjFE+wuxs54fgpOku/ximpAysfpesXHqNv38ZihrlDLUj4x5XeBZWIk8XYH1bMNOyFdY5YCYoblNOVYe31JVV824IEc/fs5OQQrPccPOHWUVASKf2/ZH6hujBvGOkx5MxkTopgBw/JacQd3zewp8+MB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744369406; c=relaxed/simple;
	bh=KKnN7NsBukZmgjcuGxevVApebbXVIefH9Xi9wJnuAPc=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=TgMCM6mh7zlmBtWWM0njp3dx+jrTBHgfojNcr+tmqx02imYfWzEzTNZNHjQWsgTp6226US//PWUYBZvoSgtKmHJ8X5QGBHxmlaFG8aOGUM2olzHaEXCQG/e8mGejcPOHB27xTHZeC8WOH5Kov9n34V9ILn6CilWdJfoLjxDXUUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ao585QJV; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ao585QJV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744369403; x=1775905403;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=KKnN7NsBukZmgjcuGxevVApebbXVIefH9Xi9wJnuAPc=;
  b=ao585QJV5UQIvJFhiQfw3iNfJWtiiML4Qc8Q/t9ExRDi7uC0CHTmS6Ei
   U7FFoy7oYLiZRbQFRNtmh9/Lxp9/y6ZQuSYR8AM1SxUuX72IvPA8UemP6
   m+L1hF99/bVtklQueKDoydxmPJ9++7F7bT48vmbk12XvRE2LVMfy2Rq8k
   Nu0A71kFHg3H7mzMFQqutcahgmS48iW3apS3r+5PcHALNl/Kj716HwoUB
   F8ixiwCT15konpoHiPXIADdkDgnzijaZvpVU7rLlqPDevC45hvXxW2zLo
   ij7e+CdtuO16c2y+CSDUI2cEqGzE8GkNsUo8xZGmWFpB7U4bar/pCsKIb
   A==;
X-CSE-ConnectionGUID: V7VZ5NvgQlOUNH+KgOC8iw==
X-CSE-MsgGUID: 7F6jY8GKTxuRRl9zAsWaAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="57290288"
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; 
   d="scan'208";a="57290288"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 04:03:23 -0700
X-CSE-ConnectionGUID: 7UTTmsivScKSOvQVyRS5eg==
X-CSE-MsgGUID: 7Py9gfikSuuSnR8XBAizIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; 
   d="scan'208";a="166356288"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.51])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 04:03:21 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 11 Apr 2025 14:03:17 +0300 (EEST)
To: Suma Hegde <suma.hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Subject: Re: [v2 3/3] platform/x86/amd/hsmp: acpi: Add sysfs files to show
 HSMP telemetry
In-Reply-To: <20250325060457.3643613-3-suma.hegde@amd.com>
Message-ID: <ef159e97-6ae9-0646-2488-c2ecacad2243@linux.intel.com>
References: <20250325060457.3643613-1-suma.hegde@amd.com> <20250325060457.3643613-3-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 25 Mar 2025, Suma Hegde wrote:

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
> Changes since v1:
> 1. Add linux/bitops.h
> 2. Define DDR_MAX_BW, DDR_UTIL_BW DDR_UTIL_BW_PERC FW_VER_MAJOR FW_VER_MINOR FW_VER_DEBUG FMAX
>    FMIN FREQ_LIMIT FREQ_SRC_IND and use them in functions.
> 3. Return early in hsmp_msg_get_nargs()
> 4. Change while loop to for loop in hsmp_freq_limit_source_show()
> 5. Correct the GENMASK size in hsmp_ddr_util_bw_show()[bit 19:8, instead
>    of bit 20:8]
> 
>  Documentation/arch/x86/amd_hsmp.rst  |  31 +++-
>  drivers/platform/x86/amd/hsmp/acpi.c | 259 +++++++++++++++++++++++++++
>  drivers/platform/x86/amd/hsmp/hsmp.c |  21 +++
>  drivers/platform/x86/amd/hsmp/hsmp.h |   1 +
>  4 files changed, 305 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
> index 1d7b159a35d5..45a209fd5861 100644
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

otherwise

What's "prochot" ?

> +* smu_fw_version : SMU firmware version
> +* protocol_version : HSMP interface version
> +* ddr_max_bw : theoretical maximum ddr bw in GB/s

Please capitalize comments and documentation properly.

> +* ddr_utilised_bw_input: current utilized ddr bw in GB/s
> +* ddr_utilised_bw_perc_input(%): Percentage of current utilized ddr bw
> +* mclk_input : memory clock in MHz
> +* fclk_input: fabric clock in MHz
> +* clk_fmax : max frequency of socket in MHz
> +* clk_fmin : min frequency of socket in MHz
> +* cclk_freq_limit_input : core clock frequency limit per socket in MHz
> +* pwr_current_active_freq_limit: current active frequency limit of socket in MHz

Is that "active" a meaningful word in this or would just current frequency 
limit suffice?

> +* pwr_current_active_freq_limit_source: source of current active frequency limit
> +
>  ACPI device object format
>  =========================
>  The ACPI object format expected from the amd_hsmp driver
> @@ -119,13 +138,11 @@ for socket with ID00 is given below::
>  
>  HSMP HWMON interface
>  ==================
> -HSMP power sensors are registered with hwmon interface.
> -
> -One hwmon directory is created for each socket and following files with 0444 permission are created
> -inside the hwmon directory.
> -- power1_input
> -- power1_cap_max
> -- power1_cap
> +HSMP power sensors are registered with hwmon interface. One hwmon directory is created for each
> +socket and following files are created inside the hwmon directory.

Please fold documentation paragraphs at 80 chars.

> +- power1_input(read only)
> +- power1_cap_max(read only)
> +- power1_cap(read, write)

Don't these need space in before (?

>  
>  An example
>  ==========
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
> index abbb680b9c71..803da111a034 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -13,6 +13,7 @@
>  #include <asm/amd_nb.h>
>  
>  #include <linux/acpi.h>
> +#include <linux/bitops.h>
>  #include <linux/device.h>
>  #include <linux/dev_printk.h>
>  #include <linux/ioport.h>
> @@ -36,6 +37,11 @@
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
> @@ -243,6 +249,214 @@ static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
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

Reverse logic and handle the error first. Only on very special occassions 
can it be done the other way around but the normal principle is check 
error and early return.

> +		return sysfs_emit(buf, "%u\n", data);
> +
> +	return ret;
> +}
> +
> +#define DDR_MAX_BW(data)	FIELD_GET(GENMASK(31, 20), data)
> +#define DDR_UTIL_BW(data)	FIELD_GET(GENMASK(19, 8), data)
> +#define DDR_UTIL_BW_PERC(data)	FIELD_GET(GENMASK(7, 0), data)
> +#define FW_VER_MAJOR(data)	FIELD_GET(GENMASK(23, 16), data)
> +#define FW_VER_MINOR(data)	FIELD_GET(GENMASK(15, 8), data)
> +#define FW_VER_DEBUG(data)	FIELD_GET(GENMASK(7, 0), data)
> +#define FMAX(data)		FIELD_GET(GENMASK(31, 16), data)
> +#define FMIN(data)		FIELD_GET(GENMASK(15, 0), data)
> +#define FREQ_LIMIT(data)	FIELD_GET(GENMASK(31, 16), data)
> +#define FREQ_SRC_IND(data)	FIELD_GET(GENMASK(15, 0), data)
> +
> +static ssize_t hsmp_ddr_max_bw_show(struct device *dev, struct device_attribute *attr,
> +				    char *buf)
> +{
> +	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> +	struct hsmp_socket *sock = dev_get_drvdata(dev);
> +	u32 data;
> +	int ret;
> +
> +	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
> +	if (!ret)
> +		return sysfs_emit(buf, "%u\n", (u32)DDR_MAX_BW(data));

Why are these cast necessary?

I'd prefer naming the fields instead of making them function like macros 
and using FIELD_GET() here.

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
> +
> +	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
> +	if (!ret)
> +		return sysfs_emit(buf, "%u\n", (u32)DDR_UTIL_BW(data));
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
> +
> +	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
> +	if (!ret)
> +		return sysfs_emit(buf, "%u\n", (u32)DDR_UTIL_BW_PERC(data));
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
> +	int ret;
> +
> +	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
> +	if (!ret)
> +		return sysfs_emit(buf, "%u.%u.%u\n", (u32)FW_VER_MAJOR(data),
> +				  (u32)FW_VER_MINOR(data), (u32)FW_VER_DEBUG(data));
> +
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
> +	int ret;
> +
> +	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
> +	if (!ret)
> +		return sysfs_emit(buf, "%u\n", (u32)FMAX(data));
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
> +	int ret;
> +
> +	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
> +	if (!ret)
> +		return sysfs_emit(buf, "%u\n", (u32)FMIN(data));
> +
> +	return ret;
> +}
> +
> +static ssize_t hsmp_freq_limit_show(struct device *dev, struct device_attribute *attr,
> +				    char *buf)
> +{
> +	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> +	struct hsmp_socket *sock = dev_get_drvdata(dev);
> +	u32 data;
> +	int ret;
> +
> +	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
> +	if (!ret)
> +		return sysfs_emit(buf, "%u\n", (u32)FREQ_LIMIT(data));
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

Add comma.

> +};
> +
> +static ssize_t hsmp_freq_limit_source_show(struct device *dev, struct device_attribute *attr,
> +					   char *buf)
> +{
> +	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> +	struct hsmp_socket *sock = dev_get_drvdata(dev);
> +	u32 index = 0;

Either use unsigned int or size_t. u32 is not the right type for this.

Also, why you need to initialize it??

> +	int len = 0;
> +	u16 src_ind;
> +	u32 data;
> +	int ret;
> +
> +	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
> +	if (!ret) {

Please handle error first and return early.

> +		src_ind = (u16)FREQ_SRC_IND(data);

This casting seems overkill.

> +		for (index = 0; index < ARRAY_SIZE(freqlimit_srcnames); index++) {
> +			if (src_ind == 0)
> +				break;
> +			if ((src_ind & 1) == 1)

Unnecessary == 1, and then unnecessary parenthesis.

> +				len += sysfs_emit_at(buf, len, "%s ", freqlimit_srcnames[index]);

This will output an extra " " at the end.

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
> @@ -285,6 +499,8 @@ static int init_acpi(struct device *dev)
>  	if (ret)
>  		dev_err(dev, "Failed to register HSMP sensors with hwmon\n");
>  
> +	dev_set_drvdata(dev, &hsmp_pdev->sock[sock_ind]);
> +
>  	return ret;
>  }
>  
> @@ -299,9 +515,52 @@ static const struct bin_attribute *hsmp_attr_list[] = {
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

unsigned int.

> +
> +	if (!data)
> +		return -EINVAL;
> +	msg.msg_id = msg_id;
> +	msg.sock_ind = sock_ind;
> +	msg.response_sz = n;
> +
> +	ret = hsmp_send_message(&msg);
> +	if (!ret) {

Please return early on errors.

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
> index 0063904904ed..febc1672bd65 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
> @@ -74,4 +74,5 @@ int hsmp_create_sensor(struct device *dev, u16 sock_ind);
>  	return 0;
>  }
>  #endif
> +int hsmp_msg_get_nargs(u16 sock_ind, u32 msg_id, u32 *data, u8 n);
>  #endif /* HSMP_H */
> 

I'm pretty sure I've commented some of similar cases against your other 
patches in the past. I'd appreciate if you try to take such coding style 
comments always into account in future patches too so we don't end up 
going back and forth on trivialities like that.

It might be helpful if you try to "review" your own patch before sending 
them out to see if you missed something (it might surprise how many issues 
you will end up catching by simply looking through your own changes before 
sending them, at least I find many issues that way from my own patches).

-- 
 i.


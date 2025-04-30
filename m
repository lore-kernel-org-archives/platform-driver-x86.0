Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DC325B1D2
	for <platform-driver-x86@vger.kernel.org>; Wed, 30 Apr 2025 13:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746019549; cv=none; b=YMO3ES3SrmNBwl4Ejsb7FXSZJh8b3NUdDv1oWxrZiJ5P5+sG0tdFyr8Sc8dBsT0gmyivLaAABLLfve+PKpjM1xzPO7JtgyPzcpPrGwLXMFJawRuQLg1sGgSzk9KuwGPw5nKaEUNpqSB1MwoJyk255g4Ji31RbH9MZBVZkoVDpuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746019549; c=relaxed/simple;
	bh=CKY9kNTqqtJrRrKLITRN9IGgBUBj/J3f1uRJqhwF8eM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=iaAWg8rcCXyOwvSytwYWDyQ2SWW2ar8+3T37ZsZBuCs77VdsVF75PKP3HDeL8P5ZPFSA+86zdCn5jFjGv7fxDwn+eoQa1FrGEmDshljr+wPVZpkv+QaPe5R5hBqSs0CV26ciRkECltq+vl6NF/DhbzJZPXvsQFazvP1iyzLuaBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m2bkAJ8L; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m2bkAJ8L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746019547; x=1777555547;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=CKY9kNTqqtJrRrKLITRN9IGgBUBj/J3f1uRJqhwF8eM=;
  b=m2bkAJ8L8M1AIxHw5kDb8wwjj2kkWLXhPx4l8cKW6acviWsXE/68+5Kp
   Go4z5EdtRq38g/rJMZW32n+pCm8YcjFL9XCvFdLY/TVnqCQhx3fJL1BPu
   WTiuY2/C5CGeuDqEtzRY47ENMw5Iy7CQkaXb/y7A5YardZGQ713P97ZHm
   9qRouITvxq+uR3klWJpe7l+uY4b9+22vkvsAc0heI/HxnYSKOnzMO+mDN
   i8sHpWHrQlIhEWl1nOdlQmZQUop0ojgNBuwtKw7FXRJd2NqT07Smxb7UH
   lYTlqu/Mjb5007EV250GrK80bGrhCPwVOw71iGMoDD+ecw5SmAnurwNr7
   Q==;
X-CSE-ConnectionGUID: SPD5ljZlT9WVSMMFMIwK7w==
X-CSE-MsgGUID: z/rGoILWR3+upZFdsd/ELA==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="58312048"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="58312048"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 06:25:45 -0700
X-CSE-ConnectionGUID: IeS8ROCsTUWlK/XTNcG/Ig==
X-CSE-MsgGUID: nGbpp0MJQ/6HdtQCQOpbaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="165208622"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.97])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 06:25:43 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 30 Apr 2025 16:25:40 +0300 (EEST)
To: Suma Hegde <suma.hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Subject: Re: [v3 3/3] platform/x86/amd/hsmp: acpi: Add sysfs files to display
 HSMP telemetry
In-Reply-To: <20250430123819.1289068-3-suma.hegde@amd.com>
Message-ID: <c07146fb-6eea-a06b-32de-ba364b25308c@linux.intel.com>
References: <20250430123819.1289068-1-suma.hegde@amd.com> <20250430123819.1289068-3-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 30 Apr 2025, Suma Hegde wrote:

> Make frequently fetched telemetry available via sysfs. These parameters
> do not fit in hwmon sensor model, hence make them available via sysfs.
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
> Changes since v2:
> 1. Change commit mesage and description
> 2. Update documentation
> 3. Remove hwmon related documentation changes from this patch
> 4. Define FIELD_GET_U32, use it everywhere where casting to u32 is needed
> 5. Define masks and use FIELD_GET() directly instead of defining function like
>    macros
> 6. Return early on error cases from all the functions
> 7. Add comma after hsmp agent in freqlimit_srcnames[]
> 8. Make index as int in hsmp_freq_limit_source_show(), remove
>    unnecessary intialization and change the printing format
> 9. Change int i to unsigned int i and return early on error in
>    hsmp_msg_get_nargs()
> 11. Change n to num_args in hsmp_msg_get_nargs()
> 12. Change __attr to _attr in to_hsmp_sys_attr()
> 13. Change "%u" to "%lu" in sysfs_emit to avoid compiler warnings
> 
> Changes since v1:
> 1. Add linux/bitops.h
> 2. Define DDR_MAX_BW, DDR_UTIL_BW DDR_UTIL_BW_PERC FW_VER_MAJOR FW_VER_MINOR FW_VER_DEBUG FMAX
>    FMIN FREQ_LIMIT FREQ_SRC_IND and use them in functions.
> 3. Return early in hsmp_msg_get_nargs()
> 4. Change while loop to for loop in hsmp_freq_limit_source_show()
> 5. Correct the GENMASK size in hsmp_ddr_util_bw_show()[bit 19:8, instead
>    of bit 20:8]
> 
>  Documentation/arch/x86/amd_hsmp.rst  |  22 +++
>  drivers/platform/x86/amd/hsmp/acpi.c | 260 +++++++++++++++++++++++++++
>  drivers/platform/x86/amd/hsmp/hsmp.c |  23 +++
>  drivers/platform/x86/amd/hsmp/hsmp.h |   1 +
>  4 files changed, 306 insertions(+)
> 
> diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
> index 3ef3e0a71df9..a094f55c10b0 100644
> --- a/Documentation/arch/x86/amd_hsmp.rst
> +++ b/Documentation/arch/x86/amd_hsmp.rst
> @@ -71,6 +71,28 @@ Note: lseek() is not supported as entire metrics table is read.
>  Metrics table definitions will be documented as part of Public PPR.
>  The same is defined in the amd_hsmp.h header.
>  
> +2. HSMP telemetry sysfs files
> +
> +Following sysfs files are available at /sys/devices/platform/AMDI0097:0X/.
> +
> +* c0_residency_input: Percentage of cores in C0 state.
> +* prochot_status: Reports 1 if the processor is at thermal threshold value,
> +  0 otherwise.
> +* smu_fw_version: SMU firmware version.
> +* protocol_version: HSMP interface version.
> +* ddr_max_bw: Theoretical maximum DDR bandwidth in GB/s.
> +* ddr_utilised_bw_input: Current utilized DDR bandwidth in GB/s.
> +* ddr_utilised_bw_perc_input(%): Percentage of current utilized DDR bandwidth.
> +* mclk_input: Memory clock in MHz.
> +* fclk_input: Fabric clock in MHz.
> +* clk_fmax: Maximum frequency of socket in MHz.
> +* clk_fmin: Minimum frequency of socket in MHz.
> +* cclk_freq_limit_input: Core clock frequency limit per socket in MHz.
> +* pwr_current_active_freq_limit: Current active frequency limit of socket
> +  in MHz.
> +* pwr_current_active_freq_limit_source: Source of current active frequency
> +  limit.
> +
>  ACPI device object format
>  =========================
>  The ACPI object format expected from the amd_hsmp driver
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
> index 93b413e0a6e6..4807f3992633 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -12,6 +12,7 @@
>  #include <asm/amd_hsmp.h>
>  
>  #include <linux/acpi.h>
> +#include <linux/bitops.h>

If this is for GENMASK(), use linux/bits.h.

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
> @@ -243,6 +249,215 @@ static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
>  	return 0;
>  }
>  
> +static umode_t hsmp_is_sock_dev_attr_visible(struct kobject *kobj,
> +					     struct attribute *attr, int id)
> +{
> +	return attr->mode;
> +}
> +
> +#define to_hsmp_sys_attr(_attr) container_of(_attr, struct hsmp_sys_attr, dattr)
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
> +	if (ret)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%u\n", data);
> +}
> +
> +#define DDR_MAX_BW_MASK		GENMASK(31, 20)
> +#define DDR_UTIL_BW_MASK	GENMASK(19, 8)
> +#define DDR_UTIL_BW_PERC_MASK	GENMASK(7, 0)
> +#define FW_VER_MAJOR_MASK	GENMASK(23, 16)
> +#define FW_VER_MINOR_MASK	GENMASK(15, 8)
> +#define FW_VER_DEBUG_MASK	GENMASK(7, 0)
> +#define FMAX_MASK		GENMASK(31, 16)
> +#define FMIN_MASK		GENMASK(15, 0)
> +#define FREQ_LIMIT_MASK		GENMASK(31, 16)
> +#define FREQ_SRC_IND_MASK	GENMASK(15, 0)
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
> +	if (ret)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%lu\n", FIELD_GET(DDR_MAX_BW_MASK, data));

Missing include for FIELD_GET().

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
> +	if (ret)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%lu\n", FIELD_GET(DDR_UTIL_BW_MASK, data));
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
> +	if (ret)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%lu\n", FIELD_GET(DDR_UTIL_BW_PERC_MASK, data));
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
> +	if (ret)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%lu.%lu.%lu\n",
> +			  FIELD_GET(FW_VER_MAJOR_MASK, data),
> +			  FIELD_GET(FW_VER_MINOR_MASK, data),
> +			  FIELD_GET(FW_VER_DEBUG_MASK, data));
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
> +	if (ret)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%u\n", data[0]);
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
> +	if (ret)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%u\n", data[1]);
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
> +	if (ret)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%lu\n", FIELD_GET(FMAX_MASK, data));
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
> +	if (ret)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%lu\n", FIELD_GET(FMIN_MASK, data));
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
> +	if (ret)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%lu\n", FIELD_GET(FREQ_LIMIT_MASK, data));
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
> +	"HSMP Agent",
> +};
> +
> +static ssize_t hsmp_freq_limit_source_show(struct device *dev, struct device_attribute *attr,
> +					   char *buf)
> +{
> +	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> +	struct hsmp_socket *sock = dev_get_drvdata(dev);
> +	unsigned int index;
> +	int len = 0;
> +	u16 src_ind;
> +	u32 data;
> +	int ret;
> +
> +	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
> +	if (ret)
> +		return ret;
> +
> +	src_ind = FIELD_GET(FREQ_SRC_IND_MASK, data);
> +	for (index = 0; index < ARRAY_SIZE(freqlimit_srcnames); index++) {

Missing include for ARRAY_SIZE.

> +		if (!src_ind)
> +			break;
> +		if (src_ind & 1)
> +			len += sysfs_emit_at(buf, len, "%s\n", freqlimit_srcnames[index]);
> +		src_ind = src_ind >> 1;

		src_ind >>= 1;

> +	}
> +	return len;
> +}
> +
>  static int init_acpi(struct device *dev)
>  {
>  	u16 sock_ind;
> @@ -285,6 +500,8 @@ static int init_acpi(struct device *dev)
>  	if (ret)
>  		dev_err(dev, "Failed to register HSMP sensors with hwmon\n");
>  
> +	dev_set_drvdata(dev, &hsmp_pdev->sock[sock_ind]);
> +
>  	return ret;
>  }
>  
> @@ -299,9 +516,52 @@ static const struct bin_attribute *hsmp_attr_list[] = {
>  	NULL
>  };
>  
> +#define HSMP_DEV_ATTR(_name, _msg_id, _show, _mode)	\
> +static struct hsmp_sys_attr hattr_##_name = {		\
> +	.dattr = __ATTR(_name, _mode, _show, NULL),	\
> +	.msg_id = _msg_id,				\
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

Don't add comma to terminators.

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
> index 3df34d7436a9..6f605409cc02 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
> @@ -228,6 +228,29 @@ int hsmp_send_message(struct hsmp_message *msg)
>  }
>  EXPORT_SYMBOL_NS_GPL(hsmp_send_message, "AMD_HSMP");
>  
> +int hsmp_msg_get_nargs(u16 sock_ind, u32 msg_id, u32 *data, u8 num_args)
> +{
> +	struct hsmp_message msg = { 0 };

{} is enough to initialize.

> +	unsigned int i;
> +	int ret;
> +
> +	if (!data)
> +		return -EINVAL;
> +	msg.msg_id = msg_id;
> +	msg.sock_ind = sock_ind;
> +	msg.response_sz = num_args;
> +
> +	ret = hsmp_send_message(&msg);
> +	if (ret)
> +		return ret;
> +
> +	for (i = 0; i < num_args; i++)
> +		data[i] = msg.args[i];
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_NS_GPL(hsmp_msg_get_nargs, "AMD_HSMP");
> +
>  int hsmp_test(u16 sock_ind, u32 value)
>  {
>  	struct hsmp_message msg = { 0 };
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
> index 02eeebfcb165..027db8e1de12 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
> @@ -69,4 +69,5 @@ int hsmp_create_sensor(struct device *dev, u16 sock_ind);
>  #else
>  int hsmp_create_sensor(struct device *dev, u16 sock_ind) { return 0; }
>  #endif
> +int hsmp_msg_get_nargs(u16 sock_ind, u32 msg_id, u32 *data, u8 num_args);
>  #endif /* HSMP_H */
> 

-- 
 i.


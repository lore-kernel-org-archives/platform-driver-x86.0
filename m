Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5808D267F59
	for <platform-driver-x86@vger.kernel.org>; Tue, 19 Aug 2025 11:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755603771; cv=none; b=OhDf1i504FBKgUgEpvq7k5T7ux1iQawt+B323zuqEGeJNmjCiVeN2AD1VBzlO98LLQhyeQsXG7H1Q5jYCetsCzjWm80Wy8cgsLE89ESoLBtSZkIDQkRI0O2AH2PWCLFtoYX94lRGTsJ5/qev1kIiczIXVaH/MhCRrTHdS7GJjio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755603771; c=relaxed/simple;
	bh=SFnv4iuXe66C4KeoY+q2kTyesKYW+VGFJ5y8xfYhBCo=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=mRdqwPVS/GROccNDoGE2lLxF15PMrCkadT11v0aFQqQgeBz1Q3p6TOk6qTJw3Zcxmhbglq3yWL2uLegWOy7vj9OEUymYIkYecqb1Vl6TV6q7XwP0FYOUJdr3IrzoMt3pbiFXYP3QWfIlmD0sx/miFUHPxjSI5irnaXhmq5MXZfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FMHIt48l; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FMHIt48l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755603769; x=1787139769;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=SFnv4iuXe66C4KeoY+q2kTyesKYW+VGFJ5y8xfYhBCo=;
  b=FMHIt48lpC9HvNh6Z3CzLga9uFbcktJffbbYMV4XHBd+S75yJEhcwis4
   HjvgYNtUqpc5gC+Epb9ANqVLvqa0bj/VQzNLr6Q2/mFHYS1h/XfQWTZKZ
   G4dOz7IttjrC5pLJEITPeh34Qs5uz7HIYhbB/wW+baRZRxnq9RHemAei5
   d1IyvI0dA80t4e03OYPxONEkx+42aJ/+zK0ifDI4ceELVq1jRkG65kIJ9
   GERoxqXTjBB+sFWP8Q7oE1+Ss8bnimHpWx2w+YpP9WdhK956ZY+IyqFC5
   8h1gFGmVO5eVlDq6LgMlIhsY27hLGhkMBBsaGrbYHX1RjaWWe/T3SRljG
   w==;
X-CSE-ConnectionGUID: 95cv5Y+ASBGlbioncCP5Zg==
X-CSE-MsgGUID: T3fwNBRlT6mVFXpFHPPEkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="68447284"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="68447284"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 04:42:48 -0700
X-CSE-ConnectionGUID: RPhwkQr6TymyO8w4Z5hg/Q==
X-CSE-MsgGUID: +ZmGL+QbRtCJcTMrMHcE8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="204975516"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.120])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 04:42:46 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 19 Aug 2025 14:42:42 +0300 (EEST)
To: Suma Hegde <suma.hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Subject: Re: [PATCH 2/2] platform/x86/amd/hsmp: plat: Add sysfs files to
 display HSMP telemetry
In-Reply-To: <20250806063804.693481-3-suma.hegde@amd.com>
Message-ID: <d120136c-ffbe-2a58-0776-388a0e8aaa6c@linux.intel.com>
References: <20250806063804.693481-1-suma.hegde@amd.com> <20250806063804.693481-3-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 6 Aug 2025, Suma Hegde wrote:

> This patch adds sysfs files to platform device based driver.
> 
> Following sysfs files are added similar to those in the ACPI based driver.
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
>  Documentation/arch/x86/amd_hsmp.rst   |   4 +-
>  drivers/platform/x86/amd/hsmp/acpi.c  |  33 +--
>  drivers/platform/x86/amd/hsmp/plat.c  | 388 +++++++++++++++++++++++++-
>  drivers/platform/x86/amd/hsmp/sysfs.h |  48 ++++
>  4 files changed, 433 insertions(+), 40 deletions(-)
>  create mode 100644 drivers/platform/x86/amd/hsmp/sysfs.h
> 
> diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
> index a094f55c10b0..6dd9948d8c21 100644
> --- a/Documentation/arch/x86/amd_hsmp.rst
> +++ b/Documentation/arch/x86/amd_hsmp.rst
> @@ -73,7 +73,9 @@ The same is defined in the amd_hsmp.h header.
>  
>  2. HSMP telemetry sysfs files
>  
> -Following sysfs files are available at /sys/devices/platform/AMDI0097:0X/.
> +Following sysfs files are available at /sys/devices/platform/AMDI0097:0X/ for
> +ACPI based driver and /sys/devices/platform/amd_hsmp/socketX/ for platform
> +device based driver.
>  
>  * c0_residency_input: Percentage of cores in C0 state.
>  * prochot_status: Reports 1 if the processor is at thermal threshold value,
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
> index 19f0ca7958b6..f6434cf07f6b 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -13,12 +13,12 @@
>  
>  #include <linux/acpi.h>
>  #include <linux/array_size.h>
> -#include <linux/bits.h>
>  #include <linux/bitfield.h>
>  #include <linux/device.h>
>  #include <linux/dev_printk.h>
>  #include <linux/ioport.h>
>  #include <linux/kstrtox.h>
> +#include <linux/limits.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/sysfs.h>
> @@ -29,6 +29,7 @@
>  #include <asm/amd/node.h>
>  
>  #include "hsmp.h"
> +#include "sysfs.h"
>  
>  #define DRIVER_NAME		"hsmp_acpi"
>  
> @@ -39,11 +40,6 @@
>  
>  static struct hsmp_plat_device *hsmp_pdev;
>  
> -struct hsmp_sys_attr {
> -	struct device_attribute dattr;
> -	u32 msg_id;
> -};
> -
>  static int amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
>  			      u32 *value, bool write)
>  {
> @@ -257,8 +253,6 @@ static umode_t hsmp_is_sock_dev_attr_visible(struct kobject *kobj,
>  	return attr->mode;
>  }
>  
> -#define to_hsmp_sys_attr(_attr) container_of(_attr, struct hsmp_sys_attr, dattr)
> -
>  static ssize_t hsmp_msg_resp32_show(struct device *dev, struct device_attribute *attr,
>  				    char *buf)
>  {
> @@ -274,17 +268,6 @@ static ssize_t hsmp_msg_resp32_show(struct device *dev, struct device_attribute
>  	return sysfs_emit(buf, "%u\n", data);
>  }
>  
> -#define DDR_MAX_BW_MASK		GENMASK(31, 20)
> -#define DDR_UTIL_BW_MASK	GENMASK(19, 8)
> -#define DDR_UTIL_BW_PERC_MASK	GENMASK(7, 0)
> -#define FW_VER_MAJOR_MASK	GENMASK(23, 16)
> -#define FW_VER_MINOR_MASK	GENMASK(15, 8)
> -#define FW_VER_DEBUG_MASK	GENMASK(7, 0)
> -#define FMAX_MASK		GENMASK(31, 16)
> -#define FMIN_MASK		GENMASK(15, 0)
> -#define FREQ_LIMIT_MASK		GENMASK(31, 16)
> -#define FREQ_SRC_IND_MASK	GENMASK(15, 0)
> -
>  static ssize_t hsmp_ddr_max_bw_show(struct device *dev, struct device_attribute *attr,
>  				    char *buf)
>  {
> @@ -423,17 +406,6 @@ static ssize_t hsmp_freq_limit_show(struct device *dev, struct device_attribute
>  	return sysfs_emit(buf, "%lu\n", FIELD_GET(FREQ_LIMIT_MASK, data));
>  }
>  
> -static const char * const freqlimit_srcnames[] = {
> -	"cHTC-Active",
> -	"PROCHOT",
> -	"TDC limit",
> -	"PPT Limit",
> -	"OPN Max",
> -	"Reliability Limit",
> -	"APML Agent",
> -	"HSMP Agent",
> -};

Please put these moves into own patch.

>  static ssize_t hsmp_freq_limit_source_show(struct device *dev, struct device_attribute *attr,
>  					   char *buf)
>  {
> @@ -521,6 +493,7 @@ static const struct bin_attribute *hsmp_attr_list[] = {
>  #define HSMP_DEV_ATTR(_name, _msg_id, _show, _mode)	\
>  static struct hsmp_sys_attr hattr_##_name = {		\
>  	.dattr = __ATTR(_name, _mode, _show, NULL),	\
> +	.sock_ind = U16_MAX,				\
>  	.msg_id = _msg_id,				\
>  }
>  
> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
> index 10e8f98ea12c..3a0171ee4a80 100644
> --- a/drivers/platform/x86/amd/hsmp/plat.c
> +++ b/drivers/platform/x86/amd/hsmp/plat.c
> @@ -12,7 +12,9 @@
>  #include <asm/amd/hsmp.h>
>  
>  #include <linux/acpi.h>
> +#include <linux/bitfield.h>
>  #include <linux/build_bug.h>
> +#include <linux/container_of.h>
>  #include <linux/device.h>
>  #include <linux/dev_printk.h>
>  #include <linux/kconfig.h>
> @@ -24,6 +26,7 @@
>  #include <asm/amd/node.h>
>  
>  #include "hsmp.h"
> +#include "sysfs.h"
>  
>  #define DRIVER_NAME		"amd_hsmp"
>  
> @@ -78,6 +81,186 @@ static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
>  	return 0;
>  }
>  
> +static umode_t hsmp_is_sock_dev_attr_visible(struct kobject *kobj,
> +					     struct attribute *attr, int id)
> +{
> +	struct device_attribute *dattr = container_of(attr, struct device_attribute, attr);
> +	struct hsmp_sys_attr *hattr = container_of(dattr, struct hsmp_sys_attr, dattr);
> +
> +	if (id == 0 && hattr->sock_ind >= hsmp_pdev->num_sockets)
> +		return SYSFS_GROUP_INVISIBLE;
> +
> +	return attr->mode;
> +}
> +
> +static ssize_t hsmp_msg_resp32_show(struct device *dev, struct device_attribute *attr,
> +				    char *buf)
> +{
> +	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> +	u32 data;
> +	int ret;
> +
> +	ret = hsmp_msg_get_nargs(hattr->sock_ind, hattr->msg_id, &data, 1);
> +	if (ret)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%u\n", data);
> +}
> +
> +static ssize_t hsmp_ddr_max_bw_show(struct device *dev, struct device_attribute *attr,
> +				    char *buf)
> +{
> +	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> +	u32 data;
> +	int ret;
> +
> +	ret = hsmp_msg_get_nargs(hattr->sock_ind, hattr->msg_id, &data, 1);
> +	if (ret)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%lu\n", FIELD_GET(DDR_MAX_BW_MASK, data));
> +}
> +
> +static ssize_t hsmp_ddr_util_bw_show(struct device *dev, struct device_attribute *attr,
> +				     char *buf)
> +{
> +	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> +	u32 data;
> +	int ret;
> +
> +	ret = hsmp_msg_get_nargs(hattr->sock_ind, hattr->msg_id, &data, 1);
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
> +	u32 data;
> +	int ret;
> +
> +	ret = hsmp_msg_get_nargs(hattr->sock_ind, hattr->msg_id, &data, 1);
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
> +	u32 data;
> +	int ret;
> +
> +	ret = hsmp_msg_get_nargs(hattr->sock_ind, hattr->msg_id, &data, 1);
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
> +	u32 data[2];
> +	int ret;
> +
> +	ret = hsmp_msg_get_nargs(hattr->sock_ind, hattr->msg_id, data, 2);
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
> +	u32 data[2];
> +	int ret;
> +
> +	ret = hsmp_msg_get_nargs(hattr->sock_ind, hattr->msg_id, data, 2);
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
> +	u32 data;
> +	int ret;
> +
> +	ret = hsmp_msg_get_nargs(hattr->sock_ind, hattr->msg_id, &data, 1);
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
> +	u32 data;
> +	int ret;
> +
> +	ret = hsmp_msg_get_nargs(hattr->sock_ind, hattr->msg_id, &data, 1);
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
> +	u32 data;
> +	int ret;
> +
> +	ret = hsmp_msg_get_nargs(hattr->sock_ind, hattr->msg_id, &data, 1);
> +	if (ret)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%lu\n", FIELD_GET(FREQ_LIMIT_MASK, data));
> +}
> +
> +static ssize_t hsmp_freq_limit_source_show(struct device *dev, struct device_attribute *attr,
> +					   char *buf)
> +{
> +	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> +	unsigned int index;
> +	int len = 0;
> +	u16 src_ind;
> +	u32 data;
> +	int ret;
> +
> +	ret = hsmp_msg_get_nargs(hattr->sock_ind, hattr->msg_id, &data, 1);
> +	if (ret)
> +		return ret;
> +
> +	src_ind = FIELD_GET(FREQ_SRC_IND_MASK, data);
> +	for (index = 0; index < ARRAY_SIZE(freqlimit_srcnames); index++) {
> +		if (!src_ind)
> +			break;
> +		if (src_ind & 1)
> +			len += sysfs_emit_at(buf, len, "%s\n", freqlimit_srcnames[index]);
> +		src_ind >>= 1;
> +	}
> +	return len;
> +}
> +
>  /*
>   * AMD supports maximum of 8 sockets in a system.
>   * Static array of 8 + 1(for NULL) elements is created below
> @@ -110,21 +293,208 @@ HSMP_BIN_ATTR(5, *sock5_attr_list);
>  HSMP_BIN_ATTR(6, *sock6_attr_list);
>  HSMP_BIN_ATTR(7, *sock7_attr_list);
>  
> -#define HSMP_ATTR_GRP(index, _list, _name)			\
> +#define HSMP_ATTR_GRP(index, _list, _name, _dlist)		\
>  static const struct attribute_group sock##index##_attr_grp = {	\
>  	.bin_attrs_new = _list,					\
> +	.attrs = _dlist,					\
>  	.is_bin_visible = hsmp_is_sock_attr_visible,		\
> +	.is_visible = hsmp_is_sock_dev_attr_visible,		\

Please describe the change properly on the general level in the changelog 
as the necessity of these additional members are not obvious from the very 
terse wording of the changelog.

>  	.name = #_name,						\
>  }
>  
> -HSMP_ATTR_GRP(0, sock0_attr_list, socket0);
> -HSMP_ATTR_GRP(1, sock1_attr_list, socket1);
> -HSMP_ATTR_GRP(2, sock2_attr_list, socket2);
> -HSMP_ATTR_GRP(3, sock3_attr_list, socket3);
> -HSMP_ATTR_GRP(4, sock4_attr_list, socket4);
> -HSMP_ATTR_GRP(5, sock5_attr_list, socket5);
> -HSMP_ATTR_GRP(6, sock6_attr_list, socket6);
> -HSMP_ATTR_GRP(7, sock7_attr_list, socket7);
> +#define HSMP_DEV_ATTR(_name, _msg_id, _show, _mode, _sock_ind)	\
> +static struct hsmp_sys_attr hattr_##_name##_sock_ind = {	\
> +	.dattr = __ATTR(_name, _mode, _show, NULL),		\
> +	.sock_ind = _sock_ind,					\
> +	.msg_id = _msg_id,					\
> +}
> +
> +HSMP_DEV_ATTR(c0_residency_input, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444, 0);
> +HSMP_DEV_ATTR(c0_residency_input, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444, 1);
> +HSMP_DEV_ATTR(c0_residency_input, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444, 2);
> +HSMP_DEV_ATTR(c0_residency_input, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444, 3);
> +HSMP_DEV_ATTR(c0_residency_input, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444, 4);
> +HSMP_DEV_ATTR(c0_residency_input, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444, 5);
> +HSMP_DEV_ATTR(c0_residency_input, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444, 6);
> +HSMP_DEV_ATTR(c0_residency_input, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444, 7);
> +
> +HSMP_DEV_ATTR(smu_fw_version, HSMP_GET_SMU_VER, hsmp_msg_fw_ver_show, 0444, 0);
> +HSMP_DEV_ATTR(smu_fw_version, HSMP_GET_SMU_VER, hsmp_msg_fw_ver_show, 0444, 1);
> +HSMP_DEV_ATTR(smu_fw_version, HSMP_GET_SMU_VER, hsmp_msg_fw_ver_show, 0444, 2);
> +HSMP_DEV_ATTR(smu_fw_version, HSMP_GET_SMU_VER, hsmp_msg_fw_ver_show, 0444, 3);
> +HSMP_DEV_ATTR(smu_fw_version, HSMP_GET_SMU_VER, hsmp_msg_fw_ver_show, 0444, 4);
> +HSMP_DEV_ATTR(smu_fw_version, HSMP_GET_SMU_VER, hsmp_msg_fw_ver_show, 0444, 5);
> +HSMP_DEV_ATTR(smu_fw_version, HSMP_GET_SMU_VER, hsmp_msg_fw_ver_show, 0444, 6);
> +HSMP_DEV_ATTR(smu_fw_version, HSMP_GET_SMU_VER, hsmp_msg_fw_ver_show, 0444, 7);
> +
> +HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_show, 0444, 0);
> +HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_show, 0444, 1);
> +HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_show, 0444, 2);
> +HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_show, 0444, 3);
> +HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_show, 0444, 4);
> +HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_show, 0444, 5);
> +HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_show, 0444, 6);
> +HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_show, 0444, 7);
> +
> +HSMP_DEV_ATTR(prochot_status, HSMP_GET_PROC_HOT, hsmp_msg_resp32_show, 0444, 0);
> +HSMP_DEV_ATTR(prochot_status, HSMP_GET_PROC_HOT, hsmp_msg_resp32_show, 0444, 1);
> +HSMP_DEV_ATTR(prochot_status, HSMP_GET_PROC_HOT, hsmp_msg_resp32_show, 0444, 2);
> +HSMP_DEV_ATTR(prochot_status, HSMP_GET_PROC_HOT, hsmp_msg_resp32_show, 0444, 3);
> +HSMP_DEV_ATTR(prochot_status, HSMP_GET_PROC_HOT, hsmp_msg_resp32_show, 0444, 4);
> +HSMP_DEV_ATTR(prochot_status, HSMP_GET_PROC_HOT, hsmp_msg_resp32_show, 0444, 5);
> +HSMP_DEV_ATTR(prochot_status, HSMP_GET_PROC_HOT, hsmp_msg_resp32_show, 0444, 6);
> +HSMP_DEV_ATTR(prochot_status, HSMP_GET_PROC_HOT, hsmp_msg_resp32_show, 0444, 7);
> +
> +HSMP_DEV_ATTR(ddr_max_bw, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_max_bw_show, 0444, 0);
> +HSMP_DEV_ATTR(ddr_max_bw, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_max_bw_show, 0444, 1);
> +HSMP_DEV_ATTR(ddr_max_bw, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_max_bw_show, 0444, 2);
> +HSMP_DEV_ATTR(ddr_max_bw, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_max_bw_show, 0444, 3);
> +HSMP_DEV_ATTR(ddr_max_bw, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_max_bw_show, 0444, 4);
> +HSMP_DEV_ATTR(ddr_max_bw, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_max_bw_show, 0444, 5);
> +HSMP_DEV_ATTR(ddr_max_bw, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_max_bw_show, 0444, 6);
> +HSMP_DEV_ATTR(ddr_max_bw, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_max_bw_show, 0444, 7);
> +
> +HSMP_DEV_ATTR(ddr_utilised_bw_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444, 0);
> +HSMP_DEV_ATTR(ddr_utilised_bw_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444, 1);
> +HSMP_DEV_ATTR(ddr_utilised_bw_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444, 2);
> +HSMP_DEV_ATTR(ddr_utilised_bw_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444, 3);
> +HSMP_DEV_ATTR(ddr_utilised_bw_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444, 4);
> +HSMP_DEV_ATTR(ddr_utilised_bw_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444, 5);
> +HSMP_DEV_ATTR(ddr_utilised_bw_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444, 6);
> +HSMP_DEV_ATTR(ddr_utilised_bw_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444, 7);
> +
> +HSMP_DEV_ATTR(ddr_utilised_bw_perc_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_perc_show,
> +	      0444, 0);
> +HSMP_DEV_ATTR(ddr_utilised_bw_perc_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_perc_show,
> +	      0444, 1);
> +HSMP_DEV_ATTR(ddr_utilised_bw_perc_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_perc_show,
> +	      0444, 2);
> +HSMP_DEV_ATTR(ddr_utilised_bw_perc_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_perc_show,
> +	      0444, 3);
> +HSMP_DEV_ATTR(ddr_utilised_bw_perc_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_perc_show,
> +	      0444, 4);
> +HSMP_DEV_ATTR(ddr_utilised_bw_perc_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_perc_show,
> +	      0444, 5);
> +HSMP_DEV_ATTR(ddr_utilised_bw_perc_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_perc_show,
> +	      0444, 6);
> +HSMP_DEV_ATTR(ddr_utilised_bw_perc_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_perc_show,
> +	      0444, 7);
> +
> +HSMP_DEV_ATTR(cclk_freq_limit_input, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444, 0);
> +HSMP_DEV_ATTR(cclk_freq_limit_input, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444, 1);
> +HSMP_DEV_ATTR(cclk_freq_limit_input, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444, 2);
> +HSMP_DEV_ATTR(cclk_freq_limit_input, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444, 3);
> +HSMP_DEV_ATTR(cclk_freq_limit_input, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444, 4);
> +HSMP_DEV_ATTR(cclk_freq_limit_input, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444, 5);
> +HSMP_DEV_ATTR(cclk_freq_limit_input, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444, 6);
> +HSMP_DEV_ATTR(cclk_freq_limit_input, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444, 7);
> +
> +HSMP_DEV_ATTR(fclk_input, HSMP_GET_FCLK_MCLK, hsmp_fclk_show, 0444, 0);
> +HSMP_DEV_ATTR(fclk_input, HSMP_GET_FCLK_MCLK, hsmp_fclk_show, 0444, 1);
> +HSMP_DEV_ATTR(fclk_input, HSMP_GET_FCLK_MCLK, hsmp_fclk_show, 0444, 2);
> +HSMP_DEV_ATTR(fclk_input, HSMP_GET_FCLK_MCLK, hsmp_fclk_show, 0444, 3);
> +HSMP_DEV_ATTR(fclk_input, HSMP_GET_FCLK_MCLK, hsmp_fclk_show, 0444, 4);
> +HSMP_DEV_ATTR(fclk_input, HSMP_GET_FCLK_MCLK, hsmp_fclk_show, 0444, 5);
> +HSMP_DEV_ATTR(fclk_input, HSMP_GET_FCLK_MCLK, hsmp_fclk_show, 0444, 6);
> +HSMP_DEV_ATTR(fclk_input, HSMP_GET_FCLK_MCLK, hsmp_fclk_show, 0444, 7);
> +
> +HSMP_DEV_ATTR(mclk_input, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444, 0);
> +HSMP_DEV_ATTR(mclk_input, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444, 1);
> +HSMP_DEV_ATTR(mclk_input, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444, 2);
> +HSMP_DEV_ATTR(mclk_input, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444, 3);
> +HSMP_DEV_ATTR(mclk_input, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444, 4);
> +HSMP_DEV_ATTR(mclk_input, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444, 5);
> +HSMP_DEV_ATTR(mclk_input, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444, 6);
> +HSMP_DEV_ATTR(mclk_input, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444, 7);
> +
> +HSMP_DEV_ATTR(clk_fmax, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmax_show, 0444, 0);
> +HSMP_DEV_ATTR(clk_fmax, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmax_show, 0444, 1);
> +HSMP_DEV_ATTR(clk_fmax, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmax_show, 0444, 2);
> +HSMP_DEV_ATTR(clk_fmax, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmax_show, 0444, 3);
> +HSMP_DEV_ATTR(clk_fmax, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmax_show, 0444, 4);
> +HSMP_DEV_ATTR(clk_fmax, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmax_show, 0444, 5);
> +HSMP_DEV_ATTR(clk_fmax, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmax_show, 0444, 6);
> +HSMP_DEV_ATTR(clk_fmax, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmax_show, 0444, 7);
> +
> +HSMP_DEV_ATTR(clk_fmin, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmin_show, 0444, 0);
> +HSMP_DEV_ATTR(clk_fmin, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmin_show, 0444, 1);
> +HSMP_DEV_ATTR(clk_fmin, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmin_show, 0444, 2);
> +HSMP_DEV_ATTR(clk_fmin, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmin_show, 0444, 3);
> +HSMP_DEV_ATTR(clk_fmin, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmin_show, 0444, 4);
> +HSMP_DEV_ATTR(clk_fmin, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmin_show, 0444, 5);
> +HSMP_DEV_ATTR(clk_fmin, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmin_show, 0444, 6);
> +HSMP_DEV_ATTR(clk_fmin, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmin_show, 0444, 7);
> +
> +HSMP_DEV_ATTR(pwr_current_active_freq_limit, HSMP_GET_SOCKET_FREQ_LIMIT, hsmp_freq_limit_show,
> +	      0444, 0);
> +HSMP_DEV_ATTR(pwr_current_active_freq_limit, HSMP_GET_SOCKET_FREQ_LIMIT, hsmp_freq_limit_show,
> +	      0444, 1);
> +HSMP_DEV_ATTR(pwr_current_active_freq_limit, HSMP_GET_SOCKET_FREQ_LIMIT, hsmp_freq_limit_show,
> +	      0444, 2);
> +HSMP_DEV_ATTR(pwr_current_active_freq_limit, HSMP_GET_SOCKET_FREQ_LIMIT, hsmp_freq_limit_show,
> +	      0444, 3);
> +HSMP_DEV_ATTR(pwr_current_active_freq_limit, HSMP_GET_SOCKET_FREQ_LIMIT, hsmp_freq_limit_show,
> +	      0444, 4);
> +HSMP_DEV_ATTR(pwr_current_active_freq_limit, HSMP_GET_SOCKET_FREQ_LIMIT, hsmp_freq_limit_show,
> +	      0444, 5);
> +HSMP_DEV_ATTR(pwr_current_active_freq_limit, HSMP_GET_SOCKET_FREQ_LIMIT, hsmp_freq_limit_show,
> +	      0444, 6);
> +HSMP_DEV_ATTR(pwr_current_active_freq_limit, HSMP_GET_SOCKET_FREQ_LIMIT, hsmp_freq_limit_show,
> +	      0444, 7);
> +
> +HSMP_DEV_ATTR(pwr_current_active_freq_limit_source, HSMP_GET_SOCKET_FREQ_LIMIT,
> +	      hsmp_freq_limit_source_show, 0444, 0);
> +HSMP_DEV_ATTR(pwr_current_active_freq_limit_source, HSMP_GET_SOCKET_FREQ_LIMIT,
> +	      hsmp_freq_limit_source_show, 0444, 1);
> +HSMP_DEV_ATTR(pwr_current_active_freq_limit_source, HSMP_GET_SOCKET_FREQ_LIMIT,
> +	      hsmp_freq_limit_source_show, 0444, 2);
> +HSMP_DEV_ATTR(pwr_current_active_freq_limit_source, HSMP_GET_SOCKET_FREQ_LIMIT,
> +	      hsmp_freq_limit_source_show, 0444, 3);
> +HSMP_DEV_ATTR(pwr_current_active_freq_limit_source, HSMP_GET_SOCKET_FREQ_LIMIT,
> +	      hsmp_freq_limit_source_show, 0444, 4);
> +HSMP_DEV_ATTR(pwr_current_active_freq_limit_source, HSMP_GET_SOCKET_FREQ_LIMIT,
> +	      hsmp_freq_limit_source_show, 0444, 5);
> +HSMP_DEV_ATTR(pwr_current_active_freq_limit_source, HSMP_GET_SOCKET_FREQ_LIMIT,
> +	      hsmp_freq_limit_source_show, 0444, 6);
> +HSMP_DEV_ATTR(pwr_current_active_freq_limit_source, HSMP_GET_SOCKET_FREQ_LIMIT,
> +	      hsmp_freq_limit_source_show, 0444, 7);

Any reason why you chose this way over having all those done by a macro 
for values 0-7?

> +#define HSMP_DEV_ATTR_LIST(_name, _sock_ind)					\
> +static struct attribute _name[] = {						\
> +	&hattr_c0_residency_input##_sock_ind.dattr.attr,			\
> +	&hattr_prochot_status##_sock_ind.dattr.attr,				\
> +	&hattr_smu_fw_version##_sock_ind.dattr.attr,				\
> +	&hattr_protocol_version##_sock_ind.dattr.attr,				\
> +	&hattr_cclk_freq_limit_input##_sock_ind.dattr.attr,			\
> +	&hattr_ddr_max_bw##_sock_ind.dattr.attr,				\
> +	&hattr_ddr_utilised_bw_input##_sock_ind.dattr.attr,			\
> +	&hattr_ddr_utilised_bw_perc_input##_sock_ind.dattr.attr,		\
> +	&hattr_fclk_input##_sock_ind.dattr.attr,				\
> +	&hattr_mclk_input##_sock_ind.dattr.attr,				\
> +	&hattr_clk_fmax##_sock_ind.dattr.attr,					\
> +	&hattr_clk_fmin##_sock_ind.dattr.attr,					\
> +	&hattr_pwr_current_active_freq_limit##_sock_ind.dattr.attr,		\
> +	&hattr_pwr_current_active_freq_limit_source##_sock_ind.dattr.attr,	\
> +	NULL									\
> +}
> +
> +HSMP_DEV_ATTR_LIST(*sock0_dev_attr_list, 0);
> +HSMP_DEV_ATTR_LIST(*sock1_dev_attr_list, 1);
> +HSMP_DEV_ATTR_LIST(*sock2_dev_attr_list, 2);
> +HSMP_DEV_ATTR_LIST(*sock3_dev_attr_list, 3);
> +HSMP_DEV_ATTR_LIST(*sock4_dev_attr_list, 4);
> +HSMP_DEV_ATTR_LIST(*sock5_dev_attr_list, 5);
> +HSMP_DEV_ATTR_LIST(*sock6_dev_attr_list, 6);
> +HSMP_DEV_ATTR_LIST(*sock7_dev_attr_list, 7);
> +
> +HSMP_ATTR_GRP(0, sock0_attr_list, socket0, sock0_dev_attr_list);
> +HSMP_ATTR_GRP(1, sock1_attr_list, socket1, sock1_dev_attr_list);
> +HSMP_ATTR_GRP(2, sock2_attr_list, socket2, sock2_dev_attr_list);
> +HSMP_ATTR_GRP(3, sock3_attr_list, socket3, sock3_dev_attr_list);
> +HSMP_ATTR_GRP(4, sock4_attr_list, socket4, sock4_dev_attr_list);
> +HSMP_ATTR_GRP(5, sock5_attr_list, socket5, sock5_dev_attr_list);
> +HSMP_ATTR_GRP(6, sock6_attr_list, socket6, sock6_dev_attr_list);
> +HSMP_ATTR_GRP(7, sock7_attr_list, socket7, sock7_dev_attr_list);
>  
>  static const struct attribute_group *hsmp_groups[] = {
>  	&sock0_attr_grp,
> diff --git a/drivers/platform/x86/amd/hsmp/sysfs.h b/drivers/platform/x86/amd/hsmp/sysfs.h
> new file mode 100644
> index 000000000000..c4cd7e71e404
> --- /dev/null
> +++ b/drivers/platform/x86/amd/hsmp/sysfs.h
> @@ -0,0 +1,48 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * AMD HSMP Platform Driver
> + * Copyright (c) 2025, AMD.
> + * All Rights Reserved.
> + *
> + * Header file for HSMP sysfs interface
> + */
> +
> +#ifndef HSMP_SYSFS_H
> +#define HSMP_SYSFS_H
> +
> +#include <linux/bits.h>
> +#include <linux/container_of.h>
> +#include <linux/device.h>
> +#include <linux/types.h>
> +
> +struct hsmp_sys_attr {
> +	struct device_attribute dattr;
> +	u16 sock_ind;
> +	u32 msg_id;
> +};
> +
> +static char * const freqlimit_srcnames[] = {

Please don't put this into a header as it's duplicated to all compilation 
units.

Where one const went?

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
> +#define to_hsmp_sys_attr(_dev_attr) \
> +	container_of(_dev_attr, struct hsmp_sys_attr, dattr)
> +#endif /* HSMP_SYSFS_H */
> 

-- 
 i.


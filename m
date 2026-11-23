Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795434701;
	b=s3hByFSUbm1TxYnL+GklA2l5sSH97GFE+QCUKXqOd2sPC813rm608eCj7RIC+rqtyuH+
	 CovtNmi+5n+cBXeW8rXfSAGvuiLUlWhYsRx24El7DNkvfvhZ9ksqbmHbbcqu8m3Dn0Y3c
	 ai9CQFNyQEXvYkZ5c54jAVLZQz0o/BQeUWc1oTbpcQpuyWBuYcmwvyZoMB5tjwow/0fAm
	 M7+AuSUkpZdsJ6prvt+vAx3pucafHC0JRjyuEYkwfOvAoVprs7Msp+2v5eMY/1MiagbOU
	 Wnc+0oC10/PkS9yIz10FuL7askPyyvKqwDiLKVdHPkTChnCTAMtH5zY59OvKxENElBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795434701;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=GT2tVqF2pV1CNd37S0KZFYkoq6Fv709f5lsuql0CFDY=;
	b=klLj8eeQ7U4yzqXF93du8l4M0mxhVmg+8MD2kBEMz4AstVKmH6tCUx5dnv+Rx+A+5rj3
	 vn74jJbiA+xKxlPwL7XWwXIEr+jKaeEXGMl8paBd8ECEMN/85/yvkJzicorMpy6TYMB3k
	 ptx3QySiExRmyr4Biz5gngWc5dm8P8BXH1jp5HIBHWzFbvtt8UixB/11qMrIj6C47AOHI
	 PA3TSA4cZQUrBr5sJKiPfd9ECHnSvJ3jSKrFITzzMpp26HDxvFC/wrZn12oqAS8Fwgegm
	 NxXPsNbF7qgrxG0by5UiALWrCHiFwjmva5bDmQDvp793DSi7zWi47YyzF6+RV272Kaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SACyXW0C;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B72606A31F
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Nov 2026 11:51:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40B72606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SACyXW0C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795434702; x=1826970702;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=FENqnG0qnw5YCzlLfyR3M25zmRh8+sbE3nBqOaRbXj4=;
  b=SACyXW0CMPqAM4/2xiKhQ+vJd/GTLLR+qh5ayY8aLJMd4sCeO8EljMBw
   mVCl/mhLhESi7RqEBbg8rY0WX2d8XBqfR2DekiFoA+4rupvNwhQmj6UrO
   R8/kb5TbRDXp8JF5zqg3fAosj311SfKpqbPAKMXYq0P2TrZYPlnF9z7IV
   GKQ2wCkotR/GIBCwpMT1I7j8YECmRkbAQf/9rMsgbtKznivoHQflVAVDT
   QKyjzx+lHlMCWkEhfnBjKlBD4qnmHVItqf1qjBYpYx4qXgXBFJmT4p3oX
   p6CGrQVKh74CUiFoJ6/kdsEP11XdJKfl7exSaKIAXSlTjOfeEpvD5zoEz
   A==;
X-CSE-ConnectionGUID: TzbEz4z8T9Oy1NZ9IIFWgg==
X-CSE-MsgGUID: Dn34BQqNQIuzrtRo+JPMjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4289876"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4289876"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 03:51:41 -0800
X-CSE-ConnectionGUID: iYCVJ5eQRBmLjryrsjHyLA==
X-CSE-MsgGUID: EetIYYHzRN6AEdLn1ip2ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="13266395"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.225])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 03:51:39 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 23 Nov 2026 13:51:35 +0200 (EET)
To: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
cc: platform-driver-x86@vger.kernel.org, Suma.Hegde@amd.com, 
    NaveenKrishna.Chatradhi@amd.com
Subject: Re: [PATCH 13/26] platform/x86/amd/hsmp: Add DIMM sideband sysfs
 files
In-Reply-To: <7f7961fb899d26005ce25bcc2a3e5af9885fbf07.1793602633.git.Muthusamy.Ramalingam@amd.com>
Message-ID: <aa3271d9-0e94-9e5a-1f89-8e6a400b9fc8@linux.intel.com>
References: <cover.1793602633.git.Muthusamy.Ramalingam@amd.com> <7f7961fb899d26005ce25bcc2a3e5af9885fbf07.1793602633.git.Muthusamy.Ramalingam@amd.com>
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

> Expose dimm_sb_get and dimm_sb_set on both drivers. dimm_sb_get issues
> HSMP_DIMM_SB_RD and caches the request and data. A read returns that
> request and its data. Both stores reject extra arguments. dimm_sb_set
> writes a register with HSMP_DIMM_SB_WR.
> 
> Co-developed-by: Suma Hegde <Suma.Hegde@amd.com>
> Signed-off-by: Suma Hegde <Suma.Hegde@amd.com>
> Signed-off-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
> ---
>  Documentation/arch/x86/amd_hsmp.rst   |  10 ++
>  drivers/platform/x86/amd/hsmp/acpi.c  |  11 +-
>  drivers/platform/x86/amd/hsmp/plat.c  |  11 +-
>  drivers/platform/x86/amd/hsmp/sysfs.c | 190 ++++++++++++++++++++++++++
>  drivers/platform/x86/amd/hsmp/sysfs.h |  11 ++
>  5 files changed, 231 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
> index 516e8391bfbd2..67f4c3b71f5e0 100644
> --- a/Documentation/arch/x86/amd_hsmp.rst
> +++ b/Documentation/arch/x86/amd_hsmp.rst
> @@ -145,6 +145,16 @@ write-only when the platform enables only that direction of the message.
>    aggregate, read, or write bandwidth. Probe keeps only the link and
>    type combinations firmware accepts. The directory is absent when
>    none respond.
> +* dimm_sb_get: Read/write DIMM sideband read. Write
> +  "<dimm_addr> <lid> <reg_offset> <reg_space>". Decimal and hexadecimal
> +  values are accepted, and extra arguments are rejected. dimm_addr is
> +  0-255, lid is 0-15, reg_offset is 0-2047, and reg_space is 0 or 1.
> +  A read returns the last request and its data as
> +  "0xAA 0xL 0xOFF S 0xDATA", or fails with -ENODATA until a read succeeds.
> +* dimm_sb_set: Write-only DIMM sideband write. Write
> +  "<dimm_addr> <lid> <reg_offset> <reg_space> <write_data>".
> +  write_data is 0-255. Extra arguments are rejected. Field ranges match
> +  dimm_sb_get.
>  * socket_power_limit_max: Maximum socket power limit in mWatts (read only).
>  * cclk_boost_limit: Socket boost limit in MHz (write only). Accepted range
>    is 100-10000 MHz.
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
> index d6bb8a849cca7..f2bd4d5369df5 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -358,8 +358,12 @@ static umode_t hsmp_is_sock_dev_attr_visible(struct kobject *kobj,
>  	if (readable && writable) {
>  		if (is_read_msg_enabled(sock, hattr->msg_id))
>  			mode_updated |= mode & 0444;
> -		if (is_write_msg_enabled(sock, hattr->wr_msg_id))
> +		if (hsmp_sysfs_write_follows_read(hattr)) {
> +			if (is_read_msg_enabled(sock, hattr->msg_id))
> +				mode_updated |= 0200;
> +		} else if (is_write_msg_enabled(sock, hattr->wr_msg_id)) {
>  			mode_updated |= 0200;
> +		}
>  		return mode_updated;
>  	}
>  
> @@ -550,6 +554,9 @@ HSMP_DEV_ATTR_W(gmi3_link_width, HSMP_SET_GMI3_WIDTH,
>  		hsmp_gmi3_link_width_store, 0200);
>  HSMP_DEV_ATTR_W(pcie_link_rate, HSMP_SET_PCI_RATE,
>  		hsmp_pcie_link_rate_store, 0200);
> +HSMP_DEV_ATTR_RW(dimm_sb_get, HSMP_DIMM_SB_RD, HSMP_DIMM_SB_RD,
> +		 hsmp_dimm_sb_get_show, hsmp_dimm_sb_get_store, 0644);
> +HSMP_DEV_ATTR_W(dimm_sb_set, HSMP_DIMM_SB_WR, hsmp_dimm_sb_set_store, 0200);
>  HSMP_DEV_ATTR_RW(lclk_0, HSMP_GET_NBIO_DPM_LEVEL, HSMP_SET_NBIO_DPM_LEVEL,
>  		 hsmp_lclk_0_show, hsmp_lclk_0_store, 0644);
>  HSMP_DEV_ATTR_RW(lclk_1, HSMP_GET_NBIO_DPM_LEVEL, HSMP_SET_NBIO_DPM_LEVEL,
> @@ -673,6 +680,8 @@ static struct attribute *hsmp_dev_attr_list[] = {
>  	&hattr_xgmi_width.dattr.attr,
>  	&hattr_gmi3_link_width.dattr.attr,
>  	&hattr_pcie_link_rate.dattr.attr,
> +	&hattr_dimm_sb_get.dattr.attr,
> +	&hattr_dimm_sb_set.dattr.attr,
>  	&hattr_socket_power.dattr.attr,
>  	&hattr_cclk_boost_limit.dattr.attr,
>  	&hattr_tdelta.dattr.attr,
> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
> index 3af94db6fd5b7..46676d9f90633 100644
> --- a/drivers/platform/x86/amd/hsmp/plat.c
> +++ b/drivers/platform/x86/amd/hsmp/plat.c
> @@ -124,8 +124,12 @@ static umode_t hsmp_is_sock_dev_attr_visible(struct kobject *kobj,
>  	if (readable && writable) {
>  		if (is_read_msg_enabled(sock, hattr->msg_id))
>  			mode_updated |= mode & 0444;
> -		if (is_write_msg_enabled(sock, hattr->wr_msg_id))
> +		if (hsmp_sysfs_write_follows_read(hattr)) {
> +			if (is_read_msg_enabled(sock, hattr->msg_id))
> +				mode_updated |= 0200;
> +		} else if (is_write_msg_enabled(sock, hattr->wr_msg_id)) {
>  			mode_updated |= 0200;
> +		}
>  		return mode_updated;
>  	}
>  
> @@ -385,6 +389,9 @@ HSMP_DEV_ATTR_W_X8(gmi3_link_width, HSMP_SET_GMI3_WIDTH,
>  		   hsmp_gmi3_link_width_store, 0200);
>  HSMP_DEV_ATTR_W_X8(pcie_link_rate, HSMP_SET_PCI_RATE,
>  		   hsmp_pcie_link_rate_store, 0200);
> +HSMP_DEV_ATTR_RW_X8(dimm_sb_get, HSMP_DIMM_SB_RD, HSMP_DIMM_SB_RD,
> +		    hsmp_dimm_sb_get_show, hsmp_dimm_sb_get_store, 0644);
> +HSMP_DEV_ATTR_W_X8(dimm_sb_set, HSMP_DIMM_SB_WR, hsmp_dimm_sb_set_store, 0200);
>  HSMP_DEV_ATTR_RW_X8(lclk_0, HSMP_GET_NBIO_DPM_LEVEL, HSMP_SET_NBIO_DPM_LEVEL,
>  		    hsmp_lclk_0_show, hsmp_lclk_0_store, 0644);
>  HSMP_DEV_ATTR_RW_X8(lclk_1, HSMP_GET_NBIO_DPM_LEVEL, HSMP_SET_NBIO_DPM_LEVEL,
> @@ -904,6 +911,8 @@ static struct attribute _name[] = {					       \
>  	&hattr_xgmi_width##_sock_ind.dattr.attr,			       \
>  	&hattr_gmi3_link_width##_sock_ind.dattr.attr,			       \
>  	&hattr_pcie_link_rate##_sock_ind.dattr.attr,			       \
> +	&hattr_dimm_sb_get##_sock_ind.dattr.attr,			       \
> +	&hattr_dimm_sb_set##_sock_ind.dattr.attr,			       \
>  	&hattr_socket_power##_sock_ind.dattr.attr,			       \
>  	&hattr_cclk_boost_limit##_sock_ind.dattr.attr,		       \
>  	&hattr_tdelta##_sock_ind.dattr.attr,				       \
> diff --git a/drivers/platform/x86/amd/hsmp/sysfs.c b/drivers/platform/x86/amd/hsmp/sysfs.c
> index 73010a889eaca..bcf1b802b3287 100644
> --- a/drivers/platform/x86/amd/hsmp/sysfs.c
> +++ b/drivers/platform/x86/amd/hsmp/sysfs.c
> @@ -7,6 +7,8 @@
>   * Common sysfs helpers shared by ACPI and platform HSMP drivers.
>   */
>  
> +#include <asm/amd/node.h>
> +
>  #include <linux/array_size.h>
>  #include <linux/bitfield.h>
>  #include <linux/bits.h>
> @@ -986,6 +988,14 @@ ssize_t hsmp_pcie_link_rate_store(struct device *dev,
>  	return count;
>  }
>  
> +bool hsmp_sysfs_write_follows_read(const struct hsmp_sys_attr *hattr)
> +{
> +	/*
> +	 * dimm_sb_get's store issues HSMP_DIMM_SB_RD, which is a GET, so
> +	 * the write bit follows the GET message bitmap.
> +	 */
> +	return hattr->msg_id == HSMP_DIMM_SB_RD;
> +}
>  
>  /* IO link bandwidth. priv is the io_bw attribute index. */
>  ssize_t hsmp_io_link_bw_show(struct device *dev, struct device_attribute *attr,
> @@ -1080,6 +1090,186 @@ umode_t hsmp_xgmi_bw_file_visible(const struct hsmp_socket *sock, int id)
>  	return (sock->xgmi_bw_valid & BIT_ULL(id)) ? 0444 : 0;
>  }
>  
> +struct dimm_sb_cfg {
> +	u8 addr;
> +	u8 lid;
> +	u16 reg_offset;
> +	u8 reg_space;
> +	u16 result;
> +	bool configured;
> +};
> +
> +static struct dimm_sb_cfg dimm_sb[MAX_AMD_NUM_NODES];
> +
> +static struct dimm_sb_cfg *dimm_sb_state(struct device *dev,
> +					 struct device_attribute *attr)
> +{
> +	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> +	u16 sock_ind = hsmp_sysfs_sock_ind(dev, hattr);
> +
> +	if (sock_ind >= MAX_AMD_NUM_NODES)
> +		return NULL;
> +
> +	return &dimm_sb[sock_ind];
> +}
> +
> +static int dimm_sb_parse(struct device *dev, const char *attr_name,
> +			 const char *buf, bool with_data, int *addr, int *lid,
> +			 int *off, int *space, int *data)
> +{
> +	u32 vals[5];
> +	int n = with_data ? 5 : 4;
> +	int ret;
> +	int got;
> +
> +	/* Accept decimal and 0x-prefixed hexadecimal. */
> +	ret = hsmp_parse_u32_args(buf, vals, n, 0, &got);
> +	if (ret) {
> +		if (with_data)
> +			hsmp_err(dev, attr_name, HSMP_ERR_ARGC,
> +				 "want=5 got=%d fmt=\"dimm_addr lid reg_offset reg_space write_data\" input=hex_or_dec",
> +				  got);
> +		else
> +			hsmp_err(dev, attr_name, HSMP_ERR_ARGC,
> +				 "want=4 got=%d fmt=\"dimm_addr lid reg_offset reg_space\" input=hex_or_dec",
> +				  got);
> +		return -EINVAL;
> +	}
> +
> +	if (vals[0] > 255 || vals[1] > 15 || vals[2] > 2047 || vals[3] > 1 ||
> +	    (with_data && vals[4] > 255)) {
> +		if (with_data)
> +			hsmp_err(dev, attr_name, HSMP_ERR_RANGE,
> +				 "dimm_addr=0x%x lid=0x%x reg_offset=0x%x reg_space=%u write_data=%u valid_dimm_addr=0-255 valid_lid=0-15 valid_reg_offset=0-2047 valid_reg_space=0-1 valid_write_data=0-255",
> +				  vals[0], vals[1], vals[2], vals[3], vals[4]);
> +		else
> +			hsmp_err(dev, attr_name, HSMP_ERR_RANGE,
> +				 "dimm_addr=0x%x lid=0x%x reg_offset=0x%x reg_space=%u valid_dimm_addr=0-255 valid_lid=0-15 valid_reg_offset=0-2047 valid_reg_space=0-1",
> +				  vals[0], vals[1], vals[2], vals[3]);
> +		return -EINVAL;
> +	}
> +
> +	*addr = vals[0];
> +	*lid = vals[1];
> +	*off = vals[2];
> +	*space = vals[3];
> +	if (with_data)
> +		*data = vals[4];
> +
> +	return 0;
> +}
> +
> +static u32 dimm_sb_pack(int addr, int lid, int off, int space, int data)
> +{
> +	return (addr & 0xff) |
> +	       ((lid & 0xf) << 8) |
> +	       ((off & 0x7ff) << 12) |
> +	       ((space & 1) << 23) |
> +	       ((data & 0xff) << 24);

defines + FIELD_PREP()

> +}
> +
> +/*
> + * Last DIMM sideband read request and its data, or -ENODATA if none has
> + * succeeded. Fields are address, LID, offset, reg space, and data.
> + */
> +ssize_t hsmp_dimm_sb_get_show(struct device *dev, struct device_attribute *attr,
> +			      char *buf)
> +{
> +	struct dimm_sb_cfg *cfg = dimm_sb_state(dev, attr);
> +
> +	if (!cfg)
> +		return -EINVAL;
> +	if (!cfg->configured)
> +		return -ENODATA;
> +
> +	return sysfs_emit(buf, "0x%x 0x%x 0x%x %u 0x%x\n",
> +			  cfg->addr, cfg->lid, cfg->reg_offset, cfg->reg_space,
> +			  cfg->result);
> +}
> +
> +/* Issue HSMP_DIMM_SB_RD and cache the request and the returned data. */
> +ssize_t hsmp_dimm_sb_get_store(struct device *dev, struct device_attribute *attr,
> +			       const char *buf, size_t count)
> +{
> +	struct dimm_sb_cfg *cfg = dimm_sb_state(dev, attr);
> +	struct hsmp_message msg = {};
> +	int addr, lid, off, space;
> +	int ret;
> +
> +	if (!cfg)
> +		return -EINVAL;
> +
> +	ret = dimm_sb_parse(dev, "dimm_sb_get", buf, false, &addr, &lid, &off, &space, NULL);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * HSMP_DIMM_SB_RD: reg space[23] + reg offset[22:12] +
> +	 * LID[11:8] + DIMM address[7:0].
> +	 */
> +	msg.msg_id = HSMP_DIMM_SB_RD;
> +	msg.sock_ind = hsmp_sysfs_sock_ind(dev, to_hsmp_sys_attr(attr));
> +	msg.num_args = 1;
> +	msg.response_sz = 1;
> +	msg.args[0] = dimm_sb_pack(addr, lid, off, space, 0);
> +
> +	ret = hsmp_send_message(&msg);
> +	if (ret) {
> +		hsmp_err(dev, "dimm_sb_get", HSMP_ERR_HW,
> +			 "dimm_addr=0x%x lid=0x%x reg_offset=0x%x reg_space=%u rc=%d",
> +			  addr, lid, off, space, ret);
> +		return ret;
> +	}
> +
> +	cfg->addr = addr;
> +	cfg->lid = lid;
> +	cfg->reg_offset = off;
> +	cfg->reg_space = space;
> +	cfg->result = msg.args[0] & 0xffff;

FIELD_GET() ?

> +	cfg->configured = true;
> +
> +	return count;
> +}
> +
> +/* Write one DIMM sideband register via HSMP_DIMM_SB_WR. */
> +ssize_t hsmp_dimm_sb_set_store(struct device *dev, struct device_attribute *attr,
> +			       const char *buf, size_t count)
> +{
> +	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> +	struct hsmp_message msg = {};
> +	int addr, lid, off, space, data;
> +	u16 sock_ind;
> +	int ret;
> +
> +	sock_ind = hsmp_sysfs_sock_ind(dev, hattr);
> +	if (sock_ind >= MAX_AMD_NUM_NODES)
> +		return -EINVAL;
> +
> +	ret = dimm_sb_parse(dev, "dimm_sb_set", buf, true, &addr, &lid, &off, &space, &data);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * HSMP_DIMM_SB_WR: write data[31:24] + reg space[23] +
> +	 * reg offset[22:12] + LID[11:8] + DIMM address[7:0].
> +	 */

This belongs to the enconding function, not here.

> +	msg.msg_id = HSMP_DIMM_SB_WR;
> +	msg.sock_ind = sock_ind;
> +	msg.num_args = 1;
> +	msg.response_sz = 0;
> +	msg.args[0] = dimm_sb_pack(addr, lid, off, space, data);
> +
> +	ret = hsmp_send_message(&msg);
> +	if (ret) {
> +		hsmp_err(dev, "dimm_sb_set", HSMP_ERR_HW,
> +			 "dimm_addr=0x%x lid=0x%x reg_offset=0x%x reg_space=%u write_data=%u rc=%d",
> +			  addr, lid, off, space, data, ret);
> +		return ret;
> +	}
> +
> +	return count;
> +}
> +
>  static ssize_t hsmp_lclk_nbio_show(struct device *dev,
>  				   struct device_attribute *attr,
>  				   u8 nbio_id, char *buf)
> diff --git a/drivers/platform/x86/amd/hsmp/sysfs.h b/drivers/platform/x86/amd/hsmp/sysfs.h
> index 83358304da97b..2e7064df871bb 100644
> --- a/drivers/platform/x86/amd/hsmp/sysfs.h
> +++ b/drivers/platform/x86/amd/hsmp/sysfs.h
> @@ -158,7 +158,18 @@ umode_t hsmp_io_bw_file_visible(const struct hsmp_socket *sock, int id);
>  ssize_t hsmp_xgmi_link_bw_show(struct device *dev, struct device_attribute *attr,
>  			       char *buf);
>  umode_t hsmp_xgmi_bw_file_visible(const struct hsmp_socket *sock, int id);
> +ssize_t hsmp_dimm_sb_get_show(struct device *dev, struct device_attribute *attr,
> +			      char *buf);
> +ssize_t hsmp_dimm_sb_get_store(struct device *dev, struct device_attribute *attr,
> +			       const char *buf, size_t count);
> +ssize_t hsmp_dimm_sb_set_store(struct device *dev, struct device_attribute *attr,
> +			       const char *buf, size_t count);
>  
> +/*
> + * True when the attribute store issues a GET, or only records state for
> + * a later GET. The write bit then follows the GET message bitmap.
> + */
> +bool hsmp_sysfs_write_follows_read(const struct hsmp_sys_attr *hattr);
>  
>  void hsmp_create_per_cpu_kobjects(struct device *dev, struct kobject *cpu_parent,
>  				  struct hsmp_socket *sock);
> 

-- 
 i.


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795434609;
	b=eLroxQa7x1EsEWdFXoOocZzVQRSNXDqp/ZnvrtanrFawUJD++ZUHjLFcckBGmXaIIVZi
	 qbi1/NYBsDRGA1XkIqrUS/AsPWGkZ6G0JRl/RrF6azIwp+at6uYo+zy+uRxmHzYk/Musg
	 UBhCs3IGICZ3CxefW35ThrV59c9LNddaU1R3kfK/8PwV5NLtJC8LsBh/FnaBqzBTLD5fX
	 ETR/BPV2uLkFRw0oEzSHCWW2IhXYIePgRFc63B/TW/oC2zalS1tJlknxsQ34RP/lmrlaV
	 UfIgYxxxa4nIOtySkG4JuG063IACySR/rOSJQ5DPrU5FUEbcGJuUE3DqHALakCO2Pfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795434609;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=YgMdVeIRQpMYSNjF396VnGOvk5QtrjIR4o/6JY0i3Xg=;
	b=Ihfqlr28MfxLJq5/MA7yNwlPi8n9AcT+jq8sCly/cNJcJJC/QLFamQ8nfLpk25c55a6j
	 NP4pZTfedNSDMp8Sg599yJ9+xEzu1FYmwoJDhWmcN9Qf3t+VR8j+grDZ+aq0Mg68wzoo+
	 6RnTkt5yEGhHjDpnFXk62vaoxQdDQbhp61Csywh+B+21r1+CQ0Tlv6Bw/bBSMPSFNERcU
	 yDh+K0IaYO8XB0QEAKMUsXnRfxYFPi2PGC6J8+QbOurtxtwz1oB+C3JVNfoEzBjlrmRNS
	 AVokIgjwVUzBUcGxQK+f1Kr4Zt6OuuCWhYITvcJ4i49sEQ0PztLqOVBYDTV6/gAbSUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EcbZur0r;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3776E606A31F
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Nov 2026 11:50:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3776E606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EcbZur0r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795434609; x=1826970609;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=H+8i71YxPRxGW/F19iXCbTwmjyTrZEf4DmhVl+LJspU=;
  b=EcbZur0rFkTQiQtSUZKlEHc+dvXGdCZt8f6uJPEf0Hg1RvbxytaW/N9G
   jIidWaOHXpeBKx4gL9LzDPyndkaLx6Ltj7X2vTLgdAKceEXJKmiyiMgpu
   l/mRU8M3KbDTb2P/nMiSShvxz9RVSwiTvVZv4xXEDUedMOE9ojugQIhmC
   ATRZaJn9975ydqV2DflhSv369U89fDzCp45ORRK63qNsiwo3novTX4XiM
   TJ81POL9c8LIdNJWIEd2vCD55KbpzdpQCDQQKxcWsD3alh7nfRIIbwwL3
   3lljOUNLTzHsiZgFAYDbcg7klzoR9X8JWXBJXJ+U9GbZIs9i3EULKmxjG
   w==;
X-CSE-ConnectionGUID: bMS/onRsTuSWFu9L9Yi1aw==
X-CSE-MsgGUID: QFlX9/TgQ8yKiAAdL/uXmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4237213"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4237213"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 03:50:00 -0800
X-CSE-ConnectionGUID: cmWoMIUrShCaZpr+TwUV4Q==
X-CSE-MsgGUID: UkazODpmSIaU2SnJuVlKBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11615019"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.225])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 03:49:57 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 23 Nov 2026 13:49:52 +0200 (EET)
To: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
cc: platform-driver-x86@vger.kernel.org, Suma.Hegde@amd.com, 
    NaveenKrishna.Chatradhi@amd.com
Subject: Re: [PATCH 12/26] platform/x86/amd/hsmp: Add io_bw and xgmi_bw sysfs
 files
In-Reply-To: <cbec1c7339f0108aa3f4573a6f441bdacd804788.1793602633.git.Muthusamy.Ramalingam@amd.com>
Message-ID: <8c4ee81d-a193-4718-d8da-2edc23c54c8a@linux.intel.com>
References: <cover.1793602633.git.Muthusamy.Ramalingam@amd.com> <cbec1c7339f0108aa3f4573a6f441bdacd804788.1793602633.git.Muthusamy.Ramalingam@amd.com>
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

> Expose io_bw and xgmi_bw directories on both drivers. Probe asks
> firmware which links accept HSMP_GET_IOLINK_BANDWITH and which link
> and bandwidth-type combinations accept HSMP_GET_XGMI_BANDWITH, and
> only those files are created. An io_bw read returns that link's
> aggregate bandwidth. An xgmi_bw read returns that link's aggregate,
> read, or write bandwidth.
> 
> Co-developed-by: Suma Hegde <Suma.Hegde@amd.com>
> Signed-off-by: Suma Hegde <Suma.Hegde@amd.com>
> Signed-off-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
> ---
>  Documentation/arch/x86/amd_hsmp.rst   |  10 +
>  drivers/platform/x86/amd/hsmp/acpi.c  | 179 +++++++
>  drivers/platform/x86/amd/hsmp/hsmp.c  | 161 ++++++
>  drivers/platform/x86/amd/hsmp/hsmp.h  |  22 +
>  drivers/platform/x86/amd/hsmp/plat.c  | 678 +++++++++++++++++++++++++-
>  drivers/platform/x86/amd/hsmp/sysfs.c |  94 ++++
>  drivers/platform/x86/amd/hsmp/sysfs.h |  18 +
>  7 files changed, 1159 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
> index c63fc52316361..516e8391bfbd2 100644
> --- a/Documentation/arch/x86/amd_hsmp.rst
> +++ b/Documentation/arch/x86/amd_hsmp.rst
> @@ -135,6 +135,16 @@ write-only when the platform enables only that direction of the message.
>    Firmware rejects unsupported widths.
>  * pcie_link_rate: Write-only. Sets the PCIe link rate control value
>    (HSMP_SET_PCI_RATE).
> +* io_bw/: Read-only IO link bandwidth in Mbps. Files are io_p0 through
> +  io_p5 and io_g0 through io_g7. A read returns the aggregate bandwidth.
> +  Probe keeps only the links firmware accepts for this platform. The
> +  directory is absent when none respond.
> +* xgmi_bw/: Read-only xGMI link bandwidth in Mbps. For each link p0
> +  through p5 and g0 through g7, the files are xgmi_<link>_agg,
> +  xgmi_<link>_rd, and xgmi_<link>_wr. A read returns that link's
> +  aggregate, read, or write bandwidth. Probe keeps only the link and
> +  type combinations firmware accepts. The directory is absent when
> +  none respond.
>  * socket_power_limit_max: Maximum socket power limit in mWatts (read only).
>  * cclk_boost_limit: Socket boost limit in MHz (write only). Accepted range
>    is 100-10000 MHz.
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
> index 89c9e944b5537..d6bb8a849cca7 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -440,6 +440,9 @@ static int init_acpi(struct device *dev)
>  			dev_err(dev, "Failed to get enabled HSMP messages on this platform\n");
>  			return ret;
>  		}
> +
> +		hsmp_scan_io_bw(sock);
> +		hsmp_scan_xgmi_bw(sock);
>  	}
>  
>  	if ((is_client_platform() &&
> @@ -555,6 +558,85 @@ HSMP_DEV_ATTR_RW(lclk_2, HSMP_GET_NBIO_DPM_LEVEL, HSMP_SET_NBIO_DPM_LEVEL,
>  		 hsmp_lclk_2_show, hsmp_lclk_2_store, 0644);
>  HSMP_DEV_ATTR_RW(lclk_3, HSMP_GET_NBIO_DPM_LEVEL, HSMP_SET_NBIO_DPM_LEVEL,
>  		 hsmp_lclk_3_show, hsmp_lclk_3_store, 0644);
> +
> +#define HSMP_IO_LINK(_name, _id)					\
> +	HSMP_SYS_ATTR_PRIV(_name, _name, hsmp_io_link_bw_show, U16_MAX,	\
> +			   HSMP_GET_IOLINK_BANDWITH, _id)
> +
> +HSMP_IO_LINK(io_p0, 0);
> +HSMP_IO_LINK(io_p1, 1);
> +HSMP_IO_LINK(io_p2, 2);
> +HSMP_IO_LINK(io_p3, 3);
> +HSMP_IO_LINK(io_p4, 4);
> +HSMP_IO_LINK(io_p5, 5);
> +HSMP_IO_LINK(io_g0, 6);
> +HSMP_IO_LINK(io_g1, 7);
> +HSMP_IO_LINK(io_g2, 8);
> +HSMP_IO_LINK(io_g3, 9);
> +HSMP_IO_LINK(io_g4, 10);
> +HSMP_IO_LINK(io_g5, 11);
> +HSMP_IO_LINK(io_g6, 12);
> +HSMP_IO_LINK(io_g7, 13);
> +#undef HSMP_IO_LINK
> +
> +#define HSMP_XGMI_AGG(_link, _base)					\
> +	HSMP_SYS_ATTR_PRIV(xgmi_##_link##_agg, xgmi_##_link##_agg,	\
> +			   hsmp_xgmi_link_bw_show, U16_MAX,		\
> +			   HSMP_GET_XGMI_BANDWITH, (_base))
> +#define HSMP_XGMI_RD(_link, _base)					\
> +	HSMP_SYS_ATTR_PRIV(xgmi_##_link##_rd, xgmi_##_link##_rd,	\
> +			   hsmp_xgmi_link_bw_show, U16_MAX,		\
> +			   HSMP_GET_XGMI_BANDWITH, (_base) + 1)
> +#define HSMP_XGMI_WR(_link, _base)					\
> +	HSMP_SYS_ATTR_PRIV(xgmi_##_link##_wr, xgmi_##_link##_wr,	\
> +			   hsmp_xgmi_link_bw_show, U16_MAX,		\
> +			   HSMP_GET_XGMI_BANDWITH, (_base) + 2)
> +
> +HSMP_XGMI_AGG(p0, 0);
> +HSMP_XGMI_RD(p0, 0);
> +HSMP_XGMI_WR(p0, 0);
> +HSMP_XGMI_AGG(p1, 3);
> +HSMP_XGMI_RD(p1, 3);
> +HSMP_XGMI_WR(p1, 3);
> +HSMP_XGMI_AGG(p2, 6);
> +HSMP_XGMI_RD(p2, 6);
> +HSMP_XGMI_WR(p2, 6);
> +HSMP_XGMI_AGG(p3, 9);
> +HSMP_XGMI_RD(p3, 9);
> +HSMP_XGMI_WR(p3, 9);
> +HSMP_XGMI_AGG(p4, 12);
> +HSMP_XGMI_RD(p4, 12);
> +HSMP_XGMI_WR(p4, 12);
> +HSMP_XGMI_AGG(p5, 15);
> +HSMP_XGMI_RD(p5, 15);
> +HSMP_XGMI_WR(p5, 15);
> +HSMP_XGMI_AGG(g0, 18);
> +HSMP_XGMI_RD(g0, 18);
> +HSMP_XGMI_WR(g0, 18);
> +HSMP_XGMI_AGG(g1, 21);
> +HSMP_XGMI_RD(g1, 21);
> +HSMP_XGMI_WR(g1, 21);
> +HSMP_XGMI_AGG(g2, 24);
> +HSMP_XGMI_RD(g2, 24);
> +HSMP_XGMI_WR(g2, 24);
> +HSMP_XGMI_AGG(g3, 27);
> +HSMP_XGMI_RD(g3, 27);
> +HSMP_XGMI_WR(g3, 27);
> +HSMP_XGMI_AGG(g4, 30);
> +HSMP_XGMI_RD(g4, 30);
> +HSMP_XGMI_WR(g4, 30);
> +HSMP_XGMI_AGG(g5, 33);
> +HSMP_XGMI_RD(g5, 33);
> +HSMP_XGMI_WR(g5, 33);
> +HSMP_XGMI_AGG(g6, 36);
> +HSMP_XGMI_RD(g6, 36);
> +HSMP_XGMI_WR(g6, 36);
> +HSMP_XGMI_AGG(g7, 39);
> +HSMP_XGMI_RD(g7, 39);
> +HSMP_XGMI_WR(g7, 39);
> +#undef HSMP_XGMI_AGG
> +#undef HSMP_XGMI_RD
> +#undef HSMP_XGMI_WR
>  HSMP_DEV_ATTR_W(cclk_boost_limit, HSMP_SET_BOOST_LIMIT_SOCKET,
>  		hsmp_cclk_boost_limit_store, 0200);
>  HSMP_DEV_ATTR_RW(apb_disable, HSMP_SET_DF_PSTATE, HSMP_SET_DF_PSTATE,
> @@ -632,6 +714,101 @@ static const struct attribute_group lclk_group = {
>  	.is_visible = hsmp_lclk_is_visible,
>  };
>  
> +static struct attribute *io_bw_attrs[] = {
> +	&hattr_io_p0.dattr.attr,
> +	&hattr_io_p1.dattr.attr,
> +	&hattr_io_p2.dattr.attr,
> +	&hattr_io_p3.dattr.attr,
> +	&hattr_io_p4.dattr.attr,
> +	&hattr_io_p5.dattr.attr,
> +	&hattr_io_g0.dattr.attr,
> +	&hattr_io_g1.dattr.attr,
> +	&hattr_io_g2.dattr.attr,
> +	&hattr_io_g3.dattr.attr,
> +	&hattr_io_g4.dattr.attr,
> +	&hattr_io_g5.dattr.attr,
> +	&hattr_io_g6.dattr.attr,
> +	&hattr_io_g7.dattr.attr,
> +	NULL
> +};
> +
> +static umode_t hsmp_io_bw_is_visible(struct kobject *kobj,
> +				     struct attribute *attr __always_unused,
> +				     int id)
> +{
> +	return hsmp_io_bw_file_visible(dev_get_drvdata(kobj_to_dev(kobj)), id);
> +}
> +
> +static const struct attribute_group io_bw_group = {
> +	.name = "io_bw",
> +	.attrs = io_bw_attrs,
> +	.is_visible = hsmp_io_bw_is_visible,
> +};
> +
> +#define HSMP_XGMI_ATTR(_link, _kind)					\
> +	(&hattr_xgmi_##_link##_##_kind.dattr.attr)
> +
> +static struct attribute *xgmi_bw_attrs[] = {
> +	HSMP_XGMI_ATTR(p0, agg),
> +	HSMP_XGMI_ATTR(p0, rd),
> +	HSMP_XGMI_ATTR(p0, wr),
> +	HSMP_XGMI_ATTR(p1, agg),
> +	HSMP_XGMI_ATTR(p1, rd),
> +	HSMP_XGMI_ATTR(p1, wr),
> +	HSMP_XGMI_ATTR(p2, agg),
> +	HSMP_XGMI_ATTR(p2, rd),
> +	HSMP_XGMI_ATTR(p2, wr),
> +	HSMP_XGMI_ATTR(p3, agg),
> +	HSMP_XGMI_ATTR(p3, rd),
> +	HSMP_XGMI_ATTR(p3, wr),
> +	HSMP_XGMI_ATTR(p4, agg),
> +	HSMP_XGMI_ATTR(p4, rd),
> +	HSMP_XGMI_ATTR(p4, wr),
> +	HSMP_XGMI_ATTR(p5, agg),
> +	HSMP_XGMI_ATTR(p5, rd),
> +	HSMP_XGMI_ATTR(p5, wr),
> +	HSMP_XGMI_ATTR(g0, agg),
> +	HSMP_XGMI_ATTR(g0, rd),
> +	HSMP_XGMI_ATTR(g0, wr),
> +	HSMP_XGMI_ATTR(g1, agg),
> +	HSMP_XGMI_ATTR(g1, rd),
> +	HSMP_XGMI_ATTR(g1, wr),
> +	HSMP_XGMI_ATTR(g2, agg),
> +	HSMP_XGMI_ATTR(g2, rd),
> +	HSMP_XGMI_ATTR(g2, wr),
> +	HSMP_XGMI_ATTR(g3, agg),
> +	HSMP_XGMI_ATTR(g3, rd),
> +	HSMP_XGMI_ATTR(g3, wr),
> +	HSMP_XGMI_ATTR(g4, agg),
> +	HSMP_XGMI_ATTR(g4, rd),
> +	HSMP_XGMI_ATTR(g4, wr),
> +	HSMP_XGMI_ATTR(g5, agg),
> +	HSMP_XGMI_ATTR(g5, rd),
> +	HSMP_XGMI_ATTR(g5, wr),
> +	HSMP_XGMI_ATTR(g6, agg),
> +	HSMP_XGMI_ATTR(g6, rd),
> +	HSMP_XGMI_ATTR(g6, wr),
> +	HSMP_XGMI_ATTR(g7, agg),
> +	HSMP_XGMI_ATTR(g7, rd),
> +	HSMP_XGMI_ATTR(g7, wr),
> +	NULL
> +};
> +
> +#undef HSMP_XGMI_ATTR
> +
> +static umode_t hsmp_xgmi_bw_is_visible(struct kobject *kobj,
> +				       struct attribute *attr __always_unused,
> +				       int id)
> +{
> +	return hsmp_xgmi_bw_file_visible(dev_get_drvdata(kobj_to_dev(kobj)), id);
> +}
> +
> +static const struct attribute_group xgmi_bw_group = {
> +	.name = "xgmi_bw",
> +	.attrs = xgmi_bw_attrs,
> +	.is_visible = hsmp_xgmi_bw_is_visible,
> +};
> +
>  static const struct attribute_group hsmp_attr_grp = {
>  	.bin_attrs = hsmp_attr_list,
>  	.attrs = hsmp_dev_attr_list,
> @@ -642,6 +819,8 @@ static const struct attribute_group hsmp_attr_grp = {
>  static const struct attribute_group *hsmp_groups[] = {
>  	&hsmp_attr_grp,
>  	&lclk_group,
> +	&io_bw_group,
> +	&xgmi_bw_group,
>  	NULL
>  };
>  
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
> index 4f23ae836a900..80721b13074d2 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
> @@ -12,6 +12,7 @@
>  #include <linux/acpi.h>
>  #include <linux/array_size.h>
>  #include <linux/bitmap.h>
> +#include <linux/bits.h>
>  #include <linux/build_bug.h>
>  #include <linux/cleanup.h>
>  #include <linux/compiler.h>
> @@ -23,6 +24,7 @@
>  #include <linux/rwsem.h>
>  #include <linux/semaphore.h>
>  #include <linux/slab.h>
> +#include <linux/string.h>
>  #include <linux/sysfs.h>
>  #include <linux/uaccess.h>
>  
> @@ -918,6 +920,165 @@ static int hsmp_set_default_msg_bitmap(u16 sock_ind)
>  	return hsmp_fetch_write_enabled_msgs(sock_ind, sock->enabled_write_msg_ids);
>  }
>  
> +struct hsmp_io_link_enc {
> +	const char *name;
> +	u16 enc;
> +};
> +
> +/* Protocol 5 and 7: one-hot link encoding. */
> +static const struct hsmp_io_link_enc io_links_onehot[] = {
> +	{ "p0", BIT(0) }, { "p1", BIT(1) }, { "p2", BIT(2) }, { "p3", BIT(3) },
> +	{ "p4", BIT(8) }, { "p5", BIT(9) },
> +	{ "g0", BIT(4) }, { "g1", BIT(5) }, { "g2", BIT(6) }, { "g3", BIT(7) },
> +};
> +
> +/* MI300 (family 0x19, models 0x90-0x9F): index encoding. */
> +static const struct hsmp_io_link_enc io_links_mi300[] = {
> +	{ "p2", 0x3 }, { "p3", 0x4 }, { "g0", 0x8 }, { "g1", 0x9 },
> +	{ "g2", 0xA }, { "g3", 0xB }, { "g4", 0xC }, { "g5", 0xD },
> +	{ "g6", 0xE }, { "g7", 0xF },
> +};
> +
> +/* Bit index is the io_bw attribute id. */
> +static const char * const io_link_names[HSMP_IO_LINK_COUNT] = {
> +	"p0", "p1", "p2", "p3", "p4", "p5",
> +	"g0", "g1", "g2", "g3", "g4", "g5", "g6", "g7",
> +};
> +
> +static bool hsmp_io_link_is_mi300(void)
> +{
> +	return boot_cpu_data.x86 == 0x19 &&
> +	       boot_cpu_data.x86_model >= 0x90 &&
> +	       boot_cpu_data.x86_model <= 0x9F;
> +}
> +
> +static const struct hsmp_io_link_enc *hsmp_io_link_table(size_t *n)
> +{
> +	if (hsmp_io_link_is_mi300()) {
> +		*n = ARRAY_SIZE(io_links_mi300);
> +		return io_links_mi300;
> +	}
> +
> +	*n = ARRAY_SIZE(io_links_onehot);
> +	return io_links_onehot;
> +}
> +
> +int hsmp_io_link_encode(unsigned int id, u16 *enc)
> +{
> +	const struct hsmp_io_link_enc *tbl;
> +	size_t i, n;
> +
> +	if (!enc || id >= HSMP_IO_LINK_COUNT)
> +		return -EINVAL;
> +
> +	tbl = hsmp_io_link_table(&n);
> +	for (i = 0; i < n; i++) {
> +		if (!strcmp(io_link_names[id], tbl[i].name)) {
> +			*enc = tbl[i].enc;
> +			return 0;
> +		}
> +	}
> +
> +	return -EINVAL;
> +}
> +EXPORT_SYMBOL_NS_GPL(hsmp_io_link_encode, "AMD_HSMP");
> +
> +/*
> + * Probe each candidate link and record the ones firmware accepts.
> + * Caller holds hsmp_sock_rwsem for write.
> + */
> +void hsmp_scan_io_bw(struct hsmp_socket *sock)
> +{
> +	unsigned int i;
> +
> +	if (!sock)
> +		return;
> +
> +	sock->io_bw_valid = 0;
> +	if (is_client_platform() ||
> +	    !is_read_msg_enabled(sock, HSMP_GET_IOLINK_BANDWITH))
> +		return;
> +
> +	for (i = 0; i < HSMP_IO_LINK_COUNT; i++) {
> +		struct hsmp_message msg = {};
> +		u16 enc;
> +
> +		if (hsmp_io_link_encode(i, &enc))
> +			continue;
> +
> +		msg.msg_id = HSMP_GET_IOLINK_BANDWITH;
> +		msg.sock_ind = sock->sock_ind;
> +		msg.num_args = 1;
> +		msg.response_sz = 1;
> +		/* Aggregate bandwidth type in [2:0], link encoding in [15:8]. */
> +		msg.args[0] = 1 | ((u32)enc << 8);

FIELD_PREP(...) | FIELD_PREP(...).

> +		if (!hsmp_send_message_locked(&msg))
> +			sock->io_bw_valid |= BIT(i);
> +	}
> +}
> +EXPORT_SYMBOL_NS_GPL(hsmp_scan_io_bw, "AMD_HSMP");
> +
> +/* Bandwidth type in args[0][2:0]: aggregate, read, then write. */
> +static const u8 xgmi_bw_types[HSMP_XGMI_BW_TYPES] = {
> +	BIT(0), BIT(1), BIT(2),

According to comment, you know very well what these are, so why are you 
not naming them with defines?

> +};
> +
> +/*
> + * Pack HSMP_GET_XGMI_BANDWITH args[0] for xgmi_bw attribute @id.
> + * Link encoding is the same as io_bw; the type sits in [2:0].
> + */
> +int hsmp_xgmi_bw_arg(unsigned int id, u32 *arg)
> +{
> +	unsigned int link, type;
> +	u16 enc;
> +	int ret;
> +
> +	if (!arg || id >= HSMP_XGMI_BW_COUNT)
> +		return -EINVAL;
> +
> +	link = id / HSMP_XGMI_BW_TYPES;
> +	type = id % HSMP_XGMI_BW_TYPES;
> +	ret = hsmp_io_link_encode(link, &enc);
> +	if (ret)
> +		return ret;
> +
> +	*arg = xgmi_bw_types[type] | ((u32)enc << 8);

FIELD_PREP()s.

> +	return 0;
> +}
> +EXPORT_SYMBOL_NS_GPL(hsmp_xgmi_bw_arg, "AMD_HSMP");
> +
> +/*
> + * Probe each candidate link and bandwidth type. Record the ones
> + * firmware accepts. Caller holds hsmp_sock_rwsem for write.
> + */
> +void hsmp_scan_xgmi_bw(struct hsmp_socket *sock)
> +{
> +	unsigned int i;
> +
> +	if (!sock)
> +		return;
> +
> +	sock->xgmi_bw_valid = 0;
> +	if (is_client_platform() ||
> +	    !is_read_msg_enabled(sock, HSMP_GET_XGMI_BANDWITH))
> +		return;
> +
> +	for (i = 0; i < HSMP_XGMI_BW_COUNT; i++) {
> +		struct hsmp_message msg = {};
> +
> +		if (hsmp_xgmi_bw_arg(i, &msg.args[0]))
> +			continue;
> +
> +		msg.msg_id = HSMP_GET_XGMI_BANDWITH;
> +		msg.sock_ind = sock->sock_ind;
> +		msg.num_args = 1;
> +		msg.response_sz = 1;
> +		if (!hsmp_send_message_locked(&msg))
> +			sock->xgmi_bw_valid |= BIT_ULL(i);
> +	}
> +}
> +EXPORT_SYMBOL_NS_GPL(hsmp_scan_xgmi_bw, "AMD_HSMP");
> +
>  static void hsmp_dynamic_bitmap_zen6(u16 sock_ind)
>  {
>  	struct hsmp_socket *sock = &hsmp_pdev.sock[sock_ind];
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
> index e67bbdd2b9bee..b41080c0f9555 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
> @@ -83,6 +83,17 @@ struct hsmp_socket {
>  	u32 proto_ver;
>  	DECLARE_BITMAP(enabled_read_msg_ids, HSMP_MAX_MSGS);
>  	DECLARE_BITMAP(enabled_write_msg_ids, HSMP_MAX_MSGS);
> +	/*
> +	 * Links that answered HSMP_GET_IOLINK_BANDWITH at probe.
> +	 * Bit index matches io_bw/io_p0 .. io_g7 attribute order.
> +	 */
> +	u16 io_bw_valid;
> +	/*
> +	 * Link and bandwidth-type combinations that answered
> +	 * HSMP_GET_XGMI_BANDWITH at probe. Bit index is
> +	 * link * 3 + type, matching xgmi_bw/xgmi_<link>_{agg,rd,wr}.
> +	 */
> +	u64 xgmi_bw_valid;
>  	int (*amd_hsmp_rdwr)(struct hsmp_socket *sock, u32 off, u32 *val, bool rw);
>  };
>  
> @@ -131,6 +142,17 @@ static inline int hsmp_create_sensor(struct device *dev, u16 sock_ind) { return
>  #endif
>  int hsmp_msg_get_nargs(u16 sock_ind, u32 msg_id, u32 *data, u8 num_args);
>  
> +/* io_bw attribute order: p0 p1 p2 p3 p4 p5 g0 g1 g2 g3 g4 g5 g6 g7. */
> +#define HSMP_IO_LINK_COUNT	14
> +int hsmp_io_link_encode(unsigned int id, u16 *enc);
> +void hsmp_scan_io_bw(struct hsmp_socket *sock);
> +
> +/* xgmi_bw files per link: aggregate, read, write. */
> +#define HSMP_XGMI_BW_TYPES	3
> +#define HSMP_XGMI_BW_COUNT	(HSMP_IO_LINK_COUNT * HSMP_XGMI_BW_TYPES)
> +int hsmp_xgmi_bw_arg(unsigned int id, u32 *arg);
> +void hsmp_scan_xgmi_bw(struct hsmp_socket *sock);
> +
>  /*
>   * Gates the HSMP data plane: hsmp_send_message() takes it for read; probe and
>   * remove take it for write to bring sockets up and tear them down.
> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
> index 162a5b1468a76..3af94db6fd5b7 100644
> --- a/drivers/platform/x86/amd/hsmp/plat.c
> +++ b/drivers/platform/x86/amd/hsmp/plat.c
> @@ -393,6 +393,476 @@ HSMP_DEV_ATTR_RW_X8(lclk_2, HSMP_GET_NBIO_DPM_LEVEL, HSMP_SET_NBIO_DPM_LEVEL,
>  		    hsmp_lclk_2_show, hsmp_lclk_2_store, 0644);
>  HSMP_DEV_ATTR_RW_X8(lclk_3, HSMP_GET_NBIO_DPM_LEVEL, HSMP_SET_NBIO_DPM_LEVEL,
>  		    hsmp_lclk_3_show, hsmp_lclk_3_store, 0644);
> +
> +#define HSMP_IO_LINK(_name, _id, _sock)					\
> +	HSMP_SYS_ATTR_PRIV(_name##_##_sock, _name, hsmp_io_link_bw_show, \
> +			   _sock, HSMP_GET_IOLINK_BANDWITH, _id)
> +
> +HSMP_IO_LINK(io_p0, 0, 0);
> +HSMP_IO_LINK(io_p0, 0, 1);
> +HSMP_IO_LINK(io_p0, 0, 2);
> +HSMP_IO_LINK(io_p0, 0, 3);
> +HSMP_IO_LINK(io_p0, 0, 4);
> +HSMP_IO_LINK(io_p0, 0, 5);
> +HSMP_IO_LINK(io_p0, 0, 6);
> +HSMP_IO_LINK(io_p0, 0, 7);
> +HSMP_IO_LINK(io_p1, 1, 0);
> +HSMP_IO_LINK(io_p1, 1, 1);
> +HSMP_IO_LINK(io_p1, 1, 2);
> +HSMP_IO_LINK(io_p1, 1, 3);
> +HSMP_IO_LINK(io_p1, 1, 4);
> +HSMP_IO_LINK(io_p1, 1, 5);
> +HSMP_IO_LINK(io_p1, 1, 6);
> +HSMP_IO_LINK(io_p1, 1, 7);
> +HSMP_IO_LINK(io_p2, 2, 0);
> +HSMP_IO_LINK(io_p2, 2, 1);
> +HSMP_IO_LINK(io_p2, 2, 2);
> +HSMP_IO_LINK(io_p2, 2, 3);
> +HSMP_IO_LINK(io_p2, 2, 4);
> +HSMP_IO_LINK(io_p2, 2, 5);
> +HSMP_IO_LINK(io_p2, 2, 6);
> +HSMP_IO_LINK(io_p2, 2, 7);
> +HSMP_IO_LINK(io_p3, 3, 0);
> +HSMP_IO_LINK(io_p3, 3, 1);
> +HSMP_IO_LINK(io_p3, 3, 2);
> +HSMP_IO_LINK(io_p3, 3, 3);
> +HSMP_IO_LINK(io_p3, 3, 4);
> +HSMP_IO_LINK(io_p3, 3, 5);
> +HSMP_IO_LINK(io_p3, 3, 6);
> +HSMP_IO_LINK(io_p3, 3, 7);
> +HSMP_IO_LINK(io_p4, 4, 0);
> +HSMP_IO_LINK(io_p4, 4, 1);
> +HSMP_IO_LINK(io_p4, 4, 2);
> +HSMP_IO_LINK(io_p4, 4, 3);
> +HSMP_IO_LINK(io_p4, 4, 4);
> +HSMP_IO_LINK(io_p4, 4, 5);
> +HSMP_IO_LINK(io_p4, 4, 6);
> +HSMP_IO_LINK(io_p4, 4, 7);
> +HSMP_IO_LINK(io_p5, 5, 0);
> +HSMP_IO_LINK(io_p5, 5, 1);
> +HSMP_IO_LINK(io_p5, 5, 2);
> +HSMP_IO_LINK(io_p5, 5, 3);
> +HSMP_IO_LINK(io_p5, 5, 4);
> +HSMP_IO_LINK(io_p5, 5, 5);
> +HSMP_IO_LINK(io_p5, 5, 6);
> +HSMP_IO_LINK(io_p5, 5, 7);
> +HSMP_IO_LINK(io_g0, 6, 0);
> +HSMP_IO_LINK(io_g0, 6, 1);
> +HSMP_IO_LINK(io_g0, 6, 2);
> +HSMP_IO_LINK(io_g0, 6, 3);
> +HSMP_IO_LINK(io_g0, 6, 4);
> +HSMP_IO_LINK(io_g0, 6, 5);
> +HSMP_IO_LINK(io_g0, 6, 6);
> +HSMP_IO_LINK(io_g0, 6, 7);
> +HSMP_IO_LINK(io_g1, 7, 0);
> +HSMP_IO_LINK(io_g1, 7, 1);
> +HSMP_IO_LINK(io_g1, 7, 2);
> +HSMP_IO_LINK(io_g1, 7, 3);
> +HSMP_IO_LINK(io_g1, 7, 4);
> +HSMP_IO_LINK(io_g1, 7, 5);
> +HSMP_IO_LINK(io_g1, 7, 6);
> +HSMP_IO_LINK(io_g1, 7, 7);
> +HSMP_IO_LINK(io_g2, 8, 0);
> +HSMP_IO_LINK(io_g2, 8, 1);
> +HSMP_IO_LINK(io_g2, 8, 2);
> +HSMP_IO_LINK(io_g2, 8, 3);
> +HSMP_IO_LINK(io_g2, 8, 4);
> +HSMP_IO_LINK(io_g2, 8, 5);
> +HSMP_IO_LINK(io_g2, 8, 6);
> +HSMP_IO_LINK(io_g2, 8, 7);
> +HSMP_IO_LINK(io_g3, 9, 0);
> +HSMP_IO_LINK(io_g3, 9, 1);
> +HSMP_IO_LINK(io_g3, 9, 2);
> +HSMP_IO_LINK(io_g3, 9, 3);
> +HSMP_IO_LINK(io_g3, 9, 4);
> +HSMP_IO_LINK(io_g3, 9, 5);
> +HSMP_IO_LINK(io_g3, 9, 6);
> +HSMP_IO_LINK(io_g3, 9, 7);
> +HSMP_IO_LINK(io_g4, 10, 0);
> +HSMP_IO_LINK(io_g4, 10, 1);
> +HSMP_IO_LINK(io_g4, 10, 2);
> +HSMP_IO_LINK(io_g4, 10, 3);
> +HSMP_IO_LINK(io_g4, 10, 4);
> +HSMP_IO_LINK(io_g4, 10, 5);
> +HSMP_IO_LINK(io_g4, 10, 6);
> +HSMP_IO_LINK(io_g4, 10, 7);
> +HSMP_IO_LINK(io_g5, 11, 0);
> +HSMP_IO_LINK(io_g5, 11, 1);
> +HSMP_IO_LINK(io_g5, 11, 2);
> +HSMP_IO_LINK(io_g5, 11, 3);
> +HSMP_IO_LINK(io_g5, 11, 4);
> +HSMP_IO_LINK(io_g5, 11, 5);
> +HSMP_IO_LINK(io_g5, 11, 6);
> +HSMP_IO_LINK(io_g5, 11, 7);
> +HSMP_IO_LINK(io_g6, 12, 0);
> +HSMP_IO_LINK(io_g6, 12, 1);
> +HSMP_IO_LINK(io_g6, 12, 2);
> +HSMP_IO_LINK(io_g6, 12, 3);
> +HSMP_IO_LINK(io_g6, 12, 4);
> +HSMP_IO_LINK(io_g6, 12, 5);
> +HSMP_IO_LINK(io_g6, 12, 6);
> +HSMP_IO_LINK(io_g6, 12, 7);
> +HSMP_IO_LINK(io_g7, 13, 0);
> +HSMP_IO_LINK(io_g7, 13, 1);
> +HSMP_IO_LINK(io_g7, 13, 2);
> +HSMP_IO_LINK(io_g7, 13, 3);
> +HSMP_IO_LINK(io_g7, 13, 4);
> +HSMP_IO_LINK(io_g7, 13, 5);
> +HSMP_IO_LINK(io_g7, 13, 6);
> +HSMP_IO_LINK(io_g7, 13, 7);
> +#undef HSMP_IO_LINK
> +#define HSMP_XGMI_AGG(_link, _base, _sock)				\
> +	HSMP_SYS_ATTR_PRIV(xgmi_##_link##_agg_##_sock,			\
> +			   xgmi_##_link##_agg, hsmp_xgmi_link_bw_show,	\
> +			   _sock, HSMP_GET_XGMI_BANDWITH, (_base))
> +#define HSMP_XGMI_RD(_link, _base, _sock)				\
> +	HSMP_SYS_ATTR_PRIV(xgmi_##_link##_rd_##_sock,			\
> +			   xgmi_##_link##_rd, hsmp_xgmi_link_bw_show,	\
> +			   _sock, HSMP_GET_XGMI_BANDWITH, (_base) + 1)
> +#define HSMP_XGMI_WR(_link, _base, _sock)				\
> +	HSMP_SYS_ATTR_PRIV(xgmi_##_link##_wr_##_sock,			\
> +			   xgmi_##_link##_wr, hsmp_xgmi_link_bw_show,	\
> +			   _sock, HSMP_GET_XGMI_BANDWITH, (_base) + 2)
> +
> +HSMP_XGMI_AGG(p0, 0, 0);
> +HSMP_XGMI_RD(p0, 0, 0);
> +HSMP_XGMI_WR(p0, 0, 0);
> +HSMP_XGMI_AGG(p0, 0, 1);
> +HSMP_XGMI_RD(p0, 0, 1);
> +HSMP_XGMI_WR(p0, 0, 1);
> +HSMP_XGMI_AGG(p0, 0, 2);
> +HSMP_XGMI_RD(p0, 0, 2);
> +HSMP_XGMI_WR(p0, 0, 2);
> +HSMP_XGMI_AGG(p0, 0, 3);
> +HSMP_XGMI_RD(p0, 0, 3);
> +HSMP_XGMI_WR(p0, 0, 3);
> +HSMP_XGMI_AGG(p0, 0, 4);
> +HSMP_XGMI_RD(p0, 0, 4);
> +HSMP_XGMI_WR(p0, 0, 4);
> +HSMP_XGMI_AGG(p0, 0, 5);
> +HSMP_XGMI_RD(p0, 0, 5);
> +HSMP_XGMI_WR(p0, 0, 5);
> +HSMP_XGMI_AGG(p0, 0, 6);
> +HSMP_XGMI_RD(p0, 0, 6);
> +HSMP_XGMI_WR(p0, 0, 6);
> +HSMP_XGMI_AGG(p0, 0, 7);
> +HSMP_XGMI_RD(p0, 0, 7);
> +HSMP_XGMI_WR(p0, 0, 7);
> +HSMP_XGMI_AGG(p1, 3, 0);
> +HSMP_XGMI_RD(p1, 3, 0);
> +HSMP_XGMI_WR(p1, 3, 0);
> +HSMP_XGMI_AGG(p1, 3, 1);
> +HSMP_XGMI_RD(p1, 3, 1);
> +HSMP_XGMI_WR(p1, 3, 1);
> +HSMP_XGMI_AGG(p1, 3, 2);
> +HSMP_XGMI_RD(p1, 3, 2);
> +HSMP_XGMI_WR(p1, 3, 2);
> +HSMP_XGMI_AGG(p1, 3, 3);
> +HSMP_XGMI_RD(p1, 3, 3);
> +HSMP_XGMI_WR(p1, 3, 3);
> +HSMP_XGMI_AGG(p1, 3, 4);
> +HSMP_XGMI_RD(p1, 3, 4);
> +HSMP_XGMI_WR(p1, 3, 4);
> +HSMP_XGMI_AGG(p1, 3, 5);
> +HSMP_XGMI_RD(p1, 3, 5);
> +HSMP_XGMI_WR(p1, 3, 5);
> +HSMP_XGMI_AGG(p1, 3, 6);
> +HSMP_XGMI_RD(p1, 3, 6);
> +HSMP_XGMI_WR(p1, 3, 6);
> +HSMP_XGMI_AGG(p1, 3, 7);
> +HSMP_XGMI_RD(p1, 3, 7);
> +HSMP_XGMI_WR(p1, 3, 7);
> +HSMP_XGMI_AGG(p2, 6, 0);
> +HSMP_XGMI_RD(p2, 6, 0);
> +HSMP_XGMI_WR(p2, 6, 0);
> +HSMP_XGMI_AGG(p2, 6, 1);
> +HSMP_XGMI_RD(p2, 6, 1);
> +HSMP_XGMI_WR(p2, 6, 1);
> +HSMP_XGMI_AGG(p2, 6, 2);
> +HSMP_XGMI_RD(p2, 6, 2);
> +HSMP_XGMI_WR(p2, 6, 2);
> +HSMP_XGMI_AGG(p2, 6, 3);
> +HSMP_XGMI_RD(p2, 6, 3);
> +HSMP_XGMI_WR(p2, 6, 3);
> +HSMP_XGMI_AGG(p2, 6, 4);
> +HSMP_XGMI_RD(p2, 6, 4);
> +HSMP_XGMI_WR(p2, 6, 4);
> +HSMP_XGMI_AGG(p2, 6, 5);
> +HSMP_XGMI_RD(p2, 6, 5);
> +HSMP_XGMI_WR(p2, 6, 5);
> +HSMP_XGMI_AGG(p2, 6, 6);
> +HSMP_XGMI_RD(p2, 6, 6);
> +HSMP_XGMI_WR(p2, 6, 6);
> +HSMP_XGMI_AGG(p2, 6, 7);
> +HSMP_XGMI_RD(p2, 6, 7);
> +HSMP_XGMI_WR(p2, 6, 7);
> +HSMP_XGMI_AGG(p3, 9, 0);
> +HSMP_XGMI_RD(p3, 9, 0);
> +HSMP_XGMI_WR(p3, 9, 0);
> +HSMP_XGMI_AGG(p3, 9, 1);
> +HSMP_XGMI_RD(p3, 9, 1);
> +HSMP_XGMI_WR(p3, 9, 1);
> +HSMP_XGMI_AGG(p3, 9, 2);
> +HSMP_XGMI_RD(p3, 9, 2);
> +HSMP_XGMI_WR(p3, 9, 2);
> +HSMP_XGMI_AGG(p3, 9, 3);
> +HSMP_XGMI_RD(p3, 9, 3);
> +HSMP_XGMI_WR(p3, 9, 3);
> +HSMP_XGMI_AGG(p3, 9, 4);
> +HSMP_XGMI_RD(p3, 9, 4);
> +HSMP_XGMI_WR(p3, 9, 4);
> +HSMP_XGMI_AGG(p3, 9, 5);
> +HSMP_XGMI_RD(p3, 9, 5);
> +HSMP_XGMI_WR(p3, 9, 5);
> +HSMP_XGMI_AGG(p3, 9, 6);
> +HSMP_XGMI_RD(p3, 9, 6);
> +HSMP_XGMI_WR(p3, 9, 6);
> +HSMP_XGMI_AGG(p3, 9, 7);
> +HSMP_XGMI_RD(p3, 9, 7);
> +HSMP_XGMI_WR(p3, 9, 7);
> +HSMP_XGMI_AGG(p4, 12, 0);
> +HSMP_XGMI_RD(p4, 12, 0);
> +HSMP_XGMI_WR(p4, 12, 0);
> +HSMP_XGMI_AGG(p4, 12, 1);
> +HSMP_XGMI_RD(p4, 12, 1);
> +HSMP_XGMI_WR(p4, 12, 1);
> +HSMP_XGMI_AGG(p4, 12, 2);
> +HSMP_XGMI_RD(p4, 12, 2);
> +HSMP_XGMI_WR(p4, 12, 2);
> +HSMP_XGMI_AGG(p4, 12, 3);
> +HSMP_XGMI_RD(p4, 12, 3);
> +HSMP_XGMI_WR(p4, 12, 3);
> +HSMP_XGMI_AGG(p4, 12, 4);
> +HSMP_XGMI_RD(p4, 12, 4);
> +HSMP_XGMI_WR(p4, 12, 4);
> +HSMP_XGMI_AGG(p4, 12, 5);
> +HSMP_XGMI_RD(p4, 12, 5);
> +HSMP_XGMI_WR(p4, 12, 5);
> +HSMP_XGMI_AGG(p4, 12, 6);
> +HSMP_XGMI_RD(p4, 12, 6);
> +HSMP_XGMI_WR(p4, 12, 6);
> +HSMP_XGMI_AGG(p4, 12, 7);
> +HSMP_XGMI_RD(p4, 12, 7);
> +HSMP_XGMI_WR(p4, 12, 7);
> +HSMP_XGMI_AGG(p5, 15, 0);
> +HSMP_XGMI_RD(p5, 15, 0);
> +HSMP_XGMI_WR(p5, 15, 0);
> +HSMP_XGMI_AGG(p5, 15, 1);
> +HSMP_XGMI_RD(p5, 15, 1);
> +HSMP_XGMI_WR(p5, 15, 1);
> +HSMP_XGMI_AGG(p5, 15, 2);
> +HSMP_XGMI_RD(p5, 15, 2);
> +HSMP_XGMI_WR(p5, 15, 2);
> +HSMP_XGMI_AGG(p5, 15, 3);
> +HSMP_XGMI_RD(p5, 15, 3);
> +HSMP_XGMI_WR(p5, 15, 3);
> +HSMP_XGMI_AGG(p5, 15, 4);
> +HSMP_XGMI_RD(p5, 15, 4);
> +HSMP_XGMI_WR(p5, 15, 4);
> +HSMP_XGMI_AGG(p5, 15, 5);
> +HSMP_XGMI_RD(p5, 15, 5);
> +HSMP_XGMI_WR(p5, 15, 5);
> +HSMP_XGMI_AGG(p5, 15, 6);
> +HSMP_XGMI_RD(p5, 15, 6);
> +HSMP_XGMI_WR(p5, 15, 6);
> +HSMP_XGMI_AGG(p5, 15, 7);
> +HSMP_XGMI_RD(p5, 15, 7);
> +HSMP_XGMI_WR(p5, 15, 7);
> +HSMP_XGMI_AGG(g0, 18, 0);
> +HSMP_XGMI_RD(g0, 18, 0);
> +HSMP_XGMI_WR(g0, 18, 0);
> +HSMP_XGMI_AGG(g0, 18, 1);
> +HSMP_XGMI_RD(g0, 18, 1);
> +HSMP_XGMI_WR(g0, 18, 1);
> +HSMP_XGMI_AGG(g0, 18, 2);
> +HSMP_XGMI_RD(g0, 18, 2);
> +HSMP_XGMI_WR(g0, 18, 2);
> +HSMP_XGMI_AGG(g0, 18, 3);
> +HSMP_XGMI_RD(g0, 18, 3);
> +HSMP_XGMI_WR(g0, 18, 3);
> +HSMP_XGMI_AGG(g0, 18, 4);
> +HSMP_XGMI_RD(g0, 18, 4);
> +HSMP_XGMI_WR(g0, 18, 4);
> +HSMP_XGMI_AGG(g0, 18, 5);
> +HSMP_XGMI_RD(g0, 18, 5);
> +HSMP_XGMI_WR(g0, 18, 5);
> +HSMP_XGMI_AGG(g0, 18, 6);
> +HSMP_XGMI_RD(g0, 18, 6);
> +HSMP_XGMI_WR(g0, 18, 6);
> +HSMP_XGMI_AGG(g0, 18, 7);
> +HSMP_XGMI_RD(g0, 18, 7);
> +HSMP_XGMI_WR(g0, 18, 7);
> +HSMP_XGMI_AGG(g1, 21, 0);
> +HSMP_XGMI_RD(g1, 21, 0);
> +HSMP_XGMI_WR(g1, 21, 0);
> +HSMP_XGMI_AGG(g1, 21, 1);
> +HSMP_XGMI_RD(g1, 21, 1);
> +HSMP_XGMI_WR(g1, 21, 1);
> +HSMP_XGMI_AGG(g1, 21, 2);
> +HSMP_XGMI_RD(g1, 21, 2);
> +HSMP_XGMI_WR(g1, 21, 2);
> +HSMP_XGMI_AGG(g1, 21, 3);
> +HSMP_XGMI_RD(g1, 21, 3);
> +HSMP_XGMI_WR(g1, 21, 3);
> +HSMP_XGMI_AGG(g1, 21, 4);
> +HSMP_XGMI_RD(g1, 21, 4);
> +HSMP_XGMI_WR(g1, 21, 4);
> +HSMP_XGMI_AGG(g1, 21, 5);
> +HSMP_XGMI_RD(g1, 21, 5);
> +HSMP_XGMI_WR(g1, 21, 5);
> +HSMP_XGMI_AGG(g1, 21, 6);
> +HSMP_XGMI_RD(g1, 21, 6);
> +HSMP_XGMI_WR(g1, 21, 6);
> +HSMP_XGMI_AGG(g1, 21, 7);
> +HSMP_XGMI_RD(g1, 21, 7);
> +HSMP_XGMI_WR(g1, 21, 7);
> +HSMP_XGMI_AGG(g2, 24, 0);
> +HSMP_XGMI_RD(g2, 24, 0);
> +HSMP_XGMI_WR(g2, 24, 0);
> +HSMP_XGMI_AGG(g2, 24, 1);
> +HSMP_XGMI_RD(g2, 24, 1);
> +HSMP_XGMI_WR(g2, 24, 1);
> +HSMP_XGMI_AGG(g2, 24, 2);
> +HSMP_XGMI_RD(g2, 24, 2);
> +HSMP_XGMI_WR(g2, 24, 2);
> +HSMP_XGMI_AGG(g2, 24, 3);
> +HSMP_XGMI_RD(g2, 24, 3);
> +HSMP_XGMI_WR(g2, 24, 3);
> +HSMP_XGMI_AGG(g2, 24, 4);
> +HSMP_XGMI_RD(g2, 24, 4);
> +HSMP_XGMI_WR(g2, 24, 4);
> +HSMP_XGMI_AGG(g2, 24, 5);
> +HSMP_XGMI_RD(g2, 24, 5);
> +HSMP_XGMI_WR(g2, 24, 5);
> +HSMP_XGMI_AGG(g2, 24, 6);
> +HSMP_XGMI_RD(g2, 24, 6);
> +HSMP_XGMI_WR(g2, 24, 6);
> +HSMP_XGMI_AGG(g2, 24, 7);
> +HSMP_XGMI_RD(g2, 24, 7);
> +HSMP_XGMI_WR(g2, 24, 7);
> +HSMP_XGMI_AGG(g3, 27, 0);
> +HSMP_XGMI_RD(g3, 27, 0);
> +HSMP_XGMI_WR(g3, 27, 0);
> +HSMP_XGMI_AGG(g3, 27, 1);
> +HSMP_XGMI_RD(g3, 27, 1);
> +HSMP_XGMI_WR(g3, 27, 1);
> +HSMP_XGMI_AGG(g3, 27, 2);
> +HSMP_XGMI_RD(g3, 27, 2);
> +HSMP_XGMI_WR(g3, 27, 2);
> +HSMP_XGMI_AGG(g3, 27, 3);
> +HSMP_XGMI_RD(g3, 27, 3);
> +HSMP_XGMI_WR(g3, 27, 3);
> +HSMP_XGMI_AGG(g3, 27, 4);
> +HSMP_XGMI_RD(g3, 27, 4);
> +HSMP_XGMI_WR(g3, 27, 4);
> +HSMP_XGMI_AGG(g3, 27, 5);
> +HSMP_XGMI_RD(g3, 27, 5);
> +HSMP_XGMI_WR(g3, 27, 5);
> +HSMP_XGMI_AGG(g3, 27, 6);
> +HSMP_XGMI_RD(g3, 27, 6);
> +HSMP_XGMI_WR(g3, 27, 6);
> +HSMP_XGMI_AGG(g3, 27, 7);
> +HSMP_XGMI_RD(g3, 27, 7);
> +HSMP_XGMI_WR(g3, 27, 7);
> +HSMP_XGMI_AGG(g4, 30, 0);
> +HSMP_XGMI_RD(g4, 30, 0);
> +HSMP_XGMI_WR(g4, 30, 0);
> +HSMP_XGMI_AGG(g4, 30, 1);
> +HSMP_XGMI_RD(g4, 30, 1);
> +HSMP_XGMI_WR(g4, 30, 1);
> +HSMP_XGMI_AGG(g4, 30, 2);
> +HSMP_XGMI_RD(g4, 30, 2);
> +HSMP_XGMI_WR(g4, 30, 2);
> +HSMP_XGMI_AGG(g4, 30, 3);
> +HSMP_XGMI_RD(g4, 30, 3);
> +HSMP_XGMI_WR(g4, 30, 3);
> +HSMP_XGMI_AGG(g4, 30, 4);
> +HSMP_XGMI_RD(g4, 30, 4);
> +HSMP_XGMI_WR(g4, 30, 4);
> +HSMP_XGMI_AGG(g4, 30, 5);
> +HSMP_XGMI_RD(g4, 30, 5);
> +HSMP_XGMI_WR(g4, 30, 5);
> +HSMP_XGMI_AGG(g4, 30, 6);
> +HSMP_XGMI_RD(g4, 30, 6);
> +HSMP_XGMI_WR(g4, 30, 6);
> +HSMP_XGMI_AGG(g4, 30, 7);
> +HSMP_XGMI_RD(g4, 30, 7);
> +HSMP_XGMI_WR(g4, 30, 7);
> +HSMP_XGMI_AGG(g5, 33, 0);
> +HSMP_XGMI_RD(g5, 33, 0);
> +HSMP_XGMI_WR(g5, 33, 0);
> +HSMP_XGMI_AGG(g5, 33, 1);
> +HSMP_XGMI_RD(g5, 33, 1);
> +HSMP_XGMI_WR(g5, 33, 1);
> +HSMP_XGMI_AGG(g5, 33, 2);
> +HSMP_XGMI_RD(g5, 33, 2);
> +HSMP_XGMI_WR(g5, 33, 2);
> +HSMP_XGMI_AGG(g5, 33, 3);
> +HSMP_XGMI_RD(g5, 33, 3);
> +HSMP_XGMI_WR(g5, 33, 3);
> +HSMP_XGMI_AGG(g5, 33, 4);
> +HSMP_XGMI_RD(g5, 33, 4);
> +HSMP_XGMI_WR(g5, 33, 4);
> +HSMP_XGMI_AGG(g5, 33, 5);
> +HSMP_XGMI_RD(g5, 33, 5);
> +HSMP_XGMI_WR(g5, 33, 5);
> +HSMP_XGMI_AGG(g5, 33, 6);
> +HSMP_XGMI_RD(g5, 33, 6);
> +HSMP_XGMI_WR(g5, 33, 6);
> +HSMP_XGMI_AGG(g5, 33, 7);
> +HSMP_XGMI_RD(g5, 33, 7);
> +HSMP_XGMI_WR(g5, 33, 7);
> +HSMP_XGMI_AGG(g6, 36, 0);
> +HSMP_XGMI_RD(g6, 36, 0);
> +HSMP_XGMI_WR(g6, 36, 0);
> +HSMP_XGMI_AGG(g6, 36, 1);
> +HSMP_XGMI_RD(g6, 36, 1);
> +HSMP_XGMI_WR(g6, 36, 1);
> +HSMP_XGMI_AGG(g6, 36, 2);
> +HSMP_XGMI_RD(g6, 36, 2);
> +HSMP_XGMI_WR(g6, 36, 2);
> +HSMP_XGMI_AGG(g6, 36, 3);
> +HSMP_XGMI_RD(g6, 36, 3);
> +HSMP_XGMI_WR(g6, 36, 3);
> +HSMP_XGMI_AGG(g6, 36, 4);
> +HSMP_XGMI_RD(g6, 36, 4);
> +HSMP_XGMI_WR(g6, 36, 4);
> +HSMP_XGMI_AGG(g6, 36, 5);
> +HSMP_XGMI_RD(g6, 36, 5);
> +HSMP_XGMI_WR(g6, 36, 5);
> +HSMP_XGMI_AGG(g6, 36, 6);
> +HSMP_XGMI_RD(g6, 36, 6);
> +HSMP_XGMI_WR(g6, 36, 6);
> +HSMP_XGMI_AGG(g6, 36, 7);
> +HSMP_XGMI_RD(g6, 36, 7);
> +HSMP_XGMI_WR(g6, 36, 7);
> +HSMP_XGMI_AGG(g7, 39, 0);
> +HSMP_XGMI_RD(g7, 39, 0);
> +HSMP_XGMI_WR(g7, 39, 0);
> +HSMP_XGMI_AGG(g7, 39, 1);
> +HSMP_XGMI_RD(g7, 39, 1);
> +HSMP_XGMI_WR(g7, 39, 1);
> +HSMP_XGMI_AGG(g7, 39, 2);
> +HSMP_XGMI_RD(g7, 39, 2);
> +HSMP_XGMI_WR(g7, 39, 2);
> +HSMP_XGMI_AGG(g7, 39, 3);
> +HSMP_XGMI_RD(g7, 39, 3);
> +HSMP_XGMI_WR(g7, 39, 3);
> +HSMP_XGMI_AGG(g7, 39, 4);
> +HSMP_XGMI_RD(g7, 39, 4);
> +HSMP_XGMI_WR(g7, 39, 4);
> +HSMP_XGMI_AGG(g7, 39, 5);
> +HSMP_XGMI_RD(g7, 39, 5);
> +HSMP_XGMI_WR(g7, 39, 5);
> +HSMP_XGMI_AGG(g7, 39, 6);
> +HSMP_XGMI_RD(g7, 39, 6);
> +HSMP_XGMI_WR(g7, 39, 6);
> +HSMP_XGMI_AGG(g7, 39, 7);
> +HSMP_XGMI_RD(g7, 39, 7);
> +HSMP_XGMI_WR(g7, 39, 7);
> +#undef HSMP_XGMI_AGG
> +#undef HSMP_XGMI_RD
> +#undef HSMP_XGMI_WR
>  HSMP_DEV_ATTR_X8(socket_power, HSMP_GET_SOCKET_POWER, hsmp_msg_resp32_show,
>  		 0444);
>  HSMP_DEV_ATTR_W_X8(cclk_boost_limit, HSMP_SET_BOOST_LIMIT_SOCKET,
> @@ -544,6 +1014,174 @@ static const struct attribute_group *hsmp_sock_lclk_grps[] = {
>  	&sock7_lclk_grp,
>  };
>  
> +#define HSMP_IO_BW_LIST(_s)						\
> +static struct attribute *sock##_s##_iobw_attrs[] = {			\
> +	&hattr_io_p0_##_s.dattr.attr,					\
> +	&hattr_io_p1_##_s.dattr.attr,					\
> +	&hattr_io_p2_##_s.dattr.attr,					\
> +	&hattr_io_p3_##_s.dattr.attr,					\
> +	&hattr_io_p4_##_s.dattr.attr,					\
> +	&hattr_io_p5_##_s.dattr.attr,					\
> +	&hattr_io_g0_##_s.dattr.attr,					\
> +	&hattr_io_g1_##_s.dattr.attr,					\
> +	&hattr_io_g2_##_s.dattr.attr,					\
> +	&hattr_io_g3_##_s.dattr.attr,					\
> +	&hattr_io_g4_##_s.dattr.attr,					\
> +	&hattr_io_g5_##_s.dattr.attr,					\
> +	&hattr_io_g6_##_s.dattr.attr,					\
> +	&hattr_io_g7_##_s.dattr.attr,					\
> +	NULL								\
> +}
> +
> +HSMP_IO_BW_LIST(0);
> +HSMP_IO_BW_LIST(1);
> +HSMP_IO_BW_LIST(2);
> +HSMP_IO_BW_LIST(3);
> +HSMP_IO_BW_LIST(4);
> +HSMP_IO_BW_LIST(5);
> +HSMP_IO_BW_LIST(6);
> +HSMP_IO_BW_LIST(7);
> +#undef HSMP_IO_BW_LIST
> +
> +static umode_t hsmp_plat_io_bw_is_visible(struct kobject *kobj __always_unused,
> +					  struct attribute *attr, int id)
> +{
> +	struct device_attribute *dattr = container_of(attr, struct device_attribute, attr);
> +	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(dattr);
> +	struct hsmp_socket *sock = NULL;
> +
> +	if (hsmp_pdev && hattr->sock_ind < hsmp_pdev->num_sockets)
> +		sock = &hsmp_pdev->sock[hattr->sock_ind];
> +
> +	return hsmp_io_bw_file_visible(sock, id);
> +}
> +
> +#define HSMP_IO_BW_GRP(index)						\
> +static const struct attribute_group sock##index##_iobw_grp = {		\
> +	.name = "io_bw",						\
> +	.attrs = sock##index##_iobw_attrs,				\
> +	.is_visible = hsmp_plat_io_bw_is_visible,			\
> +}
> +
> +HSMP_IO_BW_GRP(0);
> +HSMP_IO_BW_GRP(1);
> +HSMP_IO_BW_GRP(2);
> +HSMP_IO_BW_GRP(3);
> +HSMP_IO_BW_GRP(4);
> +HSMP_IO_BW_GRP(5);
> +HSMP_IO_BW_GRP(6);
> +HSMP_IO_BW_GRP(7);
> +#undef HSMP_IO_BW_GRP
> +
> +static const struct attribute_group *hsmp_sock_iobw_grps[] = {
> +	&sock0_iobw_grp,
> +	&sock1_iobw_grp,
> +	&sock2_iobw_grp,
> +	&sock3_iobw_grp,
> +	&sock4_iobw_grp,
> +	&sock5_iobw_grp,
> +	&sock6_iobw_grp,
> +	&sock7_iobw_grp,
> +};
> +
> +#define HSMP_XGMI_BW_LIST(_s)						\
> +static struct attribute *sock##_s##_xgmibw_attrs[] = {			\
> +	&hattr_xgmi_p0_agg_##_s.dattr.attr,				\
> +	&hattr_xgmi_p0_rd_##_s.dattr.attr,				\
> +	&hattr_xgmi_p0_wr_##_s.dattr.attr,				\
> +	&hattr_xgmi_p1_agg_##_s.dattr.attr,				\
> +	&hattr_xgmi_p1_rd_##_s.dattr.attr,				\
> +	&hattr_xgmi_p1_wr_##_s.dattr.attr,				\
> +	&hattr_xgmi_p2_agg_##_s.dattr.attr,				\
> +	&hattr_xgmi_p2_rd_##_s.dattr.attr,				\
> +	&hattr_xgmi_p2_wr_##_s.dattr.attr,				\
> +	&hattr_xgmi_p3_agg_##_s.dattr.attr,				\
> +	&hattr_xgmi_p3_rd_##_s.dattr.attr,				\
> +	&hattr_xgmi_p3_wr_##_s.dattr.attr,				\
> +	&hattr_xgmi_p4_agg_##_s.dattr.attr,				\
> +	&hattr_xgmi_p4_rd_##_s.dattr.attr,				\
> +	&hattr_xgmi_p4_wr_##_s.dattr.attr,				\
> +	&hattr_xgmi_p5_agg_##_s.dattr.attr,				\
> +	&hattr_xgmi_p5_rd_##_s.dattr.attr,				\
> +	&hattr_xgmi_p5_wr_##_s.dattr.attr,				\
> +	&hattr_xgmi_g0_agg_##_s.dattr.attr,				\
> +	&hattr_xgmi_g0_rd_##_s.dattr.attr,				\
> +	&hattr_xgmi_g0_wr_##_s.dattr.attr,				\
> +	&hattr_xgmi_g1_agg_##_s.dattr.attr,				\
> +	&hattr_xgmi_g1_rd_##_s.dattr.attr,				\
> +	&hattr_xgmi_g1_wr_##_s.dattr.attr,				\
> +	&hattr_xgmi_g2_agg_##_s.dattr.attr,				\
> +	&hattr_xgmi_g2_rd_##_s.dattr.attr,				\
> +	&hattr_xgmi_g2_wr_##_s.dattr.attr,				\
> +	&hattr_xgmi_g3_agg_##_s.dattr.attr,				\
> +	&hattr_xgmi_g3_rd_##_s.dattr.attr,				\
> +	&hattr_xgmi_g3_wr_##_s.dattr.attr,				\
> +	&hattr_xgmi_g4_agg_##_s.dattr.attr,				\
> +	&hattr_xgmi_g4_rd_##_s.dattr.attr,				\
> +	&hattr_xgmi_g4_wr_##_s.dattr.attr,				\
> +	&hattr_xgmi_g5_agg_##_s.dattr.attr,				\
> +	&hattr_xgmi_g5_rd_##_s.dattr.attr,				\
> +	&hattr_xgmi_g5_wr_##_s.dattr.attr,				\
> +	&hattr_xgmi_g6_agg_##_s.dattr.attr,				\
> +	&hattr_xgmi_g6_rd_##_s.dattr.attr,				\
> +	&hattr_xgmi_g6_wr_##_s.dattr.attr,				\
> +	&hattr_xgmi_g7_agg_##_s.dattr.attr,				\
> +	&hattr_xgmi_g7_rd_##_s.dattr.attr,				\
> +	&hattr_xgmi_g7_wr_##_s.dattr.attr,				\
> +	NULL								\
> +}
> +
> +HSMP_XGMI_BW_LIST(0);
> +HSMP_XGMI_BW_LIST(1);
> +HSMP_XGMI_BW_LIST(2);
> +HSMP_XGMI_BW_LIST(3);
> +HSMP_XGMI_BW_LIST(4);
> +HSMP_XGMI_BW_LIST(5);
> +HSMP_XGMI_BW_LIST(6);
> +HSMP_XGMI_BW_LIST(7);
> +#undef HSMP_XGMI_BW_LIST
> +
> +static umode_t hsmp_plat_xgmi_bw_is_visible(struct kobject *kobj __always_unused,
> +					    struct attribute *attr, int id)
> +{
> +	struct device_attribute *dattr = container_of(attr, struct device_attribute, attr);
> +	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(dattr);
> +	struct hsmp_socket *sock = NULL;
> +
> +	if (hsmp_pdev && hattr->sock_ind < hsmp_pdev->num_sockets)
> +		sock = &hsmp_pdev->sock[hattr->sock_ind];
> +
> +	return hsmp_xgmi_bw_file_visible(sock, id);
> +}
> +
> +#define HSMP_XGMI_BW_GRP(index)						\
> +static const struct attribute_group sock##index##_xgmibw_grp = {	\
> +	.name = "xgmi_bw",						\
> +	.attrs = sock##index##_xgmibw_attrs,				\
> +	.is_visible = hsmp_plat_xgmi_bw_is_visible,			\
> +}
> +
> +HSMP_XGMI_BW_GRP(0);
> +HSMP_XGMI_BW_GRP(1);
> +HSMP_XGMI_BW_GRP(2);
> +HSMP_XGMI_BW_GRP(3);
> +HSMP_XGMI_BW_GRP(4);
> +HSMP_XGMI_BW_GRP(5);
> +HSMP_XGMI_BW_GRP(6);
> +HSMP_XGMI_BW_GRP(7);
> +#undef HSMP_XGMI_BW_GRP
> +
> +static const struct attribute_group *hsmp_sock_xgmibw_grps[] = {
> +	&sock0_xgmibw_grp,
> +	&sock1_xgmibw_grp,
> +	&sock2_xgmibw_grp,
> +	&sock3_xgmibw_grp,
> +	&sock4_xgmibw_grp,
> +	&sock5_xgmibw_grp,
> +	&sock6_xgmibw_grp,
> +	&sock7_xgmibw_grp,
> +};
> +
>  static inline bool is_f1a_m0h(void)
>  {
>  	if (boot_cpu_data.x86 == 0x1A && boot_cpu_data.x86_model <= 0x0F)
> @@ -603,6 +1241,9 @@ static int init_platform_device(struct device *dev)
>  				dev_err(dev, "Failed to get enabled HSMP messages on this platform\n");
>  				return ret;
>  			}
> +
> +			hsmp_scan_io_bw(sock);
> +			hsmp_scan_xgmi_bw(sock);
>  		}
>  
>  		if (sock->proto_ver == HSMP_PROTO_VER6) {
> @@ -681,6 +1322,8 @@ static void hsmp_remove_plat_sock_kobjs(void)
>  		if (!hsmp_plat_sock_kobj[i])
>  			continue;
>  
> +		sysfs_remove_group(hsmp_plat_sock_kobj[i], hsmp_sock_xgmibw_grps[i]);
> +		sysfs_remove_group(hsmp_plat_sock_kobj[i], hsmp_sock_iobw_grps[i]);
>  		sysfs_remove_group(hsmp_plat_sock_kobj[i], hsmp_sock_lclk_grps[i]);
>  		sysfs_remove_group(hsmp_plat_sock_kobj[i], hsmp_sock_attr_grps[i]);
>  		kobject_put(hsmp_plat_sock_kobj[i]);
> @@ -700,9 +1343,9 @@ static int hsmp_create_socket_sysfs(struct device *dev)
>  	}
>  
>  	/*
> -	 * socketN is a kobject so it can hold both the socket attributes and
> -	 * an lclk_dpm_range/ subdirectory. Attribute groups can only add one
> -	 * directory level under a kobject.
> +	 * socketN is a kobject so it can hold the socket attributes and the
> +	 * nested lclk_dpm_range, io_bw, and xgmi_bw directories. Attribute
> +	 * groups add one directory level under that kobject.
>  	 */
>  	for (i = 0; i < hsmp_pdev->num_sockets; i++) {
>  		hsmp_plat_sock_kobj[i] = kobject_create_and_add(hsmp_plat_sock_names[i],
> @@ -735,6 +1378,35 @@ static int hsmp_create_socket_sysfs(struct device *dev)
>  			hsmp_plat_sock_kobj[i] = NULL;
>  			goto err;
>  		}
> +
> +		ret = sysfs_create_group(hsmp_plat_sock_kobj[i],
> +					 hsmp_sock_iobw_grps[i]);
> +		if (ret) {
> +			dev_err(dev, "Failed to create %s io_bw attributes\n",
> +				hsmp_plat_sock_names[i]);
> +			sysfs_remove_group(hsmp_plat_sock_kobj[i],
> +					   hsmp_sock_lclk_grps[i]);
> +			sysfs_remove_group(hsmp_plat_sock_kobj[i],
> +					   hsmp_sock_attr_grps[i]);
> +			kobject_put(hsmp_plat_sock_kobj[i]);
> +			hsmp_plat_sock_kobj[i] = NULL;
> +			goto err;
> +		}
> +		ret = sysfs_create_group(hsmp_plat_sock_kobj[i],
> +					 hsmp_sock_xgmibw_grps[i]);
> +		if (ret) {
> +			dev_err(dev, "Failed to create %s xgmi_bw attributes\n",
> +				hsmp_plat_sock_names[i]);
> +			sysfs_remove_group(hsmp_plat_sock_kobj[i],
> +					   hsmp_sock_iobw_grps[i]);
> +			sysfs_remove_group(hsmp_plat_sock_kobj[i],
> +					   hsmp_sock_lclk_grps[i]);
> +			sysfs_remove_group(hsmp_plat_sock_kobj[i],
> +					   hsmp_sock_attr_grps[i]);
> +			kobject_put(hsmp_plat_sock_kobj[i]);
> +			hsmp_plat_sock_kobj[i] = NULL;
> +			goto err;
> +		}
>  	}
>  
>  	return 0;
> diff --git a/drivers/platform/x86/amd/hsmp/sysfs.c b/drivers/platform/x86/amd/hsmp/sysfs.c
> index 77bb9c70c1c7f..73010a889eaca 100644
> --- a/drivers/platform/x86/amd/hsmp/sysfs.c
> +++ b/drivers/platform/x86/amd/hsmp/sysfs.c
> @@ -986,6 +986,100 @@ ssize_t hsmp_pcie_link_rate_store(struct device *dev,
>  	return count;
>  }
>  
> +
> +/* IO link bandwidth. priv is the io_bw attribute index. */
> +ssize_t hsmp_io_link_bw_show(struct device *dev, struct device_attribute *attr,
> +			     char *buf)
> +{
> +	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> +	struct hsmp_message msg = {};
> +	u16 sock_ind, enc;
> +	int ret;
> +
> +	sock_ind = hsmp_sysfs_sock_ind(dev, hattr);
> +	if (sock_ind == U16_MAX)
> +		return -EINVAL;
> +
> +	ret = hsmp_io_link_encode(hattr->priv, &enc);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * HSMP_GET_IOLINK_BANDWITH: link encoding in [15:8], aggregate
> +	 * bandwidth type 1 in [2:0]. Output is bandwidth in Mbps.
> +	 */
> +	msg.msg_id = HSMP_GET_IOLINK_BANDWITH;
> +	msg.sock_ind = sock_ind;
> +	msg.num_args = 1;
> +	msg.response_sz = 1;
> +	msg.args[0] = 1 | ((u32)enc << 8);

FIELD_PREP()

> +
> +	ret = hsmp_send_message(&msg);
> +	if (ret)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%u\n", msg.args[0]);
> +}
> +
> +umode_t hsmp_io_bw_file_visible(const struct hsmp_socket *sock, int id)
> +{
> +	if (!sock || is_client_platform() ||
> +	    !is_read_msg_enabled(sock, HSMP_GET_IOLINK_BANDWITH) ||
> +	    !sock->io_bw_valid)
> +		return id ? 0 : SYSFS_GROUP_INVISIBLE;
> +
> +	if (id < 0 || id >= HSMP_IO_LINK_COUNT)
> +		return 0;
> +
> +	return (sock->io_bw_valid & BIT(id)) ? 0444 : 0;
> +}
> +
> +/* xGMI link bandwidth. priv is link * 3 + type (agg, rd, wr). */
> +ssize_t hsmp_xgmi_link_bw_show(struct device *dev, struct device_attribute *attr,
> +			       char *buf)
> +{
> +	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> +	struct hsmp_message msg = {};
> +	u16 sock_ind;
> +	int ret;
> +
> +	sock_ind = hsmp_sysfs_sock_ind(dev, hattr);
> +	if (sock_ind == U16_MAX)
> +		return -EINVAL;
> +
> +	/*
> +	 * HSMP_GET_XGMI_BANDWITH: link encoding in [15:8], bandwidth
> +	 * type in [2:0]. Output is bandwidth in Mbps.
> +	 */
> +	ret = hsmp_xgmi_bw_arg(hattr->priv, &msg.args[0]);
> +	if (ret)
> +		return ret;
> +
> +	msg.msg_id = HSMP_GET_XGMI_BANDWITH;
> +	msg.sock_ind = sock_ind;
> +	msg.num_args = 1;
> +	msg.response_sz = 1;
> +
> +	ret = hsmp_send_message(&msg);
> +	if (ret)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%u\n", msg.args[0]);
> +}
> +
> +umode_t hsmp_xgmi_bw_file_visible(const struct hsmp_socket *sock, int id)
> +{
> +	if (!sock || is_client_platform() ||
> +	    !is_read_msg_enabled(sock, HSMP_GET_XGMI_BANDWITH) ||
> +	    !sock->xgmi_bw_valid)
> +		return id ? 0 : SYSFS_GROUP_INVISIBLE;
> +
> +	if (id < 0 || id >= HSMP_XGMI_BW_COUNT)
> +		return 0;
> +
> +	return (sock->xgmi_bw_valid & BIT_ULL(id)) ? 0444 : 0;
> +}
> +
>  static ssize_t hsmp_lclk_nbio_show(struct device *dev,
>  				   struct device_attribute *attr,
>  				   u8 nbio_id, char *buf)
> diff --git a/drivers/platform/x86/amd/hsmp/sysfs.h b/drivers/platform/x86/amd/hsmp/sysfs.h
> index eb364fbc338bd..83358304da97b 100644
> --- a/drivers/platform/x86/amd/hsmp/sysfs.h
> +++ b/drivers/platform/x86/amd/hsmp/sysfs.h
> @@ -23,6 +23,7 @@ struct hsmp_sys_attr {
>  	u16 sock_ind;
>  	u32 msg_id;	/* message ID used for read / GET enable checks */
>  	u32 wr_msg_id;	/* message ID used for write / SET enable checks */
> +	unsigned int priv;
>  };
>  
>  #define DDR_MAX_BW_MASK		GENMASK(31, 20)
> @@ -52,6 +53,16 @@ static struct hsmp_sys_attr hattr_##_var = {				\
>  	.wr_msg_id = _wr_msg_id,					\
>  }
>  
> +/* Read-only attribute with a private index in @priv. */
> +#define HSMP_SYS_ATTR_PRIV(_var, _name, _show, _sock_ind, _msg_id, _priv) \
> +static struct hsmp_sys_attr hattr_##_var = {				\
> +	.dattr = __ATTR(_name, 0444, _show, NULL),			\
> +	.sock_ind = _sock_ind,						\
> +	.msg_id = _msg_id,						\
> +	.wr_msg_id = _msg_id,						\
> +	.priv = _priv,							\
> +}
> +
>  ssize_t hsmp_msg_resp32_show(struct device *dev, struct device_attribute *attr,
>  			     char *buf);
>  ssize_t hsmp_msg_resp32_hex_show(struct device *dev, struct device_attribute *attr,
> @@ -141,6 +152,13 @@ ssize_t hsmp_lclk_3_show(struct device *dev, struct device_attribute *attr,
>  			 char *buf);
>  ssize_t hsmp_lclk_3_store(struct device *dev, struct device_attribute *attr,
>  			  const char *buf, size_t count);
> +ssize_t hsmp_io_link_bw_show(struct device *dev, struct device_attribute *attr,
> +			     char *buf);
> +umode_t hsmp_io_bw_file_visible(const struct hsmp_socket *sock, int id);
> +ssize_t hsmp_xgmi_link_bw_show(struct device *dev, struct device_attribute *attr,
> +			       char *buf);
> +umode_t hsmp_xgmi_bw_file_visible(const struct hsmp_socket *sock, int id);
> +
>  
>  void hsmp_create_per_cpu_kobjects(struct device *dev, struct kobject *cpu_parent,
>  				  struct hsmp_socket *sock);
> 

-- 
 i.


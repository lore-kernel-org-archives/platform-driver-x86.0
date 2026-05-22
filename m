Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE9F3E8C78;
	Fri, 22 May 2026 11:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779450265; cv=none; b=Bj2XtiuMWx5OFXbkfSUPfRtO0I7/RsJxJeewfuRkOmubUAEQQOlSR5didGXVdAFB4uJeFkOSFIw6H/SBJDk2I5HDE15PbC9KsregxfivvzP7jof/k48ZvHmE+Bzk85om4DGS7aoFBYvicjKKW8KDS/D64ODXDHb+Fw7BqGyhGAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779450265; c=relaxed/simple;
	bh=NuTx8Q59ezZasu1FWxy+LOgzWmcRdbNCGK86c4V2Qf0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=r4JMGgyxLzO2bVcmrOU7JNOlWTVZa8QPneCeuC+QfdjnIgqA4BUb+1ja0PNbFrpGLwAjsJ1PBZwnO029QFuvC8I3/+iXR4elSpLlFPOPMNYBLeFzlfrBxIwZDsc/kDyz9Hm+EZRCv4onAO3zOxvx8jJ1+u8/Wi/nt9zoidQ0fzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FX+gkTRW; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FX+gkTRW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779450263; x=1810986263;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=NuTx8Q59ezZasu1FWxy+LOgzWmcRdbNCGK86c4V2Qf0=;
  b=FX+gkTRWxkouChtP0FDRESaVAUK9hW7pcK9ky4WrszG+gPgoGPHoT4sZ
   ggEjnZZQvgzeIR3yJqEQ/p5g/rFynwpxT5DBKBYOWiuPVo1yIKQqERI84
   dGGd74yuUJEU5I/Wr5giWYxlFSJgmuc5cpM7INvUZkWtZxgvC9ZgFNwF6
   goZiOaTRKG+Nt2ipT1e2UUpPXmusGdiUkyO/JhtohoxWYQrvA1YLe8SSX
   EyT3tgOYU8fZpeQHCA3uxOzHtiWv2FY5IVOm/ER/w34QYGnxLQPL3FUZ1
   SMLxISC4DF5+MO+5c/A6y5IEEfqGKgOr1eNcQwxcGkq79JLOwg5CnkSCi
   Q==;
X-CSE-ConnectionGUID: epws2EfQR16Jfn8thysyZQ==
X-CSE-MsgGUID: uV8Qvh9SRqyAZiV67He1DQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="80348015"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="80348015"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 04:44:21 -0700
X-CSE-ConnectionGUID: 5iAk1Ax2RBytcYGrNYHI2g==
X-CSE-MsgGUID: do9c5xRAR72f7MmQqc1bNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="237851993"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.16])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 04:44:18 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 22 May 2026 14:44:15 +0300 (EEST)
To: Muralidhara M K <muralidhara.mk@amd.com>
cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Subject: Re: [PATCH v3 6/7] platform/x86/amd/hsmp: Drop ACPI sysfs metrics_bin
 in favour of the IOCTL
In-Reply-To: <20260517151211.415627-7-muralidhara.mk@amd.com>
Message-ID: <a290bd3e-365f-8fd4-239c-846197a03853@linux.intel.com>
References: <20260517151211.415627-1-muralidhara.mk@amd.com> <20260517151211.415627-7-muralidhara.mk@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 17 May 2026, Muralidhara M K wrote:

> The HSMP_IOCTL_GET_TELEMETRY_DATA character-device ioctl introduced in
> the previous patch is now the canonical interface for reading the
> metric table on the ACPI driver path.  Unlike the metrics_bin sysfs
> binary attribute, the ioctl is not constrained by PAGE_SIZE, so it
> works for the ~13 KB hsmp_metric_table_zen6 layout

This was only a secondary reason from moving away from sysfs files? The 
main cause for moving to misc device according to my impression was that 
you wanted to prevent partial reads which are always possible with files.

> used on Family 1Ah
> Model 50h-5Fh as well as for the existing hsmp_metric_table layout
> used on protocol version 6.



> Drop the metrics_bin bin_attribute from the ACPI hsmp_attr_grp.

> Widen the remaining proto_ver gate in init_acpi() from
> '== HSMP_PROTO_VER6' to '>= HSMP_PROTO_VER6' so
> hsmp_get_tbl_dram_base() is invoked on protocol version 7
> (Family 1Ah Model 50h-5Fh) and any future protocol version that
> retains a compatible per-socket metric table.  This populates
> sock->metric_tbl_addr and hsmp_pdev.hsmp_table_size, which the ioctl
> handler requires.

These are two logically separate changes so they should not be in the same 
patch (but you'll likely need to alter the drop patch anyway, see below).

> This is an ABI change for users of the ACPI driver:
> /sys/bus/platform/devices/AMDI0097:*/metrics_bin no longer exists.
> Userspace must read telemetry through the HSMP_IOCTL_GET_TELEMETRY_DATA
> ioctl on /dev/hsmp instead, sizing its buffer using the matching UAPI
> metric table struct.

I might not be entirely following what's the extent of removal here but it 
looks too extensive to me. The number 1 rule is that we cannot take away 
existing and working ABI without properly deprecating it first.

You don't have to make it work with version 7 and can return error in 
that case as it has never worked. But with version 6, things shouls be 
left as is until properly deprecated. You may consider adding a warning 
print too to warn about the deprecation and point towards the new way.

This interface probably never was documented in Documentation/ABI where 
such deprecations are usually marked... oh well, maybe we need to add
a simple entry for this ABI there to follow the usual deprecation path.

-- 
 i.

> The non-ACPI plat.c path is intentionally left
> unchanged: it covers Family 1Ah Model 0h-Fh hardware that is fixed at
> protocol version 6, and its per-socket metrics_bin remains available
> for existing userspace tooling on those systems.
> 
> Co-developed-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
> Signed-off-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
> Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
> ---
> Changes:
> v1->v3: Remove bin attributes
> 
>  drivers/platform/x86/amd/hsmp/acpi.c | 34 +---------------------------
>  1 file changed, 1 insertion(+), 33 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
> index 97ed71593bdf..49765fefe1fb 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -231,25 +231,6 @@ static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
>  	return hsmp_read_acpi_dsd(sock);
>  }
>  
> -static ssize_t hsmp_metric_tbl_acpi_read(struct file *filp, struct kobject *kobj,
> -					 const struct bin_attribute *bin_attr, char *buf,
> -					 loff_t off, size_t count)
> -{
> -	struct device *dev = container_of(kobj, struct device, kobj);
> -	struct hsmp_socket *sock = dev_get_drvdata(dev);
> -
> -	return hsmp_metric_tbl_read(sock, buf, count);
> -}
> -
> -static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
> -					 const struct bin_attribute *battr, int id)
> -{
> -	if (hsmp_pdev->proto_ver == HSMP_PROTO_VER6)
> -		return battr->attr.mode;
> -
> -	return 0;
> -}
> -
>  static umode_t hsmp_is_sock_dev_attr_visible(struct kobject *kobj,
>  					     struct attribute *attr, int id)
>  {
> @@ -491,7 +472,7 @@ static int init_acpi(struct device *dev)
>  		return ret;
>  	}
>  
> -	if (hsmp_pdev->proto_ver == HSMP_PROTO_VER6) {
> +	if (hsmp_pdev->proto_ver >= HSMP_PROTO_VER6) {
>  		ret = hsmp_get_tbl_dram_base(sock_ind);
>  		if (ret)
>  			dev_info(dev, "Failed to init metric table\n");
> @@ -506,17 +487,6 @@ static int init_acpi(struct device *dev)
>  	return 0;
>  }
>  
> -static const struct bin_attribute  hsmp_metric_tbl_attr = {
> -	.attr = { .name = HSMP_METRICS_TABLE_NAME, .mode = 0444},
> -	.read = hsmp_metric_tbl_acpi_read,
> -	.size = sizeof(struct hsmp_metric_table),
> -};
> -
> -static const struct bin_attribute *hsmp_attr_list[] = {
> -	&hsmp_metric_tbl_attr,
> -	NULL
> -};
> -
>  #define HSMP_DEV_ATTR(_name, _msg_id, _show, _mode)	\
>  static struct hsmp_sys_attr hattr_##_name = {		\
>  	.dattr = __ATTR(_name, _mode, _show, NULL),	\
> @@ -559,9 +529,7 @@ static struct attribute *hsmp_dev_attr_list[] = {
>  };
>  
>  static const struct attribute_group hsmp_attr_grp = {
> -	.bin_attrs = hsmp_attr_list,
>  	.attrs = hsmp_dev_attr_list,
> -	.is_bin_visible = hsmp_is_sock_attr_visible,
>  	.is_visible = hsmp_is_sock_dev_attr_visible,
>  };
>  
> 

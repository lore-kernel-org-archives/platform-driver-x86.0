Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3701FCCEB
	for <platform-driver-x86@vger.kernel.org>; Tue,  6 May 2025 11:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746529533; cv=none; b=uF148SO1SXL6p5H3rfJY+sKh9H/TYWTrk1+AsAeN/e6h96Lwu1qjvGM4ji6Bu3BZw8ikdUzp8Y8p/nCbKWt0wjCOBjRP6suEaByccwJstslISCySPevpvHletlGMu9+GW/jcqSHU5NmNiIq65ZTjrEkoO8UjWrg5/SMu5HUb1Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746529533; c=relaxed/simple;
	bh=976e7QsYM2Wv/OY4FKzj+uXo39WEs83FzO4TlhpLrOA=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=YR8tFDtBV/8+Va9pjUKFot9dLt+zVaVwDVcfajsKg/Mk2gN2h8byFLa9JWLZo1V43n4cx0zOlCckgP0cEHo13AU2MUQDvjQf4THoQpvlMGZAuLBgPrz3dkE0bsCL0pTJ1j0FlLk7D8EBGP4hOTjQXBlBAwGj4WSB2vdYCdxl26E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PAhvlcFV; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PAhvlcFV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746529532; x=1778065532;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=976e7QsYM2Wv/OY4FKzj+uXo39WEs83FzO4TlhpLrOA=;
  b=PAhvlcFVfhyuEOSwh4PVD2vqkdVrMLIKsWQIpKnIO+OtW8uxxXTh/pTe
   QjfinvpwR+HXg7lzcA7/ahYyz7MRntUviW5nQDS1gVmY/6zI0KzX/+3t2
   TmBMkWUSZT0AZJyze8e+7fpleexrNCQ3o24tAoNQnRNp1bFI15e4K1ut1
   DWqOfsa3n2aSGOFGRQS7pwneiUXv+2t3J2QXeW6pjZVBxibB6bHcWz5aA
   ZcTj1ZKCbC6TVuZENPrfHGXq/Vrg/M0MClkvk/nB+rE0NmGM5jtBwiHHm
   BrjaA2PurNEnXlkJU9amcJDITJuTEQh6qghDUdFCnXttoXpBxmL2OLkVO
   g==;
X-CSE-ConnectionGUID: TEkNk62WSISxuq07BiZjVw==
X-CSE-MsgGUID: yxax+nUARniIRPNkhDDsGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="48277200"
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; 
   d="scan'208";a="48277200"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 04:03:30 -0700
X-CSE-ConnectionGUID: V40xde75QQCupbuleu3lzw==
X-CSE-MsgGUID: rNI9lVWjSIuzJl4ILFAd0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; 
   d="scan'208";a="135555299"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.207])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 04:03:27 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 6 May 2025 14:03:23 +0300 (EEST)
To: Suma Hegde <suma.hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Subject: Re: [v4 3/3] platform/x86/amd/hsmp: acpi: Add sysfs files to display
 HSMP telemetry
In-Reply-To: <20250506101542.200811-3-suma.hegde@amd.com>
Message-ID: <50b1a333-d248-66fc-e472-7205f7718eb0@linux.intel.com>
References: <20250506101542.200811-1-suma.hegde@amd.com> <20250506101542.200811-3-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-189666147-1746528941=:1921"
Content-ID: <2abcd130-1d21-e1c1-55b3-09bbb0ed2e22@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-189666147-1746528941=:1921
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <f3259381-d6ef-1d39-d092-b3595fc2e38a@linux.intel.com>

On Tue, 6 May 2025, Suma Hegde wrote:

> Make frequently fetched telemetry available via sysfs. These parameters
> do not fit in hwmon sensor model, hence make them available via sysfs.
>=20
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
>=20
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> ---
> Changes since v3:
> 1. include array_size.h
> 2. include bitfield.h and bits.h
> 3. Remove bitops.h
> 4. Remove comma from terminator
> 5. Change { 0 } to {} for initializing struct hsmp_message
> 6. Change src_ind =3D src_ind >> 1 to src_ind >>=3D 1;

Thanks for doing the broken down change list, it helped my memory to=20
recall the patch context. :-)

For the entire series,

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

I'll give these a few days if somebody has still something to say about=20
the new version.

--
 i.

> Changes since v2:
> 1. Change commit mesage and description
> 2. Update documentation
> 3. Remove hwmon related documentation changes from this patch
> 4. Define FIELD_GET_U32, use it everywhere where casting to u32 is needed
> 5. Define masks and use FIELD_GET() directly instead of defining function=
 like
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
>=20
> Changes since v1:
> 1. Add linux/bitops.h
> 2. Define DDR_MAX_BW, DDR_UTIL_BW DDR_UTIL_BW_PERC FW_VER_MAJOR FW_VER_MI=
NOR FW_VER_DEBUG FMAX
>    FMIN FREQ_LIMIT FREQ_SRC_IND and use them in functions.
> 3. Return early in hsmp_msg_get_nargs()
> 4. Change while loop to for loop in hsmp_freq_limit_source_show()
> 5. Correct the GENMASK size in hsmp_ddr_util_bw_show()[bit 19:8, instead
>    of bit 20:8]
>=20
>  Documentation/arch/x86/amd_hsmp.rst  |  22 +++
>  drivers/platform/x86/amd/hsmp/acpi.c | 262 +++++++++++++++++++++++++++
>  drivers/platform/x86/amd/hsmp/hsmp.c |  23 +++
>  drivers/platform/x86/amd/hsmp/hsmp.h |   1 +
>  4 files changed, 308 insertions(+)
>=20
> diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86=
/amd_hsmp.rst
> index 3ef3e0a71df9..a094f55c10b0 100644
> --- a/Documentation/arch/x86/amd_hsmp.rst
> +++ b/Documentation/arch/x86/amd_hsmp.rst
> @@ -71,6 +71,28 @@ Note: lseek() is not supported as entire metrics table=
 is read.
>  Metrics table definitions will be documented as part of Public PPR.
>  The same is defined in the amd_hsmp.h header.
> =20
> +2. HSMP telemetry sysfs files
> +
> +Following sysfs files are available at /sys/devices/platform/AMDI0097:0X=
/.
> +
> +* c0_residency_input: Percentage of cores in C0 state.
> +* prochot_status: Reports 1 if the processor is at thermal threshold val=
ue,
> +  0 otherwise.
> +* smu_fw_version: SMU firmware version.
> +* protocol_version: HSMP interface version.
> +* ddr_max_bw: Theoretical maximum DDR bandwidth in GB/s.
> +* ddr_utilised_bw_input: Current utilized DDR bandwidth in GB/s.
> +* ddr_utilised_bw_perc_input(%): Percentage of current utilized DDR band=
width.
> +* mclk_input: Memory clock in MHz.
> +* fclk_input: Fabric clock in MHz.
> +* clk_fmax: Maximum frequency of socket in MHz.
> +* clk_fmin: Minimum frequency of socket in MHz.
> +* cclk_freq_limit_input: Core clock frequency limit per socket in MHz.
> +* pwr_current_active_freq_limit: Current active frequency limit of socke=
t
> +  in MHz.
> +* pwr_current_active_freq_limit_source: Source of current active frequen=
cy
> +  limit.
> +
>  ACPI device object format
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>  The ACPI object format expected from the amd_hsmp driver
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/=
amd/hsmp/acpi.c
> index 93b413e0a6e6..e9075b129213 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -12,6 +12,9 @@
>  #include <asm/amd_hsmp.h>
> =20
>  #include <linux/acpi.h>
> +#include <linux/array_size.h>
> +#include <linux/bits.h>
> +#include <linux/bitfield.h>
>  #include <linux/device.h>
>  #include <linux/dev_printk.h>
>  #include <linux/ioport.h>
> @@ -36,6 +39,11 @@
> =20
>  static struct hsmp_plat_device *hsmp_pdev;
> =20
> +struct hsmp_sys_attr {
> +=09struct device_attribute dattr;
> +=09u32 msg_id;
> +};
> +
>  static int amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
>  =09=09=09      u32 *value, bool write)
>  {
> @@ -243,6 +251,215 @@ static umode_t hsmp_is_sock_attr_visible(struct kob=
ject *kobj,
>  =09return 0;
>  }
> =20
> +static umode_t hsmp_is_sock_dev_attr_visible(struct kobject *kobj,
> +=09=09=09=09=09     struct attribute *attr, int id)
> +{
> +=09return attr->mode;
> +}
> +
> +#define to_hsmp_sys_attr(_attr) container_of(_attr, struct hsmp_sys_attr=
, dattr)
> +
> +static ssize_t hsmp_msg_resp32_show(struct device *dev, struct device_at=
tribute *attr,
> +=09=09=09=09    char *buf)
> +{
> +=09struct hsmp_sys_attr *hattr =3D to_hsmp_sys_attr(attr);
> +=09struct hsmp_socket *sock =3D dev_get_drvdata(dev);
> +=09u32 data;
> +=09int ret;
> +
> +=09ret =3D hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09return sysfs_emit(buf, "%u\n", data);
> +}
> +
> +#define DDR_MAX_BW_MASK=09=09GENMASK(31, 20)
> +#define DDR_UTIL_BW_MASK=09GENMASK(19, 8)
> +#define DDR_UTIL_BW_PERC_MASK=09GENMASK(7, 0)
> +#define FW_VER_MAJOR_MASK=09GENMASK(23, 16)
> +#define FW_VER_MINOR_MASK=09GENMASK(15, 8)
> +#define FW_VER_DEBUG_MASK=09GENMASK(7, 0)
> +#define FMAX_MASK=09=09GENMASK(31, 16)
> +#define FMIN_MASK=09=09GENMASK(15, 0)
> +#define FREQ_LIMIT_MASK=09=09GENMASK(31, 16)
> +#define FREQ_SRC_IND_MASK=09GENMASK(15, 0)
> +
> +static ssize_t hsmp_ddr_max_bw_show(struct device *dev, struct device_at=
tribute *attr,
> +=09=09=09=09    char *buf)
> +{
> +=09struct hsmp_sys_attr *hattr =3D to_hsmp_sys_attr(attr);
> +=09struct hsmp_socket *sock =3D dev_get_drvdata(dev);
> +=09u32 data;
> +=09int ret;
> +
> +=09ret =3D hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09return sysfs_emit(buf, "%lu\n", FIELD_GET(DDR_MAX_BW_MASK, data));
> +}
> +
> +static ssize_t hsmp_ddr_util_bw_show(struct device *dev, struct device_a=
ttribute *attr,
> +=09=09=09=09     char *buf)
> +{
> +=09struct hsmp_sys_attr *hattr =3D to_hsmp_sys_attr(attr);
> +=09struct hsmp_socket *sock =3D dev_get_drvdata(dev);
> +=09u32 data;
> +=09int ret;
> +
> +=09ret =3D hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09return sysfs_emit(buf, "%lu\n", FIELD_GET(DDR_UTIL_BW_MASK, data));
> +}
> +
> +static ssize_t hsmp_ddr_util_bw_perc_show(struct device *dev, struct dev=
ice_attribute *attr,
> +=09=09=09=09=09  char *buf)
> +{
> +=09struct hsmp_sys_attr *hattr =3D to_hsmp_sys_attr(attr);
> +=09struct hsmp_socket *sock =3D dev_get_drvdata(dev);
> +=09u32 data;
> +=09int ret;
> +
> +=09ret =3D hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09return sysfs_emit(buf, "%lu\n", FIELD_GET(DDR_UTIL_BW_PERC_MASK, data=
));
> +}
> +
> +static ssize_t hsmp_msg_fw_ver_show(struct device *dev, struct device_at=
tribute *attr,
> +=09=09=09=09    char *buf)
> +{
> +=09struct hsmp_sys_attr *hattr =3D to_hsmp_sys_attr(attr);
> +=09struct hsmp_socket *sock =3D dev_get_drvdata(dev);
> +=09u32 data;
> +=09int ret;
> +
> +=09ret =3D hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09return sysfs_emit(buf, "%lu.%lu.%lu\n",
> +=09=09=09  FIELD_GET(FW_VER_MAJOR_MASK, data),
> +=09=09=09  FIELD_GET(FW_VER_MINOR_MASK, data),
> +=09=09=09  FIELD_GET(FW_VER_DEBUG_MASK, data));
> +}
> +
> +static ssize_t hsmp_fclk_show(struct device *dev, struct device_attribut=
e *attr,
> +=09=09=09      char *buf)
> +{
> +=09struct hsmp_sys_attr *hattr =3D to_hsmp_sys_attr(attr);
> +=09struct hsmp_socket *sock =3D dev_get_drvdata(dev);
> +=09u32 data[2];
> +=09int ret;
> +
> +=09ret =3D hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, data, 2);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09return sysfs_emit(buf, "%u\n", data[0]);
> +}
> +
> +static ssize_t hsmp_mclk_show(struct device *dev, struct device_attribut=
e *attr,
> +=09=09=09      char *buf)
> +{
> +=09struct hsmp_sys_attr *hattr =3D to_hsmp_sys_attr(attr);
> +=09struct hsmp_socket *sock =3D dev_get_drvdata(dev);
> +=09u32 data[2];
> +=09int ret;
> +
> +=09ret =3D hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, data, 2);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09return sysfs_emit(buf, "%u\n", data[1]);
> +}
> +
> +static ssize_t hsmp_clk_fmax_show(struct device *dev, struct device_attr=
ibute *attr,
> +=09=09=09=09  char *buf)
> +{
> +=09struct hsmp_sys_attr *hattr =3D to_hsmp_sys_attr(attr);
> +=09struct hsmp_socket *sock =3D dev_get_drvdata(dev);
> +=09u32 data;
> +=09int ret;
> +
> +=09ret =3D hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09return sysfs_emit(buf, "%lu\n", FIELD_GET(FMAX_MASK, data));
> +}
> +
> +static ssize_t hsmp_clk_fmin_show(struct device *dev, struct device_attr=
ibute *attr,
> +=09=09=09=09  char *buf)
> +{
> +=09struct hsmp_sys_attr *hattr =3D to_hsmp_sys_attr(attr);
> +=09struct hsmp_socket *sock =3D dev_get_drvdata(dev);
> +=09u32 data;
> +=09int ret;
> +
> +=09ret =3D hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09return sysfs_emit(buf, "%lu\n", FIELD_GET(FMIN_MASK, data));
> +}
> +
> +static ssize_t hsmp_freq_limit_show(struct device *dev, struct device_at=
tribute *attr,
> +=09=09=09=09    char *buf)
> +{
> +=09struct hsmp_sys_attr *hattr =3D to_hsmp_sys_attr(attr);
> +=09struct hsmp_socket *sock =3D dev_get_drvdata(dev);
> +=09u32 data;
> +=09int ret;
> +
> +=09ret =3D hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09return sysfs_emit(buf, "%lu\n", FIELD_GET(FREQ_LIMIT_MASK, data));
> +}
> +
> +static const char * const freqlimit_srcnames[] =3D {
> +=09"cHTC-Active",
> +=09"PROCHOT",
> +=09"TDC limit",
> +=09"PPT Limit",
> +=09"OPN Max",
> +=09"Reliability Limit",
> +=09"APML Agent",
> +=09"HSMP Agent",
> +};
> +
> +static ssize_t hsmp_freq_limit_source_show(struct device *dev, struct de=
vice_attribute *attr,
> +=09=09=09=09=09   char *buf)
> +{
> +=09struct hsmp_sys_attr *hattr =3D to_hsmp_sys_attr(attr);
> +=09struct hsmp_socket *sock =3D dev_get_drvdata(dev);
> +=09unsigned int index;
> +=09int len =3D 0;
> +=09u16 src_ind;
> +=09u32 data;
> +=09int ret;
> +
> +=09ret =3D hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09src_ind =3D FIELD_GET(FREQ_SRC_IND_MASK, data);
> +=09for (index =3D 0; index < ARRAY_SIZE(freqlimit_srcnames); index++) {
> +=09=09if (!src_ind)
> +=09=09=09break;
> +=09=09if (src_ind & 1)
> +=09=09=09len +=3D sysfs_emit_at(buf, len, "%s\n", freqlimit_srcnames[ind=
ex]);
> +=09=09src_ind >>=3D 1;
> +=09}
> +=09return len;
> +}
> +
>  static int init_acpi(struct device *dev)
>  {
>  =09u16 sock_ind;
> @@ -285,6 +502,8 @@ static int init_acpi(struct device *dev)
>  =09if (ret)
>  =09=09dev_err(dev, "Failed to register HSMP sensors with hwmon\n");
> =20
> +=09dev_set_drvdata(dev, &hsmp_pdev->sock[sock_ind]);
> +
>  =09return ret;
>  }
> =20
> @@ -299,9 +518,52 @@ static const struct bin_attribute *hsmp_attr_list[] =
=3D {
>  =09NULL
>  };
> =20
> +#define HSMP_DEV_ATTR(_name, _msg_id, _show, _mode)=09\
> +static struct hsmp_sys_attr hattr_##_name =3D {=09=09\
> +=09.dattr =3D __ATTR(_name, _mode, _show, NULL),=09\
> +=09.msg_id =3D _msg_id,=09=09=09=09\
> +}
> +
> +HSMP_DEV_ATTR(c0_residency_input, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_s=
how, 0444);
> +HSMP_DEV_ATTR(prochot_status, HSMP_GET_PROC_HOT, hsmp_msg_resp32_show, 0=
444);
> +HSMP_DEV_ATTR(smu_fw_version, HSMP_GET_SMU_VER, hsmp_msg_fw_ver_show, 04=
44);
> +HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_show=
, 0444);
> +HSMP_DEV_ATTR(cclk_freq_limit_input, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_=
msg_resp32_show, 0444);
> +HSMP_DEV_ATTR(ddr_max_bw, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_max_bw_show, =
0444);
> +HSMP_DEV_ATTR(ddr_utilised_bw_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_ut=
il_bw_show, 0444);
> +HSMP_DEV_ATTR(ddr_utilised_bw_perc_input, HSMP_GET_DDR_BANDWIDTH, hsmp_d=
dr_util_bw_perc_show, 0444);
> +HSMP_DEV_ATTR(fclk_input, HSMP_GET_FCLK_MCLK, hsmp_fclk_show, 0444);
> +HSMP_DEV_ATTR(mclk_input, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444);
> +HSMP_DEV_ATTR(clk_fmax, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmax_show, 0=
444);
> +HSMP_DEV_ATTR(clk_fmin, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmin_show, 0=
444);
> +HSMP_DEV_ATTR(pwr_current_active_freq_limit, HSMP_GET_SOCKET_FREQ_LIMIT,
> +=09      hsmp_freq_limit_show, 0444);
> +HSMP_DEV_ATTR(pwr_current_active_freq_limit_source, HSMP_GET_SOCKET_FREQ=
_LIMIT,
> +=09      hsmp_freq_limit_source_show, 0444);
> +
> +static struct attribute *hsmp_dev_attr_list[] =3D {
> +=09&hattr_c0_residency_input.dattr.attr,
> +=09&hattr_prochot_status.dattr.attr,
> +=09&hattr_smu_fw_version.dattr.attr,
> +=09&hattr_protocol_version.dattr.attr,
> +=09&hattr_cclk_freq_limit_input.dattr.attr,
> +=09&hattr_ddr_max_bw.dattr.attr,
> +=09&hattr_ddr_utilised_bw_input.dattr.attr,
> +=09&hattr_ddr_utilised_bw_perc_input.dattr.attr,
> +=09&hattr_fclk_input.dattr.attr,
> +=09&hattr_mclk_input.dattr.attr,
> +=09&hattr_clk_fmax.dattr.attr,
> +=09&hattr_clk_fmin.dattr.attr,
> +=09&hattr_pwr_current_active_freq_limit.dattr.attr,
> +=09&hattr_pwr_current_active_freq_limit_source.dattr.attr,
> +=09NULL
> +};
> +
>  static const struct attribute_group hsmp_attr_grp =3D {
>  =09.bin_attrs_new =3D hsmp_attr_list,
> +=09.attrs =3D hsmp_dev_attr_list,
>  =09.is_bin_visible =3D hsmp_is_sock_attr_visible,
> +=09.is_visible =3D hsmp_is_sock_dev_attr_visible,
>  };
> =20
>  static const struct attribute_group *hsmp_groups[] =3D {
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/=
amd/hsmp/hsmp.c
> index 3df34d7436a9..1f0cda87b6e6 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
> @@ -228,6 +228,29 @@ int hsmp_send_message(struct hsmp_message *msg)
>  }
>  EXPORT_SYMBOL_NS_GPL(hsmp_send_message, "AMD_HSMP");
> =20
> +int hsmp_msg_get_nargs(u16 sock_ind, u32 msg_id, u32 *data, u8 num_args)
> +{
> +=09struct hsmp_message msg =3D {};
> +=09unsigned int i;
> +=09int ret;
> +
> +=09if (!data)
> +=09=09return -EINVAL;
> +=09msg.msg_id =3D msg_id;
> +=09msg.sock_ind =3D sock_ind;
> +=09msg.response_sz =3D num_args;
> +
> +=09ret =3D hsmp_send_message(&msg);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09for (i =3D 0; i < num_args; i++)
> +=09=09data[i] =3D msg.args[i];
> +
> +=09return 0;
> +}
> +EXPORT_SYMBOL_NS_GPL(hsmp_msg_get_nargs, "AMD_HSMP");
> +
>  int hsmp_test(u16 sock_ind, u32 value)
>  {
>  =09struct hsmp_message msg =3D { 0 };
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/=
amd/hsmp/hsmp.h
> index 02eeebfcb165..027db8e1de12 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
> @@ -69,4 +69,5 @@ int hsmp_create_sensor(struct device *dev, u16 sock_ind=
);
>  #else
>  int hsmp_create_sensor(struct device *dev, u16 sock_ind) { return 0; }
>  #endif
> +int hsmp_msg_get_nargs(u16 sock_ind, u32 msg_id, u32 *data, u8 num_args)=
;
>  #endif /* HSMP_H */
>=20
--8323328-189666147-1746528941=:1921--

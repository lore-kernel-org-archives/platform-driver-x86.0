Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8E51CF5F7
	for <platform-driver-x86@vger.kernel.org>; Mon, 14 Oct 2024 17:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728928490; cv=none; b=LlHxbesl3eUyaUfl3kGp8c1xL90nBFIdzW0F8q/YRhCgMk3lJSMBmfqcyan0SjHvK1e8/jMgih3BPmWUSX9icITj+sYElBPikBCcGRhVF2cvaTHYm7ZPb1qthKo5k5MFfpIYuz46at0di6vpC9b6RM9GQfBZKmnWJsZ8JODwaGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728928490; c=relaxed/simple;
	bh=XzvbSc57qJ56ZQ5g9zpIEkviEj8lT2dmoaItng0z2xg=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=FkMGchNLR/Lh06UCGijdDnjuZ6Pzq/ggRwimBhqgPq+cPtJWUBq37S5q069QdlpwLOaT27H7+FUQE6DmWdv9ttQsEch3ROjrn39NIE6F4MjLelK7gtWZFWMynJIoc6Yn9yHk5qLxRB8JZJJAItPYJlNlJNZdfEi3sjuV666qPNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kdd0NDgY; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kdd0NDgY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728928489; x=1760464489;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=XzvbSc57qJ56ZQ5g9zpIEkviEj8lT2dmoaItng0z2xg=;
  b=kdd0NDgYvEXu6I3m0+bBVqnIPgHm0/R3fm5lThUqfHqjVga+PZK0pHbM
   wdH7i18geXjF7T7zH2D1PYoz00H13DYqz3+xzPTNXGMGFVJo+aRYSaSvh
   AmQ9D7D5+aT8VH8toQjRNNASKH+FFtI+V3RSjODal9i3VBHJzmutRWrOF
   wKXHKuBsyZUqxlgclSp0HQ3Cpt67QBu7gix73Uc6rImT1720LhsdvXQzJ
   MJAmWQL1rGdVvrFg4zuAweHh6reUAE/Vvf6+w+4qLxNJeFdA327bIa1c1
   YlJo9ZUe9yOmlaH0bA+j8VJ+ANK5EGUOMWes13EGJBLhL/PO2yGC/M1Z3
   A==;
X-CSE-ConnectionGUID: EaFg0IkzRUevxcrY0UBpOg==
X-CSE-MsgGUID: d93NzUB5RTWpkp9avLBdyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="39666351"
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; 
   d="scan'208";a="39666351"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 10:54:48 -0700
X-CSE-ConnectionGUID: S5bW45pbTO2foJXGqe1x5A==
X-CSE-MsgGUID: PteW7U37R9CNuFoS71+bCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; 
   d="scan'208";a="115095420"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.179])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 10:54:47 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 14 Oct 2024 20:54:43 +0300 (EEST)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    Patil.Reddy@amd.com
Subject: Re: [PATCH 4/5] platform/x86/amd/pmf: Switch to platform_get_resource()
 and devm_ioremap_resource()
In-Reply-To: <d160d900-d15c-4868-8f9e-d6477abca38d@amd.com>
Message-ID: <b83b67b8-e1ca-7e9a-5205-d6d69c87be6c@linux.intel.com>
References: <20241014045759.1517226-1-Shyam-sundar.S-k@amd.com> <20241014045759.1517226-5-Shyam-sundar.S-k@amd.com> <279d7dcd-2a94-1dd2-c34e-15b852dbceee@linux.intel.com> <d160d900-d15c-4868-8f9e-d6477abca38d@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1109805362-1728928483=:1010"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1109805362-1728928483=:1010
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 14 Oct 2024, Shyam Sundar S K wrote:

> Hi Ilpo,
>=20
> On 10/14/2024 13:26, Ilpo J=C3=A4rvinen wrote:
> > On Mon, 14 Oct 2024, Shyam Sundar S K wrote:
> >=20
> >> Use platform_get_resource() to fetch the memory resource instead of
> >> acpi_walk_resources() and devm_ioremap_resource() for mapping the
> >> resources.
> >>
> >> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> >> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> >> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> >> ---
> >>  drivers/platform/x86/amd/pmf/Kconfig  |  1 +
> >>  drivers/platform/x86/amd/pmf/acpi.c   | 37 ++++++++------------------=
-
> >>  drivers/platform/x86/amd/pmf/pmf.h    |  6 +++--
> >>  drivers/platform/x86/amd/pmf/tee-if.c |  8 +++---
> >>  4 files changed, 20 insertions(+), 32 deletions(-)
> >>
> >> diff --git a/drivers/platform/x86/amd/pmf/Kconfig b/drivers/platform/x=
86/amd/pmf/Kconfig
> >> index f4fa8bd8bda8..99d67cdbd91e 100644
> >> --- a/drivers/platform/x86/amd/pmf/Kconfig
> >> +++ b/drivers/platform/x86/amd/pmf/Kconfig
> >> @@ -11,6 +11,7 @@ config AMD_PMF
> >>  =09select ACPI_PLATFORM_PROFILE
> >>  =09depends on TEE && AMDTEE
> >>  =09depends on AMD_SFH_HID
> >> +=09depends on HAS_IOMEM
> >>  =09help
> >>  =09  This driver provides support for the AMD Platform Management Fra=
mework.
> >>  =09  The goal is to enhance end user experience by making AMD PCs sma=
rter,
> >> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x8=
6/amd/pmf/acpi.c
> >> index d5b496433d69..40f1c0e9ec6d 100644
> >> --- a/drivers/platform/x86/amd/pmf/acpi.c
> >> +++ b/drivers/platform/x86/amd/pmf/acpi.c
> >> @@ -433,37 +433,22 @@ int apmf_install_handler(struct amd_pmf_dev *pmf=
_dev)
> >>  =09return 0;
> >>  }
> >> =20
> >> -static acpi_status apmf_walk_resources(struct acpi_resource *res, voi=
d *data)
> >> +int apmf_check_smart_pc(struct amd_pmf_dev *pmf_dev)
> >>  {
> >> -=09struct amd_pmf_dev *dev =3D data;
> >> +=09struct platform_device *pdev =3D to_platform_device(pmf_dev->dev);
> >> =20
> >> -=09switch (res->type) {
> >> -=09case ACPI_RESOURCE_TYPE_ADDRESS64:
> >> -=09=09dev->policy_addr =3D res->data.address64.address.minimum;
> >> -=09=09dev->policy_sz =3D res->data.address64.address.address_length;
> >> -=09=09break;
> >> -=09case ACPI_RESOURCE_TYPE_FIXED_MEMORY32:
> >> -=09=09dev->policy_addr =3D res->data.fixed_memory32.address;
> >> -=09=09dev->policy_sz =3D res->data.fixed_memory32.address_length;
> >> -=09=09break;
> >> -=09}
> >> -
> >> -=09if (!dev->policy_addr || dev->policy_sz > POLICY_BUF_MAX_SZ || dev=
->policy_sz =3D=3D 0) {
> >> -=09=09pr_err("Incorrect Policy params, possibly a SBIOS bug\n");
> >> -=09=09return AE_ERROR;
> >> +=09pmf_dev->res =3D  platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >=20
> > Extra space.
> >=20
> >> +=09if (!pmf_dev->res) {
> >> +=09=09dev_err(pmf_dev->dev, "Failed to get I/O memory resource\n");
> >> +=09=09return -EINVAL;
> >>  =09}
> >> =20
> >> -=09return AE_OK;
> >> -}
> >> +=09pmf_dev->policy_addr =3D pmf_dev->res->start;
> >> +=09pmf_dev->policy_sz =3D resource_size(pmf_dev->res) - 1;
> >=20
> > If you have a resource, why you convert it into something custom like=
=20
> > this?
> >=20
>=20
> I will address your comments in v2. But for this specific comment:
>=20
> the DSDT looks like this:
>=20
> Device (PMF)
> {
> =09...
>=20
> =09Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
> =09{
> =09=09Name (RBUF, ResourceTemplate ()
> =09=09{
> =09=09=09QWordMemory (ResourceConsumer, PosDecode, MinNotFixed, MaxNotFix=
ed,
> NonCacheable, ReadOnly,
> =09=09=09=090x0000000000000000, // Granularity
> =09=09=09=090x000000FD00BC1000, // Range Minimum
> =09=09=09=090x000000FD00C0C000, // Range Maximum
> =09=09=09=090x0000000000000000, // Translation Offset
> =09=09=09=090x000000000004B000, // Length=09
> =09=09=09=09,, , AddressRangeMemory, TypeStatic)
> =09=09}
>=20
> =09=09...
> =09}
> }
>=20
> But, resource_size() will do 'res->end - res->start + 1;'
>=20
> So, that will become 0x4B000 + 1 =3D 0x4B001 which will exceed
> POLICY_BUF_MAX_SZ.

That +1 is there to counter the -1 done on the set side. res->end is=20
supposed to point last valid address of the resource, not the address=20
after it. With round sizes, the end address is expected to end with lots=20
of Fs (hex) but in your example it ends into zeros (if I interpret your=20
numbers right)?

--=20
 i.

> defined as:
> #define POLICY_BUF_MAX_SZ=09=090x4b000
>=20
> Now, because of this, it would hit the failure case:
>=20
> if (!dev->policy_addr || dev->policy_sz > POLICY_BUF_MAX_SZ ||
> dev->policy_sz =3D=3D 0) {
> =09=09pr_err("Incorrect Policy params, possibly a SBIOS bug\n");
> =09=09return AE_ERROR;
> =09}
>=20
>=20
> Would you like me to leave a note before using resource_size() on why
> "-1" is being done?
>=20
> Let me know your thoughts?
>=20
> Thanks,
> Shyam
>=20
> >> -int apmf_check_smart_pc(struct amd_pmf_dev *pmf_dev)
> >> -{
> >> -=09acpi_handle ahandle =3D ACPI_HANDLE(pmf_dev->dev);
> >> -=09acpi_status status;
> >> -
> >> -=09status =3D acpi_walk_resources(ahandle, METHOD_NAME__CRS, apmf_wal=
k_resources, pmf_dev);
> >> -=09if (ACPI_FAILURE(status)) {
> >> -=09=09dev_dbg(pmf_dev->dev, "acpi_walk_resources failed :%d\n", statu=
s);
> >> +=09if (!pmf_dev->policy_addr || pmf_dev->policy_sz > POLICY_BUF_MAX_S=
Z ||
> >> +=09    pmf_dev->policy_sz =3D=3D 0) {
> >> +=09=09dev_err(pmf_dev->dev, "Incorrect policy params, possibly a SBIO=
S bug\n");
> >>  =09=09return -EINVAL;
> >>  =09}
> >> =20
> >> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86=
/amd/pmf/pmf.h
> >> index 8ce8816da9c1..a79808fda1d8 100644
> >> --- a/drivers/platform/x86/amd/pmf/pmf.h
> >> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> >> @@ -13,6 +13,7 @@
> >> =20
> >>  #include <linux/acpi.h>
> >>  #include <linux/input.h>
> >> +#include <linux/platform_device.h>
> >>  #include <linux/platform_profile.h>
> >> =20
> >>  #define POLICY_BUF_MAX_SZ=09=090x4b000
> >> @@ -355,19 +356,20 @@ struct amd_pmf_dev {
> >>  =09/* Smart PC solution builder */
> >>  =09struct dentry *esbin;
> >>  =09unsigned char *policy_buf;
> >> -=09u32 policy_sz;
> >> +=09resource_size_t policy_sz;
> >>  =09struct tee_context *tee_ctx;
> >>  =09struct tee_shm *fw_shm_pool;
> >>  =09u32 session_id;
> >>  =09void *shbuf;
> >>  =09struct delayed_work pb_work;
> >>  =09struct pmf_action_table *prev_data;
> >> -=09u64 policy_addr;
> >> +=09resource_size_t policy_addr;
> >>  =09void __iomem *policy_base;
> >>  =09bool smart_pc_enabled;
> >>  =09u16 pmf_if_version;
> >>  =09struct input_dev *pmf_idev;
> >>  =09size_t mtable_size;
> >> +=09struct resource *res;
> >>  };
> >> =20
> >>  struct apmf_sps_prop_granular_v2 {
> >> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/=
x86/amd/pmf/tee-if.c
> >> index 19c27b6e4666..544c5ce08ff0 100644
> >> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> >> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> >> @@ -257,7 +257,7 @@ static int amd_pmf_invoke_cmd_init(struct amd_pmf_=
dev *dev)
> >>  =09=09return -ENODEV;
> >>  =09}
> >> =20
> >> -=09dev_dbg(dev->dev, "Policy Binary size: %u bytes\n", dev->policy_sz=
);
> >> +=09dev_dbg(dev->dev, "Policy Binary size: %lld bytes\n", dev->policy_=
sz);
> >=20
> > resource_size_t is unsigned type. However, it's not unsigned long long=
=20
> > either so this will trigger a warning without cast which is unacceptabl=
e.
> >=20
>=20
--8323328-1109805362-1728928483=:1010--

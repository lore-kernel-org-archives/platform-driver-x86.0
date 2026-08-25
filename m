Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF753F6C55
	for <platform-driver-x86@vger.kernel.org>; Tue, 25 Aug 2026 10:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787653467; cv=none; b=tNPxeOWRqYgdJPgUE00jDoLUa9B6zS1oS4mOb6n5Sf9a1XDro9/1tCX8qfo5HvfLxTlKQY9izxw/Sd5rlfVX6nsznW2lXkC0oZgQS6diJOpsE84rToSPwVSuFTmTJZy4CzLY+QJlSZ/irtY7ZLD/U3FeXWY5Na6VMdRUHpLxaMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787653467; c=relaxed/simple;
	bh=kNoy8AKOY1wWNj8juVwV7TW0lnjOGkOApVSZ3hOtt6w=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=WDYVaXOafWoIUz71XlU+kIdUWZnvUvjHSZjiKpfLCwXfEoZSyLNtHfYthKH2oGzpI8lb+Q2WLZ1B0alXfVFO3vD7jbMU4A8Hro7kTVJNd/v4f3MA1X4DAA9qN2Ro6ChxByt3xMHjbPFw/PfSTMy3LhprZcVXG4UJr0k2cNhRwbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lXK1SM7m; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lXK1SM7m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787653466; x=1819189466;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=kNoy8AKOY1wWNj8juVwV7TW0lnjOGkOApVSZ3hOtt6w=;
  b=lXK1SM7m3bkoDoUaJUmNqHHsq6fehEMwlYL24t4WfeBf3Ol0GAN99KYG
   F/el2qWSrzcu/bRL8G9Ntgm8OuhWR9sRqhX8Z9nlpaPX66Vw/XtIiJZdc
   z2JdF6XTBi53AScfzSdQf1s4T4Y/2bxAANbIzT+TkTWpXFxMSFoLycDe5
   WRHDPjhi5CUEKd3/Z1nYMOZ9KWKOoUz3BAVg+Lz9iNvxueLvcUiBFsQXo
   lBh5huch0KysX0RmZ58ONd5VZqwKSsptT+E9kLT/lTQFiNDFPqZAVWxZP
   V/j8xj1qdDKg/nsKNdw/S77y9uBWVFQU2swqCmxnqYIPanQU3CiJ23QBS
   w==;
X-CSE-ConnectionGUID: 7jM3+56OSkSDB93LMfqu5w==
X-CSE-MsgGUID: hAcpKuUbR12kbCa0wrb6wQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="91982521"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="91982521"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 03:24:25 -0700
X-CSE-ConnectionGUID: OxiElLsLQwWkOxuAZCsjCw==
X-CSE-MsgGUID: 9qR2zucvSS6EyyfQBFthTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="271043362"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.99])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 03:24:20 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 25 Aug 2026 13:24:16 +0300 (EEST)
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
cc: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
    Hans de Goede <hansg@kernel.org>, matthew.brost@intel.com, 
    rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com, 
    airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com, 
    anoop.c.vijay@intel.com, badal.nilawar@intel.com, 
    matthew.d.roper@intel.com, james.ausmus@intel.com, karthik.poosa@intel.com
Subject: Re: [PATCH v3 07/10] drm/xe/vsec: Crescent Island PMT decode
In-Reply-To: <20260824162317.2450380-19-michael.j.ruhl@intel.com>
Message-ID: <910a5090-230a-139e-4d7a-60c48ac88031@linux.intel.com>
References: <20260824162317.2450380-12-michael.j.ruhl@intel.com> <20260824162317.2450380-19-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-25408568-1787653456=:1165"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-25408568-1787653456=:1165
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 24 Aug 2026, Michael J. Ruhl wrote:

> Crescent Island (CRI) has different index and offset values for
> accessing the PMT data area.
>=20
> Update the decode path to support the CRI device.
>=20
> Update the data read callback so to support the CRI usage.
>=20
> Define several magic numbers.
>=20
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h |   2 +
>  drivers/gpu/drm/xe/xe_vsec.c         | 135 ++++++++++++++++++++++-----
>  2 files changed, 114 insertions(+), 23 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe=
_device_types.h
> index 180d450a6deb..3f1a70813a99 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -466,6 +466,8 @@ struct xe_device {
>  =09struct {
>  =09=09/** @pmt.lock: protect access for telemetry data */
>  =09=09struct mutex lock;
> +=09=09/** @pmt.base_offset: device specific base offset */
> +=09=09u64 base_offset;
>  =09} pmt;
> =20
>  =09/** @soc_remapper: SoC remapper object */
> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index 6345b0b4b26b..dc42b9492428 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -108,23 +108,47 @@ static struct intel_vsec_platform_info xe_vsec_info=
[] =3D {
>  /*
>   * The GUID will have the following bits to decode:
>   *   [0:3]   - {Telemetry space iteration number (0,1,..)}
> - *   [4:7]   - Segment (SEGMENT_INDEPENDENT-0, Client-1, Server-2)
> + *   [4:7]   - BMG Segment (SEGMENT_INDEPENDENT-0, Client-1, Server-2)
> + *   [4:5]   - CRI Segment (SEGMENT_INDEPENDENT-0, Client-1, Server-2)
> + *   [6:7]   - CRI Instance
>   *   [8:11]  - SOC_SKU
>   *   [12:27] =E2=80=93 Device ID =E2=80=93 changes for each down bin SKU=
=E2=80=99s
>   *   [28:29] - Capability Type (Crashlog-0, Telemetry Aggregator-1, Watc=
her-2)
>   *   [30:31] - Record-ID (0-PUNIT, 1-OOBMSM_0, 2-OOBMSM_1)
>   */
>  #define GUID_TELEM_ITERATION=09GENMASK(3, 0)
> -#define GUID_SEGMENT=09=09GENMASK(7, 4)
>  #define GUID_SOC_SKU=09=09GENMASK(11, 8)
>  #define GUID_DEVICE_ID=09=09GENMASK(27, 12)
>  #define GUID_CAP_TYPE=09=09GENMASK(29, 28)
>  #define GUID_RECORD_ID=09=09GENMASK(31, 30)
> =20
> -#define PUNIT_TELEMETRY_OFFSET=09=090x0200
> -#define PUNIT_WATCHER_OFFSET=09=090x14A0
> -#define OOBMSM_0_WATCHER_OFFSET=09=090x18D8
> -#define OOBMSM_1_TELEMETRY_OFFSET=090x1000
> +#define BMG_GUID_SEGMENT=09GENMASK(7, 4)
> +
> +#define CRI_GUID_SEGMENT=09GENMASK(5, 4)
> +#define CRI_GUID_INSTANCE=09GENMASK(7, 6)
> +
> +#define BMG_IDX_TELEM_PUNIT=09=090x00
> +#define BMG_IDX_TELEM_OOBMSM=09=090x01
> +#define BMG_IDX_CRASHLOG_PUNIT=09=090x02
> +#define BMG_IDX_CRASHLOG_OOBMSM=09=090x04
> +
> +#define BMG_PUNIT_TELEMETRY_OFFSET=090x0200
> +#define BMG_PUNIT_WATCHER_OFFSET=090x14A0
> +#define BMG_OOBMSM_0_WATCHER_OFFSET=090x18D8
> +#define BMG_OOBMSM_1_TELEMETRY_OFFSET=090x1000

IMO, it would be better to do the plain renames first to get a clean diff=
=20
for the new stuff.

--=20
 i.

> +#define CRI_IDX_TELEM_DISCOVERY=09=090x00
> +#define CRI_IDX_TELEM_PUNIT=09=090x01
> +#define CRI_IDX_TELEM_OOBMSM=09=090x02
> +#define CRI_IDX_CRASHLOG_PUNIT=09=090x03
> +#define CRI_IDX_WATCHER_OOBMSM=09=090x03  /* PUNIT and OOBMSM share this=
 index */
> +#define CRI_IDX_CRASHLOG_OOBMSM=09=090x04
> +
> +#define CRI_PUNIT_TELEMETRY_OFFSET=09=090x0200
> +#define CRI_PUNIT_WATCHER_OFFSET=09=090x08A0
> +#define CRI_OOBMSM_WATCHER_OFFSET=09=090x0CF8
> +#define CRI_OOBMSM_GFSP_TELEMETRY_OFFSET=090x1600
> +#define CRI_PUNIT_CRASHLOG_OFFSET=09=090x0E60
> =20
>  enum record_id {
>  =09PUNIT,
> @@ -138,45 +162,92 @@ enum capability {
>  =09WATCHER,
>  };
> =20
> -static int xe_guid_decode(u32 guid, int *index, u32 *offset)
> +static int bmg_guid_decode(u32 guid, int *index, u32 *offset)
>  {
>  =09u32 record_id =3D FIELD_GET(GUID_RECORD_ID, guid);
>  =09u32 cap_type  =3D FIELD_GET(GUID_CAP_TYPE, guid);
> -=09u32 device_id =3D FIELD_GET(GUID_DEVICE_ID, guid);
> -
> -=09if (device_id !=3D BMG_DEVICE_ID)
> -=09=09return -ENODEV;
> -
> -=09if (cap_type > WATCHER)
> -=09=09return -EINVAL;
> =20
>  =09*offset =3D 0;
> =20
>  =09if (cap_type =3D=3D CRASHLOG) {
> -=09=09*index =3D record_id =3D=3D PUNIT ? 2 : 4;
> +=09=09*index =3D record_id =3D=3D PUNIT ? BMG_IDX_CRASHLOG_PUNIT : BMG_I=
DX_CRASHLOG_OOBMSM;
>  =09=09return 0;
>  =09}
> =20
>  =09switch (record_id) {
>  =09case PUNIT:
> -=09=09*index =3D 0;
> +=09=09*index =3D BMG_IDX_TELEM_PUNIT;
>  =09=09if (cap_type =3D=3D TELEMETRY)
> -=09=09=09*offset =3D PUNIT_TELEMETRY_OFFSET;
> +=09=09=09*offset =3D BMG_PUNIT_TELEMETRY_OFFSET;
>  =09=09else
> -=09=09=09*offset =3D PUNIT_WATCHER_OFFSET;
> +=09=09=09*offset =3D BMG_PUNIT_WATCHER_OFFSET;
>  =09=09break;
> =20
>  =09case OOBMSM_0:
> -=09=09*index =3D 1;
> +=09=09*index =3D BMG_IDX_TELEM_OOBMSM;
>  =09=09if (cap_type =3D=3D WATCHER)
> -=09=09=09*offset =3D OOBMSM_0_WATCHER_OFFSET;
> +=09=09=09*offset =3D BMG_OOBMSM_0_WATCHER_OFFSET;
>  =09=09break;
> =20
>  =09case OOBMSM_1:
> -=09=09*index =3D 1;
> +=09=09*index =3D BMG_IDX_TELEM_OOBMSM;
> +=09=09if (cap_type =3D=3D TELEMETRY)
> +=09=09=09*offset =3D BMG_OOBMSM_1_TELEMETRY_OFFSET;
> +=09=09break;
> +=09default:
> +=09=09return -EINVAL;
> +=09}
> +
> +=09return 0;
> +}
> +
> +static int cri_guid_decode(u32 guid, int *index, u32 *offset)
> +{
> +=09u32 record_id =3D FIELD_GET(GUID_RECORD_ID, guid);
> +=09u32 cap_type  =3D FIELD_GET(GUID_CAP_TYPE, guid);
> +=09u32 instance  =3D FIELD_GET(CRI_GUID_INSTANCE, guid);
> +
> +=09*offset =3D 0;
> +
> +=09if (cap_type =3D=3D CRASHLOG) {
> +=09=09if (record_id =3D=3D PUNIT) {
> +=09=09=09*index =3D CRI_IDX_CRASHLOG_PUNIT;
> +=09=09=09*offset =3D CRI_PUNIT_CRASHLOG_OFFSET;
> +=09=09} else {
> +=09=09=09*index =3D CRI_IDX_CRASHLOG_OOBMSM;
> +=09=09}
> +=09=09return 0;
> +=09}
> +
> +=09switch (record_id) {
> +=09case PUNIT:
> +=09=09*index =3D CRI_IDX_TELEM_PUNIT;
>  =09=09if (cap_type =3D=3D TELEMETRY)
> -=09=09=09*offset =3D OOBMSM_1_TELEMETRY_OFFSET;
> +=09=09=09*offset =3D CRI_PUNIT_TELEMETRY_OFFSET;
> +=09=09else
> +=09=09=09*offset =3D CRI_PUNIT_WATCHER_OFFSET;
> +=09=09break;
> +
> +=09case OOBMSM_0:
> +=09=09*index =3D CRI_IDX_TELEM_OOBMSM;
> +=09=09switch (instance) {
> +=09=09case 0:
> +=09=09=09if (cap_type =3D=3D WATCHER) {
> +=09=09=09=09*index =3D CRI_IDX_WATCHER_OOBMSM;
> +=09=09=09=09*offset =3D CRI_OOBMSM_WATCHER_OFFSET;
> +=09=09=09}
> +=09=09=09break;
> +
> +=09=09case 1:
> +=09=09=09if (cap_type =3D=3D TELEMETRY)
> +=09=09=09=09*offset =3D CRI_OOBMSM_GFSP_TELEMETRY_OFFSET;
> +=09=09=09break;
> +
> +=09=09default:
> +=09=09=09return -EINVAL;
> +=09=09}
>  =09=09break;
> +
>  =09default:
>  =09=09return -EINVAL;
>  =09}
> @@ -184,6 +255,23 @@ static int xe_guid_decode(u32 guid, int *index, u32 =
*offset)
>  =09return 0;
>  }
> =20
> +static int xe_guid_decode(u32 guid, int *index, u32 *offset)
> +{
> +=09u32 cap_type  =3D FIELD_GET(GUID_CAP_TYPE, guid);
> +=09u32 device_id =3D FIELD_GET(GUID_DEVICE_ID, guid);
> +
> +=09if (cap_type > WATCHER)
> +=09=09return -EINVAL;
> +
> +=09if (device_id =3D=3D BMG_DEVICE_ID)
> +=09=09return bmg_guid_decode(guid, index, offset);
> +
> +=09if (device_id =3D=3D CRI_DEVICE_ID)
> +=09=09return cri_guid_decode(guid, index, offset);
> +
> +=09return -ENODEV;
> +}
> +
>  /*
>   * xe_pmt_telem_read is a callback API.  I.e this can be accessed extern=
al to
>   * XE driver (PMT driver scope).  Because of this, DRM hotplug needs to =
be
> @@ -193,8 +281,8 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u=
64 *data, loff_t user_offse
>  =09=09      u32 count)
>  {
>  =09struct xe_device *xe =3D kdev_to_xe_device(dev);
> -=09void __iomem *telem_addr =3D xe->mmio.regs + BMG_TELEMETRY_OFFSET;
>  =09u32 cap_type =3D FIELD_GET(GUID_CAP_TYPE, guid);
> +=09void __iomem *telem_addr =3D xe->mmio.regs + xe->pmt.base_offset;
>  =09u32 mem_region;
>  =09u32 offset;
>  =09int ret =3D 0;
> @@ -286,6 +374,7 @@ void xe_vsec_init(struct xe_device *xe)
>  =09case XE_VSEC_BMG:
>  =09=09if (!xe->soc_remapper.set_telem_region)
>  =09=09=09return;
> +=09=09xe->pmt.base_offset =3D BMG_TELEMETRY_OFFSET;
>  =09=09info->priv_data =3D &xe_pmt_cb;
>  =09=09break;
>  =09default:
>=20
--8323328-25408568-1787653456=:1165--

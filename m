Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC3024C07F
	for <platform-driver-x86@vger.kernel.org>; Tue,  4 Mar 2025 16:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741104331; cv=none; b=hOb3Q5Mw/TpzsRoQXcHthtug3Hxx39QptSBtL5+qrukaLo6A5gPmhVaeJfXXefNVutL1LjEN21CxH/B5/KESd3qyEzuivgz7n3FYcTpEEhRNWZms5ygRaQFRufXDU4JwJfFZCDiqYvOQeJS88JTbSwlh3tEe2/psIngh60/PyNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741104331; c=relaxed/simple;
	bh=xZmL+h3YG1dzvyYmSNimZXUz/Z7rgMtf9rUZAB/82kc=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=rBzQI2/Blj3AsqeLbQz7ZzOpix7cANNoErd3SZjwfPjb0BRWh7NB2BtOYxkAsD9U8veoR4y/V4ggWkvJVGBF0OYWEDSHfzlFl8c8T56GKCQOB4oc37zOPDHAyPEQhJqRvo5mdcDvMrOMuU/ZUBNp8ci8yLH5wkUAezShGzUDe0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BsHHzlDv; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BsHHzlDv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741104330; x=1772640330;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=xZmL+h3YG1dzvyYmSNimZXUz/Z7rgMtf9rUZAB/82kc=;
  b=BsHHzlDvQNOrGp0oWKqLAvxaDLm65QGgRVRv4JBFlzHiEWXXzC41nd+M
   d+xqu2elMOWFHMgcLrqotdbOIB/gTqM3EjU4gDMN+GjGGZ2HSchWGI+wM
   xTOCfNF9Okyp9+NCjqFk9ChmO+pXedlxwopNfZI+b8XS92LSnZDXxoQov
   UqfdDp1mB+ZOH24MQbNF2yo1+2HlLZOxiUw6I58TEYuEiOwomYzvy/dlb
   5qyrq0o1h9NYxn5MWp3/8n1ta0HWrt8MFnK/Ml16czviHpRY/3Q1rAVDD
   xAD9spq+O1kCGY4cWj2YoJBUP4CcZEyy//b+0YNR7oLxdE6p8VsIbrOxr
   Q==;
X-CSE-ConnectionGUID: lUVpB2beTNenuzKFQ9V3HQ==
X-CSE-MsgGUID: x8/R5mfnSR+URjVUu1sgBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="45680051"
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; 
   d="scan'208";a="45680051"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 08:05:29 -0800
X-CSE-ConnectionGUID: wU014PVATEmM8FpO0WNxzw==
X-CSE-MsgGUID: UAoE4C2gQgq3JrTDJMwTsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; 
   d="scan'208";a="118907081"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.220])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 08:05:26 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 4 Mar 2025 18:05:22 +0200 (EET)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    Patil.Reddy@amd.com, mario.limonciello@amd.com
Subject: Re: [PATCH v2 2/2] platform/x86/amd/pmf: Update PMF Driver for
 Compatibility with new PMF-TA
In-Reply-To: <c53faa27-5e6a-4d01-b56d-cf92f4abd96b@amd.com>
Message-ID: <c39775ac-029b-2ec4-d2db-14726cfd4aaf@linux.intel.com>
References: <20250218120625.1718196-1-Shyam-sundar.S-k@amd.com> <20250218120625.1718196-2-Shyam-sundar.S-k@amd.com> <85237940-b9a2-0b19-44de-058a35e2089f@linux.intel.com> <9e8b2f14-6454-4958-8ac9-4f8dfc8745d2@amd.com> <a32a5daf-9719-ba6c-c6a1-6c2e79760b11@linux.intel.com>
 <c53faa27-5e6a-4d01-b56d-cf92f4abd96b@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-216947548-1741104322=:931"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-216947548-1741104322=:931
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 4 Mar 2025, Shyam Sundar S K wrote:
> On 3/4/2025 21:02, Ilpo J=C3=A4rvinen wrote:
> > On Tue, 4 Mar 2025, Shyam Sundar S K wrote:
> >> On 3/4/2025 19:16, Ilpo J=C3=A4rvinen wrote:
> >>> On Tue, 18 Feb 2025, Shyam Sundar S K wrote:
> >>>
> >>>> The PMF driver allocates a shared memory buffer using
> >>>> tee_shm_alloc_kernel_buf() for communication with the PMF-TA.
> >>>>
> >>>> The latest PMF-TA version introduces new structures with OEM debug
> >>>> information and additional policy input conditions for evaluating th=
e
> >>>> policy binary. Consequently, the shared memory size must be increase=
d to
> >>>> ensure compatibility between the PMF driver and the updated PMF-TA.
> >>>>
> >>>> To do so, introduce the new PMF-TA UUID and update the PMF shared me=
mory
> >>>> configuration to ensure compatibility with the latest PMF-TA version=
=2E
> >>>> Additionally, export the TA UUID.
> >>>>
> >>>> These updates will result in modifications to the prototypes of
> >>>> amd_pmf_tee_init() and amd_pmf_ta_open_session().
> >>>>
> >>>> Link: https://lore.kernel.org/all/55ac865f-b1c7-fa81-51c4-d211c7963e=
7e@linux.intel.com/
> >>>> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> >>>> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> >>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> >>>> ---
> >>>>  drivers/platform/x86/amd/pmf/pmf.h    |  5 ++-
> >>>>  drivers/platform/x86/amd/pmf/tee-if.c | 50 +++++++++++++++++++-----=
---
> >>>>  2 files changed, 40 insertions(+), 15 deletions(-)
> >>>>
> >>>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x=
86/amd/pmf/pmf.h
> >>>> index 41b2b91b8fdc..e6bdee68ccf3 100644
> >>>> --- a/drivers/platform/x86/amd/pmf/pmf.h
> >>>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> >>>> @@ -106,9 +106,12 @@ struct cookie_header {
> >>>>  #define PMF_TA_IF_VERSION_MAJOR=09=09=09=091
> >>>>  #define TA_PMF_ACTION_MAX=09=09=09=09=0932
> >>>>  #define TA_PMF_UNDO_MAX=09=09=09=09=09=098
> >>>> -#define TA_OUTPUT_RESERVED_MEM=09=09=09=09906
> >>>> +#define TA_OUTPUT_RESERVED_MEM=09=09=09=09922
> >>>>  #define MAX_OPERATION_PARAMS=09=09=09=09=094
> >>>> =20
> >>>> +#define TA_ERROR_CRYPTO_INVALID_PARAM=09=09=09=090x20002
> >>>> +#define TA_ERROR_CRYPTO_BIN_TOO_LARGE=09=09=09=090x2000d
> >>>> +
> >>>>  #define PMF_IF_V1=09=091
> >>>>  #define PMF_IF_V2=09=092
> >>>> =20
> >>>> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platfor=
m/x86/amd/pmf/tee-if.c
> >>>> index b404764550c4..a81c661abd7e 100644
> >>>> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> >>>> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> >>>> @@ -27,8 +27,11 @@ module_param(pb_side_load, bool, 0444);
> >>>>  MODULE_PARM_DESC(pb_side_load, "Sideload policy binaries debug poli=
cy failures");
> >>>>  #endif
> >>>> =20
> >>>> -static const uuid_t amd_pmf_ta_uuid =3D UUID_INIT(0x6fd93b77, 0x3fb=
8, 0x524d,
> >>>> -=09=09=09=09=09=090xb1, 0x2d, 0xc5, 0x29, 0xb1, 0x3d, 0x85, 0x43);
> >>>> +static const uuid_t amd_pmf_ta_uuid[] =3D { UUID_INIT(0xd9b39bf2, 0=
x66bd, 0x4154, 0xaf, 0xb8, 0x8a,
> >>>> +=09=09=09=09=09=09    0xcc, 0x2b, 0x2b, 0x60, 0xd6),
> >>>> +=09=09=09=09=09  UUID_INIT(0x6fd93b77, 0x3fb8, 0x524d, 0xb1, 0x2d, =
0xc5,
> >>>> +=09=09=09=09=09=09    0x29, 0xb1, 0x3d, 0x85, 0x43),
> >>>> +=09=09=09=09=09};
> >>>> =20
> >>>>  static const char *amd_pmf_uevent_as_str(unsigned int state)
> >>>>  {
> >>>> @@ -321,7 +324,7 @@ static int amd_pmf_start_policy_engine(struct am=
d_pmf_dev *dev)
> >>>>  =09=09 */
> >>>>  =09=09schedule_delayed_work(&dev->pb_work, msecs_to_jiffies(pb_acti=
ons_ms * 3));
> >>>>  =09} else {
> >>>> -=09=09dev_err(dev->dev, "ta invoke cmd init failed err: %x\n", res)=
;
> >>>> +=09=09dev_dbg(dev->dev, "ta invoke cmd init failed err: %x\n", res)=
;
> >>>>  =09=09dev->smart_pc_enabled =3D false;
> >>>>  =09=09return res;
> >>>>  =09}
> >>>> @@ -390,12 +393,12 @@ static int amd_pmf_amdtee_ta_match(struct tee_=
ioctl_version_data *ver, const voi
> >>>>  =09return ver->impl_id =3D=3D TEE_IMPL_ID_AMDTEE;
> >>>>  }
> >>>> =20
> >>>> -static int amd_pmf_ta_open_session(struct tee_context *ctx, u32 *id=
)
> >>>> +static int amd_pmf_ta_open_session(struct tee_context *ctx, u32 *id=
, int index)
> >>>>  {
> >>>>  =09struct tee_ioctl_open_session_arg sess_arg =3D {};
> >>>>  =09int rc;
> >>>> =20
> >>>> -=09export_uuid(sess_arg.uuid, &amd_pmf_ta_uuid);
> >>>> +=09export_uuid(sess_arg.uuid, &amd_pmf_ta_uuid[index]);
> >>>>  =09sess_arg.clnt_login =3D TEE_IOCTL_LOGIN_PUBLIC;
> >>>>  =09sess_arg.num_params =3D 0;
> >>>> =20
> >>>> @@ -434,7 +437,7 @@ static int amd_pmf_register_input_device(struct =
amd_pmf_dev *dev)
> >>>>  =09return 0;
> >>>>  }
> >>>> =20
> >>>> -static int amd_pmf_tee_init(struct amd_pmf_dev *dev)
> >>>> +static int amd_pmf_tee_init(struct amd_pmf_dev *dev, int index)
> >>>>  {
> >>>>  =09u32 size;
> >>>>  =09int ret;
> >>>> @@ -445,7 +448,7 @@ static int amd_pmf_tee_init(struct amd_pmf_dev *=
dev)
> >>>>  =09=09return PTR_ERR(dev->tee_ctx);
> >>>>  =09}
> >>>> =20
> >>>> -=09ret =3D amd_pmf_ta_open_session(dev->tee_ctx, &dev->session_id);
> >>>> +=09ret =3D amd_pmf_ta_open_session(dev->tee_ctx, &dev->session_id, =
index);
> >>>>  =09if (ret) {
> >>>>  =09=09dev_err(dev->dev, "Failed to open TA session (%d)\n", ret);
> >>>>  =09=09ret =3D -EINVAL;
> >>>> @@ -489,7 +492,8 @@ static void amd_pmf_tee_deinit(struct amd_pmf_de=
v *dev)
> >>>> =20
> >>>>  int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
> >>>>  {
> >>>> -=09int ret;
> >>>> +=09bool status;
> >>>> +=09int ret, i;
> >>>> =20
> >>>>  =09ret =3D apmf_check_smart_pc(dev);
> >>>>  =09if (ret) {
> >>>> @@ -502,10 +506,6 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *d=
ev)
> >>>>  =09=09return -ENODEV;
> >>>>  =09}
> >>>> =20
> >>>> -=09ret =3D amd_pmf_tee_init(dev);
> >>>> -=09if (ret)
> >>>> -=09=09return ret;
> >>>> -
> >>>>  =09INIT_DELAYED_WORK(&dev->pb_work, amd_pmf_invoke_cmd);
> >>>> =20
> >>>>  =09ret =3D amd_pmf_set_dram_addr(dev, true);
> >>>> @@ -534,8 +534,30 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *d=
ev)
> >>>>  =09=09goto error;
> >>>>  =09}
> >>>> =20
> >>>> -=09ret =3D amd_pmf_start_policy_engine(dev);
> >>>> -=09if (ret)
> >>>> +=09for (i =3D 0; i < ARRAY_SIZE(amd_pmf_ta_uuid); i++) {
> >>>> +=09=09ret =3D amd_pmf_tee_init(dev, i);
> >>>
> >>> Any reason why you just pass the uuid pointer as it seems more obviou=
s as=20
> >>> a parameter than something as vague as "index"?
> >>>
> >>
> >> The objective is to select the appropriate Trusted Application (TA)
> >> binary from the /lib/firmware/amdtee/ directory. This selection is
> >> determined by the UUIDs listed in the amd_pmf_ta_uuid[].
> >>
> >> Typically, the most recent TA version should be located at the first
> >> index, with the next most recent version at the second index, and so o=
n.
> >>
> >> All these had to be done so that we don't end up in the version
> >> compatibility issues we had encountered last time.
> >=20
> > I'm sorry, my editing messed the meaning of that comment up (I forgot t=
o=20
> > add the "not" word there). I only meant that you could pass uuid pointe=
r instead
> > of the index.
>=20
> OK. I can respin, just to make sure are you expecting this?
>=20
> //ret =3D amd_pmf_tee_init(dev, i);
> ret =3D amd_pmf_tee_init(dev, &amd_pmf_ta_uuid[i]);
>=20
> so that I propogate the uuid to the export_guid() rather than the index?

Yes.

--=20
 i.

--8323328-216947548-1741104322=:931--

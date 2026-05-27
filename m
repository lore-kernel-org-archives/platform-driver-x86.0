Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538A93E9281
	for <platform-driver-x86@vger.kernel.org>; Wed, 27 May 2026 11:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779880162; cv=none; b=LMTHaq8peiX414FR0TSQPiM2wli/PzHFLyVQoLtMC5aF/0JVHuLq/kTZAZzVXSFVlCLcTBP0mLz8JqkC/GePZW/o6FOyC8sto8r2+DjaNi/GSsvu5UN++Hn2JZvtcUWDO96nGNkx8WlEVV9/d2Mn5fLmTb+fTBTE+mTmAoMrBBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779880162; c=relaxed/simple;
	bh=GVUxngkzgw1tzK9bw97TicHxFfNocI7jqv0a4s/Wqkc=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=cH82u41QRsmNilyLIaPzi00GflRmQ6rytK/hDHD1ZLC5TRn57R+0Vlvra0TMIr6xDbdVjcZYVLLDWCHkhIlkvaD9EzM6h2I1Nmyj84M8BPNDAmFqrlXo9SFS8U6rJW5LLwf3P1k+CKwvIv5zw1owBvURyGi0QllJAoBr3yGsIU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HGhXY9aV; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HGhXY9aV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779880162; x=1811416162;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=GVUxngkzgw1tzK9bw97TicHxFfNocI7jqv0a4s/Wqkc=;
  b=HGhXY9aV710eNHa9u/Ojy/Z8FFuMdqGvPvNE5y5NtylJ5PK5q3Zlu0hU
   eYNHXKuacFsH0MGKfeDvXoTH+WrhXU+PZwE9qJIEvaa2nxcFk6uSzt/11
   /5EHBTrVj8mV5kAjplT8IgB94oBe3HbhnXpeVsoXATFX25IOXDByPYwLD
   ebNkc/2nHKwfS8bfiqeF/pGfucUH8eOt83sUgKH7LPuc1MoPmWsc0agHg
   yrZHosBYKiSjFPyp4zgCDeaBX9q02enDN0oqL3Iaw6i4rx+mf+5ZMrxPx
   yBThmrraOEohRGcTfxNo6Go4/suYhmfE+gBanmH/trkm/vOz6Vji801TB
   Q==;
X-CSE-ConnectionGUID: B3fo09aJSnacJuP8DkXmqQ==
X-CSE-MsgGUID: fsf6InJLT3yHcDnHQWoZbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="80765833"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="80765833"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 04:09:21 -0700
X-CSE-ConnectionGUID: XBzIGLn2SUeHGmw4Rf9Jww==
X-CSE-MsgGUID: ZdQSwk2kRq6OAG8bcya/DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="241369404"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.51])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 04:09:18 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 27 May 2026 14:09:15 +0300 (EEST)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    mario.limonciello@amd.com, Sanket.Goswami@amd.com
Subject: Re: [PATCH v5 6/8] platform/x86/amd/pmf: Implement util layer ioctl
 handler
In-Reply-To: <86cfbcde-cf99-49f0-a7f7-acbf4a529ed3@amd.com>
Message-ID: <56d758d6-4cc9-44c8-a995-9ca143b5e924@linux.intel.com>
References: <20260520185424.770772-1-Shyam-sundar.S-k@amd.com> <20260520185424.770772-7-Shyam-sundar.S-k@amd.com> <22cddbea-3aab-cda5-7c66-9386889f1102@linux.intel.com> <86cfbcde-cf99-49f0-a7f7-acbf4a529ed3@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-607546815-1779880155=:1189"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-607546815-1779880155=:1189
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 27 May 2026, Shyam Sundar S K wrote:
> On 5/21/2026 16:28, Ilpo J=C3=A4rvinen wrote:
> > On Thu, 21 May 2026, Shyam Sundar S K wrote:
> >=20
> >> Implement the ioctl handler for the util layer character device. This
> >> support adds the actual functionality to populate PMF metrics from the
> >> TA shared memory buffer and return them to userspace.
> >>
> >> The implementation includes:
> >> - amd_pmf_populate_data() to extract metrics from TA shared memory
> >> - amd_pmf_set_ioctl() to handle userspace ioctl requests
> >> - Size negotiation for forward/backward compatibility
> >> - Feature-based population of struct fields
> >>
> >> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> >> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> >> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> >> ---
> >>  drivers/platform/x86/amd/pmf/util.c | 90 ++++++++++++++++++++++++++++=
-
> >>  1 file changed, 89 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/platform/x86/amd/pmf/util.c b/drivers/platform/x8=
6/amd/pmf/util.c
> >> index 0052f0b6a7a5..eb9a02e135a9 100644
> >> --- a/drivers/platform/x86/amd/pmf/util.c
> >> +++ b/drivers/platform/x86/amd/pmf/util.c
> >> @@ -19,9 +19,97 @@
> >>  static struct amd_pmf_dev *pmf_dev_handle;
> >>  static DEFINE_MUTEX(pmf_util_lock);
> >> =20
> >> +static int amd_pmf_populate_data(struct amd_pmf_dev *pdev, struct amd=
_pmf_info *info)
> >> +{
> >> +=09struct ta_pmf_shared_memory *ta_sm =3D NULL;
> >> +=09struct ta_pmf_enact_table *in =3D NULL;
> >> +=09int idx;
> >> +
> >> +=09if (!pdev || !info)
> >> +=09=09return -EINVAL;
> >> +
> >> +=09ta_sm =3D pdev->shbuf;
> >> +=09in =3D &ta_sm->pmf_input.enact_table;
> >> +
> >> +=09/* Set size and version */
> >> +=09info->size =3D sizeof(struct amd_pmf_info);
> >=20
> > sizeof(*info)
> >=20
> > version ???
> >=20
> >> +
> >> +=09/* PMF Feature support flags */
> >> +=09if (is_apmf_func_supported(pdev, APMF_FUNC_AUTO_MODE))
> >> +=09=09info->features_supported |=3D AMD_PMF_FEAT_AUTO_MODE;
> >> +=09if (is_apmf_func_supported(pdev, APMF_FUNC_STATIC_SLIDER_GRANULAR)=
)
> >> +=09=09info->features_supported |=3D AMD_PMF_FEAT_STATIC_POWER_SLIDER;
> >> +=09if (pdev->smart_pc_enabled)
> >> +=09=09info->features_supported |=3D AMD_PMF_FEAT_POLICY_BUILDER;
> >> +=09if (is_apmf_func_supported(pdev, APMF_FUNC_DYN_SLIDER_AC))
> >> +=09=09info->features_supported |=3D AMD_PMF_FEAT_DYNAMIC_POWER_SLIDER=
_AC;
> >> +=09if (is_apmf_func_supported(pdev, APMF_FUNC_DYN_SLIDER_DC))
> >> +=09=09info->features_supported |=3D AMD_PMF_FEAT_DYNAMIC_POWER_SLIDER=
_DC;
> >> +
> >> +=09/* Device States */
> >> +=09info->platform_type =3D in->ev_info.platform_type;
> >> +=09info->laptop_placement =3D in->ev_info.device_state;
> >> +=09info->lid_state =3D in->ev_info.lid_state;
> >> +=09info->user_presence =3D in->ev_info.user_present;
> >> +=09info->slider_position =3D in->ev_info.power_slider;
> >> +
> >> +=09/* Thermal and Power Metrics */
> >> +=09info->power_source =3D in->ev_info.power_source;
> >> +=09info->skin_temp =3D in->ev_info.skin_temperature;
> >> +=09info->gfx_busy =3D in->ev_info.gfx_busy;
> >> +=09info->ambient_light =3D in->ev_info.ambient_light;
> >> +=09info->avg_c0_residency =3D in->ev_info.avg_c0residency;
> >> +=09info->max_c0_residency =3D in->ev_info.max_c0residency;
> >> +=09info->socket_power =3D in->ev_info.socket_power;
> >=20
> > I've no big problem with this, though I seem to now recall Hans also wa=
s=20
> > suggesting the in-kernel data would be layouted such that this copy wou=
ld=20
> > be easier (but please check).
> >=20
> > In any case, my plan is to ask Hans to check the next version of this=
=20
> > series now that it will be hopefully ready/almost ready.
>=20
> Sure. We can gather feedback from Hans once you are comfortable with
> the changes in v6.
>=20
> >=20
> >> +=09/* Custom BIOS input parameters */
> >> +=09for (idx =3D 0; idx < AMD_PMF_BIOS_PARAMS_MAX; idx++) {
> >> +=09=09if (idx < 2)
> >> +=09=09=09info->bios_input[idx] =3D in->ev_info.bios_input_1[idx];
> >> +=09=09else
> >> +=09=09=09info->bios_input[idx] =3D in->ev_info.bios_input_2[idx - 2];
> >=20
> > This seems to duplicate amd_pmf_get_ta_custom_bios_inputs().
>=20
> Not sure how they are duplicates..
>=20
> amd_pmf_get_ta_custom_bios_inputs() -> just returns the index of the
> bios input
>=20
> But, here in this code snippet, we store the values of the bios inputs
> to propagate back to the userland.

Isn't the loop equivalent to this:

=09for (idx =3D 0; idx < AMD_PMF_BIOS_PARAMS_MAX; idx++) {
=09=09info->bios_input[idx] =3D=09amd_pmf_get_ta_custom_bios_inputs(id, idx=
);

> >> +=09}
> >> +
> >> +=09/* BIOS output parameters */
> >> +=09for (idx =3D 0; idx < AMD_PMF_BIOS_PARAMS_MAX; idx++)
> >> +=09=09info->bios_output[idx] =3D pdev->bios_output[idx];
> >> +
> >> +=09return 0;
> >> +}
> >> +
> >>  static long amd_pmf_set_ioctl(struct file *filp, unsigned int cmd, un=
signed long arg)
> >>  {
> >> -=09return -ENOTTY;
> >> +=09struct amd_pmf_dev *pdev =3D filp->private_data;
> >> +=09void __user *argp =3D (void __user *)arg;
> >> +=09struct amd_pmf_info info =3D {};
> >> +=09size_t copy_size;
> >> +=09__u64 user_size;
> >> +=09int ret;
> >> +
> >> +=09if (cmd !=3D IOCTL_AMD_PMF_POPULATE_DATA)
> >> +=09=09return -ENOTTY;
> >> +
> >> +=09/* First read just the size field from userspace */
> >> +=09if (copy_from_user(&user_size, argp, sizeof(user_size)))
> >> +=09=09return -EFAULT;
> >=20
> > Just an interface though, if features are ever needed as userspace ->=
=20
> > kernel comminucation channel, it should be handled properly right from=
=20
> > the start, with -EINVAL being returned for invalid (unknown) values.
> >=20
> > This is not meant to say, you must act on this, you have better idea ho=
w=20
> > this interface may evolve over the years than I do. But if an ability t=
o=20
> > query a set of features only would be useful at some point, it would be=
=20
> > beneficial to take account now as we cannot change it later to not brea=
k
> > ABI rules (if userspace passes struct that has only user_size initalize=
d=20
> > and pseudogarbage in ->features, we cannot start to return -EINVAL beca=
use=20
> > of that later).
>=20
> The thought process was to have an interface where the userspace can
> query what features are/were supported and as unidirectional
> communication channel.

It's already bidirectional because of size.

> But, we never know what might actually come up in future. So, would
> like to address your comment now.
>=20
> Can you please check if this is what you are expecting?
>=20
> if (user_size > sizeof(__u64)) {
>     __u32 features_from_user =3D 0;
>=20
>     if (copy_from_user(&features_from_user, argp + offsetof(struct
> amd_pmf_info, features_supported),
> sizeof(features_from_user)))
>         return -EFAULT;
>=20
>     // Reject non-zero values NOW
>     if (features_from_user !=3D 0)
>         return -EINVAL;  // =E2=86=90 Forces userspace to zero-initialize=
!

Yes, this is is the check I was interesting in seeing.

> }

I suggest you first copy both size and features fields.

> > I wonder if user_size > sizeof(*info) is a bit dangerous condition and=
=20
> > should also result in -EFAULT. It result in leaving the rest of the str=
uct=20
> > uninitialized (from userspace's PoV) when userspace and this kernel=20
> > version disagree what's the size of the struct.
> >=20
>=20
> So,
>=20
> +=09if (!IS_ALIGNED(user_size, sizeof(__u64)))
> +=09=09return -EINVAL;
>=20
> Should help address your comment right?
>=20
> If no, I think I am missing your feedback. Can you elaborate?

No, it doesn't.

Kernel copies only sizeof(*info) worth of bytes back to userspace, if=20
userspace asks more than sizeof(*info), the rest is left as it was (not=20
zeroed). Arguably, info.size tells userspace how much was actually copied=
=20
but in practice this happens when userspace has struct amd_pmf_info which=
=20
is different from that of kernel's (userspace tool was built with newer=20
kernel headers than it now executes on). Accepting such partially filled=20
struct in userspace will be walking on a cliff edge because some of the=20
fields will not be filled with values but garbage.

Maybe this is userspace's own problem. I'm just trying to think various=20
pitfalls the interface could have. And if userspace does properly=20
initialize the struct before calling kernel, it doesn't have so big=20
problem.

--=20
 i.

--8323328-607546815-1779880155=:1189--

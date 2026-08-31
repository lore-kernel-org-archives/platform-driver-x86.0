Received: from prime.voidband.net (prime.voidband.net [199.247.17.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171FE3C1083
	for <platform-driver-x86@vger.kernel.org>; Mon, 31 Aug 2026 09:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.247.17.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788169168; cv=none; b=EqvFpM94N0HCmCrnu3EzGl/Ul/lJfVmYxGx6J3PfYDF2Ur2gdX9qBcUhmHRyUtmxmpv+czBa9JrQA4B/6hhunxjIVptyKb7k4ntXcgsbJw5U8Y8mQ8DlVRBnJv8GyiAqrsRxm6EH6moURZfVY9PKYamlcjh1QdMfWt8TVNJxkmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788169168; c=relaxed/simple;
	bh=/1fFc5E/PLVUNZv8Dte7uyI3zKSepH4Z8ZViQENxnGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uUaWqcPGfoX0XLqLCxZKznBPE8AieSAx5kyLUunTi8v/1gIvA+E1zUUYfLaFrrABSY9MzDkwWl5vwlrS0cfOWF5n6nUs+ZfVNybVeIgADcXl5gDyVbBvH7QxBpXgOcXVNgyqeJ1BDV8qcMDvueYb+/+hGNUOzjsoroh6tTcTam8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=natalenko.name; spf=pass smtp.mailfrom=natalenko.name; dkim=pass (1024-bit key) header.d=natalenko.name header.i=@natalenko.name header.b=pwW2smQX; arc=none smtp.client-ip=199.247.17.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=natalenko.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=natalenko.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=natalenko.name header.i=@natalenko.name header.b="pwW2smQX"
Received: from spock.localnet (unknown [212.20.115.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by prime.voidband.net (Postfix) with ESMTPSA id 5EE37635B040;
	Mon, 31 Aug 2026 11:30:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=natalenko.name;
	s=dkim-20170712; t=1788168647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VrYT3JWVq1lxDVq+nTTR5/rmjHD1ulkCaEGLDUREwNI=;
	b=pwW2smQX1RpggsZ1e+8V4Bt5dpIRpuTVjdsAul+btb/0TK77AOllEGvC6HavY82ojvlHI0
	a1S/W9hEFByJiOMC4Pk5Js2030uzcYI/1svzOkwoIB8SZkYPCR/rNbNIdm9aff6mmlERKD
	mszmVy4PlGL/spCGGVgT11V462Odgvs=
From: Oleksandr Natalenko <oleksandr@natalenko.name>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
 platform-driver-x86@vger.kernel.org, mario.limonciello@amd.com,
 Sanket.Goswami@amd.com
Subject:
 Re: [PATCH v7 5/7] platform/x86/amd/pmf: Implement util layer ioctl handler
Date: Mon, 31 Aug 2026 11:30:30 +0200
Message-ID: <fS7s9V_xTaedaqEAaxwKnQ@natalenko.name>
In-Reply-To: <20260609081044.2416731-6-Shyam-sundar.S-k@amd.com>
References:
 <20260609081044.2416731-1-Shyam-sundar.S-k@amd.com>
 <20260609081044.2416731-6-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartXrIw6VLVTpSHBkcOaZhAFg";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
x-ms-reactions: disallow

--nextPartXrIw6VLVTpSHBkcOaZhAFg
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Oleksandr Natalenko <oleksandr@natalenko.name>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Date: Mon, 31 Aug 2026 11:30:30 +0200
Message-ID: <fS7s9V_xTaedaqEAaxwKnQ@natalenko.name>
In-Reply-To: <20260609081044.2416731-6-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0

Hello.

On =C3=BAter=C3=BD 9. =C4=8Dervna 2026 10:10:42, st=C5=99edoevropsk=C3=BD l=
etn=C3=AD =C4=8Das Shyam Sundar S K wrote:
> Implement the ioctl handler for the util layer character device. This
> support adds the actual functionality to populate PMF metrics from the
> TA shared memory buffer and return them to userspace.
>=20
> The implementation includes:
> - amd_pmf_populate_data() to extract metrics from TA shared memory
> - amd_pmf_set_ioctl() to handle userspace ioctl requests
> - Size negotiation for forward/backward compatibility
> - Feature-based population of struct fields
> - Export amd_pmf_get_ta_custom_bios_inputs()
>=20
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/pmf.h  |  1 +
>  drivers/platform/x86/amd/pmf/spc.c  |  3 +-
>  drivers/platform/x86/amd/pmf/util.c | 86 ++++++++++++++++++++++++++++-
>  3 files changed, 88 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/am=
d/pmf/pmf.h
> index 269c0a4b1cae..752fa5dd2267 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -903,6 +903,7 @@ int amd_pmf_smartpc_apply_bios_output(struct amd_pmf_=
dev *dev, u32 val, u32 preq
>  void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_e=
nact_table *in);
>  void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact=
_table *in);
>  int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev);
> +u32 amd_pmf_get_ta_custom_bios_inputs(struct ta_pmf_enact_table *in, int=
 index);
> =20
>  int amd_pmf_tee_init(struct amd_pmf_dev *dev, const uuid_t *uuid);
>  void amd_pmf_tee_deinit(struct amd_pmf_dev *dev);
> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/am=
d/pmf/spc.c
> index 6e33824ccadc..94355b435a66 100644
> --- a/drivers/platform/x86/amd/pmf/spc.c
> +++ b/drivers/platform/x86/amd/pmf/spc.c
> @@ -18,7 +18,7 @@
>  #include "pmf.h"
> =20
>  #ifdef CONFIG_AMD_PMF_DEBUG
> -static u32 amd_pmf_get_ta_custom_bios_inputs(struct ta_pmf_enact_table *=
in, int index)
> +u32 amd_pmf_get_ta_custom_bios_inputs(struct ta_pmf_enact_table *in, int=
 index)

^^ was this function also meant to be placed outside of CONFIG_AMD_PMF_DEBU=
G? With v7.3-rc1, I get the following error

ERROR: modpost: drivers/platform/x86/amd/pmf/amd-pmf.ko: symbol 'amd_pmf_ge=
t_ta_custom_bios_inputs' undefined!

if CONFIG_AMD_PMF_DEBUG is not set.

Thanks.

>  {
>  	switch (index) {
>  	case 0 ... 1:
> @@ -29,6 +29,7 @@ static u32 amd_pmf_get_ta_custom_bios_inputs(struct ta_=
pmf_enact_table *in, int
>  		return 0;
>  	}
>  }
> +EXPORT_SYMBOL(amd_pmf_get_ta_custom_bios_inputs);
> =20
>  void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact=
_table *in)
>  {
> diff --git a/drivers/platform/x86/amd/pmf/util.c b/drivers/platform/x86/a=
md/pmf/util.c
> index f8a283192ffe..d0d592f21db8 100644
> --- a/drivers/platform/x86/amd/pmf/util.c
> +++ b/drivers/platform/x86/amd/pmf/util.c
> @@ -19,9 +19,93 @@
>  static struct amd_pmf_dev *pmf_dev_handle;
>  static DEFINE_MUTEX(pmf_util_lock);
> =20
> +static int amd_pmf_populate_data(struct amd_pmf_dev *pdev, struct amd_pm=
f_info *info)
> +{
> +	struct ta_pmf_shared_memory *ta_sm =3D NULL;
> +	struct ta_pmf_enact_table *in =3D NULL;
> +	int idx;
> +
> +	if (!pdev || !info)
> +		return -EINVAL;
> +
> +	if (!pdev->shbuf)
> +		return -EINVAL;
> +
> +	ta_sm =3D pdev->shbuf;
> +	in =3D &ta_sm->pmf_input.enact_table;
> +
> +	/* Set size */
> +	info->size =3D sizeof(*info);
> +
> +	/* PMF Feature support flags */
> +	if (is_apmf_func_supported(pdev, APMF_FUNC_AUTO_MODE))
> +		info->features_supported |=3D AMD_PMF_FEAT_AUTO_MODE;
> +	if (is_apmf_func_supported(pdev, APMF_FUNC_STATIC_SLIDER_GRANULAR))
> +		info->features_supported |=3D AMD_PMF_FEAT_STATIC_POWER_SLIDER;
> +	if (pdev->smart_pc_enabled)
> +		info->features_supported |=3D AMD_PMF_FEAT_POLICY_BUILDER;
> +	if (is_apmf_func_supported(pdev, APMF_FUNC_DYN_SLIDER_AC))
> +		info->features_supported |=3D AMD_PMF_FEAT_DYNAMIC_POWER_SLIDER_AC;
> +	if (is_apmf_func_supported(pdev, APMF_FUNC_DYN_SLIDER_DC))
> +		info->features_supported |=3D AMD_PMF_FEAT_DYNAMIC_POWER_SLIDER_DC;
> +
> +	/* Device States */
> +	info->platform_type =3D in->ev_info.platform_type;
> +	info->laptop_placement =3D in->ev_info.device_state;
> +	info->lid_state =3D in->ev_info.lid_state;
> +	info->user_presence =3D in->ev_info.user_present;
> +	info->slider_position =3D in->ev_info.power_slider;
> +
> +	/* Thermal and Power Metrics */
> +	info->power_source =3D in->ev_info.power_source;
> +	info->skin_temp =3D in->ev_info.skin_temperature;
> +	info->gfx_busy =3D in->ev_info.gfx_busy;
> +	info->ambient_light =3D in->ev_info.ambient_light;
> +	info->avg_c0_residency =3D in->ev_info.avg_c0residency;
> +	info->max_c0_residency =3D in->ev_info.max_c0residency;
> +	info->socket_power =3D in->ev_info.socket_power;
> +
> +	/* Custom BIOS input parameters */
> +	for (idx =3D 0; idx < AMD_PMF_BIOS_PARAMS_MAX; idx++)
> +		info->bios_input[idx] =3D amd_pmf_get_ta_custom_bios_inputs(in, idx);
> +
> +	/* BIOS output parameters */
> +	for (idx =3D 0; idx < AMD_PMF_BIOS_PARAMS_MAX; idx++)
> +		info->bios_output[idx] =3D pdev->bios_output[idx];
> +
> +	return 0;
> +}
> +
>  static long amd_pmf_set_ioctl(struct file *filp, unsigned int cmd, unsig=
ned long arg)
>  {
> -	return -ENOTTY;
> +	struct amd_pmf_dev *pdev =3D filp->private_data;
> +	void __user *argp =3D (void __user *)arg;
> +	struct amd_pmf_info info =3D {};
> +	size_t copy_size;
> +	__u64 user_size;
> +	int ret;
> +
> +	if (cmd !=3D IOCTL_AMD_PMF_POPULATE_DATA)
> +		return -ENOTTY;
> +
> +	/* First read just the size field from userspace */
> +	if (copy_from_user(&user_size, argp, sizeof(user_size)))
> +		return -EFAULT;
> +
> +	guard(mutex)(&pmf_util_lock);
> +	ret =3D amd_pmf_populate_data(pdev, &info);
> +	if (ret)
> +		return ret;
> +
> +	copy_size =3D min_t(size_t, user_size, sizeof(info));
> +
> +	/* Set actual size being copied */
> +	info.size =3D copy_size;
> +
> +	if (copy_to_user(argp, &info, copy_size))
> +		return -EFAULT;
> +
> +	return 0;
>  }
> =20
>  static int amd_pmf_open(struct inode *inode, struct file *filp)
>=20


=2D-=20
Oleksandr Natalenko, MSE
--nextPartXrIw6VLVTpSHBkcOaZhAFg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEZUOOw5ESFLHZZtOKil/iNcg8M0sFAmqVSbYACgkQil/iNcg8
M0uIWBAAzAbSjfRhP3EViylOUg7ljEYjWaQAfGbisV45WeZn9KececdXNjOqMpNU
yOeUl9gTNVOPf0vkxdFoZRSOI+vNyLD/24gaC4BvCQUdzpoUideaR82EOYTKlP6U
vYXBtxn5o/RZ9cr3KTE/UiitJy2/QIKVyNSG2WuPj7Jybcz0mzd/kX2w2NM3WEwP
M816LR0KSRLqYq0uFXNVLp8gRdUalfA98vxsDpv1tVcCx0SyLG/5pBGjqSwIpuKz
GqcKddnSq1n2En5TLuL5R/AZ9keEuyWwMqSZRIzw/FoLo7KadDOEu1tcvNv5kW11
4MGHljERGaiaLa+Tf/QLrvb0Yenc+IykYiLfAvsPvUs1j9Qsy3j6iVQb4ci/UIT3
ZDu28PLt07Rjaz6o8AaftCnfzgh0DtHWgkcIWN4JVmQ6YmzYxFEfAOLI07mhE7EM
BaMnLRYGmGMhfHg9CHwViYTtOjuf1cvBm3qsQFxGGNO0njXOVylMxVrh0yjMPp47
1Cd59YEIL2ptxN9O4MRmuUaJ4k9CvfxXiz/a441cAfOIkXuZgR4i1koz5C0btDtX
siwSGw/DuW8dskh9ZIY7Yzocdk17YI2hl87tFkoYbbRdEPmKmx7TLNEqSTwQqQsh
qNa//gF0rsKsBDKrRqmjgqIhjEG76mWlYmOc7oPy9PH7SQuulhw=
=L9dy
-----END PGP SIGNATURE-----

--nextPartXrIw6VLVTpSHBkcOaZhAFg--




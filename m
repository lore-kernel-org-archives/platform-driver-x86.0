Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5702E44C509;
	Mon, 24 Aug 2026 15:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787586176; cv=none; b=h3TJodbm+QXQLWwENwxYlHE4Mnd1Wr/pHyxaZifllpdaVHBKfvAe4/zYvtnYcIktWNL+vSpd0//+yg0rJM3EkhKPReEWaOpIRW3vznCHu8cNqR9i0HZejU+0vQhBBtE7XhUBlCfc5wsD2IPy0lmn8bE9KUt6anLW2vqwgvdLgEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787586176; c=relaxed/simple;
	bh=miW1iSfJyVE2/Qav2/EJvuAVqihTC60gaVR7S80Fh2A=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=uG+O/vZzgAvkILDvF518+Xhvjb7WQD+E/4yBuUwBLaEiDjctvo3M6VLCOkNHlxlM2uvjw9DunJZifTwwWCx6cplGHMwshgT9WjMqCpDcqiGNdcPvHVnjOhEfhtCltvrck9DwlsEtk47DqFlG9E8F4gKZYLiFFLU9rDIReM+9x/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O27FjqsX; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O27FjqsX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787586172; x=1819122172;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=miW1iSfJyVE2/Qav2/EJvuAVqihTC60gaVR7S80Fh2A=;
  b=O27FjqsX5WEI8x6JKjc8rmu+psHp/jzJ5nIt10UBPbarf2n2PEzhVKuY
   vpPfoOmq2D+uWew6LbzRl/nqYzQQmqkkf0PJEVt3X03/QqkpxLRtUKvfc
   E53gBrdmVbs7L0DVV9gKaZR8M0pSBdsx5KtUZR14pK2TGIGVeRaCJTv6H
   IgqkfotSe+7ENXVKec/W5bEss03WW8uq4fLL1L0436KgOdtEtBWqOrhTd
   aCRQc5OGYuXdutRDwyU2XRCg4mHAUzdnLftGjYHSqgPlGfG5rl8cDkdHL
   /u52ZlyhdJ9C3a/OfGlGgH8P6Di+d0HA71usggxxNqiW+Ofso0fj2R9h6
   Q==;
X-CSE-ConnectionGUID: cQyFZmFqQcCLhQvgjYtdWw==
X-CSE-MsgGUID: 8pSpxLJsR5Ky2EvkWcbJRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="87963257"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="87963257"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 08:42:49 -0700
X-CSE-ConnectionGUID: SBviQyd2ScezzRe9QGnNfQ==
X-CSE-MsgGUID: l6yexow8Q5+BKauuUBZAtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="265727967"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.154])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 08:42:46 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 24 Aug 2026 18:42:43 +0300 (EEST)
To: =?GB2312?B?y+8g0/7D+g==?= <wolf109909@outlook.com>
cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, 
    "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
    Mingyou Chen <qby140326@gmail.com>, Armin Wolf <W_Armin@gmx.de>, 
    Hans de Goede <hansg@kernel.org>, Nabil Danial <nabildanial.93@gmail.com>
Subject: Re: [RESEND PATCH 1/5] platform/x86: bitland-mifs-wmi: validate WMAA
 status, never abort suspend
In-Reply-To: <20260728180944.51356-2-wolf109909@outlook.com>
Message-ID: <bc7a6576-54da-1517-5d0c-adbb3d77fa78@linux.intel.com>
References: <20260728180944.51356-1-wolf109909@outlook.com> <20260728180944.51356-2-wolf109909@outlook.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-225716011-1787586163=:1164"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-225716011-1787586163=:1164
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 28 Jul 2026, =E5=AD=99 =E8=AA=89=E9=93=AD wrote:

> The WMAA firmware method signals "unknown/unsupported function" with
> the status word 0xe000 in the reply. The driver never checked it, so
> calls to functions a given firmware revision does not implement
> silently returned zero-filled data instead of failing.
>=20
> Worse, the platform_profile suspend hook propagated such errors: on
> firmware whose perf-mode query returns values laptop_profile_get()
> cannot map (e.g. MIFS v2 firmware reporting raw QFAN codes, seen on
> Xiaomi Book Pro 14 2026 and REDMI Book Pro 14 2025), every suspend
> attempt died with:
>=20
>   dpm_run_callback(): bitland_mifs_wmi_suspend returns -22
>   PM: Some devices failed to suspend, or early wake event detected
>=20
> Return -EOPNOTSUPP when the firmware reports the error status word,
> and make the suspend/resume hooks fault-tolerant: skip saving and
> restoring the profile when the query fails instead of aborting the
> whole system sleep.
>=20
> Status word semantics verified against the laptop's SSDT WMAA method
> (SGER=3D0x8000 on success, 0xe000 in the Default branch).
>=20
> Signed-off-by: Yuming Sun <wolf109909@outlook.com>
> ---
>  drivers/platform/x86/bitland-mifs-wmi.c | 31 +++++++++++++++++++++----
>  1 file changed, 27 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x=
86/bitland-mifs-wmi.c
> index 3a373184..12426d11 100644
> --- a/drivers/platform/x86/bitland-mifs-wmi.c
> +++ b/drivers/platform/x86/bitland-mifs-wmi.c
> @@ -129,6 +129,18 @@ struct bitland_mifs_output {
>  =09u8 data[28];
>  } __packed;
> =20
> +/*
> + * The status word of a WMAA reply is formed by the first two bytes
> + * (reserved1 | operation << 8). MIFS firmware signals "unknown or
> + * unsupported function" with 0xe000 and success with 0x8000.
> + */
> +#define MIFS_STATUS_ERROR=090xe000
> +
> +static u16 mifs_status(const struct bitland_mifs_output *out)
> +{
> +=09return out->reserved1 | (out->operation << 8);

How about using union inside the struct and a type that annotates the=20
endianness + endianness accessor to read it here?

> +}
> +
>  struct bitland_mifs_event {
>  =09u8 event_type;
>  =09u8 event_id;
> @@ -159,6 +171,7 @@ struct bitland_mifs_wmi_data {
>  =09struct device *hwmon_dev;
>  =09struct device *pp_dev;
>  =09enum platform_profile_option saved_profile;
> +=09bool profile_valid;
>  };
> =20
>  static int bitland_mifs_wmi_call(struct bitland_mifs_wmi_data *data,
> @@ -181,6 +194,9 @@ static int bitland_mifs_wmi_call(struct bitland_mifs_=
wmi_data *data,
>  =09memcpy(output, out_buf.data, sizeof(*output));
>  =09kfree(out_buf.data);
> =20
> +=09if (mifs_status(output) =3D=3D MIFS_STATUS_ERROR)
> +=09=09return -EOPNOTSUPP;
> +
>  =09return 0;
>  }
> =20
> @@ -298,17 +314,21 @@ static int bitland_mifs_wmi_suspend(struct device *=
dev)
>  {
>  =09struct bitland_mifs_wmi_data *data =3D dev_get_drvdata(dev);
>  =09enum platform_profile_option profile;
> -=09int ret;
> =20
>  =09/* Skip event device */
>  =09if (!data->pp_dev)
>  =09=09return 0;
> =20
> -=09ret =3D laptop_profile_get(data->pp_dev, &profile);
> -=09if (ret =3D=3D 0)
> +=09/*
> +=09 * Never abort suspend: some firmware revisions answer the perf-mode
> +=09 * query with values this driver cannot map, or fail the call
> +=09 * entirely while the system is going down.
> +=09 */
> +=09data->profile_valid =3D laptop_profile_get(data->pp_dev, &profile) =
=3D=3D 0;
> +=09if (data->profile_valid)

This code makes no sense to me. laptop_profile_get() can return error=20
codes so how come can profile be "valid" in that case?

>  =09=09data->saved_profile =3D profile;
> =20
> -=09return ret;
> +=09return 0;
>  }
> =20
>  static int bitland_mifs_wmi_resume(struct device *dev)
> @@ -319,6 +339,9 @@ static int bitland_mifs_wmi_resume(struct device *dev=
)
>  =09if (!data->pp_dev)
>  =09=09return 0;
> =20
> +=09if (!data->profile_valid)
> +=09=09return 0;
> +
>  =09dev_dbg(dev, "Resuming, restoring profile %d\n", data->saved_profile)=
;
>  =09return laptop_profile_set(dev, data->saved_profile);
>  }
>=20

--=20
 i.

--8323328-225716011-1787586163=:1164--

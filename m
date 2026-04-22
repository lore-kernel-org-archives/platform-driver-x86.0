Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6023375F9A;
	Wed, 22 Apr 2026 15:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776872982; cv=none; b=l1xpfObuNwkKP4pCKwqPZvEjxpUKwnwRYG0yNB5l81pomoq66p+6F9Gy7alD/wr0fCWpq1frJb0NFNzEzOOYGJd3w+pef09LT3vecddjCcoT9kZI/gU1BRP/gVGUBQ+lC5Vt/5jHDT8iYfNeipFiGr/MoLqNy+eBYLs0QK3jnMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776872982; c=relaxed/simple;
	bh=riHHVLqImjXHOko8Jk1i1dh3X2lF7U6GwHdwGvhso/g=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cNYZ4ZAp15EwICqkMwQIjyl4srIbCptrJKakjOTB8jh5BaVq15JdqLQUnM2Ulm9IP+U9TZ1URx6KKgblLJ0G4MlQUlK27DPVWCvqviQ0nF9yqMOIqbAQg8edUvk/8Eqh8com8s0leCpKVIjqbHiCkE11VOSb38KzJGsq6kPOrcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BmFVAS9L; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BmFVAS9L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776872979; x=1808408979;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=riHHVLqImjXHOko8Jk1i1dh3X2lF7U6GwHdwGvhso/g=;
  b=BmFVAS9LnvgFAaF47VUVzSjF1yLhenVoPvyPHKZdtRKgI4eAESYv86VF
   t/mzHYM/+0LNZqS83iVADLH/0BF36gzYsBhLXUqcVO6ON0csMzHoWcgpn
   hO5uEceOM9jmEaJxaXHVjqTA+JnCqGofbmHPM66YMs57uE1bY8P6dj7fS
   e5o/PFSkSDj8sm9kZ6/ndxnbQb5lP9ITHPeNdLBwbv0sB9CYnjhqSNRSi
   OsVTHnmsjNvALU0tVlKoZ0lpJ6GPYnaxkjfOU5pSVfdjZpbHOa1x7VG/r
   d2+sncdC1HfwviVf5pdDO7DsjAJgwwk6VnXqBeH85EGshHJ12puRS2pc8
   Q==;
X-CSE-ConnectionGUID: oZ2Fol6RSVi+cFKD0a6jXw==
X-CSE-MsgGUID: cL3jEvdfSLS7AJKLPko0zA==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="100483991"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="100483991"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 08:49:38 -0700
X-CSE-ConnectionGUID: C8Ee5GzYRxuGR3LEI3RlDw==
X-CSE-MsgGUID: dtx3aqx2R9ySx3ByHGjSdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="229720573"
Received: from spandruv-desk2.jf.intel.com ([10.88.27.176])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 08:49:37 -0700
Message-ID: <3f5125cd88361c88fa7604eba262c82f1cc20c2f.camel@linux.intel.com>
Subject: Re: [PATCH v3 1/2] platform/x86/intel-uncore-freq: Rename
 instance_id
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>,
 skhan@linuxfoundation.org, 	ilpo.jarvinen@linux.intel.com,
 hansg@kernel.org, corbet@lwn.net
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	linux-doc@vger.kernel.org, Maciej Wieczor-Retman
	 <maciej.wieczor-retman@intel.com>
Date: Wed, 22 Apr 2026 08:49:37 -0700
In-Reply-To: <4d983157199cf0e163597df254e2dc629878b818.1775665057.git.m.wieczorretman@pm.me>
References: <cover.1775665057.git.m.wieczorretman@pm.me>
	 <4d983157199cf0e163597df254e2dc629878b818.1775665057.git.m.wieczorretman@pm.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2026-04-08 at 16:27 +0000, Maciej Wieczor-Retman wrote:
> From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
>=20
> The "instance" word has a specific meaning in TPMI. It is a physical
> index related to compute dies and IO dies present on a single TPMI
> partition (which is also a single TPMI device). It's used for mapping
> MMIO blocks for direct TPMI register access.
>=20
> The currently used "instance_id" uncore_data struct field is a
> sequentially generated value that's used for appending to uncore
> directories inside the /sys/devices/system/cpu/intel_uncore_frequency
> directory. It has no relation to the physical TPMI elements.
>=20

In future, It is always better to say no functional changes as this is
just renaming.

> Signed-off-by: Maciej Wieczor-Retman
> <maciej.wieczor-retman@intel.com>
> Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> ---
> Changelog v3:
> - Add Srinivas' Acked-by.
>=20
> Changelog v2:
> - Redid the first paragraph to better describe what "instance" is.
> - Rename seqname_id to seqnum_id to emphasize it's a sequential
> number
> =C2=A0 not sequential name.
>=20
> =C2=A0.../x86/intel/uncore-frequency/uncore-frequency-common.c=C2=A0=C2=
=A0=C2=A0 | 6 +++-
> --
> =C2=A0.../x86/intel/uncore-frequency/uncore-frequency-common.h=C2=A0=C2=
=A0=C2=A0 | 4 ++--
> =C2=A02 files changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-
> frequency-common.c b/drivers/platform/x86/intel/uncore-
> frequency/uncore-frequency-common.c
> index 7070c94324e0..25ab511ed8d2 100644
> --- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-
> common.c
> +++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-
> common.c
> @@ -268,7 +268,7 @@ int uncore_freq_add_entry(struct uncore_data
> *data, int cpu)
> =C2=A0		if (ret < 0)
> =C2=A0			goto uncore_unlock;
> =C2=A0
> -		data->instance_id =3D ret;
> +		data->seqnum_id =3D ret;
> =C2=A0		scnprintf(data->name, sizeof(data->name),
> "uncore%02d", ret);
> =C2=A0	} else {
> =C2=A0		scnprintf(data->name, sizeof(data->name),
> "package_%02d_die_%02d",
> @@ -281,7 +281,7 @@ int uncore_freq_add_entry(struct uncore_data
> *data, int cpu)
> =C2=A0	ret =3D create_attr_group(data, data->name);
> =C2=A0	if (ret) {
> =C2=A0		if (data->domain_id !=3D UNCORE_DOMAIN_ID_INVALID)
> -			ida_free(&intel_uncore_ida, data-
> >instance_id);
> +			ida_free(&intel_uncore_ida, data-
> >seqnum_id);
> =C2=A0	} else {
> =C2=A0		data->control_cpu =3D cpu;
> =C2=A0		data->valid =3D true;
> @@ -301,7 +301,7 @@ void uncore_freq_remove_die_entry(struct
> uncore_data *data)
> =C2=A0	data->control_cpu =3D -1;
> =C2=A0	data->valid =3D false;
> =C2=A0	if (data->domain_id !=3D UNCORE_DOMAIN_ID_INVALID)
> -		ida_free(&intel_uncore_ida, data->instance_id);
> +		ida_free(&intel_uncore_ida, data->seqnum_id);
> =C2=A0
> =C2=A0	mutex_unlock(&uncore_lock);
> =C2=A0}
> diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-
> frequency-common.h b/drivers/platform/x86/intel/uncore-
> frequency/uncore-frequency-common.h
> index 0abe850ef54e..0d5fd91ee0aa 100644
> --- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-
> common.h
> +++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-
> common.h
> @@ -35,7 +35,7 @@
> =C2=A0 * @die_id:		Die id for this instance
> =C2=A0 * @domain_id:		Power domain id for this instance
> =C2=A0 * @cluster_id:		cluster id in a domain
> - * @instance_id:	Unique instance id to append to directory
> name
> + * @seqnum_id:		Unique sequential id to append to directory
> name
> =C2=A0 * @name:		Sysfs entry name for this instance
> =C2=A0 * @agent_type_mask:	Bit mask of all hardware agents for this
> domain
> =C2=A0 * @uncore_attr_group:	Attribute group storage
> @@ -71,7 +71,7 @@ struct uncore_data {
> =C2=A0	int die_id;
> =C2=A0	int domain_id;
> =C2=A0	int cluster_id;
> -	int instance_id;
> +	int seqnum_id;
> =C2=A0	char name[32];
> =C2=A0	u16=C2=A0 agent_type_mask;
> =C2=A0

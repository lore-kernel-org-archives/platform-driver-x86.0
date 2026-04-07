Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C7B3BA25C;
	Tue,  7 Apr 2026 17:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775584172; cv=none; b=uhGkjUWUJT8DHnA0TiRsxUVRhA6KoxdXgfp5/mtI+zuDpAgSMozs7CCh2sHztmO/Y8ssbRWkzEgPSMT/R08dXBryANCAyLeyAjQmudhyWawFASgo1hKTKDpLWVGLUHMd/+br7nZr4xkvZT86wXU1gKXZeeLFK/QidThK7DelIEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775584172; c=relaxed/simple;
	bh=qL2dqJhl29UbaPqgfep6xQrJiAOtxz+HgwbBTQ4oN0I=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qOttPE8HgdLUr0E0ckqYVW2PL3hKWZXBlxXkg5fVHO2Qj0wjnWIrIrM0TJesEYz7eUYgCUmLLJmEtafFP5wDqZjMR2jogj9wLs6i56f6aMsyTmidyW5oFQTt0ZuQQER6wgk6MtQk7nJOfcOwm+P/5HKQAy/RGRDbs++s3b7GQr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RC5gMD4f; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RC5gMD4f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775584168; x=1807120168;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=qL2dqJhl29UbaPqgfep6xQrJiAOtxz+HgwbBTQ4oN0I=;
  b=RC5gMD4fqwqNi7GLzvzp0KFDfzGcIwpvQsZEq6hzwjFFvUMMjfZxu28T
   PpSGBgWCytwqVed5IxwfFWDpVPhzF6YSgnDicPhefKBSWRHiCLrD+Y5a0
   xHJowcP2pbEw13wWNP0gZlDY1wraWNbtId4sqyaojxI02/ufpLZgRYwNE
   Q67vi8GF93h+tQwMJcqkrBe0+sx4zrJPZZ/LkdqMOyHnaNKFD8+oKYeMe
   mbGKca3sX0V94Y+7wleMi5koQbwtMjBoX1T2succJCDDlKYnOVJ1G1aig
   JRKcF5jcJRPJNh8iQua0thp96jcDkMt01W0mu0Owo92tHibzGhDSx2hch
   Q==;
X-CSE-ConnectionGUID: yoBD4yZCSQ+s3+UQoMqsmQ==
X-CSE-MsgGUID: ZCbsdHNGRROllJ+cqhoPJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="76449167"
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; 
   d="scan'208";a="76449167"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 10:49:26 -0700
X-CSE-ConnectionGUID: KsG3K+S7Rv6Tvke/Zz9cDA==
X-CSE-MsgGUID: bELJWHkCTei3JqAf0K6ZiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; 
   d="scan'208";a="221678680"
Received: from spandruv-desk2.jf.intel.com ([10.88.27.176])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 10:49:25 -0700
Message-ID: <31135e7d85223b1190d146d185252979bdd66ba0.camel@linux.intel.com>
Subject: Re: [PATCH v2 1/2] platform/x86/intel-uncore-freq: Rename
 instance_id
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>, hansg@kernel.org, 
	ilpo.jarvinen@linux.intel.com
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	dedekind1@gmail.com, artem.bityutskiy@linux.intel.com, Maciej
 Wieczor-Retman	 <maciej.wieczor-retman@intel.com>
Date: Tue, 07 Apr 2026 10:49:25 -0700
In-Reply-To: <00eb8abdbbbe607724dbb09481513686bfbd14aa.1775159775.git.m.wieczorretman@pm.me>
References: <cover.1775159775.git.m.wieczorretman@pm.me>
	 <00eb8abdbbbe607724dbb09481513686bfbd14aa.1775159775.git.m.wieczorretman@pm.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2026-04-02 at 19:59 +0000, Maciej Wieczor-Retman wrote:
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
> Signed-off-by: Maciej Wieczor-Retman
> <maciej.wieczor-retman@intel.com>

Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

> ---
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

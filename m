Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D480F7763C
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Jan 2024 13:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706101356; cv=none; b=KdaHJsmw+rsrydclicpXSmJqsVhrW4Cu1v22D2+ZsoRSdc8zff/G5xNX1EKIJy1PT7rDVx4XzzmREcOrnSmW5UThlA+rODp3L90HiIVaBFBeZJo3EhU1aPyWnZZS/lK9dS8fPOywyY7iJL4T03Mndx7V84x4O5YbhdZveT4gTFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706101356; c=relaxed/simple;
	bh=tf1ScVMbPFqqk/xLWiqLUAKVvmr07d9ghCvcuuzTU2Q=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=a0qy3TVP8u4MZRoZCSOd8WQy1s1QY2bBBCbuWmJYifr1Nd1PfaoOKjBd220ati+fNeBpvngqSvi2X9eczXb2f3COrW85xLlwOC7OwhnpfaK/EZBEf5Y/2DaV8/J8cdAYUBgKiL1pvaqTQkH5XlcCseo0zLXwD9/EzSPQ/rzQjFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CP7fLpPR; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CP7fLpPR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706101355; x=1737637355;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=tf1ScVMbPFqqk/xLWiqLUAKVvmr07d9ghCvcuuzTU2Q=;
  b=CP7fLpPRU0tM2noeoNeVyD1HC/c6vmJgyzJNnO9riNMoN7YZ8m+vFxvc
   Oki+0BstJ1WnhgTm6knT1IspuKEW/FQY+Q2MH005yJ4ScjuQ1LEJVoSyv
   RpMyTRI0U0uFy3e9RCb5GTw0I6ABOx4L8ZIYZj3Ps6uxaPn6FoUwo8pj1
   C5yj+2ap24sbQEWdxdPiySKAyCVx7wWzo0U3zjqXGDumnj0rMdOO+LRJS
   ll/utrgMOAZnafMokN2v+VIXvqPT/L7RUAX+j5p2BgND6HhKC+zo8F7jP
   X/vRTPVY4ZQgidJSM2iv99Y/lFiwD6iRwBXO3vdHa6F8zAkwWHwi0JepK
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="1676847"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="1676847"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 05:02:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="1117611329"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="1117611329"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.246.48.46])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 05:02:32 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 24 Jan 2024 15:02:28 +0200 (EET)
To: Suma Hegde <suma.hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: Re: [PATCH v5 07/11] platform/x86/amd/hsmp: Add support for ACPI
 based probing
In-Reply-To: <20240106022532.1746932-7-suma.hegde@amd.com>
Message-ID: <d2d38b10-9705-be14-a37b-aae84883a17e@linux.intel.com>
References: <20240106022532.1746932-1-suma.hegde@amd.com> <20240106022532.1746932-7-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-2112132757-1706101348=:1372"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-2112132757-1706101348=:1372
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Sat, 6 Jan 2024, Suma Hegde wrote:

> ACPI table provides mailbox base address and register offset
> information. The base address is provided as part of CRS method
> and mailbox offsets are provided through DSD table.
> Sockets are differentiated by UIDs.
>=20
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
> ---
> Changes since v4:
> None, generated after splitting 6th patch in v4 series(6th and 7th patche=
s of v5 is split
> from 6th patch in v4 series)
> Changes since v3:
> 1. Add hsmp_create_acpi_sysfs_if() and
>    hsmp_create_non_acpi_sysfs_if() separately
> 2. Change hardcoded value 16 in is_acpi_hsmp_uuid() to UUID_SIZE
> 3. Change commit message
> Changes since v2:
> 1. Change EINVAL to ENODEV in hsmp_read_acpi_dsd()
> 2. Change EINVAL to ENOENT in hsmp_read_acpi_dsd()
> 3. Use resource_size() in hsmp_resource()
> Changes since v1:
> 1. Define amd_hsmp_acpi_rdwr() for doing mailbox memory mapped io
> 2. Add a check to see if mailbox register offsets are set in
>    hsmp_read_acpi_dsd()
> 3. Add a check to see if sock->mbinfo.base_addr sockck->mbinfo.size are
>    set in hsmp_read_acpi_crs()
> 4. Change order of the statements in switch case ACPI_RESOURCE_TYPE_FIXED=
_MEMORY32
>    in hsmp_resource()
> 5. Add hsmp_test() after hsmp_parse_acpi_table() call
> 6. Add r.end < r.start check in hsmp_resource()
> 7. Add !dsd error check in hsmp_read_acpi_dsd
>=20
>  drivers/platform/x86/amd/hsmp.c | 351 +++++++++++++++++++++++++++++---
>  1 file changed, 321 insertions(+), 30 deletions(-)

> +static inline int hsmp_get_uid(struct device *dev, u16 *sock_ind)
> +{
> +=09char *uid;
> +
> +=09/*
> +=09 * UID (ID00, ID01..IDXX) is used for differentiating sockets,
> +=09 * read it and strip the "ID" part of it and convert the remaining
> +=09 * bytes to integer.
> +=09 */
> +=09uid =3D acpi_device_uid(ACPI_COMPANION(dev));
> +
> +=09return kstrtou16((uid + 2), 10, sock_ind);

Unnecessary ().

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>


--=20
 i.

--8323328-2112132757-1706101348=:1372--

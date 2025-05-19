Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F08426B093
	for <platform-driver-x86@vger.kernel.org>; Mon, 19 May 2025 15:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747668232; cv=none; b=J+k4L7/UVlty9+RWNVLk6PM78HQwuD1kVjm3wWrRtkWS9qNh84npXP6iSn2SUiV9EqcDkknVwyaEmvu9lfq2Vz1y5ZaSJP51RKW6S+Z9URlx0+iXDvcQmw1mH5DBI92Hc/HHHkebl5BQD05iCASkaHQByxBopmhDnSdDPGHt9/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747668232; c=relaxed/simple;
	bh=V21LJWKeM+dcTm4VZ/GHJqFgo8LrbGWQ5utnz1PwxKg=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=usI651PDPFlOkmd262WR6knZVC4LADchWzinrte8yhD5p4uIxQYjBejUQL2u4YKbrHeeDwniRXUT5GQvTJfFOut7MTETZnfHpQtbcJAu7BFJxZi5z7Uf8RsxZFitDrrR73rpPIb5keD4PM14SN6lELaxx9FZUDVzHWLmntEuVnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G+OFcUIV; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G+OFcUIV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747668231; x=1779204231;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=V21LJWKeM+dcTm4VZ/GHJqFgo8LrbGWQ5utnz1PwxKg=;
  b=G+OFcUIV6iHWGF7oIXIlGFfrdLMzI9kTl+ClKuR7d9UOTTtabR87H8ja
   wZLjEBOXNmzykb/uBhV2wukrI088FhHVl8/s8+IB4KEojggSyWszAksBg
   FurtzNvmY91ri4V06UFt3BnuGB98YLMewLrg9Sw85ipxWXxiceGx9Jygi
   i8tioR6RKGzmlBs8l1kqNwWvGxO4SzJYu/uKDjfYbCrwSQSTvRRFAipYH
   JVN5Sfii00R8B5jWwuWMUC+KpNkcu0Z0D4vAeYtFbwF7rGdhXRZPNR805
   jdVlCar9+tTqrRPEZGRVZZ3ndj9L+loEkJenjVZBT0U+FLvD+079P5Jdt
   g==;
X-CSE-ConnectionGUID: SAuhmZhrTp6lb+xgYojmQQ==
X-CSE-MsgGUID: EELXDHfwSlO3namnZL7ukQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="37188941"
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="37188941"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 08:23:48 -0700
X-CSE-ConnectionGUID: dowXkyTqRNe5DwsjOE00Jw==
X-CSE-MsgGUID: 2J5wJlpeS8msbX1386YYiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="139239830"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.35])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 08:23:46 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 19 May 2025 18:23:43 +0300 (EEST)
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
cc: platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 3/4] platform/x86/intel/pmt: decouple sysfs and
 namespace
In-Reply-To: <20250516150416.210625-4-michael.j.ruhl@intel.com>
Message-ID: <41806cdd-c08b-a7cf-8722-25ec133dcedd@linux.intel.com>
References: <20250516150416.210625-1-michael.j.ruhl@intel.com> <20250516150416.210625-4-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-1554144139-1747668137=:928"
Content-ID: <3db688cc-cda8-fa0e-2866-ebe8f293b779@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1554144139-1747668137=:928
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <b5dc65c8-1a33-a5b8-0b31-6d7150b2b18d@linux.intel.com>

On Fri, 16 May 2025, Michael J. Ruhl wrote:

> The PMT namespace includes the crashlog sysfs attribute
> information.  Other crashlog version/types may need

One space is enough after . (it might be your editor auto-adds the second=
=20
space, if that's the case, look into the editors settings).

> different sysfs attributes.  Coupling the attributes with
> the namespace blocks this usage.
>=20
> Decouple sysfs attributes from the name space and add them
> to the specific entry.

Too short lines here as well, please reflow the paragraphs.

> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/platform/x86/intel/pmt/class.c    | 12 ++++++------
>  drivers/platform/x86/intel/pmt/class.h    |  2 +-
>  drivers/platform/x86/intel/pmt/crashlog.c |  3 ++-
>  3 files changed, 9 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x8=
6/intel/pmt/class.c
> index 7233b654bbad..7404807c3943 100644
> --- a/drivers/platform/x86/intel/pmt/class.c
> +++ b/drivers/platform/x86/intel/pmt/class.c
> @@ -284,8 +284,8 @@ static int intel_pmt_dev_register(struct intel_pmt_en=
try *entry,
> =20
>  =09entry->kobj =3D &dev->kobj;
> =20
> -=09if (ns->attr_grp) {
> -=09=09ret =3D sysfs_create_group(entry->kobj, ns->attr_grp);
> +=09if (entry->attr_grp) {
> +=09=09ret =3D sysfs_create_group(entry->kobj, entry->attr_grp);
>  =09=09if (ret)
>  =09=09=09goto fail_sysfs_create_group;
>  =09}
> @@ -326,8 +326,8 @@ static int intel_pmt_dev_register(struct intel_pmt_en=
try *entry,
>  fail_add_endpoint:
>  =09sysfs_remove_bin_file(entry->kobj, &entry->pmt_bin_attr);
>  fail_ioremap:
> -=09if (ns->attr_grp)
> -=09=09sysfs_remove_group(entry->kobj, ns->attr_grp);
> +=09if (entry->attr_grp)
> +=09=09sysfs_remove_group(entry->kobj, entry->attr_grp);
>  fail_sysfs_create_group:
>  =09device_unregister(dev);
>  fail_dev_create:
> @@ -369,8 +369,8 @@ void intel_pmt_dev_destroy(struct intel_pmt_entry *en=
try,
>  =09if (entry->size)
>  =09=09sysfs_remove_bin_file(entry->kobj, &entry->pmt_bin_attr);
> =20
> -=09if (ns->attr_grp)
> -=09=09sysfs_remove_group(entry->kobj, ns->attr_grp);
> +=09if (entry->attr_grp)
> +=09=09sysfs_remove_group(entry->kobj, entry->attr_grp);
> =20
>  =09device_unregister(dev);
>  =09xa_erase(ns->xa, entry->devid);
> diff --git a/drivers/platform/x86/intel/pmt/class.h b/drivers/platform/x8=
6/intel/pmt/class.h
> index b2006d57779d..6b3455a86471 100644
> --- a/drivers/platform/x86/intel/pmt/class.h
> +++ b/drivers/platform/x86/intel/pmt/class.h
> @@ -41,6 +41,7 @@ struct intel_pmt_entry {
>  =09struct telem_endpoint=09*ep;
>  =09struct intel_pmt_header=09header;
>  =09struct bin_attribute=09pmt_bin_attr;
> +=09const struct attribute_group *attr_grp;
>  =09struct kobject=09=09*kobj;
>  =09void __iomem=09=09*disc_table;
>  =09void __iomem=09=09*base;
> @@ -54,7 +55,6 @@ struct intel_pmt_entry {
>  struct intel_pmt_namespace {
>  =09const char *name;
>  =09struct xarray *xa;
> -=09const struct attribute_group *attr_grp;
>  =09int (*pmt_header_decode)(struct intel_pmt_entry *entry,
>  =09=09=09=09 struct device *dev);
>  =09int (*pmt_add_endpoint)(struct intel_vsec_device *ivdev,
> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform=
/x86/intel/pmt/crashlog.c
> index dba7e7c1585d..c9bfe1c26311 100644
> --- a/drivers/platform/x86/intel/pmt/crashlog.c
> +++ b/drivers/platform/x86/intel/pmt/crashlog.c
> @@ -307,6 +307,8 @@ static int pmt_crashlog_header_decode(struct intel_pm=
t_entry *entry,
>  =09/* Size is measured in DWORDS, but accessor returns bytes */
>  =09header->size =3D GET_SIZE(readl(disc_table + SIZE_OFFSET));
> =20
> +=09entry->attr_grp =3D &pmt_crashlog_group;
> +
>  =09return 0;
>  }
> =20
> @@ -314,7 +316,6 @@ static DEFINE_XARRAY_ALLOC(crashlog_array);
>  static struct intel_pmt_namespace pmt_crashlog_ns =3D {
>  =09.name =3D "crashlog",
>  =09.xa =3D &crashlog_array,
> -=09.attr_grp =3D &pmt_crashlog_group,
>  =09.pmt_header_decode =3D pmt_crashlog_header_decode,
>  =09.pmt_add_endpoint =3D pmt_crashlog_add_endpoint,
>  };
>=20

With minor changelog related issues fixed,

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>


BTW, now that I remember, you should always include the correct entries=20
from MAINTAINERS file as receipients. It's not enough to send only to
platform-driver-x86@vger.kernel.org.

--=20
 i.
--8323328-1554144139-1747668137=:928--

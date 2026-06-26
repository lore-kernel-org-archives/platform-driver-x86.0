Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E456618B0F;
	Fri, 26 Jun 2026 10:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782468234; cv=none; b=dBvww7HQuwuO016GziALF4R2Vg9HEEhbKVZdRtVbVdYzG2aIaXfxGxKKIFv4A+/YPASusB+RMS2TgDA3yOpbwF24DRvl0ENBqsiDwQLR0hjO15y6CLTNtB7dF0cGbo9HCTT8zrulktXQfXeh/RG7ktRhOFC86B5Yo4N3ITtXDs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782468234; c=relaxed/simple;
	bh=9FM4bRXjIF7irO+6y3KKqbfe4HZ0qRseRLRKmXczIj4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=UvpKWGiIqzCcd6ooIjlWsoDodyF8QrXDjSAai3seBSlnQuGhLOwdKmJafsbsDJx4wEuQgv4LV4B+TqA+YcxUTY2C7euI6ByoQUs+elVMwkcpCJIrxkTd9yVEg6Am+bW9qqjO9gJJBMeHmPd1uGRVFsigiwjrXt67jgBpG4CPVS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qk4p51Jb; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qk4p51Jb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782468233; x=1814004233;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=9FM4bRXjIF7irO+6y3KKqbfe4HZ0qRseRLRKmXczIj4=;
  b=Qk4p51JbisJInYjgYMpU2MzsFAfhjdfvwB3ECJqb7iw8W9uZvJS+mYNH
   uOU0Z2xEuNKD56/qJriFDdMMKI0rP+73TULFYqTfxfZhjcYxOkvnuoMQI
   aeMxkb3AtzGGu0UBeTPRILzKnANwVKePAnwUUXb2kJwjnG88oqC5YEmbN
   L3GLrY79UZJXNKDr2TNxEaUZrUr0iKbsdT2vS7K+y8fUziG8DrtcSzoE4
   EIc6WB7BmrhSGPV+28oqVPnLcAA1DdSzpaV+JwP0yA8CohWBdcpyFs2ML
   9/pgtyGovJGT0fzd9fhxLdNSqQiCdFeT1GMzjdENdf41CNggLovBb82hq
   g==;
X-CSE-ConnectionGUID: 7EBytJJxQfene5tfkQzw5w==
X-CSE-MsgGUID: EDT3oAQ8TP2hqNTBmelJXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="93613336"
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; 
   d="scan'208";a="93613336"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2026 03:03:53 -0700
X-CSE-ConnectionGUID: ife29fQJTmymFk6QLl1TdA==
X-CSE-MsgGUID: O6t3lF0HR9qEczOi62iPLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; 
   d="scan'208";a="250220480"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.71])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2026 03:03:50 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 26 Jun 2026 13:03:47 +0300 (EEST)
To: Muralidhara M K <muralidhara.mk@amd.com>
cc: muthusamy.ramalingam@amd.com, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/7] platform/x86/amd/hsmp: Validate ACPI UID and _DSD
 mailbox package
In-Reply-To: <20260625123337.886435-3-muralidhara.mk@amd.com>
Message-ID: <b723da76-6309-0cd4-59e0-5931231f585d@linux.intel.com>
References: <20260625123337.886435-1-muralidhara.mk@amd.com> <20260625123337.886435-3-muralidhara.mk@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1503347312-1782468227=:1085"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1503347312-1782468227=:1085
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 25 Jun 2026, Muralidhara M K wrote:

> Harden the ACPI table parsing against malformed firmware:
>=20
> hsmp_get_uid() passed the device UID directly to kstrtou16(uid + 2)
> without checking it.  A NULL UID or one shorter than three characters
> would dereference a NULL pointer or read past the end of the string.
> Reject such UIDs with -EINVAL before stripping the "ID" prefix.
>=20
> hsmp_read_acpi_dsd() dereferenced elements[0] and elements[1] of each
> mailbox sub-package before confirming the package actually held two
> elements, allowing an out-of-bounds read on a malformed _DSD.  Verify
> package.count >=3D 2 first, then fetch the string and integer objects.

These look two paragraphs describe what looks totally independent changes=
=20
so they should be split to two patches, also their diffs don't overlap.=20
Once the split is done,

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

I see you went beyond just concurrency fixes, thanks. :-)

I'll try to look at the locking changes later (that is, there's no point=20
in resubmitting the next version yet simply because of the patch split=20
if you don't have any other changes to make; I haven't checked sashiko's=20
analysis yet).

The locking changes are considerable harder to review so it will take some=
=20
time for me to go through them.

--
 i.

> Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
> ---
>  drivers/platform/x86/amd/hsmp/acpi.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/=
amd/hsmp/acpi.c
> index 696884a91c22..24296747df47 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -24,6 +24,7 @@
>  #include <linux/module.h>
>  #include <linux/mutex.h>
>  #include <linux/platform_device.h>
> +#include <linux/string.h>
>  #include <linux/sysfs.h>
>  #include <linux/topology.h>
>  #include <linux/uuid.h>
> @@ -82,6 +83,8 @@ static inline int hsmp_get_uid(struct device *dev, u16 =
*sock_ind)
>  =09 * bytes to integer.
>  =09 */
>  =09uid =3D acpi_device_uid(ACPI_COMPANION(dev));
> +=09if (!uid || strlen(uid) < 3)
> +=09=09return -EINVAL;
> =20
>  =09return kstrtou16(uid + 2, 10, sock_ind);
>  }
> @@ -153,12 +156,18 @@ static int hsmp_read_acpi_dsd(struct hsmp_socket *s=
ock)
>  =09=09union acpi_object *msgobj, *msgstr, *msgint;
> =20
>  =09=09msgobj=09=3D &mailbox_package->package.elements[j];
> -=09=09msgstr=09=3D &msgobj->package.elements[0];
> -=09=09msgint=09=3D &msgobj->package.elements[1];
> =20
>  =09=09/* package should have 1 string and 1 integer object */
>  =09=09if (msgobj->type !=3D ACPI_TYPE_PACKAGE ||
> -=09=09    msgstr->type !=3D ACPI_TYPE_STRING ||
> +=09=09    msgobj->package.count < 2) {
> +=09=09=09ret =3D -EINVAL;
> +=09=09=09goto free_buf;
> +=09=09}
> +
> +=09=09msgstr=09=3D &msgobj->package.elements[0];
> +=09=09msgint=09=3D &msgobj->package.elements[1];
> +
> +=09=09if (msgstr->type !=3D ACPI_TYPE_STRING ||
>  =09=09    msgint->type !=3D ACPI_TYPE_INTEGER) {
>  =09=09=09ret =3D -EINVAL;
>  =09=09=09goto free_buf;
>=20

--8323328-1503347312-1782468227=:1085--

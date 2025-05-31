Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8084A1A
	for <platform-driver-x86@vger.kernel.org>; Sat, 31 May 2025 05:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748669042; cv=none; b=dRSAMxPqB8h3b8cNjuZ9yXkDG9J9UpjqWknMVUosbF0nNOWvw412NXX13ciVqvHn7agUjrGuVzjn5l+tDweVxFmeNSzg1Icw6lWJQH1egVQXir6FY9OB9dMUDvFeEd8G4v/Gc9mZqaJvM6Z6dg/R4uQHSIua6xXwvdF8s/rtk1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748669042; c=relaxed/simple;
	bh=mGRA/5vt0mvMn4weLyQXc79anFHBJe8tx03P7lM4Crg=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=XmXTA0i3/zE50pjdsgqn7++sQ/uY/HCbrX3f5NCXNuh9msLctfj41Bxc0i++vJOHul0KVObm/806ImHwGXOYBs/a/RZ9iaM3qVcGBjAxDzk3o17AXnodp+SWKdY+vSMad/+6UjMJZmE4G2kh/4hL63SV3/IQWyYmrWTDwX+fQyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SFwPyF+t; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SFwPyF+t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748669041; x=1780205041;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=mGRA/5vt0mvMn4weLyQXc79anFHBJe8tx03P7lM4Crg=;
  b=SFwPyF+tuDOgI0If2HoFsYM7nW4iIdxo4dvnmENmv2hwDAQWQhfAEs4K
   pfmjdt9wznXlaBEBWTt9zeca/WM5V7TerT5w75BztXun+V3XVrgymh+ZU
   FRvw4u5A5K5T7SJ2+g1uD9YC0W7V1tD/cADawYlwB7xfYk2VVRCOlylJS
   XIva717UAPXd3vdaQRYSsY+/++wYgSSgo5pbQuUtgaECbCcbyUkbecQnH
   1f8L5wFHQxRL1zT3Y0m1GK3uI1hPmLTD1C5sYUIiOzJlMadGE34ozNsaD
   ypxiGQ5LRrppWaZbZL6BYForR+6bKzE2pM52q4cCz7UIabH5x1RymKbI8
   g==;
X-CSE-ConnectionGUID: PvSP2LvKSieSx/VxKEuElA==
X-CSE-MsgGUID: VdrmOxKrTzqli+xEOyfgbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="50631175"
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; 
   d="scan'208";a="50631175"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 22:24:01 -0700
X-CSE-ConnectionGUID: cRcR8/cdRHuhQCzTy7lYGA==
X-CSE-MsgGUID: pFcBMXx1TFa2mENyLq1LLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; 
   d="scan'208";a="175059072"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.71])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 22:23:58 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Sat, 31 May 2025 08:23:54 +0300 (EEST)
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
cc: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
    Hans de Goede <hdegoede@redhat.com>, lucas.demarchi@intel.com, 
    rodrigo.vivi@intel.com
Subject: Re: [PATCH 03/10] platform/x86/intel/pmt: use guard(mutex)
In-Reply-To: <20250530203356.190234-3-michael.j.ruhl@intel.com>
Message-ID: <e56d6195-6f70-d788-225a-a6438dfda10d@linux.intel.com>
References: <20250530203356.190234-1-michael.j.ruhl@intel.com> <20250530203356.190234-3-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1884461754-1748669034=:937"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1884461754-1748669034=:937
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 30 May 2025, Michael J. Ruhl wrote:

> Update the mutex paths to use the new guard() mechanism.
>=20
> With the removal of goto, do some minor cleanup of the current
> logic path.
>=20
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/platform/x86/intel/pmt/crashlog.c | 32 +++++++++++------------
>  1 file changed, 15 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform=
/x86/intel/pmt/crashlog.c
> index d40c8e212733..c6d8a7a61d39 100644
> --- a/drivers/platform/x86/intel/pmt/crashlog.c
> +++ b/drivers/platform/x86/intel/pmt/crashlog.c
> @@ -155,9 +155,9 @@ enable_store(struct device *dev, struct device_attrib=
ute *attr,
>  =09if (result)
>  =09=09return result;
> =20
> -=09mutex_lock(&entry->control_mutex);
> +=09guard(mutex)(&entry->control_mutex);
> +
>  =09pmt_crashlog_set_disable(&entry->entry, !enabled);
> -=09mutex_unlock(&entry->control_mutex);
> =20
>  =09return count;
>  }
> @@ -189,26 +189,24 @@ trigger_store(struct device *dev, struct device_att=
ribute *attr,
>  =09if (result)
>  =09=09return result;
> =20
> -=09mutex_lock(&entry->control_mutex);
> +=09guard(mutex)(&entry->control_mutex);
> =20
>  =09if (!trigger) {
>  =09=09pmt_crashlog_set_clear(&entry->entry);
> -=09} else if (pmt_crashlog_complete(&entry->entry)) {
> -=09=09/* we cannot trigger a new crash if one is still pending */
> -=09=09result =3D -EEXIST;
> -=09=09goto err;
> -=09} else if (pmt_crashlog_disabled(&entry->entry)) {
> -=09=09/* if device is currently disabled, return busy */
> -=09=09result =3D -EBUSY;
> -=09=09goto err;
> -=09} else {
> -=09=09pmt_crashlog_set_execute(&entry->entry);
> +=09=09return count;
>  =09}
> =20
> -=09result =3D count;
> -err:
> -=09mutex_unlock(&entry->control_mutex);
> -=09return result;
> +=09/* we cannot trigger a new crash if one is still pending */
> +=09if (pmt_crashlog_complete(&entry->entry))
> +=09=09return -EEXIST;
> +
> +=09/* if device is currently disabled, return busy */
> +=09if (pmt_crashlog_disabled(&entry->entry))
> +=09=09return -EBUSY;
> +
> +=09pmt_crashlog_set_execute(&entry->entry);
> +
> +=09return count;
>  }
>  static DEVICE_ATTR_RW(trigger);

Thanks, the control flow is very straightforward after this change.

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>


--=20
 i.

--8323328-1884461754-1748669034=:937--

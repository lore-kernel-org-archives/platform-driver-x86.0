Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B41929C35C
	for <platform-driver-x86@vger.kernel.org>; Mon,  7 Jul 2025 13:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751894214; cv=none; b=kqz1mF5UDxBv8mZs6Iif+Ms8UEuAQLQKYiBQlGbing/MdJe9aPK7+aOHvM03MBZxNa9pG7Q8gpeQkxnhVnFOO3lHXQegriinExvUcmwkKc010F+Q62lUij3WoTRg7sLDLRQ0U4BYqPHtot+9H99yyKwwyCYkRPQRtyX+rTXldpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751894214; c=relaxed/simple;
	bh=wZ50eUzAJEbcViakKc1q1ZspbN1swY6ah9qZ0lfe7EU=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=XxXGsWMSSKXWopApXd2tII94NybPx46hq7uard+UDau0bIzjrmzneqydjr08xYaDuu9HGBIWGfyPjdht8p9qXY30A/f+KGR5Djp/d06yDsqOJJotc8ZzUF+6A3hXc/fg8u0WlFmA2T7yFi7kWU4M7l4dAkN49hOaqctWHeVZv74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BFNztZJc; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BFNztZJc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751894213; x=1783430213;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=wZ50eUzAJEbcViakKc1q1ZspbN1swY6ah9qZ0lfe7EU=;
  b=BFNztZJcS3SWbnLvCYokw3luY8Nz+FFqczHBNif9u0aSBhDt7A0UO976
   el+s7FbhNnjVrplYls6N1Xvt2xt1SSzOBZBG09G+IEqxosoAfJR1ggAjA
   qV7j/HwGmMJ85JQ9c8WMWQdPnNNeENfyYpBfN3+e3Ghr1xL8WZsGykVTr
   kA82no+yzPBS5lbpPN0zQ2RQzh8ZO78TSRasRB6uHsQxxa2GKWisjJGO0
   fxFoYapmJINQftv0QJrTREefJs4eltPZ38ZQCDjzeqXczBMeECO37mlyq
   1ausu0ULPKKxuy8D1lAq+V3k4z5ETWwuznH2G5f7fxgIxjpxQIKIQfLz7
   g==;
X-CSE-ConnectionGUID: 1VtCvVWfQYSWOfK5IrxJ7w==
X-CSE-MsgGUID: Ptzoc84XSSyti7Ey9c9vJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="79546147"
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; 
   d="scan'208";a="79546147"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 06:16:52 -0700
X-CSE-ConnectionGUID: 5q00i4vMRi2NYq8RvLvFrQ==
X-CSE-MsgGUID: Cy52GPmZQXS79b3JZ30kdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; 
   d="scan'208";a="160868490"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.104])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 06:16:48 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 7 Jul 2025 16:16:44 +0300 (EEST)
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
cc: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
    Hans de Goede <hdegoede@redhat.com>, lucas.demarchi@intel.com, 
    rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com, 
    airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com
Subject: Re: [PATCH v6 04/12] platform/x86/intel/pmt: mutex clean up
In-Reply-To: <20250703211150.135320-5-michael.j.ruhl@intel.com>
Message-ID: <31b70656-f673-5086-2c48-3ba94a63a5bd@linux.intel.com>
References: <20250703211150.135320-1-michael.j.ruhl@intel.com> <20250703211150.135320-5-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1894421471-1751894204=:941"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1894421471-1751894204=:941
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 3 Jul 2025, Michael J. Ruhl wrote:

> The header file for mutex usage and mutex_destroy() cleanup code is
> absent from this module.

Hi Michael,

While not end of the world, it's generally better to spell out what=20
module (/driver/etc.) you're talking about instead of using "this" even if=
=20
the change will contain other references that will tell what the module is.

No need to send another version of this series just because of that unlees=
=20
there are going to be other changes.

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>


> Add the header file and mutex_destroy().
>=20
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/platform/x86/intel/pmt/crashlog.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform=
/x86/intel/pmt/crashlog.c
> index d40c8e212733..6e32fc1f8f1d 100644
> --- a/drivers/platform/x86/intel/pmt/crashlog.c
> +++ b/drivers/platform/x86/intel/pmt/crashlog.c
> @@ -12,6 +12,7 @@
>  #include <linux/intel_vsec.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> +#include <linux/mutex.h>
>  #include <linux/pci.h>
>  #include <linux/slab.h>
>  #include <linux/uaccess.h>
> @@ -262,8 +263,12 @@ static void pmt_crashlog_remove(struct auxiliary_dev=
ice *auxdev)
>  =09struct pmt_crashlog_priv *priv =3D auxiliary_get_drvdata(auxdev);
>  =09int i;
> =20
> -=09for (i =3D 0; i < priv->num_entries; i++)
> -=09=09intel_pmt_dev_destroy(&priv->entry[i].entry, &pmt_crashlog_ns);
> +=09for (i =3D 0; i < priv->num_entries; i++) {
> +=09=09struct crashlog_entry *crashlog =3D &priv->entry[i];
> +
> +=09=09intel_pmt_dev_destroy(&crashlog->entry, &pmt_crashlog_ns);
> +=09=09mutex_destroy(&crashlog->control_mutex);
> +=09}
>  }
> =20
>  static int pmt_crashlog_probe(struct auxiliary_device *auxdev,
>=20

--=20
 i.

--8323328-1894421471-1751894204=:941--

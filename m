Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E6F22F19
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Apr 2024 09:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714383538; cv=none; b=M6sCLOBSv+yGc/k8mgpfzl38PuqXwa2JWd+v5oaSatHJs2ePUseCa9x2cI0Y/jUXxX+GY0zcn4w50bKhE1luw1dtTamBVhXYh46de1gadioMmLp4OBwGDqko//NTyuVNr9PAkMdpoI5Yf3hklvCbXmHbExG5wePYmb+uNXr7uec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714383538; c=relaxed/simple;
	bh=9Hy6nuaaqouIoEzcUnhkt17s4dGGoG16JlRCnHHzT1s=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=kI4cjaE00886vEcXDZ0/q5oyc7MkpVy/NjLfRx02bt69aKFu4Z2yNeeQSNlrg3cJqLEo9LFUwRc/w9Xbr9lTxX7fT7Ux0zntXolOa0BAuB6NpNnwrlWv/a1/qwhqhyvsNAr+brtmLlgEcwgGnj5NsyAWeikHMd9fZWwRnaDPZc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jUmARgMi; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jUmARgMi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714383537; x=1745919537;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=9Hy6nuaaqouIoEzcUnhkt17s4dGGoG16JlRCnHHzT1s=;
  b=jUmARgMiaSlFLK0A70HSIDWnMF63AnQaE1BqyrN6c6kvfmFmph5S2dDk
   FbKKqsQTNIM3DbLmKjUJzU1BNnARh1jaS3aRgUPxoxZWOeWUltMvyKCDQ
   CuCTyLIKdLie3FoecJntqx4v79VhIncRhBUNJZKT78s6WT1mwgQUf5C+0
   st3IwPQeanJwoTDg8BMNZeO0heNb977SzVLSWl+sTXpzjkUzhV2n5y4aR
   OF6E2YSKoJhZVfJnDHPw99DIuvIFsf/oNo+92V/Ee164CKE82dFsAMdwI
   XKggKNGcQ6SqfdElorSk5D1/8hVk8BjdJn1u3/JmeDam6HN5BotwEzgmV
   w==;
X-CSE-ConnectionGUID: pCz4eccAQIKQlrTRcwTejA==
X-CSE-MsgGUID: X3pTpPbASkyoTqW+eUNWjw==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="13812310"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="13812310"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 02:38:56 -0700
X-CSE-ConnectionGUID: +1T5bvIsQTOCqPGZXdQTnQ==
X-CSE-MsgGUID: gVZX3qvtQaiw3av3C2mVwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="26013599"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.45])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 02:38:54 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 29 Apr 2024 12:38:50 +0300 (EEST)
To: Hans de Goede <hdegoede@redhat.com>
cc: Andy Shevchenko <andy@kernel.org>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Use false to set acpi_send_ev
 to false
In-Reply-To: <20240429093446.130322-1-hdegoede@redhat.com>
Message-ID: <2fb26061-6da6-ae4d-05e2-322eef9e47a2@linux.intel.com>
References: <20240429093446.130322-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1947909209-1714383530=:1286"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1947909209-1714383530=:1286
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 29 Apr 2024, Hans de Goede wrote:

> acpi_send_ev is a bool and everywhere else true/false is used
> to set it. Replace the one instance using 0 with false.
>=20
> Suggested-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/=
thinkpad_acpi.c
> index 7e2288009063..e2e6c4d3dff7 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -3912,7 +3912,7 @@ static void hotkey_notify(struct ibm_struct *ibm, u=
32 event)
>  =09=09=09if (tp_features.hotkey_wlsw &&
>  =09=09=09=09=09hkey =3D=3D TP_HKEY_EV_RFKILL_CHANGED) {
>  =09=09=09=09tpacpi_send_radiosw_update();
> -=09=09=09=09send_acpi_ev =3D 0;
> +=09=09=09=09send_acpi_ev =3D false;
>  =09=09=09=09known_ev =3D true;
>  =09=09=09}
>  =09=09=09break;
>=20

Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-1947909209-1714383530=:1286--

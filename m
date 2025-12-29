Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D605290F
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Dec 2025 12:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767010612; cv=none; b=E9Ye2XVDuLtFvJf5J2oeX1Uzwf2Cl2VQaAYO8l29vsA2vD0dkPnFHabebhCQikkeHFsS47KoEdMtsB/vqzZz9RoDpnRImmZDZTdpzjpOD3giOpJcZzw4xhBpneml5DxA6f1xxwDsX4vfHVN/8WisR5AnYISOfnGUNfK6UUmdllk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767010612; c=relaxed/simple;
	bh=SPXhvIuUUTa6Lmcc4GYKwVPoEMq6oXfCrgCEK8KhvuQ=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ec0Dc6PfaKiFuZH+xjPrecyySgf78sQ3AgswtTspQvWTMgkQwVF0VX09Ur2OmWUJreAv1kORsaVyC6+yHH8q8s43AJ565CvT9pwgacG7CcBzxVtjxxSX9uTH4gut0VrthhwHChFUUkSTmX4i97UZ4QT/4WttckdvDbdv5/4K9bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bJe/tAKS; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bJe/tAKS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767010610; x=1798546610;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=SPXhvIuUUTa6Lmcc4GYKwVPoEMq6oXfCrgCEK8KhvuQ=;
  b=bJe/tAKSkUkVPsaOMOs8qrU9m3Y9NVb4nC5uEMnxj0TX2Iz5/yzX27hI
   grozXyOMmjsHw5/P/BwbP7AceaoUuPh2rmMRkH+Y/i0sOB2h28TikSpYp
   NMsxA3KeN0WwNbSnD7O4jjfDgdttnQfHcGFeVvQHYjFwGkuAeC8iPzCkh
   FD5Yl4L+o26ex0hVpJx4eDoBwPf+eL6bh5xtCzdmy7ceROUBjCPRIpUtN
   Wx3H8rSzg+TgYn47q8+3gR+XtfRoydotJD7T2YX2hWkTkzEzn2Josg52c
   LpzBnNUVmwdXq6qR/QrKR1YLDLGm5iEtT9gmmoIhiu1DagbTEuhMkzQmE
   A==;
X-CSE-ConnectionGUID: arNFHA/hSQm/hynB8bNauw==
X-CSE-MsgGUID: 9GS7O71IT82oKNmiXBnnnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="72469748"
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; 
   d="scan'208";a="72469748"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 04:16:50 -0800
X-CSE-ConnectionGUID: blp7uGEaR8ay3ZDXV63EYw==
X-CSE-MsgGUID: qVqV4/dmQv+vws9grgl91Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; 
   d="scan'208";a="231970009"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.30])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 04:16:48 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 29 Dec 2025 14:16:45 +0200 (EET)
To: =?ISO-8859-15?Q?Tom=E1=A8_Hnyk?= <tomashnyk@gmail.com>
cc: platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2] platform/x86: ideapad-laptop: Reassign KEY_CUT to
 KEY_SELECTIVE_SCREENSHOT
In-Reply-To: <20251226203454.405520-1-tomashnyk@gmail.com>
Message-ID: <4ef13988-a623-1f30-d714-f38e29a9bd86@linux.intel.com>
References: <20251226203454.405520-1-tomashnyk@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-1135954355-1767009781=:974"
Content-ID: <be7284af-27ff-3efa-8bf4-28ecf63ad9a2@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1135954355-1767009781=:974
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <42af7971-fbd5-0d3d-9b83-a06fca57b588@linux.intel.com>

On Fri, 26 Dec 2025, Tom=E1=A8 Hnyk wrote:

> As per Lenovo documentation, Fn+Print-Screen should "Open the Snipping
> tool" which corresponds to KEY_SELECTIVE_SCREENSHOT (keycode 0x27a). It
> is currently assigned to KEY_CUT because keycodes under 248 were
> preferred due to X11 limitations.
>=20
> Reassign Fn+Print-Screen from KEY_CUT to KEY_SELECTIVE_SCREENSHOT.
>=20
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D3D220566
>=20
> Signed-off-by: Tom=E1=A8 Hnyk <tomashnyk@gmail.com>

Thanks for the update, next time please include all maintainers as=20
receipients as well (as indicated e.g. by scripts/get_maintainers.pl).

I've applied this now to the review-ilpo-fixes branch.

FYI, I had to remove the extra empty line from your tags block and fix the=
=20
bugzilla link while applying the patch.

--
 i.

> ---
>  drivers/platform/x86/lenovo/ideapad-laptop.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platf=
orm/x86/lenovo/ideapad-laptop.c
> index 5171a077f62c..7d5f7a2f6564 100644
> --- a/drivers/platform/x86/lenovo/ideapad-laptop.c
> +++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
> @@ -1367,7 +1367,7 @@ static const struct key_entry ideapad_keymap[] =3D =
{
>  =09/* Performance toggle also Fn+Q, handled inside ideapad_wmi_notify() =
*/
>  =09{ KE_KEY,=090x3d | IDEAPAD_WMI_KEY, { KEY_PROG4 } },
>  =09/* shift + prtsc */
> -=09{ KE_KEY,   0x2d | IDEAPAD_WMI_KEY, { KEY_CUT } },
> +=09{ KE_KEY,   0x2d | IDEAPAD_WMI_KEY, { KEY_SELECTIVE_SCREENSHOT } },
>  =09{ KE_KEY,   0x29 | IDEAPAD_WMI_KEY, { KEY_TOUCHPAD_TOGGLE } },
>  =09{ KE_KEY,   0x2a | IDEAPAD_WMI_KEY, { KEY_ROOT_MENU } },
> =20
>=20
--8323328-1135954355-1767009781=:974--

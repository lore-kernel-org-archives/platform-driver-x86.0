Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A88B3264E7;
	Wed, 25 Mar 2026 18:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774462835; cv=pass; b=QG0YopbkDCIuDrYKZvzva7drlEm4gogYCIt1Q0MXWwpjk0VFobh7nYEs500WayUfMMdA5sx3OYPl1na1t9ngL/CtC5QL4+withDlUlVWlt0dBaE8ijNxOVj7l+EtuFgiOhBj1UiwM4dYmYXdxz0deIsEU9B5oyqatKX4AjNFK00=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774462835; c=relaxed/simple;
	bh=Lh9sl+Kr8bmMxBsUHbIhrsWPFBMwvDfWgrjHu7CY12Y=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=VQ4teySTZnZPhiKDwVpG+XPhf6jcBSm0KJ33ksNzfufALxviG7B85ssgRKD3XD+gOjoRUyNx+MFU5ZXA8bxL/EerIEtB2nsDrnW+718M8lqdphTCkWZXFHWOadhzxk/e/i/5rNWdhUZYZR17FfB1vstWVeimeQbto+S4PqBEVMo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=Zr77UIw+; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="Zr77UIw+"
ARC-Seal: i=1; a=rsa-sha256; t=1774462826; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ijd16YNxX6V3XULU5kTC0RcHIV0B+1w0rg5IsWOc1X+ZrFJtHZYaEHHy1FYCwdWv2x0ehCpXPBbDvARz5G4M/cRVhKVSgXQQ4ClTBdertFaBnqjg7rhYZ9aL92LTWLqIWUjtZDOD6oVggDknVv/PgapD5NaXNRG2wOyNU4wiEKY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774462826; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=6u/rsSi6trqHMEdV8lBGto7fHj9pSjeSdfpSIQOF7vI=; 
	b=AHzQwmA11ZM47gD8mHWlcIm1F62quLhLkTK8nyEGoPeh4tsH4Y6TWBvfQw1cTi5Otsp7xPk36CxB2XXMGw2Gw3Fu04dPjdvyvP4zinDFZ63WwIv8f3N6HY5YJSMmbi+bSm0oLLjO6Z4AGutaROQTYeooc/JwmL9qrFbCRYebHuQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774462826;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=6u/rsSi6trqHMEdV8lBGto7fHj9pSjeSdfpSIQOF7vI=;
	b=Zr77UIw+OX10sNrJLHUSlLrMj0SxbiWzLtlPgwRJ7R5mVTfXiy59J0yzovH26xAL
	V9TEeVTs2ws1T18RsjGU/TnNeYnBu/TcxmwCscoqYFwfO87NyNvBhr8Lex+8wBnUF/H
	UhnQhKiuOZWYJVLQ7FH2HTlbYgaSpeugTQcy3tOWYdsJHteuQEmTjjvjmtRulpufUWj
	CxapK/zZPYyT5xKBonlfzH2+LIQDNo8vq612o6//tnRzDwtI5ffchzp3fMp9w0S/buq
	q1CGzoY4+upqipWSNAnOPrv9/i+l6iR/fCskof3Kk640EI7Zl4IZ13U2SZiwE3LAYVA
	7Klr+hIN+w==
Received: by mx.zohomail.com with SMTPS id 177446282400153.92327899687234;
	Wed, 25 Mar 2026 11:20:24 -0700 (PDT)
Message-ID: <73cb6e393e152190a52910d32ae4226c0629facc.camel@rong.moe>
Subject: Re: [PATCH 0/2] platform/x86: lenovo-wmi-capdata: Add debugfs file
 for dumping capdata
From: Rong Zhang <i@rong.moe>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark"
	 <derekjohn.clark@gmail.com>, Armin Wolf <W_Armin@gmx.de>, Hans de Goede
	 <hansg@kernel.org>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=
	 <ilpo.jarvinen@linux.intel.com>
Cc: Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org
In-Reply-To: <20260210191938.137234-1-i@rong.moe>
References: <20260210191938.137234-1-i@rong.moe>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Mar 2026 02:15:18 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-9 
X-ZohoMailClient: External

Hi all,

Gentle ping :-)

Thanks,
Rong

On Wed, 2026-02-11 at 03:19 +0800, Rong Zhang wrote:
> The Lenovo GameZone/Other interfaces have some delicate divergences
> among different devices. When making a bug report or adding support for
> new devices/interfaces, capdata is the most important information to
> cross-check with.
>=20
> Add a debugfs file (lenovo_wmi/<device_name>/capdata), so that users can
> dump capdata and include it in their reports.
>=20
> The output is like:
>=20
>   LENOVO_CAPABILITY_DATA_00[0]:
>     id:             0x00010000 [dev:  0, feat:  1, mode:  0, type:  0]
>     supported:      0x00000007 [ RWV]
>     default_value:  0
>=20
>   LENOVO_CAPABILITY_DATA_01[0]:
>     id:             0x00000000 [dev:  0, feat:  0, mode:  0, type:  0]
>     supported:      0x00000000 [    ]
>     default_value:  0
>     step:           0
>     min_value:      0
>     max_value:      0
>=20
>   LENOVO_FAN_TEST_DATA[0]:
>     id:             1
>     min_rpm:        2200
>     max_rpm:        5000
>=20
> A helper function for creating per-devcie debugfs directories is also
> introduced into lenovo-wmi-helpers in order that we can maintain a tidy
> directory structure in debugfs.
>=20
> The series is based on platform-drivers-x86/review-ilpo-next since it
> depends on a commit there. I am OK to wait until the next cycle.
>=20
> Rong Zhang (2):
>   platform/x86: lenovo-wmi-helpers: Add helper for creating per-device
>     debugfs dir
>   platform/x86: lenovo-wmi-capdata: Add debugfs file for dumping capdata
>=20
>  drivers/platform/x86/lenovo/Kconfig       |   1 +
>  drivers/platform/x86/lenovo/wmi-capdata.c | 121 ++++++++++++++++++++++
>  drivers/platform/x86/lenovo/wmi-capdata.h |   4 +-
>  drivers/platform/x86/lenovo/wmi-helpers.c |  34 ++++++
>  drivers/platform/x86/lenovo/wmi-helpers.h |   2 +
>  5 files changed, 159 insertions(+), 3 deletions(-)
>=20
>=20
> base-commit: 5a5203a45b063a594e89a2aeaf9e4923893a5b4c

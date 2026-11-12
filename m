Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794516677;
	b=b9PM4ub8hFf+br6B5lWtH8jedUgW1hb85jn04sP1hUYT6Ktek892yeRliJcKSGpXoVae
	 J/13ysZtZFNoF4LZSVOytPrHAry7/aMf6yhShlCtUnQh5xaJKkUiiK0rfY+NMgszxwxj9
	 V0mr9LG731OBzXbnHrz8NSoi+l/WJQGgiy6JR9nnoVUCqBjhyJYYBx8Q/YYV/y5pQE84L
	 uib73IcsaizHbmEBypm0ezAP/uZ9EtutdhaXM1xNRGg4t8QmHcTJ2e6ReoVdoXVNakUoS
	 0iBqysVV6e6CZHblFBKuqWHRLBo5beFcUtknXJpTKACRt+Wto7iU0Y/A79+shWt/TSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794516677;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=X8UZ37xa2ei8j05E7k5lST5ZokccD0ewFOlJ5YkttL4=;
	b=YGv33tmDcSx4GhcjuC6CvltkPysVO5ZdPwBRIf93RKXGgss4zhIHbYxQuWZawpGnms2x
	 /0oVkB9SMMOdGoWnzl74rSM1Ri6p5zPF3rx8wQrLfBf4JfQFVH+uiHX9Mx6qKo5aRMHQQ
	 J/K37FYOTFojVwwlb8uS7e6MebuFEDDJ87bqUT6l92T49ZFJ4Q+JSijO+Q4xGWLSi5xPd
	 YrS6VLdbvLJ7lqqAWJlkgCC98qPqsvq5Jf+BM6HXEN6PTcRR+VDb/BrBaGc190ge2D6Ba
	 715MV/zurnb+oBiLs15YekU5QLxwh8W5XVeFC1dDKlmCxjZ9Zv8eIvSNFZSRt+yQ3ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=h6UmzAqR;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB18606A31C;
	Thu, 12 Nov 2026 20:51:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BB18606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=h6UmzAqR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794516677; x=1826052677;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=nj7CICt73Q1jfoc4OB6M3IENUkX2Qo5LdJLx/vZXDnY=;
  b=h6UmzAqRhbLEYNNebDU2UNBl90Z3HpXfTw7BFem/UeGl1188674dhcco
   3lq0Mr6/fThGggts14BS74nZtp0TPy7K1NB459e8QA8bSnlXI1rO50AJz
   SCKIyGKu2cgDq/Iv3HhUn0t1uLk7IowI2fmAVhK4sGiChYBQE3vAkz9EU
   aYnx2tPuRSne2hhsjeyA/VuatD2+8K7PzR5+3FpmwABPy9GhuPvaqqRCV
   cYfc2oUgNDrmQBeXkzb2l0Rng6z8mr7ZyoKlKhCLgSU7wppR1HwUwcazE
   RfNVWkne9fyHK89wK0U8bTW9Xs5fPOti3sGuUaqgQJABLQJNucNsdLVp9
   g==;
X-CSE-ConnectionGUID: lCl8r7bDQhKtA9My3qMpiA==
X-CSE-MsgGUID: W8gemhLdTCC/mXq2aAXAmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3313388"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3313388"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 12:51:17 -0800
X-CSE-ConnectionGUID: Vdac/Ki9RICWjyyXhMdWhQ==
X-CSE-MsgGUID: g/eXy2feTHaBw8nfsY4mOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="8852970"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.68])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 12:51:12 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 12 Nov 2026 22:51:09 +0200 (EET)
To: Neko <neko205@aosc.io>, Yun Wang <7z0423arsenova@proton.me>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, Mingyou Chen <qby140326@gmail.com>, 
    Ilya Gladyshev <ilya.gladyshev@linux.dev>, Armin Wolf <W_Armin@gmx.de>, 
    Chris Taraszka <chris@miget.com>, kexybiscuit@aosc.io, jeffbai@aosc.io
Subject: Re: [PATCH] platform/x86: bitland-mifs-wmi: Add Redmi G 2022 (TM2135)
 quirk
In-Reply-To: <9a26c741-6217-4155-a3dc-e34b4015f71c@aosc.io>
Message-ID: <2d2f41a0-2bc9-98e5-b6c6-5975a7e3dfb9@linux.intel.com>
References: <20261106143114.95008-1-7z0423arsenova@proton.me> <9a26c741-6217-4155-a3dc-e34b4015f71c@aosc.io>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1203858437-1794516669=:1181"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1203858437-1794516669=:1181
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 13 Nov 2026, Neko wrote:
> =E5=9C=A8 2026/11/6 22:33, Yun Wang =E5=86=99=E9=81=93:
> > The Redmi G 2022 (board TM2135, BIOS RMGAD6T0P1313) implements only
> > three modes: 0x02 for quiet, 0x01 for balanced and 0x03 for performance=
=2E
> > The default profile table maps balanced to 0x00, but this firmware
> > recognizes it as the performance mode. Because the firmware does not
> > implement the AC adapter type query, setting balanced-performance or
> > performance fails with -ENODATA.
> >=20
> > Add a DMI entry with a three-entry profile table for this model and
> > enable skip_ac_type_check. 0x04 is not used for performance: writing it
> > succeeds and the value reads back as 0x04, but in three test runs on
> > 7.2.11 the firmware did not emit WMI event 0x16, which it emits after
> > every other mode change. The Fn+K hotkey also cycles only through the
> > three modes above.
> >=20
> > Tested on this machine with this patch and the series it depends on,
> > built as an out-of-tree module and loaded on a 7.2.14 kernel. Writing
> > low-power, balanced, and performance succeeds, the profile reads back
> > correctly, and the firmware emits one 0x16 event for each (values 2, 1,
> > and 3). Writing balanced-performance is rejected, and Fn+K cycles
> > through low-power, balanced, and performance.
> >=20
> > Claude Code (claude-opus-5-5) analyzed the ACPI tables, wrote the test
> > scripts, specified the change and corrected this changelog. I wrote the
> > code and the changelog and ran the tests on this machine.
> >=20
> > Link:
> > https://lore.kernel.org/platform-driver-x86/OT2JfRLDi6yHShYvywRZoFBYdW-=
TUgdKqKtahRM5b0cZxNo6eGZHnO5dKf4oYFaEtZhEsqU-Q-2OFe0D-qToJMVUrS5_d2aa2Q5LD5=
0ISIc=3D@proton.me/
> > Link:
> > https://lore.kernel.org/all/BelDdF5woNEBX6dZ3_zJDEbVkifs1pdxEjtQ1yC-aKy=
ZahijFJCllxm0l_SqZ5Hsj61D8wfJNa7uDSuNKmyyxo2S0tZp9QS5yaafeZUxvxE=3D@proton.=
me/
> > Suggested-by: Mingyou Chen <qby140326@gmail.com>
> > Signed-off-by: Yun Wang <7z0423arsenova@proton.me>
>=20
> I have tested this patch on my Redmi G 2022 (board model TM2135) and have
> confirmed that I can now switch between "performance", "balanced", and
> "power-saver" power profiles via the KDE power manager tray.
>=20
> Stress testing with s-tui also shows different power draw under different
> profiles.
>=20
> Tested-by: Yu Pan <neko205@aosc.io>

Thanks all.

I've applied this patch now to the review-ilpo-next branch resolving the=20
conflict.

--=20
 i.

--8323328-1203858437-1794516669=:1181--

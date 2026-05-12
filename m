Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A783B9D98;
	Tue, 12 May 2026 09:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778576780; cv=none; b=psuGJbeMSkWXj54FnqGQuyZ/Pa+XZpxWpJTc2rZqwy1/l1ci4qQU6n4qbTxolUq8iExu84aj8ixFY4K99GiSUBaEYodns1WclE7jcuIZf8L9GL/rIxIEEh7veDJ+2qBj3MH0YjuB3V9ib0lQP0nHELOdBSLDCz3O9LHm8pnCVKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778576780; c=relaxed/simple;
	bh=RS4N02Wahe2FYsOpJNg90RjrmSfiX4ddp4slpn2L4hI=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=nu+FJEr0IF9f3AAFU3jvgIaiStXvJ7s10TtLu0DaKtaUUQlfP/J0MLrNTDowAf+s++0fPv7qdGPYYad/Gz570mEzPo8ZSbAqYlVp/AEEDL9zMXC0V04Q93+Hb5to55X1caRgo7h0xFS/OrdTA0rMNC6rHeL3WVVDQk61wpQ7ENA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dAedgYVG; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dAedgYVG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778576777; x=1810112777;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=RS4N02Wahe2FYsOpJNg90RjrmSfiX4ddp4slpn2L4hI=;
  b=dAedgYVGuK6/dDm1p5/pAxtvkavzBrrnehpA7UZOgglIGag+5PvbYEPI
   nGJRlD2BYWyX8HBMcNQ4ohnWBD21LErnV47aibAab37a5rifJNMEDCQEx
   3m0ms0a41ybivcv8Y7aWJQjC7ted57oHtmt6smJa7zwnOe+gEP+sTwU5e
   3++abnFmnHqg8ooVSucj2RgXLsMqPcibQ2tEQ4gWJRUJH98QVwDGPJeLI
   Zq1widcTm/hTTEam+FuHOI9Cqjd0HWsh2S2F+V3CG2tpC9F8Gb74SqGkg
   Omnd9YEGe+ulsCyb5Ff+KiiqMBZoLmnFYtFqIHkbVmpHNqfyS4QQFGXQ+
   g==;
X-CSE-ConnectionGUID: oNETxQp3SHGrK1xIRUN0Zw==
X-CSE-MsgGUID: mX3uVf8cSCyzwO75XCctug==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="83353285"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="83353285"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 02:06:15 -0700
X-CSE-ConnectionGUID: mksATeXzT3S6y/dCiXeidw==
X-CSE-MsgGUID: oe4551QkSIGs1H4Tzi5ueA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="275833112"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.190])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 02:06:12 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 12 May 2026 12:06:09 +0300 (EEST)
To: Daniel Gibson <daniel@gibson.sh>
cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
    Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 5/5] Documentation/arch/x86/amd-debugging: Add section
 about delay_suspend
In-Reply-To: <d34a8638-c9d6-4963-a7e5-ee2c977b2b54@gibson.sh>
Message-ID: <4b0a39ef-ce1d-0898-5b2f-98b3669988a5@linux.intel.com>
References: <20260509013105.816339-1-daniel@gibson.sh> <20260509013105.816339-6-daniel@gibson.sh> <14ccefdc-eab5-b5a9-b8f1-1128bbf7f217@linux.intel.com> <d34a8638-c9d6-4963-a7e5-ee2c977b2b54@gibson.sh>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1320283278-1778576769=:1449"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1320283278-1778576769=:1449
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 12 May 2026, Daniel Gibson wrote:

> On 11.05.26 14:49, Ilpo J=C3=A4rvinen wrote:
> > On Sat, 9 May 2026, Daniel Gibson wrote:
> >=20
> >> must be updated with the actual commit IDs when they are merged
> >=20
> > Please write a proper changelog text.
> >=20
> > Unfortunately, I cannot know the commit ID in advance as it depends on =
the=20
> > commit content itself (git object hashing works that way).
>=20
> Yeah, I know - I already feared I'd have to submit this documentation
> later when the other stuff is merged, but thought I'd post it here
> anyway to maybe get feedback on the documentation text itself while its
> context is in the same email thread.

Lets do so you keep it part of the series, for now.

I try to remember to apply only the other patches and you resubmit the=20
last one with the correct id once I've accepted the other patches (and I=20
try to remember to not rebase past that point after that).

> >> Signed-off-by: Daniel Gibson <daniel@gibson.sh>
> >> ---
> >>  Documentation/arch/x86/amd-debugging.rst | 25 +++++++++++++++++++++++=
+
> >>  1 file changed, 25 insertions(+)
> >>
> >> diff --git a/Documentation/arch/x86/amd-debugging.rst b/Documentation/=
arch/x86/amd-debugging.rst
> >> index 3176a1240fee..3af7799cca1a 100644
> >> --- a/Documentation/arch/x86/amd-debugging.rst
> >> +++ b/Documentation/arch/x86/amd-debugging.rst
> >> @@ -249,6 +249,31 @@ state entry.
> >> =20
> >>  `commit 40b8c14936bd2 ("drm/amd/display: Disable unneeded hpd interru=
pts during dm_init") <https://git.kernel.org/torvalds/c/40b8c14936bd2>`_
> >> =20
> >> +Keyboard and Lid Switch stop working after resume
> >> +-------------------------------------------------
> >> +On various variants of the Lenovo IdeaPad Slim 3 with Barcelo and Rem=
brandt CPUs
> >> +the lid switch and keyboard, or at least the Fn/Multimedia keys, stop=
ped working
> >> +after resume, until the next reboot.
> >> +
> >> +This was caused by buggy firmware having timing problems, the EC need=
ed some idle
> >> +time right before the CPU cores are suspended, or it got into an inco=
nsistent state.
> >> +
> >> +For laptops that are known to be affected this workaround is enabled
> >> +automatically, to test this workaround on other machines you can set =
the
> >> +``delay_suspend`` parameter of the ``amd_pmc`` module.
> >> +
> >> +If you need to set the ``delay_suspend`` parameter to fix your machin=
e, please
> >> +report this at platform-driver-x86@vger.kernel.org for it to be added=
 to the
> >> +list of devices that need this workaround, so in future kernel versio=
ns it's
> >> +enabled automatically.
> >> +
> >> +Note that the current workaround isn't perfect: The problems can stil=
l happen
> >> +if resume is triggered by a timer (wakealarm).
> >> +
> >> +`commit TODO ("platform/x86/amd/pmc: Delay suspend for some Lenovo La=
ptops") <https://git.kernel.org/torvalds/c/TODO>`_
> >> +
> >> +`commit TODO ("platform/x86/amd/pmc: Add delay_suspend module paramet=
er") <https://git.kernel.org/torvalds/c/TODO>`_
> >> +
> >>  Runtime power consumption issues
> >>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> =20
> >>
> >=20
>=20

--=20
 i.

--8323328-1320283278-1778576769=:1449--

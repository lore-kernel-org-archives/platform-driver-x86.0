Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A97516165;
	Fri, 18 Sep 2026 17:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789751645; cv=none; b=UDA/kl7b/bSti2+RriZlqYwyx4kzEo6oGgCLC3Quc+lNjZyCnaa+tsje15pxyoMxaQVwCbCyKrmzzCNgIDodSx8XquxzP7P1GGvGkrT51SddFqRNmm2ERDB+uFsJKC1An7ATNV6bplEf3QZyxPqMoeB/gROJpYBcL0VapRNEdp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789751645; c=relaxed/simple;
	bh=jUgaHIkG5GMqQuO2iz+RZUmhvu7CjmRrf2Bm9qNgwUY=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=F3QFNgher2TSlnT8E5om28Uc6LkUaHemA+tSs/4n97/fUsfPAo2ZswW66Mbagcm29cwAgckVWwMJOTO9gk9b1QRPT4ZZR3ZQHKtScHXefHxRAjptoPHp3m3LDuOb07Cp+T059BmURXoXXhd0rm9OFQWe2HV4q2LKZsJ22ABj9v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nmLMWMXs; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nmLMWMXs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789751643; x=1821287643;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=jUgaHIkG5GMqQuO2iz+RZUmhvu7CjmRrf2Bm9qNgwUY=;
  b=nmLMWMXsCU9kapnFKgwH9aYBgAGKrSv2NN4JQZ/7Jp5ojTq/SOWfG1WX
   1Nl1FfmZLTJyrLww0812mDR1O27t5l6Z/A2SYMdQil1LBTwA6jFuXWKV/
   hsqB7oIHgbJOfS5PpFwnW+i2CzCZbjY72T1jm0uJOINqI/WkKqM6D//FO
   na8bClnPcAajuRbHRz3++Rbe26XjtsFgOEguMZ8MHQLQM5OT0otzMtKV9
   BgPf5fjCMR46y4lMAgTJmI4N4DxA17I0KohB2atjJufNjsQD2YEOCrYAX
   Cupe/wWtMlkD30tWQW+9rU4Kra2Rt4Sw7P97pZpZzsedDleZfQOBS6LcY
   Q==;
X-CSE-ConnectionGUID: QancxO1NTdSI26rGYR9MQA==
X-CSE-MsgGUID: rXFHucsZT6KYawRNjd+Ypg==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="90289788"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="90289788"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 10:14:02 -0700
X-CSE-ConnectionGUID: /XaO1j9ET1ywnd7D9ROfKw==
X-CSE-MsgGUID: tKhiK9yfTXK55K08Rxc5fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="2726464"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.223])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 10:14:01 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 18 Sep 2026 20:13:53 +0300 (EEST)
To: =?ISO-2022-JP?Q?=1B$BJ=5D=1B=28J_=1B$BP0J8=1B=28J?= <baoshuwen2013@outlook.com>
cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, 
    "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: hp-wmi: add support for OMEN 16-am2xxx
 boards
In-Reply-To: <SI2PR04MB589526A21FB0EF4E8ABA749CA2AB2@SI2PR04MB5895.apcprd04.prod.outlook.com>
Message-ID: <195c1c74-5d25-9bd9-50c5-dab0a5ac7cf6@linux.intel.com>
References: <SI2PR04MB589526A21FB0EF4E8ABA749CA2AB2@SI2PR04MB5895.apcprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-373483114-1789751633=:17235"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-373483114-1789751633=:17235
Content-Type: text/plain; charset=gb2312
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Sat, 29 Aug 2026, =B1=A3 =CA=E6=CE=C4 wrote:

> The HP HyperX OMEN 16-am2xxx (DMI board 8F1C, 26C1 platform cycle,
> Arrow Lake-HXR) is listed in the OMEN Command Center device
> capability table with DisplayName "HyperX OMEN 16" and the
> "PerformanceControl" feature, but is missing from the kernel's
> omen_thermal_profile_boards whitelist.  The thermal profile path is
> therefore not enabled and the embedded controller keeps the CPU
> pinned at the default frequency cap while running Linux.
>=20
> Add 8F1C to the OMEN thermal profile board list.  On this platform
> the EC firmware also arms its own thermal profile revert timer (EC
> offset 0x63, armed with 0x5a when performance is selected) and
> switches back to the balanced profile once it expires, so add the
> board to omen_timed_thermal_profile_boards as well in order to have
> the driver clear the timer and set the NOTIMER|TURBO flags when
> switching to the performance profile.
>=20
> Tested on a HyperX OMEN 16-am2xxx (kernel 7.2.0-boot-me-please):
> after loading the patched hp-wmi module the platform_profile
> interface is exposed, and switching to the performance profile
> raises the CPU from a ~2.9 GHz (P-core) / 2.6 GHz (E-core) cap to
> ~4.8 GHz / ~4.3 GHz under a single-thread load.  The EC then reports
> the performance profile (0x31) with the NOTIMER|TURBO flags set
> (0x62=3D0x06) and the revert timer cleared (0x63=3D0x00); a plain write
> of the profile without those flags instead arms the timer (0x63=3D0x5a)
> and the profile reverts to balanced when it expires.
>=20
> Signed-off-by: Shuwen Bao <baoshuwen2013@outlook.com>
>=20
> ---
>  drivers/platform/x86/hp/hp-wmi.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/h=
p-
> wmi.c
> index 8ba286ed8721..6200d873c732 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -161,6 +161,7 @@ static const char * const omen_thermal_profile_boards=
[] =3D {
>         "8BAD",
>         "8C58",
>         "8E41",
> +       "8F1C",
>  };
> =20
>  /* DMI Board names of Omen laptops that are specifically set to be therm=
al
> @@ -179,6 +180,7 @@ static const char * const=20
> omen_timed_thermal_profile_boards[] =3D {

Hi,

Unfortunately, this patch is corrupted in multiple ways. Please try=20
sending the patch first to yourself and try applying it.

Only send v2 to public after you can get the patch to apply cleanly=20
yourself.

>         "8A15", "8A42",
>         "8BAD",
> +       "8F1C",
>  };
> =20
>  /* DMI Board names of Victus 16-d laptops */


--=20
 i.

--8323328-373483114-1789751633=:17235--

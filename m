Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E01351FCB3;
	Wed, 14 Oct 2026 13:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791984738; cv=none; b=Ho2oGlNWf1MeDNn7B/gy+Uml4mNa4A0kuuXsQTYTF0JhYWoEGNnDjKjCU4rICf7ycKN1FSFSI0O+DUBlx933qMGUHrfJ2TznM7Flf8IvZXOLVt4TzeOlU4WE0wr1fqNy6nAPCbRiLwqmsVL0iM6jGr2OL1edA02JDtOq8zYRyw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791984738; c=relaxed/simple;
	bh=FuajUqcomA+I0GiI1iQTV+zX9U1801Jm6NJD3vBpSKc=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=FLYbJzE6HOL8bZWbY+UTC1IiMcaqnbTn6PT5KqQ81HxHHc4I0NgdfpRmoETI6llUa1Uq1nX0aI22DU3CT4fueiu1Legp4Nk1bZtZVI2Kie2wsyyf0NtTARmf9Gwl4IaUVLA9te/HmtADVFANp4sx6cF0tx7WdT3naY3hEdXPZ1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=heaXZjMD; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="heaXZjMD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791984729; x=1823520729;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=FuajUqcomA+I0GiI1iQTV+zX9U1801Jm6NJD3vBpSKc=;
  b=heaXZjMD0oncR1Nua2zqRpfOudq2zNDVLFVeoIJl+hGZlQuGIOxOW/5l
   /k00ftA/+oXjStEZP+62EGQuknyXNNXTS5KRTziWFsy4/jYvKJSoanoes
   AZPEeRJHKClEagYf/TUFkJPG3cYHZOqvCGomm504W+EejlaCVyTHt4/wt
   VjPIEEsLA671Mc32UB4853U+wOFupen4euaS0Z62YPwQdB94uDcBwTbc7
   X4k5i6tqDhjI0SoDoqZ0lvIeyf9W9NbqPbASzPJxcQX4hOoP3JUKFYZ+g
   JVcqiMH+MOyTLEWK48UBozUBu1r831Fko+76EHkZ0bwY4/GB3Wg/AMMSw
   Q==;
X-CSE-ConnectionGUID: zWEP6hbiQcSyd+BmS93Xdw==
X-CSE-MsgGUID: Mv8gCXBVRNmjs4a/DUA6Gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="761113"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="761113"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 06:32:08 -0700
X-CSE-ConnectionGUID: gJ1PoZIgR4WHpozPng09gw==
X-CSE-MsgGUID: IBXxuLwhSvq95ugJL5NHJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1399816"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.234])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 06:32:05 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 14 Oct 2026 16:32:01 +0300 (EEST)
To: =?UTF-8?Q?Mert_Erdo=C4=9Fan?= <mrterdo75@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: hp-wmi: Add Victus 16-d1xxx board 8A26
 support
In-Reply-To: <20261007-hp-wmi-victus-8a26-v1-1-8a256ac14908@gmail.com>
Message-ID: <3d9d6f53-4a20-5124-3efc-ebdd1aa5bdb7@linux.intel.com>
References: <20261007-hp-wmi-victus-8a26-v1-1-8a256ac14908@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-1504287484-1791983861=:1157"
Content-ID: <26324e83-1580-9eb0-7118-489f27bddd3e@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1504287484-1791983861=:1157
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <e4ea1c74-e18e-b601-331b-9d55c10517e8@linux.intel.com>

On Wed, 7 Oct 2026, Mert Erdo=C4=9Fan via B4 Relay wrote:

> From: Mert Erdo=C4=9Fan <mrterdo75@gmail.com>
>=20
> The Victus 16-d1xxx ships with at least two DMI board names. 8A25 is
> already listed in victus_thermal_profile_boards, but 8A26 is not, so
> on those machines the driver falls back to the generic thermal policy.
> Selecting a platform profile then never issues the Victus performance
> mode WMI call (HPWMI_SET_PERFORMANCE_MODE via HPWMI_GM), and the
> firmware keeps the GPU's +15 W configurable TGP offset disabled.
>=20
> Add 8A26 to the list so these machines use the same Victus thermal
> profile path as 8A25.
>=20
> Before this change I enabled the cTGP offset on this machine with a
> userspace workaround that issues the same WMI call through acpi_call
> whenever power-profiles-daemon switches profile, and I still use that
> workaround on my daily kernel until this is merged.

First of all, thanks for the patch.

For changelog text, could you please try to write only what is relevant=20
enough to be recorded into git history (it needs to be explanation how=20
the patch came to be but focus on what the change does and why). If you=20
want to add extra details like this, you can put them underneath the first=
=20
--- line and our tools will cut that part out while the patch is being=20
applied.

> Tested on a Victus by HP Laptop 16-d1xxx (board 8A26, BIOS F.22,
> RTX 3050 Laptop GPU) running 7.2.9, with the patched hp-wmi module
> built out of tree, the acpi_call workaround stopped and AC connected.
> The GPU power limit reported by nvidia-smi follows the selected
> profile, with the same values the acpi_call workaround produces:
>=20
>   performance  75 W
>   balanced     60 W
>   quiet        30 W
>=20
> Unplugging and replugging AC with the performance profile selected
> gives 20 W on battery and 75 W again on AC, again matching the
> workaround. The power source event handler reads the profile back
> from the EC without errors on both transitions.
>=20
> With the unpatched module and the workaround stopped, switching
> between performance and balanced leaves the limit at 60 W, so the
> change in behaviour comes from this patch.
>=20
> victus_thermal_profile_boards is identical in for-next and in 7.2.9,
> so the tested change is the same one-line change as below.
>
> This patch was prepared with an AI coding agent (Claude Code, using
> Claude Opus 5.5). It traced the driver's Victus code path and found
> it sends the same WMI call as my acpi_call workaround, wrote the
> change and this changelog, built the module and wrote the test
> script.

This and the previous paragraph too seems just unnecessary detai to=20
recorded into git history and a bit repetitive as well.

Please also check the other change similarly and send these both once=20
you're ready in a v2 series.

--
 i.

> I ran the test on the hardware and checked the results.
>=20
> Assisted-by: claude-opus-5-5
> Signed-off-by: Mert Erdo=C4=9Fan <mrterdo75@gmail.com>
> ---
>  drivers/platform/x86/hp/hp-wmi.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/h=
p-wmi.c
> index 387f60e88..15f1e9f63 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -234,6 +234,7 @@ static const char * const omen_timed_thermal_profile_=
boards[] =3D {
>  static const char * const victus_thermal_profile_boards[] =3D {
>  =09"88F8",
>  =09"8A25",
> +=09"8A26",
>  };
> =20
>  /* DMI board-specific feature data for Omen and Victus laptops. */
>=20
> ---
> base-commit: 98f039265e580291d5e76a11b2072541fbb1c393
> change-id: 20261007-hp-wmi-victus-8a26-119e000cbe86
>=20
> Best regards,
> -- =20
> Mert Erdo=C4=9Fan <mrterdo75@gmail.com>
>=20
>=20

--=20
 i.
--8323328-1504287484-1791983861=:1157--

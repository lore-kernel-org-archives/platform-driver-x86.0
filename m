Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793031454;
	b=UYXLkFdUAS8X21/KS3FxDul2+9fzMhNhzetWAOLI5VQ3mJz+IimHOgkM6l6PHaLGGk3a
	 WxAScXnyatK3aVMfyR5KByfKCtkjtPz3iMxp+hq2HLrpTI3b5b6ESXg4xZIZjhBFRNbT+
	 evCc8KvOKBzci047gW9zo+yWjAtYkxBBgHc0rHyh67JZw8kTcBvxBrU3bOfyeweimdRHC
	 qSj0n7Dbl75HhZSBW1mREcQ0jk3iHuNn7cEB4gm8W1KoZQMv7v19iYG/1TPm8NTABwcyD
	 lVRQ1XNJ5hI9dzmIAhKRL+unjKoAAnNaoKXntfsn9TsmXqj0gGaPD2Rn56ml2a51igw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793031454;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=tXKmM/Jkb0HPQfP8POIAbaB5M2u+MdmFudf8avH3sAo=;
	b=1q0oHbDQlsgT+MZq957Sf2VUh35t32E53bW06vuzYFoR8YldI65J9CIN1rk2rZp+cd5d
	 9e6oWaGlREIoPVy0FBYJIbdX+iV3WNXknQvmUt/xfMaYbVG2EehfI5G4F1IpoUGrdxhbM
	 5sfVxvqn+ioaQe/7bDp+M3rmXI9bpNYJZES8caTEknXsxXuVJ+70qzwtXXR97daN4vz5E
	 OoaHZSrozTg9oXHo84Lrqpl0pSTfNHPqi/XUw1Vw1UchQNWHPECR+NvT9lLRa4P6y7oQs
	 P+ZOiahDYYEvAKat7lpTzWI+rlBK3DlITGM/dfKxo9CxlC8lpfBl5fHR3LJQiDfy6EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="emSNP/Vm";
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B875606A31A;
	Mon, 26 Oct 2026 16:17:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B875606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=emSNP/Vm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793031454; x=1824567454;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=iVmEysx5vD5cbM5B02hobVDd5tR8fMGl/GugHVgwmIk=;
  b=emSNP/VmrypulJTBM1/KIuAhkpPvMIIZs1vKBuLnkY+nAD3KjyqGOOPJ
   wCjfQKRg4RfdKM1EF/6TpZwMDZtSuFNc6wItAKyfeFCcpXUWY0/sCRofa
   F3P/tx11AG7l3ZXYW+7s4Uc8eEfeV6ByN00JTjgKD+kc0auU3TBdJFwMI
   ezGdcrUktEvzAl1yBMIQ11QT8aGV7exNg04Gh598RpnmDf1cpUAF9WeeP
   cOD8E7AbGic/ZnV4hgEzVwI3On2iTtZJKp4VzAl8i6wmlSd22NM1eA3Nk
   SkEpICw6JkPORF1RiPxi7v6hUnF1s8bapWHplsb1T3Ous2swB6Xdcw2Wa
   w==;
X-CSE-ConnectionGUID: KZ1OnILGQnuWqXv3+0zl1g==
X-CSE-MsgGUID: 9MrbL8x8Swmo3O9rd/AYZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1735195"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1735195"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 09:17:33 -0700
X-CSE-ConnectionGUID: A/fS4Ec3RT+ohboIZtg1FA==
X-CSE-MsgGUID: xkIqymftSHG7C/v01GIcMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="6156155"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.109])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 09:17:29 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 26 Oct 2026 18:17:26 +0200 (EET)
To: Shuwen Bao <baoshuwen2013@outlook.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, 
    Krishna Chomal <krishna.chomal108@gmail.com>, 
    Emre Cecanpunar <emreleno@gmail.com>, 
    Suryansh Singh <technosfan14@gmail.com>, 
    Radhey Kalra <radheykalra901@gmail.com>, 
    =?UTF-8?Q?K=C3=BCr=C5=9Fat_Abayl=C4=B1?= <hello@kursatabayli.dev>
Subject: Re: [PATCH v3] platform/x86: hp-wmi: add support for OMEN 16-am2xxx
 boards
In-Reply-To: <SI2PR04MB5895909A0EDE359BDA4F78A3A2632@SI2PR04MB5895.apcprd04.prod.outlook.com>
Message-ID: <f7612110-b309-2c81-690f-0f43e0520ab8@linux.intel.com>
References: <SI2PR04MB589508E55CCCD8E26E53E4DBA2942@SI2PR04MB5895.apcprd04.prod.outlook.com> <179207451329.13793.4180821086242621563.b4-ty@b4> <SI2PR04MB5895909A0EDE359BDA4F78A3A2632@SI2PR04MB5895.apcprd04.prod.outlook.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1773986297-1793031446=:1162"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1773986297-1793031446=:1162
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Sat, 24 Oct 2026, Shuwen Bao wrote:

> =E5=9C=A8 2026=E5=B9=B410=E6=9C=8815=E6=97=A5=E6=98=9F=E6=9C=9F=E5=9B=9B =
=E4=B8=AD=E5=9B=BD=E6=A0=87=E5=87=86=E6=97=B6=E9=97=B4 22:28:33=EF=BC=8CIlp=
o J=C3=A4rvinen =E5=86=99=E9=81=93=EF=BC=9A
> > On Wed, 07 Oct 2026 11:08:36 +0800, Shuwen Bao wrote:
> > > The HP HyperX OMEN 16-am2xxx (DMI board 8F1C, 26C1 platform cycle,
> > > Arrow Lake-HXR) is listed in the OMEN Command Center device
> > > capability table with DisplayName "HyperX OMEN 16" and the
> > > "PerformanceControl" feature, but is missing from the kernel's
> > > hp_wmi_feature_boards[] list.
> > >=20
> > > Add 8F1C to the hp_wmi_feature_boards[] list, using
> > > omen_v1_legacy_board_params as driver_data.
> > >=20
> > > [...]
> >=20
> > Thank you for your contribution, it has been applied to my local
> > review-ilpo-next branch. Note it will show up in the public
> > platform-drivers-x86/review-ilpo-next branch only once I've pushed my
> > local branch there, which might take a while.
> >=20
> > FYI [if applicable to your patch], as per Linus' policy change, also
> > fixes are mostly routed through for-next unless the fix is for a
> > commit introduced in the most recent cycle or is clearly a regression
> > fix.
> >=20
> > The list of commits applied:
> > [1/1] platform/x86: hp-wmi: add support for OMEN 16-am2xxx boards
> >       commit: 2cd10a35f3f09c49698956d32c6374fbdc03245d
> >=20
> > --
> >  i.
>=20
> Hi Krishna, Ilpo,
>=20
> Thank you for applying the patch. However, after further extended testing=
,=20
> I noticed a regression on this hardware.=20
>=20
> Specifically, the board automatically reverts from performance mode back=
=20
> to balanced mode after a period of time (it seems like the time is not=20
> constant), which resembles the behavior of a timed thermal board.=20
>=20
> This doesn't seem to be a thermal threshold or PL1/PL2 limitation,=20
> because manually switching the profile back to balanced and then to=20
> performance will re-enable performance mode successfully.
>=20
> I am still investigating the root cause and am currently unsure how to=20
> properly fix this yet. I'm currently testing adding 8F1C to=20
> omen_timed_thermal_profile_boards as a fix.
>
> I haven't looked deeply into hp-wmi.c before, so if adding it to that=20
> array is not the correct or intended way to handle this, please let me=20
> know.

Hi,

It certainly sounds like a similar problem. I'm not sure if the code=20
related to omen_timed_thermal_profile_boards is hooked though with this=20
board because it requires is_omen_thermal_profile() returning true.

Some other drivers do profile keepalive by writing the same profile=20
periodically if nothing has changed the profile for a while, that would=20
seem easier/more generic solution than finding timer offset the current=20
solution uses.

If you need to change something it would be nice to generalize this=20
so that the keepalive is not bound to a particular submodel category.=20
The driver is slowly moving towards that for all models so that we'd=20
have only one central dmi matching table where the struct would hold all=20
necessary info/quirk details.

> @Ilpo, since commit 2cd10a35f3f0 ("platform/x86: hp-wmi: add support for=
=20
> OMEN 16-am2xxx boards") is already in review-ilpo-next, would you prefer=
=20
> to revert it for now until I figure out a proper solution, or should we=
=20
> keep it as-is while I investigate?

I think I'll keep the change as it still works to an extent so it seems=20
better than nothing.

--=20
 i.

--8323328-1773986297-1793031446=:1162--

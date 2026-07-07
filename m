Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1969346AED
	for <platform-driver-x86@vger.kernel.org>; Tue,  7 Jul 2026 09:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783415705; cv=none; b=pi1Kvb7hDhaDjlpXwEzbpJdjLc196IWp+aAiYU/nXC8wxKKvvONNJBCZaWfQslpAGQZxb740BuIiPkGpBjLiHdYGV6GBkx3MV9U7CmwRSC8O47CyQUh3t/QdGsgDs2kPl961eciqk9SXTIFK8MfkqCbK3712cGwHvs4L73cAE1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783415705; c=relaxed/simple;
	bh=N22lhUpwLbhfIznqDMAbfKIs1XZbGuRfwzz2Hs8vK00=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=h8Ok8BkqjhYLW+onizduj2Set0v5iTPAiCRn5BlQp8K/F6WsqTVza2Gzne9sfsoBO7LwQra7K5dgaLhi2fed+jE6YPOrVCNiICz+hAat1hE61oQfX4EfkyLDCoLVLPpMio1HJsM7XNkzHxyji00ipjPlLts/CptyWmZjq7L948c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UJfRn/Wm; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UJfRn/Wm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783415703; x=1814951703;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=N22lhUpwLbhfIznqDMAbfKIs1XZbGuRfwzz2Hs8vK00=;
  b=UJfRn/WmgeJ/IyNk+HgeRJNF1MP8gdMO+onihJVzH4lcF1NAtWsjDWP/
   ZTjyT2X5LBi2gxZvYVh7lt43OXWjFNGSCjB029FFBO1omMKm660Xf3119
   yvoTZVQKmxd2Tn6hLtz4u9l1BKF32Veztmi8riC2y248o6VbKfX0EFqnr
   XtDJjH0xLeC0QL46OuaE9fkFnt/U97TdrI/k8hmVfKltqE5CVlS4V4gNL
   GKRyesalcQ+MNrQlSlAzvvrHyCvMrIA+R4BwZwmg0g/LQHhXA1izncnh+
   Bxjlb1znCmY1WGszoybG8qMG+LOagGI3Ab7dY2CiDC4cuQzLA5PUNA6wd
   w==;
X-CSE-ConnectionGUID: +9ucEsyeThSthbrGGSD2Ag==
X-CSE-MsgGUID: GzfgsYk7TCeLRj4bpRAxZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="83830612"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="83830612"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 02:15:03 -0700
X-CSE-ConnectionGUID: BU8TvDrHSjGavJ0eqq2Npw==
X-CSE-MsgGUID: JEwi07vtTjq6oVD2vVipbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="292112632"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.226])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 02:15:01 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 7 Jul 2026 12:14:57 +0300 (EEST)
To: =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    PDx86 ML <platform-driver-x86@vger.kernel.org>, 
    Hans de Goede <hansg@kernel.org>, 
    Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: Imminent rebase of pdx86 trees to v7.2-rc2
In-Reply-To: <akyoRk2xTaYcLamH@monoceros>
Message-ID: <e64d4420-a4ac-782e-85c4-7db586b84dc2@linux.intel.com>
References: <8084b592-cb10-2ae4-603a-615f053ca01d@linux.intel.com> <akuE9tvj29Y6crEk@monoceros> <akvDc_LAMy25o6xo@ashevche-desk.local> <akyoRk2xTaYcLamH@monoceros>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1683474655-1783415697=:1152"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1683474655-1783415697=:1152
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 7 Jul 2026, Uwe Kleine-K=F6nig wrote:
> On Mon, Jul 06, 2026 at 06:02:11PM +0300, Andy Shevchenko wrote:
> > On Mon, Jul 06, 2026 at 12:37:36PM +0200, Uwe Kleine-K=F6nig wrote:
> > > On Mon, Jul 06, 2026 at 11:48:18AM +0300, Ilpo J=E4rvinen wrote:
> > > > Because of the recent mid-rc-cycle merge of the rework for=20
> > > > mod_devicetable.h in d2c9a99135da ("Merge tag 'device-id-rework' of=
=20
> > > > git://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux"), I'l=
l be=20
> > > > (re)basing our pdx86 tree on top of v7.2-rc2.
> > >=20
> > > Probably to late now, but I guess merging v7.2-rc2 into your tree to
> > > handle (potential?) merge conflicts would have been the solution that
> > > doesn't involve a rebase.
> >=20
> > Rebases are cleaner in this situation.
>=20
> Yes, a rebase yields a cleaner result, but less history and more hassle
> for your downstreams. The tree being used by downstream developers and
> Ilpo's urge to notify them for this rebase, would be a strong indicator
> for me to not rebase but to pull in v7.2-rc2 (or only the
> device-id-rework tag).

No. It's a strong indicator your header refactoring shouldn't have been=20
merged mid-rc-cycle but now you also try to say I shouldn't try to cope=20
with the cards I've been dealt with the way I see best... :-(

We do occasionally force pushes anyway so this is not something as=20
extraordinary as you seem to think. I didn't write this notification=20
mainly because of the rebase but to warn about the include changes which=20
may result in conflicts unless the submissions are based on late enough=20
commit in my tree.

Merging -rc2 backwards removes degrees of freedom from me when it comes=20
to patches I've accepted before that merge. It also makes history less=20
clean (which also you acknowledge).

> Looking at next-20260706 (where drivers-x86 is
> ff7836fa850c2f815bc219f1e48f6ec8699f4ae7 which is still based on v7.2-rc1=
) and
>=20
> =09https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers=
-x86.git review-ilpo-next
>=20
> (51a153f2747fad5dc566f94238b08da07d6a6fb6, based on v7.2-rc2), I wonder
> if just doing nothing would have been the right approach:
>=20
> =09$ git range-diff linus/master..ff7836fa850c2f815bc219f1e48f6ec8699f4ae=
7 linus/master..51a153f2747fad5dc566f94238b08da07d6a6fb6
> =09 1:  4799d6229436 =3D  1:  7bc99dff4d97 platform/x86: asus-armoury: ga=
te PPT writes behind active fan curve
> =09 2:  2f70f3d2fd3d =3D  2:  27ef0cdcdc20 platform/x86: msi-ec: Add MSI =
Raider A18 HX A9WJG EC firmware
> =09 3:  2d79283eec8d =3D  3:  63af040b0b40 platform/x86: uniwill-laptop: =
Add keyboard backlight support
> =09 4:  c7f3d21c8f50 =3D  4:  69be0016c161 platform/x86: uniwill-laptop: =
Handle screen-related events
> =09 5:  e8a41051b95b =3D  5:  c393505bab5b platform/x86: uniwill-laptop: =
Add AC auto boot support
> =09 6:  58d88f08ab1f =3D  6:  e02c8d7a197d platform/x86: uniwill-laptop: =
Add support for USB powershare
> =09 7:  c1c6633e3f1f =3D  7:  e76799915b86 platform/x86: uniwill-laptop: =
Add support for the MACHENIKE L16 Pro
> =09 8:  62f334005d59 =3D  8:  efd0636aaedb platform/x86: uniwill-laptop: =
Add support for the AiStone X4SP4NAL
> =09 9:  e451ae739a2c =3D  9:  866e728b489b platform/x86: uniwill-laptop: =
Add lightbar support for LAPQC71A/B
> =0910:  385bf4f87b05 =3D 10:  e5a316220dae platform/x86: hp-wmi: Introduc=
e board-specific feature data
> =0911:  9ed0f2562f9a =3D 11:  c1ce649189ed platform/x86: hp-wmi: Drive fa=
n control from board data
> =0912:  5417f92a1d46 =3D 12:  c95f61d198c7 platform/x86: hp-wmi: Add Vict=
us 15-fb0xxx support
> =0913:  a3ec96c8b7bc =3D 13:  dd26a15b1d28 platform/x86: dell-privacy: Fi=
x race condition
> =0914:  f58553cda9aa =3D 14:  16e2c381d72c platform/x86: dell-wmi-base: F=
ix resource leak on module load failure
> =0915:  cfe467c730f6 =3D 15:  530a2dd4ee84 platform/x86: dell-wmi-base: F=
ix handling of ultra performance key
> =0916:  74850eb0012b =3D 16:  356f771f3a4a platform/x86: dell-ddv: Use no=
_free_ptr() to simplify error handling
> =0917:  43a862be3002 =3D 17:  3488f4727898 platform/x86: msi-wmi: Reforma=
t msi_wmi_notify()
> =0918:  0c716d1848ac =3D 18:  41cd652e1b8f platform/x86: msi-wmi: Add MSI=
 Claw M-Center keys
> =0919:  0df706e5e724 =3D 19:  9e560f6761e3 platform/x86: dell-wmi-sysman:=
 Don't hex dump attribute security buffer
> =0920:  ace16d4d3f38 =3D 20:  e05f35070d27 platform/x86: lenovo/ymc: Only=
 match lower byte in WMI lid switch query response
> =0921:  d3f2ecd21924 =3D 21:  bfd4586c8458 platform/surface: aggregator: =
Consistently define ssam_device_ids using named initializers
> =0922:  2f0fab3e8ef9 =3D 22:  be3e8304fc35 power: supply: surface_{batter=
y,charger}: Consistently define ssam_device_ids using named initializers
> =0923:  f3aaddb8a085 =3D 23:  67444032146a platform/x86: toshiba_bluetoot=
h: Use more common error handling code in toshiba_bt_rfkill_probe()
> =0924:  f820f61f079a =3D 24:  258da36b410d platform/x86/amd/hsmp: Validat=
e ACPI UID before parsing socket index
> =0925:  1cacf5e8693d =3D 25:  18506e66652e platform/x86/amd/hsmp: Validat=
e _DSD mailbox sub-package element count
> =0926:  0c963c5b4d68 =3D 26:  dabf39aac670 platform/x86/amd/hsmp: Pass st=
ruct device explicitly to ACPI mailbox parsers
> =0927:  ff7836fa850c =3D 27:  67e753cf0448 platform/x86/amd/hsmp: Gate th=
e data plane on a fully initialized socket
> =09 -:  ------------ > 28:  d8258e35a542 platform/x86: asus-laptop: Stop =
setting acpi_device_name/class()
> =09 -:  ------------ > 29:  c327e5c90164 platform/x86: eeepc-laptop: Stop=
 setting acpi_device_name/class()
> =09 -:  ------------ > 30:  c0948dcbc48a platform/x86: fujitsu-laptop: St=
op setting acpi_device_name/class()
> =09 -:  ------------ > 31:  852a85c15a7f platform/x86: fujitsu-tablet: St=
op setting acpi_device_name/class()
> =09 -:  ------------ > 32:  fc0ed8545cb0 platform/x86: thinkpad_acpi: Sto=
p setting acpi_device_class()
> =09 -:  ------------ > 33:  68a04fe822ac platform/x86: panasonic-laptop: =
Stop setting acpi_device_name/class()
> =09 -:  ------------ > 34:  d3d6f7e72a77 platform/x86: sony-laptop: Stop =
setting acpi_device_class()
> =09 -:  ------------ > 35:  5fec95ebc3ad platform/x86: toshiba_acpi: Do n=
ot use uninitialized device_class
> =09 -:  ------------ > 36:  a3fbc0114add platform/x86: toshiba_haps: Do n=
ot use uninitialized device_class
> =09 -:  ------------ > 37:  90a0805bc911 platform/x86: xo15-ebook: Stop s=
etting acpi_device_name/class()
> =09 -:  ------------ > 38:  51a153f2747f platform/x86: topstar-laptop: St=
op setting acpi_device_name/class()
>=20
> The rebase went cleanly without any change, and ...
>=20
> =09$ git log -G'#include' 67e753cf0448..51a153f2747f
> =09$
>=20
> the patches on top of the cleanly rebased ones don't touch any include
> stuff.
>
> As long as no patches should be applied that actually depend on the
> rework that went into -rc2, I would have just continued with my branch
> on top of -rc1.
> To handle the anxiety that the rework might break something in my
> branch, I'd just merge -rc2, test, and if nothing relevant is found, I'd
> just throw away the test merge again.

It's not just about the patches already there... (I probably haven't yet=20
processed that many patches that are more prone to add includes.)

In pdx86 world, we actually try to force people add includes for=20
everything they use. Even those which would come through some other=20
include which is not what many reviewers/maintainers actively enforce.=20
It's because missing them makes refactoring headers even more painful than=
=20
it is because of the build fail landmines awaiting (I think you=20
encountered one or two of such cases too during your refactoring). As=20
such, I expect there to be more churn in the includes block than many=20
other trees might have.

I've done this so that I catch include conflicts while merging. A=20
throwaway merge wouldn't be very helpful for that.

> > Basically what Linux has done should
> > have been done just before issuing -rc1.
>=20
> Well, getting such a rework ready before -rc1 is difficult. A driver
> that is added late in the merge window might break these changes. So I
> still think the way we chose to do it (i.e. getting the changes into
> next directly after -rc1 and merge just before -rc2 after no issues
> showed up) is sane.
>=20
> From my POV "mid-rc-cycle merge" is unjustified blaming. Yes, it was
> after -rc1, but as argued above before -rc1 is hard and IMHO it doesn't
> matter much if it goes in soon after -rc1 or just before -rc2 because
> only the tags are sync points and keeping some flexibility by exposing
> it for testing in next instead of Linus's tree is IMHO also justified.

Like it or not, from my point of view, mid-rc-cycle merge caused me this=20
extra hassle.

Also, I wrote mid-rc-cycle merge as a fact/explanation, not with the=20
intention to blame you. I understood you wanted to have it done this way,
I conceded. I knew it has some consequences into my workflow.

I still appreciate you actually doing that work even if it caused some=20
hassle for me!


--=20
 i.

--8323328-1683474655-1783415697=:1152--

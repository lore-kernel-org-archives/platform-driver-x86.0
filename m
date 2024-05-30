Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39F2757EB
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 May 2024 21:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717104252; cv=none; b=ghVpAn9hyY7uE67L2V0s2K92XD1B2o0gPuyl0Kgn1D77UeWCh46dk46EhoOtLrxIIB5IIlYn0Q0a4UVDB8Gd/IRXC55qn1Aa/YRvFrevue2QGIRLqJlLVT+McXF/+VQH2OvUqcxSRYlrWTKelBc8pclMeNSKcrZeykOIP5I5t3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717104252; c=relaxed/simple;
	bh=9svD1r+ccfnJ4BKuav6KL1G+1o12iT7QBcEPozjtA3s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RfW48fkpiyS7S2PQFRJEH1cL4SLtOT+1i/7HsB4EBjiRuj+Dbij8bpHxZd+R+gY6AgA6IOhJZrBgasIn5xCCss5IC3HFVW0rEuT6qiK3E9O3F8xwasJi2GW3ZyLzeW67USTFFqXqgMlUPqA2FPgqhW9yjPasQBl9b6B2JBU3CfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cGQcFcdk; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cGQcFcdk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717104251; x=1748640251;
  h=message-id:subject:from:reply-to:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=9svD1r+ccfnJ4BKuav6KL1G+1o12iT7QBcEPozjtA3s=;
  b=cGQcFcdk0cDdQO3QnVi2XG/kZoDLJHaHqIbK1WgabriCUk1AZATJRIti
   gZwmCvXYYYKIkI5umNT7X6udbC9bLrSx6coWILfQGgbDu6jW4Xjt20CP/
   1k3YE0B0ys2b8oI1YaR7tNHfOs3FiM02ChOr3mqa6rqov2wA+fX3KxMJQ
   a9eGLAz6JAeDo8VnaGThigvyplznruq3wunSsX41zIivoEgVhCfOcqqL+
   RASkriG/evu9zoP72D0e7TYEtwd6YpLSMDtfGQRu9770Rz+P4kW/x/oPG
   LpoXcgYFVN2fi7zTjiO0HojuUrdiZegKBZjlZ3Xv0kd3bFWqmQv0Yb/4x
   A==;
X-CSE-ConnectionGUID: lq4Lq8/gTGyQVesSjWl7yA==
X-CSE-MsgGUID: l/GFrGsESraOBDtGJ0E71Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="17467685"
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; 
   d="scan'208";a="17467685"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 14:24:10 -0700
X-CSE-ConnectionGUID: Amnj825XRzeWfaIg5Z040Q==
X-CSE-MsgGUID: 2wZ2WTrET56bxbv5rxc2vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; 
   d="scan'208";a="36571999"
Received: from linux.intel.com ([10.54.29.200])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 14:24:10 -0700
Received: from [10.54.75.156] (debox1-desk1.jf.intel.com [10.54.75.156])
	by linux.intel.com (Postfix) with ESMTP id D233E20B5703;
	Thu, 30 May 2024 14:24:09 -0700 (PDT)
Message-ID: <49bd6fea5a77a2b419e5c808e400f02fe275d9b1.camel@linux.intel.com>
Subject: Re: Dell XPS 13 9360: `slp_s0_residency_usec` stays 0
From: "David E. Box" <david.e.box@linux.intel.com>
Reply-To: david.e.box@linux.intel.com
To: Paul Menzel <pmenzel@molgen.mpg.de>, Mario Limonciello
 <mario.limonciello@amd.com>, Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
  David E Box <david.e.box@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=
	 <ilpo.jarvinen@linux.intel.com>, platform-driver-x86@vger.kernel.org
Date: Thu, 30 May 2024 14:24:09 -0700
In-Reply-To: <36a91aa1-84e3-4ad5-8384-1bd999c15675@molgen.mpg.de>
References: <38fc334a-7c8c-4e43-bf63-6ac9aa882a2f@molgen.mpg.de>
	 <c73a9072-27eb-4d42-b74a-52619a81837e@molgen.mpg.de>
	 <81e937f0-df95-4e07-8d0f-3e20fce8481f@amd.com>
	 <36a91aa1-84e3-4ad5-8384-1bd999c15675@molgen.mpg.de>
Autocrypt: addr=david.e.box@linux.intel.com; prefer-encrypt=mutual;
 keydata=mQENBF2w2YABCACw5TpqmFTR6SgsrNqZE8ro1q2lUgVZda26qIi8GeHmVBmu572RfPydisEpCK246rYM5YY9XAps810ZxgFlLyBqpE/rxB4Dqvh04QePD6fQNui/QCSpyZ6j9F8zl0zutOjfNTIQBkcar28hazL9I8CGnnMko21QDl4pkrq1dgLSgl2r2N1a6LJ2l8lLnQ1NJgPAev4BWo4WAwH2rZ94aukzAlkFizjZXmB/6em+lhinTR9hUeXpTwcaAvmCHmrUMxeOyhx+csO1uAPUjxL7olj2J83dv297RrpjMkDyuUOv8EJlPjvVogJF1QOd5MlkWdj+6vnVDRfO8zUwm2pqg25DABEBAAG0KkRhdmlkIEUuIEJveCA8ZGF2aWQuZS5ib3hAbGludXguaW50ZWwuY29tPokBTgQTAQgAOBYhBBFoZ8DYRC+DyeuV6X7Mry1gl3p/BQJdsNmAAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEH7Mry1gl3p/NusIAK9z1xnXphedgZMGNzifGUs2UUw/xNl91Q9qRaYGyNYATI6E7zBYmynsUL/4yNFnXK8P/I7WMffiLoMqmUvNp9pG6oYYj8ouvbCexS21jgw54I3m61M+wTokieRIO/GettVlCGhz7YHlHtGGqhzzWB3CGPSJMwsouDPvyFFE+28p5d2v9l6rXSb7T297Kh50VX9Ele8QEKngrG+Z/u2lr/bHEhvx24vI8ka22cuTaZvThYMwLTSC4kq9L9WgRv31JBSa1pcbcHLOCoUl0RaQwe6J8w9hN2uxCssHrrfhSA4YjxKNIIp3YH4IpvzuDR3AadYz1klFTnEOxIM7fvQ2iGu5AQ0EXbDZgAEIAPGbL3wvbYUDGMoBSN89GtiC6ybWo28JSiYIN5N9LhDTwfWROenkRvmTESaE5fAM24sh8S0h+F+eQ7j/E/RF3pM31gSovTKw0Pxk7GorK
	FSa25CWemxSV97zV8fVegGkgfZkBMLUId+AYCD1d2R+tndtgjrHtVq/AeN0N09xv/d3a+Xzc4ib/SQh9mM50ksqiDY70EDe8hgPddYH80jHJtXFVA7Ar1ew24TIBF2rxYZQJGLe+Mt2zAzxOYeQTCW7WumD/ZoyMm7bg46/2rtricKnpaACM7M0r7g+1gUBowFjF4gFqY0tbLVQEB/H5e9We/C2zLG9r5/Lt22dj7I8A6kAEQEAAYkBNgQYAQgAIBYhBBFoZ8DYRC+DyeuV6X7Mry1gl3p/BQJdsNmAAhsMAAoJEH7Mry1gl3p/Z/AH/Re8YwzY5I9ByPM56B3Vkrh8qihZjsF7/WB14Ygl0HFzKSkSMTJ+fvZv19bk3lPIQi5lUBuU5rNruDNowCsnvXr+sFxFyTbXw0AQXIsnX+EkMg/JO+/V/UszZiqZPkvHsQipCFVLod/3G/yig9RUO7A/1efRi0E1iJAa6qHrPqE/kJANbz/x+9wcx1VfFwraFXbdT/P2JeOcW/USW89wzMRmOo+AiBSnTI4xvb1s/TxSfoLZvtoj2MR+2PW1zBALWYUKHOzhfFKs3cMufwIIoQUPVqGVeH+u6Asun6ZpNRxdDONop+uEXHe6q6LzI/NnczqoZQLhM8d1XqokYax/IZ4=
Organization: David E. Box
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Paul,

On Fri, 2024-05-24 at 06:53 +0200, Paul Menzel wrote:
> Dear Mario, dear Linux folks,
>=20
>=20
> Am 22.05.24 um 18:37 schrieb Mario Limonciello:
> > On 5/22/2024 10:52, Paul Menzel wrote:
>=20
> > > On the Intel Kaby Lake laptop Dell XPS 13 9360,=20
> > > `/sys/kernel/debug/pmc_core/slp_s0_residency_usec` does stay 0 even=
=20
> > > after a s2idle suspend/resume cycle.
> >=20
> > It won't change your numbers but FWIW you can also read from
> >=20
> > $ cat /sys/power/suspend_stats/last_hw_sleep
> >=20
> > which is also accessible under kernel lockdown.
> >=20
> > >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0 $ sudo dmesg
> > > =C2=A0=C2=A0=C2=A0=C2=A0 [=E2=80=A6]
> > > =C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 0.000000] DMI: Dell Inc.=
 XPS 13 9360/0596KF, BIOS 2.21.0
> > > 06/02/2022
> > > =C2=A0=C2=A0=C2=A0=C2=A0 [=E2=80=A6]
> > > =C2=A0=C2=A0=C2=A0=C2=A0 [10176.745124] PM: suspend entry (s2idle)
> > > =C2=A0=C2=A0=C2=A0=C2=A0 [10176.757275] Filesystems sync: 0.012 secon=
ds
> > > =C2=A0=C2=A0=C2=A0=C2=A0 [10176.769118] Freezing user space processes
> > > =C2=A0=C2=A0=C2=A0=C2=A0 [10176.771693] Freezing user space processes=
 completed (elapsed 0.002
> > > seconds)
> > > =C2=A0=C2=A0=C2=A0=C2=A0 [10176.771710] OOM killer disabled.
> > > =C2=A0=C2=A0=C2=A0=C2=A0 [10176.771714] Freezing remaining freezable =
tasks
> > > =C2=A0=C2=A0=C2=A0=C2=A0 [10176.773487] Freezing remaining freezable =
tasks completed (elapsed
> > > 0.001 seconds)
> > > =C2=A0=C2=A0=C2=A0=C2=A0 [10176.773504] printk: Suspending console(s)=
 (use no_console_suspend
> > > to debug)
> > > =C2=A0=C2=A0=C2=A0=C2=A0 [10176.948337] ACPI: EC: interrupt blocked
> > > =C2=A0=C2=A0=C2=A0=C2=A0 [10176.951016] intel_pch_thermal 0000:00:14.=
2: CPU-PCH is cool [48C]
> > > =C2=A0=C2=A0=C2=A0=C2=A0 [10181.281827] ACPI: EC: interrupt unblocked
> > > =C2=A0=C2=A0=C2=A0=C2=A0 $ sudo more /sys/kernel/debug/pmc_core/slp_s=
0_residency_usec
> > > =C2=A0=C2=A0=C2=A0=C2=A0 0
> > >=20
> > > Is that expected?
> >=20
> > Is it a regression?=C2=A0 If so; probably it's worth bisecting.
>=20
> Sorry, I do not know. It=E2=80=99s the first time [1] I heard about this =
file,=20
> and that fwts [2] checks it. Do you remember, if Dell has any public=20
> logs from testing, containing `slp_s0_residency_usec`?
>=20
> > If it's not a regression IIUC you should probably run=20
> > https://github.com/intel/S0ixSelftestTool=C2=A0for assistance in next s=
teps=20
> > on debugging why this is happening.
>=20
> Thank you for the pointer. Please find the log file from `sudo=20
> ./s0ix-selftest-tool.sh -s` attached. Some PCIe ports are flagged.
>=20
>=20
> Kind regards,
>=20
> Paul

The report suggests checking the kernel log for any error loading drm firmw=
are.
If the firmware is loaded properly, you should see a message similar to the
following:

    [drm] Finished loading DMC firmware i915/kbl_dmc_ver1_04.bin (v1.4)

David

>=20
>=20
> [1]:=20
> https://review.coreboot.org/c/coreboot/+/81595/10/src/mainboard/cwwk/adl/=
Kconfig#9
> [2]: https://wiki.ubuntu.com/FirmwareTestSuite/
>=20
>=20
> > > PS: Some system details:
> > >=20
> > > ```
> > > $ LANG=3D lspci -nn
> > > 00:00.0 Host bridge [0600]: Intel Corporation Xeon E3-1200 v6/7th Gen=
 Core
> > > Processor Host Bridge/DRAM Registers [8086:5904] (rev 02)
> > > 00:02.0 VGA compatible controller [0300]: Intel Corporation HD Graphi=
cs
> > > 620 [8086:5916] (rev 02)
> > > 00:04.0 Signal processing controller [1180]: Intel Corporation Xeon E=
3-
> > > 1200 v5/E3-1500 v5/6th Gen Core Processor Thermal Subsystem [8086:190=
3]
> > > (rev 02)
> > > 00:14.0 USB controller [0c03]: Intel Corporation Sunrise Point-LP USB=
 3.0
> > > xHCI Controller [8086:9d2f] (rev 21)
>=20
> [=E2=80=A6]


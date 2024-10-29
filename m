Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E4742A92
	for <platform-driver-x86@vger.kernel.org>; Tue, 29 Oct 2024 14:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730210850; cv=none; b=aJUwbUZzENmtxtWaHuvBm/u8RB3e+6KKYjaeZLf3Ec3qjIP+jPEP6AoWfGiJ2A++vFH7GXXkyMqWkwush286Zve5G80n7y/Xf65NrrWNZYzm85qzjajsf7KM+n2fGGXX1FlQCRD+47tJs1emRTwvGJNmFEQ0qU12VSq+XJa6bJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730210850; c=relaxed/simple;
	bh=BcRYE57X2Ga/CAEYoJUiPQLSlrSidzpfxwKTffuLFYE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Lhj1W6AuvSF8eSq7EsLbRL6n3LOTR3ZGZHy0Gk4Qy8q9SbX8ow9YhRVFfoorFQ76MujsMU1SbqX/kEGhEO2Qyq3vmJ8KhLTp9/Po8uqoxLMFDjUZMqjmXhLS3NHtYndeRnAshjHAbP81GUG2xSlNxQza9JMyByTnLaKDsNGJj6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a27yVuZA; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a27yVuZA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730210847; x=1761746847;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=BcRYE57X2Ga/CAEYoJUiPQLSlrSidzpfxwKTffuLFYE=;
  b=a27yVuZAbyklegdooCCVNsOP1JL14P6Uoubr2psDOQfxjpIMbs12ZWY3
   yVc4slcjNRxzfxXcOI415ZFFYbgmYvqmreIZ+Iuo6WPBSCrlYyfrkJdS2
   uBsR6SKDQFU5iKpRgp9rvBzdqqRNjs395yY/XpCs9xWpXGcFbkVkPDYeT
   YM2JJ/ruI8AWQt2TL7PL8degWSVZo7eENK9nwFDq/i0808+PiYG6adTZW
   8lQxZJarTyXWtHbxoFTdloITipoBBOl8WPaWxaT1EsJQvFpFIiByW3uAG
   ym8siRQeDhHR7LaCvdSk7twPf8iXEjWTP1ElmMbUFM1IvHS7zr42B3H/A
   w==;
X-CSE-ConnectionGUID: QWRYehexQ++2Ay4vyyr16A==
X-CSE-MsgGUID: bLcy2vywTtmIrn+BGg4nCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="33649652"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="33649652"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 07:07:26 -0700
X-CSE-ConnectionGUID: KvA0KBzPQCWhHbMnX/X2bg==
X-CSE-MsgGUID: OhdX3i6HQ1e7QCdlLGYm2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="81877988"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.83])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 07:07:23 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 29 Oct 2024 16:07:19 +0200 (EET)
To: Mario Limonciello <mario.limonciello@amd.com>, 
    Hans de Goede <hdegoede@redhat.com>
cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
    platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
Subject: Re: [PATCH v3 5/5] platform/x86/amd/pmf: Add PMF driver changes to
 make compatible with PMF-TA
In-Reply-To: <e1502166-88db-4900-8f2d-ef9adfab42d1@amd.com>
Message-ID: <d7b8d58b-be23-179e-0618-9bcfc54b8d0b@linux.intel.com>
References: <20241023063245.1404420-1-Shyam-sundar.S-k@amd.com> <20241023063245.1404420-6-Shyam-sundar.S-k@amd.com> <733dbf68-a1a7-43d8-acc2-7f1b8d222427@amd.com> <84fe3b9b-cf98-4f49-ae2b-ec1a8759af4f@amd.com> <02bf47e4-f39e-4799-bda4-5a65e7f948f2@amd.com>
 <41d66544-6b49-4f22-8c1c-38f14ca47fbd@amd.com> <9260af45-4c7a-4e8e-8ab4-16b83ed51ee9@amd.com> <02a2c321-33f9-4bcd-9507-3b0788acc287@amd.com> <e1502166-88db-4900-8f2d-ef9adfab42d1@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-2119169554-1730210839=:951"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-2119169554-1730210839=:951
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

Hi Hens,

There a question / item needing your input below.

On Wed, 23 Oct 2024, Mario Limonciello wrote:
> On 10/23/2024 10:52, Shyam Sundar S K wrote:
> > On 10/23/2024 21:10, Mario Limonciello wrote:
> > > On 10/23/2024 10:32, Shyam Sundar S K wrote:
> > > > On 10/23/2024 20:04, Mario Limonciello wrote:
> > > > > On 10/23/2024 09:29, Shyam Sundar S K wrote:
> > > > > > On 10/23/2024 19:41, Mario Limonciello wrote:
> > > > > > > On 10/23/2024 01:32, Shyam Sundar S K wrote:
> > > > > > > > The PMF driver will allocate shared buffer memory using the
> > > > > > > > tee_shm_alloc_kernel_buf(). This allocated memory is locate=
d in
> > > > > > > > the
> > > > > > > > secure world and is used for communication with the PMF-TA.
> > > > > > > >=20
> > > > > > > > The latest PMF-TA version introduces new structures with OE=
M
> > > > > > > > debug
> > > > > > > > information and additional policy input conditions for
> > > > > > > > evaluating the
> > > > > > > > policy binary. Consequently, the shared memory size must be
> > > > > > > > increased to
> > > > > > > > ensure compatibility between the PMF driver and the updated
> > > > > > > > PMF-TA.
> > > > > > > >=20
> > > > > > > > Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> > > > > > > > Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> > > > > > > > Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> > > > > > >=20
> > > > > > > How does this present to a user?=C2=A0 From what you describe=
 it seems
> > > > > > > to
> > > > > > > me like this means a new TA will fail on older kernel in some=
 way.
> > > > > >=20
> > > > > > Newer TA will not fail on older systems. This change is just ab=
out
> > > > > > the
> > > > > > increase in TA reserved memory that is presented as "shared mem=
ory",
> > > > > > as TA needs the additional memory for its own debug data struct=
ures.
> > > > >=20
> > > > > Thx for comments. But so if you use new TA with older kernel driv=
er,
> > > > > what will happen?=C2=A0 Can TA do a buffer overrun because the pr=
esented
> > > > > shared memory was too small?
> > > > >=20
> > > >=20
> > > > New TA will fail on older kernel and hence this change will be
> > > > required for new TA to work.
> > >=20
> > > OK, that's what I was worried about.
> > >=20
> > > >=20
> > > > > >=20
> > > > > >  =C2=A0=C2=A0From user standpoint, always be on latest FW, irre=
spective of the
> > > > > > platform. At this point in time, I don't see a need for FW
> > > > > > versioning
> > > > > > name (in the future, if there is a need for having a limited su=
pport
> > > > > > to older platforms, we can carve out a logic to do versioning
> > > > > > stuff).
> > > > >=20
> > > > > I wish we could enforce this, but In the Linux world there is an
> > > > > expectation that these two trains don't need to arrive at station=
 at
> > > > > the same time.
> > > > >=20
> > > > > >=20
> > > > > > > Some ideas:
> > > > > > >=20
> > > > > > > 1) Should there be header version check on the TA and dynamic=
ally
> > > > > > > allocate the structure size based on the version of the F/W?
> > > > > > >=20
> > > > > >=20
> > > > > > This can be done, when the TA versioning upgrade happens, like =
from
> > > > > > 1.3 to 1.4, apart from that there is no header stuff associatio=
n.
> > > > > >=20
> > > > > > > 2) Or is there a command to the TA that can query the expecte=
d
> > > > > > > output
> > > > > > > size?
> > > > > > >=20
> > > > > >=20
> > > > > > No, this is just the initial shared memory that the driver allo=
cates
> > > > > > to pass the inputs and the commands to TA.
> > > > > >=20
> > > > > > > 3) Or should the new TA filename be versioned, and the driver=
 has
> > > > > > > a
> > > > > > > fallback policy?
> > > > > > >=20
> > > > > > > Whatever the outcome is; I think it's best that if possible t=
his
> > > > > > > change goes back to stable to try to minimize regressions to
> > > > > > > users as
> > > > > > > distros update linux-firmware.=C2=A0 For example Fedora updat=
es this
> > > > > > > monthly, but also tracks stable kernels.
> > > > > > >=20
> > > > > >=20
> > > > > > Advisory to distros should be to pick the latest PMF TA (note t=
hat,
> > > > > > I
> > > > > > have not still submitted to new TA FW).
> > > > >=20
> > > > > Yeah we can advise distros to pick it up when upstreamed as long =
as
> > > > > there isn't tight dependency on this patch being present.
> > > > >=20
> > > >=20
> > > > That is the reason I am waiting for this change to land. Once that =
is
> > > > done, I will submit the new TA, you can send out a advisory to upgr=
ade
> > > > the kernel or this change has to be back-ported to stable/oem kerne=
ls
> > > > for their enablement.
> > > >=20
> > > > Makes sense?
> > > >=20
> > >=20
> > > I think we need Hans' and Ilpo's comments here to decide what to do.
> > >=20
> >=20
> > Sure.
> >=20
> > > I will say that when we had this happen in amdgpu for a breaking
> > > reason there was a new firmware binary filename created/upstreamed fo=
r
> > > the breaking version (IIRC foo.bin -> foo_1.bin) and amdgpu had to
> > > have fallback code so it could be compatible with either binary.
> > >=20
> >=20
> > True. In case of amdgpu, the FW loading is part of the amdgpu driver.
> > But in case of PMF, the PMF TA gets picked from the AMD TEE driver
> > through the TEE commands.
> >=20
> > So, there is no need for FW versioning logic in PMF driver.
> >=20
>=20
> That's a very good point, and this is a lot of complexity then.
>=20
> >=20
> > > * If user on older kernel took newer linux-firmware package they used
> > > older binary.
> > > * If user on newer kernel took older linux-firmware package they used
> > > older binary.
> > > * If user on newer kernel took newer linux-firmware package they used
> > > newer binary.
> > >=20
> > > If the decision is this goes in "as is" it definitely needs to go bac=
k
> > > to stable kernels.
> > >=20
> >=20
> > IMHO, let's not put too many fallback mechanisms. The philosophy
> > should be use latest driver and latest FW that avoids a lot of
> > confusion and yeah for that to happen this change has to go to stable.
> >=20
> > Thanks,
> > Shyam
>=20
> Of course Hans and Ilpo make the final call, but I think from our discuss=
ions
> here it would be ideal that patch 1 and patch 5 from this series go into =
6.12
> and have stable tags, the rest would be 6.13 material.

Distros and SW component management challenges are more in the domain of=20
Hans' expertise so I'd prefer to hear his opinion on this.

Personally I feel though that the commit message is not entirely honest=20
on all the impact as is. The wordings are sounding quite innocent while if=
=20
I infer the above right, an incorrect combination will cause a=20
non-gracious failure.

--=20
 i.

--8323328-2119169554-1730210839=:951--

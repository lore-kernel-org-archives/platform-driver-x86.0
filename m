Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61958199EBB
	for <platform-driver-x86@vger.kernel.org>; Thu, 31 Oct 2024 10:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730372285; cv=none; b=f5AgG2mM3ZK7O9iX/DQ8j+NCxBd/6VwApHCmDK3Ur5YobGZ/C3xeL317+1k76pdq7CfbsYRkJ2UXU0CJJvDX0EwhvyS6Ow6SC6rn3TK9aYt5iukO8lL89E7DD/hHOFvlX6JGxHTF7kwcJ/uTJPH80fVGcxGTvUUxs/mt1Xuw4YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730372285; c=relaxed/simple;
	bh=3cd65PK/acYrF6LJCZjHZAzAyCeKc0um9VyCaJlZZFM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=e8DzBoM/h+XW5U/HsK10Ierie/ThpwtvKtF8bE6hOTsSE5LfYnMUiHdyhfuTxuhfqbX0sLbyym75J+zPlr//wq4afhwlbgHF3mvbKI9qhLI3fJ3PWfDLQ7ZmH+wIHlQt2T+JEgjN5qi12LDSjq+LVglDKPIhNyuU4THUqgl0+mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ehX9X/ph; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ehX9X/ph"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730372284; x=1761908284;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=3cd65PK/acYrF6LJCZjHZAzAyCeKc0um9VyCaJlZZFM=;
  b=ehX9X/phWDrZyZGxZyMfUrkRLZCsq3YdmTcvQ0eR2y1OUtjQrxqXmQPR
   l6U/7rth86va1d6INJkoFyV3fSTuAc3j6+SL3TUEFb6sfrAlW3wHVjtg6
   kG95hqdk0SODXBBECU97GAUq5bmZ75ptgeQvNR6per5Q8fLLJ8TI9+0Yf
   34jB3EAXL0qUWkwVMKbmD8SGfKM6Xu6jJRA0ip7PxpupmBbYs96166Cgr
   wECby6FW4AqSpajTxAojolUBYO6Rm9LfxSo2umGUbt0Qu/asu1xD7pbPu
   h7fzXJy1W0YT1fWYY0/BoLLaCgRu+zdYhwZh6lazyaur7oQkwbwxEbUYf
   A==;
X-CSE-ConnectionGUID: 1pqkZfCwSnu1uVaiDMNZsA==
X-CSE-MsgGUID: 8bY804XGQXqjp26kdY7dmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="41473713"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="41473713"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 03:58:03 -0700
X-CSE-ConnectionGUID: fghn3fUnS9uxa/jdH0NfXg==
X-CSE-MsgGUID: Ali3HOj9Qs6/gjsPnLGsLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="82133137"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.160])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 03:58:01 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 31 Oct 2024 12:57:58 +0200 (EET)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, 
    Mario Limonciello <mario.limonciello@amd.com>, 
    platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
Subject: Re: [PATCH v3 5/5] platform/x86/amd/pmf: Add PMF driver changes to
 make compatible with PMF-TA
In-Reply-To: <26109281-38a2-4166-b65d-b52dddceb542@amd.com>
Message-ID: <55ac865f-b1c7-fa81-51c4-d211c7963e7e@linux.intel.com>
References: <20241023063245.1404420-1-Shyam-sundar.S-k@amd.com> <20241023063245.1404420-6-Shyam-sundar.S-k@amd.com> <733dbf68-a1a7-43d8-acc2-7f1b8d222427@amd.com> <84fe3b9b-cf98-4f49-ae2b-ec1a8759af4f@amd.com> <02bf47e4-f39e-4799-bda4-5a65e7f948f2@amd.com>
 <41d66544-6b49-4f22-8c1c-38f14ca47fbd@amd.com> <9260af45-4c7a-4e8e-8ab4-16b83ed51ee9@amd.com> <02a2c321-33f9-4bcd-9507-3b0788acc287@amd.com> <e1502166-88db-4900-8f2d-ef9adfab42d1@amd.com> <d7b8d58b-be23-179e-0618-9bcfc54b8d0b@linux.intel.com>
 <63ac59dd-a33b-4bc8-b35c-7bf9329351b7@redhat.com> <26109281-38a2-4166-b65d-b52dddceb542@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-508772991-1730372278=:939"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-508772991-1730372278=:939
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 30 Oct 2024, Shyam Sundar S K wrote:
> On 10/30/2024 19:30, Hans de Goede wrote:
> > On 29-Oct-24 3:07 PM, Ilpo J=C3=A4rvinen wrote:
> >> Hi Hens,
> >>
> >> There a question / item needing your input below.
> >>
> >> On Wed, 23 Oct 2024, Mario Limonciello wrote:
> >>> On 10/23/2024 10:52, Shyam Sundar S K wrote:
> >>>> On 10/23/2024 21:10, Mario Limonciello wrote:
> >>>>> On 10/23/2024 10:32, Shyam Sundar S K wrote:
> >>>>>> On 10/23/2024 20:04, Mario Limonciello wrote:
> >>>>>>> On 10/23/2024 09:29, Shyam Sundar S K wrote:
> >>>>>>>> On 10/23/2024 19:41, Mario Limonciello wrote:
> >>>>>>>>> On 10/23/2024 01:32, Shyam Sundar S K wrote:
> >>>>>>>>>> The PMF driver will allocate shared buffer memory using the
> >>>>>>>>>> tee_shm_alloc_kernel_buf(). This allocated memory is located i=
n
> >>>>>>>>>> the
> >>>>>>>>>> secure world and is used for communication with the PMF-TA.
> >>>>>>>>>>
> >>>>>>>>>> The latest PMF-TA version introduces new structures with OEM
> >>>>>>>>>> debug
> >>>>>>>>>> information and additional policy input conditions for
> >>>>>>>>>> evaluating the
> >>>>>>>>>> policy binary. Consequently, the shared memory size must be
> >>>>>>>>>> increased to
> >>>>>>>>>> ensure compatibility between the PMF driver and the updated
> >>>>>>>>>> PMF-TA.
> >>>>>>>>>>
> >>>>>>>>>> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> >>>>>>>>>> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> >>>>>>>>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> >>>>>>>>>
> >>>>>>>>> How does this present to a user?=C2=A0 From what you describe i=
t seems
> >>>>>>>>> to
> >>>>>>>>> me like this means a new TA will fail on older kernel in some w=
ay.
> >>>>>>>>
> >>>>>>>> Newer TA will not fail on older systems. This change is just abo=
ut
> >>>>>>>> the
> >>>>>>>> increase in TA reserved memory that is presented as "shared memo=
ry",
> >>>>>>>> as TA needs the additional memory for its own debug data structu=
res.
> >>>>>>>
> >>>>>>> Thx for comments. But so if you use new TA with older kernel driv=
er,
> >>>>>>> what will happen?=C2=A0 Can TA do a buffer overrun because the pr=
esented
> >>>>>>> shared memory was too small?
> >>>>>>>
> >>>>>>
> >>>>>> New TA will fail on older kernel and hence this change will be
> >>>>>> required for new TA to work.
> >>>>>
> >>>>> OK, that's what I was worried about.
> >>>>>
> >>>>>>
> >>>>>>>>
> >>>>>>>>  =C2=A0=C2=A0From user standpoint, always be on latest FW, irres=
pective of the
> >>>>>>>> platform. At this point in time, I don't see a need for FW
> >>>>>>>> versioning
> >>>>>>>> name (in the future, if there is a need for having a limited sup=
port
> >>>>>>>> to older platforms, we can carve out a logic to do versioning
> >>>>>>>> stuff).
> >>>>>>>
> >>>>>>> I wish we could enforce this, but In the Linux world there is an
> >>>>>>> expectation that these two trains don't need to arrive at station=
 at
> >>>>>>> the same time.
> >>>>>>>
> >>>>>>>>
> >>>>>>>>> Some ideas:
> >>>>>>>>>
> >>>>>>>>> 1) Should there be header version check on the TA and dynamical=
ly
> >>>>>>>>> allocate the structure size based on the version of the F/W?
> >>>>>>>>>
> >>>>>>>>
> >>>>>>>> This can be done, when the TA versioning upgrade happens, like f=
rom
> >>>>>>>> 1.3 to 1.4, apart from that there is no header stuff association=
=2E
> >>>>>>>>
> >>>>>>>>> 2) Or is there a command to the TA that can query the expected
> >>>>>>>>> output
> >>>>>>>>> size?
> >>>>>>>>>
> >>>>>>>>
> >>>>>>>> No, this is just the initial shared memory that the driver alloc=
ates
> >>>>>>>> to pass the inputs and the commands to TA.
> >>>>>>>>
> >>>>>>>>> 3) Or should the new TA filename be versioned, and the driver h=
as
> >>>>>>>>> a
> >>>>>>>>> fallback policy?
> >>>>>>>>>
> >>>>>>>>> Whatever the outcome is; I think it's best that if possible thi=
s
> >>>>>>>>> change goes back to stable to try to minimize regressions to
> >>>>>>>>> users as
> >>>>>>>>> distros update linux-firmware.=C2=A0 For example Fedora updates=
 this
> >>>>>>>>> monthly, but also tracks stable kernels.
> >>>>>>>>>
> >>>>>>>>
> >>>>>>>> Advisory to distros should be to pick the latest PMF TA (note th=
at,
> >>>>>>>> I
> >>>>>>>> have not still submitted to new TA FW).
> >>>>>>>
> >>>>>>> Yeah we can advise distros to pick it up when upstreamed as long =
as
> >>>>>>> there isn't tight dependency on this patch being present.
> >>>>>>>
> >>>>>>
> >>>>>> That is the reason I am waiting for this change to land. Once that=
 is
> >>>>>> done, I will submit the new TA, you can send out a advisory to upg=
rade
> >>>>>> the kernel or this change has to be back-ported to stable/oem kern=
els
> >>>>>> for their enablement.
> >>>>>>
> >>>>>> Makes sense?
> >>>>>>
> >>>>>
> >>>>> I think we need Hans' and Ilpo's comments here to decide what to do=
=2E
> >>>>>
> >>>>
> >>>> Sure.
> >>>>
> >>>>> I will say that when we had this happen in amdgpu for a breaking
> >>>>> reason there was a new firmware binary filename created/upstreamed =
for
> >>>>> the breaking version (IIRC foo.bin -> foo_1.bin) and amdgpu had to
> >>>>> have fallback code so it could be compatible with either binary.
> >>>>>
> >>>>
> >>>> True. In case of amdgpu, the FW loading is part of the amdgpu driver=
=2E
> >>>> But in case of PMF, the PMF TA gets picked from the AMD TEE driver
> >>>> through the TEE commands.
> >>>>
> >>>> So, there is no need for FW versioning logic in PMF driver.
> >>>>
> >>>
> >>> That's a very good point, and this is a lot of complexity then.
> >>>
> >>>>
> >>>>> * If user on older kernel took newer linux-firmware package they us=
ed
> >>>>> older binary.
> >>>>> * If user on newer kernel took older linux-firmware package they us=
ed
> >>>>> older binary.
> >>>>> * If user on newer kernel took newer linux-firmware package they us=
ed
> >>>>> newer binary.
> >>>>>
> >>>>> If the decision is this goes in "as is" it definitely needs to go b=
ack
> >>>>> to stable kernels.
> >>>>>
> >>>>
> >>>> IMHO, let's not put too many fallback mechanisms. The philosophy
> >>>> should be use latest driver and latest FW that avoids a lot of
> >>>> confusion and yeah for that to happen this change has to go to stabl=
e.
> >>>>
> >>>> Thanks,
> >>>> Shyam
> >>>
> >>> Of course Hans and Ilpo make the final call, but I think from our dis=
cussions
> >>> here it would be ideal that patch 1 and patch 5 from this series go i=
nto 6.12
> >>> and have stable tags, the rest would be 6.13 material.
> >>
> >> Distros and SW component management challenges are more in the domain =
of=20
> >> Hans' expertise so I'd prefer to hear his opinion on this.
> >>
> >> Personally I feel though that the commit message is not entirely hones=
t=20
> >> on all the impact as is. The wordings are sounding quite innocent whil=
e if=20
> >> I infer the above right, an incorrect combination will cause a=20
> >> non-gracious failure.
> >=20
> > There are basically 4 possible scenarios and to me it
> > is only clear from this thread what will happen in 3 of
> > the 4 scenarios :
> >=20
> > 1. Old TA fw, Old kernel (TA_OUTPUT_RESERVED_MEM=3D906) -> works
> > 2. New TA fw, Old kernel (TA_OUTPUT_RESERVED_MEM=3D906) -> broken
> > 3. Old TA fw, new kernel (TA_OUTPUT_RESERVED_MEM=3D922) -> ???
> > 4. New TA fw, new kernel (TA_OUTPUT_RESERVED_MEM=3D922) -> works
> >=20
> > If the answer to 3 is: "works" then I agree that this patch
> > should be submitted to Linus as a fix with Cc: stable ASAP
> > and then once that has hit most stable series it should be
> > ok to upgrade the fw in linux-firmware
> >=20
>=20
> Short answer, "yes" it does not work for "3." and you can consider it
> a broken.
>=20
> > Note this is still not ideal but IMHO it would be ok.
> >=20
> > But if the answer is "broken" then we will really need to
> > find some way to unbreak this, which could be as simple
> > as querying the fw-version and basing the size on this,
> > but having a kernel change which will regress things for
> > users who do not have the old firmware yet is simply
> > not acceptable.
> >=20
>=20
> I am not sure if there is a firmware versioning interface that the ASP
> (AMD Security Processor) returns back the kernel/driver.
>=20
> The code path in this case is:
>=20
> AMD PMF driver -> AMD TEE driver -> AMD CCP driver -> ASP TEE -> ASP
> TA -> ASP HW.
>=20
> So, I uncertain which module has this information and where exactly
> the code of fw versioning has to reside. It will take a while for me
> to dig this in.
>=20
> Meanwhile, shall I drop this patch and resend the series (by
> addressing the dev_dbg change Mario commented) so that this atleast
> becomes a 6.13 material?

Yes, please do send a new version which has the comment addressed (I think=
=20
Hans can pick the first patch out of this version so you don't need to=20
include that one).

Also, please remember add a lore Link: to this thread into the patch 5/5=20
when you send it later in some form.

--=20
 i.

--8323328-508772991-1730372278=:939--

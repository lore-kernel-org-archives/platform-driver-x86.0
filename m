Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DDFD36DA06;
	Thu, 26 Mar 2026 10:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774520082; cv=none; b=fp7cP8O6Cg0yAxIGvNIJjH1TgZcJL8sBIkaF4O4tE7TD9VK9+qS8MVwCMq8K/f7dSoECUhmVHbR8oYCCqmi5RYzwL/gyrktyg5A0XWkVeRdgkM8zy/KF/1Ba4p36P+CmpPQ167SuGPZ0XmRugl89VeOjtaI4ehG6EdFYFG2yYBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774520082; c=relaxed/simple;
	bh=Y1zGLyMqmHs9h48xWHWK1tDpYvk2C5EXqhlGz8/V1pQ=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=SQN6Jnn31P5J/3bUyjAwfFjYeXh4MwMGogo3G7DAZhC1M4uPj7WiN+hJhbKJe4nOBaHy3gTaoiGGeYYtgzrw708HnDkJbOMeadkIpTRVp4hgDzhk8R4zqoOVCJwMSkNnWN+7AILQKRnpinTn80lDjeRrieM62iZcKJRYiJUbPoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TJudE6gQ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TJudE6gQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774520081; x=1806056081;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Y1zGLyMqmHs9h48xWHWK1tDpYvk2C5EXqhlGz8/V1pQ=;
  b=TJudE6gQYTUpH1h8a+/JIR7x6hyA+8Jk0OwOZMKyIS8pynJrSQI+aoWi
   u0zHMzQQtI7Vv7geN0YlNGrZ7qYf5GtsSyKGNO0jPUOfIoacw0jGAk4r8
   7+k04yuc3Zq3PDI7Fx7N6Tarh/UsGvTmHukUtQM6UlrXOeoAVEKELw0x9
   0lZU7xEQaW/Yq4yJXxq6N62t4tRjRTfXwrAcaOtnzO5u3uSlYUJBDIR/q
   o5CedO3DBVPRmbVbw8LoxmbWs/T8/k0ToFe19rVdM6QCUfMjlDj1nCD/R
   wBfX8/umXDPy7FZtcAwL48hU4kxVzJuuryNGDVzUmBLzJkkgKHW+b1Hx1
   w==;
X-CSE-ConnectionGUID: TMIOFHKhRGy1H6WgKV54XQ==
X-CSE-MsgGUID: jjBmJe3ST3WSRvZGl1D/hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75768565"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="75768565"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 03:14:40 -0700
X-CSE-ConnectionGUID: YgVj3MtrQKe60hKyhd50nQ==
X-CSE-MsgGUID: oC6KtWE4RYmCaxJ4bDUEOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="229901460"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.244.32])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 03:14:37 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 26 Mar 2026 12:14:33 +0200 (EET)
To: Mario Limonciello <mario.limonciello@amd.com>, 
    Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
    linux-doc@vger.kernel.org
cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
    Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    Yijun.Shen@Dell.com, Sanket.Goswami@amd.com
Subject: Re: [PATCH v3 7/7] Documentation/ABI: add testing entry for AMD PMF
 misc device interface
In-Reply-To: <05c21f3a-9f56-454e-a1e9-2924da962f29@amd.com>
Message-ID: <4632f092-f723-5dd3-9557-f10e9c881834@linux.intel.com>
References: <20260301131124.1370565-1-Shyam-sundar.S-k@amd.com> <20260301131124.1370565-8-Shyam-sundar.S-k@amd.com> <3b1fdb27-3179-ba33-3f8c-6d617b3827f3@linux.intel.com> <05c21f3a-9f56-454e-a1e9-2924da962f29@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-657504118-1774520073=:986"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-657504118-1774520073=:986
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

+ Documentation people

On Wed, 25 Mar 2026, Mario Limonciello wrote:
> On 3/25/26 08:58, Ilpo J=C3=A4rvinen wrote:
> > On Sun, 1 Mar 2026, Shyam Sundar S K wrote:
> >=20
> > > Add a Documentation/ABI/testing entry describing the AMD PMF util lay=
er
> > > misc device (/dev/amdpmf_interface) and the initial ioctls used to qu=
ery
> > > feature support and metrics data information. This interface is avail=
able
> > > when CONFIG_AMD_PMF_UTIL_SUPPORT=3Dy.
> > >=20
> > > Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> > > ---
> > >   .../ABI/testing/misc-amdpmf_interface         | 70 ++++++++++++++++=
+++
> > >   MAINTAINERS                                   |  1 +
> > >   2 files changed, 71 insertions(+)
> > >   create mode 100644 Documentation/ABI/testing/misc-amdpmf_interface
> > >=20
> > > diff --git a/Documentation/ABI/testing/misc-amdpmf_interface
> > > b/Documentation/ABI/testing/misc-amdpmf_interface
> > > new file mode 100644
> > > index 000000000000..62b0175e1345
> > > --- /dev/null
> > > +++ b/Documentation/ABI/testing/misc-amdpmf_interface
> > > @@ -0,0 +1,70 @@
> > > +What:=09=09/dev/amdpmf_interface
> > > +Date:=09=09February 2026
> >=20
> > As always, these get stale as we go. Please estimate the targetted kern=
el
> > version's release date instead to fill this field in.
>=20
> Honestly - do we have any value of these dates in the documentation at al=
l in
> the first place?  Anyone can go look up the date that kernel 7.1 was rele=
ased.
>=20
> Maybe we should just stop using this field in new documentation?

Hi Mario,

I share your opinion, it has limited value especially when we also have=20
the kernel version.

But I guess it would be fair to engage also documentation people in such a=
=20
discussion so I've added them.

--=20
 i.

> > > +KernelVersion:=097.1
> > > +Contact:=09Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> > > +Description:
> > > +=09=09The AMD Platform Management Framework (PMF) util layer exposes
> > > a
> > > +=09=09minimal user-space interface via a misc character device for
> > > +=09=09feature discovery and metrics monitoring.
> > > +
> > > +=09=09When CONFIG_AMD_PMF_UTIL_SUPPORT is enabled, the driver
> > > creates
> > > +=09=09a character device:
> > > +
> > > +=09=09=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> > > +=09=09/dev/amdpmf_interface
> > > +=09=09=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> > > +
> > > +=09=09The interface currently supports following ioctls:
> > > +
> > > +=09=09=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +=09=09IOCTL=09=09=09 Usage
> > > +=09=09IOCTL_PMF_POPULATE_DATA=09 User passes a struct
> > > amd_pmf_ioctl_info
> > > +=09=09=09=09=09 with control_code set to the desired
> > > +=09=09=09=09=09 metric or feature ID. The driver
> > > returns
> > > +=09=09=09=09=09 the requested data in val, or feature
> > > +=09=09=09=09=09 support status in feature_supported.
> > > +=09=09=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +
> > > +=09=09Following are the control codes supported (enum pmf_ioctl_id):
> > > +
> > > +=09=09=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +=09=09Control Code=09Description
> > > +=09=090=09=09IOCTL_POWER_SOURCE: AC/DC power source
> > > +=09=091=09=09IOCTL_POWER_SLIDER_POSITION: Current power
> > > slider
> > > +=09=092=09=09IOCTL_PLATFORM_TYPE: Platform form factor
> > > +=09=093=09=09IOCTL_LAPTOP_PLACEMENT: Device placement (on
> > > table/lap/bag)
> > > +=09=094=09=09IOCTL_LID_STATE: Lid open/closed status
> > > +=09=096=09=09IOCTL_SKIN_TEMP: Skin temperature (degrees
> > > Celsius)
> > > +=09=097=09=09IOCTL_USER_PRESENCE: User presence detection
> > > +=09=0910-19=09=09IOCTL_BIOS_INPUT_1 to IOCTL_BIOS_INPUT_10:
> > > Custom BIOS inputs
> > > +=09=0920=09=09IOCTL_GFX_WORKLOAD: Graphics workload
> > > percentage
> > > +=09=0929=09=09IOCTL_AMBIENT_LIGHT: Ambient light sensor
> > > reading
> > > +=09=0936=09=09IOCTL_AVG_C0_RES: Average C0 state residency
> > > +=09=0937=09=09IOCTL_MAX_C0_RES: Maximum C0 state residency
> > > +=09=0950=09=09IOCTL_SOCKET_POWER: Socket power consumption
> > > +=09=0952-61=09=09IOCTL_BIOS_OUTPUT_1 to IOCTL_BIOS_OUTPUT_10:
> > > BIOS output values
> > > +=09=09=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +
> > > +=09=09Feature Discovery:
> > > +
> > > +=09=09=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +=09=09Control Code=09Description
> > > +=09=0962=09=09IOCTL_FEATURE_AUTO_MODE: Auto Mode feature
> > > support
> > > +=09=0963=09=09IOCTL_FEATURE_STATIC_POWER_SLIDER: Static
> > > Power Slider
> > > +=09=0964=09=09IOCTL_FEATURE_POLICY_BUILDER: Policy Builder
> > > (Smart PC)
> > > +=09=0965=09=09IOCTL_FEATURE_DYNAMIC_POWER_SLIDER_AC: Dynamic
> > > slider on AC
> > > +=09=0966=09=09IOCTL_FEATURE_DYNAMIC_POWER_SLIDER_DC: Dynamic
> > > slider on DC
> > > +=09=09=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +
> > > +=09=09Following are the return codes:
> > > +
> > > +=09=09=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +=09=09Return code=09Description
> > > +=09=090=09=09success
> > > +=09=09EINVAL=09=09control_code is not recognized or handle is
> > > not available
> > > +=09=09EFAULT=09=09copy_to_user/copy_from_user failures
> > > +=09=09ENODEV=09=09PMF device not available
> > > +=09=09=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +
> > > +=09=09User-space tools integrating with AMD PMF to discover
> > > capabilities and
> > > +=09=09monitor real-time metrics for thermal and power management
> > > validation.
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 55af015174a5..78773373172c 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -1224,6 +1224,7 @@ AMD PMF DRIVER
> > >   M:=09Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> > >   L:=09platform-driver-x86@vger.kernel.org
> > >   S:=09Supported
> > > +F:=09Documentation/ABI/testing/misc-amdpmf_interface
> > >   F:=09Documentation/ABI/testing/sysfs-amd-pmf
> > >   F:=09drivers/platform/x86/amd/pmf/
> > >  =20
> >=20
>=20
--8323328-657504118-1774520073=:986--

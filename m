Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF723188713;
	Wed,  8 Jan 2025 09:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736328621; cv=none; b=Sf7gwS/WDZeiGCMsRi98AQ/xABOJvv5FNtXOMqF7TknIaRfb8a6ca6xDRc56SMVrmvza79rX7+c7eCfX1KGGPExQU+2arOZK/V/EA+iBG4rrKw/cxzke1TCwNVd4R5H1E8InYvgy9g47JbBjRZ4ok59ntkCZILxwEjJVzBOtwHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736328621; c=relaxed/simple;
	bh=rwv2YlrEP3Ydg5j3rAZIJfRoyDf3wmGEK6JTznxOgNo=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ITrsDvP0unpHQ+G8XXvg9oslyaqQ1d1dN/dxLl8WGVcW6bkrXggZJZhVBPL+iZ01gHVB4+EbZ32HHueWDSgfyNx3UvLkv7kp+jESIesOE3m8bT2JnQIMFsYdlCHFKXns5PCozuxP8n8YrqSK9zWR7qDX3FHePokJGVWpdmnidu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DfKasDOM; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DfKasDOM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736328619; x=1767864619;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=rwv2YlrEP3Ydg5j3rAZIJfRoyDf3wmGEK6JTznxOgNo=;
  b=DfKasDOMUcmmRuAip9PiehT6gNK+AynGpSCMBRQ3bnWATwzfTfZRcptM
   07PfBw2SDv3dzlJR7VI2rMdiets3EjzKr8FAR3HQCojpcu6NLXoVgTgFC
   KjZBYw8PIaDTQ28bimSOAzA4opkV0Zc9z01JfgiWkhds5WVZl4gujgM9V
   ZCXKTBmyMub1zKbrbhtOJ0hlUElDTC7mUIHI1hSo1Oi3EybRhmHtooq0q
   hyRTPQuvjxYPeNztq29MzijdalhTMaO0ihd8hLaYX2ej4nLfm9SbXbScC
   bOTNMbxibg75LXfrFQ3jIB6tJMlIemK/Wt5iQbeBoUr4eT0hywqZg0ERE
   A==;
X-CSE-ConnectionGUID: snn+een8SHagSPufaQilWQ==
X-CSE-MsgGUID: KS1JYc1jSn+7e9ts+slsyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36707340"
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; 
   d="scan'208";a="36707340"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 01:30:18 -0800
X-CSE-ConnectionGUID: tMqwkAkUQ5SJjTpPmAYwWg==
X-CSE-MsgGUID: jSdTTzZfRlGeNedbxkXTmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="140371890"
Received: from mbanciu-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.87])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 01:30:15 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 8 Jan 2025 11:30:12 +0200 (EET)
To: =?ISO-8859-15?Q?Thomas_Wei=DFschuh?= <linux@weissschuh.net>
cc: Mario Limonciello <mario.limonciello@amd.com>, 
    Hans de Goede <hdegoede@redhat.com>, Armin Wolf <W_Armin@gmx.de>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    Joshua Grisham <josh@joshuagrisham.com>
Subject: Re: [PATCH 2/2] platform/x86: firmware_attributes_class: Add test
 driver
In-Reply-To: <7f568cbd-b299-41c6-8786-25f225de8f4f@t-8ch.de>
Message-ID: <39e1f247-3b9e-2919-439b-edf95bb7927d@linux.intel.com>
References: <20250107-pdx86-firmware-attributes-v1-0-9d75c04a3b52@weissschuh.net> <20250107-pdx86-firmware-attributes-v1-2-9d75c04a3b52@weissschuh.net> <a20d538e-421f-45fb-b169-f9d2eb4c6aee@amd.com> <88ae2335-86dd-4cb2-8e20-88973a8e28b7@t-8ch.de>
 <1f5b77f3-c427-496e-9c1d-3150177f29d6@amd.com> <7f568cbd-b299-41c6-8786-25f225de8f4f@t-8ch.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-1728629321-1736328336=:1082"
Content-ID: <df124118-f333-602e-d189-471424350d7f@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1728629321-1736328336=:1082
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <eca0fdb6-5146-00ac-177c-a8a72b91f60a@linux.intel.com>

On Tue, 7 Jan 2025, Thomas Wei=DFschuh wrote:

> On 2025-01-07 15:18:21-0600, Mario Limonciello wrote:
> > On 1/7/2025 14:50, Thomas Wei=DFschuh wrote:
> > > On 2025-01-07 13:29:08-0600, Mario Limonciello wrote:
> > > > On 1/7/2025 11:05, Thomas Wei=DFschuh wrote:
> > > > > The driver showcases the use of the new subsystem API.
> > > > >=20
> > > > > Signed-off-by: Thomas Wei=DFschuh <linux@weissschuh.net>
> > > > > ---
> > > > >    drivers/platform/x86/Kconfig                    | 12 ++++
> > > > >    drivers/platform/x86/Makefile                   |  1 +
> > > > >    drivers/platform/x86/firmware_attributes_test.c | 78 +++++++++=
++++++++++++++++
> > > > >    3 files changed, 91 insertions(+)
> > > > >=20
> > > > > diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/=
Kconfig
> > > > > index 0258dd879d64be389f4dd9bc309fe089f23cc798..2a0e828657d2f0707=
4944d6c42dc204fc8825a42 100644
> > > > > --- a/drivers/platform/x86/Kconfig
> > > > > +++ b/drivers/platform/x86/Kconfig
> > > > > @@ -1065,6 +1065,18 @@ source "drivers/platform/x86/x86-android-t=
ablets/Kconfig"
> > > > >    config FW_ATTR_CLASS
> > > > >    =09tristate
> > > > > +config FW_ATTR_TEST
> > > > > +=09tristate "Firmware attribute test driver"
> > > > > +=09select FW_ATTR_CLASS
> > > > > +=09help
> > > > > +=09  This driver provides a test user of the firmware attribute =
subsystem.
> > > > > +
> > > > > +=09  An instance is created at /sys/class/firmware-attributes/te=
st/
> > > > > +=09  container various example attributes.
> > > > > +
> > > > > +=09  To compile this driver as a module, choose M here: the modu=
le
> > > > > +=09  will be called firmware_attributes_test.
> > > > > +
> > > >=20
> > > > I think if you're going to be introducing a test driver it should b=
e
> > > > compliant to what's in sysfs-class-firmware-attributes so that when=
 it's
> > > > inevitably copy/pasted we end up with higher quality drivers.
> > > >=20
> > > > That is you need at a minimum 'type', 'current_value', 'default_val=
ue',
> > > > 'display_name' and 'display_name_language_code'.  Then individual t=
ypes
> > > > employ additional requirements.
> > > >=20
> > > > I see 'type', 'current_value', and 'default_value, but I don't see
> > > > 'display_name' or 'display_name_language_code' here.
> > > >=20
> > > > Furthermore as this is a "string" attribute you're supposed to also=
 have a
> > > > "max_length" and "min_length".
> > >=20
> > > Agreed that more examples are better.
> > >=20
> > > But are these attributes really mandatory?
> > > "This attribute is mandatory" is only specified for "type" and>
> > "current_value".
> >=20
> > Ah wow, I had thought they were, but you're right they're not!
> >=20
> > > While "possible_values" certainly looks necessary for "enumeration",
> > > "min_length" for "strings" does so much less.
> >=20
> > Even if they're not mandatory, I think it's better to include them for =
the
> > same copy/paste reason I mentioned though.
>=20
> Thinking about it some more, which attributes should all be included?
> Having all of them in there could motivate driver authors to implement
> them all even it would mean filling in random values.
> The provided examples can already be copied-and-pasted and slightly
> adapted to add more attributes.

Hi,

Can't you like add comments to the optional ones to reduce the incentive=20
to fill them with random junk as it's a lot easier to just delete them than=
=20
generating some random junk. So if a developer is unsure what to do a=20
comment telling something is optional would help to lean towards 'I can=20
safely delete this'?

--=20
 i.

> Also as for providing an even higher level interface. There exists a
> fairly big feature matrix. For example the display_name_language_code:
> * Is it used at all?
> * Is it the same for all attributes implemented by the driver and the
>   sysfs attribute can be reused for them all.
> * Should the same handler logic be reused between different settings whic=
h
>   only differ in their language code?
>=20
> The answers seem to differ between each driver and having a uniform
> high-level interface that can handle all cases would look horrible.
> So I'd like to stick with the API provided currently for now and we can
> revisit it if there are more drivers.
> As mentioned before, the current API should be a decent baseline to
> build on top of.
>=20
>=20
> Thomas
>=20
--8323328-1728629321-1736328336=:1082--

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7AC3DB31E;
	Fri, 10 Jul 2026 09:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783674410; cv=none; b=W3+DqMFvoPwF1Bf2ZOiQqjh0FvTZHdD6Xh/Hwyxm7lqGh1Py8Mf+MlvndemHTuA2+tLl2B6xclOL5HwnYpDgTa5J3q7fKCC9N93XhF7gg+3qVcSQZV3/96AZdCggDmrtOdqqXA7srhyk0xl2/sgeogg/46smE6swW8I+mhn4uVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783674410; c=relaxed/simple;
	bh=6cJF7FuYIhEhORE2hvaHu97PsA5uiY7VownvpbVj+Sk=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=RZH5i9hrU8paCjW6/TnpT1ojJaKHdSw4YFh15qezAyCc870u7OUK4Fu6aT5sNz5NoxrcUNd2mJELRHKMyS34auitEyt4iMOgajmoOwRZ6+lToLIm0K/IuRPJ5eJaMrhuDHcBorO+pwsnB9Ewuv/7Di9u4Wuy96pgHeA2lyoLm3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lV8dgWSB; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lV8dgWSB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783674408; x=1815210408;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=6cJF7FuYIhEhORE2hvaHu97PsA5uiY7VownvpbVj+Sk=;
  b=lV8dgWSBSg+QvNNIGil746b5Z5j+q8LARKVmVmNsnZrj23lLn7fUg9kj
   Ze4f5SI0WGJd0WbmU+wbVenfEPt/ugs35iVTU5GAak05Los5514ZejRaO
   Ma0eiMXoY0D69PvYQnPk2kmVVtFqXgV49SgfNXfBNR+K0XkASyaGWBqIt
   zFhmnrVqiI0gZAE3jSHRg2b2dIImKmr7EBzHlidTAEbATp0QgFI1DIeKn
   9K8XKSZaRYIPwN3L7UFuepZp5t75bCzUdQOuq1rJuxyfLr5Q6WTPV7tMS
   9981SGmyw4x0qzhzFfK65Z2EpsiaLljdkn5NUBPSP9MJW+1ZUnlLIMcUY
   g==;
X-CSE-ConnectionGUID: JPISKK27SB+H6vIk0dJ4Bw==
X-CSE-MsgGUID: LdtSLjWARZqCHqjgSY7xDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84392851"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84392851"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 02:06:48 -0700
X-CSE-ConnectionGUID: h1utPdchSLmbDA2WLuCW6A==
X-CSE-MsgGUID: zBHKIVh1QouBRAoqKopj4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="258438230"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.169])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 02:06:44 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 10 Jul 2026 12:06:40 +0300 (EEST)
To: "Wysocki, Rafael J" <rafael.j.wysocki@intel.com>
cc: Linmao Li <lilinmao@kylinos.cn>, Corentin Chary <corentin.chary@gmail.com>, 
    "Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
    =?ISO-8859-15?Q?Jo=E3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>, 
    Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] platform/x86: asus-wireless: Fail probe when there
 is no ACPI match
In-Reply-To: <615f444c-494e-66bf-0aaa-6c5b51ef9b8e@linux.intel.com>
Message-ID: <f22fda2d-9854-5af5-60c2-489101487e76@linux.intel.com>
References: <20260706024953.534671-1-lilinmao@kylinos.cn> <20260708010706.718190-1-lilinmao@kylinos.cn> <8ac2bf78-a139-4ce6-818e-fc0cd218f71e@intel.com> <615f444c-494e-66bf-0aaa-6c5b51ef9b8e@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1388295962-1783674400=:1178"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1388295962-1783674400=:1178
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 9 Jul 2026, Ilpo J=E4rvinen wrote:

> On Wed, 8 Jul 2026, Wysocki, Rafael J wrote:
>=20
> > On 7/8/2026 3:07 AM, Linmao Li wrote:
> > > Every platform driver can be forced to match a device that doesn't ma=
tch
> > > its list of device IDs because of device_match_driver_override(), so
> > > platform drivers that rely on the existence of a device's ACPI compan=
ion
> > > object need to verify its presence.
> > >=20
> > > asus_wireless_probe() returns success when acpi_match_acpi_device()
> > > finds no match, leaving behind an input device that never reports
> > > anything because the notify handler is not installed.  Worse, when th=
e
> > > driver is force-bound to a device without an ACPI companion, probe
> > > still succeeds and stores a NULL companion pointer, which
> > > asus_wireless_remove() later passes to acpi_dev_remove_notify_handler=
(),
> > > leading to a NULL pointer dereference on unbind.
> > >=20
> > > Return -ENODEV when the device does not match the ID table.  This als=
o
> > > covers the missing-companion case, because acpi_match_acpi_device()
> > > rejects a NULL device.
> > >=20
> > > Fixes: f7e648027d7e ("platform/x86: asus-wireless: Convert ACPI drive=
r to a
> > > platform one")
> > > Suggested-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > > Signed-off-by: Linmao Li <lilinmao@kylinos.cn>
> >=20
> > Reviewed-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> >=20
> > (no issues found)
> >=20
> > > ---
> > > v2: Fail probe when the ACPI ID match fails instead of adding a
> > >      separate ACPI companion check at the top of probe (Rafael).
> > >=20
> > >   drivers/platform/x86/asus-wireless.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/platform/x86/asus-wireless.c
> > > b/drivers/platform/x86/asus-wireless.c
> > > index 2b494bf3cba8..d33853a1baf3 100644
> > > --- a/drivers/platform/x86/asus-wireless.c
> > > +++ b/drivers/platform/x86/asus-wireless.c
> > > @@ -155,7 +155,7 @@ static int asus_wireless_probe(struct platform_de=
vice
> > > *pdev)
> > >     =09id =3D acpi_match_acpi_device(device_ids, adev);
> > >   =09if (!id)
> > > -=09=09return 0;
> > > +=09=09return -ENODEV;
>=20
> I'm somewhat unsure what the intent here is because the driver is using=
=20
> device_ids as its .acpi_match_table anyway so what's the benefit of doing=
=20
> matching again for the same set of ids?
>=20
> Of course having this prevents those overrides but is it really a task fo=
r=20
> a platform driver to prevent user shooting himself into a foot with that=
=20
> gun (I mean beyond checking NULL like v1 did)?
>=20
> I'd tend to think this matching can be removed and the v1 check done=20
> instead. But Rafael who undoubtedly knows ACPI much better than I do seem=
s=20
> to be in favor of this version?

Nevermind about this, I see now it want to collect ->driver_data...

> I also don't understand why this check is done so late into the probe,=20
> IMO, it should simply be done before setting up the input device=20
> (logically just before assign adev).

=2E..But I still think it should be done earlier.

--=20
 i.

--8323328-1388295962-1783674400=:1178--

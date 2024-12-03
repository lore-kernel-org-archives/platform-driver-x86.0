Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C171F76C2
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Dec 2024 15:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733240315; cv=none; b=WD243S9jUyLBRpNtjEsujMwFn50wVYZsYQm2SO7WGvzNVu6QzMEhJI57dsHhVlGBIzmtFcQ+c/AON2ocUU/5s4RPCweuq67NnCRaPXdgpxQZ7WN33lxjcxTMiajufZ8cztmZBd8eYVTA9OSIXqqo7HaSXIbvRv2gCAb8FMu8abI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733240315; c=relaxed/simple;
	bh=XgJ0wfHjuxTCbtMf84EGxNIDaRmrryl0o7eS4Gj92Qc=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=eK8N30awaGe5x1jzj2QvMOt55QStEGtrgZ7JeUtzEh1epnUMJZgP2k8z1BlrBij94+ui8QeBWJ6B4leGDC9PRqvB45oetCaZPHDq41T4C1dsZEX61QsLqvRnOiSm6PLCowWgWXG/mD3mKcrvWokDAwXuLJSsvJEPm5hUxUJbEiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fSMX6/a4; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fSMX6/a4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733240313; x=1764776313;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=XgJ0wfHjuxTCbtMf84EGxNIDaRmrryl0o7eS4Gj92Qc=;
  b=fSMX6/a4JdZ0MqOWn/78RU1G3dIpln12rNkGZSZErLNmYlTZ3b66m+pn
   ofCvdJYLrkF+4ZLwmy5U7iGo49vfvWPWm+oUDE01laZodkP/fGUN3GIPb
   3YIoe+mBkx1SfCA0eIudbOW903EEqTTrc5vFynEG0eEutm1VZnTpvB6/M
   nzfuL0ZfDBwIV80/csiE26nYLYHuyJRXjO1iCeVKUi95w01pOAKcY0zRQ
   eB3VgQuAWiwZV01mz9Zvjco6lo20SKk+e9ekPZZm3U6y6ICwgi2eJc9+M
   60ydcy9VXMPN//sRXxKitxHlLuInr3NUGmpKgN7IxWJytoybdSXH4tZzt
   Q==;
X-CSE-ConnectionGUID: LowhuzkVQ1eFydZcNvLKLA==
X-CSE-MsgGUID: khULjEMUT5i/duWLQelooA==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="50870519"
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; 
   d="scan'208";a="50870519"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 07:38:33 -0800
X-CSE-ConnectionGUID: 9aWcZ2QOQ8CqN2iO3hAzbA==
X-CSE-MsgGUID: rRwAhPhBTEelq1GUzTRvqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; 
   d="scan'208";a="93350518"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.42])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 07:38:31 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 3 Dec 2024 17:38:27 +0200 (EET)
To: Andy Shevchenko <andy.shevchenko@gmail.com>
cc: Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2 2/2] platform/x86: x86-android-tablets: Add Vexia EDU
 ATLA 10 EC battery driver
In-Reply-To: <CAHp75VdJ_MfRXXX18c+rB943Saare6n_GEEwko+Hf31UW39XpA@mail.gmail.com>
Message-ID: <193bb88b-6613-fb09-86df-99fc63e0bb6b@linux.intel.com>
References: <20241116121659.57487-1-hdegoede@redhat.com> <20241116121659.57487-2-hdegoede@redhat.com> <b5b40432-77ed-2466-7d30-ce35a239d0ae@linux.intel.com> <Z04ASf0znID9C1FN@smile.fi.intel.com> <040238ad-6f88-4c4a-814e-2b94b7a43116@redhat.com>
 <CAHp75VdJ_MfRXXX18c+rB943Saare6n_GEEwko+Hf31UW39XpA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-1820244260-1733236707=:929"
Content-ID: <077f2543-b5b1-6b41-34ab-764396f46bbc@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1820244260-1733236707=:929
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <2a1e4973-ccdf-4359-0f0f-491e96a4109e@linux.intel.com>

On Tue, 3 Dec 2024, Andy Shevchenko wrote:

> On Mon, Dec 2, 2024 at 11:48=E2=80=AFPM Hans de Goede <hdegoede@redhat.co=
m> wrote:
> > On 2-Dec-24 7:45 PM, Andy Shevchenko wrote:
> > > On Mon, Dec 02, 2024 at 08:34:01PM +0200, Ilpo J=C3=A4rvinen wrote:
> > >> On Sat, 16 Nov 2024, Hans de Goede wrote:
>=20
> ...
>=20
> > >>> +struct atla10_ec_battery_state {
> > >>> +   u8 status;                      /* Using ACPI Battery spec stat=
us bits */
> > >>> +   u8 capacity;                    /* Percent */
>=20
> Then an obvious remark based on Hans' reply, why are these internal
> kernel types and not external ones, i.e. __u8?
>=20
> > >>> +   __le16 charge_now_mAh;
> > >>> +   __le16 voltage_now_mV;
> > >>> +   __le16 current_now_mA;
> > >>> +   __le16 charge_full_mAh;
> > >>> +   __le16 temp;                    /* centi degrees Celsius */
> > >>> +} __packed;
> > >>> +
> > >>> +struct atla10_ec_battery_info {
> > >>> +   __le16 charge_full_design_mAh;
> > >>> +   __le16 voltage_now_mV;          /* Should be design voltage, bu=
t is not ? */
> > >>> +   __le16 charge_full_design2_mAh;
> > >>> +} __packed;
> > >>
> > >> Both struct have only naturally aligned members. Why is __packed nee=
ded?
> > >
> > > Wouldn't the second one give sizeof() =3D=3D 8 rather than 6? Sorry, =
my memory
> > > about this in C is always flaky.
> >
> > That might be one way how things could go wrong, yes.
> >
> > To answer Ilpo's original question: these structures represent
> > the on wire format, hence also the __le16 use and the __packed
> > is there to disable any possible compiler shenanigans.
> >
> > I basically always add __packed to structures representing
> > hw memory / wire formats just to be sure.

Things will break spectacularly if such shenanigans are more than a myth.
It's not like they can change ABIs just like that without impacting real=20
code. Essential networking headers such as tcp.h and ip.h do not use=20
packed despite being literally wire formats. The day compiler people would=
=20
break natural alignment means no padding, world will stop so chances of=20
that happening are practically nil.

I admit though networking structs tend to be dword sized so Andy's=20
point about sizeof() has more validity in it. My tests seemed to indicate=
=20
it would be based on the alignment requirements of members within the=20
struct so all __le16 would not need extra tail padding. But unlike the
natural alignment case, I've not seen the ABI/spec language about that so=
=20
it seems acceptable in this case to use __packed, just in case.

--=20
 i.
--8323328-1820244260-1733236707=:929--

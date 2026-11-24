Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795530007;
	b=MlQcMWl/vwHLqzGHZ27naPfS60d1bK5vyV8UwuliFDJiZg9UBdrgLMqwH/F9TazZohvz
	 htXYfvYzC6dF+QXqUwH9AvAKlldJ3Hr6/zoSSh3Yc9i/2CUXHZq7r7KhBF/2FKfh+xolU
	 6IxCEZ07yQLHXI9KjxWa4eWt22Y/qsAiondL5S4uFxEcq7GO9uMxXH/GvWedxFvQj+fPD
	 2rwlFzz29llbn3Q0+lNsTKB/C9mcirci28VSDSPdpDrAa36++E8V3QokG53Frl8RuR7x8
	 wmmnxsFSUqEGfc3njN4y7rUE5lrzJn5eB6VMsHiW3k0w6kMhmgvoiyZ48OsnC2iiKQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530007;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type:
	 Content-ID;
	bh=ZX14mWVlFUFvAroRXVoq9BmZQ5674+JrtoPFJUzJT2E=;
	b=e4F5RYD5+qgBaZpUujXuXSuqZm6GSI6XKAWtas3oXnsrEtMAjVF6sLxSlRgBuY5WoiTR
	 CnmD06kvVRItZKNxIApwGC9EU5k2tr/cqe1dC398ZGP5OIZgjI9MpZnFyu5KkxOExWvP/
	 lVDDGWEPHx5Cn5qu1kZMqmjGt0Rf6eYtMFwlWYKJi8aqwqYtcf5o3KpCTsR6rrcsW4vqL
	 O9vNNWD2iagUWHp/2qID1KHLUA6YqVynPXUntUolibA7IFwPeSkREZVu4mPumMwbWDz5v
	 0Jc/W0qW8MBNmkYt62L9yCVrkAJ4bJjWFvJT3B5T7DQhRr1Dg0dJPwhs+45KRrznomA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nrHOo9ok;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F013C606A338;
	Tue, 24 Nov 2026 14:20:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F013C606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nrHOo9ok
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795530007; x=1827066007;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=IE8hHtc50kPBPBJMlwFyegjl7tVOJnTXdX1VwtXzJ4k=;
  b=nrHOo9okdTbJzm21xp84ImNXTzghboJ4Kqd1rMt/whLWQGeXlxax2q7E
   84f2xnHPZZEhOfNpwv88+3G+s7VDaAN//VYrbqrH1/PoWwPzmpCBFRoMH
   8h7ahw4sIQIfVt0RYeJkRG2033/3ZcHaBxl6WIlNNk4WIVrS0OszRXmw6
   zOfY8+RAV+fjWneqXO4jFrKp66W2iUBF2b/UtqugeaRrvfz+TEIciagnn
   nsh+7zSaTqt3QOFQ8OZ4A860gETvNV1T3y0E1UuQuHL7i5A2L51qkV+0G
   n2SsWX6mX0yKggAAfds7BoNXZdDD3M8NHQ6LnEA0CH7qP2Sx1U3xUWDet
   Q==;
X-CSE-ConnectionGUID: JgdGAZf+SseFgAyX0N5EXQ==
X-CSE-MsgGUID: pb1KKsgIQHyG98kCgn8UCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4287036"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4287036"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 06:20:06 -0800
X-CSE-ConnectionGUID: 7JmhZtc8QliHqxwgbiKajA==
X-CSE-MsgGUID: M1v1GBUjRBe8g3pwkKughQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="11694762"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.190])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 06:20:04 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 24 Nov 2026 16:20:00 +0200 (EET)
To: Rosen Penev <rosenp@gmail.com>
cc: Matthew Garrett <mjg59@srcf.ucam.org>, 
    =?ISO-8859-15?Q?Pali_Roh=E1r?= <pali@kernel.org>, 
    Hans de Goede <hansg@kernel.org>, 
    Gabriele Mazzotta <gabriele.mzt@gmail.com>, 
    Darren Hart <dvhart@linux.intel.com>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] platform/x86: dell-laptop: Parse the charge end
 threshold as an int
In-Reply-To: <CAKxU2N8cn+hbUH4iwP2w6myQV28LM1+djvmQfN92A8z1G9Y5Tw@mail.gmail.com>
Message-ID: <ce0f3108-ef9e-08a7-9b5c-b0a330159988@linux.intel.com>
References: <cover.1795219225.git.rosenp@gmail.com> <6abac23d8f9985b55282ee56c97155a67076257c.1795219225.git.rosenp@gmail.com> <51f6631e-62df-0e64-b358-805d343475b7@linux.intel.com> <CAKxU2N8cn+hbUH4iwP2w6myQV28LM1+djvmQfN92A8z1G9Y5Tw@mail.gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-414250409-1795529647=:1182"
Content-ID: <f590003e-111a-cb9b-e8da-ccf1ca6af971@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-414250409-1795529647=:1182
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <065521a9-8536-430e-7dbc-b75d7d7f3972@linux.intel.com>

On Mon, 23 Nov 2026, Rosen Penev wrote:

> On Mon, Nov 23, 2026 at 12:32=E2=80=AFAM Ilpo J=C3=A4rvinen
> <ilpo.jarvinen@linux.intel.com> wrote:
> >
> > On Fri, 20 Nov 2026, Rosen Penev wrote:
> >
> > > charge_control_end_threshold_store() passes a pointer to an int to
> > > kstrtouint(), which only builds because the kernel disables
> > > -Wpointer-sign, and makes the following "end < 0" check dead code.
> > > Use kstrtoint() like charge_control_start_threshold_store(). Values
> > > outside 0 to 100 are rejected either way.
> >
> > Why the <0 check has to be kept on the driver side?
>
> It's currently a one line change instead of three.

Huh!?! What criteria is that?! :-/

=2E..Could you then, like change those three lines instead. Please.

--
 i.

> >
> > Why not change the variable type instead and remove the then dead code
> > check?
> >
> > It's somewhat disappointing this even has to be pointed out by review.
> >
> > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > > ---
> > >  drivers/platform/x86/dell/dell-laptop.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/platform/x86/dell/dell-laptop.c b/drivers/platfo=
rm/x86/dell/dell-laptop.c
> > > index eca348497ac3..c512267be4c4 100644
> > > --- a/drivers/platform/x86/dell/dell-laptop.c
> > > +++ b/drivers/platform/x86/dell/dell-laptop.c
> > > @@ -2382,7 +2382,7 @@ static ssize_t charge_control_end_threshold_sto=
re(struct device *dev,
> > >  {
> > >       int ret, end;
> > >
> > > -     ret =3D kstrtouint(buf, 10, &end);
> > > +     ret =3D kstrtoint(buf, 10, &end);
> > >       if (ret)
> > >               return ret;
> > >       if (end < 0 || end > 100)
> > >
> >
> > --
> >  i.
> >
>=20
--8323328-414250409-1795529647=:1182--

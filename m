Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3D52D738B
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Sep 2025 09:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758707864; cv=none; b=TgGTXqsxt8WjJoJsXAuVNmJ2n7tEgX0cthBYgAKxBEQ9I+Mf4zcjoacFbqSerAMTUmbzOIMKWrrXKsH2qxH4AdXR9hM5WaOcar655GVu/OsHNNlWws75dyema2BKPslfvt792u++2YvIYT1GnDZHQrK+yXmGPnc2C8jTTS3lKy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758707864; c=relaxed/simple;
	bh=O3sFfg9i3fHphhd8jG6JZ64qfwHj+Hc5cgIgXPx6Qvo=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=hn/FqHRPVnwy48KRJsa8B6hXTTjAYkEg4lBrPIEYsuU9gjHUr5k5DpQUz8KObRbCzojIIZ3Abh/q8JGfEG6KGQPrkuhoK0UqQDrxTH+0RkzyIP4IrQs5wR95VrzaJeAAKllLV/GH5143ZFSfYqNZPQuyjnYggLVPDn6r7o13XsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AoxEK3aN; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AoxEK3aN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758707862; x=1790243862;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=O3sFfg9i3fHphhd8jG6JZ64qfwHj+Hc5cgIgXPx6Qvo=;
  b=AoxEK3aNf2PyqW4ZSl3i+idmccytCVxHad41IgzS426YIMzlbqfsrg9Z
   +lFioBj7TmKJrwGkrilUmM11cTbhQDaN2OTbb00Kf5XllS1tp/TpH+N32
   X7ftGEi9Gxs4WJ6GirtNyKgKQRTkf8IMhFrRtOPgTbQZC3I8xlKJoetTr
   a1gme/FKbUm1EpsYyj4RzXMdY03drc76cErTxtDfySdCcvQDxKsV/thbA
   fMnMcQvMh5iwvghe1r0/NUNBiKysw9FJPFqeIJ8CHrPZgdvUqoRsvu4l2
   bxFJtF82BZWQziZiGoWQAJw3ZgaA7oqjZkB1eGCO9cXFDsuE1OtKnVzSk
   Q==;
X-CSE-ConnectionGUID: O0kbgmpLSG+TOjculqV9tg==
X-CSE-MsgGUID: kAaFt8eSThmFF32Q+Khv0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61052852"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="61052852"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 02:57:42 -0700
X-CSE-ConnectionGUID: t+LCnXDCQq2Khu4dN9s1GA==
X-CSE-MsgGUID: 4njGNkDET96W6F1U9L8ylw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; 
   d="scan'208";a="182276367"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.210])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 02:57:39 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 24 Sep 2025 12:57:35 +0300 (EEST)
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>, david.e.box@intel.com, 
    xi.pardee@linux.intel.com
cc: platform-driver-x86@vger.kernel.org, irenic.rajneesh@gmail.com, 
    kernel-dev@igalia.com, kernel@gpiccoli.net
Subject: Re: [PATCH 2/4] platform/x86/intel/pmc: Dump raw SLP_Sx_DBG registers
 and distinguish between them
In-Reply-To: <081cc0a2-f684-e5aa-e87f-05a54db87022@igalia.com>
Message-ID: <ad1d5457-cae6-03f6-970d-0492727e66a0@linux.intel.com>
References: <20250922230812.1584253-1-gpiccoli@igalia.com> <20250922230812.1584253-3-gpiccoli@igalia.com> <db836cd7-c3aa-ee60-e622-c52fcdb78fb3@linux.intel.com> <081cc0a2-f684-e5aa-e87f-05a54db87022@igalia.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-2127700017-1758707855=:938"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-2127700017-1758707855=:938
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 23 Sep 2025, Guilherme G. Piccoli wrote:

> Hi Ilpo, thanks a lot for your review, very nice points! Comments below:
>=20
>=20
> On 23/09/2025 04:59, Ilpo J=C3=A4rvinen wrote:
> > [...]
> >> This should bring no functional change, the goal is only to improve
> >> reading and allow full comparison between raw register values.
> >=20
> > Hi,
> >=20
> > I don't think that's exactly the definition of "no function change" if =
you=20
> > intentionally make a change to the reading. :-)
>=20
> Hehe yeah, you're right - it changes the output, so that's a functional
> change indeed (imagine a userspace script parsing it...). I was thinking
> in functional change as in "no extra register reads are performed", but
> I agree with you and will drop this text from next version, thanks for
> pointing!
>=20
>=20
> >[...]
> >> +
> >> +=09=09if (dev)
> >> +=09=09=09dev_info(dev, "\nSLP_S%u_DBG:\t0x%x\n", cnt, data);
> >> +=09=09if (s)
> >> +=09=09=09seq_printf(s, "\nSLP_S%u_DBG:\t0x%x\n", cnt, data);
> >>  =09=09while (map->name) {
> >>  =09=09=09if (dev)
> >> -=09=09=09=09dev_info(dev, "SLP_S0_DBG: %-32s\tState: %s\n",
> >> -=09=09=09=09=09map->name,
> >> +=09=09=09=09dev_info(dev, "SLP_S%u_DBG: %-32s\tState: %s\n",
> >=20
> > I'm not sure about this change. To me it looks the naming is "SLP S0 DE=
BUG=20
> > REGx (SLP_S0_DBG_x)" according to this:
> >=20
> > https://edc.intel.com/content/www/tw/zh/design/publications/14th-genera=
tion-core-processors-ioe-p-registers/slp-s0-debug-reg2-slp-s0-dbg-2-offset-=
10bc/
> >=20
> > ...So changing from S0 to S1 or S2 does not seem correct here?
> >=20
> > I wonder if this really a problem to begin with as the names should be=
=20
> > unique, no?
>=20
> Totally right again! Nice catch, it should be as you pointed, the
> different ID is at the end of the string.
> And no, it's definitely not a problem / big deal - I just took the
> opportunity to improve the output, but I messed up heh
>=20
> Lemme know if you prefer that I keep the old naming or fix it properly,
> like SLP_S0_DBG_2, etc.

I'd prefer Xi or David comment on this whether to add the number there or=
=20
not. This will end up being after the merge window material anyway so lets=
=20
give them a few days.

> > [...]
> > This assumption seems somewhat fragile but maybe it's not worth=20
> > engineering it beyond this at this point.
>=20
> Sorry, I couldn't understand this sentence. Can you clarify it for me?
> What assumption and what do you think we should do?

I was just referring to the ++ line that you for some reason snipped.=20
It assumed certain order of things in the input array which arms a=20
trap. But then, we know all the current inputs are okay with this simple=20
approach and I'm not sure if this code is getting much changes in the=20
future so it might be over-engineering to store the number into the=20
input array within the struct.

> >[...]=20
> > Also, please remember to add all maintainers as receipients when postin=
g.
>=20
> My apologies - I checked MAINTAINERS directly and added everyone from
> INTEL PMC + Xi Pardee (many patches in the driver); but I should have
> used get_maintainers instead, which brings your name. Thanks for
> reviewing even when I forgot to add your email!!

--=20
 i.

--8323328-2127700017-1758707855=:938--

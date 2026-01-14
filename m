Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5003815E9;
	Wed, 14 Jan 2026 09:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768381459; cv=none; b=TQuyBycj8sMx/UZ/g1f52WYF1GDSI4pEA3OjV16BkE3DdEGVANHUj8Z4flEPJHeX0xV5yagFaprRquGT2Qr9QQReshIeYH1c/IM/LLQkQHG7ORsgbodETFfSAODysJFuKEUeef35IrZSFARMapze70HtxZpM72Lbu2O7y0ol87U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768381459; c=relaxed/simple;
	bh=ScbpAFXBWZwSnAn9oKWKjDguGvir2POfKnBQx++/63w=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=QJvNh/loL4WYWLrzIdzY0wtIew2FoIushZhL9iqqjr7XyCnYSJ5FKaFSAVojn8h77hCos2Mdz24LVGP74tgv0cJyVuDpu0TF3kovCt9s4CZsahvmgwIqGYugTwG8oEmwiKf4ts/DXBl1kdfzCmgJq9B0LnS0EXT8bMXsFsGxIC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OBxDy8KP; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OBxDy8KP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768381458; x=1799917458;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ScbpAFXBWZwSnAn9oKWKjDguGvir2POfKnBQx++/63w=;
  b=OBxDy8KPsvN4vPI52Kuh2tdhNqX84MOvGG7cFF7tTNPxPC87OFa7YPaQ
   2t7fBtWUPgEBAI40FyTEsK9JYvC1ePq1NoKsWRLdK/FcOGnLoD384y9Lq
   d1CggRvXAwq2xVNAfcCaZerX+d7nDOdJfsKdYU2BGuvuVjj4my8MXCwdv
   Jd/uAzGUelV2u4qxbdvceQW06EKvJDt9fsVafyvNeEtd+0rh/PlQZgtYT
   fokZiGOpwVbElNSk051hSago7FjFi9CVZK3FY/a1ZXK2Ug7XTowPec1Tu
   uZDf2VgxWGrglYqB9wg8+f5+8r5hd24ZV8fhKbCVA64yAtLTWLQ8Vbsol
   A==;
X-CSE-ConnectionGUID: TP8mgsjhTfeaAib64c1J7g==
X-CSE-MsgGUID: 5aY2Hq6CRhCkc8g5X17qCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92346266"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="92346266"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 01:04:17 -0800
X-CSE-ConnectionGUID: 3q40SAkURaax1mO9I6cjgA==
X-CSE-MsgGUID: UgBmIlRESeCgnVYS6yKkfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="203841273"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.107])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 01:04:14 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 14 Jan 2026 11:04:10 +0200 (EET)
To: Denis Benato <denis.benato@linux.dev>
cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    Hans de Goede <hansg@kernel.org>, "Luke D . Jones" <luke@ljones.dev>, 
    Mateusz Schyboll <dragonn@op.pl>, Denis Benato <benato.denis96@gmail.com>
Subject: Re: [PATCH v4 0/3] platform/x86: asus-wmi: move keyboard control
 firmware attributes
In-Reply-To: <2e1f5ce5-3647-4dff-b67e-327b0c1cb12e@linux.dev>
Message-ID: <cb403a32-f3a1-f92e-7974-08307641396d@linux.intel.com>
References: <20260102234344.366227-1-denis.benato@linux.dev> <88609e7c-3348-440e-adc0-eed9dc4d452c@linux.dev> <992b2843-4afa-ede1-d276-8ccaa61b1fee@linux.intel.com> <2e1f5ce5-3647-4dff-b67e-327b0c1cb12e@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1210196904-1768381450=:973"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1210196904-1768381450=:973
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 13 Jan 2026, Denis Benato wrote:

>=20
> On 1/13/26 15:02, Ilpo J=C3=A4rvinen wrote:
> > On Mon, 12 Jan 2026, Denis Benato wrote:
> >> On 1/3/26 00:43, Denis Benato wrote:
> >>> I was recently reading through the asusctl issue tracker and I found
> >>> out that some users have been having troubles with the keyboard RGB c=
ontrol
> >>> that was working before since the creation of asus-armoury and subequ=
ent
> >>> deprecation of old sysfs attributes.
> >>>
> >>> This patch series aims to re-introduce those attributes in asus-armou=
ry
> >>> so that userspace tools can still control keyboard RGB lighting
> >>> without having to rely on deprecated asus-wmi attributes.
> >>>
> >>> In addition to that, since disabling OOBE is essential for controllin=
g
> >>> LEDs on some models and it was incorrectly tied to deprecated attribu=
tes,
> >>> this patch series also fixes sending OOBE at probe time.
> >>>
> >>> Link: https://gitlab.com/asus-linux/asusctl/-/issues/619
> >>>
> >>> Regards,
> >>> Denis
> >> Hi Ilpo,
> >>
> >> I see no comments on this revision, did I sent it at wrong time?
> >> Should I resend some other time?
> >>
> >> Sorry for the question but I don't know if something went wrong,
> >> and if so what exactly.
> > Hi,
> >
> > Nothing is wrong, I've just had to spend time on finally processing=20
> > some larger next series which were even older than yours. And we're onl=
y 1=20
> > week past a holiday period which tend to add to delay.
> Oh okay, thank you for letting me know! I feared I repeated the error
> I made on the netdev list :)
> > Patchwork keeps track of pdx86 patches:
> >
> > https://patchwork.kernel.org/project/platform-driver-x86/list/
> >
> > If your patch is listed there, there's no need to ping as I'll get it i=
t=20
> > eventually (and it won't get forgotten).
> Understood! Sorry for the inconvenient :D
> > There's no "wrong time" to send a patch to pdx86, only that when the=20
> > merge window is open, I might do processing of any patches during that=
=20

In case it wasn't obvious, I meant: I might not do processing of any=20
patches during the merge window.

> > time. But unlike some other subsystems, we don't disallow sending patch=
es=20
> > during merge window or any other time.
> >
> That's very good to know. Thank you very much, always very informative!
>=20

--=20
 i.

--8323328-1210196904-1768381450=:973--

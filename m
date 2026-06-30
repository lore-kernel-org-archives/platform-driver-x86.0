Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE1943C078;
	Tue, 30 Jun 2026 14:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782831543; cv=none; b=Kd2nm3rv5AThkuMUHsoqwtkqs6g4IhO8/yGQVQi22uk/NwUj2123060rTgINZK1r9kXfF5zyNUbFLkwRapQl8k51uZFrtWmLj3SZupecrJIx/nTTivGu5Zd0iQd+wzMzvyTwAQR1qWzcwmw0bcgV0cqqE3buCfhxrUOr+S2Ag+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782831543; c=relaxed/simple;
	bh=3l/hhBb6LhPWn4Lh+5fI44R5Z6REzRuxh/G5MzQ7Ooo=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=lxm4pgx8Jjz2tOFg/NiZs9oOZ8m6yhDFDg/0VFI6n6rBmaLIGetX8Iyu2vysA166eCh9h0d9dz5H4t9Q+IJMPDtIJRwVyfkXztaWYI253qBYEBvO/SeeW9GJqj4rvvJk+BXcPCkhKSop2XNR0SkPyxz77A8W3imNVkNO4FULKdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n9SZGxUU; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n9SZGxUU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782831542; x=1814367542;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=3l/hhBb6LhPWn4Lh+5fI44R5Z6REzRuxh/G5MzQ7Ooo=;
  b=n9SZGxUUvSoFvWILiPMssZ8nTgQPB44e7ZLdDuRSATWCsW0MjY46rlWN
   bGg8qBm3vdnxKMJchZwK6YnWtPEwZiooZ/tGJyvVlOWr9wyWI+bF63UZv
   YY1JR7sxRDFKmyJnNKX9/m7IPq9y9HHiNU2DzfZOqVD6fWdTg7ev3LpvV
   iW3IvfIuf9PD65/isgtn/Nu/6HbYf8LdmHm5KsnxAcYONi28ZPyBBwLEp
   68sOo8Kvk/IwlNIDCQWu1xJ3t+ZMMOy+u/Z2tf2Aegs1kDgYtl49KhpC0
   SJsQI5RiSPenw4hFh02b2SwRbhxo3JDy5RZRNc5RX2j9A41k8xag49q35
   w==;
X-CSE-ConnectionGUID: 6dDITls5TiSNEUET49fK9A==
X-CSE-MsgGUID: iUNKvgI6R0qY6Gy2+LRtDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83683181"
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; 
   d="scan'208";a="83683181"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 07:59:01 -0700
X-CSE-ConnectionGUID: 7MJfsAzlTECMnfhamocb3g==
X-CSE-MsgGUID: oje/+03bRcWRotEWY2G1uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; 
   d="scan'208";a="290410512"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.230])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 07:58:58 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 30 Jun 2026 17:58:54 +0300 (EEST)
To: =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
cc: Linus Torvalds <torvalds@linux-foundation.org>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v3 09/16] platform/x86: x86-android-tablets: Add include
 defining struct dmi_system_id
In-Reply-To: <akJzYlHHcvPCl0HW@monoceros>
Message-ID: <32255bd6-4015-e945-2ee2-4bc3ca0c3a9c@linux.intel.com>
References: <cover.1782682124.git.ukleinek@kernel.org> <ad0c801eb9c5814bd2430f1e8c370fee82742897.1782682124.git.ukleinek@kernel.org> <3bcb32f8-00d2-905c-3dc1-e8730611fb6a@linux.intel.com> <akJzYlHHcvPCl0HW@monoceros>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1061725234-1782831534=:1167"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1061725234-1782831534=:1167
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 29 Jun 2026, Uwe Kleine-K=F6nig (The Capable Hub) wrote:
> On Mon, Jun 29, 2026 at 02:38:35PM +0300, Ilpo J=E4rvinen wrote:
> > On Sun, 28 Jun 2026, Uwe Kleine-K=F6nig (The Capable Hub) wrote:
> >=20
> > > Currently <linux/i2c.h> includes <linux/mod_devicetable.h> transitive=
ly
> > > which ensures that struct dmi_system_id is defined in
> > > drivers/platform/x86/x86-android-tablets/x86-android-tablets.h. Howev=
er
> > > this include in <linux/i2c.h> will be replaced by one for i2c_device_=
id
> > > only. To ensure that dmi_system_id is available add the include for t=
hat
> > > explicitly.
> > >=20
> > > Acked-by: Danilo Krummrich <dakr@kernel.org>
> > > Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@=
baylibre.com>
> > > ---
> > >  drivers/platform/x86/x86-android-tablets/x86-android-tablets.h | 1 +
> > >  1 file changed, 1 insertion(+)
> > >=20
> > > diff --git a/drivers/platform/x86/x86-android-tablets/x86-android-tab=
lets.h b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
> > > index 2498390958ad..c756961ae5fd 100644
> > > --- a/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
> > > +++ b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
> > > @@ -13,6 +13,7 @@
> > >  #include <linux/gpio/consumer.h>
> > >  #include <linux/i2c.h>
> > >  #include <linux/irqdomain_defs.h>
> > > +#include <linux/device-id/dmi.h>
> > >  #include <linux/spi/spi.h>
> > > =20
> > >  struct gpio_desc;
> >=20
> > Indirect include patchs are never a good idea as it always makes header=
=20
> > reorganizations minefield. So for this change,
> >=20
> > Acked-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
> >=20
> >=20
> > When it comes to the series, I certainly like the direction it goes ver=
y=20
> > much (never have been fan of mod_devicetable.h) but I'd have preferred=
=20
> > stepwise approach over trying to introduce it to some mid-rc.
>=20
> The hurdle here is that at least the header part isn't easily
> automateable.

Patch 1?

> (Well it is, but the script that I have now to check all
> .c files already takes longer than an hour to run. I guess it's not as
> optimal as it could, but still.) And so getting this ready for inclusion
> in next and keeping it up to date until the merge window opens is a
> tough job.
>=20
> The further downside is that each modification to one of the highly used
> headers is expensive (in rebuild time) when these are merged one after
> another (or when bisecting). So getting these changes in in one batch is
> beneficial.
>=20
> So while I agree with your preference, I don't think it's feasible.

While I understand keeping it up-to-date must be a pain, I'm not entirely=
=20
convinced by the rebuild time argument as it has been the status quo so=20
far too for anything touching mod_devicetable.h.

If one commit would move all linux/device-id/* AND ADD them all into=20
mod_devicetable.h as includes, that's just one rebuild more (and one=20
rebuild will occur anyway whichever way you architect this).

Only if includes would be then removed one-by-one from mod_devicetable.h=20
(e.g. per subsystem basis), I can see it causing n rebuilds (+conflicts),=
=20
but they could be removed in bulk as well.

What you can achieve is preventing those "normal" mod_devicetable.h=20
changes enforcing rebuilds right after this has been applied, but that is=
=20
just the rebuilds as status quo would have without this series and no=20
more.


--=20
 i.

--8323328-1061725234-1782831534=:1167--

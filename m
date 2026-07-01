Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5E33F8EA6;
	Wed,  1 Jul 2026 10:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782900964; cv=none; b=cY318wrwMezivILdf0wYaFokjiDrorh1qODDuNb+LSA3uzpov0ozlyyU1pEGXquxpEcY32WKJniA4lxRNWt9Z1UfD4M0ApdAmHeikQrhaakS7DpRNigZ0DIHI7H+goOhwNsQhfZGVGfp58LUbfkdkN2ZcT8XdX1+Qr0Iq0e4KSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782900964; c=relaxed/simple;
	bh=dNTN+reSvwxlogOBOn7W70nPQ8/30hZtNyz2Yf6Kyl0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=bHOiXmNN7HRoiZpHTj33ghpra8C4pwW68cdgdZkNevkNt53nqJKRAEDfUSEr1nbk/yY6ku/ReYdpfEWm4XQDabDDCAEYJhaMMkNvTCwrxjK48lfuh8+LKJiy1RF5JpUhTuiCYHVmQywml7966AQOUfsvehrzADcyDfOTb+siUMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g2EUon7z; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g2EUon7z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782900961; x=1814436961;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=dNTN+reSvwxlogOBOn7W70nPQ8/30hZtNyz2Yf6Kyl0=;
  b=g2EUon7zbqVjhkRZmA16aogRDPNZJHAOKzRItQGl6wDd1eTJbggV/W14
   phKTo1niIW+sX+ukhLzAiSQYmgER5nogwYtB5sDsAt6JOYSoNQWMSqX3I
   TeT78elZCdrZB37QGbtf5BorKa6JY9Eq8HYEq6D+1pJUAI9bRCV3ppm5Q
   ohWbeU9LdXhwrJEPWALT7yO3uc8X8ux0xaIoUgoWOTsflFmw+PG22rTxv
   Vqbi4vC8n9pmTBm60mjw7ioIUPga5msedhQyMaQcwh67OLFYLgv0K7WW5
   D2mbtx01nV+zsuS3KzoukYPrtSg5VNNTj+McPePByg396warVtJg74bgy
   A==;
X-CSE-ConnectionGUID: qE+xuU90TnuBjcPoMsl5WA==
X-CSE-MsgGUID: 2nSwni9IQWW6f8LLWBC0ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="94281244"
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; 
   d="scan'208";a="94281244"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 03:16:00 -0700
X-CSE-ConnectionGUID: fyQzc0clR3qTjp7mzlswAQ==
X-CSE-MsgGUID: SLlN2GTLQWakZ+mMt9jw9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; 
   d="scan'208";a="254443426"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.83])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 03:15:57 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 1 Jul 2026 13:15:52 +0300 (EEST)
To: =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
cc: Linus Torvalds <torvalds@linux-foundation.org>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v3 09/16] platform/x86: x86-android-tablets: Add include
 defining struct dmi_system_id
In-Reply-To: <akSw3IDE-V7WDpah@monoceros>
Message-ID: <54f3a614-625b-5c1b-bb52-722ac5b999ef@linux.intel.com>
References: <cover.1782682124.git.ukleinek@kernel.org> <ad0c801eb9c5814bd2430f1e8c370fee82742897.1782682124.git.ukleinek@kernel.org> <3bcb32f8-00d2-905c-3dc1-e8730611fb6a@linux.intel.com> <akJzYlHHcvPCl0HW@monoceros> <32255bd6-4015-e945-2ee2-4bc3ca0c3a9c@linux.intel.com>
 <akP5FKsnsdzx8pMk@monoceros> <2548547c-bbdd-3aed-7550-fecdba4180ac@linux.intel.com> <akSw3IDE-V7WDpah@monoceros>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-406803983-1782900952=:7215"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-406803983-1782900952=:7215
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 1 Jul 2026, Uwe Kleine-K=F6nig (The Capable Hub) wrote:
> On Tue, Jun 30, 2026 at 09:07:08PM +0300, Ilpo J=E4rvinen wrote:
> > On Tue, 30 Jun 2026, Uwe Kleine-K=F6nig (The Capable Hub) wrote:
> > > On Tue, Jun 30, 2026 at 05:58:54PM +0300, Ilpo J=E4rvinen wrote:
> > > > On Mon, 29 Jun 2026, Uwe Kleine-K=F6nig (The Capable Hub) wrote:
> > > > > On Mon, Jun 29, 2026 at 02:38:35PM +0300, Ilpo J=E4rvinen wrote:
> > > > > > On Sun, 28 Jun 2026, Uwe Kleine-K=F6nig (The Capable Hub) wrote=
:
> > > > > >=20
> > > > > > > Currently <linux/i2c.h> includes <linux/mod_devicetable.h> tr=
ansitively
> > > > > > > which ensures that struct dmi_system_id is defined in
> > > > > > > drivers/platform/x86/x86-android-tablets/x86-android-tablets.=
h. However
> > > > > > > this include in <linux/i2c.h> will be replaced by one for i2c=
_device_id
> > > > > > > only. To ensure that dmi_system_id is available add the inclu=
de for that
> > > > > > > explicitly.
> > > > > > >=20
> > > > > > > Acked-by: Danilo Krummrich <dakr@kernel.org>
> > > > > > > Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine=
-koenig@baylibre.com>
> > > > > > > ---
> > > > > > >  drivers/platform/x86/x86-android-tablets/x86-android-tablets=
=2Eh | 1 +
> > > > > > >  1 file changed, 1 insertion(+)
> > > > > > >=20
> > > > > > > diff --git a/drivers/platform/x86/x86-android-tablets/x86-and=
roid-tablets.h b/drivers/platform/x86/x86-android-tablets/x86-android-table=
ts.h
> > > > > > > index 2498390958ad..c756961ae5fd 100644
> > > > > > > --- a/drivers/platform/x86/x86-android-tablets/x86-android-ta=
blets.h
> > > > > > > +++ b/drivers/platform/x86/x86-android-tablets/x86-android-ta=
blets.h
> > > > > > > @@ -13,6 +13,7 @@
> > > > > > >  #include <linux/gpio/consumer.h>
> > > > > > >  #include <linux/i2c.h>
> > > > > > >  #include <linux/irqdomain_defs.h>
> > > > > > > +#include <linux/device-id/dmi.h>
> > > > > > >  #include <linux/spi/spi.h>
> > > > > > > =20
> > > > > > >  struct gpio_desc;
> > > > > >=20
> > > > > > Indirect include patchs are never a good idea as it always make=
s header=20
> > > > > > reorganizations minefield. So for this change,
> > > > > >=20
> > > > > > Acked-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
> > > > > >=20
> > > > > >=20
> > > > > > When it comes to the series, I certainly like the direction it =
goes very=20
> > > > > > much (never have been fan of mod_devicetable.h) but I'd have pr=
eferred=20
> > > > > > stepwise approach over trying to introduce it to some mid-rc.
> > > > >=20
> > > > > The hurdle here is that at least the header part isn't easily
> > > > > automateable.
> > > >=20
> > > > Patch 1?
> > >=20
> > > No, patch 15.
> > >
> > > > > (Well it is, but the script that I have now to check all
> > > > > .c files already takes longer than an hour to run. I guess it's n=
ot as
> > > > > optimal as it could, but still.) And so getting this ready for in=
clusion
> > > > > in next and keeping it up to date until the merge window opens is=
 a
> > > > > tough job.
> >=20
> > It looks to me more a problem with the chosen approach where you wanted=
=20
> > to get it all quickly done in a single all-reaching series (which IMO=
=20
> > would have been fine right after -rc1 but mid-rc cycle, I'm not so=20
> > positive about it).
>=20
> In my book we're still in the "right after -rc1" window. The patch set
> was mostly ready at -rc1 (it just grew a patch to fix a build failure on
> parisc and I added review tags) and assuming Linus doesn't oppose to my
> timing it should go in before -rc2.
>
> And yes, I admit to want it done, but that's not part of my
> justification to get it in after -rc1.
>=20
> > > > > The further downside is that each modification to one of the high=
ly used
> > > > > headers is expensive (in rebuild time) when these are merged one =
after
> > > > > another (or when bisecting). So getting these changes in in one b=
atch is
> > > > > beneficial.
> > > > >=20
> > > > > So while I agree with your preference, I don't think it's feasibl=
e.
> > > >=20
> > > > While I understand keeping it up-to-date must be a pain, I'm not en=
tirely=20
> > > > convinced by the rebuild time argument as it has been the status qu=
o so=20
> > > > far too for anything touching mod_devicetable.h.
> > >=20
> > > Yes. I don't know about others, but big rebuilds annoy me regularily.
> > > And with another quest that involves touching most struct *_device_id
> > > this really gets a pain. And just because "we" endured something in t=
he
> > > past, doesn't mean we shouldn't improve.
> > >=20
> > > > If one commit would move all linux/device-id/* AND ADD them all int=
o=20
> > > > mod_devicetable.h as includes, that's just one rebuild more (and on=
e=20
> > > > rebuild will occur anyway whichever way you architect this).
> > >=20
> > > Yes, one rebuild isn't possible to prevent. You're talking about patc=
h
> > > #1, right?
> > >=20
> > > > Only if includes would be then removed one-by-one from mod_deviceta=
ble.h=20
> > > > (e.g. per subsystem basis), I can see it causing n rebuilds (+confl=
icts),=20
> > > > but they could be removed in bulk as well.
> > >=20
> > > Removing those from mod_devicetable.h isn't part of the plan.
> >=20
> > It isn't because you're not doing this in steps so you didn't put them =
in=20
> > there at all (which would have been fine at any time and only enforces=
=20
> > one rebuild comparable to any other linux/mod_devicetable.h edit).
>=20
> <linux/mod_devicetable.h> only consists of #includes of the new files
> (well, plus struct cpu_feature). That's patch #1 and it enforces a
> rebuild. So either "you didn't put them in there at all" is wrong or I
> misunderstand you.

Yes, I was wrong, sorry about that.

I looked at patch 1's diffstat and thought it cannot be adding those=20
headers with only two +, totally disregarding the scale. And they were=20
so much down in the in diff I didn't see them there either because I=20
didn't look that far.

Most of my worry was related to that misunderstanding because it would=20
meant trouble for subsystem maintainer if adding linux/mod_devicetable.h=20
would have been problems during merges.

I suppose it doesn't matter much then to me if it's done mid-cycle.

--=20
 i.

> > > But
> > > replacing `#include <linux/mod_devicetable.h>` by `#include
> > > <linux/device-id/of.h>` in <linux/of.h> triggers again many rebuilds
> > > when done separately.
> >=20
> > But this is not because you touch linux/mod_devicetable.h but linux/of.=
h.
> > It certainly should cause rebuild of all the code depending on linux/of=
=2Eh=20
> > but I assume that is much less than what linux/mod_devicetable.h causes=
=2E
>=20
> It's a subset, yes. In an ARCH=3Darm64 allmodconfig build of -rc1 + this
> patch series I have:
>=20
> =09# number of object files:
> =09$ find -name \*.o.cmd -not -name \*mod.o.cmd | wc -l
> =0928590
>=20
> =09# these are the old users of <linux/mod_devicetable.h>:
> =09$ find -name \*.o.cmd -not -name \*mod.o.cmd | xargs grep -l /device-i=
d/ | wc -l
> =0923583
>=20
> =09$ find -name \*.o.cmd -not -name \*mod.o.cmd | xargs grep -l linux/of.=
h | wc -l
> =0912302
>=20
> =09$ find -name \*.o.cmd -not -name \*mod.o.cmd | xargs grep -l linux/pla=
tform_device.h | wc -l
> =099255
>=20
> =09$ find -name \*.o.cmd -not -name \*mod.o.cmd | xargs grep -l linux/pci=
=2Eh | wc -l
> =097747
>=20
> =09$ find -name \*.o.cmd -not -name \*mod.o.cmd | xargs grep -l linux/acp=
i.h | wc -l
> =097233
>=20
> =09$ find -name \*.o.cmd -not -name \*mod.o.cmd | xargs grep -l linux/i2c=
=2Eh | wc -l
> =095373
>=20
> so it's a considerable subset. For x86_64 the numbers are similar:
>=20
> =0929655
> =09/device-id/: 24800
> =09linux/of.h: 12602
> =09linux/platform_device.h: 9344
> =09linux/pci.h: 8605
> =09linux/acpi.h: 7875
> =09linux/i2c.h: 5758
>=20
> .
>=20
> > > And then for <linux/pci.h> and again for <linux/platform_driver.h> an=
d
> > > .... That's why those are included here, too, to at least use the "on=
e
> > > rebuild needed" window for the high-impact follow up changes, and
> > > trigger a rebuild only once (unless you happen to hit an inbetween
> > > commit while bisecting).
> >=20
> > I disagree, it's a different set of files for each. But there could, of=
=20
> > course, be some overlap. Maybe the overlaps is so significant it's=20
> > nearly as same as linux/mod_devicetable.h, I don't know but is that wha=
t=20
> > you're trying to imply?
>=20
> Yes, these are all headers with many users. So modifying them in bulk
> triggers less rebuilds than doing the modifications in separate series
> that go in via separate trees.
>=20
> > > > What you can achieve is preventing those "normal" mod_devicetable.h=
=20
> > > > changes enforcing rebuilds right after this has been applied, but t=
hat is=20
> > > > just the rebuilds as status quo would have without this series and =
no=20
> > > > more.
> > >=20
> > > This is exactly the goal. I don't get the "just" part of your argumen=
t.
> > > The point is that a modification to struct i2c_device_id should only
> > > trigger a rebuild of i2c drivers, but not of pci, platform, spi and a=
ll
> > > the others, too.
> >=20
> > With "just" I meant it's no worse than status quo. If that prolongs one=
 or=20
> > two kernel versions more to avoid mid-rc cycle merge it doesn't really=
=20
> > seem so high cost.
> >=20
> > And I understand where you want to end up, and you could end up there=
=20
> > using steps as well:
> >=20
> > 1. add linux/device-id/* + include them from mod_devicetable.h
>=20
> Done, that's patch #1.
>
> > 2. convert stuff to use linux/device-id/* without removing includes fro=
m=20
> > mod_devicetable.h
>=20
> patch #15 and #16 are in that category, it's not complete yet, but I
> catched the high-impact usages. Again on -rc1 + this patch set there are
> 1921 .o files left that make use of linux/mod_devicetable.h. Roughly
> half of them via <linux/mdio.h>:
>=20
>     ...
>      49   drivers/net/wireless/intel/iwlwifi/iwl-config.h
>     179   include/linux/mmc/card.h
>     188   include/sound/soc-acpi.h
>     231   include/linux/hid.h
>     925   include/linux/mdio.h
>=20
> In retrospect it would have been great to tackle <linux/mdio.h> as part
> of this series, too, but I won't modify it for that any more now. I'll
> address that for the next merge window.
>=20
> > 3. bulk remove linux/device-id/* includes from mod_devicetable.h
>=20
> This isn't done yet, in the end I want to remove that header, but that
> is somehow "bulk remove linux/device-id/*". And that indeed is planned
> to be done later. Each patch of type 2 reduces the impact of that
> change, so postponing doesn't hurt a lot.
>=20
> > 2 & 3 are chunkable/iteratable so they don't need to occur for all at o=
nce=20
> > as long as 3 is not split per one linux/device-id/* its rebuild cost is=
n't=20
> > that huge compared with the status quo.
>=20
> Each patch of type 2 is potentially expensive. Less than modifying
> <linux/mod_devicetable.h> directly, and depending on which stuff it
> touched the impact is high or not. For a .c file it's low, for the above
> mentioned headers it's high.
>=20
> So the justification to get the whole series in in one go is for the
> high impact headers that they should be near (in git history) to patch
> #1 to reduce rebuilds and for .c files that the automation that created
> the changes is reliable and only breaks in corner cases (like a driver
> using `of ## _device_id` which my script won't identify as a usage of
> `of_device_id`). And if you say the justification for the .c files (i.e.
> patch #16) is weak, I agree and we can postpone that. But please let's
> keep #1 and #15 (and thus also #2 - #14) together.
>=20
> Maybe the relevant difference between us, that makes us judge the
> circumstances differently, is that I often do build tests on my laptop
> and at Intel you might have a beefy server to do that?!
>=20
> Best regards
> Uwe
>=20
--8323328-406803983-1782900952=:7215--

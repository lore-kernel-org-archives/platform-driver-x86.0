Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C598524B1C;
	Tue, 22 Sep 2026 09:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790068506; cv=none; b=pNtaIBcqBPAJKSHsBpFh8mGshCBqLOTB3K02LKmYV6h3mXepKj2xUR94XLQNvgcfOoQu+E7RLlEuKCY6FET7OFcBQoKwObdKEr7pIZhsgXmfu/5M3lFcMMOzA0Fe16OAXSC0yXWwlpLF9/8UMsHf5oEWisbTGRDmb4GM0Limaps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790068506; c=relaxed/simple;
	bh=ab8nojDd73ZNjmJo1aiLMxxM7qmfGdiSHYSuowmH5E4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=jmbP0wLQeVyh4x+wKl1O9IBgRKwsupykex3+ZbDwni/MCxlof+buZ97Z9pB2ugd1gNh/E4sfEpZISt//mWhxrMW8MznkAM8agPAeIIqJiOs6zq0nKKQ3+cyBq4sNMAT2Hg5vAd91LkT/VDQWZa6LYwOlvN6NYQSb/US9yNh/icw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n3RVMBcu; arc=none smtp.client-ip=192.198.163.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n3RVMBcu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790068504; x=1821604504;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ab8nojDd73ZNjmJo1aiLMxxM7qmfGdiSHYSuowmH5E4=;
  b=n3RVMBcuhNnmlSKpe5G9vknDjX5QVWROpwDcNWXj0Y8uSt4ZYsHf04JT
   7YqCOmpeDueWv/LbmUPVTVoZM2qSEIPSLLABvSOPp711sMJ/JeE0QW53x
   LaPapvT8fYyYJjMvP5RCIzRiDBfTcE8pb//RWxWBu3SvhQ2xSEZa6gXob
   t+ju85v8QQF3kkgy17s0AEb7KRhDHAyPhbqFmZzSuvaFTlS0dV/rhysvG
   +3pR+vP+Fl6hahg6CkomwKSoyrrYKLR2Gt3+vrxiAZfmIzf4+Qec1XgiJ
   rovFviSQGAvGhlCe7dWxtOAL/QsV6cwMRex6xk69B8RcXFTU8U+9F8Mvg
   A==;
X-CSE-ConnectionGUID: jrjajtdXQr6SI6nSMr/CMA==
X-CSE-MsgGUID: gwpK4bJYTtGgpKTbTDaeFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="1155600"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="1155600"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 02:15:03 -0700
X-CSE-ConnectionGUID: 92HoGGBQRbWJZJ8hBVsOwQ==
X-CSE-MsgGUID: UkAs628ASamF7FqlFRDwiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="273218286"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.80])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 02:15:01 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 22 Sep 2026 12:14:58 +0300 (EEST)
To: Armin Wolf <W_Armin@gmx.de>
cc: Denis Benato <denis.benato@linux.dev>, LKML <linux-kernel@vger.kernel.org>, 
    platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
    Liang Haowen <nbg2974@gmail.com>, 
    "Derek J. Clark" <derekjohn.clark@gmail.com>
Subject: Re: Placement of ASUS Aura and platform/x86 ASUS files relocation
In-Reply-To: <8e8168cd-4f6b-41e0-81c5-5d7b07b1df13@gmx.de>
Message-ID: <7b4c6859-aed8-6117-5d80-1ad1f1470260@linux.intel.com>
References: <0ca263c3-7885-4a5c-bfe5-0e8e4d189666@linux.dev> <e0882d84-f5ea-44a8-881f-4095129e4d2d@gmx.de> <c26da468-9a5a-46c1-8dbd-1784b69b3c73@linux.dev> <8e8168cd-4f6b-41e0-81c5-5d7b07b1df13@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1444408434-1790068498=:1233"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1444408434-1790068498=:1233
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

Hi all,

It seems this thread has went under the radar for me so thanks for the=20
pointer in the other thread (this was within the large pile of yet to be=20
processed email from the Summer time, I likely won't have time for them=20
until the next merge window, if ever...). I'm sorry about that.

On Wed, 26 Aug 2026, Armin Wolf wrote:
> Am 05.08.26 um 14:20 schrieb Denis Benato:
> > On 8/4/26 20:22, Armin Wolf wrote:
> > > Am 04.08.26 um 19:46 schrieb Denis Benato:
> > >=20
> > > > Hi all,
> > > >=20
> > > > I write this mail to ask a few questions related to the various ASU=
S
> > > > devices in the kernel both present and futures and how to organize =
that
> > > > work.
> > > >=20
> > > > To understand this mail one needs to know that AURA is the name of =
the
> > > > lighting ASUS gave to its
> > > > products: each device is divided in one or more zones and each zone
> > > > supports setting an effect like
> > > > static (1 color), strobe (2 colors and speed), rainbow (0 colors), =
rain
> > > > (0 colors and speed), laser (1 color and direction) and these, to b=
e
> > > > represented in such a way features are not being lost requires a ne=
d
> > > > interface
> > > > that Derek said he wanted to develop as many other hardware would
> > > > benefit from it: I will therefore need
> > > > to specialize it for ASUS things: where is it better to put any .c/=
=2Eh
> > > > file related to this interface? Is platform-x86 OK?
> > > >=20
> > > > The Aura interface has components (all or only certain aspects) wor=
king
> > > > via: scsi, (hid) usb + i2c and wmi.
> > > >=20
> > > > 1. Liang Haowen has an ASUS nvme enclosure that supports the AURA
> > > > protocol as scsi commands:
> > > > we want those to be in the kernel, but we don't know where to put t=
he
> > > > aura userspace interface (see above).
> > > Hi,
> > >=20
> > > it depends on the userspace interface. If you use the LED sysfs API (=
with
> > > some extensions for the effects), then i suggest
> > > that you place the driver in drivers/leds, because the NVME enclosure=
 is
> > > not a platform device.
> > >=20
> > Yeah we will have to bind the LED interface once to the nvme enclosure,=
 up
> > to 8 different interface to the keyboard (one per zone so we can set th=
e
> > physical keyboard in rain and the rear logo in static for example)
> > and also TUFs manage power states via asus-wmi so one interface spawned=
 by
> > i2c will need to be bound
> > to asus-wmi too.
> >=20
> > The userspace interface will need to be used by different drivers, in
> > different instances and even more than
> > one driver on the same instance.
> > > I assume you refer to the ROG Arion? If the SCSI commands are used to
> > > issue i2c/smbus requests, then you should also
> > > place the i2c controller driver under /drivers/i2c/busses.
> > >=20
> > It is indeed a ROG Arion.
> > > > 2. ASUS has product called "RTX Spark" coming that are arm and will
> > > > support acpi: I have no idea if the asus-wmi
> > > > interface would be reused, but if they decide to do so (and the ker=
nel
> > > > can be made to boot lol) would platform/x86 still be the best place=
 for
> > > > ASUS drivers?
> > > In such a case, moving the affected drivers to drivers/platform/asus/
> > > would be a good idea. There is currently a patch series pending
> > > for enabling ACPI-WMI on arm, so _theoretically_ the asus-wmi driver
> > > should work.
> > >=20
> > Splendid news!
> > > > 3. During the upstreaming of asus-armoury Hans de Goede asked if it=
's
> > > > preferred to have an asus directory containing asus drivers, but th=
e
> > > > discussion died there. Now that I see there is a patchest that will=
 also
> > > > move asus files
> > > > would it be a good time to spawn this discussion?
> > > IMHO having a separate asus directory for all asus-related platform
> > > drivers would indeed be very nice. You could reuse the
> > > drivers/platform/asus directory
> > > for that, and leave the older asus-related drivers inside
> > > drivers/platform/x86 for the time being.
> > >=20
> > > Alternatively, you could move all the affected drivers to
> > > drivers/platform/x86/asus, and after that move this directory to
> > > drivers/platform.
> > >=20
> > This looks cleaner to me if ASUS will produce ARM products that actuall=
y use
> > that interface,
> > but will wait to hear what others think.

Given the information in the recent thread, this is indeed going to happen=
=20
in the near future. Hans' suggestion was to put generic (x86 + arm) WMI=20
drivers under drivers/platform/wmi/ (or drivers/platform/wmi/asus/, I=20
suppose).

I'm not strictly against drivers/platform/asus/ either, if you prefer that=
=20
and expect it to have something that would not fall well under=20
drivers/platform/wmi/.

Anything under drivers/platform/x86/ would not work well for non-x86=20
drivers because of Kconfig menu structuring.

Same goes for drivers/platform/wmi/asus/ for non-wmi drivers, Kconfig=20
menu structuring would not work for non-WMI drivers placed under there.

So it largely boils down to having a Kconfig structure that makes sense=20
(no non-X drivers under drivers/platform/X/).

In any case, if it comes having to move it again, moving entire directory=
=20
is relatively easy so this placement is not a life and dead decision (I=20
can probably handle the transition with some sed tricks on the patches=20
if there's parallel development).

> > If I do that will platform/x86 still be the correct place to send patch=
es? I
> > don't want to "move" the driver away from platform/x86 mailing list jus=
t
> > because the directory changed.
>=20
> Sorry for the delay.
>=20
> AFAIK as long as the driver is still heavily connected to the x86 platfor=
m,
> you can continue to use this mailing list.
> That is what i am doing with the core ACPI-WMI driver.

platform-drivers-x86 has x86 in it's name but in practice the platform=20
drivers scope has expanded. Changing the ML name is rather expensive=20
operation so we stick with the old name even if it now carries this
baggage. So any platform drivers stuff can be discussed on this list=20
regardless where they're under drivers/platform/ and MAINTAINERS entries=20
made to point to platform-drivers-x86 ML=C2=A0as is e.g. with Arm64 platfor=
m=20
drivers already (chrome/, mips/, and raspberrypi/ have own MLs but others=
=20
do use platform-drivers-x86 list).

--=20
 i.

--8323328-1444408434-1790068498=:1233--

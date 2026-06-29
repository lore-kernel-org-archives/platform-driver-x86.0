Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6313BB12D;
	Mon, 29 Jun 2026 15:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782745803; cv=none; b=rCXnXd23rwpvvjUnZnXexfvascATdPRe24qcq9M87xk+Dehht5T7M7Q34WNAn4FhhUCSuv3X9qqx4vEOUxjngxslOh4nZWGdH6/TkPHyZSy0WcyMZVgMfjSnfXhla+ckgb7qZ1UddRGTMSr8NK/hGxSiDRenUuq8g6MLS1mXwDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782745803; c=relaxed/simple;
	bh=klVUrquG5HzETXVQiLH2GUi0E7kCMnUpe7oJc0jZzkg=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Phq7lGS9tRBeSpgYqCQZg54X8GeK/ivn0qInLn7ddzT3xecDdSxouucPpgierx99Sw+S4y2XyWpx0T6daHqBbpjkuXTRTSd+q/N3urOFbaPJMW2epI8dlq9XS97yAK1LcTbdckfC7e+KGfvKm/X1NcoI8FJkd7NNC29oIpteIeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bDhM2b+M; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bDhM2b+M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782745801; x=1814281801;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=klVUrquG5HzETXVQiLH2GUi0E7kCMnUpe7oJc0jZzkg=;
  b=bDhM2b+MkMj3k5bB9eCEWlF5e1hW66tIW8fTYlOoIbv/r4xyoHjMk167
   Wy8lCCDGoK8/L79P8hjJ58n5kGlNPy1/16Cfg/toKv11ac9A7I+45dj1W
   MbfhI0wlJ+CmzPYR9Ci2mIQSDAyqbTwb4KO9qviLrgRp6t1bYSGMl+jME
   3LKIGMfhbIRiwWHv4mY1PMvN6/EEBNk9GwNNEPSY2V2quQ2dlV4OxReTH
   jzmPjNmdhDyjUTt44Ijz6xSLbon9i1M0x9IQaiOXO2ZzbtrJJ7VM00iDk
   JIsOBQn7N88C5B8/Q/Jmf9BOVmRncZEcwRqxnwnnLf2Nm+5mp0ywJQGlw
   Q==;
X-CSE-ConnectionGUID: r+LR5QuwRVeuirEr3WLROQ==
X-CSE-MsgGUID: FafORNA8Qkuh+efQbYiUJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="93789497"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="93789497"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 08:10:00 -0700
X-CSE-ConnectionGUID: 66V/L2wgQQ6puCwgc0CtMw==
X-CSE-MsgGUID: utwKVrqmTnuevh8eUW10cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="290105331"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.42])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 08:09:56 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 29 Jun 2026 18:09:53 +0300 (EEST)
To: Denis Benato <denis.benato@linux.dev>
cc: Travers Biddle <traversbiddle@gmail.com>, corentin.chary@gmail.com, 
    luke@ljones.dev, Hans de Goede <hansg@kernel.org>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    regressions@lists.linux.dev
Subject: Re: [REGRESSION] platform/x86: asus-wmi: charge_control_end_threshold
 returns -ENODATA at boot, breaking UPower/GNOME detection
In-Reply-To: <79787895-204f-4329-82dc-fada89c2ffa6@linux.dev>
Message-ID: <bc6a3bb4-6e5e-1d91-b1bd-3d5508aa28b0@linux.intel.com>
References: <CABsFS_g+V_Owum6knLhenhM15EXJRrsF0FcLiw30WZxarsTpUA@mail.gmail.com> <79787895-204f-4329-82dc-fada89c2ffa6@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1706428708-1782745793=:1167"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1706428708-1782745793=:1167
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Sun, 28 Jun 2026, Denis Benato wrote:
> On 6/28/26 08:03, Travers Biddle wrote:
> > Hello,
> >
> > I am seeing a regression on an ASUS V16 laptop where the GNOME Settings
> > "Preserve Battery Health" UI disappears after booting Linux v7.1. I rep=
roduced
> > this with a kernel built from torvalds/linux tag v7.1.
> >
> > I first noticed this after CachyOS updated linux-cachyos from
> > 7.0.12-1 to 7.1.1-2. The same machine still works as expected with
> > linux-cachyos-lts 6.18.36-1, where UPower reports charge threshold
> > support and GNOME shows the Battery Charging section.
> >
> > The change that appears to expose this is:
> >
> > =C2=A0 186bf9031666 ("platform/x86: asus-wmi: do not enforce a battery =
charge threshold")
> >
> > #regzbot introduced: 186bf9031666602d61b40832181b6b6fdc3ba4dc
> >
> > Hardware:
> >
> > =C2=A0 DMI product: ASUS V16 V3607VH_V3607VH
> > =C2=A0 Board: =C2=A0 =C2=A0 =C2=A0 V3607VH
> > =C2=A0 BIOS: =C2=A0 =C2=A0 =C2=A0 =C2=A0V3607VH.303
> > =C2=A0 Battery: =C2=A0 =C2=A0 /sys/class/power_supply/BAT0
> > =C2=A0 Battery model_name: X350052
> >
> > Userspace:
> >
> > =C2=A0 Distro: CachyOS / Arch Linux
> > =C2=A0 UPower: 1.91.2
> > =C2=A0 systemd/udev: 261
> > =C2=A0 Desktop: GNOME Settings power panel
> >
> > The machine only exposes an end threshold:
> >
> > =C2=A0 /sys/class/power_supply/BAT0/charge_control_end_threshold
> >
> > There is no charge_control_start_threshold node on this system.
> >
> > On an unmodified build from torvalds/linux tag v7.1:
> >
> > =C2=A0 $ uname -r
> > =C2=A0 7.1.0-asus-test-1
> >
> > =C2=A0 $ cat /proc/sys/kernel/tainted
> > =C2=A0 0
> >
> > =C2=A0 $ cat /sys/class/power_supply/BAT0/charge_control_end_threshold
> > =C2=A0 cat: /sys/class/power_supply/BAT0/charge_control_end_threshold: =
No data available
> >
> > `udevadm test /sys/class/power_supply/BAT0` does not import CHARGE_LIMI=
T.
> > The relevant end of the properties list is:
> >
> > =C2=A0 Properties:
> > =C2=A0 =C2=A0 ACTION=3Dadd
> > =C2=A0 =C2=A0 DEVPATH=3D/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/PNP=
0C0A:03/power_supply/BAT0
> > =C2=A0 =C2=A0 DEVTYPE=3Dpower_supply
> > =C2=A0 =C2=A0 POWER_SUPPLY_CAPACITY=3D81
> > =C2=A0 =C2=A0 POWER_SUPPLY_CAPACITY_LEVEL=3DNormal
> > =C2=A0 =C2=A0 POWER_SUPPLY_CYCLE_COUNT=3D26
> > =C2=A0 =C2=A0 POWER_SUPPLY_ENERGY_FULL=3D60512000
> > =C2=A0 =C2=A0 POWER_SUPPLY_ENERGY_FULL_DESIGN=3D63041000
> > =C2=A0 =C2=A0 POWER_SUPPLY_ENERGY_NOW=3D49102000
> > =C2=A0 =C2=A0 POWER_SUPPLY_MANUFACTURER=3DOEM
> > =C2=A0 =C2=A0 POWER_SUPPLY_MODEL_NAME=3DX350052
> > =C2=A0 =C2=A0 POWER_SUPPLY_NAME=3DBAT0
> > =C2=A0 =C2=A0 POWER_SUPPLY_POWER_NOW=3D25216000
> > =C2=A0 =C2=A0 POWER_SUPPLY_PRESENT=3D1
> > =C2=A0 =C2=A0 POWER_SUPPLY_SERIAL_NUMBER=3D123456789
> > =C2=A0 =C2=A0 POWER_SUPPLY_STATUS=3DCharging
> > =C2=A0 =C2=A0 POWER_SUPPLY_TECHNOLOGY=3DUnknown
> > =C2=A0 =C2=A0 POWER_SUPPLY_TYPE=3DBattery
> > =C2=A0 =C2=A0 POWER_SUPPLY_VOLTAGE_MIN_DESIGN=3D11985000
> > =C2=A0 =C2=A0 POWER_SUPPLY_VOLTAGE_NOW=3D13118000
> > =C2=A0 =C2=A0 SUBSYSTEM=3Dpower_supply
> >
> > UPower then does not expose the threshold values or threshold support:
> >
> > =C2=A0 $ upower -i /org/freedesktop/UPower/devices/battery_BAT0
> > =C2=A0 =C2=A0 native-path: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BAT0
> > =C2=A0 =C2=A0 vendor: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
OEM
> > =C2=A0 =C2=A0 model: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0X350052
> > =C2=A0 =C2=A0 serial: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
123456789
> > =C2=A0 =C2=A0 power supply: =C2=A0 =C2=A0 =C2=A0 =C2=A0 yes
> > =C2=A0 =C2=A0 battery
> > =C2=A0 =C2=A0 =C2=A0 present: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 yes
> > =C2=A0 =C2=A0 =C2=A0 rechargeable: =C2=A0 =C2=A0 =C2=A0 =C2=A0yes
> > =C2=A0 =C2=A0 =C2=A0 state: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 charging
> > =C2=A0 =C2=A0 =C2=A0 percentage: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A081%
> > =C2=A0 =C2=A0 =C2=A0 capacity: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A095.9883%
> > =C2=A0 =C2=A0 =C2=A0 charge-threshold-enabled: =C2=A0 =C2=A0 =C2=A0yes
> > =C2=A0 =C2=A0 =C2=A0 icon-name: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'batt=
ery-full-charging-symbolic'
> >
> > In this state, GNOME Settings hides the Battery Charging section entire=
ly.
> >
> > I then tested a local demonstration change which does not reintroduce t=
he
> > hardware write that 186bf9031666 removed. It only keeps the cached sysf=
s value
> > readable by initializing charge_end_threshold to 100 instead of -1.
> >
> > With that demonstration change applied:
> >
> > =C2=A0 $ uname -r
> > =C2=A0 7.1.0-asus-test-2-00001-g76935ee241bc
> >
> > =C2=A0 $ cat /sys/class/power_supply/BAT0/charge_control_end_threshold
> > =C2=A0 80
> >
> > `udevadm test /sys/class/power_supply/BAT0` imports the UPower hwdb lim=
it:
> >
> > =C2=A0 BAT0: /usr/lib/udev/rules.d/60-upower-battery.rules:7 IMPORT{bui=
ltin}=3D"hwdb 'battery:$kernel:$attr{model_name}:$attr{[dmi/id]modalias}'":=
 Importing properties from results of builtin command "hwdb 'battery:BAT0:X=
350052:dmi:bvnAmericanMegatrendsInternational,LLC.:bvrV3607VH.303:bd04/29/2=
025:br5.27:efr3.16:svnASUSTeKCOMPUTERINC.:pnASUSV16V3607VH_V3607VH:pvr1.0:r=
vnASUSTeKCOMPUTERINC.:rnV3607VH:rvr1.0:cvnASUSTeKCOMPUTERINC.:ct10:cvr1.0:s=
ku:pfaASUSV16:'".
> >
> > =C2=A0 Properties:
> > =C2=A0 =C2=A0 ACTION=3Dadd
> > =C2=A0 =C2=A0 CHARGE_LIMIT=3D75,80
> > =C2=A0 =C2=A0 DEVPATH=3D/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/PNP=
0C0A:03/power_supply/BAT0
> > =C2=A0 =C2=A0 DEVTYPE=3Dpower_supply
> > =C2=A0 =C2=A0 POWER_SUPPLY_CAPACITY=3D97
> > =C2=A0 =C2=A0 POWER_SUPPLY_CAPACITY_LEVEL=3DNormal
> > =C2=A0 =C2=A0 POWER_SUPPLY_CYCLE_COUNT=3D26
> > =C2=A0 =C2=A0 POWER_SUPPLY_ENERGY_FULL=3D60512000
> > =C2=A0 =C2=A0 POWER_SUPPLY_ENERGY_FULL_DESIGN=3D63041000
> > =C2=A0 =C2=A0 POWER_SUPPLY_ENERGY_NOW=3D58414000
> > =C2=A0 =C2=A0 POWER_SUPPLY_MANUFACTURER=3DOEM
> > =C2=A0 =C2=A0 POWER_SUPPLY_MODEL_NAME=3DX350052
> > =C2=A0 =C2=A0 POWER_SUPPLY_NAME=3DBAT0
> > =C2=A0 =C2=A0 POWER_SUPPLY_POWER_NOW=3D0
> > =C2=A0 =C2=A0 POWER_SUPPLY_PRESENT=3D1
> > =C2=A0 =C2=A0 POWER_SUPPLY_SERIAL_NUMBER=3D123456789
> > =C2=A0 =C2=A0 POWER_SUPPLY_STATUS=3DNot charging
> > =C2=A0 =C2=A0 POWER_SUPPLY_TECHNOLOGY=3DUnknown
> > =C2=A0 =C2=A0 POWER_SUPPLY_TYPE=3DBattery
> > =C2=A0 =C2=A0 POWER_SUPPLY_VOLTAGE_MIN_DESIGN=3D11985000
> > =C2=A0 =C2=A0 POWER_SUPPLY_VOLTAGE_NOW=3D13026000
> > =C2=A0 =C2=A0 SUBSYSTEM=3Dpower_supply
> >
> > UPower then exposes threshold support again:
> >
> > =C2=A0 $ upower -i /org/freedesktop/UPower/devices/battery_BAT0
> > =C2=A0 =C2=A0 native-path: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BAT0
> > =C2=A0 =C2=A0 vendor: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
OEM
> > =C2=A0 =C2=A0 model: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0X350052
> > =C2=A0 =C2=A0 serial: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
123456789
> > =C2=A0 =C2=A0 power supply: =C2=A0 =C2=A0 =C2=A0 =C2=A0 yes
> > =C2=A0 =C2=A0 battery
> > =C2=A0 =C2=A0 =C2=A0 present: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 yes
> > =C2=A0 =C2=A0 =C2=A0 rechargeable: =C2=A0 =C2=A0 =C2=A0 =C2=A0yes
> > =C2=A0 =C2=A0 =C2=A0 state: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 fully-charged
> > =C2=A0 =C2=A0 =C2=A0 percentage: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A097%
> > =C2=A0 =C2=A0 =C2=A0 capacity: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A095.9883%
> > =C2=A0 =C2=A0 =C2=A0 charge-start-threshold: =C2=A0 =C2=A0 =C2=A0 =C2=
=A075%
> > =C2=A0 =C2=A0 =C2=A0 charge-end-threshold: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A080%
> > =C2=A0 =C2=A0 =C2=A0 charge-threshold-enabled: =C2=A0 =C2=A0 =C2=A0yes
> > =C2=A0 =C2=A0 =C2=A0 charge-threshold-supported: =C2=A0 =C2=A0yes
> > =C2=A0 =C2=A0 =C2=A0 icon-name: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'batt=
ery-full-charged-symbolic'
> >
> > GNOME Settings also shows the Battery Charging section again.
> >
> > I am not asking for a plain revert. The part of 186bf9031666 that avoid=
s
> > writing 100 to the hardware at boot seems important, since that write c=
an
> > overwrite a charge limit retained by the firmware/platform.
> >
> > I am mainly reporting this so you are aware of the userspace-visible
> > effect of returning -ENODATA here. On this end-threshold-only machine,
> > that makes the only threshold node unreadable during UPower's discovery=
,
> > so UPower and GNOME treat charge limiting as unsupported even though th=
e
> > kernel write path still works.
> >
> > It may be that UPower should handle this case differently; I have also
> > filed a UPower-side issue at:
> > https://gitlab.freedesktop.org/upower/upower/-/work_items/347
> >
> > For completeness, here is a local diff applied to v7.1 that restored
> > functionality. I don't intend for it to be a final fix; only a demonstr=
ation
> > that keeping the cached sysfs value readable, while still avoiding the =
boot-time
> > hardware write, restores UPower/GNOME feature discovery on this machine=
=2E
> >
> > ---
> > diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asu=
s-wmi.c
> > index 80144c412b90..d376358b590c 100644
> > --- a/drivers/platform/x86/asus-wmi.c
> > +++ b/drivers/platform/x86/asus-wmi.c
> > @@ -1582,11 +1582,11 @@ static int asus_wmi_battery_add(struct power_su=
pply *battery, struct acpi_batter
> > =C2=A0 return -ENODEV;
> > =C2=A0
> > =C2=A0 /* The charge threshold is only reset when the system is power c=
ycled,
> > - * and we can't read the current threshold, however the majority of
> > - * platforms retains it, therefore signal the threshold as unknown
> > - * until user explicitly sets it to a new value.
> > + * and we can't read the current threshold. Do not write a value to
> > + * hardware here, but keep the sysfs attribute readable so userspace
> > + * can discover charge threshold support and explicitly set a value.
> > =C2=A0 */
> > - charge_end_threshold =3D -1;
> > + charge_end_threshold =3D 100;
> > =C2=A0
> > =C2=A0 return 0;
> > =C2=A0}
> > ---
> >
> > I have attached the dmesg from the reproducing v7.1 boot and the .confi=
g used
> > for the build.
> >
> > Thanks,
> > Travers
> >
> Hi Travers,
>=20
> If you search that patch in the lkml you will see that I actually tested=
=20
> GNOME when I did this and I remember that I was able to change the=20
> threshold.
>=20
> Moreover I also opened a discussion on Upower for this specifically (you=
=20
> can find in closed merge requests)=20
> https://gitlab.freedesktop.org/upower/upower/-/merge_requests but sadly=
=20
> right now the merge request of freedesktop is whining about undisclosed=
=20
> errors.
>=20
> Anyway I think that either upower forgot to ship the updated rule or=20
> there is a regression in upower.
>=20
> Given that setting battery to 100% would mean charging the laptop while=
=20
> it boots and certain people don't want this (and it's not a good=20
> practice to do that) I am not happy having to revert this change, albeit=
=20
> if upower doesn't solve this issue I'll probably need to.
>=20
> Moreover if I remember correctly another possible workaround to have=20
> upower work is to define a fixed start_charge_threshold.
>=20
> While it's possible to add it would be useless and not mapped to the=20
> hardware in any way thus simply being an hack.
>=20
> Ilpo, what do we do in these cases? What's the usual procedure for these?

Hi,

As you probably know, the usual procedure is to not cause user-space=20
visible regressions. But this is complicated by the fact that nobody
(I assume) really wants the old behavior either.

It would always be possible to take a timeout and revert it for now, and=20
apply the change again later once the upower situation is (hopefully)=20
sorted out. That's what is sometimes done for troublesome changes to give=
=20
time to sort out the problems properly without constant time pressure.

--=20
 i.

--8323328-1706428708-1782745793=:1167--

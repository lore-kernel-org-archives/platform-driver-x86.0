Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E681A681C;
	Tue, 24 Mar 2026 13:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774358522; cv=none; b=XuEhBO6xo1UMORjXdbkzh3ScoVn4edFTRo54Gd3vVPbPkAdgj1Qnb/0/PPlhf0/CTXrjDWzecL3YPg8q3ZRIxQTzHOzgLelu35KnC28tJ4EHngIFDiAcaKG+qKpGkjPkH87qLFP279sUpzXCBUv+3snY/EJ+7ypP20KGu+zxzwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774358522; c=relaxed/simple;
	bh=hcis2EhU05udT8VhvaZ3z/E1UQppp0Zvw7Shn6jpB8k=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=LjSCEcDDQpISbIOLSFATe6MXezdyFqVtbZor8S0fsTonYaS/l2QjD7ToRf01BMFtW7t7zOb4bSqaYvsg0kVB5jTzMd6USRUoFEG7Djn8TMv6jkRvolCN+MsIGNlCCnIhRM8ItflGTPBa2vSP60OvCs4T96LOc34iNxKiyyA2k58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a9SIeXS4; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a9SIeXS4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774358521; x=1805894521;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=hcis2EhU05udT8VhvaZ3z/E1UQppp0Zvw7Shn6jpB8k=;
  b=a9SIeXS4L26sRtzwoVjQSfHGiZH+tpQ7jkU50QFH8QfWr8ctel2LPiug
   kIUYdNU3SFytSa5ovgyoNh+n6exFciB9lFyO4hNgu5nou2DQ4covCqRpe
   R6jU+OXWemXU4bsrlrFcA7NxRIE5YbfcVu+dpo0siLeXAOPB2Bwlt9yUQ
   1YrT3dv3tjVjJTNEaF2Roexx48Op1yGBt06Vsng23T7zMx9bjwg2uMPa8
   uSp5OZMAkUO4JPzcJcg5wUGoARSMaXkce1YanDtnNRRxpnoC5olwZaUI1
   TSb+SJb/KZDaOyyzalphFi7XxrPpHVDLPVn5OsmxhG2wHtQz58yiNckkE
   Q==;
X-CSE-ConnectionGUID: L80nxrmQSm6GoPcJGP9deA==
X-CSE-MsgGUID: fnC0uVxPTO6OOm/9iFwEUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="62924172"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="62924172"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 06:22:00 -0700
X-CSE-ConnectionGUID: 5U6Sg39JTKePKDnwwa9kFg==
X-CSE-MsgGUID: i/i2U1zpRXGmMFR5a4txpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="225994834"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.217])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 06:21:58 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 24 Mar 2026 15:21:54 +0200 (EET)
To: Werner Sembach <wse@tuxedocomputers.com>
cc: W_Armin@gmx.de, Hans de Goede <hansg@kernel.org>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 2/5] platform/x86: uniwill-laptop: Implement USB-C
 power priority setting
In-Reply-To: <118aaa63-1050-4a98-88e1-a824c4e01315@tuxedocomputers.com>
Message-ID: <f4678518-0bac-40f1-cc49-e8e23a8ad46a@linux.intel.com>
References: <20260312192705.76576-1-wse@tuxedocomputers.com> <20260312192705.76576-3-wse@tuxedocomputers.com> <fc314dee-c341-8ff3-794c-2edecefc079a@linux.intel.com> <118aaa63-1050-4a98-88e1-a824c4e01315@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1305642444-1774358514=:1055"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1305642444-1774358514=:1055
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 24 Mar 2026, Werner Sembach wrote:
> Am 24.03.26 um 14:08 schrieb Ilpo J=C3=A4rvinen:
> > On Thu, 12 Mar 2026, Werner Sembach wrote:
> >=20
> > > On some devices Uniwill offers the option to set the USB-C port to
> > > prioritise charging or performance. This patch exposes this setting t=
o the
> > > userspace via sysfs for all TUXEDO devices supporting it.
> > >=20
> > > Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> > > Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> > > ---
> > >   drivers/platform/x86/uniwill/uniwill-acpi.c | 145 +++++++++++++++++=
++-
> > >   1 file changed, 138 insertions(+), 7 deletions(-)
> > >=20
> > > diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c
> > > b/drivers/platform/x86/uniwill/uniwill-acpi.c
> > > index 048b265bff374..22ae5fccd6a06 100644
> > > --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> > > +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> > > @@ -266,8 +266,8 @@
> > >   #define BATTERY_CHARGE_FULL_OVER_24H=09BIT(3)
> > >   #define BATTERY_ERM_STATUS_REACHED=09BIT(4)
> > >   -#define EC_ADDR_CHARGE_PRIO=09=090x07CC
> > > -#define CHARGING_PERFORMANCE=09=09BIT(7)
> > > +#define EC_ADDR_USB_C_POWER_PRIORITY=090x07CC
> > > +#define USB_C_POWER_PRIORITY=09=09BIT(7)
> > >     /* Same bits as EC_ADDR_LIGHTBAR_AC_CTRL except LIGHTBAR_S3_OFF *=
/
> > >   #define EC_ADDR_LIGHTBAR_BAT_CTRL=090x07E2
> > > @@ -324,6 +324,12 @@
> > >   #define UNIWILL_FEATURE_PRIMARY_FAN=09=09BIT(7)
> > >   #define UNIWILL_FEATURE_SECONDARY_FAN=09=09BIT(8)
> > >   #define UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL=09BIT(9)
> > > +#define UNIWILL_FEATURE_USB_C_POWER_PRIORITY=09BIT(10)
> > > +
> > > +enum usb_c_power_priority_options {
> > > +=09USB_C_POWER_PRIORITY_CHARGING =3D 0,
> > > +=09USB_C_POWER_PRIORITY_PERFORMANCE,
> > > +};
> > >     struct uniwill_data {
> > >   =09struct device *dev;
> > > @@ -343,6 +349,8 @@ struct uniwill_data {
> > >   =09struct mutex input_lock;=09/* Protects input sequence during
> > > notify */
> > >   =09struct input_dev *input_device;
> > >   =09struct notifier_block nb;
> > > +=09struct mutex usb_c_power_priority_lock; /* Protects dependent bit
> > > write and state safe */
> > > +=09enum usb_c_power_priority_options last_usb_c_power_priority_optio=
n;
> > >   };
> > >     struct uniwill_battery_entry {
> > > @@ -527,6 +535,7 @@ static bool uniwill_writeable_reg(struct device *=
dev,
> > > unsigned int reg)
> > >   =09case EC_ADDR_CTGP_DB_CTGP_OFFSET:
> > >   =09case EC_ADDR_CTGP_DB_TPP_OFFSET:
> > >   =09case EC_ADDR_CTGP_DB_DB_OFFSET:
> > > +=09case EC_ADDR_USB_C_POWER_PRIORITY:
> > >   =09=09return true;
> > >   =09default:
> > >   =09=09return false;
> > > @@ -565,6 +574,7 @@ static bool uniwill_readable_reg(struct device *d=
ev,
> > > unsigned int reg)
> > >   =09case EC_ADDR_CTGP_DB_CTGP_OFFSET:
> > >   =09case EC_ADDR_CTGP_DB_TPP_OFFSET:
> > >   =09case EC_ADDR_CTGP_DB_DB_OFFSET:
> > > +=09case EC_ADDR_USB_C_POWER_PRIORITY:
> > >   =09=09return true;
> > >   =09default:
> > >   =09=09return false;
> > > @@ -587,6 +597,7 @@ static bool uniwill_volatile_reg(struct device *d=
ev,
> > > unsigned int reg)
> > >   =09case EC_ADDR_TRIGGER:
> > >   =09case EC_ADDR_SWITCH_STATUS:
> > >   =09case EC_ADDR_CHARGE_CTRL:
> > > +=09case EC_ADDR_USB_C_POWER_PRIORITY:
> > >   =09=09return true;
> > >   =09default:
> > >   =09=09return false;
> > > @@ -883,6 +894,104 @@ static int uniwill_nvidia_ctgp_init(struct
> > > uniwill_data *data)
> > >   =09return 0;
> > >   }
> > >   +static const char * const USB_C_POWER_PRIORITY_TEXT[] =3D {
> > > +static const u8 USB_C_POWER_PRIORITY_VALUE[] =3D {
> > These two arrays need to be lowercase as they're not macros.
>=20
> I copied a design pattern if found here for example:
> https://elixir.bootlin.com/linux/v6.19.9/source/drivers/power/supply/powe=
r_supply_sysfs.c#L63
>=20
> But ofc can lower case it.

Yes, please use lowercase for them.

I read through the other patches of the series in the meantime. They=20
seemed fine.

--=20
 i.

--8323328-1305642444-1774358514=:1055--

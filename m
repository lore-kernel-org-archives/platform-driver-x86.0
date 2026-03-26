Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532AF3914E6;
	Thu, 26 Mar 2026 16:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774541604; cv=pass; b=MHRBLxCxu6FvMrDHheoPX5tx6WZl1jZqn2xbcVDXjCt9ZMvMZC6LLnvwRDw2xJR3PsLVWSJrB0AFSSoth2+TvnrNOUJ8TGrIAlI7um5zDTTws2k1+iPZJ1+IIQJKHvew0+dkXgpVpeUqJ3ObNlue9AayXedKfPV6+8IiiWBXJJY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774541604; c=relaxed/simple;
	bh=bVz/BnMsgwnIK67WrLXOz3ZZzP8UQhi51kbWRytlj+w=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ZIZ7zGiqi2p1ZQC0Ro7JMaMUVJVAZfozlTRafikH8XAtfkO2l/zenrzUpPtsdcd2NxclKMHogNRszU/OP6O7B2gOv5jZxUkrioUK0SQpdWW+TNEJcGkxiADWWOk/i6GP6O6kmI+FEmsWEetvWr1JfQWTSvbE/sl4f/JRDiioRbg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=lrSTGbNX; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="lrSTGbNX"
ARC-Seal: i=1; a=rsa-sha256; t=1774541579; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fGrQNbCy8AUssPhUXQSfHa5i9Zoy6LBmht8xn42tD0kbKPBK7fGKlvxcBA9+ZQlHUxYaglvQbPzOj1i0VW0CUqm4ca/gLk4ywuKWnoiHN3HcWtu21WAQ81gbM6QC4DbOf17LhAwqpZnI733a3Un0701NRgLL4J1Ng+r1HJwmnFY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774541579; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=crWtRLbF1RIfG5JL2bWasHQmPlePfe4pV7e7HSnuPvQ=; 
	b=WH0gYqZ/CG5cW1nMeslKquyqUc9VadoHlyeasUp/SVux2Tzhp5NAcbkf42tDfFM0p7/MCEbT1VU3wumTcmQ6NeLnhBht0EL7LiwwmSiiY8l3i7S6ffDqcdrNU38Nvzi0I6diMKEDC4Tjsx9L+PYhcOT64GmlV84V2EZeaYzvAzk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774541579;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=crWtRLbF1RIfG5JL2bWasHQmPlePfe4pV7e7HSnuPvQ=;
	b=lrSTGbNXHbebOgfjiE197xwjNU2sJUcMJyu8N7pAih7ndrpOYsbfNFAHO8vCTJhT
	1LKHvtUic2bf3t2gtwcaycGnwqYfyT1X11nkLNjTXh71pJrPitLVwIBQMnXN7yFzXd1
	stW+sof+0fsNXXB1XtkpKj2gw9Ijjhd6yvBnQtSyFdYp9fUMt1NTMOEnyn9f2XNxKLs
	cRC5exI98X/oXAvUpqo/c6nGIRNNApWi87b32Sb5YGcxoGf6dk93LqjOCFpA8di5Jia
	pkmW4s3j4I7GjQs4b1w7TSJnywpCQV5maw3Gxzx5kBFbRHkTcRouRTiWPGt/zmJnNUD
	YWYUHaKX8Q==
Received: by mx.zohomail.com with SMTPS id 1774541576760193.78093944770717;
	Thu, 26 Mar 2026 09:12:56 -0700 (PDT)
Message-ID: <861d0276a759461be446df8e996d196037c9b581.camel@rong.moe>
Subject: Re: [PATCH v5 8/8] platform/x86: lenovo-wmi-other: Add WMI battery
 charge limiting
From: Rong Zhang <i@rong.moe>
To: Derek John Clark <derekjohn.clark@gmail.com>, kernel test robot
	 <lkp@intel.com>
Cc: Ilpo =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Hans
 de Goede <hansg@kernel.org>, oe-kbuild-all@lists.linux.dev, Mark Pearson
 <mpearson-lenovo@squebb.ca>,  Armin Wolf <W_Armin@gmx.de>, Jonathan Corbet
 <corbet@lwn.net>, Kurt Borja <kuurtb@gmail.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <CAFqHKT==yv=1E9Tjz+xbMZpS+33_jFYe6hCVdktmctaKiAUHZQ@mail.gmail.com>
References: <20260324221032.1333636-9-derekjohn.clark@gmail.com>
		 <202603260302.X0NjQOda-lkp@intel.com>
		 <CAFqHKT==yv=1E9Tjz+xbMZpS+33_jFYe6hCVdktmctaKiAUHZQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Mar 2026 00:12:41 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-9 
X-ZohoMailClient: External

Hi Derek,

On Wed, 2026-03-25 at 19:12 -0700, Derek John Clark wrote:
> On Wed, Mar 25, 2026 at 12:43=E2=80=AFPM kernel test robot <lkp@intel.com=
> wrote:
> >=20
> > Hi Derek,
> >=20
> > kernel test robot noticed the following build errors:
> >=20
> > [auto build test ERROR on linus/master]
> > [also build test ERROR on v7.0-rc5 next-20260324]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >=20
> > url:    https://github.com/intel-lab-lkp/linux/commits/Derek-J-Clark/pl=
atform-x86-lenovo-wmi-other-Move-LWMI_FAN_DIV/20260325-070851
> > base:   linus/master
> > patch link:    https://lore.kernel.org/r/20260324221032.1333636-9-derek=
john.clark%40gmail.com
> > patch subject: [PATCH v5 8/8] platform/x86: lenovo-wmi-other: Add WMI b=
attery charge limiting
> > config: x86_64-randconfig-005-20260325 (https://download.01.org/0day-ci=
/archive/20260326/202603260302.X0NjQOda-lkp@intel.com/config)

   CONFIG_DMI=3Dy
  =20
   CONFIG_HWMON=3Dy
  =20
   CONFIG_FW_ATTR_CLASS=3Dm
  =20
   CONFIG_ACPI_BATTERY=3Dm
  =20
   CONFIG_ACPI_PLATFORM_PROFILE=3Dy
  =20
   CONFIG_ACPI_WMI=3Dy
  =20
   CONFIG_LENOVO_WMI_CAPDATA=3Dm
   CONFIG_LENOVO_WMI_EVENTS=3Dy
   CONFIG_LENOVO_WMI_HELPERS=3Dy
   CONFIG_LENOVO_WMI_GAMEZONE=3Dy
   CONFIG_LENOVO_WMI_TUNING=3Dy

This isn't a legit config, as CONFIG_LENOVO_WMI_TUNING=3Dy should have
ensured CONFIG_LENOVO_WMI_CAPDATA=3Dy, CONFIG_ACPI_BATTERY=3Dy, and
CONFIG_FW_ATTR_CLASS=3Dy.

> > compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20260326/202603260302.X0NjQOda-lkp@intel.com/reproduce)
> >=20
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Closes: https://lore.kernel.org/oe-kbuild-all/202603260302.X0NjQOda-l=
kp@intel.com/
> >=20
> > All errors (new ones prefixed by >>):
> >=20
> >    ld: vmlinux.o: in function `lwmi_om_fan_get_set':
> > > > drivers/platform/x86/lenovo/wmi-other.c:206:(.text+0x1b74542): unde=
fined reference to `lwmi_attr_id'
> >    ld: vmlinux.o: in function `lwmi_attr_01_is_supported':
> >    drivers/platform/x86/lenovo/wmi-other.c:1267:(.text+0x1b74fdf): unde=
fined reference to `lwmi_attr_id'
> > > > ld: drivers/platform/x86/lenovo/wmi-other.c:1270:(.text+0x1b75013):=
 undefined reference to `lwmi_cd01_get_data'
> > > > ld: drivers/platform/x86/lenovo/wmi-other.c:1283:(.text+0x1b7515b):=
 undefined reference to `lwmi_attr_id'
> >    ld: drivers/platform/x86/lenovo/wmi-other.c:1299:(.text+0x1b752f4): =
undefined reference to `lwmi_attr_id'
> >    ld: vmlinux.o: in function `lwmi_om_fan_info_collect_cd_fan':
> > > > drivers/platform/x86/lenovo/wmi-other.c:565:(.text+0x1b75ca3): unde=
fined reference to `lwmi_cd_fan_get_data'
> >    ld: vmlinux.o: in function `lwmi_psy_prop_is_writeable':
> >    drivers/platform/x86/lenovo/wmi-other.c:687:(.text+0x1b75e2f): undef=
ined reference to `lwmi_attr_id'
> > > > ld: drivers/platform/x86/lenovo/wmi-other.c:690:(.text+0x1b75e5a): =
undefined reference to `lwmi_cd00_get_data'
> >    ld: vmlinux.o: in function `lwmi_psy_ext_set_prop':
> >    drivers/platform/x86/lenovo/wmi-other.c:649:(.text+0x1b75f9b): undef=
ined reference to `lwmi_attr_id'
> >    ld: vmlinux.o: in function `lwmi_psy_ext_get_prop':
> >    drivers/platform/x86/lenovo/wmi-other.c:603:(.text+0x1b761aa): undef=
ined reference to `lwmi_attr_id'
> >    ld: vmlinux.o: in function `lwmi_other_probe':
> > > > drivers/platform/x86/lenovo/wmi-other.c:1612:(.text+0x1b764eb): und=
efined reference to `lwmi_cd_match_add_all'
> >    ld: vmlinux.o: in function `lwmi_om_fan_info_collect_cd00':
> >    drivers/platform/x86/lenovo/wmi-other.c:540:(.text+0x1b7680f): undef=
ined reference to `lwmi_attr_id'
> >    ld: drivers/platform/x86/lenovo/wmi-other.c:540:(.text+0x1b76838): u=
ndefined reference to `lwmi_cd00_get_data'
> >    ld: vmlinux.o: in function `lwmi_om_ps_ext_init':
> > > > drivers/platform/x86/lenovo/wmi-other.c:806:(.text+0x1b76a57): unde=
fined reference to `devm_battery_hook_register'
> >    ld: vmlinux.o: in function `lwmi_om_fw_attr_add':
> > > > drivers/platform/x86/lenovo/wmi-other.c:1474:(.text+0x1b76afa): und=
efined reference to `firmware_attributes_class'
> >    ld: vmlinux.o: in function `attr_current_value_show':
> >    drivers/platform/x86/lenovo/wmi-other.c:1225:(.text+0x1b77015): unde=
fined reference to `lwmi_attr_id'
> >    ld: vmlinux.o: in function `attr_current_value_store':
> >    drivers/platform/x86/lenovo/wmi-other.c:1165:(.text+0x1b776e2): unde=
fined reference to `lwmi_attr_id'
> >    ld: drivers/platform/x86/lenovo/wmi-other.c:1168:(.text+0x1b7771c): =
undefined reference to `lwmi_cd01_get_data'
> >    ld: drivers/platform/x86/lenovo/wmi-other.c:1179:(.text+0x1b7781e): =
undefined reference to `lwmi_attr_id'
> >    ld: vmlinux.o: in function `attr_capdata01_show':
> >    drivers/platform/x86/lenovo/wmi-other.c:1099:(.text+0x1b77e38): unde=
fined reference to `lwmi_attr_id'
> >    ld: drivers/platform/x86/lenovo/wmi-other.c:1102:(.text+0x1b77e67): =
undefined reference to `lwmi_cd01_get_data'
> >=20
> > Kconfig warnings: (for reference only)
> >    WARNING: unmet direct dependencies detected for LENOVO_WMI_TUNING

When randconfig selects symbols, some are selected by the randomizer,
while some are selected by Kconfig `select SYMBOL'. In this lkp test,
CONFIG_LENOVO_WMI_GAMEZONE=3Dy was selected by the randomizer, while
CONFIG_LENOVO_WMI_TUNING=3Dy was selected by `select LENOVO_WMI_TUNING' in
`config LENOVO_WMI_GAMEZONE'.

Documentation/kbuild/kconfig-language.rst says "select will force a
symbol to a value without visiting the dependencies", resulting in unmet
dependencies in this test and
https://lore.kernel.org/r/202603252259.gHvJDyh3-lkp@intel.com

> >    Depends on [m]: X86_PLATFORM_DEVICES [=3Dy] && ACPI_WMI [=3Dy] && AC=
PI_BATTERY [=3Dm]
> >    Selected by [y]:
> >    - LENOVO_WMI_GAMEZONE [=3Dy] && X86_PLATFORM_DEVICES [=3Dy] && ACPI_=
WMI [=3Dy] && DMI [=3Dy]
> >=20
> >=20
> > vim +206 drivers/platform/x86/lenovo/wmi-other.c
> >=20
> > 51ed34282f63fa Rong Zhang 2026-01-21  186
> > 51ed34282f63fa Rong Zhang 2026-01-21  187  /**
> > 51ed34282f63fa Rong Zhang 2026-01-21  188   * lwmi_om_fan_get_set() - G=
et or set fan RPM value of specified fan
> > 51ed34282f63fa Rong Zhang 2026-01-21  189   * @priv: Driver private dat=
a structure
> > 51ed34282f63fa Rong Zhang 2026-01-21  190   * @channel: Fan channel ind=
ex (0-based)
> > 51ed34282f63fa Rong Zhang 2026-01-21  191   * @val: Pointer to value (i=
nput for set, output for get)
> > 51ed34282f63fa Rong Zhang 2026-01-21  192   * @set: True to set value, =
false to get value
> > 51ed34282f63fa Rong Zhang 2026-01-21  193   *
> > 51ed34282f63fa Rong Zhang 2026-01-21  194   * Communicates with WMI int=
erface to either retrieve current fan RPM
> > 51ed34282f63fa Rong Zhang 2026-01-21  195   * or set target fan RPM.
> > 51ed34282f63fa Rong Zhang 2026-01-21  196   *
> > 51ed34282f63fa Rong Zhang 2026-01-21  197   * Return: 0 on success, or =
an error code.
> > 51ed34282f63fa Rong Zhang 2026-01-21  198   */
> > 51ed34282f63fa Rong Zhang 2026-01-21  199  static int lwmi_om_fan_get_s=
et(struct lwmi_om_priv *priv, int channel, u32 *val, bool set)
> > 51ed34282f63fa Rong Zhang 2026-01-21  200  {
> > 51ed34282f63fa Rong Zhang 2026-01-21  201       struct wmi_method_args_=
32 args;
> > 51ed34282f63fa Rong Zhang 2026-01-21  202       u32 method_id, retval;
> > 51ed34282f63fa Rong Zhang 2026-01-21  203       int err;
> > 51ed34282f63fa Rong Zhang 2026-01-21  204
> > 51ed34282f63fa Rong Zhang 2026-01-21  205       method_id =3D set ? LWM=
I_FEATURE_VALUE_SET : LWMI_FEATURE_VALUE_GET;
> > 51ed34282f63fa Rong Zhang 2026-01-21 @206       args.arg0 =3D LWMI_ATTR=
_ID_FAN_RPM(channel);
> > 51ed34282f63fa Rong Zhang 2026-01-21  207       args.arg1 =3D set ? *va=
l : 0;
> > 51ed34282f63fa Rong Zhang 2026-01-21  208
> > 51ed34282f63fa Rong Zhang 2026-01-21  209       err =3D lwmi_dev_evalua=
te_int(priv->wdev, 0x0, method_id,
> > 51ed34282f63fa Rong Zhang 2026-01-21  210                              =
     (unsigned char *)&args, sizeof(args), &retval);
> > 51ed34282f63fa Rong Zhang 2026-01-21  211       if (err)
> > 51ed34282f63fa Rong Zhang 2026-01-21  212               return err;
> > 51ed34282f63fa Rong Zhang 2026-01-21  213
> > 51ed34282f63fa Rong Zhang 2026-01-21  214       if (!set) {
> > 51ed34282f63fa Rong Zhang 2026-01-21  215               *val =3D retval=
;
> > 51ed34282f63fa Rong Zhang 2026-01-21  216               return 0;
> > 51ed34282f63fa Rong Zhang 2026-01-21  217       }
> > 51ed34282f63fa Rong Zhang 2026-01-21  218
> > 51ed34282f63fa Rong Zhang 2026-01-21  219       /*
> > 51ed34282f63fa Rong Zhang 2026-01-21  220        * It seems that 0 mean=
s "no error" and 1 means "done". Apparently
> > 51ed34282f63fa Rong Zhang 2026-01-21  221        * different firmware t=
eams have different thoughts on indicating
> > 51ed34282f63fa Rong Zhang 2026-01-21  222        * success, so we accep=
ts both.
> > 51ed34282f63fa Rong Zhang 2026-01-21  223        */
> > 51ed34282f63fa Rong Zhang 2026-01-21  224       return (retval =3D=3D 0=
 || retval =3D=3D 1) ? 0 : -EIO;
> > 51ed34282f63fa Rong Zhang 2026-01-21  225  }
> > 51ed34282f63fa Rong Zhang 2026-01-21  226
> >=20
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
>=20
> Can someone explain to me why this is happening? I cannot reproduce
> these locally with W=3D1 and/or C=3D1. I'd prefer to resolve this before
> submitting a v6.

The issue exists since commit 6e38b9fcbfa3 ('platform/x86: lenovo:
gamezone needs "other mode"'). It might be a coincidence that lkp didn't
running into a similar issue before.=C2=A0IMO `select LENOVO_WMI_TUNING'
shouldn't be used in the first place since LENOVO_WMI_TUNING has
numerous dependencies.

To fix this, we need to decouple=C2=A0lenovo-wmi-gamezone and lenovo-wmi-
other by moving the notifier chain into lenovo-wmi-helpers. I will reply
with a patch soon. Fell free to integrate it into your series.

Note that I couldn't completely test my patch since the lack of gamezone
support on my device.

BTW, the fix patch has conflicts with my debugfs series since both touch
lenovo-wmi-helpers. If you decide to integrate the fix patch into your
series, could you integrate the debugfs series into yours too? The
conflicts are trivial and contextual. You can resolve them yourself if
you don't mind it ;-)

Thanks,
Rong

>=20
> Thanks,
> Derek

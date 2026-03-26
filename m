Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE65339769A
	for <platform-driver-x86@vger.kernel.org>; Thu, 26 Mar 2026 16:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774542061; cv=none; b=pAc8FpCDNeLJ0Ds1uyAWom5eQgMGRw1IO77x17wjfGUqKm6Exkjv6Ge1nt+YSn3T6nv2XKiVshaDZRFWMrCbfD8eF4qMfdNl+dUdByzrhszEOFDWYy4bKw7QfG++qR53YkvBPJotmj3utQk3aDdyQR7/7G9GCRPZMb82PkhA490=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774542061; c=relaxed/simple;
	bh=ybHz8eJRBgiukjAxUdgio9kch8ma4yPD8PWgiF3Q/sM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=YsjT/PnqJ5zA6UTI3LyNjpPoqbVY8FDBHC3JId+z62+ZFjBFqpo9FIGa9DC8K+H/MTM3pdPZWlgi/PEAsK6bf87VWjr338wc8JzCYDzDo/mvB5yOahHRfldPzjLNarlMWbT2LvuK1S0RDNEPMWyGwhmwj1wgmRnXjp5kJ0OAzfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HQ495aQ3; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HQ495aQ3"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2c0fa90d47bso1118108eec.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 26 Mar 2026 09:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774542058; x=1775146858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=85Dohg3Z9BSBRDSP6NMVZUTqsZbw7dAG0SAd6h0m0yA=;
        b=HQ495aQ3dyrgUju1dkm4pBlBqRwWrTVA/xHwTTXBlR09GiU0qxT1kO7YDBZJI6iPE1
         OHJHyfekNu9B25YOqpCEBhU2VPiyIDQDYI15rq+QhGPikC4lp0K4RuGS3CTNoXWCYQwi
         MudyHB0Yy4Kx4ZkqXWiSvOu31l9xmY3wTLE560Bkkj28fVU2aOS742+JxJOT50fViyPQ
         BcFEHn/WfM7cKsqMkjOHMTyDJqDjMses7UbMmb0iIotkTQGRoVSKY16gpaOHJVCJvkb0
         ILbGBEYmk+l//41g7cFIxSVjRnK2FUctB3yFCHhjq95r7j9MbeLsnY0MHn4bsj8VtzNP
         R4sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774542058; x=1775146858;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=85Dohg3Z9BSBRDSP6NMVZUTqsZbw7dAG0SAd6h0m0yA=;
        b=EpcTbW1bPkeY8Y18xW6JoMBmUusZvXwPv4Yw5mKM0wixP1rurybD2P+A7psbi+eJAY
         +PlGCjJNhOG+pjBUHfAH+en/aJa4KBBeCwbJzVwi9qZnRmUNyVtNyDZNZSXuJ7l/GC0b
         e76ByrBylGAs41t7hDLQOrmYJB8xkuk4RMYfsjQRhOzOK1xELRqJ/bljldUIPhKYoPM+
         Dh61ETAP+Jtt8MHpqNsmoKeSqlaXWnB5YmXO8XuUjN6u1kT2cQIagyqOiC975ofQwtLY
         8TXe1yJ3up6oc1k6QPCHKr4i24lMeAoKkaEfVTxXTstauRB8Lr8HZr4NNzfPK77MXP5+
         JoyA==
X-Forwarded-Encrypted: i=1; AJvYcCVZ3J/tbOYbfoFcnZuWF2i58kPzA3bz80pwOKq9K5wvzAVrJYJ1mrHx+OPjY60XqyENMPI/9hxMBNBQzZs9ewwCHGO6@vger.kernel.org
X-Gm-Message-State: AOJu0YyHGEOXzU+mQ+KgM8fkAGSnnsZ0r3rw0FJhUAYXYcae7B/+J9Jv
	ytyBER2Sc+ssQE2RmdAQ9x9OaqsGK8W3/VW0fPTc0j7L+Y+qpl9+qX8n
X-Gm-Gg: ATEYQzyF4zwldI1NPLIN5Y1EFx9Y3mSZHW8KyhHQUp9OCognV7WA7Ib6wwCsQaYHCNN
	wQLcqililhXqNVotpdqDH2RgqZvRoJ+AISoU1YLs7rhQdmf7J88LWvmh9hMKcMYxlwvv8unNCrC
	07AcP3cKf0v2nodytu6iVWizOEL8EobEw0re0bLm17WUgHqnAsHINWXxpBnuW053oRlS4gtzpAH
	y9P26wlmzy8BE83ghw04SDBmqyb93n0k7lyV0Cqji41vh6dWrUOQ0gUg9oHrA7F/WDjOyfV0meG
	g587KSuB29BxwSpmVDmZvF1/54eBwFAwxD4GEIU1H+MdZZoKKdXIqLB4ITS0gQBFl3MKD/zGDFR
	hBnIuYbS3emt7EwItb7nt7srwFKYZQ2BvLpgoZdwm4Ikm4xANdCWv9m3+z56JVADS+aYmWU7jFZ
	MqNoDuILP3OcDsRhFGAZCOUnHrq4XUBu/LZ0EUCiMk28oNc1ajmLQm8r/oIhY1lS6Id6lVR72Yk
	lBMOJ/GRWM69T2VuWrSWw==
X-Received: by 2002:a05:7300:ef89:b0:2a6:a306:efdb with SMTP id 5a478bee46e88-2c17713faa8mr1451638eec.3.1774542057528;
        Thu, 26 Mar 2026 09:20:57 -0700 (PDT)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c16ec277edsm3919298eec.3.2026.03.26.09.20.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 09:20:57 -0700 (PDT)
Date: Thu, 26 Mar 2026 09:20:56 -0700
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Rong Zhang <i@rong.moe>, kernel test robot <lkp@intel.com>
CC: =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>, oe-kbuild-all@lists.linux.dev,
 Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>,
 Jonathan Corbet <corbet@lwn.net>, Kurt Borja <kuurtb@gmail.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v5_8/8=5D_platform/x86=3A_lenovo-w?=
 =?US-ASCII?Q?mi-other=3A_Add_WMI_battery_charge_limiting?=
User-Agent: Thunderbird for Android
In-Reply-To: <861d0276a759461be446df8e996d196037c9b581.camel@rong.moe>
References: <20260324221032.1333636-9-derekjohn.clark@gmail.com> <202603260302.X0NjQOda-lkp@intel.com> <CAFqHKT==yv=1E9Tjz+xbMZpS+33_jFYe6hCVdktmctaKiAUHZQ@mail.gmail.com> <861d0276a759461be446df8e996d196037c9b581.camel@rong.moe>
Message-ID: <70895A3D-4A84-403E-A3BF-8730AEE03F6E@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On March 26, 2026 9:12:41 AM PDT, Rong Zhang <i@rong=2Emoe> wrote:
>Hi Derek,
>
>On Wed, 2026-03-25 at 19:12 -0700, Derek John Clark wrote:
>> On Wed, Mar 25, 2026 at 12:43=E2=80=AFPM kernel test robot <lkp@intel=
=2Ecom> wrote:
>> >=20
>> > Hi Derek,
>> >=20
>> > kernel test robot noticed the following build errors:
>> >=20
>> > [auto build test ERROR on linus/master]
>> > [also build test ERROR on v7=2E0-rc5 next-20260324]
>> > [If your patch is applied to the wrong git tree, kindly drop us a not=
e=2E
>> > And when submitting patch, we suggest to use '--base' as documented i=
n
>> > https://git-scm=2Ecom/docs/git-format-patch#_base_tree_information]
>> >=20
>> > url:    https://github=2Ecom/intel-lab-lkp/linux/commits/Derek-J-Clar=
k/platform-x86-lenovo-wmi-other-Move-LWMI_FAN_DIV/20260325-070851
>> > base:   linus/master
>> > patch link:    https://lore=2Ekernel=2Eorg/r/20260324221032=2E1333636=
-9-derekjohn=2Eclark%40gmail=2Ecom
>> > patch subject: [PATCH v5 8/8] platform/x86: lenovo-wmi-other: Add WMI=
 battery charge limiting
>> > config: x86_64-randconfig-005-20260325 (https://download=2E01=2Eorg/0=
day-ci/archive/20260326/202603260302=2EX0NjQOda-lkp@intel=2Ecom/config)
>
>   CONFIG_DMI=3Dy
>  =20
>   CONFIG_HWMON=3Dy
>  =20
>   CONFIG_FW_ATTR_CLASS=3Dm
>  =20
>   CONFIG_ACPI_BATTERY=3Dm
>  =20
>   CONFIG_ACPI_PLATFORM_PROFILE=3Dy
>  =20
>   CONFIG_ACPI_WMI=3Dy
>  =20
>   CONFIG_LENOVO_WMI_CAPDATA=3Dm
>   CONFIG_LENOVO_WMI_EVENTS=3Dy
>   CONFIG_LENOVO_WMI_HELPERS=3Dy
>   CONFIG_LENOVO_WMI_GAMEZONE=3Dy
>   CONFIG_LENOVO_WMI_TUNING=3Dy
>
>This isn't a legit config, as CONFIG_LENOVO_WMI_TUNING=3Dy should have
>ensured CONFIG_LENOVO_WMI_CAPDATA=3Dy, CONFIG_ACPI_BATTERY=3Dy, and
>CONFIG_FW_ATTR_CLASS=3Dy=2E
>
>> > compiler: gcc-14 (Debian 14=2E2=2E0-19) 14=2E2=2E0
>> > reproduce (this is a W=3D1 build): (https://download=2E01=2Eorg/0day-=
ci/archive/20260326/202603260302=2EX0NjQOda-lkp@intel=2Ecom/reproduce)
>> >=20
>> > If you fix the issue in a separate patch/commit (i=2Ee=2E not just a =
new version of
>> > the same patch/commit), kindly add following tags
>> > > Reported-by: kernel test robot <lkp@intel=2Ecom>
>> > > Closes: https://lore=2Ekernel=2Eorg/oe-kbuild-all/202603260302=2EX0=
NjQOda-lkp@intel=2Ecom/
>> >=20
>> > All errors (new ones prefixed by >>):
>> >=20
>> >    ld: vmlinux=2Eo: in function `lwmi_om_fan_get_set':
>> > > > drivers/platform/x86/lenovo/wmi-other=2Ec:206:(=2Etext+0x1b74542)=
: undefined reference to `lwmi_attr_id'
>> >    ld: vmlinux=2Eo: in function `lwmi_attr_01_is_supported':
>> >    drivers/platform/x86/lenovo/wmi-other=2Ec:1267:(=2Etext+0x1b74fdf)=
: undefined reference to `lwmi_attr_id'
>> > > > ld: drivers/platform/x86/lenovo/wmi-other=2Ec:1270:(=2Etext+0x1b7=
5013): undefined reference to `lwmi_cd01_get_data'
>> > > > ld: drivers/platform/x86/lenovo/wmi-other=2Ec:1283:(=2Etext+0x1b7=
515b): undefined reference to `lwmi_attr_id'
>> >    ld: drivers/platform/x86/lenovo/wmi-other=2Ec:1299:(=2Etext+0x1b75=
2f4): undefined reference to `lwmi_attr_id'
>> >    ld: vmlinux=2Eo: in function `lwmi_om_fan_info_collect_cd_fan':
>> > > > drivers/platform/x86/lenovo/wmi-other=2Ec:565:(=2Etext+0x1b75ca3)=
: undefined reference to `lwmi_cd_fan_get_data'
>> >    ld: vmlinux=2Eo: in function `lwmi_psy_prop_is_writeable':
>> >    drivers/platform/x86/lenovo/wmi-other=2Ec:687:(=2Etext+0x1b75e2f):=
 undefined reference to `lwmi_attr_id'
>> > > > ld: drivers/platform/x86/lenovo/wmi-other=2Ec:690:(=2Etext+0x1b75=
e5a): undefined reference to `lwmi_cd00_get_data'
>> >    ld: vmlinux=2Eo: in function `lwmi_psy_ext_set_prop':
>> >    drivers/platform/x86/lenovo/wmi-other=2Ec:649:(=2Etext+0x1b75f9b):=
 undefined reference to `lwmi_attr_id'
>> >    ld: vmlinux=2Eo: in function `lwmi_psy_ext_get_prop':
>> >    drivers/platform/x86/lenovo/wmi-other=2Ec:603:(=2Etext+0x1b761aa):=
 undefined reference to `lwmi_attr_id'
>> >    ld: vmlinux=2Eo: in function `lwmi_other_probe':
>> > > > drivers/platform/x86/lenovo/wmi-other=2Ec:1612:(=2Etext+0x1b764eb=
): undefined reference to `lwmi_cd_match_add_all'
>> >    ld: vmlinux=2Eo: in function `lwmi_om_fan_info_collect_cd00':
>> >    drivers/platform/x86/lenovo/wmi-other=2Ec:540:(=2Etext+0x1b7680f):=
 undefined reference to `lwmi_attr_id'
>> >    ld: drivers/platform/x86/lenovo/wmi-other=2Ec:540:(=2Etext+0x1b768=
38): undefined reference to `lwmi_cd00_get_data'
>> >    ld: vmlinux=2Eo: in function `lwmi_om_ps_ext_init':
>> > > > drivers/platform/x86/lenovo/wmi-other=2Ec:806:(=2Etext+0x1b76a57)=
: undefined reference to `devm_battery_hook_register'
>> >    ld: vmlinux=2Eo: in function `lwmi_om_fw_attr_add':
>> > > > drivers/platform/x86/lenovo/wmi-other=2Ec:1474:(=2Etext+0x1b76afa=
): undefined reference to `firmware_attributes_class'
>> >    ld: vmlinux=2Eo: in function `attr_current_value_show':
>> >    drivers/platform/x86/lenovo/wmi-other=2Ec:1225:(=2Etext+0x1b77015)=
: undefined reference to `lwmi_attr_id'
>> >    ld: vmlinux=2Eo: in function `attr_current_value_store':
>> >    drivers/platform/x86/lenovo/wmi-other=2Ec:1165:(=2Etext+0x1b776e2)=
: undefined reference to `lwmi_attr_id'
>> >    ld: drivers/platform/x86/lenovo/wmi-other=2Ec:1168:(=2Etext+0x1b77=
71c): undefined reference to `lwmi_cd01_get_data'
>> >    ld: drivers/platform/x86/lenovo/wmi-other=2Ec:1179:(=2Etext+0x1b77=
81e): undefined reference to `lwmi_attr_id'
>> >    ld: vmlinux=2Eo: in function `attr_capdata01_show':
>> >    drivers/platform/x86/lenovo/wmi-other=2Ec:1099:(=2Etext+0x1b77e38)=
: undefined reference to `lwmi_attr_id'
>> >    ld: drivers/platform/x86/lenovo/wmi-other=2Ec:1102:(=2Etext+0x1b77=
e67): undefined reference to `lwmi_cd01_get_data'
>> >=20
>> > Kconfig warnings: (for reference only)
>> >    WARNING: unmet direct dependencies detected for LENOVO_WMI_TUNING
>
>When randconfig selects symbols, some are selected by the randomizer,
>while some are selected by Kconfig `select SYMBOL'=2E In this lkp test,
>CONFIG_LENOVO_WMI_GAMEZONE=3Dy was selected by the randomizer, while
>CONFIG_LENOVO_WMI_TUNING=3Dy was selected by `select LENOVO_WMI_TUNING' i=
n
>`config LENOVO_WMI_GAMEZONE'=2E
>
>Documentation/kbuild/kconfig-language=2Erst says "select will force a
>symbol to a value without visiting the dependencies", resulting in unmet
>dependencies in this test and
>https://lore=2Ekernel=2Eorg/r/202603252259=2EgHvJDyh3-lkp@intel=2Ecom
>
>> >    Depends on [m]: X86_PLATFORM_DEVICES [=3Dy] && ACPI_WMI [=3Dy] && =
ACPI_BATTERY [=3Dm]
>> >    Selected by [y]:
>> >    - LENOVO_WMI_GAMEZONE [=3Dy] && X86_PLATFORM_DEVICES [=3Dy] && ACP=
I_WMI [=3Dy] && DMI [=3Dy]
>> >=20
>> >=20
>> > vim +206 drivers/platform/x86/lenovo/wmi-other=2Ec
>> >=20
>> > 51ed34282f63fa Rong Zhang 2026-01-21  186
>> > 51ed34282f63fa Rong Zhang 2026-01-21  187  /**
>> > 51ed34282f63fa Rong Zhang 2026-01-21  188   * lwmi_om_fan_get_set() -=
 Get or set fan RPM value of specified fan
>> > 51ed34282f63fa Rong Zhang 2026-01-21  189   * @priv: Driver private d=
ata structure
>> > 51ed34282f63fa Rong Zhang 2026-01-21  190   * @channel: Fan channel i=
ndex (0-based)
>> > 51ed34282f63fa Rong Zhang 2026-01-21  191   * @val: Pointer to value =
(input for set, output for get)
>> > 51ed34282f63fa Rong Zhang 2026-01-21  192   * @set: True to set value=
, false to get value
>> > 51ed34282f63fa Rong Zhang 2026-01-21  193   *
>> > 51ed34282f63fa Rong Zhang 2026-01-21  194   * Communicates with WMI i=
nterface to either retrieve current fan RPM
>> > 51ed34282f63fa Rong Zhang 2026-01-21  195   * or set target fan RPM=
=2E
>> > 51ed34282f63fa Rong Zhang 2026-01-21  196   *
>> > 51ed34282f63fa Rong Zhang 2026-01-21  197   * Return: 0 on success, o=
r an error code=2E
>> > 51ed34282f63fa Rong Zhang 2026-01-21  198   */
>> > 51ed34282f63fa Rong Zhang 2026-01-21  199  static int lwmi_om_fan_get=
_set(struct lwmi_om_priv *priv, int channel, u32 *val, bool set)
>> > 51ed34282f63fa Rong Zhang 2026-01-21  200  {
>> > 51ed34282f63fa Rong Zhang 2026-01-21  201       struct wmi_method_arg=
s_32 args;
>> > 51ed34282f63fa Rong Zhang 2026-01-21  202       u32 method_id, retval=
;
>> > 51ed34282f63fa Rong Zhang 2026-01-21  203       int err;
>> > 51ed34282f63fa Rong Zhang 2026-01-21  204
>> > 51ed34282f63fa Rong Zhang 2026-01-21  205       method_id =3D set ? L=
WMI_FEATURE_VALUE_SET : LWMI_FEATURE_VALUE_GET;
>> > 51ed34282f63fa Rong Zhang 2026-01-21 @206       args=2Earg0 =3D LWMI_=
ATTR_ID_FAN_RPM(channel);
>> > 51ed34282f63fa Rong Zhang 2026-01-21  207       args=2Earg1 =3D set ?=
 *val : 0;
>> > 51ed34282f63fa Rong Zhang 2026-01-21  208
>> > 51ed34282f63fa Rong Zhang 2026-01-21  209       err =3D lwmi_dev_eval=
uate_int(priv->wdev, 0x0, method_id,
>> > 51ed34282f63fa Rong Zhang 2026-01-21  210                            =
       (unsigned char *)&args, sizeof(args), &retval);
>> > 51ed34282f63fa Rong Zhang 2026-01-21  211       if (err)
>> > 51ed34282f63fa Rong Zhang 2026-01-21  212               return err;
>> > 51ed34282f63fa Rong Zhang 2026-01-21  213
>> > 51ed34282f63fa Rong Zhang 2026-01-21  214       if (!set) {
>> > 51ed34282f63fa Rong Zhang 2026-01-21  215               *val =3D retv=
al;
>> > 51ed34282f63fa Rong Zhang 2026-01-21  216               return 0;
>> > 51ed34282f63fa Rong Zhang 2026-01-21  217       }
>> > 51ed34282f63fa Rong Zhang 2026-01-21  218
>> > 51ed34282f63fa Rong Zhang 2026-01-21  219       /*
>> > 51ed34282f63fa Rong Zhang 2026-01-21  220        * It seems that 0 me=
ans "no error" and 1 means "done"=2E Apparently
>> > 51ed34282f63fa Rong Zhang 2026-01-21  221        * different firmware=
 teams have different thoughts on indicating
>> > 51ed34282f63fa Rong Zhang 2026-01-21  222        * success, so we acc=
epts both=2E
>> > 51ed34282f63fa Rong Zhang 2026-01-21  223        */
>> > 51ed34282f63fa Rong Zhang 2026-01-21  224       return (retval =3D=3D=
 0 || retval =3D=3D 1) ? 0 : -EIO;
>> > 51ed34282f63fa Rong Zhang 2026-01-21  225  }
>> > 51ed34282f63fa Rong Zhang 2026-01-21  226
>> >=20
>> > --
>> > 0-DAY CI Kernel Test Service
>> > https://github=2Ecom/intel/lkp-tests/wiki
>>=20
>> Can someone explain to me why this is happening? I cannot reproduce
>> these locally with W=3D1 and/or C=3D1=2E I'd prefer to resolve this bef=
ore
>> submitting a v6=2E
>
>The issue exists since commit 6e38b9fcbfa3 ('platform/x86: lenovo:
>gamezone needs "other mode"')=2E It might be a coincidence that lkp didn'=
t
>running into a similar issue before=2E=C2=A0IMO `select LENOVO_WMI_TUNING=
'
>shouldn't be used in the first place since LENOVO_WMI_TUNING has
>numerous dependencies=2E
>
>To fix this, we need to decouple=C2=A0lenovo-wmi-gamezone and lenovo-wmi-
>other by moving the notifier chain into lenovo-wmi-helpers=2E I will repl=
y
>with a patch soon=2E Fell free to integrate it into your series=2E
>
>Note that I couldn't completely test my patch since the lack of gamezone
>support on my device=2E
>
>BTW, the fix patch has conflicts with my debugfs series since both touch
>lenovo-wmi-helpers=2E If you decide to integrate the fix patch into your
>series, could you integrate the debugfs series into yours too? The
>conflicts are trivial and contextual=2E You can resolve them yourself if
>you don't mind it ;-)
>
>Thanks,
>Rong
>

Absolutely, that's a good plan=2E If you want, send the new patch to me di=
rectly=2E Also, please leave a note on that other series in case Ilpo doesn=
't see this first=2E

And thanks for the clear explanation=2E Hopefully it all works like we exp=
ect=2E

Cheers,
Derek

>>=20
>> Thanks,
>> Derek


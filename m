From: "Yuan, Perry" <Perry.Yuan@dell.com>
Subject: RE: [PATCH] platform/x86:dell-laptop:Add battery charging thresholds
 and charging mode switch.
Date: Tue, 4 Aug 2020 05:46:30 +0000
Message-ID: <SJ0PR19MB45281A4375E622F69642B526844A0@SJ0PR19MB4528.namprd19.prod.outlook.com>
References: <20200729065424.12851-1-Perry_Yuan@Dell.com>
 <202008011345.5O4q2hta%lkp@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <202008011345.5O4q2hta%lkp@intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: kernel test robot <lkp@intel.com>, "sre@kernel.org" <sre@kernel.org>, "mjg59@srcf.ucam.org" <mjg59@srcf.ucam.org>, "pali@kernel.org" <pali@kernel.org>, "dvhart@infradead.org" <dvhart@infradead.org>, "andy@infradead.org" <andy@infradead.org>, "Limonciello, Mario" <Mario.Limonciello@dell.com>
Cc: "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

> From: kernel test robot <lkp@intel.com>
> Sent: Saturday, August 1, 2020 1:08 PM
> To: Yuan, Perry; sre@kernel.org; mjg59@srcf.ucam.org; pali@kernel.org;
> dvhart@infradead.org; andy@infradead.org; Limonciello, Mario
> Cc: kbuild-all@lists.01.org; linux-pm@vger.kernel.org; linux-
> kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org; Yuan, Perry
> Subject: Re: [PATCH] platform/x86:dell-laptop:Add battery charging thresh=
olds
> and charging mode switch.
>=20
>=20
> [EXTERNAL EMAIL]
>=20
> Hi Perry,
>=20
> Thank you for the patch! Yet something to improve:
>=20
> [auto build test ERROR on power-supply/for-next] [also build test ERROR o=
n
> linux/master linus/master v5.8-rc7 next-20200731] [If your patch is appli=
ed to
> the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>=20
> url:    https://github.com/0day-ci/linux/commits/Perry-Yuan/platform-x86-
> dell-laptop-Add-battery-charging-thresholds-and-charging-mode-
> switch/20200729-150347
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-
> supply.git for-next
> config: i386-randconfig-a005-20200731 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-14) 9.3.0
> reproduce (this is a W=3D1 build):
>         # save the attached .config to linux build tree
>         make W=3D1 ARCH=3Di386
>=20
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>=20
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>=20
> >> ERROR: modpost: "battery_hook_unregister" [drivers/platform/x86/dell-
> laptop.ko] undefined!
> >> ERROR: modpost: "battery_hook_register" [drivers/platform/x86/dell-
> laptop.ko] undefined!
>=20
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

It is not patch issue, the kernel config needs to add  "CONFIG_ACPI_BATTERY=
=3Dy"

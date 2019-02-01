From: Liming Sun <lsun@mellanox.com>
Subject: RE: [PATCH v1 1/1] platform/mellanox: Add bootctl driver for Mellanox
 BlueField Soc
Date: Fri, 1 Feb 2019 20:48:52 +0000
Message-ID: <DB6PR05MB3223E29FE34B600B86E83170A1920@DB6PR05MB3223.eurprd05.prod.outlook.com>
References: <0b74e9ad12360b56bc0a3c2ca972798c424f2610.1548790896.git.lsun@mellanox.com>
 <201902011338.icDcSZPG%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201902011338.icDcSZPG%fengguang.wu@intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: kbuild test robot <lkp@intel.com>
Cc: "kbuild-all@01.org" <kbuild-all@01.org>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Vadim Pasternak <vadimp@mellanox.com>, David Woods <dwoods@mellanox.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Thanks for the information!=20

Patch v4 1/1 has been posted to solve these issues.

Best regards,
Liming

> -----Original Message-----
> From: kbuild test robot <lkp@intel.com>
> Sent: Friday, February 1, 2019 12:17 AM
> To: Liming Sun <lsun@mellanox.com>
> Cc: kbuild-all@01.org; Andy Shevchenko <andy@infradead.org>; Darren Hart =
<dvhart@infradead.org>; Vadim Pasternak
> <vadimp@mellanox.com>; David Woods <dwoods@mellanox.com>; Liming Sun <lsu=
n@mellanox.com>; platform-driver-
> x86@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH v1 1/1] platform/mellanox: Add bootctl driver for Mel=
lanox BlueField Soc
>=20
> Hi Liming,
>=20
> Thank you for the patch! Yet something to improve:
>=20
> [auto build test ERROR on linus/master]
> [also build test ERROR on v5.0-rc4 next-20190131]
> [if your patch is applied to the wrong git tree, please drop us a note to=
 help improve the system]
>=20
> url:    https://github.com/0day-ci/linux/commits/Liming-Sun/platform-mell=
anox-Add-bootctl-driver-for-Mellanox-BlueField-
> Soc/20190201-104657
> config: arm64-allmodconfig (attached as .config)
> compiler: aarch64-linux-gnu-gcc (Debian 8.2.0-11) 8.2.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         GCC_VERSION=3D8.2.0 make.cross ARCH=3Darm64
>=20
> All errors (new ones prefixed by >>):
>=20
>    drivers/platform/mellanox/mlxbf-bootctl.c:260:36: error: array type ha=
s incomplete element type 'struct acpi_device_id'
>     static const struct acpi_device_id mlxbf_bootctl_acpi_ids[] =3D {
>                                        ^~~~~~~~~~~~~~~~~~~~~~
>    In file included from include/linux/module.h:18,
>                     from drivers/platform/mellanox/mlxbf-bootctl.c:12:
> >> drivers/platform/mellanox/mlxbf-bootctl.c:314:20: error: expected ',' =
or ';' before 'DRIVER_DESCRIPTION'
>     MODULE_DESCRIPTION(DRIVER_DESCRIPTION);
>                        ^~~~~~~~~~~~~~~~~~
>    include/linux/moduleparam.h:24:26: note: in definition of macro '__MOD=
ULE_INFO'
>       =3D __stringify(tag) "=3D" info
>                              ^~~~
>    include/linux/module.h:208:42: note: in expansion of macro 'MODULE_INF=
O'
>     #define MODULE_DESCRIPTION(_description) MODULE_INFO(description, _de=
scription)
>                                              ^~~~~~~~~~~
>    drivers/platform/mellanox/mlxbf-bootctl.c:314:1: note: in expansion of=
 macro 'MODULE_DESCRIPTION'
>     MODULE_DESCRIPTION(DRIVER_DESCRIPTION);
>     ^~~~~~~~~~~~~~~~~~
>=20
> vim +314 drivers/platform/mellanox/mlxbf-bootctl.c
>=20
>    259
>  > 260	static const struct acpi_device_id mlxbf_bootctl_acpi_ids[] =3D {
>    261		{"MLNXBF04", 0},
>    262		{},
>    263	};
>    264
>    265	MODULE_DEVICE_TABLE(acpi, mlxbf_bootctl_acpi_ids);
>    266
>    267	static int mlxbf_bootctl_probe(struct platform_device *pdev)
>    268	{
>    269		struct arm_smccc_res res;
>    270
>    271		/*
>    272		 * Ensure we have the UUID we expect for this service.
>    273		 * Note that the functionality we want is present in the first
>    274		 * released version of this service, so we don't check the versio=
n.
>    275		 */
>    276		arm_smccc_smc(MLXBF_BOOTCTL_SIP_SVC_UID, 0, 0, 0, 0, 0, 0, 0, &re=
s);
>    277		if (res.a0 !=3D 0x89c036b4 || res.a1 !=3D 0x11e6e7d7 ||
>    278		    res.a2 !=3D 0x1a009787 || res.a3 !=3D 0xc4bf00ca)
>    279			return -ENODEV;
>    280
>    281		/*
>    282		 * When watchdog is used, it sets boot mode to MLXBF_BOOTCTL_SWAP=
_EMMC
>    283		 * in case of boot failures. However it doesn't clear the state i=
f there
>    284		 * is no failure. Restore the default boot mode here to avoid any
>    285		 * unnecessary boot partition swapping.
>    286		 */
>    287		if (mlxbf_bootctl_smc_call1(MLXBF_BOOTCTL_SET_RESET_ACTION,
>    288					    MLXBF_BOOTCTL_EMMC) < 0)
>    289			pr_err("Unable to reset the EMMC boot mode\n");
>    290
>    291		pr_info("%s (version %s)\n", MLXBF_BOOTCTL_DRIVER_DESCRIPTION,
>    292			MLXBF_BOOTCTL_DRIVER_VERSION);
>    293
>    294		return 0;
>    295	}
>    296
>    297	static int mlxbf_bootctl_remove(struct platform_device *pdev)
>    298	{
>    299		return 0;
>    300	}
>    301
>    302	static struct platform_driver mlxbf_bootctl_driver =3D {
>    303		.probe =3D mlxbf_bootctl_probe,
>    304		.remove =3D mlxbf_bootctl_remove,
>    305		.driver =3D {
>    306			.name =3D MLXBF_BOOTCTL_DRIVER_NAME,
>    307			.groups =3D mlxbf_bootctl_attr_groups,
>    308			.acpi_match_table =3D ACPI_PTR(mlxbf_bootctl_acpi_ids),
>    309		}
>    310	};
>    311
>    312	module_platform_driver(mlxbf_bootctl_driver);
>    313
>  > 314	MODULE_DESCRIPTION(DRIVER_DESCRIPTION);
>=20
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Ce=
nter
> https://lists.01.org/pipermail/kbuild-all                   Intel Corpora=
tion

From: "Yuan, Perry" <Perry.Yuan@dell.com>
Subject: RE: [PATCH] platform/x86:dell-laptop:Add battery charging thresholds
 and charging mode switch.
Date: Tue, 4 Aug 2020 05:57:50 +0000
Message-ID: <SJ0PR19MB452858C9D87E62F5D5592703844A0@SJ0PR19MB4528.namprd19.prod.outlook.com>
References: <20200729065424.12851-1-Perry_Yuan@Dell.com>
 <202008011345.5O4q2hta%lkp@intel.com>
 <SJ0PR19MB45281A4375E622F69642B526844A0@SJ0PR19MB4528.namprd19.prod.outlook.com>
 <20200804055343.mmkypi272sgfx6al@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200804055343.mmkypi272sgfx6al@srcf.ucam.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: kernel test robot <lkp@intel.com>, "sre@kernel.org" <sre@kernel.org>, "pali@kernel.org" <pali@kernel.org>, "dvhart@infradead.org" <dvhart@infradead.org>, "andy@infradead.org" <andy@infradead.org>, "Limonciello, Mario" <Mario.Limonciello@dell.com>, "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

> From: Matthew Garrett <mjg59@srcf.ucam.org>
> Sent: Tuesday, August 4, 2020 1:54 PM
> To: Yuan, Perry
> Cc: kernel test robot; sre@kernel.org; pali@kernel.org; dvhart@infradead.=
org;
> andy@infradead.org; Limonciello, Mario; kbuild-all@lists.01.org; linux-
> pm@vger.kernel.org; linux-kernel@vger.kernel.org; platform-driver-
> x86@vger.kernel.org
> Subject: Re: [PATCH] platform/x86:dell-laptop:Add battery charging thresh=
olds
> and charging mode switch.
>=20
>=20
> [EXTERNAL EMAIL]
>=20
> On Tue, Aug 04, 2020 at 05:46:30AM +0000, Yuan, Perry wrote:
>=20
> > It is not patch issue, the kernel config needs to add
> "CONFIG_ACPI_BATTERY=3Dy"
>=20
> In that case you probably want to add a dependency to ACPI_BATTERY in the
> DELL_LAPTOP Kconfig.
>=20
> --
> Matthew Garrett | mjg59@srcf.ucam.org

Thank you Matthew.
I will add it to the Kconfig as DELL_LAPTOP dependency.=20

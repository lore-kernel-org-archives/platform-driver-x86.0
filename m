From: "Kammela, Gayatri" <gayatri.kammela@intel.com>
Subject: RE: [PATCH v1 0/4] platform/x86: intel_pmc_core: Add bug fixes or
 code
Date: Thu, 27 Feb 2020 15:52:59 +0000
Message-ID: <BYAPR11MB362461968CAAC427A185AC5CF2EB0@BYAPR11MB3624.namprd11.prod.outlook.com>
References: <cover.1582770011.git.gayatri.kammela@intel.com>
 <20200227095643.GB1224808@smile.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200227095643.GB1224808@smile.fi.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Somayaji, Vishwanath" <vishwanath.somayaji@intel.com>, "dvhart@infradead.org" <dvhart@infradead.org>, "Westerberg, Mika" <mika.westerberg@intel.com>, "peterz@infradead.org" <peterz@infradead.org>, "Prestopine, Charles D" <charles.d.prestopine@intel.com>, Chen Zhou <chenzhou10@huawei.com>, "Box, David E" <david.e.box@intel.com>
List-Id: platform-driver-x86.vger.kernel.org



> -----Original Message-----
> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Sent: Thursday, February 27, 2020 1:57 AM
> To: Kammela, Gayatri <gayatri.kammela@intel.com>
> Cc: platform-driver-x86@vger.kernel.org; linux-kernel@vger.kernel.org;
> Somayaji, Vishwanath <vishwanath.somayaji@intel.com>;
> dvhart@infradead.org; Westerberg, Mika <mika.westerberg@intel.com>;
> peterz@infradead.org; Prestopine, Charles D
> <charles.d.prestopine@intel.com>; Chen Zhou <chenzhou10@huawei.com>;
> Box, David E <david.e.box@intel.com>
> Subject: Re: [PATCH v1 0/4] platform/x86: intel_pmc_core: Add bug fixes o=
r
> code
>=20
> On Wed, Feb 26, 2020 at 06:43:26PM -0800, Gayatri Kammela wrote:
> > Hi,
> >
> > This patch series consists of bug fixes and code optimization for the
> > series https://patchwork.kernel.org/patch/11365325/
> >
> > Patch 1: Make pmc_core_lpm_display() generic Patch 2: Relocate both
> > pmc_core_slps0_display() and pmc_core_lpm_display() Patch 3: Remove
> > the duplicate if() condition to create debugfs entry Patch 4: Add back
> > slp_s0_offset attribute back to tgl_reg_map
>=20
> Let's do other way around, i.e. patch 2 as a first in the series, so I ma=
y fix the
> current (visible) issue.

Hi Andy,  sure I will change the order and send the version 2

>=20
> Then fix the kbuild bot complains and send the rest.

Sure, I will do that. Thanks!

>=20
> >
> > Gayatri Kammela (4):
> >   platform/x86: intel_pmc_core: fix: Make pmc_core_lpm_display() generi=
c
> >     for platforms that support sub-states
> >   platform/x86: intel_pmc_core: fix: Relocate pmc_core_slps0_display()
> >     and pmc_core_lpm_display() to outside of CONFIG_DEBUG_FS
> >   platform/x86: intel_pmc_core: fix: Remove the duplicate if() to creat=
e
> >     debugfs entry for substate_live_status_registers
> >   platform/x86: intel_pmc_core: fix: Add slp_s0_offset attribute back t=
o
> >     tgl_reg_map
> >
> >  drivers/platform/x86/intel_pmc_core.c | 131
> > +++++++++++++-------------
> >  1 file changed, 66 insertions(+), 65 deletions(-)
> >
> > Cc: Chen Zhou <chenzhou10@huawei.com>
> > Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Cc: David Box <david.e.box@intel.com>
> > --
> > 2.17.1
> >
>=20
> --
> With Best Regards,
> Andy Shevchenko
>=20

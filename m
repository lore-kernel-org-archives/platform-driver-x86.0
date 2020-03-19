From: "Kammela, Gayatri" <gayatri.kammela@intel.com>
Subject: RE: [PATCH v3 0/5] platform/x86: intel_pmc_core: Add bug fixes or
 code
Date: Thu, 19 Mar 2020 17:57:06 +0000
Message-ID: <BYAPR11MB3624F3CB24817BB8C5AE6C10F2F40@BYAPR11MB3624.namprd11.prod.outlook.com>
References: <cover.1583093898.git.gayatri.kammela@intel.com>
 <20200302125427.GV1224808@smile.fi.intel.com>
 <BYAPR11MB362421570806431752364CD3F2E70@BYAPR11MB3624.namprd11.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BYAPR11MB362421570806431752364CD3F2E70@BYAPR11MB3624.namprd11.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Somayaji, Vishwanath" <vishwanath.somayaji@intel.com>, "dvhart@infradead.org" <dvhart@infradead.org>, "Westerberg, Mika" <mika.westerberg@intel.com>, "peterz@infradead.org" <peterz@infradead.org>, "Prestopine, Charles D" <charles.d.prestopine@intel.com>, Chen Zhou <chenzhou10@huawei.com>, "Box, David E" <david.e.box@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

> -----Original Message-----
> From: Kammela, Gayatri
> Sent: Monday, March 2, 2020 10:29 AM
> To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: platform-driver-x86@vger.kernel.org; linux-kernel@vger.kernel.org;
> Somayaji, Vishwanath <vishwanath.somayaji@intel.com>;
> dvhart@infradead.org; Westerberg, Mika <mika.westerberg@intel.com>;
> peterz@infradead.org; Prestopine, Charles D
> <charles.d.prestopine@intel.com>; Chen Zhou <chenzhou10@huawei.com>;
> Box, David E <david.e.box@intel.com>
> Subject: RE: [PATCH v3 0/5] platform/x86: intel_pmc_core: Add bug fixes o=
r
> code
>=20
> > -----Original Message-----
> > From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Sent: Monday, March 2, 2020 4:54 AM
> > To: Kammela, Gayatri <gayatri.kammela@intel.com>
> > Cc: platform-driver-x86@vger.kernel.org; linux-kernel@vger.kernel.org;
> > Somayaji, Vishwanath <vishwanath.somayaji@intel.com>;
> > dvhart@infradead.org; Westerberg, Mika <mika.westerberg@intel.com>;
> > peterz@infradead.org; Prestopine, Charles D
> > <charles.d.prestopine@intel.com>; Chen Zhou
> <chenzhou10@huawei.com>;
> > Box, David E <david.e.box@intel.com>
> > Subject: Re: [PATCH v3 0/5] platform/x86: intel_pmc_core: Add bug
> > fixes or code
> >
> > On Sun, Mar 01, 2020 at 12:44:21PM -0800, Gayatri Kammela wrote:
> > > Hi,
> > >
> > > This patch series consists of bug fixes and code optimization for
> > > the series https://patchwork.kernel.org/patch/11365325/
> > >
> >
> > I had applied first four, the fifth requires additional work.
> > When send a new version, do it only for last one.
>=20
> Thanks Andy! I will send the 5th patch alone in new version.
>=20

Hi Andy! I see first 3 patches are merged in for-next branch on 2/28 but no=
t 4th patch. Can you please check? http://git.infradead.org/linux-platform-=
drivers-x86.git/shortlog/refs/heads/for-next

> >
> > > Patch 1: Relocate both pmc_core_slps0_display() and
> > > pmc_core_lpm_display() Patch 2: Remove the duplicate if() condition
> > > to create debugfs entry Patch 3: Add back slp_s0_offset attribute
> > > back to tgl_reg_map Patch 4: Make pmc_core_substate_res_show()
> > > generic Patch
> > > 5: Make pmc_core_lpm_display() generic
> > >
> > > Changes since v1:
> > > 1) Changed the order of the patches i.e., patch 2 in v1 is made first=
 in
> > >    the order for v2.
> > > 2) Fixed the warnings reported by kbuild test robot.
> > >
> > > Changes since v2:
> > > 1) Add "Make pmc_core_substate_res_show() generic" patch to v3.
> > > 2) Fixed the memory leak issue in pmc_core_lpm_display().
> > > 3) Moved patch 2 in v2 to the last in the series in v3.
> > >
> > > Gayatri Kammela (5):
> > >   platform/x86: intel_pmc_core: fix: Relocate pmc_core_slps0_display(=
)
> > >     and pmc_core_lpm_display() to outside of CONFIG_DEBUG_FS
> > >   platform/x86: intel_pmc_core: fix: Remove the duplicate if() to cre=
ate
> > >     debugfs entry for substate_live_status_registers
> > >   platform/x86: intel_pmc_core: fix: Add slp_s0_offset attribute back=
 to
> > >     tgl_reg_map
> > >   platform/x86: intel_pmc_core: Make pmc_core_substate_res_show()
> > >     generic
> > >   platform/x86: intel_pmc_core: fix: Make pmc_core_lpm_display()
> generic
> > >     for platforms that support sub-states
> > >
> > >  drivers/platform/x86/intel_pmc_core.c | 148 +++++++++++++++---------=
--
> > >  drivers/platform/x86/intel_pmc_core.h |   3 +-
> > >  2 files changed, 85 insertions(+), 66 deletions(-)
> > >
> > > base-commit: 7adb1e8aeeb5d4d88012568b2049599c1a247cf2
> > >
> > > Cc: Chen Zhou <chenzhou10@huawei.com>
> > > Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > Cc: David Box <david.e.box@intel.com>
> > > --
> > > 2.17.1
> > >
> >
> > --
> > With Best Regards,
> > Andy Shevchenko
> >

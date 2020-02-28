From: "Kammela, Gayatri" <gayatri.kammela@intel.com>
Subject: RE: [PATCH v2 2/4] platform/x86: intel_pmc_core: fix: Make
 pmc_core_lpm_display() generic for platforms that support sub-states
Date: Fri, 28 Feb 2020 17:33:30 +0000
Message-ID: <BYAPR11MB362462D69BEA6CC2EEA42A64F2E80@BYAPR11MB3624.namprd11.prod.outlook.com>
References: <cover.1582845395.git.gayatri.kammela@intel.com>
 <49e90f024d89746d5955331e023231149210917c.1582845395.git.gayatri.kammela@intel.com>
 <20200228100628.GJ1224808@smile.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200228100628.GJ1224808@smile.fi.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Somayaji, Vishwanath" <vishwanath.somayaji@intel.com>, "dvhart@infradead.org" <dvhart@infradead.org>, "Westerberg, Mika" <mika.westerberg@intel.com>, "peterz@infradead.org" <peterz@infradead.org>, "Prestopine, Charles D" <charles.d.prestopine@intel.com>, Chen Zhou <chenzhou10@huawei.com>, "Box, David E" <david.e.box@intel.com>
List-Id: platform-driver-x86.vger.kernel.org


> -----Original Message-----
> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Sent: Friday, February 28, 2020 2:06 AM
> To: Kammela, Gayatri <gayatri.kammela@intel.com>
> Cc: platform-driver-x86@vger.kernel.org; linux-kernel@vger.kernel.org;
> Somayaji, Vishwanath <vishwanath.somayaji@intel.com>;
> dvhart@infradead.org; Westerberg, Mika <mika.westerberg@intel.com>;
> peterz@infradead.org; Prestopine, Charles D
> <charles.d.prestopine@intel.com>; Chen Zhou <chenzhou10@huawei.com>;
> Box, David E <david.e.box@intel.com>
> Subject: Re: [PATCH v2 2/4] platform/x86: intel_pmc_core: fix: Make
> pmc_core_lpm_display() generic for platforms that support sub-states
>=20
> On Thu, Feb 27, 2020 at 03:29:14PM -0800, Gayatri Kammela wrote:
> > Currently pmc_core_lpm_display() uses array of struct pointers i.e.,
> > tgl_lpm_maps for Tiger Lake directly to iterate through and to get the
> > number of status/live status registers which is hardcoded and cannot
> > be re-used for future platforms that support sub-states. To maintain
> > readability, make pmc_core_lpm_display() generic, so that it can
> > re-used for future platforms.
>=20
> This patch need more work, see below.
> That said, I would prefer to see it last in the series for next version.


Sure, I will put this patch last in the series in v3.

>=20
> ...
>=20
> > +	lpm_regs =3D kmalloc_array(arr_size, sizeof(*lpm_regs), GFP_KERNEL);
>=20
> No error check?
> Besides that it is obvious memory leak.

Sorry my bad, I will put the check and free the memory. I will update this =
in v3

>=20
> > +	for (index =3D 0; maps[index]; index++) {
> >  		lpm_regs[index] =3D pmc_core_reg_read(pmcdev, offset);
> >  		offset +=3D 4;
> >  	}
>=20
> --
> With Best Regards,
> Andy Shevchenko
>=20

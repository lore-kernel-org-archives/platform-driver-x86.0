From: "Kammela, Gayatri" <gayatri.kammela@intel.com>
Subject: RE: [PATCH v3 7/7] platform/x86: Add Comet Lake (CML) platform
 support to intel_pmc_core driver
Date: Mon, 18 Nov 2019 18:06:24 +0000
Message-ID: <MN2PR11MB37116883BFC29257FD6E9647F24D0@MN2PR11MB3711.namprd11.prod.outlook.com>
References: <cover.1573750525.git.gayatri.kammela@intel.com>
 <d43af9c7b3c536c489cdb925adb2204256099952.1573750525.git.gayatri.kammela@intel.com>
 <3acd91d2694c456da2af7256ed1dcf9c@AUSX13MPC105.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3acd91d2694c456da2af7256ed1dcf9c@AUSX13MPC105.AMER.DELL.COM>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "Mario.Limonciello@dell.com" <Mario.Limonciello@dell.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Cc: "Somayaji, Vishwanath" <vishwanath.somayaji@intel.com>, "dvhart@infradead.org" <dvhart@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Prestopine, Charles D" <charles.d.prestopine@intel.com>, "peterz@infradead.org" <peterz@infradead.org>, "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>, "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, "Liang, Kan" <kan.liang@intel.com>, "Box, David E" <david.e.box@intel.com>, "Bhardwaj, Rajneesh" <rajneesh.bhardwaj@intel.com>, "Luck, Tony" <tony.luck@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

> >  /* Cannon Lake: PGD PFET Enable Ack Status Register(s) bitmap */
> > static const struct pmc_bit_map cnp_pfear_map[] =3D {
> > +	/* Reserved for Cannon Lake but valid for Comet Lake */
> >  	{"PMC",                 BIT(0)},
> >  	{"OPI-DMI",             BIT(1)},
> >  	{"SPI/eSPI",            BIT(2)},
> > @@ -879,6 +880,8 @@ static const struct x86_cpu_id intel_pmc_core_ids[]
> =3D {
> >  	INTEL_CPU_FAM6(TIGERLAKE_L, tgl_reg_map),
> >  	INTEL_CPU_FAM6(TIGERLAKE, tgl_reg_map),
> >  	INTEL_CPU_FAM6(ATOM_TREMONT, tgl_reg_map),
> > +	INTEL_CPU_FAM6(COMETLAKE, cnp_reg_map),
> > +	INTEL_CPU_FAM6(COMETLAKE_L, cnp_reg_map),
> >  	{}
> >  };
> >
>=20
> Just a nit, that I'm not sure if there is a policy around.
> Shouldn't the order of these reflect the actual order they're available t=
o the
> marketplace?  So CML may want to come earlier in the patch series to refl=
ect
> that aspect.
 Hi Mario,  agreed! I will send this patch separately from the series as th=
is is an urgent request from Dell.

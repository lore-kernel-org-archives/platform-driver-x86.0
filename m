From: "Kammela, Gayatri" <gayatri.kammela@intel.com>
Subject: RE: [PATCH v1 0/7] platform/x86: intel_pmc_core: Add debugfs entries
Date: Tue, 4 Feb 2020 23:10:49 +0000
Message-ID: <BYAPR11MB362427151E22D623A1B48E37F2030@BYAPR11MB3624.namprd11.prod.outlook.com>
References: <cover.1579890793.git.gayatri.kammela@intel.com>
 <CAHp75Vfb38BEh2OZkO2EoQgCyBxaLoiwh8S_qKiPQRX1g+ZA2Q@mail.gmail.com>
 <BL0PR11MB31071AD85775C09B8EC26608F20B0@BL0PR11MB3107.namprd11.prod.outlook.com>
 <CAHp75VeRAWsqxfjOxw97SBPRLvcyF=SGrN84hT=UUNC6yQ6-_A@mail.gmail.com>
 <BL0PR11MB3107F8D50FCADD168EAA9E7BF2030@BL0PR11MB3107.namprd11.prod.outlook.com>
 <20200204113414.GB10400@smile.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200204113414.GB10400@smile.fi.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Somayaji, Vishwanath" <vishwanath.somayaji@intel.com>, Darren Hart <dvhart@infradead.org>, "Westerberg, Mika" <mika.westerberg@intel.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, "Prestopine, Charles D" <charles.d.prestopine@intel.com>, "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>, "Box, David E" <david.e.box@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

> > > > > It doesn't apply to our for-next branch.
> > > > Sorry to hear that. I've rebased the series on mainline 5.5-rc7.
> > > > Should I
> > > rebase it on for-next branch?
> > >
> > > You should always base your branch on the for-next (whatever it's
> > > being
> > > called) of the subsystem your series against of.
> >
> > Hi Andy,
> >
> > The current series has a dependency on Tiger Lake and Elkhart Lake patc=
he
> which is merged in to mainline.
> >
> > (554f269f0f38 platform/x86: intel_pmc_core: Add Intel Elkhart Lake
> > support 49a437941c3f platform/x86: intel_pmc_core: Add Intel Tiger
> > Lake support
> > 6268c0b278b5 platform/x86: intel_pmc_core: Make debugfs entry for
> > pch_ip_power_gating_status conditional
> > e39854781830 platform/x86: intel_pmc_core: Create platform dependent
> > bitmap structs
> > b1cb33dae414 platform/x86: intel_pmc_core: Clean up: Remove comma
> > after the termination line)
> >
> > But they are not available in for-next branch. I am confused, how that =
could
> be the case. For me to base the current series on for-next branch, the
> dependency patch series should be available in for-next branch.
>=20
> I'm wondering how did you check it?
> The branch location is in this [1] tree.

Thank you for your patience Andy. I apologize for the mishap as I was check=
ing in the wrong tree. I have rebased the series on for-next branch on righ=
t tree this time and sent v2.

>=20
> [1]: http://git.infradead.org/linux-platform-drivers-x86.git
>=20
> --
> With Best Regards,
> Andy Shevchenko
>=20

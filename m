From: "Kammela, Gayatri" <gayatri.kammela@intel.com>
Subject: RE: [PATCH v1 1/4] acpi: dptf: Add new Tiger Lake hardware IDs to
 support DPTF drivers in acpi
Date: Fri, 13 Dec 2019 17:54:07 +0000
Message-ID: <DM5PR11MB1274745919B8F1A51B60BE98F2540@DM5PR11MB1274.namprd11.prod.outlook.com>
References: <cover.1576189376.git.gayatri.kammela@intel.com>
 <baaa3d7d1d1129a31c5a000578d1ad8198ca3881.1576189376.git.gayatri.kammela@intel.com>
 <20191213093437.GO32742@smile.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191213093437.GO32742@smile.fi.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "alex.hung@canonical.com" <alex.hung@canonical.com>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, "lenb@kernel.org" <lenb@kernel.org>, "rjw@rjwysocki.net" <rjw@rjwysocki.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, "amit.kucheria@verdurent.com" <amit.kucheria@verdurent.com>, "Prestopine, Charles D" <charles.d.prestopine@intel.com>, "dvhart@infradead.org" <dvhart@infradead.org>, "Zhang, Rui" <rui.zhang@intel.com>, "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

> On Thu, Dec 12, 2019 at 02:37:17PM -0800, Gayatri Kammela wrote:
> > Tiger Lake has new unique hardware IDs that are needed to support DPTF
> > drivers. Hence, add them.
>=20
> >  	{"INT3407", 0},
> > +	{"INT1047", 0},
>=20
> Can we keep them in sorted order?
Thanks Andy! I will keep them in sorted order for all the patches in the se=
ries in v2
>=20
> >  	{"INT3409"},
> >  	{"INT340A"},
> >  	{"INT340B"},
> > +	{"INT1040"},
> > +	{"INT1043"},
> > +	{"INT1044"},
> > +	{"INT1047"},
>=20
> Ditto.
>=20
> --
> With Best Regards,
> Andy Shevchenko
>=20

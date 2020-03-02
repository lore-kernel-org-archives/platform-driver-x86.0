From: "Kammela, Gayatri" <gayatri.kammela@intel.com>
Subject: RE: [PATCH v3 5/5] platform/x86: intel_pmc_core: fix: Make
 pmc_core_lpm_display() generic for platforms that support sub-states
Date: Mon, 2 Mar 2020 18:57:04 +0000
Message-ID: <BYAPR11MB3624E93E7E8D8FF291051508F2E70@BYAPR11MB3624.namprd11.prod.outlook.com>
References: <cover.1583093898.git.gayatri.kammela@intel.com>
 <5e28f488a6cc8b7c1e08b536868844b586a1eaf1.1583093898.git.gayatri.kammela@intel.com>
 <20200302125343.GU1224808@smile.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200302125343.GU1224808@smile.fi.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Somayaji, Vishwanath" <vishwanath.somayaji@intel.com>, "dvhart@infradead.org" <dvhart@infradead.org>, "Westerberg, Mika" <mika.westerberg@intel.com>, "peterz@infradead.org" <peterz@infradead.org>, "Prestopine, Charles D" <charles.d.prestopine@intel.com>, Chen Zhou <chenzhou10@huawei.com>, "Box, David E" <david.e.box@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

> -----Original Message-----
> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Sent: Monday, March 2, 2020 4:54 AM
> To: Kammela, Gayatri <gayatri.kammela@intel.com>
> Cc: platform-driver-x86@vger.kernel.org; linux-kernel@vger.kernel.org;
> Somayaji, Vishwanath <vishwanath.somayaji@intel.com>;
> dvhart@infradead.org; Westerberg, Mika <mika.westerberg@intel.com>;
> peterz@infradead.org; Prestopine, Charles D
> <charles.d.prestopine@intel.com>; Chen Zhou <chenzhou10@huawei.com>;
> Box, David E <david.e.box@intel.com>
> Subject: Re: [PATCH v3 5/5] platform/x86: intel_pmc_core: fix: Make
> pmc_core_lpm_display() generic for platforms that support sub-states
>=20
> On Sun, Mar 01, 2020 at 12:44:26PM -0800, Gayatri Kammela wrote:
> > Currently pmc_core_lpm_display() uses array of struct pointers i.e.,
> > tgl_lpm_maps for Tiger Lake directly to iterate through and to get the
> > number of status/live status registers which is hardcoded and cannot
> > be re-used for future platforms that support sub-states. To maintain
> > readability, make pmc_core_lpm_display() generic, so that it can
> > re-used for future platforms.
>=20
> My comments below.

Thanks Andy! for the comments.

>=20
> ...
>=20
> > +static int pmc_core_lpm_get_arr_size(const struct pmc_bit_map **maps)
> > +{
> > +	int idx, arr_size =3D 0;
>=20
> And why do you need arr_size variable at all?

I could just return idx value at the end of the for loop. I will remove the=
 arr_size variable.

>=20
> > +
> > +	for (idx =3D 0; maps[idx]; idx++)
> > +		arr_size++;
> > +
> > +	return arr_size;
> > +}
>=20
> ...
>=20
> > -	int index, idx, len =3D 32, bit_mask;
> > +	int index, idx, bit_mask, len =3D 32;
>=20
> What's the point of shuffling this?

Just wanted to have all uninitialized variables declared before initialized=
 ones. I will just leave this out in v4.

>=20
> > +	int arr_size =3D pmc_core_lpm_get_arr_size(maps);
>=20
> This would be better in a split manner, i.e.
>=20
> 	int arr_size;
>=20
> 	...
>=20
> 	arr_size =3D ...;

Sure, I will make this change in v4

>=20
> ...
>=20
> > +	lpm_regs =3D kmalloc_array(arr_size, sizeof(*lpm_regs), GFP_KERNEL);
> > +	if(!lpm_regs)
>=20
> > +		goto err;
>=20
> There is no point to have the label. Simple return will work.

Thought adding a label will help not to have multiple kfree() in the same f=
unction (one here at the check and one at the end of the for loop) I will a=
dd a return.

>=20
> > -	for (index =3D 0; tgl_lpm_maps[index]; index++) {
> > +	for (index =3D 0; maps[index]; index++) {
>=20
> Why not to reuse arr_size here?

Good point! I missed it. I will use the arr_size here to iterate.

>=20
> >  		lpm_regs[index] =3D pmc_core_reg_read(pmcdev, offset);
> >  		offset +=3D 4;
> >  	}
>=20
> --
> With Best Regards,
> Andy Shevchenko
>=20

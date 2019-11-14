From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH v3 7/7] platform/x86: Add Comet Lake (CML) platform
 support to intel_pmc_core driver
Date: Thu, 14 Nov 2019 18:50:20 +0000
Message-ID: <3acd91d2694c456da2af7256ed1dcf9c@AUSX13MPC105.AMER.DELL.COM>
References: <cover.1573750525.git.gayatri.kammela@intel.com>
 <d43af9c7b3c536c489cdb925adb2204256099952.1573750525.git.gayatri.kammela@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d43af9c7b3c536c489cdb925adb2204256099952.1573750525.git.gayatri.kammela@intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: gayatri.kammela@intel.com, platform-driver-x86@vger.kernel.org
Cc: vishwanath.somayaji@intel.com, dvhart@infradead.org, linux-kernel@vger.kernel.org, charles.d.prestopine@intel.com, peterz@infradead.org, srinivas.pandruvada@intel.com, andriy.shevchenko@linux.intel.com, kan.liang@intel.com, david.e.box@intel.com, rajneesh.bhardwaj@intel.com, tony.luck@intel.com
List-Id: platform-driver-x86.vger.kernel.org

> -----Original Message-----
> From: platform-driver-x86-owner@vger.kernel.org <platform-driver-x86-
> owner@vger.kernel.org> On Behalf Of Gayatri Kammela
> Sent: Thursday, November 14, 2019 11:01 AM
> To: platform-driver-x86@vger.kernel.org
> Cc: vishwanath.somayaji@intel.com; dvhart@infradead.org; linux-
> kernel@vger.kernel.org; charles.d.prestopine@intel.com; Gayatri Kammela; =
Peter
> Zijlstra; Srinivas Pandruvada; Andy Shevchenko; Kan Liang; David E . Box;=
 Rajneesh
> Bhardwaj; Tony Luck
> Subject: [PATCH v3 7/7] platform/x86: Add Comet Lake (CML) platform suppo=
rt to
> intel_pmc_core driver
>=20
>=20
> [EXTERNAL EMAIL]
>=20
> Add Comet Lake to the list of the platforms that intel_pmc_core driver
> supports for pmc_core device.
>=20
> Just like Ice Lake, Tiger Lake and Elkhart Lake, Comet Lake can also
> reuse all the Cannon Lake PCH IPs. No additional effort is needed to
> enable but to simply reuse them.
>=20
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Srinivas Pandruvada <srinivas.pandruvada@intel.com>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Kan Liang <kan.liang@intel.com>
> Cc: David E. Box <david.e.box@intel.com>
> Cc: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
> Cc: Tony Luck <tony.luck@intel.com>
> Signed-off-by: Gayatri Kammela <gayatri.kammela@intel.com>
> ---
>  drivers/platform/x86/intel_pmc_core.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/platform/x86/intel_pmc_core.c
> b/drivers/platform/x86/intel_pmc_core.c
> index 94081710e0de..a9b33ac4e52d 100644
> --- a/drivers/platform/x86/intel_pmc_core.c
> +++ b/drivers/platform/x86/intel_pmc_core.c
> @@ -165,6 +165,7 @@ static const struct pmc_reg_map spt_reg_map =3D {
>=20
>  /* Cannon Lake: PGD PFET Enable Ack Status Register(s) bitmap */
>  static const struct pmc_bit_map cnp_pfear_map[] =3D {
> +	/* Reserved for Cannon Lake but valid for Comet Lake */
>  	{"PMC",                 BIT(0)},
>  	{"OPI-DMI",             BIT(1)},
>  	{"SPI/eSPI",            BIT(2)},
> @@ -879,6 +880,8 @@ static const struct x86_cpu_id intel_pmc_core_ids[] =
=3D {
>  	INTEL_CPU_FAM6(TIGERLAKE_L, tgl_reg_map),
>  	INTEL_CPU_FAM6(TIGERLAKE, tgl_reg_map),
>  	INTEL_CPU_FAM6(ATOM_TREMONT, tgl_reg_map),
> +	INTEL_CPU_FAM6(COMETLAKE, cnp_reg_map),
> +	INTEL_CPU_FAM6(COMETLAKE_L, cnp_reg_map),
>  	{}
>  };
>=20

Just a nit, that I'm not sure if there is a policy around.
Shouldn't the order of these reflect the actual order they're available to =
the
marketplace?  So CML may want to come earlier in the patch series to reflec=
t
that aspect.

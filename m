From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v6] platform:x86: Add PMC Driver for Intel Core SoC
Date: Wed, 25 May 2016 13:13:53 -0700
Message-ID: <20160525201353.GA109010@f23x64.localdomain>
References: <1464198292-32356-1-git-send-email-rajneesh.bhardwaj@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:54029 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751042AbcEYUNx (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 25 May 2016 16:13:53 -0400
Content-Disposition: inline
In-Reply-To: <1464198292-32356-1-git-send-email-rajneesh.bhardwaj@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Cc: platform-driver-x86@vger.kernel.org, andriy.shevchenko@linux.intel.com, linux-kernel@vger.kernel.org, olof@lixom.net, tglx@linutronix.de, hpa@zytor.com, dbasehore@google.com, vishwanath.somayaji@intel.com

On Wed, May 25, 2016 at 11:14:52PM +0530, Rajneesh Bhardwaj wrote:
> This patch adds the Power Management Controller driver as a PCI drive=
r
> for Intel Core SoC architecture.
>=20
> This driver can utilize debugging capabilities and supported features
> as exposed by the Power Management Controller.
>=20
> Please refer to the below specification for more details on PMC featu=
res.
> http://www.intel.in/content/www/in/en/chipsets/100-series-chipset-dat=
asheet-vol-2.html
>=20
> The current version of this driver exposes SLP_S0_RESIDENCY counter.
> This counter can be used for detecting fragile SLP_S0 signal related
> failures and take corrective actions when PCH SLP_S0 signal is not
> asserted after kernel freeze as part of suspend to idle flow
> (echo freeze > /sys/power/state).
>=20
> Intel Platform Controller Hub (PCH) asserts SLP_S0 signal when it
> detects favorable conditions to enter its low power mode. As a
> pre-requisite the SoC should be in deepest possible Package C-State
> and devices should be in low power mode. For example, on Skylake SoC
> the deepest Package C-State is Package C10 or PC10. Suspend to idle
> flow generally leads to PC10 state but PC10 state may not be sufficie=
nt
> for realizing the platform wide power potential which SLP_S0 signal
> assertion can provide.
>=20
> SLP_S0 signal is often connected to the Embedded Controller (EC) and =
the
> Power Management IC (PMIC) for other platform power management relate=
d
> optimizations.
>=20
> In general, SLP_S0 assertion =3D=3D PC10 + PCH low power mode + ModPh=
y Lanes
> power gated + PLL Idle.
>=20
> As part of this driver, a mechanism to read the SLP_S0_RESIDENCY is e=
xposed
> as an API and also debugfs features are added to indicate SLP_S0 sign=
al
> assertion residency in microseconds.
>=20
> echo freeze > /sys/power/state
> wake the system
> cat /sys/kernel/debug/pmc_core/slp_s0_residency_usec
>=20
> Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
> Signed-off-by: Vishwanath Somayaji <vishwanath.somayaji@intel.com>

Hi Rajneesh,

Unfortunately during my build test, this introduced a new warning to th=
e build:

drivers/platform/x86/intel_pmc_core.c:201:19: warning: =E2=80=98intel_p=
mc_core_init=E2=80=99
defined but not used [-Wunused-function]
 static int __init intel_pmc_core_init(void)

After the removal of the module stuff, the driver needed a device_initc=
all, or
the macro equivalent, consider:

$ git diff
diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x=
86/intel_pmc_core.c
index c834281..f6a29b9 100644
--- a/drivers/platform/x86/intel_pmc_core.c
+++ b/drivers/platform/x86/intel_pmc_core.c
@@ -198,7 +198,4 @@ static struct pci_driver intel_pmc_core_driver =3D =
{
        .remove =3D NULL, /* not a hot-plug capable driver */
 };

-static int __init intel_pmc_core_init(void)
-{
-       return pci_register_driver(&intel_pmc_core_driver);
-}
+builtin_pci_driver(intel_pmc_core_driver);

--=20
Darren Hart
Intel Open Source Technology Center

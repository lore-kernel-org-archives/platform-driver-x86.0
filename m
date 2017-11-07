From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH 0/2] Account for uncorrectable failures in probing
Date: Tue, 7 Nov 2017 16:17:06 +0000
Message-ID: <c0175daf13144831ba320b66721da344@ausx13mpc120.AMER.DELL.COM>
References: <cover.1509725778.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1509725778.git.mario.limonciello@dell.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: pali.rohar@gmail.com
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, dvhart@infradead.org, andy.shevchenko@gmail.com
List-Id: platform-driver-x86.vger.kernel.org

> -----Original Message-----
> From: Limonciello, Mario
> Sent: Friday, November 3, 2017 11:27 AM
> To: dvhart@infradead.org; Andy Shevchenko <andy.shevchenko@gmail.com>
> Cc: LKML <linux-kernel@vger.kernel.org>; platform-driver-x86@vger.kernel.=
org;
> pali.rohar@gmail.com; Limonciello, Mario <Mario_Limonciello@Dell.com>
> Subject: [PATCH 0/2] Account for uncorrectable failures in probing
>=20
> Pali raised some concerns around corner case scenarios that probing
> may fail on dell-wmi-descriptor causing dell-wmi and dell-smbios-wmi
> to be stuck in infinite deferred probing loops.
>=20
> This patch series accounts for that corner case.
>=20
> Changes since original submission:
> - Add as second patch that catches potential NULL pointer
> - Avoid potential race condition between driver init and calling
>   check for if validation successful
> Mario Limonciello (2):
>   platform/x86: dell-wmi-descriptor: check if memory was allocated
>   platform/x86: dell-*wmi*: Relay failed initial probe to dependent
>     drivers
>=20
>  drivers/platform/x86/dell-smbios-wmi.c     |  4 ++++
>  drivers/platform/x86/dell-wmi-descriptor.c | 16 ++++++++++++++++
>  drivers/platform/x86/dell-wmi-descriptor.h |  7 +++++++
>  drivers/platform/x86/dell-wmi.c            |  5 +++++
>  4 files changed, 32 insertions(+)
>=20
> --
> 2.14.1

Pali,

Did you have any thoughts on these two patches?  I believe they should=20
account for the concerns you raised regarding the corner cases with=20
probing in my series.

The series is queued up in the platform-drivers-x86 testing branch and
they are intended to be on top of that.

Thanks,

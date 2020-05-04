From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH 0/5] platform/x86: intel-vbtn: Fixes + rework to make it
 work on more devices
Date: Mon, 4 May 2020 15:38:58 +0000
Message-ID: <e729ee1142a94fd394e0dbfb84e52a4b@AUSX13MPC101.AMER.DELL.COM>
References: <20200502182951.114231-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200502182951.114231-1-hdegoede@redhat.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: hdegoede@redhat.com, dvhart@infradead.org, andy@infradead.org
Cc: linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

> -----Original Message-----
> From: Hans de Goede <hdegoede@redhat.com>
> Sent: Saturday, May 2, 2020 1:30 PM
> To: Darren Hart; Andy Shevchenko; Limonciello, Mario
> Cc: Hans de Goede; linux-acpi@vger.kernel.org; platform-driver-
> x86@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: [PATCH 0/5] platform/x86: intel-vbtn: Fixes + rework to make it =
work
> on more devices
>=20
>=20
> [EXTERNAL EMAIL]
>=20
> Hi All,
>=20
> Here is a series of fixes, mostly aimed at fixing commit: de9647efeaa9
> ("platform/x86: intel-vbtn: Only activate tablet mode switch on 2-in-1's"=
)
> causing the driver to not bind on some devices where it could and
> should report SW_TABLET_MODE.
>=20
> The last commit makes the driver also work on some devices where it
> previously would not work because they lack a VBDL method.
>=20
> Mario, can you test this on a Dell XPS 9360 (for which you wrote the
> de9647efeaa9 commit) to ensure that this series does not cause a
> regression there?

Unfortunately I can't double check that with WFH, I don't have access to th=
is hardware.

> Also I have a question for you about using the DMI
> chassis-type for this / a proposal for dealing with this differently
> below the '---' of the commit msg of the 4th patch.


OK will look.

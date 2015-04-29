From: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Subject: Re: [PATCH v2 1/3] platform: x86: dell-rbtn: Dell Airplane Mode Switch driver
Date: Wed, 29 Apr 2015 12:30:32 +0200
Message-ID: <37641224.OJKZVtGCPV@xps13>
References: <1416755361-17357-1-git-send-email-pali.rohar@gmail.com> <1430301066-22870-1-git-send-email-pali.rohar@gmail.com> <1430301066-22870-2-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430301066-22870-2-git-send-email-pali.rohar@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pali =?ISO-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Alex Hung <alex.hung@canonical.com>
List-Id: platform-driver-x86.vger.kernel.org

On Wednesday 29 April 2015 11:51:04 Pali Roh=E1r wrote:
> This is an ACPI driver for Dell laptops which receive HW switch event=
s.
> It exports rfkill device dell-rbtn which provide correct hard rfkill =
state.
>=20
> Alex Hung added code for supporting Dell laptops which have toggle bu=
tton
> instead HW slider switch. On these laptops toggle button event is rep=
orted
> by new input device (instead rfkill) as they do not have hw radio swi=
tch.
>=20
> It looks like those are two different functions (rfkill, input device=
), but
> Dell BIOS exports them via same ACPI device and uses same ACPI functi=
ons.
> So code is in one kernel driver.

I made a patch some time ago that I've just adapted. It allows to
prefer RBTN_SLIDER over RBTN_TOGGLE. The main reason why I'd like to
have the hardware switch is that the BIOS doesn't alter the soft state
of the devices. This comes in handy when the function key controls
multiple radio devices.

Here below the simple patch. Maybe I could improve it and allow a
dynamic switch between RBTN_TOGGLE and RBTN_SLIDER.


=46rom 35d39a4ad079489147b4ce22651c5e4e18856cf0 Mon Sep 17 00:00:00 200=
1
=46rom: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Date: Wed, 29 Apr 2015 12:24:52 +0200
Subject: [PATCH] dell-rbtn: Add module param to force the radio hardwar=
e
 switch

dell-rbtn determines whether the BIOS controls the radio devices when
function keys are pressed by calling the ACPI method CRBT. As long as
the ACPI method ARBT is called with 1 as argument, we are sure that
what is returned by CRBT holds.

This patch adds the possibility to pass a parameter that will make
dell-rbtn ignore the value returned by CRBT and call ARBT with 0 as
argument. This will allow users to have the BIOS control the radio
devices. Since there is no way to know when this is possible, it's
up to the user to force the mode. This guarantees the correct
functionality of the driver except when the user forces the mode.
---
 drivers/platform/x86/dell-rbtn.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell-rbtn.c b/drivers/platform/x86/de=
ll-rbtn.c
index 07dfd8f..8f8d62b 100644
--- a/drivers/platform/x86/dell-rbtn.c
+++ b/drivers/platform/x86/dell-rbtn.c
@@ -30,6 +30,8 @@ struct rbtn_data {
 	struct input_dev *input_dev;
 };
=20
+static bool force_hw_switch;
+module_param(force_hw_switch, bool, S_IRUGO);
=20
 /*
  * acpi functions
@@ -44,6 +46,9 @@ static enum rbtn_type rbtn_check(struct acpi_device *=
device)
 	if (ACPI_FAILURE(status))
 		return RBTN_UNKNOWN;
=20
+	if (force_hw_switch)
+		return RBTN_SLIDER;
+
 	switch (output) {
 	case 0:
 	case 1:
@@ -321,7 +326,7 @@ static int rbtn_add(struct acpi_device *device)
 		return -EINVAL;
 	}
=20
-	ret =3D rbtn_radio_enable(device, true);
+	ret =3D rbtn_radio_enable(device, !force_hw_switch);
 	if (ret < 0) {
 		dev_err(&device->dev, "Cannot enable device\n");
 		return ret;
--=20
2.1.4

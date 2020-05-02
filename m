From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 4/5] platform/x86: intel-vbtn: Also handle tablet-mode switch on "Detachable" and "Portable" chassis-types
Date: Sat,  2 May 2020 20:29:50 +0200
Message-ID: <20200502182951.114231-5-hdegoede@redhat.com>
References: <20200502182951.114231-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200502182951.114231-1-hdegoede@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Mario Limonciello <mario.limonciello@dell.com>
Cc: Hans de Goede <hdegoede@redhat.com>, linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Commit de9647efeaa9 ("platform/x86: intel-vbtn: Only activate tablet mode
switch on 2-in-1's") added a DMI chassis-type check to avoid accidentally
reporting SW_TABLET_MODE =3D 1 to userspace on laptops.

Some devices with a detachable keyboard and using the intel-vbnt (INT33D6=
)
interface to report if they are in tablet mode (keyboard detached) or not=
,
report 32 / "Detachable" as chassis-type, e.g. the HP Pavilion X2 series.

Other devices with a detachable keyboard and using the intel-vbnt (INT33D=
6)
interface to report SW_TABLET_MODE, report 8 / "Portable" as chassis-type=
.
The Dell Venue 11 Pro 7130 is an example of this.

Extend the DMI chassis-type check to also accept Portables and Detachable=
s
so that the intel-vbtn driver will report SW_TABLET_MODE on these devices=
.

Note the chassis-type check was originally added to avoid a false-positiv=
e
tablet-mode report on the Dell XPS 9360 laptop. To the best of my knowled=
ge
that laptop is using a chassis-type of 9 / "Laptop", so after this commit
we still ignore the tablet-switch for that chassis-type.

Fixes: de9647efeaa9 ("platform/x86: intel-vbtn: Only activate tablet mode=
 switch on 2-in-1's")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Looking at the Microsoft Windows documentation for tablet-mode reporting:
https://docs.microsoft.com/en-us/windows-hardware/drivers/gpiobtn/button-=
implementation

Then the presence of a tablet-mode switch is indicated by the presence
of a PNP0C60 compatible ACPI devices. There are 2 ways in which this devi=
ce
can report the tablet-mode. 1. Directly providing a GpioInt resource insi=
de
the PNP0C60 device, 2. Through injecting events from a Windows driver.

It seems that the intel-vbtn / the INT33D6 ACPI device is the ACPI side
of Intel's generic solution for the case where the tablet-mode comes from
the embedded-controller and needs to be "injected".

This all suggests that it might be better to replace the chassis-type
check with a acpi_dev_present("PNP0C60", NULL, -1) check.

Mario, can you provide an acpidump and alsa-info.sh output for the
Dell XPS 9360, so that I can check if that might help with the issue
there, and thus is a potential candidate to replace the chassis-type
check?
---
 drivers/platform/x86/intel-vbtn.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel-vbtn.c b/drivers/platform/x86/int=
el-vbtn.c
index 500fae82e12c..4921fc15dc6c 100644
--- a/drivers/platform/x86/intel-vbtn.c
+++ b/drivers/platform/x86/intel-vbtn.c
@@ -158,12 +158,22 @@ static void detect_tablet_mode(struct platform_devi=
ce *device)
 static bool intel_vbtn_has_switches(acpi_handle handle)
 {
 	const char *chassis_type =3D dmi_get_system_info(DMI_CHASSIS_TYPE);
+	unsigned long chassis_type_int;
 	unsigned long long vgbs;
 	acpi_status status;
=20
-	if (!(chassis_type && strcmp(chassis_type, "31") =3D=3D 0))
+	if (kstrtoul(chassis_type, 10, &chassis_type_int))
 		return false;
=20
+	switch (chassis_type_int) {
+	case  8: /* Portable */
+	case 31: /* Convertible */
+	case 32: /* Detachable */
+		break;
+	default:
+		return false;
+	}
+
 	status =3D acpi_evaluate_integer(handle, "VGBS", NULL, &vgbs);
 	return ACPI_SUCCESS(status);
 }
--=20
2.26.0

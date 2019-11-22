From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 2/2] platform/x86: hp-wmi: Fix ACPI errors caused by passing 0 as input size
Date: Fri, 22 Nov 2019 19:56:41 +0100
Message-ID: <20191122185641.60711-2-hdegoede@redhat.com>
References: <20191122185641.60711-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20191122185641.60711-1-hdegoede@redhat.com>
Sender: stable-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

The AML code implementing the WMI methods creates a variable length
field to hold the input data we pass like this:

        CreateDWordField (Arg1, 0x0C, DSZI)
        Local5 =3D DSZI /* \HWMC.DSZI */
        CreateField (Arg1, 0x80, (Local5 * 0x08), DAIN)

If we pass 0 as bios_args.datasize argument then (Local5 * 0x08)
is 0 which results in these errors:

[   71.973305] ACPI BIOS Error (bug): Attempt to CreateField of length zero=
 (20190816/dsopcode-133)
[   71.973332] ACPI Error: Aborting method \HWMC due to previous error (AE_=
AML_OPERAND_VALUE) (20190816/psparse-529)
[   71.973413] ACPI Error: Aborting method \_SB.WMID.WMAA due to previous e=
rror (AE_AML_OPERAND_VALUE) (20190816/psparse-529)

And in our HPWMI_WIRELESS2_QUERY calls always failing. for read commands
like HPWMI_WIRELESS2_QUERY the DSZI value is not used / checked, except for
read commands where extra input is needed to specify exactly what to read.

So for HPWMI_WIRELESS2_QUERY we can safely pass the size of the expected
output as insize to hp_wmi_perform_query(), as we are already doing for all
other HPWMI_READ commands we send. Doing so fixes these errors.

Cc: stable@vger.kernel.org
BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=3D197007
BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=3D201981
BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=3D1520703
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/hp-wmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index e64ae58ec22b..9579a706fc08 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -380,7 +380,7 @@ static int hp_wmi_rfkill2_refresh(void)
 =09int err, i;
=20
 =09err =3D hp_wmi_perform_query(HPWMI_WIRELESS2_QUERY, HPWMI_READ, &state,
-=09=09=09=09   0, sizeof(state));
+=09=09=09=09   sizeof(state), sizeof(state));
 =09if (err)
 =09=09return err;
=20
@@ -778,7 +778,7 @@ static int __init hp_wmi_rfkill2_setup(struct platform_=
device *device)
 =09int err, i;
=20
 =09err =3D hp_wmi_perform_query(HPWMI_WIRELESS2_QUERY, HPWMI_READ, &state,
-=09=09=09=09   0, sizeof(state));
+=09=09=09=09   sizeof(state), sizeof(state));
 =09if (err)
 =09=09return err < 0 ? err : -EINVAL;
=20
--=20
2.23.0

From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 1/2] platform/x86: hp-wmi: Fix ACPI errors caused by too small buffer
Date: Fri, 22 Nov 2019 19:56:40 +0100
Message-ID: <20191122185641.60711-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

The HP WMI calls may take up to 128 bytes of data as input, and
the AML methods implementing the WMI calls, declare a couple of fields for
accessing input in different sizes, specifycally the HWMC method contains:

        CreateField (Arg1, 0x80, 0x0400, D128)

Even though we do not use any of the WMI command-types which need a buffer
of this size, the APCI interpreter still tries to create it as it is
declared in generoc code at the top of the HWMC method which runs before
the code looks at which command-type is requested.

This results in many of these errors on many different HP laptop models:

[   14.459261] ACPI Error: Field [D128] at 1152 exceeds Buffer [NULL] size =
160 (bits) (20170303/dsopcode-236)
[   14.459268] ACPI Error: Method parse/execution failed [\HWMC] (Node ffff=
8edcc61507f8), AE_AML_BUFFER_LIMIT (20170303/psparse-543)
[   14.459279] ACPI Error: Method parse/execution failed [\_SB.WMID.WMAA] (=
Node ffff8edcc61523c0), AE_AML_BUFFER_LIMIT (20170303/psparse-543)

This commit increases the size of the data element of the bios_args struct
to 128 bytes fixing these errors.

Cc: stable@vger.kernel.org
BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=3D197007
BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=3D201981
BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=3D1520703
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/hp-wmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index 6bcbbb375401..e64ae58ec22b 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -65,7 +65,7 @@ struct bios_args {
 =09u32 command;
 =09u32 commandtype;
 =09u32 datasize;
-=09u32 data;
+=09u8 data[128];
 };
=20
 enum hp_wmi_commandtype {
@@ -216,7 +216,7 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_=
command command,
 =09=09.command =3D command,
 =09=09.commandtype =3D query,
 =09=09.datasize =3D insize,
-=09=09.data =3D 0,
+=09=09.data =3D { 0 },
 =09};
 =09struct acpi_buffer input =3D { sizeof(struct bios_args), &args };
 =09struct acpi_buffer output =3D { ACPI_ALLOCATE_BUFFER, NULL };
@@ -228,7 +228,7 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_=
command command,
=20
 =09if (WARN_ON(insize > sizeof(args.data)))
 =09=09return -EINVAL;
-=09memcpy(&args.data, buffer, insize);
+=09memcpy(&args.data[0], buffer, insize);
=20
 =09wmi_evaluate_method(HPWMI_BIOS_GUID, 0, mid, &input, &output);
=20
--=20
2.23.0

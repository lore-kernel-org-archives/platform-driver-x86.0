From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH 3/3] platform/x86: wmi: use MODULE_DEVICE_TABLE() instead
 of MODULE_ALIAS()
Date: Mon, 21 Jan 2019 21:54:38 +0000
Message-ID: <1c6498f0ba50440c98281531e98e221d@ausx13mpc120.AMER.DELL.COM>
References: <cover.1547827336.git.2pi@mok.nu>
 <e468c28f030e93ec54010878f222c56541d6af00.1547827336.git.2pi@mok.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e468c28f030e93ec54010878f222c56541d6af00.1547827336.git.2pi@mok.nu>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: 2pi@mok.nu, dvhart@infradead.org, andy@infradead.org, mjg59@srcf.ucam.org, pali.rohar@gmail.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

> -----Original Message-----
> From: Mattias Jacobsson <2pi@mok.nu>
> Sent: Saturday, January 19, 2019 5:56 AM
> To: Limonciello, Mario; dvhart@infradead.org; andy@infradead.org;
> mjg59@srcf.ucam.org; pali.rohar@gmail.com
> Cc: 2pi@mok.nu; platform-driver-x86@vger.kernel.org; linux-
> kernel@vger.kernel.org
> Subject: [PATCH 3/3] platform/x86: wmi: use MODULE_DEVICE_TABLE() instead=
 of
> MODULE_ALIAS()
>=20
>=20
> [EXTERNAL EMAIL]
>=20
> WMI drivers can if they have specified an array of struct wmi_device_id
> use the MODULE_DEVICE_TABLE() macro to automatically generate the
> appropriate MODULE_ALIAS() output.
>=20
> Change all driver that have specified an array of struct wmi_device_id
> to use MODULE_DEVICE_TABLE() instead of MODULE_ALIAS().
>=20
> Signed-off-by: Mattias Jacobsson <2pi@mok.nu>

No concerns to the Dell pieces I'm on assuming other patches in series acce=
pted.

Reviewed-by: Mario Limonciello <mario.limonciello@dell.com>

> ---
>  drivers/platform/x86/dell-smbios-wmi.c       | 2 +-
>  drivers/platform/x86/dell-wmi-descriptor.c   | 2 +-
>  drivers/platform/x86/dell-wmi.c              | 4 ++--
>  drivers/platform/x86/huawei-wmi.c            | 3 +--
>  drivers/platform/x86/intel-wmi-thunderbolt.c | 2 +-
>  drivers/platform/x86/wmi-bmof.c              | 2 +-
>  6 files changed, 7 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/platform/x86/dell-smbios-wmi.c b/drivers/platform/x8=
6/dell-
> smbios-wmi.c
> index cf2229ece9ff..c3ed3c8c17b9 100644
> --- a/drivers/platform/x86/dell-smbios-wmi.c
> +++ b/drivers/platform/x86/dell-smbios-wmi.c
> @@ -277,4 +277,4 @@ void exit_dell_smbios_wmi(void)
>  	wmi_driver_unregister(&dell_smbios_wmi_driver);
>  }
>=20
> -MODULE_ALIAS("wmi:" DELL_WMI_SMBIOS_GUID);
> +MODULE_DEVICE_TABLE(wmi, dell_smbios_wmi_id_table);
> diff --git a/drivers/platform/x86/dell-wmi-descriptor.c
> b/drivers/platform/x86/dell-wmi-descriptor.c
> index 072821aa47fc..14ab250b7d5a 100644
> --- a/drivers/platform/x86/dell-wmi-descriptor.c
> +++ b/drivers/platform/x86/dell-wmi-descriptor.c
> @@ -207,7 +207,7 @@ static struct wmi_driver dell_wmi_descriptor_driver =
=3D {
>=20
>  module_wmi_driver(dell_wmi_descriptor_driver);
>=20
> -MODULE_ALIAS("wmi:" DELL_WMI_DESCRIPTOR_GUID);
> +MODULE_DEVICE_TABLE(wmi, dell_wmi_descriptor_id_table);
>  MODULE_AUTHOR("Mario Limonciello <mario.limonciello@dell.com>");
>  MODULE_DESCRIPTION("Dell WMI descriptor driver");
>  MODULE_LICENSE("GPL");
> diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-=
wmi.c
> index 16c7f3d9a335..0602aba62b3f 100644
> --- a/drivers/platform/x86/dell-wmi.c
> +++ b/drivers/platform/x86/dell-wmi.c
> @@ -50,8 +50,6 @@ MODULE_LICENSE("GPL");
>=20
>  static bool wmi_requires_smbios_request;
>=20
> -MODULE_ALIAS("wmi:"DELL_EVENT_GUID);
> -
>  struct dell_wmi_priv {
>  	struct input_dev *input_dev;
>  	u32 interface_version;
> @@ -738,3 +736,5 @@ static void __exit dell_wmi_exit(void)
>  	wmi_driver_unregister(&dell_wmi_driver);
>  }
>  module_exit(dell_wmi_exit);
> +
> +MODULE_DEVICE_TABLE(wmi, dell_wmi_id_table);
> diff --git a/drivers/platform/x86/huawei-wmi.c b/drivers/platform/x86/hua=
wei-
> wmi.c
> index 59872f87b741..52fcac5b393a 100644
> --- a/drivers/platform/x86/huawei-wmi.c
> +++ b/drivers/platform/x86/huawei-wmi.c
> @@ -201,8 +201,7 @@ static struct wmi_driver huawei_wmi_driver =3D {
>=20
>  module_wmi_driver(huawei_wmi_driver);
>=20
> -MODULE_ALIAS("wmi:"WMI0_EVENT_GUID);
> -MODULE_ALIAS("wmi:"AMW0_EVENT_GUID);
> +MODULE_DEVICE_TABLE(wmi, huawei_wmi_id_table);
>  MODULE_AUTHOR("Ayman Bagabas <ayman.bagabas@gmail.com>");
>  MODULE_DESCRIPTION("Huawei WMI hotkeys");
>  MODULE_LICENSE("GPL v2");
> diff --git a/drivers/platform/x86/intel-wmi-thunderbolt.c
> b/drivers/platform/x86/intel-wmi-thunderbolt.c
> index 9ded8e2af312..4dfa61434a76 100644
> --- a/drivers/platform/x86/intel-wmi-thunderbolt.c
> +++ b/drivers/platform/x86/intel-wmi-thunderbolt.c
> @@ -88,7 +88,7 @@ static struct wmi_driver intel_wmi_thunderbolt_driver =
=3D {
>=20
>  module_wmi_driver(intel_wmi_thunderbolt_driver);
>=20
> -MODULE_ALIAS("wmi:" INTEL_WMI_THUNDERBOLT_GUID);
> +MODULE_DEVICE_TABLE(wmi, intel_wmi_thunderbolt_id_table);
>  MODULE_AUTHOR("Mario Limonciello <mario.limonciello@dell.com>");
>  MODULE_DESCRIPTION("Intel WMI Thunderbolt force power driver");
>  MODULE_LICENSE("GPL v2");
> diff --git a/drivers/platform/x86/wmi-bmof.c b/drivers/platform/x86/wmi-b=
mof.c
> index c4530ba715e8..8751a13134be 100644
> --- a/drivers/platform/x86/wmi-bmof.c
> +++ b/drivers/platform/x86/wmi-bmof.c
> @@ -119,7 +119,7 @@ static struct wmi_driver wmi_bmof_driver =3D {
>=20
>  module_wmi_driver(wmi_bmof_driver);
>=20
> -MODULE_ALIAS("wmi:" WMI_BMOF_GUID);
> +MODULE_DEVICE_TABLE(wmi, wmi_bmof_id_table);
>  MODULE_AUTHOR("Andrew Lutomirski <luto@kernel.org>");
>  MODULE_DESCRIPTION("WMI embedded Binary MOF driver");
>  MODULE_LICENSE("GPL");
> --
> 2.20.1

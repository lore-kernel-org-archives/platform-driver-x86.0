From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH] platform/x86: thinkpad_acpi: disable bluetooth for some
 machines
Date: Thu, 7 Mar 2019 23:14:21 +0000
Message-ID: <28af3c22ad144cf69284aa6f91ee6565@ausx13mpc124.AMER.DELL.COM>
References: <20190307080820.9723-1-jiaxun.yang@flygoat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190307080820.9723-1-jiaxun.yang@flygoat.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: jiaxun.yang@flygoat.com, ibm-acpi@hmh.eng.br
Cc: dvhart@infradead.org, andy@infradead.org, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

 -----Original Message-----
> From: platform-driver-x86-owner@vger.kernel.org <platform-driver-x86-
> owner@vger.kernel.org> On Behalf Of Jiaxun Yang
> Sent: Thursday, March 7, 2019 2:08 AM
> To: ibm-acpi@hmh.eng.br
> Cc: dvhart@infradead.org; andy@infradead.org; ibm-acpi-
> devel@lists.sourceforge.net; platform-driver-x86@vger.kernel.org; linux-
> kernel@vger.kernel.org; stable@vger.kernel.org; Jiaxun Yang
> Subject: [PATCH] platform/x86: thinkpad_acpi: disable bluetooth for some
> machines
>=20
>=20
> [EXTERNAL EMAIL]
>=20
> Some AMD based ThinkPads have a firmware bug that calling
> "GBDC" will cause bluetooth on Intel wireless cards blocked.

Since this is considered a firmware bug; has the OEM (and IBV) been notifie=
d?  Is it
fixed in a newer version of the firmware?

If so, then this should probably only match particular broken firmware vers=
ions.

>=20
> Probe these models by DMI match and disable bluetooth subdriver
> if specified Intel wireless card exist.
>=20
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 70 ++++++++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
>=20
> diff --git a/drivers/platform/x86/thinkpad_acpi.c
> b/drivers/platform/x86/thinkpad_acpi.c
> index 726341f2b638..29e835f9368a 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -79,6 +79,7 @@
>  #include <linux/jiffies.h>
>  #include <linux/workqueue.h>
>  #include <linux/acpi.h>
> +#include <linux/pci.h>
>  #include <linux/pci_ids.h>
>  #include <linux/power_supply.h>
>  #include <sound/core.h>
> @@ -4501,11 +4502,80 @@ static void bluetooth_exit(void)
>  	bluetooth_shutdown();
>  }
>=20
> +static const struct dmi_system_id bt_fwbug_list[] __initconst =3D {
> +	{
> +		.ident =3D "ThinkPad E485",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_BOARD_NAME, "20KU"),
> +		},
> +	},
> +	{
> +		.ident =3D "ThinkPad E585",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_BOARD_NAME, "20KV"),
> +		},
> +	},
> +	{
> +		.ident =3D "ThinkPad A285 - 20MW",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_BOARD_NAME, "20MW"),
> +		},
> +	},
> +	{
> +		.ident =3D "ThinkPad A285 - 20MX",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_BOARD_NAME, "20MX"),
> +		},
> +	},
> +	{
> +		.ident =3D "ThinkPad A485 - 20MU",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_BOARD_NAME, "20MU"),
> +		},
> +	},
> +	{
> +		.ident =3D "ThinkPad A485 - 20MV",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_BOARD_NAME, "20MV"),
> +		},
> +	},
> +	{}
> +};
> +
> +static int __init have_bt_fwbug(void)
> +{
> +	/* Some AMD based ThinkPads have a firmware bug that calling
> +	 * "GBDC" will cause bluetooth on Intel wireless cards blocked
> +	 */
> +	if (dmi_check_system(bt_fwbug_list)) {
> +		if (pci_get_device(PCI_VENDOR_ID_INTEL, 0x24F3, NULL) || \
> +		    pci_get_device(PCI_VENDOR_ID_INTEL, 0x24FD, NULL) || \
> +		    pci_get_device(PCI_VENDOR_ID_INTEL, 0x2526, NULL))
> +			return 1;
> +		else
> +			return 0;
> +	} else {
> +			return 0;
> +	}
> +}
> +
>  static int __init bluetooth_init(struct ibm_init_struct *iibm)
>  {
>  	int res;
>  	int status =3D 0;
>=20
> +	if (have_bt_fwbug()) {
> +		vdbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_RFKILL,
> +			FW_BUG "disable bluetooth subdriver for Intel cards\n");
> +		return 1;
> +	}
> +
>  	vdbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_RFKILL,
>  			"initializing bluetooth subdriver\n");
>=20
> --
> 2.20.1

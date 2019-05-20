From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH] platform/x86: intel-vbtn: Report switch events when event
 wakes device
Date: Mon, 20 May 2019 15:40:34 +0000
Message-ID: <d2dac2d720574c58bb0d273809f46cf9@AUSX13MPC105.AMER.DELL.COM>
References: <20190516215615.261258-1-mathewk@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190516215615.261258-1-mathewk@chromium.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: mathewk@chromium.org, linux-kernel@vger.kernel.org
Cc: acelan.kao@canonical.com, dvhart@infradead.org, andy@infradead.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org



> -----Original Message-----
> From: platform-driver-x86-owner@vger.kernel.org <platform-driver-x86-
> owner@vger.kernel.org> On Behalf Of Mathew King
> Sent: Thursday, May 16, 2019 4:56 PM
> To: linux-kernel@vger.kernel.org
> Cc: Mathew King; AceLan Kao; Darren Hart; Andy Shevchenko; platform-drive=
r-
> x86@vger.kernel.org
> Subject: [PATCH] platform/x86: intel-vbtn: Report switch events when even=
t wakes
> device
>=20
>=20
> [EXTERNAL EMAIL]
>=20
> When a switch event, such as tablet mode/laptop mode or docked/undocked,
> wakes a device make sure that the value of the swich is reported.
> Without when a device is put in tablet mode from laptop mode when it is
> suspended or vice versa the device will wake up but mode will be
> incorrect.
>=20
> Tested by suspending a device in laptop mode and putting it in tablet
> mode, the device resumes and is in tablet mode. When suspending the
> device in tablet mode and putting it in laptop mode the device resumes
> and is in laptop mode.
>=20
> Signed-off-by: Mathew King <mathewk@chromium.org>

Reviewed-by: Mario Limonciello <mario.limonciello@dell.com>

> ---
>  drivers/platform/x86/intel-vbtn.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/platform/x86/intel-vbtn.c b/drivers/platform/x86/int=
el-vbtn.c
> index 06cd7e818ed5..990cc8c20872 100644
> --- a/drivers/platform/x86/intel-vbtn.c
> +++ b/drivers/platform/x86/intel-vbtn.c
> @@ -76,12 +76,15 @@ static void notify_handler(acpi_handle handle, u32 ev=
ent,
> void *context)
>  	struct platform_device *device =3D context;
>  	struct intel_vbtn_priv *priv =3D dev_get_drvdata(&device->dev);
>  	unsigned int val =3D !(event & 1); /* Even=3Dpress, Odd=3Drelease */
> -	const struct key_entry *ke_rel;
> +	const struct key_entry *ke, *ke_rel;
>  	bool autorelease;
>=20
>  	if (priv->wakeup_mode) {
> -		if (sparse_keymap_entry_from_scancode(priv->input_dev, event))
> {
> +		ke =3D sparse_keymap_entry_from_scancode(priv->input_dev,
> event);
> +		if (ke) {
>  			pm_wakeup_hard_event(&device->dev);
> +			if (ke->type =3D=3D KE_SW)
> +				sparse_keymap_report_event(priv->input_dev,
> event, val, 0);
>  			return;
>  		}
>  		goto out_unknown;
> --
> 2.21.0.1020.gf2820cf01a-goog

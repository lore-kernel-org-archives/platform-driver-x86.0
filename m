From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH v3 1/3] platform/x86: dell-wmi: add new backlight events
Date: Tue, 9 Jun 2020 16:02:28 +0000
Message-ID: <29f57822df4e45f192b72c6151f4697c@AUSX13MPC105.AMER.DELL.COM>
References: <cover.1591584631.git.y.linux@paritcher.com>
 <cover.1591673143.git.y.linux@paritcher.com>
 <50885a0c51c6fb31d20ddeb7434572448f1453be.1591673143.git.y.linux@paritcher.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <50885a0c51c6fb31d20ddeb7434572448f1453be.1591673143.git.y.linux@paritcher.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: y.linux@paritcher.com, pali@kernel.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, mjg59@srcf.ucam.org
List-Id: platform-driver-x86.vger.kernel.org



> -----Original Message-----
> From: Y Paritcher <y.linux@paritcher.com>
> Sent: Monday, June 8, 2020 10:53 PM
> To: Pali Roh=E1r
> Cc: linux-kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org;
> Matthew Garrett; Limonciello, Mario
> Subject: [PATCH v3 1/3] platform/x86: dell-wmi: add new backlight events
>=20
>=20
> [EXTERNAL EMAIL]
>=20
> Add events with a type of 0x0010 and a code of 0x57 / 0x58,
> this silences the following messages being logged on a
> Dell Inspiron 5593:
>=20
> dell_wmi: Unknown key with type 0x0010 and code 0x0057 pressed
> dell_wmi: Unknown key with type 0x0010 and code 0x0058 pressed
>=20
> These are brightness events and will be handled by acpi-video
>=20
> Signed-off-by: Y Paritcher <y.linux@paritcher.com>

Reviewed-by: Mario Limonciello <mario.limonciello@dell.com>

> ---
>  drivers/platform/x86/dell-wmi.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-
> wmi.c
> index c25a4286d766..0b2edfe2767d 100644
> --- a/drivers/platform/x86/dell-wmi.c
> +++ b/drivers/platform/x86/dell-wmi.c
> @@ -255,6 +255,10 @@ static const struct key_entry
> dell_wmi_keymap_type_0010[] =3D {
>  	/* Keyboard backlight change notification */
>  	{ KE_IGNORE, 0x3f, { KEY_RESERVED } },
>=20
> +	/* Backlight brightness level */
> +	{ KE_KEY,    0x57, { KEY_BRIGHTNESSDOWN } },
> +	{ KE_KEY,    0x58, { KEY_BRIGHTNESSUP } },
> +
>  	/* Mic mute */
>  	{ KE_KEY, 0x150, { KEY_MICMUTE } },
>=20
> --
> 2.27.0

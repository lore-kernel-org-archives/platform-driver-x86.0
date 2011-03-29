From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH v3 2/3] eeepc-wmi: Add support for T101MT Home/Express
 Gate key
Date: Tue, 29 Mar 2011 12:29:11 +0000
Message-ID: <AANLkTi=QJzVt=tR2mUmaRwvhNz5eeV0BE1LB0-pCybNV@mail.gmail.com>
References: <AANLkTi=U2Qkqv7FKfe18f0a=8Xg0QwRX_cxFj-j7ZPC=@mail.gmail.com>
	<1301337224-3293-1-git-send-email-seth.forshee@canonical.com>
	<1301337224-3293-3-git-send-email-seth.forshee@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:49120 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752553Ab1C2M3N convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 29 Mar 2011 08:29:13 -0400
In-Reply-To: <1301337224-3293-3-git-send-email-seth.forshee@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Seth Forshee <seth.forshee@canonical.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Chris Bagwell <chris@cnpbagwell.com>, Matthew Garrett <mjg@redhat.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Mar 28, 2011 at 6:33 PM, Seth Forshee
<seth.forshee@canonical.com> wrote:
> This key is different than other hotkeys, having seperate scan
> codes for press, release, and hold, so it requires some special
> filtering. Press and release events are passed on, and hold events
> are ignored since sparse-keymap does not support hardware
> autorepeat.
>
> Note that "Home" in the context of this button doesn't mean the
> same thing as the usual Home key, and it really isn't clear at
> all what is meant by "Home". The manufacurer's description of the
> button indicates that it should launch some sort of touch screen
> settings interface on short press and apply a desktop rotation on
> long press.
>
> Signed-off-by: Seth Forshee <seth.forshee@canonical.com>
> ---
> =C2=A0drivers/platform/x86/eeepc-wmi.c | =C2=A0 26 ++++++++++++++++++=
++++++++
> =C2=A01 files changed, 26 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/platform/x86/eeepc-wmi.c b/drivers/platform/x86/=
eeepc-wmi.c
> index 0ddc434..8f3112d5 100644
> --- a/drivers/platform/x86/eeepc-wmi.c
> +++ b/drivers/platform/x86/eeepc-wmi.c
> @@ -56,6 +56,11 @@ MODULE_PARM_DESC(hotplug_wireless,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "If your lapt=
op needs that, please report to "
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "acpi4asus-us=
er@lists.sourceforge.net.");
>
> +/* Values for T101MT "Home" key */
> +#define HOME_PRESS =C2=A0 =C2=A0 0xe4
> +#define HOME_HOLD =C2=A0 =C2=A0 =C2=A00xea
> +#define HOME_RELEASE =C2=A0 0xe5
> +
> =C2=A0static const struct key_entry eeepc_wmi_keymap[] =3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Sleep already handled via generic ACPI =
code */
> =C2=A0 =C2=A0 =C2=A0 =C2=A0{ KE_KEY, 0x30, { KEY_VOLUMEUP } },
> @@ -70,6 +75,7 @@ static const struct key_entry eeepc_wmi_keymap[] =3D=
 {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0{ KE_KEY, 0xcc, { KEY_SWITCHVIDEOMODE } },
> =C2=A0 =C2=A0 =C2=A0 =C2=A0{ KE_KEY, 0xe0, { KEY_PROG1 } }, /* Task M=
anager */
> =C2=A0 =C2=A0 =C2=A0 =C2=A0{ KE_KEY, 0xe1, { KEY_F14 } }, /* Change R=
esolution */
> + =C2=A0 =C2=A0 =C2=A0 { KE_KEY, HOME_PRESS, { KEY_CONFIG } },

What X11 key is mapped to KEY_CONFIG ?

> =C2=A0 =C2=A0 =C2=A0 =C2=A0{ KE_KEY, 0xe9, { KEY_BRIGHTNESS_ZERO } },
> =C2=A0 =C2=A0 =C2=A0 =C2=A0{ KE_KEY, 0xeb, { KEY_CAMERA_ZOOMOUT } },
> =C2=A0 =C2=A0 =C2=A0 =C2=A0{ KE_KEY, 0xec, { KEY_CAMERA_UP } },
> @@ -79,6 +85,25 @@ static const struct key_entry eeepc_wmi_keymap[] =3D=
 {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0{ KE_END, 0},
> =C2=A0};
>
> +static void eeepc_wmi_key_filter(struct asus_wmi_driver *asus_wmi, i=
nt *code,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int *value, bool *au=
torelease)
> +{
> + =C2=A0 =C2=A0 =C2=A0 switch (*code) {
> + =C2=A0 =C2=A0 =C2=A0 case HOME_PRESS:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *value =3D 1;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *autorelease =3D 0=
;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
> + =C2=A0 =C2=A0 =C2=A0 case HOME_HOLD:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *code =3D ASUS_WMI=
_KEY_IGNORE;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
> + =C2=A0 =C2=A0 =C2=A0 case HOME_RELEASE:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *code =3D HOME_PRE=
SS;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *value =3D 0;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *autorelease =3D 0=
;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
> + =C2=A0 =C2=A0 =C2=A0 }
> +}
> +
> =C2=A0static acpi_status eeepc_wmi_parse_device(acpi_handle handle, u=
32 level,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 void *context, void **retval)
> =C2=A0{
> @@ -149,6 +174,7 @@ static struct asus_wmi_driver asus_wmi_driver =3D=
 {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.keymap =3D eeepc_wmi_keymap,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.input_name =3D "Eee PC WMI hotkeys",
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.input_phys =3D EEEPC_WMI_FILE "/input0",
> + =C2=A0 =C2=A0 =C2=A0 .key_filter =3D eeepc_wmi_key_filter,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.probe =3D eeepc_wmi_probe,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.quirks =3D eeepc_wmi_quirks,
> =C2=A0};
> --
> 1.7.4.1
>
>

I think this version is ok,

Matthew, do you think this should be delayed for 2.6.40 (merge window
will close soon, so now it's probably time for fix only) ?

--=20
Corentin Chary
http://xf.iksaif.net

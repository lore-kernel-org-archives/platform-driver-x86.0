From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2] asus-laptop: Add key found on Asus F3M
Date: Wed, 5 Aug 2015 13:29:07 -0700
Message-ID: <20150805202907.GD12131@vmdeb7>
References: <20150729044329.GA80946@vmdeb7>
 <1438198283-2180-1-git-send-email-stlman@poczta.fm>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1438198283-2180-1-git-send-email-stlman@poczta.fm>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?Q?=C5=81ukasz?= Stelmach <stlman@poczta.fm>
Cc: Corentin Chary <corentin.chary@gmail.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jul 29, 2015 at 09:31:23PM +0200, =C5=81ukasz Stelmach wrote:
> Asus F3M has two keys labeled with an icon of a touchpad. The first,
> reported as 0x6B is next to the power key and the second, reported as
> 0x6A, is F9 combined with Fn button. When I was pressing the latter, =
I was
> getting "Unknown key 6a pressed" message before applying this patch.
>=20
> Asus F3M does not support WMI so the commit does not update key mappi=
ngs
> in the asus-nb-wmi.c file.
>=20
> I have not tested this mapping on any other Asus laptop.
>=20
> Signed-off-by: =C5=81ukasz Stelmach <stlman@poczta.fm>

Thanks =C5=81ukasz.

Corentin, any concerns?

> ---
>  drivers/platform/x86/asus-laptop.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x8=
6/asus-laptop.c
> index 58d29c4..f2b5d0a 100644
> --- a/drivers/platform/x86/asus-laptop.c
> +++ b/drivers/platform/x86/asus-laptop.c
> @@ -332,6 +332,7 @@ static const struct key_entry asus_keymap[] =3D {
>  	{KE_KEY, 0x65, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + TV */
>  	{KE_KEY, 0x66, { KEY_SWITCHVIDEOMODE } }, /* SDSP CRT + TV */
>  	{KE_KEY, 0x67, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + CRT + TV */
> +	{KE_KEY, 0x6A, { KEY_TOUCHPAD_TOGGLE } }, /* Lock Touchpad Fn + F9 =
*/
>  	{KE_KEY, 0x6B, { KEY_TOUCHPAD_TOGGLE } }, /* Lock Touchpad */
>  	{KE_KEY, 0x6C, { KEY_SLEEP } }, /* Suspend */
>  	{KE_KEY, 0x6D, { KEY_SLEEP } }, /* Hibernate */
> --=20
> 2.1.4
>=20
>=20

--=20
Darren Hart
Intel Open Source Technology Center

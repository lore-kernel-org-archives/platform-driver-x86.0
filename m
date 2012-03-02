From: Josh Boyer <jwboyer@gmail.com>
Subject: Re: [PATCH 1/1] samsung-laptop: add N230 to supported models
Date: Fri, 2 Mar 2012 14:06:33 -0500
Message-ID: <CA+5PVA7=rMwMdvL+jY6nXS-RD8CCTTug6XZ6fmdzwHeksi79aw@mail.gmail.com>
References: <1330714505-13170-1-git-send-email-jslaby@suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1330714505-13170-1-git-send-email-jslaby@suse.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: Jiri Slaby <jslaby@suse.cz>
Cc: mjg@redhat.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Mar 2, 2012 at 1:55 PM, Jiri Slaby <jslaby@suse.cz> wrote:
> There is a version of N230 which has only this in product and board
> names. See dmidecode in the bugzilla entry.
>
> Without this patch, one has to pass the force module parameter to hav=
e
> rfkill working.
>
> References: https://bugzilla.novell.com/show_bug.cgi?id=3D746695
> Signed-off-by: Jiri Slaby <jslaby@suse.cz>

I think Corey has patches queued up in Matthew's git tree that drop the=
 DMI
checks in this driver entirely.  If so, this probably isn't needed.

josh

> ---
> =A0drivers/platform/x86/samsung-laptop.c | =A0 10 ++++++++++
> =A01 file changed, 10 insertions(+)
>
> diff --git a/drivers/platform/x86/samsung-laptop.c b/drivers/platform=
/x86/samsung-laptop.c
> index fd73ea8..7765929 100644
> --- a/drivers/platform/x86/samsung-laptop.c
> +++ b/drivers/platform/x86/samsung-laptop.c
> @@ -679,6 +679,16 @@ static struct dmi_system_id __initdata samsung_d=
mi_table[] =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.callback =3D dmi_check_cb,
> =A0 =A0 =A0 =A0},
> =A0 =A0 =A0 =A0{
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ident =3D "N230",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .matches =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 DMI_MATCH(DMI_SYS_VENDO=
R,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 "SAMSUNG ELECTRONICS CO., LTD."),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 DMI_MATCH(DMI_PRODUCT_N=
AME, "N230"),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 DMI_MATCH(DMI_BOARD_NAM=
E, "N230"),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .callback =3D dmi_check_cb,
> + =A0 =A0 =A0 },
> + =A0 =A0 =A0 {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.ident =3D "N150/N210/N220/N230",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.matches =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0DMI_MATCH(DMI_SYS_VEND=
OR,
> --
> 1.7.9.2
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kerne=
l" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at =A0http://www.tux.org/lkml/

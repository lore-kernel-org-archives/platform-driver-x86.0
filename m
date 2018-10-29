From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Change the keymap for
 Favorites hotkey
Date: Mon, 29 Oct 2018 15:50:45 +0200
Message-ID: <CAHp75Vcug+8nW7h_35L9zOY7tj2g_42sLwfD65wAsoe_yr=84A@mail.gmail.com>
References: <1539237571-28926-1-git-send-email-zhang.xianwei8@zte.com.cn> <201810181029439681669@zte.com.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201810181029439681669@zte.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: zhang.xianwei8@zte.com.cn
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, ibm-acpi-devel@lists.sourceforge.net, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, zhong.weidong@zte.com.cn, Yi Wang <wang.yi59@zte.com.cn>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Oct 18, 2018 at 5:30 AM <zhang.xianwei8@zte.com.cn> wrote:
>
> Could you take a little time to review the patch? Thanks
>

Pushed to my review and testing queue, thanks!


> ------------------Original Mail------------------
> Sender: zhang xianwei10129966
> To: ibm-acpi@hmh.eng.br <ibm-acpi@hmh.eng.br>dvhart@infradead.org <dvhart=
@infradead.org>andy@infradead.org <andy@infradead.org>
> CC: ibm-acpi-devel@lists.sourceforge.net <ibm-acpi-devel@lists.sourceforg=
e.net>platform-driver-x86@vger.kernel.org <platform-driver-x86@vger.kernel.=
org>linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>zhong weidon=
g10001088;zhang xianwei10129966;
> Date: 2018/10/11 13:52
> Subject: [PATCH] platform/x86: thinkpad_acpi: Change the keymap for Favor=
ites hotkey
> The keycode KEY_FAVORITES(0x16c) used in thinkpad_acpi driver is too
> big (out of range > 255) for xorg to handle.
> xkeyboard-config has already mapped KEY_BOOKMARKS(156) to
> XF86Favorites:
>
> keycodes/evdev:
> <I164> =3D 164;   // #define KEY_BOOKMARKS           156
>
> symbols/inet:
> key <I164>   {      [ XF86Favorites         ]       };
>
> So change the keymap to KEY_BOOKMARKS for Favorites hotkey.
>
> Signed-off-by: Zhang Xianwei <zhang.xianwei8@zte.com.cn>
> ---
> drivers/platform/x86/thinkpad_acpi.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/=
thinkpad_acpi.c
> index fde08a9..a86cf47 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -3457,7 +3457,7 @@ static int __init hotkey_init(struct ibm_init_struc=
t *iibm)
> KEY_UNKNOWN, KEY_UNKNOWN, KEY_UNKNOWN, KEY_UNKNOWN,
> KEY_UNKNOWN,
> -        KEY_FAVORITES,       /* Favorite app, 0x311 */
> +        KEY_BOOKMARKS,       /* Favorite app, 0x311 */
> KEY_RESERVED,        /* Clipping tool */
> KEY_CALC,            /* Calculator (above numpad, P52) */
> KEY_BLUETOOTH,       /* Bluetooth */
> --
> 2.9.5



--=20
With Best Regards,
Andy Shevchenko

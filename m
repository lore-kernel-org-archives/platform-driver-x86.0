From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCHv3] platform/x86: asus-wireless: Fix identation
Date: Tue, 7 Feb 2017 12:22:45 +0200
Message-ID: <CAHp75VdA4ZT0CLBGuZ8Wnp2iOZBnG0f9w-mbsXkLdiZxy6UAdg@mail.gmail.com>
References: <CAHp75VeCJee46FHoyGdZ39CvTu0pb=k_R0CnWb9_vaX-per+rQ@mail.gmail.com>
 <20170206152021.17671-1-jprvita@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170206152021.17671-1-jprvita@endlessm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux@endlessm.com, =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@endlessm.com>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Feb 6, 2017 at 5:20 PM, Jo=C3=A3o Paulo Rechi Vita <jprvita@gmail.c=
om> wrote:
> Fix identation problem introduced when this driver was first merged into
> the kernel.

Thanks, pushed to testing.

>
> Signed-off-by: Jo=C3=A3o Paulo Rechi Vita <jprvita@endlessm.com>
> ---
>  drivers/platform/x86/asus-wireless.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/platform/x86/asus-wireless.c b/drivers/platform/x86/=
asus-wireless.c
> index 9f31bc1a47d0..a7ee18383146 100644
> --- a/drivers/platform/x86/asus-wireless.c
> +++ b/drivers/platform/x86/asus-wireless.c
> @@ -76,8 +76,7 @@ static void led_state_update(struct work_struct *work)
>                              data->led_state);
>  }
>
> -static void led_state_set(struct led_classdev *led,
> -                                 enum led_brightness value)
> +static void led_state_set(struct led_classdev *led, enum led_brightness =
value)
>  {
>         struct asus_wireless_data *data;
>
> --
> 2.11.0
>



--=20
With Best Regards,
Andy Shevchenko

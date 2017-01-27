From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 1/1] asus-wireless: Fix identation
Date: Fri, 27 Jan 2017 17:28:22 +0200
Message-ID: <CAHp75Vcq9p3jbyTQzg17eLBABTTDpz-mGGU03gVx+Q3Tsh2XgA@mail.gmail.com>
References: <20170126142554.8812-1-jprvita@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170126142554.8812-1-jprvita@endlessm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, acpi4asus-user@lists.sourceforge.net, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux@endlessm.com, =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@endlessm.com>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Jan 26, 2017 at 4:25 PM, Jo=C3=A3o Paulo Rechi Vita
<jprvita@gmail.com> wrote:
> Signed-off-by: Jo=C3=A3o Paulo Rechi Vita <jprvita@endlessm.com>
> ---
>  drivers/platform/x86/asus-wireless.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/asus-wireless.c b/drivers/platform/x86/=
asus-wireless.c
> index 9f31bc1a47d0..c9b5ac152cf1 100644
> --- a/drivers/platform/x86/asus-wireless.c
> +++ b/drivers/platform/x86/asus-wireless.c
> @@ -77,7 +77,7 @@ static void led_state_update(struct work_struct *work)
>  }
>
>  static void led_state_set(struct led_classdev *led,
> -                                 enum led_brightness value)
> +                         enum led_brightness value)

I would see benefit if it would be one line.

>  {
>         struct asus_wireless_data *data;

--=20
With Best Regards,
Andy Shevchenko

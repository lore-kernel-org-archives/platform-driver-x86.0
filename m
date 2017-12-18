From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH/trivial] samsung-laptop: Grammar s/are can/can/
Date: Mon, 18 Dec 2017 14:25:28 +0200
Message-ID: <CAHp75Vdgk06x2poit=5ic+kkeGbygcHqWKNnb-c0QvnqdJuuFw@mail.gmail.com>
References: <1512048759-18075-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1512048759-18075-1-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Jiri Kosina <trivial@kernel.org>, Corentin Chary <corentin.chary@gmail.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Nov 30, 2017 at 3:32 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied to my review and testing queue, thanks!

> ---
>  Documentation/ABI/testing/sysfs-driver-samsung-laptop | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/ABI/testing/sysfs-driver-samsung-laptop b/Documentation/ABI/testing/sysfs-driver-samsung-laptop
> index 63c1ad0212fc8624..34d3a3359cf4587f 100644
> --- a/Documentation/ABI/testing/sysfs-driver-samsung-laptop
> +++ b/Documentation/ABI/testing/sysfs-driver-samsung-laptop
> @@ -3,7 +3,7 @@ Date:           January 1, 2010
>  KernelVersion: 2.6.33
>  Contact:       Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>  Description:   Some Samsung laptops have different "performance levels"
> -               that are can be modified by a function key, and by this
> +               that can be modified by a function key, and by this
>                 sysfs file.  These values don't always make a whole lot
>                 of sense, but some users like to modify them to keep
>                 their fans quiet at all costs.  Reading from this file
> --
> 2.7.4
>



-- 
With Best Regards,
Andy Shevchenko

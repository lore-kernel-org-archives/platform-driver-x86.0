From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 1/3] Sony-laptop: Fix exception handling in sony_nc_setup_rfkill()
Date: Fri, 3 Nov 2017 14:00:00 +0200
Message-ID: <CAHp75VfxCqwimP7=VJjZR457kmb6bUu=NZOquf-YdPHSvOgt1w@mail.gmail.com>
References: <f33d9aa0-1a8e-f702-7513-5c0d5b464529@users.sourceforge.net>
 <CAHp75VcMkXCioCzmLE0+BTmkqc5RSOx9yPO0ectVHMrMvewgwg@mail.gmail.com>
 <17ee534c-9fe6-19c4-0522-76cd3cbe5f88@users.sourceforge.net> <354baacc-58dd-7012-de2c-11042604826e@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <354baacc-58dd-7012-de2c-11042604826e@users.sourceforge.net>
Sender: linux-kernel-owner@vger.kernel.org
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Marco Chiappero <marco@absence.it>, Matthew Garrett <mjg@redhat.com>, Mattia Dongili <malattia@linux.it>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Andy Shevchenko <andy@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Nov 1, 2017 at 8:46 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 1 Nov 2017 18:42:45 +0100
>
> Source code review for a specific software refactoring showed the need
> for another correction because the error code "-1" was returned so far
> if a call of the function "sony_call_snc_handle" failed here.
> Thus assign the return value from these two function calls also to
> the variable "err" and provide it in case of a failure.
>

Applied to my review and testing queue, thanks!

> Fixes: d6f15ed876b83a1a0eba1d0473eef58acc95444a ("sony-laptop: use soft rfkill status stored in hw")
> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Link: https://lkml.org/lkml/2017/10/31/463
> Link: https://lkml.kernel.org/r/<CAHp75VcMkXCioCzmLE0+BTmkqc5RSOx9yPO0ectVHMrMvewgwg@mail.gmail.com>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/platform/x86/sony-laptop.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
> index a16cea2be9c3..4332cc982ce0 100644
> --- a/drivers/platform/x86/sony-laptop.c
> +++ b/drivers/platform/x86/sony-laptop.c
> @@ -1660,17 +1660,19 @@ static int sony_nc_setup_rfkill(struct acpi_device *device,
>         if (!rfk)
>                 return -ENOMEM;
>
> -       if (sony_call_snc_handle(sony_rfkill_handle, 0x200, &result) < 0) {
> +       err = sony_call_snc_handle(sony_rfkill_handle, 0x200, &result);
> +       if (err < 0) {
>                 rfkill_destroy(rfk);
> -               return -1;
> +               return err;
>         }
>         hwblock = !(result & 0x1);
>
> -       if (sony_call_snc_handle(sony_rfkill_handle,
> -                               sony_rfkill_address[nc_type],
> -                               &result) < 0) {
> +       err = sony_call_snc_handle(sony_rfkill_handle,
> +                                  sony_rfkill_address[nc_type],
> +                                  &result);
> +       if (err < 0) {
>                 rfkill_destroy(rfk);
> -               return -1;
> +               return err;
>         }
>         swblock = !(result & 0x2);
>
> --
> 2.14.3
>



-- 
With Best Regards,
Andy Shevchenko

From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] platform/x86: sony-laptop: Fix unintentional fall-through
Date: Wed, 1 May 2019 14:09:01 -0700
Message-ID: <CAGXu5jLKgsz7JXGk=4MZg_dOxSAMTygK2WS5558gJYQcurOuJA@mail.gmail.com>
References: <20190424180934.GA29307@embeddedor>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190424180934.GA29307@embeddedor>
Sender: linux-kernel-owner@vger.kernel.org
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Mattia Dongili <malattia@linux.it>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Apr 24, 2019 at 11:09 AM Gustavo A. R. Silva
<gustavo@embeddedor.com> wrote:
>
> It seems that the default case should return AE_CTRL_TERMINATE, instead
> of falling through to case ACPI_RESOURCE_TYPE_END_TAG and returning AE_OK;
> otherwise the line of code at the end of the function is unreachable and
> makes no sense:
>
> return AE_CTRL_TERMINATE;
>
> This fix is based on the following thread of discussion:
>
> https://lore.kernel.org/patchwork/patch/959782/
>
> Fixes: 33a04454527e ("sony-laptop: Add SNY6001 device handling (sonypi reimplementation)")
> Cc: stable@vger.kernel.org
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>  drivers/platform/x86/sony-laptop.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
> index 4bfbfa3f78e6..2058445fc456 100644
> --- a/drivers/platform/x86/sony-laptop.c
> +++ b/drivers/platform/x86/sony-laptop.c
> @@ -4424,14 +4424,16 @@ sony_pic_read_possible_resource(struct acpi_resource *resource, void *context)
>                         }
>                         return AE_OK;
>                 }
> +
> +       case ACPI_RESOURCE_TYPE_END_TAG:
> +               return AE_OK;
> +
>         default:
>                 dprintk("Resource %d isn't an IRQ nor an IO port\n",
>                         resource->type);
> +               return AE_CTRL_TERMINATE;
>
> -       case ACPI_RESOURCE_TYPE_END_TAG:
> -               return AE_OK;
>         }
> -       return AE_CTRL_TERMINATE;
>  }
>
>  static int sony_pic_possible_resources(struct acpi_device *device)
> --
> 2.21.0
>


-- 
Kees Cook

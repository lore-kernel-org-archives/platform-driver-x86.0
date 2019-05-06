From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: sony-laptop: Fix unintentional fall-through
Date: Mon, 6 May 2019 15:23:05 +0300
Message-ID: <CAHp75VddRrLjahX0O4-q9=VLeUAAj6rOmnJ=W2Sg65OyUkVDqQ@mail.gmail.com>
References: <20190424180934.GA29307@embeddedor> <cd02e064-1172-a8a2-14af-1f20e09a0738@embeddedor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cd02e064-1172-a8a2-14af-1f20e09a0738@embeddedor.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Mattia Dongili <malattia@linux.it>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, May 1, 2019 at 11:42 PM Gustavo A. R. Silva
<gustavo@embeddedor.com> wrote:
>
> Hi all,
>
> Friendly ping:
>
> Who can take this?

Pushed to my review and testing queue, thanks!


>
> Thanks
> --
> Gustavo
>
> On 4/24/19 1:09 PM, Gustavo A. R. Silva wrote:
> > It seems that the default case should return AE_CTRL_TERMINATE, instead
> > of falling through to case ACPI_RESOURCE_TYPE_END_TAG and returning AE_OK;
> > otherwise the line of code at the end of the function is unreachable and
> > makes no sense:
> >
> > return AE_CTRL_TERMINATE;
> >
> > This fix is based on the following thread of discussion:
> >
> > https://lore.kernel.org/patchwork/patch/959782/
> >
> > Fixes: 33a04454527e ("sony-laptop: Add SNY6001 device handling (sonypi reimplementation)")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> > ---
> >  drivers/platform/x86/sony-laptop.c | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
> > index 4bfbfa3f78e6..2058445fc456 100644
> > --- a/drivers/platform/x86/sony-laptop.c
> > +++ b/drivers/platform/x86/sony-laptop.c
> > @@ -4424,14 +4424,16 @@ sony_pic_read_possible_resource(struct acpi_resource *resource, void *context)
> >                       }
> >                       return AE_OK;
> >               }
> > +
> > +     case ACPI_RESOURCE_TYPE_END_TAG:
> > +             return AE_OK;
> > +
> >       default:
> >               dprintk("Resource %d isn't an IRQ nor an IO port\n",
> >                       resource->type);
> > +             return AE_CTRL_TERMINATE;
> >
> > -     case ACPI_RESOURCE_TYPE_END_TAG:
> > -             return AE_OK;
> >       }
> > -     return AE_CTRL_TERMINATE;
> >  }
> >
> >  static int sony_pic_possible_resources(struct acpi_device *device)
> >



-- 
With Best Regards,
Andy Shevchenko

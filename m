From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: dell_rbu: fix lock imbalance in img_update_realloc
Date: Fri, 15 Feb 2019 21:57:51 +0200
Message-ID: <CAHp75Vc3cBcCb7Rsd1S3LX32_ZrCCPMcrtMtqPioadowrhh-0w@mail.gmail.com>
References: <20190211130940.28206-1-hch@lst.de> <8d8a1ad0-2192-5293-9073-21d1916778ff@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8d8a1ad0-2192-5293-9073-21d1916778ff@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stuart Hayes <stuart.w.hayes@gmail.com>
Cc: Christoph Hellwig <hch@lst.de>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Feb 13, 2019 at 5:56 AM Stuart Hayes <stuart.w.hayes@gmail.com> wrote:
>
>
>
> On 2/11/2019 7:09 AM, Christoph Hellwig wrote:
> > We need to ensure rbu_data.lock is always held on return.
> >

Pushed to my review and testing queue, thanks!

> > Fixes: 289790a3ea94 ("platform/x86: dell_rbu: stop abusing the DMA API")
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > ---
> >  drivers/platform/x86/dell_rbu.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/platform/x86/dell_rbu.c b/drivers/platform/x86/dell_rbu.c
> > index 8104ca0c44ca..031c68903583 100644
> > --- a/drivers/platform/x86/dell_rbu.c
> > +++ b/drivers/platform/x86/dell_rbu.c
> > @@ -436,6 +436,7 @@ static int img_update_realloc(unsigned long size)
> >       ordernum = get_order(size);
> >       image_update_buffer =
> >               (unsigned char *)__get_free_pages(GFP_DMA32, ordernum);
> > +     spin_lock(&rbu_data.lock);
> >       if (!image_update_buffer) {
> >               pr_debug("Not enough memory for image update:"
> >                       "size = %ld\n", size);
> > @@ -446,7 +447,6 @@ static int img_update_realloc(unsigned long size)
> >       if (WARN_ON_ONCE(img_buf_phys_addr > BIOS_SCAN_LIMIT))
> >               return -EINVAL; /* can't happen per definition */
> >
> > -     spin_lock(&rbu_data.lock);
> >       rbu_data.image_update_buffer = image_update_buffer;
> >       rbu_data.image_update_buffer_size = size;
> >       rbu_data.bios_image_size = rbu_data.image_update_buffer_size;
> >
>
> Acked-by: Stuart Hayes <stuart.w.hayes@gmail.com>



-- 
With Best Regards,
Andy Shevchenko

From: "Ardelean, Alexandru" <alexandru.Ardelean-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 4/5] iio: light: lm3533-als: remove explicit parent
 assignment
Date: Fri, 29 May 2020 11:08:38 +0000
Message-ID: <05500c815f4881a6aa86c809c5ac53e8af3f3e91.camel@analog.com>
References: <20200522082208.383631-1-alexandru.ardelean@analog.com>
 <20200522082208.383631-4-alexandru.ardelean@analog.com>
 <20200529101608.GC19480@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane-mx.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20200529101608.GC19480@localhost>
Content-Language: en-US
Content-ID: <C6D081712A43FD4B9CD4A682AA944F89-nA3rOoH6FIycE4WynfumptQqCkab/8FMAL8bYrjMMd8@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane-mx.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: "johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "milo.kim-l0cyMroinI0@public.gmane.org" <milo.kim-l0cyMroinI0@public.gmane.org>, "tomislav.denis-jb26L5wWkzc@public.gmane.org" <tomislav.denis-jb26L5wWkzc@public.gmane.org>, "dan-d1oNz5vA2fxXqviUI+FSNg@public.gmane.org" <dan-d1oNz5vA2fxXqviUI+FSNg@public.gmane.org>, "heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org" <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, "linux-aspeed-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linux-aspeed-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "eajames-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org" <eajames-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org>, "platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org" <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>, "lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "fabrice.gasnier-qxv4g6HH51o@public.gmane.org" <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>, "srinivas.pandruvada-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <srinivas.pandruvada-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "linux-stm32-XDFAJ8BFU24N7RejjzZ/Li2xQDfSxrLKVpNB7YpNyf8@public.gmane.org" <linux-stm32-XDFAJ8BFU24N7RejjzZ/Li2xQDfSxrLKVpNB7YpNyf8@public.gmane.org>, "devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org" <devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org>, linux-samsung-soc@vger
List-Id: platform-driver-x86.vger.kernel.org

On Fri, 2020-05-29 at 12:16 +0200, Johan Hovold wrote:
> [External]
> 
> On Fri, May 22, 2020 at 11:22:07AM +0300, Alexandru Ardelean wrote:
> > This assignment is the more peculiar of the bunch as it assigns the parent
> > of the platform-device's device (i.e. pdev->dev.parent) as the IIO device's
> > parent.
> > 
> > It's unclear whether this is intentional or not.
> > Hence it is in it's own patch.
> 
> Yeah, we have a few mfd drivers whose child drivers registers their
> class devices directly under the parent mfd device rather than the
> corresponding child platform device.
> 
> Since it's done consistently I think you need to update them all if you
> really want to change this. 
> 
> And it may not be worth it since at least in theory someone could now be
> relying on this topology.

Thanks for the feedback.
I guess, it could make sense to do here:
      devm_iio_device_alloc(pdev->dev.parent, ...)

Currently it's:
      devm_iio_device_alloc(&pdev->dev, ...)

That would make it slightly more consistent.
i.e. the life-time of the object would be attached to the parent of the platform
device, versus the platform-device.

Currently, as it is, the allocation [of the IIO device] is tied the platform-
device, and the IIO registration to the parent (of the platform-device).
I'm not super-familiar with the internals here, but does this sound a bit wrong?
Is there a chance where the IIO device could be de-allocated, while registered?


> 
> > Signed-off-by: Alexandru Ardelean <alexandru.ardelean-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>
> > ---
> >  drivers/iio/light/lm3533-als.c | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/drivers/iio/light/lm3533-als.c b/drivers/iio/light/lm3533-als.c
> > index bc196c212881..0f380ec8d30c 100644
> > --- a/drivers/iio/light/lm3533-als.c
> > +++ b/drivers/iio/light/lm3533-als.c
> > @@ -852,7 +852,6 @@ static int lm3533_als_probe(struct platform_device
> > *pdev)
> >  	indio_dev->channels = lm3533_als_channels;
> >  	indio_dev->num_channels = ARRAY_SIZE(lm3533_als_channels);
> >  	indio_dev->name = dev_name(&pdev->dev);
> > -	indio_dev->dev.parent = pdev->dev.parent;
> >  	indio_dev->modes = INDIO_DIRECT_MODE;
> >  
> >  	als = iio_priv(indio_dev);
> 
> Johan

From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 02/24] Input: gpio_keys - Simplify with dev_err_probe()
Date: Wed, 26 Aug 2020 21:58:37 +0200
Message-ID: <20200826195837.GA29590@kozik-lap>
References: <20200826181706.11098-1-krzk@kernel.org>
 <20200826181706.11098-2-krzk@kernel.org>
 <20200826191334.GX1891694@smile.fi.intel.com>
 <20200826192256.GA14739@kozik-lap>
 <CAHp75VcrUKN5S1HUdfzijx8xNEaA75jRAV893Khzm83i47cqgA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-input-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHp75VcrUKN5S1HUdfzijx8xNEaA75jRAV893Khzm83i47cqgA@mail.gmail.com>
Sender: linux-input-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, Bastien Nocera <hadess@hadess.net>, Sangwon Jee <jeesw@melfas.com>, Eugen Hristev <eugen.hristev@microchip.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-input <linux-input@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Aug 26, 2020 at 10:39:12PM +0300, Andy Shevchenko wrote:
> On Wed, Aug 26, 2020 at 10:23 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > On Wed, Aug 26, 2020 at 10:13:34PM +0300, Andy Shevchenko wrote:
> > > On Wed, Aug 26, 2020 at 08:16:44PM +0200, Krzysztof Kozlowski wrote:
> > > > Common pattern of handling deferred probe can be simplified with
> > > > dev_err_probe().  Less code and also it prints the error value.
> > >
> > > > --- a/drivers/input/keyboard/gpio_keys.c
> > > > +++ b/drivers/input/keyboard/gpio_keys.c
> > > > @@ -505,10 +505,7 @@ static int gpio_keys_setup_key(struct platform_device *pdev,
> > > >                              */
> > > >                             bdata->gpiod = NULL;
> > >
> > > gpiod_get_optional()?
> > > Do not see much context though (but please double check your series for these
> > > kind of things).
> >
> > It would fit except it is devm_fwnode_gpiod_get() which does not have
> > optional yet.
> >
> > I can add it although the scope of the patch grows from simple
> > defer-path-simplification.
> 
> No need. My comment only about existing API per individual cases. SO,
> here it's fine then.

I checked the others and I didn't see such pattern anymore.

Best regards,
Krzysztof

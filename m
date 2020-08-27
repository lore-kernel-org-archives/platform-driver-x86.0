From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 06/24] Input: pwm-vibra - Simplify with dev_err_probe()
Date: Thu, 27 Aug 2020 20:40:50 +0200
Message-ID: <20200827184050.GB6196@kozik-lap>
References: <20200826181706.11098-1-krzk@kernel.org>
 <20200826181706.11098-6-krzk@kernel.org>
 <CAHp75VdKubv7ydjgwq+xVfCPKTFxfhxhc4Hp7T0CRG6owd+KJg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHp75VdKubv7ydjgwq+xVfCPKTFxfhxhc4Hp7T0CRG6owd+KJg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, Bastien Nocera <hadess@hadess.net>, Sangwon Jee <jeesw@melfas.com>, Eugen Hristev <eugen.hristev@microchip.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-input <linux-input@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Aug 27, 2020 at 12:06:46PM +0300, Andy Shevchenko wrote:
> On Wed, Aug 26, 2020 at 9:18 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > Common pattern of handling deferred probe can be simplified with
> > dev_err_probe().  Less code and also it prints the error value.
> 
> >         err = PTR_ERR_OR_ZERO(vibrator->vcc);
> > +       if (err)
> > +               return dev_err_probe(&pdev->dev, err, "Failed to request regulator\n");
> 
> Same comment, no need to have additional PTR_ERR_OZR_ZERO().

Yes.

Best regards,
Krzysztof

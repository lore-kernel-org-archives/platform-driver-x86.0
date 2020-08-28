From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 24/27] gpio: Add devm_fwnode_gpiod_get_optional() helpers
Date: Fri, 28 Aug 2020 16:45:24 +0200
Message-ID: <CAJKOXPej87cqgPtt4it66fp2CgjcyAQULG2260UH60hsnOZu7Q@mail.gmail.com>
References: <20200827185829.30096-1-krzk@kernel.org> <20200827185829.30096-25-krzk@kernel.org>
 <CACRpkdZNS6TTpUDEiezORKXu-h0Sdz_dPcCxmR+UbT_Rc+oMpw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZNS6TTpUDEiezORKXu-h0Sdz_dPcCxmR+UbT_Rc+oMpw@mail.gmail.com>
Sender: linux-input-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Bastien Nocera <hadess@hadess.net>, Sangwon Jee <jeesw@melfas.com>, Eugen Hristev <eugen.hristev@microchip.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux Input <linux-input@vger.kernel.org>, platform-driver-x86 <platform-driver-x86@vger.kernel.org>, clang-built-linux@googlegroups.com
List-Id: platform-driver-x86.vger.kernel.org

On Fri, 28 Aug 2020 at 16:31, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Thu, Aug 27, 2020 at 9:00 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> > Add devm_fwnode_gpiod_get_optional() and
> > devm_fwnode_gpiod_get_index_optional() helpers, similar to regular
> > devm_gpiod optional versions.  Drivers getting GPIOs from a firmware
> > node might use it to remove some boilerplate code.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>
> OK then, I suppose this gets merged with the rest?
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

That's the easiest unless you expect some conflicts. Only one next
patch depends on this so worst case it could wait one cycle.

Best regards,
Krzysztof

From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v4 06/14] software node: get rid of property_set_pointer()
Date: Wed, 11 Sep 2019 11:29:10 +0300
Message-ID: <CAHp75Ve5NvhzOQ96OgbPh1LdsAtvk+A=aVu-oXKdhnB4PpL_og@mail.gmail.com>
References: <20190911051231.148032-1-dmitry.torokhov@gmail.com> <20190911051231.148032-7-dmitry.torokhov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190911051231.148032-7-dmitry.torokhov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Sep 11, 2019 at 8:15 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Instead of explicitly setting values of integer types when copying
> property entries lets just copy entire value union when processing
> non-array values.
>
> When handling array values assign the pointer there using the newly
> introduced "raw" pointer union member. This allows us to remove
> property_set_pointer().
>
> In property_get_pointer() we do not need to handle each data type
> separately, we can simply return either the raw pointer or pointer to
> values union.

Same as before, typechecking is good thing to have for my point of view.
Others may have different opinions.

-- 
With Best Regards,
Andy Shevchenko

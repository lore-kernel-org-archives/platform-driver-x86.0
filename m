From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 07/27] Input: bu21013_ts - Simplify with dev_err_probe()
Date: Fri, 28 Aug 2020 16:29:45 +0200
Message-ID: <CACRpkdb-AfyD-E2yT5PEBw-GsteLw9HK9JLiZajixNBJUquR3g@mail.gmail.com>
References: <20200827185829.30096-1-krzk@kernel.org> <20200827185829.30096-8-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20200827185829.30096-8-krzk@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Bastien Nocera <hadess@hadess.net>, Sangwon Jee <jeesw@melfas.com>, Eugen Hristev <eugen.hristev@microchip.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux Input <linux-input@vger.kernel.org>, platform-driver-x86 <platform-driver-x86@vger.kernel.org>, clang-built-linux@googlegroups.com
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Aug 27, 2020 at 8:59 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:

> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

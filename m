From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 26/27] Input: bu21013_ts - Use local 'client->dev'
 variable in probe()
Date: Fri, 28 Aug 2020 16:32:03 +0200
Message-ID: <CACRpkdZQZ+ANpMmwFUbTxQ9=EZEXZkr7Z3DLbica=Q09bmntBQ@mail.gmail.com>
References: <20200827185829.30096-1-krzk@kernel.org> <20200827185829.30096-27-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <20200827185829.30096-27-krzk@kernel.org>
Sender: linux-input-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Bastien Nocera <hadess@hadess.net>, Sangwon Jee <jeesw@melfas.com>, Eugen Hristev <eugen.hristev@microchip.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux Input <linux-input@vger.kernel.org>, platform-driver-x86 <platform-driver-x86@vger.kernel.org>, clang-built-linux@googlegroups.com
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Aug 27, 2020 at 9:00 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:

> 'dev' is shorter and simpler than '&client->dev' and in few cases it
> allows to skip line wrapping. Probe function uses '&client->dev' a lot,
> so this improves readability slightly.
>
> Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH platform-next v1 5/8] platform/mellanox: mlxreg-io: Add
 support for complex attributes
Date: Thu, 9 Jul 2020 19:37:44 +0300
Message-ID: <CAHp75Vc+bK2RagNKr6abT=J9GrLwJ5bcj9Q5MhbGFo3Ho_VBDA@mail.gmail.com>
References: <20200601091851.5491-1-vadimp@mellanox.com> <20200601091851.5491-6-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200601091851.5491-6-vadimp@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Jun 1, 2020 at 12:19 PM Vadim Pasternak <vadimp@mellanox.com> wrote:
>
> Add support for attributes composed from few registers.
> Such attributes could occupy from 2 to 4 sequential registers.
> For word size register space complex attribute can occupy up to two

attributes

> register, for byte size - up to four. These attributes can carry, for

registers

> example, CPLD or FPGA versioning, power consuming info, etcetera.
> Such registers contain read only data.

read-only.

...

> +        * There are four kinds of attributes: single bit, full register's
> +        * bits, bit sequence, bits in few registers For the first kind field
> +        * mask indicates which bits are not related and field bit is set zero.
> +        * For the second kind field mask is set to zero and field bit is set
> +        * with all bits one. No special handling for such kind of attributes -
> +        * pass value as is. For the third kind, field mask indicates which

the field

> +        * bits are related and field bit is set to the first bit number (from

the field

> +        * 1 to 32) is the bit sequence. For the fourth kind - the number of
> +        * registers which should be read for getting an attribute are specified
> +        * through 'data->regnum' field.
>          */

...

> +               /*
> +                * Some attributes could occupied few registers in case regmap
> +                * bit size is 8 or 16. Compose such attribute from 'regnum'

attributes

> +                * registers. Such attributes contain read only data.

read-only

> +                */
> +               if (data->regnum > 1 && !rw_flag)

This I didn't get. They contain read-only data and here you explicitly
turn down rw_flag == false.
Can you clarify this?

> +                       return -EINVAL;
> +               for (i = 1; i < data->regnum; i++) {
> +                       ret = regmap_read(regmap, data->reg + i, &val);
> +                       if (ret)
> +                               goto access_error;
> +
> +                       *regval |= rol32(val, regsize * i);
> +               }

-- 
With Best Regards,
Andy Shevchenko

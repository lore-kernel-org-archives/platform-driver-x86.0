From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/mellanox: Use 2-factor allocator calls
Date: Fri, 13 Jul 2018 17:19:39 +0300
Message-ID: <CAHp75Vd2pX_AjMwEHQUOL7WfokgoY+bsakCJxbojBBxuuF_H+Q@mail.gmail.com>
References: <20180704172908.GA33650@beast> <HE1PR0502MB3753318D0C380DFEBCD6E452A2410@HE1PR0502MB3753.eurprd05.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <HE1PR0502MB3753318D0C380DFEBCD6E452A2410@HE1PR0502MB3753.eurprd05.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: Kees Cook <keescook@chromium.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jul 4, 2018 at 10:39 PM, Vadim Pasternak <vadimp@mellanox.com> wrote:
>
>
>> -----Original Message-----
>> From: Kees Cook [mailto:keescook@chromium.org]
>> Sent: Wednesday, July 04, 2018 8:29 PM
>> To: Darren Hart <dvhart@infradead.org>
>> Cc: Vadim Pasternak <vadimp@mellanox.com>; Andy Shevchenko
>> <andy@infradead.org>; platform-driver-x86@vger.kernel.org; linux-
>> kernel@vger.kernel.org
>> Subject: [PATCH] platform/mellanox: Use 2-factor allocator calls
>>
>> As already done treewide, switch from open-coded multiplication to using 2-
>> factor allocation helpers.
>>
>> Signed-off-by: Kees Cook <keescook@chromium.org>
>

Pushed to my review and testing queue, thanks!

> Acked-by: Vadim Pasternak <vadimp@mellanox.com>
>
>> ---
>>  drivers/platform/mellanox/mlxreg-io.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/platform/mellanox/mlxreg-io.c
>> b/drivers/platform/mellanox/mlxreg-io.c
>> index c192dfe6bd65..acfaf64ffde6 100644
>> --- a/drivers/platform/mellanox/mlxreg-io.c
>> +++ b/drivers/platform/mellanox/mlxreg-io.c
>> @@ -152,8 +152,8 @@ static int mlxreg_io_attr_init(struct mlxreg_io_priv_data
>> *priv)  {
>>       int i;
>>
>> -     priv->group.attrs = devm_kzalloc(&priv->pdev->dev,
>> -                                      priv->pdata->counter *
>> +     priv->group.attrs = devm_kcalloc(&priv->pdev->dev,
>> +                                      priv->pdata->counter,
>>                                        sizeof(struct attribute *),
>>                                        GFP_KERNEL);
>>       if (!priv->group.attrs)
>> --
>> 2.17.1
>>
>>
>> --
>> Kees Cook
>> Pixel Security



-- 
With Best Regards,
Andy Shevchenko

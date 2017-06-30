From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2] sony-laptop: constify spic_attribute_group and sony_laptop_input_index.
Date: Fri, 30 Jun 2017 19:13:07 +0300
Message-ID: <CAHp75Ve-hL30G_qgtqVcWiFFnSD0S0G5qZx7FgKkX1HU=cgRXA@mail.gmail.com>
References: <8d970553e4374fa42576306c2da1fc359a04aad5.1498799085.git.arvind.yadav.cs@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f193.google.com ([209.85.220.193]:36008 "EHLO
        mail-qk0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751560AbdF3QNI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 30 Jun 2017 12:13:08 -0400
In-Reply-To: <8d970553e4374fa42576306c2da1fc359a04aad5.1498799085.git.arvind.yadav.cs@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Arvind Yadav <arvind.yadav.cs@gmail.com>
Cc: Mattia Dongili <malattia@linux.it>, "dvhart@infradead.org" <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Jun 30, 2017 at 8:09 AM, Arvind Yadav <arvind.yadav.cs@gmail.com> wrote:
> attribute_groups are not supposed to change at runtime. All functions
> working with attribute_groups provided by <linux/sysfs.h> work with const
> attribute_group. So mark the non-const structs as const.
>
> File size before:
>    text    data     bss     dec     hex filename
>   31273    5176     372   36821    8fd5 drivers/platform/x86/sony-laptop.o
>
> File size After adding 'const':
>    text    data     bss     dec     hex filename
>   31337    5112     372   36821    8fd5 drivers/platform/x86/sony-laptop.o
>

A bit late, Arnd's patch has been applied. Please, test it beforehand next time.
Thanks.

> Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
> ---
> Changes in v2:
>               Resolve warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-array-qualifiers]
>   key_dev->keycode = &sony_laptop_input_keycode_map;
>
>  drivers/platform/x86/sony-laptop.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
> index aa2ee51..bfae795 100644
> --- a/drivers/platform/x86/sony-laptop.c
> +++ b/drivers/platform/x86/sony-laptop.c
> @@ -222,7 +222,7 @@ struct sony_laptop_keypress {
>  /* Correspondance table between sonypi events
>   * and input layer indexes in the keymap
>   */
> -static int sony_laptop_input_index[] = {
> +static const int sony_laptop_input_index[] = {
>         -1,     /*  0 no event */
>         -1,     /*  1 SONYPI_EVENT_JOGDIAL_DOWN */
>         -1,     /*  2 SONYPI_EVENT_JOGDIAL_UP */
> @@ -4032,7 +4032,7 @@ struct device_attribute spic_attr_##_name = __ATTR(_name, \
>         NULL
>  };
>
> -static struct attribute_group spic_attribute_group = {
> +static const struct attribute_group spic_attribute_group = {
>         .attrs = spic_attributes
>  };
>
> --
> 1.9.1
>



-- 
With Best Regards,
Andy Shevchenko

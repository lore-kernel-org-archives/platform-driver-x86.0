From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2] dell-rbtn: constify rfkill_ops structures
Date: Fri, 9 Jun 2017 13:25:20 +0300
Message-ID: <CAHp75VeY-FHG7EZ4KYjB=upz-Hi-tHBp5fWqWqhvm0d-SqSVMw@mail.gmail.com>
References: <1496987860-28818-1-git-send-email-bhumirks@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f196.google.com ([209.85.216.196]:33638 "EHLO
        mail-qt0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751531AbdFIKZW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 9 Jun 2017 06:25:22 -0400
In-Reply-To: <1496987860-28818-1-git-send-email-bhumirks@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Bhumika Goyal <bhumirks@gmail.com>
Cc: Julia Lawall <julia.lawall@lip6.fr>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, "dvhart@infradead.org" <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Jun 9, 2017 at 8:57 AM, Bhumika Goyal <bhumirks@gmail.com> wrote:
> Add const to rfkill_ops structures that are only passed as an argument
> to the functions rfkill_alloc or samsung_new_rfkill. These arguments are
> of type const, so such structures can be annotated with const.
>

All three pushed to testing, thanks

> Signed-off-by: Bhumika Goyal <bhumirks@gmail.com>
> ---
> Changes since v1:
> * Split the changes to one patch per vendor.
>
>  drivers/platform/x86/dell-rbtn.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/dell-rbtn.c b/drivers/platform/x86/dell-rbtn.c
> index dcd9f40..6b5bbaf 100644
> --- a/drivers/platform/x86/dell-rbtn.c
> +++ b/drivers/platform/x86/dell-rbtn.c
> @@ -110,7 +110,7 @@ static int rbtn_rfkill_set_block(void *data, bool blocked)
>         return -EINVAL;
>  }
>
> -static struct rfkill_ops rbtn_ops = {
> +static const struct rfkill_ops rbtn_ops = {
>         .query = rbtn_rfkill_query,
>         .set_block = rbtn_rfkill_set_block,
>  };
> --
> 2.7.4
>



-- 
With Best Regards,
Andy Shevchenko

From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: constify rfkill_ops structures
Date: Thu, 8 Jun 2017 15:38:22 +0300
Message-ID: <CAHp75VfKg+7AT7vX+Z9tf1WmYvPD-UKuCaBcW1xB1S4P4Rgr+Q@mail.gmail.com>
References: <1496920651-20298-1-git-send-email-bhumirks@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f193.google.com ([209.85.216.193]:36752 "EHLO
        mail-qt0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750788AbdFHMiX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 8 Jun 2017 08:38:23 -0400
In-Reply-To: <1496920651-20298-1-git-send-email-bhumirks@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Bhumika Goyal <bhumirks@gmail.com>
Cc: Julia Lawall <julia.lawall@lip6.fr>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, "dvhart@infradead.org" <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Ike Panhc <ike.pan@canonical.com>, Corentin Chary <corentin.chary@gmail.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Jun 8, 2017 at 2:17 PM, Bhumika Goyal <bhumirks@gmail.com> wrote:
> Add const to rfkill_ops structures that are only passed as an argument
> to the functions rfkill_alloc or samsung_new_rfkill. These arguments are
> of type const, so such structures can be annotated with const.

Change is fine by me, but please split to one patch per vendor.

>
> Signed-off-by: Bhumika Goyal <bhumirks@gmail.com>
> ---
>  drivers/platform/x86/dell-rbtn.c      | 2 +-
>  drivers/platform/x86/ideapad-laptop.c | 2 +-
>  drivers/platform/x86/samsung-laptop.c | 4 ++--
>  3 files changed, 4 insertions(+), 4 deletions(-)
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
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index 24ca9fb..3beec1e 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -478,7 +478,7 @@ static int ideapad_rfk_set(void *data, bool blocked)
>         return write_ec_cmd(priv->priv->adev->handle, opcode, !blocked);
>  }
>
> -static struct rfkill_ops ideapad_rfk_ops = {
> +static const struct rfkill_ops ideapad_rfk_ops = {
>         .set_block = ideapad_rfk_set,
>  };
>
> diff --git a/drivers/platform/x86/samsung-laptop.c b/drivers/platform/x86/samsung-laptop.c
> index 8c146e2..e1e8897 100644
> --- a/drivers/platform/x86/samsung-laptop.c
> +++ b/drivers/platform/x86/samsung-laptop.c
> @@ -591,7 +591,7 @@ static int seclinux_rfkill_set(void *data, bool blocked)
>                                  !blocked);
>  }
>
> -static struct rfkill_ops seclinux_rfkill_ops = {
> +static const struct rfkill_ops seclinux_rfkill_ops = {
>         .set_block = seclinux_rfkill_set,
>  };
>
> @@ -651,7 +651,7 @@ static void swsmi_rfkill_query(struct rfkill *rfkill, void *priv)
>         rfkill_set_sw_state(rfkill, !ret);
>  }
>
> -static struct rfkill_ops swsmi_rfkill_ops = {
> +static const struct rfkill_ops swsmi_rfkill_ops = {
>         .set_block = swsmi_rfkill_set,
>         .query = swsmi_rfkill_query,
>  };
> --
> 2.7.4
>



-- 
With Best Regards,
Andy Shevchenko

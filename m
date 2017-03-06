From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] x86: thinkpad_acpi: Handle return error.
Date: Mon, 6 Mar 2017 10:45:50 +0200
Message-ID: <CAHp75VcY2D3E3ogT_ySTVo8C5j17EYDXqn0mi0DEmkVqntwZPA@mail.gmail.com>
References: <1488786206-20190-1-git-send-email-arvind.yadav.cs@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f194.google.com ([209.85.220.194]:33815 "EHLO
        mail-qk0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752725AbdCFIy0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 6 Mar 2017 03:54:26 -0500
In-Reply-To: <1488786206-20190-1-git-send-email-arvind.yadav.cs@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Arvind Yadav <arvind.yadav.cs@gmail.com>
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, "dvhart@infradead.org" <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, ibm-acpi-devel@lists.sourceforge.net, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Mar 6, 2017 at 9:43 AM, Arvind Yadav <arvind.yadav.cs@gmail.com> wrote:
> This patch is for handling a return error.
>
> Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 1d18b32..19ad3ec 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -1237,9 +1237,11 @@ static int tpacpi_rfk_hook_set_block(void *data, bool blocked)
>         /* try to set radio state */

>         res = (tp_rfk->ops->set_status)(blocked ?
>                                 TPACPI_RFK_RADIO_OFF : TPACPI_RFK_RADIO_ON);

Just in case: first parens are redundant here.

> +       if (res < 0)
> +               return res;

So, this changes behaviour. Before we call _rfk_update_swstate()
independently on error code.

Care to explain in commit message how this change does / does not
affect overall user experience?

>         /* and update the rfkill core with whatever the FW really did */
> -       tpacpi_rfk_update_swstate(tp_rfk);
> +       res = tpacpi_rfk_update_swstate(tp_rfk);
>
>         return (res < 0) ? res : 0;
>  }

> @@ -3517,6 +3524,8 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
>         if (tp_features.hotkey_wlsw)
>                 res = add_to_attr_set(hotkey_dev_attributes,
>                                 &dev_attr_hotkey_radio_sw.attr);
> +       if (res)
> +               goto err_exit;
>
>         res = hotkey_init_tablet_mode();
>         if (res < 0)

Ditto for hotkey_init_tablet_mode().

-- 
With Best Regards,
Andy Shevchenko

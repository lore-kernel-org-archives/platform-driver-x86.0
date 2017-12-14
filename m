From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: dell-smbios: Block comments use * on
 subsequent lines
Date: Thu, 14 Dec 2017 19:59:07 +0200
Message-ID: <CAHp75VeRvQtMOUC2w9GXXwmORDOh5TjSOKZWUwv_Q-Dqxckr1Q@mail.gmail.com>
References: <20171213082105.23082-1-dhaval.shah@softnautics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f196.google.com ([209.85.220.196]:35130 "EHLO
        mail-qk0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753668AbdLNR7J (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 14 Dec 2017 12:59:09 -0500
In-Reply-To: <20171213082105.23082-1-dhaval.shah@softnautics.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dhaval Shah <dhaval.shah@softnautics.com>
Cc: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, Mario Limonciello <mario.limonciello@dell.com>, "dvhart@infradead.org" <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Dec 13, 2017 at 10:21 AM, Dhaval Shah
<dhaval.shah@softnautics.com> wrote:
> Resolved Block comments use * on subsequent lines checkpatch warnings.
> Issue found by checkpatch.
>

Same comments as for the other like this

> Signed-off-by: Dhaval Shah <dhaval.shah@softnautics.com>
> ---
>  drivers/platform/x86/dell-smbios.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x86/dell-smbios.c
> index 6a60db515bda..25a296c90e08 100644
> --- a/drivers/platform/x86/dell-smbios.c
> +++ b/drivers/platform/x86/dell-smbios.c
> @@ -353,7 +353,8 @@ static void __init parse_da_table(const struct dmi_header *dm)
>                 container_of(dm, struct calling_interface_structure, header);
>
>         /* 4 bytes of table header, plus 7 bytes of Dell header, plus at least
> -          6 bytes of entry */
> +        * 6 bytes of entry
> +        */
>
>         if (dm->length < 17)
>                 return;
> --
> 2.11.0
>



-- 
With Best Regards,
Andy Shevchenko

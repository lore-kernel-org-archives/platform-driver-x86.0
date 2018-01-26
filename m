From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: dell-smbios: Correct notation for filtering
Date: Fri, 26 Jan 2018 10:04:26 +0200
Message-ID: <CAHp75VcsPuqxNt6uMWWGZKe=WjXt1kJaOV5wwNSapnic9BJ_hQ@mail.gmail.com>
References: <1515164208-32510-1-git-send-email-mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1515164208-32510-1-git-send-email-mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: Darren Hart <dvhart@infradead.org>, LKML <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Jan 5, 2018 at 4:56 PM, Mario Limonciello
<mario.limonciello@dell.com> wrote:
> The class/select were mistakingly put into octal notation but

mistakenly

> intended to be in decimal notation.
>
> Suggest-by: Pali Rohar <pali.rohar@gmail.com>

Suggested-by:

> Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>

I have fixed above and pushed to my review and testing queue, thanks!

> ---
>  drivers/platform/x86/dell-smbios.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x86/dell-smbios.c
> index 6a60db5..8541cde 100644
> --- a/drivers/platform/x86/dell-smbios.c
> +++ b/drivers/platform/x86/dell-smbios.c
> @@ -65,10 +65,10 @@ static struct smbios_call call_whitelist[] = {
>
>  /* calls that are explicitly blacklisted */
>  static struct smbios_call call_blacklist[] = {
> -       {0x0000, 01, 07}, /* manufacturing use */
> -       {0x0000, 06, 05}, /* manufacturing use */
> -       {0x0000, 11, 03}, /* write once */
> -       {0x0000, 11, 07}, /* write once */
> +       {0x0000,  1,  7}, /* manufacturing use */
> +       {0x0000,  6,  5}, /* manufacturing use */
> +       {0x0000, 11,  3}, /* write once */
> +       {0x0000, 11,  7}, /* write once */
>         {0x0000, 11, 11}, /* write once */
>         {0x0000, 19, -1}, /* diagnostics */
>         /* handled by kernel: dell-laptop */
> --
> 2.7.4
>



-- 
With Best Regards,
Andy Shevchenko

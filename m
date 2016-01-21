From: Eric Curtin <ericcurtin17@gmail.com>
Subject: Re: [PATCH] Remove logging for "Unsupported brightness interface"
Date: Thu, 21 Jan 2016 11:18:07 +0000
Message-ID: <CANpvso4NpQgTj2x-65PxXw3VEY2rMiMpP+qT2Xjbx9q_n1g0zg@mail.gmail.com>
References: <CANpvso6S3jH0qYoPRmoNAc7sCsRd4UkosfzXFBAuLLUuZaPKCw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f54.google.com ([74.125.82.54]:38876 "EHLO
	mail-wm0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759199AbcAULSJ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 21 Jan 2016 06:18:09 -0500
In-Reply-To: <CANpvso6S3jH0qYoPRmoNAc7sCsRd4UkosfzXFBAuLLUuZaPKCw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: ibm-acpi-devel@lists.sourceforge.net, Darren Hart <dvhart@infradead.org>, Henrique de Moraes Holschuh <hmh@hmh.eng.br>, ibm-acpi@hmh.eng.br, Kernel development list <linux-kernel@vger.kernel.org>

On 16 January 2016 at 23:43, Eric Curtin <ericcurtin17@gmail.com> wrote:
> Message gets logged on machines that are well supported.
> Fixed one checkpatch.pl ERROR also.
>
> Signed-off-by: Eric Curtin <ericcurtin17@gmail.com>
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/platform/x86/thinkpad_acpi.c
> b/drivers/platform/x86/thinkpad_acpi.c
> index 0bed473..b149dec 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -6434,7 +6434,7 @@ static const struct tpacpi_quirk
> brightness_quirk_table[] __initconst = {
>   */
>  static void __init tpacpi_detect_brightness_capabilities(void)
>  {
> - unsigned int b;
> + const unsigned int b = tpacpi_check_std_acpi_brightness_support();
>
>   vdbg_printk(TPACPI_DBG_INIT,
>      "detecting firmware brightness interface capabilities\n");
> @@ -6447,7 +6447,6 @@ static void __init
> tpacpi_detect_brightness_capabilities(void)
>   * Lenovo Vista BIOS to ACPI brightness mode even if we are not
>   * going to publish a backlight interface
>   */
> - b = tpacpi_check_std_acpi_brightness_support();
>   switch (b) {
>   case 16:
>   bright_maxlvl = 15;
> @@ -6459,7 +6458,6 @@ static void __init
> tpacpi_detect_brightness_capabilities(void)
>   pr_info("detected a 8-level brightness capable ThinkPad\n");
>   break;
>   default:
> - pr_info("Unsupported brightness interface\n");
>   tp_features.bright_unkfw = 1;
>   bright_maxlvl = b - 1;
>   }
> @@ -7440,7 +7438,7 @@ static struct ibm_struct volume_driver_data = {
>
>  #define alsa_card NULL
>
> -static void inline volume_alsa_notify_change(void)
> +static inline void volume_alsa_notify_change(void)
>  {
>  }
>
> --
> 2.5.0

Hi Guys,

Sorry to be bugging you. Is this going to be accepted or not? Just a poke! :)

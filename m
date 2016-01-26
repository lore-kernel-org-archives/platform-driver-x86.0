From: Eric Curtin <ericcurtin17@gmail.com>
Subject: Re: [PATCH] Remove logging for "Unsupported brightness interface"
Date: Tue, 26 Jan 2016 19:39:59 +0000
Message-ID: <CANpvso4nAQS=PZ9a50K3M45XYV2KCJjz3BKfWtsOTFfzQ3jtcw@mail.gmail.com>
References: <CANpvso6S3jH0qYoPRmoNAc7sCsRd4UkosfzXFBAuLLUuZaPKCw@mail.gmail.com>
	<CANpvso4NpQgTj2x-65PxXw3VEY2rMiMpP+qT2Xjbx9q_n1g0zg@mail.gmail.com>
	<1453384483.1258747.498568498.27762FC4@webmail.messagingengine.com>
	<CANpvso5EHVvFeOmi312cf4wDrZavZZFegMvNyj7ZzoBNMcpr8g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CANpvso5EHVvFeOmi312cf4wDrZavZZFegMvNyj7ZzoBNMcpr8g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, Darren Hart <dvhart@infradead.org>, ibm-acpi@hmh.eng.br, Kernel development list <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On 23 January 2016 at 00:28, Eric Curtin <ericcurtin17@gmail.com> wrote:
> Message gets logged on machines that are well supported.
>
> Signed-off-by: Eric Curtin <ericcurtin17@gmail.com>
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/platform/x86/thinkpad_acpi.c
> b/drivers/platform/x86/thinkpad_acpi.c
> index a268a7a..4eb41aa 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -6661,7 +6661,6 @@ static void __init
> tpacpi_detect_brightness_capabilities(void)
>                 pr_info("detected a 8-level brightness capable ThinkPad\n");
>                 break;
>         default:
> -               pr_info("Unsupported brightness interface\n");
>                 tp_features.bright_unkfw = 1;
>                 bright_maxlvl = b - 1;
>         }
> --
> 2.5.0
>

Hi Guys,

This patch doesn't appear on any of the Linux kernel archive sites.
Could somebody enlighten me why this is so?

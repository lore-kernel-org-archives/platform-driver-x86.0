From: Eric Curtin <ericcurtin17@gmail.com>
Subject: Re: [PATCH] Remove ambiguous logging for "Unsupported brightness interface"
Date: Thu, 28 Jan 2016 00:36:50 +0000
Message-ID: <CANpvso7UtUrRh6cZT9aNYU7J62ofMMhr7S91Wwa8GWPHc3w1NQ@mail.gmail.com>
References: <CANpvso5_jzOgRv25isy0x6HJcTgKP4dabSH-_a5fM-uihdAUYw@mail.gmail.com>
	<1453937211.10099.31.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1453937211.10099.31.camel@perches.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: platform-driver-x86@vger.kernel.org, Kernel development list <linux-kernel@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Henrique de Moraes Holschuh <hmh@hmh.eng.br>, ibm-acpi-devel@lists.sourceforge.net
List-Id: platform-driver-x86.vger.kernel.org

On 27 January 2016 at 23:26, Joe Perches <joe@perches.com> wrote:
> On Wed, 2016-01-27 at 22:14 +0000, Eric Curtin wrote:
>> Message gets logged on machines that are well supported.
>>
>> Signed-off-by: Eric Curtin <ericcurtin17@gmail.com>
>> ---
>>  drivers/platform/x86/thinkpad_acpi.c | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/thinkpad_acpi.c
>> b/drivers/platform/x86/thinkpad_acpi.c
>> index a268a7a..4eb41aa 100644
>> --- a/drivers/platform/x86/thinkpad_acpi.c
>> +++ b/drivers/platform/x86/thinkpad_acpi.c
>> @@ -6661,7 +6661,6 @@ static void __init
>> tpacpi_detect_brightness_capabilities(void)
>>                 pr_info("detected a 8-level brightness capable
>> ThinkPad\n");
>>                 break;
>>         default:
>> -               pr_info("Unsupported brightness interface\n");
>>                 tp_features.bright_unkfw = 1;
>>                 bright_maxlvl = b - 1;
>>         }
>
> Perhaps this should be something like this instead:
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index a268a7a..bd12c71 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -6653,18 +6653,16 @@ static void __init tpacpi_detect_brightness_capabilities(void)
>         switch (b) {
>         case 16:
>                 bright_maxlvl = 15;
> -               pr_info("detected a 16-level brightness capable ThinkPad\n");
>                 break;
>         case 8:
>         case 0:
>                 bright_maxlvl = 7;
> -               pr_info("detected a 8-level brightness capable ThinkPad\n");
>                 break;
>         default:
> -               pr_info("Unsupported brightness interface\n");
>                 tp_features.bright_unkfw = 1;
>                 bright_maxlvl = b - 1;
>         }
> +       pr_info("detected %u brightness levels\n", bright_maxlvl + 1);
>  }
>
>  static int __init brightness_init(struct ibm_init_struct *iibm)

Maybe, but the other logging issues kinda mean something. There are
many, many reports of people thinking their brightness interface is
broken because of this logging message, when in reality the i915 driver
supports their devices just fine as previously stated.

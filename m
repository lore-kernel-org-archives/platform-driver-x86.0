From: Mukesh Ojha <mojha@codeaurora.org>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: fix spelling mistake
 "capabilites" -> "capabilities"
Date: Tue, 16 Apr 2019 12:24:16 +0530
Message-ID: <520f6626-246b-005f-53ef-df2f75a89cd9@codeaurora.org>
References: <20190415125204.7386-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190415125204.7386-1-colin.king@canonical.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Colin King <colin.king@canonical.com>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org


On 4/15/2019 6:22 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in a module parameter description. Fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
Reviewed-by: Mukesh Ojha <mojha@codeaurora.org>

Cheers,
-Mukesh

> ---
>   drivers/platform/x86/thinkpad_acpi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 57d9ae9d8e56..9192b686e9a6 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -10269,7 +10269,7 @@ MODULE_PARM_DESC(volume_mode,
>   
>   module_param_named(volume_capabilities, volume_capabilities, uint, 0444);
>   MODULE_PARM_DESC(volume_capabilities,
> -		 "Selects the mixer capabilites: 0=auto, 1=volume and mute, 2=mute only");
> +		 "Selects the mixer capabilities: 0=auto, 1=volume and mute, 2=mute only");
>   
>   module_param_named(volume_control, volume_control_allowed, bool, 0444);
>   MODULE_PARM_DESC(volume_control,

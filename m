From: Dmitry Tunin <hanipouspilot@gmail.com>
Subject: Re: [PATCH] ideapad_laptop: Lenovo G50-30 fix rfkill reports wireless
 blocked
Date: Wed, 11 Feb 2015 23:38:14 +0300
Message-ID: <54DBBDB6.5050202@gmail.com>
References: <1421585080-8004-1-git-send-email-hanipouspilot@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1421585080-8004-1-git-send-email-hanipouspilot@gmail.com>
Sender: stable-owner@vger.kernel.org
To: platform-driver-x86 <platform-driver-x86@vger.kernel.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, stable@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

> Lenovo G30-50 does not have a hardware wireless switch and wireless
> is always blocked.
> 
> BugLink: https://bugs.launchpad.net/bugs/1397021
> 
> Signed-off-by: Dmitry Tunin <hanipouspilot@gmail.com>
> Cc: stable@vger.kernel.org
> ---
>  drivers/platform/x86/ideapad-laptop.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index b3d419a..4e42253 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -843,6 +843,13 @@ static const struct dmi_system_id no_hw_rfkill_list[] = {
>  			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo YOGA 3 Pro-1370"),
>  		},
>  	},
> +	{
> +		.ident = "Lenovo G50-30",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo G50-30"),
> +		},
> +	},
>  	{}
>  };
>  
> 

Why is it ignored. Many people ask me when it is merged upstream. But you just don't answer.

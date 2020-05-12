From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] platform/x86: touchscreen_dmi: Add info for the Trekstor
 Yourbook C11B
Date: Tue, 12 May 2020 22:44:20 +0200
Message-ID: <2656984b-3eec-c6d0-f992-8f1f8973fe3e@redhat.com>
References: <20200512204009.4751-1-bernhardu@mailbox.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <20200512204009.4751-1-bernhardu@mailbox.org>
Content-Language: en-US
Sender: linux-input-owner@vger.kernel.org
To: =?UTF-8?Q?Bernhard_=c3=9cbelacker?= <bernhardu@mailbox.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Otmar Meier <otmarjun.meier@nexgo.de>
List-Id: platform-driver-x86.vger.kernel.org

Hi,

On 5/12/20 10:40 PM, Bernhard Übelacker wrote:
> Add touchscreen info for the Trekstor Yourbook C11B. It seems to
> use the same touchscreen as the Primebook C11, so we only add a new DMI
> match.
> 
> Cc: Otmar Meier <otmarjun.meier@nexgo.de>
> Reported-and-tested-by: Otmar Meier <otmarjun.meier@nexgo.de>
> Signed-off-by: Bernhard Übelacker <bernhardu@mailbox.org>

Thank you, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>   drivers/platform/x86/touchscreen_dmi.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
> index 6ec8923dec1a..d87315892458 100644
> --- a/drivers/platform/x86/touchscreen_dmi.c
> +++ b/drivers/platform/x86/touchscreen_dmi.c
> @@ -1106,6 +1106,14 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
>   			DMI_MATCH(DMI_BIOS_VERSION, "TREK.G.WI71C.JGBMRBA05"),
>   		},
>   	},
> +	{
> +		/* Trekstor Yourbook C11B (same touchscreen as the Primebook C11) */
> +		.driver_data = (void *)&trekstor_primebook_c11_data,
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "TREKSTOR"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "YOURBOOK C11B"),
> +		},
> +	},
>   	{
>   		/* Yours Y8W81, same case and touchscreen as Chuwi Vi8 */
>   		.driver_data = (void *)&chuwi_vi8_data,
> 

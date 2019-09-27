From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v3] platform/x86: dell-laptop: disable kbd backlight on
 Inspiron 10xx
Date: Fri, 27 Sep 2019 23:58:56 +0200
Message-ID: <20190927215856.v3zxxcg7klijanxh@pali>
References: <20190925082149.yjhmmb64i4h6sddi@pali>
 <156940489220.8635.14349142383780268583@WARFSTATION>
 <CAHp75VfkL3QGXYjeEEqr75SWCKo1SDEqS9q3YEQWYM4iXbUzcg@mail.gmail.com>
 <20190926081146.f4f26kun7ekwqsgj@pali>
 <156961914387.417.14261217089484891942@WARFSTATION>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <156961914387.417.14261217089484891942@WARFSTATION>
Sender: linux-kernel-owner@vger.kernel.org
To: Pacien TRAN-GIRARD <pacien.trangirard@pacien.net>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Mario Limonciello <Mario.Limonciello@dell.com>, Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Friday 27 September 2019 23:19:03 Pacien TRAN-GIRARD wrote:
> This patch adds a quirk disabling keyboard backlight support for the
> Dell Inspiron 1012 and 1018.
> 
> Those models wrongly report supporting keyboard backlight control
> features (through SMBIOS tokens) even though they're not equipped with
> a backlit keyboard. This led to broken controls being exposed
> through sysfs by this driver which froze the system when used.
> 
> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=107651
> Signed-off-by: Pacien TRAN-GIRARD <pacien.trangirard@pacien.net>
> ---

Thank you for update! Now it is clear what is the problem
and you can add my

Reviewed-by: Pali Rohár <pali.rohar@gmail.com>

>  drivers/platform/x86/dell-laptop.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
> index d27be2836bc2..74e988f839e8 100644
> --- a/drivers/platform/x86/dell-laptop.c
> +++ b/drivers/platform/x86/dell-laptop.c
> @@ -33,6 +33,7 @@
>  
>  struct quirk_entry {
>  	bool touchpad_led;
> +	bool kbd_led_not_present;
>  	bool kbd_led_levels_off_1;
>  	bool kbd_missing_ac_tag;
>  
> @@ -73,6 +74,10 @@ static struct quirk_entry quirk_dell_latitude_e6410 = {
>  	.kbd_led_levels_off_1 = true,
>  };
>  
> +static struct quirk_entry quirk_dell_inspiron_1012 = {
> +	.kbd_led_not_present = true,
> +};
> +
>  static struct platform_driver platform_driver = {
>  	.driver = {
>  		.name = "dell-laptop",
> @@ -310,6 +315,24 @@ static const struct dmi_system_id dell_quirks[] __initconst = {
>  		},
>  		.driver_data = &quirk_dell_latitude_e6410,
>  	},
> +	{
> +		.callback = dmi_matched,
> +		.ident = "Dell Inspiron 1012",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Inspiron 1012"),
> +		},
> +		.driver_data = &quirk_dell_inspiron_1012,
> +	},
> +	{
> +		.callback = dmi_matched,
> +		.ident = "Dell Inspiron 1018",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Inspiron 1018"),
> +		},
> +		.driver_data = &quirk_dell_inspiron_1012,
> +	},
>  	{ }
>  };
>  
> @@ -1493,6 +1516,9 @@ static void kbd_init(void)
>  {
>  	int ret;
>  
> +	if (quirks && quirks->kbd_led_not_present)
> +		return;
> +
>  	ret = kbd_init_info();
>  	kbd_init_tokens();
>  

-- 
Pali Rohár
pali.rohar@gmail.com

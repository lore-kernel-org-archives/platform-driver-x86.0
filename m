From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] compal-laptop: add charge control limit
Date: Fri, 18 Sep 2015 16:06:24 -0700
Message-ID: <20150918230624.GA23644@vmdeb7>
References: <20150912200016.GA17822@Compal.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150912200016.GA17822@Compal.home>
Sender: linux-kernel-owner@vger.kernel.org
To: Roald Frederickx <roald.frederickx@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Cezary Jackiewicz <cezary.jackiewicz@gmail.com>, Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>
List-Id: platform-driver-x86.vger.kernel.org

On Sat, Sep 12, 2015 at 10:00:16PM +0200, Roald Frederickx wrote:
> Add charge control limit to the power supply subsystem of the Compal
> platform driver.
> This apparently was present in the original driver by Cezary Jackiewicz
> at http://eko.one.pl/index.php?page=compal-laptop but it seems to have been
> overlooked.
> 
> The Kconfig description is updated to reflect this addition. It now also
> mentions the hwmon interface that was already present.
> 

Hi Roald,

Please run scripts/get_maintainer.pl -f path/to/files/changed and include all
maintainers and lists to ensure the fastest response.

+ Cezary

+ Andy, Joe
This patch triggered a false positive in checkpatch. This patch does not modify
this line, nor is this line intended to be an email address.

$ scripts/checkpatch.pl ~/incoming/PATCH_compal-laptop_add_charge_control_limit.mbox 
WARNING: Do not use whitespace before To:
#56: FILE: drivers/platform/x86/Kconfig:316:
          to: Documentation/platform/x86-laptop-drivers.txt

ERROR: Unrecognized email address: 'Documentation/platform/x86-laptop-drivers.txt'
#56: FILE: drivers/platform/x86/Kconfig:316:
          to: Documentation/platform/x86-laptop-drivers.txt

total: 1 errors, 1 warnings, 87 lines checked

/home/dvhart/incoming/PATCH_compal-laptop_add_charge_control_limit.mbox has style problems, please review.

NOTE: If any of the errors are false positives, please report
      them to the maintainer, see CHECKPATCH in MAINTAINERS.


> Signed-off-by: Roald Frederickx <roald.frederickx@gmail.com>

This looks reasonable Roald, queued to testing - pending ack from Cezary.

> ---
>  drivers/platform/x86/Kconfig         |  4 ++--
>  drivers/platform/x86/compal-laptop.c | 43 +++++++++++++++++++++++++++++++++++-
>  2 files changed, 44 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index c69bb70..2f9026d 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -309,8 +309,8 @@ config COMPAL_LAPTOP
>  	  This is a driver for laptops built by Compal, and some models by
>  	  other brands (e.g. Dell, Toshiba).
>  
> -	  It adds support for rfkill, Bluetooth, WLAN and LCD brightness
> -	  control.
> +	  It adds support for rfkill, Bluetooth, WLAN, LCD brightness, hwmon
> +	  and battery charging level control.
>  
>  	  For a (possibly incomplete) list of supported laptops, please refer
>  	  to: Documentation/platform/x86-laptop-drivers.txt
> diff --git a/drivers/platform/x86/compal-laptop.c b/drivers/platform/x86/compal-laptop.c
> index f2706d2..e1c2b6d 100644
> --- a/drivers/platform/x86/compal-laptop.c
> +++ b/drivers/platform/x86/compal-laptop.c
> @@ -151,6 +151,8 @@
>  #define BAT_STATUS2			0xF1
>  #define BAT_STOP_CHARGE1		0xF2
>  #define BAT_STOP_CHARGE2		0xF3
> +#define BAT_CHARGE_LIMIT		0x03
> +#define BAT_CHARGE_LIMIT_MAX		100
>  
>  #define BAT_S0_DISCHARGE		(1 << 0)
>  #define BAT_S0_DISCHRG_CRITICAL		(1 << 2)
> @@ -601,6 +603,12 @@ static int bat_get_property(struct power_supply *psy,
>  	case POWER_SUPPLY_PROP_CHARGE_NOW:
>  		val->intval = ec_read_u16(BAT_CHARGE_NOW) * 1000;
>  		break;
> +	case POWER_SUPPLY_PROP_CHARGE_CONTROL_LIMIT:
> +		val->intval = ec_read_u8(BAT_CHARGE_LIMIT);
> +		break;
> +	case POWER_SUPPLY_PROP_CHARGE_CONTROL_LIMIT_MAX:
> +		val->intval = BAT_CHARGE_LIMIT_MAX;
> +		break;
>  	case POWER_SUPPLY_PROP_CAPACITY:
>  		val->intval = ec_read_u8(BAT_CAPACITY);
>  		break;
> @@ -634,6 +642,36 @@ static int bat_get_property(struct power_supply *psy,
>  	return 0;
>  }
>  
> +static int bat_set_property(struct power_supply *psy,
> +				enum power_supply_property psp,
> +				const union power_supply_propval *val)
> +{
> +	int level;
> +
> +	switch (psp) {
> +	case POWER_SUPPLY_PROP_CHARGE_CONTROL_LIMIT:
> +		level = val->intval;
> +		if (level < 0 || level > BAT_CHARGE_LIMIT_MAX)
> +			return -EINVAL;
> +		if (ec_write(BAT_CHARGE_LIMIT, level) < 0)
> +			return -EIO;
> +		break;
> +	default:
> +		break;
> +	}
> +	return 0;
> +}
> +
> +static int bat_writeable_property(struct power_supply *psy,
> +				enum power_supply_property psp)
> +{
> +	switch (psp) {
> +	case POWER_SUPPLY_PROP_CHARGE_CONTROL_LIMIT:
> +		return 1;
> +	default:
> +		return 0;
> +	}
> +}
>  
>  
>  
> @@ -726,6 +764,8 @@ static enum power_supply_property compal_bat_properties[] = {
>  	POWER_SUPPLY_PROP_POWER_NOW,
>  	POWER_SUPPLY_PROP_CHARGE_FULL_DESIGN,
>  	POWER_SUPPLY_PROP_CHARGE_NOW,
> +	POWER_SUPPLY_PROP_CHARGE_CONTROL_LIMIT,
> +	POWER_SUPPLY_PROP_CHARGE_CONTROL_LIMIT_MAX,
>  	POWER_SUPPLY_PROP_CAPACITY,
>  	POWER_SUPPLY_PROP_CAPACITY_LEVEL,
>  	POWER_SUPPLY_PROP_TEMP,
> @@ -880,11 +920,12 @@ static const struct power_supply_desc psy_bat_desc = {
>  	.properties	= compal_bat_properties,
>  	.num_properties	= ARRAY_SIZE(compal_bat_properties),
>  	.get_property	= bat_get_property,
> +	.set_property	= bat_set_property,
> +	.property_is_writeable = bat_writeable_property,
>  };
>  
>  static void initialize_power_supply_data(struct compal_data *data)
>  {
> -
>  	ec_read_sequence(BAT_MANUFACTURER_NAME_ADDR,
>  					data->bat_manufacturer_name,
>  					BAT_MANUFACTURER_NAME_LEN);
> -- 
> 1.9.2
> 
> --
> To unsubscribe from this list: send the line "unsubscribe platform-driver-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

-- 
Darren Hart
Intel Open Source Technology Center

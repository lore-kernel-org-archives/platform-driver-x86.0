From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v3 02/10] usb: roles: Handle driver reference counting
Date: Thu, 6 Sep 2018 22:59:34 +0200
Message-ID: <881eb4df-3e77-3475-1ec7-02b060b7ad83@redhat.com>
References: <20180904112219.89287-1-heikki.krogerus@linux.intel.com>
 <20180904112219.89287-3-heikki.krogerus@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20180904112219.89287-3-heikki.krogerus@linux.intel.com>
Content-Language: en-US
Sender: stable-owner@vger.kernel.org
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-usb@vger.kernel.org, stable@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

HI,

On 04-09-18 13:22, Heikki Krogerus wrote:
> This fixes potential "BUG: unable to handle kernel paging
> request at ..." from happening.
> 
> Fixes: fde0aa6c175a ("usb: common: Small class for USB role switches")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>   drivers/usb/common/roles.c | 15 ++++++++++++---
>   1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/common/roles.c b/drivers/usb/common/roles.c
> index 15cc76e22123..3d8a776e55ee 100644
> --- a/drivers/usb/common/roles.c
> +++ b/drivers/usb/common/roles.c
> @@ -109,8 +109,15 @@ static void *usb_role_switch_match(struct device_connection *con, int ep,
>    */
>   struct usb_role_switch *usb_role_switch_get(struct device *dev)
>   {
> -	return device_connection_find_match(dev, "usb-role-switch", NULL,
> -					    usb_role_switch_match);
> +	struct usb_role_switch *sw;
> +
> +	sw = device_connection_find_match(dev, "usb-role-switch", NULL,
> +					  usb_role_switch_match);
> +
> +	if (!IS_ERR(sw))
> +		WARN_ON(!try_module_get(sw->dev.parent->driver->owner));

While testing I found a bug, so sorry but this is going to need a v4,
device_connection_find_match() may return NULL here, so this needs
to be if (!IS_ERR_OR_NULL(sw)) to avoid an oops.

Note I'm also seeing some other issues which I need to debug I will
do so tomorrow morning so you may want to wait a bit with v4.

Regards,

Hans


> +
> +	return sw;
>   }
>   EXPORT_SYMBOL_GPL(usb_role_switch_get);
>   
> @@ -122,8 +129,10 @@ EXPORT_SYMBOL_GPL(usb_role_switch_get);
>    */
>   void usb_role_switch_put(struct usb_role_switch *sw)
>   {
> -	if (!IS_ERR_OR_NULL(sw))
> +	if (!IS_ERR_OR_NULL(sw)) {
>   		put_device(&sw->dev);
> +		module_put(sw->dev.parent->driver->owner);
> +	}
>   }
>   EXPORT_SYMBOL_GPL(usb_role_switch_put);
>   
> 

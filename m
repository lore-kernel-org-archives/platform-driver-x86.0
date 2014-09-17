From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 3/9] eeepc-laptop: use DEVICE_ATTR* to instantiate
 device_attributes
Date: Wed, 17 Sep 2014 15:06:50 -0700
Message-ID: <20140917220650.GA20915@kroah.com>
References: <1410990447-3210-1-git-send-email-fransklaver@gmail.com>
 <1410990447-3210-4-git-send-email-fransklaver@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:55300 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755998AbaIQWHj (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 17 Sep 2014 18:07:39 -0400
Content-Disposition: inline
In-Reply-To: <1410990447-3210-4-git-send-email-fransklaver@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Frans Klaver <fransklaver@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Corentin Chary <corentin.chary@gmail.com>, Rafael Wysocki <rafael.j.wysocki@intel.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Sep 17, 2014 at 11:47:21PM +0200, Frans Klaver wrote:
> Device attributes are instantiated manually, while we have DEVICE_ATTR*
> macros available to do much of the work for us. Let's use them.
> 
> Signed-off-by: Frans Klaver <fransklaver@gmail.com>
> ---
>  drivers/platform/x86/eeepc-laptop.c | 34 ++++------------------------------
>  1 file changed, 4 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/platform/x86/eeepc-laptop.c b/drivers/platform/x86/eeepc-laptop.c
> index 0094449..db26f78 100644
> --- a/drivers/platform/x86/eeepc-laptop.c
> +++ b/drivers/platform/x86/eeepc-laptop.c
> @@ -308,13 +308,7 @@ static ssize_t show_sys_acpi(struct device *dev, int cm, char *buf)
>  	{								\
>  		return store_sys_acpi(dev, _cm, buf, count);		\
>  	}								\
> -	static struct device_attribute dev_attr_##_name = {		\
> -		.attr = {						\
> -			.name = __stringify(_name),			\
> -			.mode = _mode },				\
> -		.show   = _name##_show,					\
> -		.store  = _name##_store,				\
> -	}
> +	static DEVICE_ATTR(_name, _mode, _name##_show, _name##_store)

Can you change this to be DEVICE_ATTR_RO()?

If not, split it up into 2 different macros, one using the _RW and one
_RO version, _never_ have the driver specify the mode of the sysfs file
please.

thanks,

greg k-h

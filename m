From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH 05/10] platform/x86: fujitsu-laptop: distinguish current
 uses of device-specific data
Date: Mon, 1 May 2017 23:10:13 +0930
Message-ID: <20170501134013.GE25546@marvin.atrad.com.au>
References: <20170424133334.7064-1-kernel@kempniu.pl>
 <20170424133334.7064-6-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:59072 "EHLO
        server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1166031AbdEANkq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 1 May 2017 09:40:46 -0400
Content-Disposition: inline
In-Reply-To: <20170424133334.7064-6-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Micha?? K??pie?? <kernel@kempniu.pl>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Apr 24, 2017 at 03:33:29PM +0200, Micha?? K??pie?? wrote:
> In portions of the driver which use device-specific data, rename local
> variables from fujitsu_bl and fujitsu_laptop to priv in order to clearly
> distinguish these parts from code that uses module-wide data.
> 
> Signed-off-by: Micha?? K??pie?? <kernel@kempniu.pl>
> ---
>  drivers/platform/x86/fujitsu-laptop.c | 48 +++++++++++++++++------------------
>  1 file changed, 24 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
> index 5f6b34a97348..536b601c7067 100644
> --- a/drivers/platform/x86/fujitsu-laptop.c
> +++ b/drivers/platform/x86/fujitsu-laptop.c
> @@ -369,26 +369,26 @@ static const struct key_entry keymap_backlight[] = {
>  
>  static int acpi_fujitsu_bl_input_setup(struct acpi_device *device)
>  {
> -	struct fujitsu_bl *fujitsu_bl = acpi_driver_data(device);
> +	struct fujitsu_bl *priv = acpi_driver_data(device);

[cut]

>  static int fujitsu_backlight_register(struct acpi_device *device)
> @@ -566,27 +566,27 @@ static const struct dmi_system_id fujitsu_laptop_dmi_table[] = {
>  
>  static int acpi_fujitsu_laptop_input_setup(struct acpi_device *device)
>  {
> -	struct fujitsu_laptop *fujitsu_laptop = acpi_driver_data(device);
> +	struct fujitsu_laptop *priv = acpi_driver_data(device);
>  	int ret;

Distinguishing between local and global use like this makes sense, but I
feel we should stick with a slightly more descriptive name than "priv". 
Without any qualification, "priv" could refer to private device-specific
data from either the fujitsu_bl or fujitsu_laptop drivers.  From the source
it is far from obvious which is being accessed in a given function.  If we
implemented only a single ACPI device driver then this would be largely a
moot point, but as there are two within the one module the loss of the
description could make it harder to follow the code later on.

Could we use "bl_priv" and "laptop_priv" for example, so as to provide a
clue within the source code as to what exactly is being referenced? 
Obviously it doesn't provide any compile time type checking, but it's better
than nothing.

Regards
  jonathan

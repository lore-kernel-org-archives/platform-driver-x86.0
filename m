From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] dell-smbios: fix string overflow
Date: Thu, 9 Nov 2017 09:31:41 +0100
Message-ID: <20171109083141.g4fvxsuoprwlkud3@pali>
References: <20171108120844.3196747-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171108120844.3196747-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Mario Limonciello <mario.limonciello@dell.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Edward O'Callaghan <quasisec@google.com>, Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wednesday 08 November 2017 13:08:39 Arnd Bergmann wrote:
> The new sysfs code overwrites two fixed-length character arrays
> that are each one byte shorter than they need to be, to hold
> the trailing \0:
> 
> drivers/platform/x86/dell-smbios.c: In function 'build_tokens_sysfs':
> drivers/platform/x86/dell-smbios.c:494:42: error: 'sprintf' writing a terminating nul past the end of the destination [-Werror=format-overflow=]
>    sprintf(buffer_location, "%04x_location",
> drivers/platform/x86/dell-smbios.c:494:3: note: 'sprintf' output 14 bytes into a destination of size 13
> drivers/platform/x86/dell-smbios.c:506:36: error: 'sprintf' writing a terminating nul past the end of the destination [-Werror=format-overflow=]
>    sprintf(buffer_value, "%04x_value",
> drivers/platform/x86/dell-smbios.c:506:3: note: 'sprintf' output 11 bytes into a destination of size 10
> 
> This changes it to just use kasprintf(), which always gets it right.
> 
> Fixes: 33b9ca1e53b4 ("platform/x86: dell-smbios: Add a sysfs interface for SMBIOS tokens")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Pali Rohár <pali.rohar@gmail.com>

> ---
>  drivers/platform/x86/dell-smbios.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x86/dell-smbios.c
> index d99edd803c19..6a60db515bda 100644
> --- a/drivers/platform/x86/dell-smbios.c
> +++ b/drivers/platform/x86/dell-smbios.c
> @@ -463,8 +463,6 @@ static struct platform_driver platform_driver = {
>  
>  static int build_tokens_sysfs(struct platform_device *dev)
>  {
> -	char buffer_location[13];
> -	char buffer_value[10];
>  	char *location_name;
>  	char *value_name;
>  	size_t size;
> @@ -491,9 +489,8 @@ static int build_tokens_sysfs(struct platform_device *dev)
>  		if (da_tokens[i].tokenID == 0)
>  			continue;
>  		/* add location */
> -		sprintf(buffer_location, "%04x_location",
> -			da_tokens[i].tokenID);
> -		location_name = kstrdup(buffer_location, GFP_KERNEL);
> +		location_name = kasprintf(GFP_KERNEL, "%04x_location",
> +					  da_tokens[i].tokenID);
>  		if (location_name == NULL)
>  			goto out_unwind_strings;
>  		sysfs_attr_init(&token_location_attrs[i].attr);
> @@ -503,9 +500,8 @@ static int build_tokens_sysfs(struct platform_device *dev)
>  		token_attrs[j++] = &token_location_attrs[i].attr;
>  
>  		/* add value */
> -		sprintf(buffer_value, "%04x_value",
> -			da_tokens[i].tokenID);
> -		value_name = kstrdup(buffer_value, GFP_KERNEL);
> +		value_name = kasprintf(GFP_KERNEL, "%04x_value",
> +				       da_tokens[i].tokenID);
>  		if (value_name == NULL)
>  			goto loop_fail_create_value;
>  		sysfs_attr_init(&token_value_attrs[i].attr);

-- 
Pali Rohár
pali.rohar@gmail.com

From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] platform/x86: Kconfig: Fix dell-laptop dependency chain.
Date: Fri, 20 Apr 2018 10:53:06 -0700
Message-ID: <858fbd0a-a387-e9f8-5017-1fff9638dd4d@infradead.org>
References: <1524246131-17621-1-git-send-email-mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1524246131-17621-1-git-send-email-mario.limonciello@dell.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mario Limonciello <mario.limonciello@dell.com>, dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On 04/20/18 10:42, Mario Limonciello wrote:
> As reported by Randy Dunlap:
>>> WARNING: unmet direct dependencies detected for DELL_SMBIOS
>>>   Depends on [m]: X86 [=y] && X86_PLATFORM_DEVICES [=y]
>>> 	&& (DCDBAS [=m] ||
>>> DCDBAS [=m]=n) && (ACPI_WMI [=n] || ACPI_WMI [=n]=n)
>>>   Selected by [y]:
>>>   - DELL_LAPTOP [=y] && X86 [=y] && X86_PLATFORM_DEVICES [=y]
>>> && DMI [=y]
>>> && BACKLIGHT_CLASS_DEVICE [=y] && (ACPI_VIDEO [=n] ||
>>> 	ACPI_VIDEO [=n]=n)
>>> && (RFKILL [=n] || RFKILL [=n]=n) && SERIO_I8042 [=y]
>>>
> 
> Right now it's possible to set dell laptop to compile in but this
> causes dell-smbios to compile in which breaks if dcdbas is a module.
> 
> Dell laptop shouldn't select dell-smbios anymore, but depend on it.
> 
> Fixes: 32d7b19 (platform/x86: dell-smbios: Resolve dependency error on DCDBAS)

meta-comment: the SHA-1 ID should be the first 12 characters of the commit ID
according to Documentation/process/submitting-patches.rst.


> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>

Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  drivers/platform/x86/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 39d06dd..bc309c5 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -154,7 +154,7 @@ config DELL_LAPTOP
>  	depends on ACPI_VIDEO || ACPI_VIDEO = n
>  	depends on RFKILL || RFKILL = n
>  	depends on SERIO_I8042
> -	select DELL_SMBIOS
> +	depends on DELL_SMBIOS
>  	select POWER_SUPPLY
>  	select LEDS_CLASS
>  	select NEW_LEDS
> 


-- 
~Randy

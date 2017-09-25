From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH 01/12] platform/x86: dell-wmi: label driver as handling
 notifications
Date: Mon, 25 Sep 2017 18:04:05 +0200
Message-ID: <20170925160405.GG22190@pali>
References: <cover.1505999739.git.mario.limonciello@dell.com>
 <2c923ea1cdb0a336bf849fa8a2d81bb93060fccb.1505999739.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2c923ea1cdb0a336bf849fa8a2d81bb93060fccb.1505999739.git.mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: dvhart@infradead.org, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, quasisec@google.com
List-Id: platform-driver-x86.vger.kernel.org

On Thursday 21 September 2017 08:57:06 Mario Limonciello wrote:
> This driver serves the purpose of responding to WMI based notifications
> from the DELL_EVENT_GUID (9DBB5994-A997-11DA-B012-B622A1EF5492).
> Other GUIDs will be handled by separate drivers.
> 
> Update the language used by this driver to avoid future confusion.

Hi! I'm not sure if if "notifications" word is better then "extras".
Basically the most important part of the dell-wmi driver is to deliver
key press events via input device.

Has anybody else better word or description for this?

> Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
> ---
>  MAINTAINERS                  | 2 +-
>  drivers/platform/x86/Kconfig | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2281af4b41b6..5d8ea24a8ee7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3996,7 +3996,7 @@ S:	Maintained
>  F:	Documentation/dcdbas.txt
>  F:	drivers/firmware/dcdbas.*
>  
> -DELL WMI EXTRAS DRIVER
> +DELL WMI NOTIFICATIONS DRIVER
>  M:	Matthew Garrett <mjg59@srcf.ucam.org>
>  M:	Pali Rohár <pali.rohar@gmail.com>
>  S:	Maintained
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 80b87954f6dd..9e52f05daa2e 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -116,7 +116,7 @@ config DELL_LAPTOP
>  	laptops (except for some models covered by the Compal driver).
>  
>  config DELL_WMI
> -	tristate "Dell WMI extras"
> +	tristate "Dell WMI notifications"
>  	depends on ACPI_WMI
>  	depends on DMI
>  	depends on INPUT

-- 
Pali Rohár
pali.rohar@gmail.com

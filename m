From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v3] platform: x86: Add ACPI driver for ChromeOS
Date: Mon, 30 Mar 2020 10:29:02 -0700
Message-ID: <843663ae-10bf-7dfa-4a1f-91493de882c5@infradead.org>
References: <20200330150617.1132570-1-enric.balletbo@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200330150617.1132570-1-enric.balletbo@collabora.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>, linux-kernel@vger.kernel.org
Cc: groeck@chromium.org, bleung@chromium.org, dtor@chromium.org, gwendal@chromium.org, Collabora Kernel ML <kernel@collabora.com>, vbendeb@chromium.org, andy@infradead.org, Ayman Bagabas <ayman.bagabas@gmail.com>, Darren Hart <dvhart@infradead.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jeremy Soller <jeremy@system76.com>, Jonathan Corbet <corbet@lwn.net>, Krzysztof Kozlowski <krzk@kernel.org>, Mattias Jacobsson <2pi@mok.nu>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Rajat Jain <rajatja@google.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Yauhen Kharuzhy <jekhor@gmail.com>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi--

On 3/30/20 8:06 AM, Enric Balletbo i Serra wrote:
> This driver attaches to the ChromeOS ACPI device and then exports the values
> reported by the ACPI in a sysfs directory. These values are not exported
> via the standard ACPI tables, hence a specific driver is needed to do
> it. The ACPI values are presented in the string form (numbers as decimal
> values) or binary blobs, and can be accessed as the contents of the
> appropriate read only files in the standard ACPI devices sysfs directory tree.
> 
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---

> 
> Thanks,
>  Enric
> 
> [1] https://lkml.org/lkml/2017/7/31/378
> 
> Changes in v3:
> - Use attribute groups instead of adding files "by hand".
> - Add BUILD_TEST to increment build coverage.

Where was BUILD_TEST coverage added?
Is that the same as COMPILE_TEST?

> - Do not use "raw" kobject to create directories.
> - Do not abuse of the platform_device interface. Remove it.
> 
> Changes in v2:
> - Note that this version is a total rework, with those major changes:
>   - Use lists to track dinamically allocated attributes and groups.
>   - Use sysfs binary attributes to store the ACPI contents.
>   - Remove all the functionalities except the one that creates the sysfs files.
> 
>  drivers/platform/x86/Kconfig         |  12 +
>  drivers/platform/x86/Makefile        |   1 +
>  drivers/platform/x86/chromeos_acpi.c | 517 +++++++++++++++++++++++++++
>  3 files changed, 530 insertions(+)
>  create mode 100644 drivers/platform/x86/chromeos_acpi.c
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 587403c44598..917a1c1a0758 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -72,6 +72,18 @@ config ACERHDF
>  	  If you have an Acer Aspire One netbook, say Y or M
>  	  here.
>  
> +config ACPI_CHROMEOS
> +	tristate "ChromeOS specific ACPI extensions"
> +	depends on ACPI
> +	depends on CHROME_PLATFORMS
> +	help
> +	  This driver provides the firmware interface for the services
> +	  exported through the ChromeOS interfaces when using ChromeOS
> +	  ACPI firmware.
> +
> +	  If you have an ACPI-compatible Chromebook, say Y or M
> +	  here.
> +
>  config ALIENWARE_WMI
>  	tristate "Alienware Special feature control"
>  	depends on ACPI

thanks.
-- 
~Randy

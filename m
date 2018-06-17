From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v6 6/8] platform/mellanox: Introduce support for Mellanox
 register access driver
Date: Sun, 17 Jun 2018 09:52:16 -0700
Message-ID: <b804ccc4-77c3-e7a9-9486-8d12d50ec5f7@infradead.org>
References: <1529254615-88124-1-git-send-email-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1529254615-88124-1-git-send-email-vadimp@mellanox.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Vadim Pasternak <vadimp@mellanox.com>, dvhart@infradead.org, andy.shevchenko@gmail.com, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us, michaelsh@mellanox.com, ivecera@redhat.com
List-Id: platform-driver-x86.vger.kernel.org

On 06/17/2018 09:56 AM, Vadim Pasternak wrote:
> ---
>  drivers/platform/mellanox/Kconfig     |  11 ++
>  drivers/platform/mellanox/Makefile    |   1 +
>  drivers/platform/mellanox/mlxreg-io.c | 245 ++++++++++++++++++++++++++++++++++
>  3 files changed, 257 insertions(+)
>  create mode 100644 drivers/platform/mellanox/mlxreg-io.c

Hi,

> diff --git a/drivers/platform/mellanox/Kconfig b/drivers/platform/mellanox/Kconfig
> index 591bccd..ddfae9fc 100644
> --- a/drivers/platform/mellanox/Kconfig
> +++ b/drivers/platform/mellanox/Kconfig
> @@ -23,4 +23,15 @@ config MLXREG_HOTPLUG
>  	  This driver handles hot-plug events for the power suppliers, power
>  	  cables and fans on the wide range Mellanox IB and Ethernet systems.
>  
> +config MLXREG_IO
> +	tristate "Mellanox platform register access driver support"
> +	depends on REGMAP
> +	depends on HWMON
> +	help
> +	  This driver allows access to Mellanox programmable device register
> +	  space trough sysfs interface. The sets of registers for sysfs access

	        through

> +	  are defined per system type bases and includes the registers related

	                                    and include the

> +	  to system resets operation, system reset causes monitoring and some
> +	  kinds of mux selection.
> +
>  endif # MELLANOX_PLATFORM


-- 
~Randy

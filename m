From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch v3] x86/platform/mellanox: introduce support for Mellanox
 systems platform
Date: Tue, 20 Sep 2016 01:23:07 +0200 (CEST)
Message-ID: <alpine.DEB.2.20.1609200121160.5524@nanos>
References: <1474278183-132901-1-git-send-email-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1474278183-132901-1-git-send-email-vadimp@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: mingo@redhat.com, hpa@zytor.com, davem@davemloft.net, geert@linux-m68k.org, akpm@linux-foundation.org, gregkh@linuxfoundation.org, kvalo@codeaurora.org, mchehab@kernel.org, linux@roeck-us.net, x86@kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us
List-Id: platform-driver-x86.vger.kernel.org

On Mon, 19 Sep 2016, vadimp@mellanox.com wrote:
> +config MLX_PLATFORM
> +	tristate "Mellanox Technologies platform support"
> +	depends on X86_64
> +	depends on X86_EXTENDED_PLATFORM

I can understand those, but

> +	depends on DMI
> +	depends on I2C_MLXCPLD
> +	depends on I2C_MUX_REG

these should be simply selected. I really hate to find all the dependencies
and fiddle in a gazillion of menuconfig leafs just to get that stuff
compiled.

Thanks,

	tglx

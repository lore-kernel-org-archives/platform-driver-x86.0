From: Darren Hart <dvhart@infradead.org>
Subject: Re: [patch v8 0/3] drivers/platform: replace module
 x86/mlxcpld-hotplug with mellanox/mlxreg-hotplug
Date: Mon, 15 Jan 2018 19:42:09 -0800
Message-ID: <20180116034209.GA4590@fury>
References: <1515661123-76604-1-git-send-email-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1515661123-76604-1-git-send-email-vadimp@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: andy.shevchenko@gmail.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Jan 11, 2018 at 08:58:40AM +0000, Vadim Pasternak wrote:
> The patchset:
>  - replaces modules include/linux/platform_data/mlxcpld-hotplug.h and
>    drivers/platform/x86/mlxcpld-hotplug.c with the modules
>    include/linux/platform_data/mlxreg.h and
>    drivers/platform/mellanox/mlxreg-hotplug.c;
>    relevant Makefile and Kconfig are updated;
>  - modifies Mellanox hotplug driver for making it architecture
>    independent. Drivers has been tested for x86 and ARM based systems.
>  - introduces regmap interface for mlxreg-hotplug driver to allow hotplug
>    event functionality over programmable devices logic, when these devices
>    can be attached to different interfaces types, like I2C, LPC, SPI;
>    driver drivers/platform/x86/mlx-platform.c is updated according to new
>    interface.

Individual review to follow. In general, this series is difficult to
review as it does not present the changes in an incremental fashion. It
appears to have been broken up from a major wholesale re-write. This is
made evident by several stray or out of place changes which are not
consistent with the commit messages and the very large 3/3 patch.

This has waited long enough by no fault of Vadim's, and the impact is
very localized.

Vadim, I'd appreciate it if you would reply to the individual reviews,
and I think I can work with the existing series and tweak a couple
things in the commit messages, and possibly move a Kconfig change to a
different patch, and we can move forward with this.

To follow this email, are two patches which are minor incremental
cleanups, which I'd appreciate your review of before I push them to
testing.

-- 
Darren Hart
VMware Open Source Technology Center

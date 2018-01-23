From: Darren Hart <dvhart@infradead.org>
Subject: Re: [patch v9 0/4] drivers/platform: Replace module
 x86/mlxcpld-hotplug with mellanox/mlxreg-hotplug
Date: Mon, 22 Jan 2018 20:13:28 -0800
Message-ID: <20180123041328.GF24956@fury>
References: <1516213316-32278-1-git-send-email-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:50681 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751293AbeAWENc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 22 Jan 2018 23:13:32 -0500
Content-Disposition: inline
In-Reply-To: <1516213316-32278-1-git-send-email-vadimp@mellanox.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: andy.shevchenko@gmail.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us

On Wed, Jan 17, 2018 at 06:21:52PM +0000, Vadim Pasternak wrote:
> The patchset:
>  - replaces modules include/linux/platform_data/mlxcpld-hotplug.h and
>    drivers/platform/x86/mlxcpld-hotplug.c with the modules
>    include/linux/platform_data/mlxreg.h and
>    drivers/platform/mellanox/mlxreg-hotplug.c;
>    relevant Makefile and Kconfig are updated;
>  - modifies Mellanox hotplug driver for making it architecture
>    independent. Drivers has been tested for x86 and ARM based systems.
>  - includes code cleanup;
>  - introduces regmap interface for mlxreg-hotplug driver to allow hotplug
>    event functionality over programmable devices logic, when these devices
>    can be attached to different interfaces types, like I2C, LPC, SPI;
>    driver drivers/platform/x86/mlx-platform.c is updated according to new
>    interface.

This series is still not dividing up changes into small functional chunks. It
"ping pongs" (adding then later removing code), and makes it difficult to review
functional changes by surrounding them with non-functional transformations. As
I've attempted to break this apart myself, I've discovered a few issues with the
code - see the responses to the individual patches.

You can find my broken up version here:
http://git.infradead.org/linux-platform-drivers-x86.git/shortlog/refs/heads/review-dvhart-mellanox-v10

In particular, please see:
http://git.infradead.org/linux-platform-drivers-x86.git/commit/4f0057fc3da29c04e2cefca9dc5b17577b3e4988

Vadim, please respond to my questions re the individual patches, and I'll
increment the patches in the above branch before pushing this up to testing.

-- 
Darren Hart
VMware Open Source Technology Center

From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [patch v4 1/3] platform/x86: move Mellanox hardware platform
 hotplug driver to platform/mellanox
Date: Tue, 17 Oct 2017 22:11:36 +0300
Message-ID: <CAHp75Ven5NUiYQJD0G4pnz1Fvr8As3zxe20V2jFAttuxQ+1H5w@mail.gmail.com>
References: <1508264554-184107-1-git-send-email-vadimp@mellanox.com> <1508264554-184107-2-git-send-email-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f196.google.com ([209.85.220.196]:53072 "EHLO
        mail-qk0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965734AbdJQTLi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 17 Oct 2017 15:11:38 -0400
In-Reply-To: <1508264554-184107-2-git-send-email-vadimp@mellanox.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: "dvhart@infradead.org" <dvhart@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, =?UTF-8?B?SmnFmcOtIFDDrXJrbw==?= <jiri@resnulli.us>

On Tue, Oct 17, 2017 at 9:22 PM, Vadim Pasternak <vadimp@mellanox.com> wrote:
> It moves drivers/platform/x86/mlxcpld-hotplug.c to
> drivers/platform/mellanox/mlxreg-hotplug.c and
> include/linux/platform_data/mlxcpld-hotplug.h to
> include/linux/platform_data/mlxreg.h for making hotplug driver usable for
> the different machine architectures.
>
> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> +MELLANOX HARDWARE PLATFORM SUPPORT
> +M:     Andy Shevchenko <andy@infradead.org>
> +M:     Darren Hart <dvhart@infradead.org>
> +M:     Vadim Pasternak <vadimp@mellanox.com>
> +L:     platform-driver-x86@vger.kernel.org
> +S:     Supported
> +F:     drivers/platform/mellanox/
> +
>  MELLANOX FIRMWARE FLASH LIBRARY (mlxfw)

A ... F ... H  ... Z

Linus even created a script for that.

-- 
With Best Regards,
Andy Shevchenko

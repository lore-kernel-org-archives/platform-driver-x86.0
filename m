From: Lubomir Rintel <lkundrak@v3.sk>
Subject: Re: [PATCH -next 0/2] Platform: OLPC: Fix two randbuild error
Date: Tue, 28 May 2019 13:06:45 +0200
Message-ID: <6db9830f1240fafb01dde94281d53f0c5ccd6230.camel@v3.sk>
References: <20190528092806.20080-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190528092806.20080-1-yuehaibing@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: YueHaibing <yuehaibing@huawei.com>, dvhart@infradead.org, andy@infradead.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, 2019-05-28 at 17:28 +0800, YueHaibing wrote:
> Fix two randbuild error:
> 1) Fix build error with CONFIG_SPI is not set
> 2) Fix build error with CONFIG_INPUT is set to m
> 
> YueHaibing (2):
>   Platform: OLPC: Fix build error without CONFIG_SPI
>   Platform: OLPC: Add INPUT dependencies
> 
>  drivers/platform/olpc/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Thanks. Both patches:

Reviewed-by: Lubomir Rintel <lkundrak@v3.sk>

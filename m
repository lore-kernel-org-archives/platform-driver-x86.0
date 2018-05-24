From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2 5/7] platform/x86: mlx-platform: Add LED platform
 driver activation
Date: Thu, 24 May 2018 16:57:46 -0700
Message-ID: <20180524235746.GB10172@fury>
References: <1525675735-125547-1-git-send-email-vadimp@mellanox.com>
 <1525675735-125547-3-git-send-email-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1525675735-125547-3-git-send-email-vadimp@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: andy.shevchenko@gmail.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us, michaelsh@mellanox.com, ivecera@redhat.com
List-Id: platform-driver-x86.vger.kernel.org

On Mon, May 07, 2018 at 06:48:53AM +0000, Vadim Pasternak wrote:
> Add LED platform driver activation from mlx-platform. This LED driver uses
> the same regmap infrastructure as others Mellanox platform drivers, so LED
> specific registers description is added.
> 
> System LED configuration depends on system type. To support all the
> relevant types per system type LED descriptions are defined for passing
> to LED platform driver.
> 
> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> v1->v2:
>  Fixes added by Vadim:
>  - Remove inline functions from mlxreg.h file;

Please remember to put the patch changelog below the --- line below.

> ---

Here

Queued up for testing, thanks.
-- 
Darren Hart
VMware Open Source Technology Center

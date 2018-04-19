From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 40/61] platform: x86: simplify getting .drvdata
Date: Thu, 19 Apr 2018 16:56:51 -0700
Message-ID: <20180419235651.GC11546@fury>
References: <20180419140641.27926-1-wsa+renesas@sang-engineering.com>
 <20180419140641.27926-41-wsa+renesas@sang-engineering.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180419140641.27926-41-wsa+renesas@sang-engineering.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, kernel-janitors@vger.kernel.org, Corentin Chary <corentin.chary@gmail.com>, Andy Shevchenko <andy@infradead.org>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Apr 19, 2018 at 04:06:10PM +0200, Wolfram Sang wrote:
> We should get drvdata from struct device directly. Going via
> platform_device is an unneeded step back and forth.
> 

It is indeed, thanks.

> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

> ---
> 
> Build tested only. buildbot is happy. Please apply individually.

Queued up for testing.

(I'm not sure what you mean by "Please apply individually")
-- 
Darren Hart
VMware Open Source Technology Center

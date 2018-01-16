From: Darren Hart <dvhart@infradead.org>
Subject: Re: [patch v8 0/3] drivers/platform: replace module
 x86/mlxcpld-hotplug with mellanox/mlxreg-hotplug
Date: Mon, 15 Jan 2018 19:49:47 -0800
Message-ID: <20180116034947.GG4590@fury>
References: <1515661123-76604-1-git-send-email-vadimp@mellanox.com>
 <20180116034209.GA4590@fury>
 <20180116034511.GE4590@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:55975 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750802AbeAPDtu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 15 Jan 2018 22:49:50 -0500
Content-Disposition: inline
In-Reply-To: <20180116034511.GE4590@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: andy.shevchenko@gmail.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us

On Mon, Jan 15, 2018 at 07:45:11PM -0800, Darren Hart wrote:
> On Mon, Jan 15, 2018 at 07:42:09PM -0800, Darren Hart wrote:
> > To follow this email, are two patches which are minor incremental
> > cleanups, which I'd appreciate your review of before I push them to
> > testing.
> 
> 
> From 2c5d26ee913e0f5f7d13c559d85e8da7e4ddcdab Mon Sep 17 00:00:00 2001
> Message-Id: <2c5d26ee913e0f5f7d13c559d85e8da7e4ddcdab.1516073719.git.dvhart@infradead.org>
> From: "Darren Hart (VMware)" <dvhart@infradead.org>
> Date: Mon, 15 Jan 2018 19:16:36 -0800
> Subject: [PATCH 1/2] platform/mellanox: mlxreg-hotplug: Simplify exit path
> 
> Several functions use a "goto access_error" pattern result in a
> duplicated exit path at the end of the function. Address this by using a
> single exit path, and checking for (ret) prior to printing the error
> message. This adds a conditional, but only in the failure case, and
> simplifies the exit path.
> 
> Signed-off-by: Darren Hart (VMware) <dvhart@infradead.org>
> Cc: Vadim Pasternak <vadimp@mellanox.com>
> ---
>  drivers/platform/mellanox/mlxreg-hotplug.c | 62 ++++++++++++------------------
>  1 file changed, 25 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/platform/mellanox/mlxreg-hotplug.c b/drivers/platform/mellanox/mlxreg-hotplug.c
> index 9bbaa8c..78056f7 100644
> --- a/drivers/platform/mellanox/mlxreg-hotplug.c
> +++ b/drivers/platform/mellanox/mlxreg-hotplug.c
...
> @@ -267,18 +267,15 @@ mlxreg_hotplug_work_helper(struct mlxreg_hotplug_priv_data *priv,
>  	ret = regmap_write(priv->regmap, item->reg + MLXREG_HOTPLUG_EVENT_OFF,
>  			   0);
>  	if (ret)
> -		goto access_error;
> +		goto out:

Apologies:	goto out;

-- 
Darren Hart
VMware Open Source Technology Center

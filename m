From: Darren Hart <dvhart@infradead.org>
Subject: Re: [patch v11 11/12] platform/mellanox: mlxreg-hotplug: Add check
 for negative adapter number value
Date: Thu, 25 Jan 2018 14:16:39 -0800
Message-ID: <20180125221639.GE24122@fury>
References: <1516826098-125036-1-git-send-email-vadimp@mellanox.com>
 <1516826098-125036-3-git-send-email-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:33767 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751174AbeAYWQm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 25 Jan 2018 17:16:42 -0500
Content-Disposition: inline
In-Reply-To: <1516826098-125036-3-git-send-email-vadimp@mellanox.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: andy.shevchenko@gmail.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us

On Wed, Jan 24, 2018 at 08:34:57PM +0000, Vadim Pasternak wrote:
> Verify before creation of hotplug device if the associated adapter number
> is negative. It could be in case hotplug event is not associated with
> hotplug device.
> 
> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> ---
>  drivers/platform/mellanox/mlxreg-hotplug.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/platform/mellanox/mlxreg-hotplug.c b/drivers/platform/mellanox/mlxreg-hotplug.c
> index b891ec7..c806451 100644
> --- a/drivers/platform/mellanox/mlxreg-hotplug.c
> +++ b/drivers/platform/mellanox/mlxreg-hotplug.c
> @@ -95,6 +95,14 @@ struct mlxreg_hotplug_priv_data {
>  
>  static int mlxreg_hotplug_device_create(struct mlxreg_core_data *data)
>  {
> +	/*
> +	 * Return if adapter number is negative. Return if adapter number is
> +	 * negative. It could be in case hotplug event is not associated with

First sentence repeated twice. I've corrected this.

-- 
Darren Hart
VMware Open Source Technology Center

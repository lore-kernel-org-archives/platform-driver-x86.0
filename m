From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v1 3/7] platform/mellanox: mlxreg-hotplug: add extra
 cycle for hotplug work queue
Date: Fri, 13 Apr 2018 09:47:10 -0700
Message-ID: <20180413164710.GE27560@fury>
References: <1522144927-56512-1-git-send-email-vadimp@mellanox.com>
 <1522144927-56512-4-git-send-email-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1522144927-56512-4-git-send-email-vadimp@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: andy.shevchenko@gmail.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us, michaelsh@mellanox.com, ivecera@redhat.com
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Mar 27, 2018 at 10:02:03AM +0000, Vadim Pasternak wrote:
> It adds missed logic for signal acknowledge, by adding an extra run for
> work queue in case a signal is received, but no specific signal assertion
> is detected. Such case theoretically can happen for example in case
> several units are removed or inserted at the same time. In this situation
> acknowledge for some signal can be missed at signal top aggreagation
> status level.

Why can they be missed? What does "signal top aggregation status level"
mean? I'm asking to confirm that we are fixing this at the right place,
and not just applying a suboptimal bandaid by running the workqueue
more.

...

> 
> Fixes: 1f976f6978bf ("platform/x86: Move Mellanox platform hotplug driver to platform/mellanox")

You didn't mention above how this commit caused this - how did moving
the driver create this problem? Does this need to go to stable? I'm
assuming not as you've called it theoretical - not something you've
observed in practice?

...

>  static int mlxreg_hotplug_device_create(struct mlxreg_hotplug_priv_data *priv,
> @@ -410,6 +413,18 @@ static void mlxreg_hotplug_work_handler(struct work_struct *work)
>  	aggr_asserted = priv->aggr_cache ^ regval;
>  	priv->aggr_cache = regval;
>  
> +	/*
> +	 * Handler is invoked, but no assertion is detected at top aggregation
> +	 * status level. Set aggr_asserted to mask value to allow handler extra
> +	 * run over all relevant signals to recover any missed signal.
> +	 */
> +	if (priv->not_asserted == MLXREG_HOTPLUG_NOT_ASSERT) {
> +		priv->not_asserted = 0;
> +		aggr_asserted = pdata->mask;
> +	}
> +	if (!aggr_asserted)

We seem to check aggr_asserted in several places in this routine now.
Looks like something we could simplify. If you check it here, can you
drop the check lower in the routine? Can you remove it from the for loop
if conditional entirely? Please consider how to simplify.

-- 
Darren Hart
VMware Open Source Technology Center

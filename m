From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v1 2/7] platform/mellanox: mlxreg-hotplug: Document fixes
 for hotplug private data
Date: Fri, 13 Apr 2018 09:27:12 -0700
Message-ID: <20180413162712.GD27560@fury>
References: <1522144927-56512-1-git-send-email-vadimp@mellanox.com>
 <1522144927-56512-3-git-send-email-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1522144927-56512-3-git-send-email-vadimp@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: andy.shevchenko@gmail.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us, michaelsh@mellanox.com, ivecera@redhat.com
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Mar 27, 2018 at 10:02:02AM +0000, Vadim Pasternak wrote:
> Add missing description of dev, regmap, dwork_irq, after_probe in struct
> mlxreg_hotplug_priv_data.
> 
> Remove dwork field from the structure mlxreg_hotplug_priv_data itself and
> for the descriptions, since it is not used.
> 

A bit of a nit, but "Document..." implies no functional changes, but you are
changing the physical structure. This can have negative consequences in some
cases, even if the removed field is unused.

Someone reading through the git history might skip over patches starting with
"Document..." when looking for change which impacted behavior.

Again, for future submissions.

> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> ---
>  drivers/platform/mellanox/mlxreg-hotplug.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/mellanox/mlxreg-hotplug.c b/drivers/platform/mellanox/mlxreg-hotplug.c
> index ea9e7f4..b56953a 100644
> --- a/drivers/platform/mellanox/mlxreg-hotplug.c
> +++ b/drivers/platform/mellanox/mlxreg-hotplug.c
> @@ -59,9 +59,11 @@
>  /**
>   * struct mlxreg_hotplug_priv_data - platform private data:
>   * @irq: platform device interrupt number;
> + * @dev: basic device;
>   * @pdev: platform device;
>   * @plat: platform data;
> - * @dwork: delayed work template;
> + * @regmap: register map handle;
> + * @dwork_irq: delayed work template;
>   * @lock: spin lock;
>   * @hwmon: hwmon device;
>   * @mlxreg_hotplug_attr: sysfs attributes array;
> @@ -71,6 +73,7 @@
>   * @cell: location of top aggregation interrupt register;
>   * @mask: top aggregation interrupt common mask;
>   * @aggr_cache: last value of aggregation register status;
> + * @after_probe: flag indication probing completion;
>   */
>  struct mlxreg_hotplug_priv_data {
>  	int irq;
> @@ -79,7 +82,6 @@ struct mlxreg_hotplug_priv_data {
>  	struct mlxreg_hotplug_platform_data *plat;
>  	struct regmap *regmap;
>  	struct delayed_work dwork_irq;
> -	struct delayed_work dwork;
>  	spinlock_t lock; /* sync with interrupt */
>  	struct device *hwmon;
>  	struct attribute *mlxreg_hotplug_attr[MLXREG_HOTPLUG_ATTRS_MAX + 1];
> -- 
> 2.1.4
> 
> 

-- 
Darren Hart
VMware Open Source Technology Center

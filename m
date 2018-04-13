From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v1 1/7] platform_data/mlxreg: Document fixes for hotplug
 device
Date: Fri, 13 Apr 2018 09:23:07 -0700
Message-ID: <20180413162307.GC27560@fury>
References: <1522144927-56512-1-git-send-email-vadimp@mellanox.com>
 <1522144927-56512-2-git-send-email-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1522144927-56512-2-git-send-email-vadimp@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: andy.shevchenko@gmail.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us, michaelsh@mellanox.com, ivecera@redhat.com
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Mar 27, 2018 at 10:02:01AM +0000, Vadim Pasternak wrote:
> Remove redunadant description of label in struct mlxreg_hotplug_device.

         ^ redundant

Please configure a spell checker in your text editor. I take care of
these for first time contributors, but as you become a regular
contributor, I shouldn't need to rewrite your commit messages.

I'll handle this one, but please adapt your tooling for future patches.

> 
> Change location of access_mode in struct mlxreg_hotplug_device.
> 
> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> ---
>  include/linux/platform_data/mlxreg.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/include/linux/platform_data/mlxreg.h b/include/linux/platform_data/mlxreg.h
> index 2744cff..19f5cb61 100644
> --- a/include/linux/platform_data/mlxreg.h
> +++ b/include/linux/platform_data/mlxreg.h
> @@ -58,11 +58,10 @@ struct mlxreg_hotplug_device {
>   * struct mlxreg_core_data - attributes control data:
>   *
>   * @label: attribute label;
> - * @label: attribute register offset;
>   * @reg: attribute register;
>   * @mask: attribute access mask;
> - * @mode: access mode;
>   * @bit: attribute effective bit;
> + * @mode: access mode;
>   * @np - pointer to node platform associated with attribute;
>   * @hpdev - hotplug device data;
>   * @health_cntr: dynamic device health indication counter;
> -- 
> 2.1.4
> 
> 

-- 
Darren Hart
VMware Open Source Technology Center

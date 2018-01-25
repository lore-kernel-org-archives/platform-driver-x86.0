From: Darren Hart <dvhart@infradead.org>
Subject: Re: [patch v11 09/12] platform/x86: mlx-platform: Simplify IO access
 to regmap context
Date: Thu, 25 Jan 2018 14:13:32 -0800
Message-ID: <20180125221332.GC24122@fury>
References: <1516826098-125036-1-git-send-email-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1516826098-125036-1-git-send-email-vadimp@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: andy.shevchenko@gmail.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jan 24, 2018 at 08:34:55PM +0000, Vadim Pasternak wrote:
> Get rid of struct mlxplat_mlxcpld_regmap_context, which contains only the
> field with base address. Instead obtain base memory address by
> devm_ioport_map  to local variable and pass it to devm_regmap_init.
> 
> Modify mlxplat_mlxcpld_reg_read/write to directly use pointer to context
> for IO operations.
> 
> Add missed description of pdev_hotplug for struct mlxplat_priv.

Separate patch. Keep in mind that if there is a bug, and a patch is reverted -
do you want it all reverted together? In this case, the comment is totally
unrelated to this change. I've made this change.

-- 
Darren Hart
VMware Open Source Technology Center

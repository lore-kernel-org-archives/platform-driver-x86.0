From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v1 0/7] platform/x86: Mellanox add fixes and new features
Date: Fri, 13 Apr 2018 09:17:55 -0700
Message-ID: <20180413161755.GB27560@fury>
References: <1522144927-56512-1-git-send-email-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1522144927-56512-1-git-send-email-vadimp@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: andy.shevchenko@gmail.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us, michaelsh@mellanox.com, ivecera@redhat.com
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Mar 27, 2018 at 10:02:00AM +0000, Vadim Pasternak wrote:
> This patcheset includes:
> 
> Document fixes for mlxreg-hotplug driver and mlxreg header file.
> 
> Fix for the race condition in mlxreg-hotplug driver.
> 
> Adding support for ODM system types.
> 
> Activation of Mellanox LED driver from mlx-platform.
> 
> Introduction of new mlxreg-io driver.
> 
> Activation of mlxreg-io driver from mlx-platform.

Hi Vadim,

As you can see, all the patch names you listed above ^ are automatically
populated by the tooling below. Please use the message in patch 0/7 to
provide the reviewer with contextual information about these changes. A
summary of the series and why its needed is a good start. You want to
keep specific information to each patch with the patch. Think of this as
an Introduction to help the reviewer be prepared to review each
individual patch.

This message provides no context, and no introduction, so a reviewer
will have to figure that out as they go - which is another barrier to
getting the code reviewed.

Something for next time. OK, on to the review...

> 
> Vadim Pasternak (7):
>   platform_data/mlxreg: Document fixes for hotplug device
>   platform/mellanox: mlxreg-hotplug: Document fixes for hotplug private
>     data
>   platform/mellanox: mlxreg-hotplug: add extra cycle for hotplug work
>     queue
>   platform: mellanox: add new ODM system types to mlx-platform
>   platform/x86: mlx-platform: Add LED platform driver activation
>   platform/mellanox: Introduce support for Mellanox register access
>     driver
>   platform/x86: mlx-platform: Add mlxreg-io platform driver activation
> 
>  drivers/platform/mellanox/Kconfig          |  11 +
>  drivers/platform/mellanox/Makefile         |   1 +
>  drivers/platform/mellanox/mlxreg-hotplug.c |  23 +-
>  drivers/platform/mellanox/mlxreg-io.c      | 221 ++++++++++++++
>  drivers/platform/x86/mlx-platform.c        | 447 +++++++++++++++++++++++++++++
>  include/linux/platform_data/mlxreg.h       |  66 ++++-
>  6 files changed, 765 insertions(+), 4 deletions(-)
>  create mode 100644 drivers/platform/mellanox/mlxreg-io.c
> 
> -- 
> 2.1.4
> 
> 

-- 
Darren Hart
VMware Open Source Technology Center

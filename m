From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v1 0/4] platform/x86: mlx-platform: Add bus differed and
 auto detection functionalities
Date: Thu, 15 Feb 2018 17:32:37 -0800
Message-ID: <20180216013237.GC5786@fury>
References: <1518559776-188942-1-git-send-email-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:36966 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757167AbeBPBcm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 15 Feb 2018 20:32:42 -0500
Content-Disposition: inline
In-Reply-To: <1518559776-188942-1-git-send-email-vadimp@mellanox.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: andy.shevchenko@gmail.com, gregkh@linuxfoundation.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, jiri@resnulli.us, michaelsh@mellanox.com

On Tue, Feb 13, 2018 at 10:09:32PM +0000, Vadim Pasternak wrote:
> This patchset:
> - Adds define for the channels number for mux device.
> - Adds differed bus functionality.
> - Changes input for device create routine in mlxreg-hotplug driver.
> - Adds physical bus number auto detection.

Hi Vadim,

We are now in the RC cycle for 4.16. Do you consider these changes to be
"fixes" that need to be included in 4.16? It was difficult to tell from
the commit messages how severe some of the possible issues were.

I'm concerned about the level of testing seen by the previous patch
series if we are getting these changes so soon after they were merged.
Can you comment on why these are being discovered now - and how
confident are we in the drivers with these changes applied?

> 
> Vadim Pasternak (4):
>   platform/x86: mlx-platform: Use define for the channel numbers
>   platform/x86: mlx-platform: Add differed bus functionality
>   platform/mellanox: mlxreg-hotplug: Change input for device create
>     routine
>   platform/x86: mlx-platform: Add physical bus number auto detection
> 
>  drivers/platform/mellanox/mlxreg-hotplug.c | 31 +++++++++-----
>  drivers/platform/x86/mlx-platform.c        | 68 ++++++++++++++++++++++++++++--
>  include/linux/platform_data/mlxreg.h       |  4 ++
>  3 files changed, 90 insertions(+), 13 deletions(-)
> 
> -- 
> 2.1.4
> 
> 

-- 
Darren Hart
VMware Open Source Technology Center

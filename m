From: Darren Hart <dvhart@infradead.org>
Subject: Re: [patch v1 0/4] mlx-platform: Add support for new Mellanox
 systems, code improvement, fixes for msn21xx system
Date: Thu, 8 Feb 2018 18:22:39 -0800
Message-ID: <20180209022239.GB25898@fury>
References: <1517561148-38587-1-git-send-email-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:59925 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752191AbeBICWl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 8 Feb 2018 21:22:41 -0500
Content-Disposition: inline
In-Reply-To: <1517561148-38587-1-git-send-email-vadimp@mellanox.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: andy.shevchenko@gmail.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us

On Fri, Feb 02, 2018 at 08:45:44AM +0000, Vadim Pasternak wrote:
> The patchset:
> - adds defines for bus numbers, used for system topology description;
> - fixes definition for power cables for system family msn21xx;
> - introduces support for new Mellanox systems;
> 
> Vadim Pasternak (4):
>   platform/x86: mlx-platform: Use defines for bus assignment
>   platform/x86: mlx-platform: Add define for the negative bus
>   platform/x86: mlx-platform: Fix power cable setting for systems from
>     msn21xx family

I've queued 1,2,3 and will try to include these in one final PR to Linus during
the Merge Window. (Andy, FYI)

>   platform/x86: mlx-platform: Add support for new Mellanox systems
> 

This one needs to be broken up into smaller patches.

>  drivers/platform/x86/mlx-platform.c | 345 ++++++++++++++++++++++++++++++++++--
>  1 file changed, 335 insertions(+), 10 deletions(-)
> 
> -- 
> 2.1.4
> 
> 

-- 
Darren Hart
VMware Open Source Technology Center

From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v1 0/4] platform/x86: mlx-platform: Add bus differed and
 auto detection functionalities
Date: Thu, 22 Mar 2018 16:55:41 -0700
Message-ID: <20180322235541.GD24138@fury>
References: <1518559776-188942-1-git-send-email-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1518559776-188942-1-git-send-email-vadimp@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: andy.shevchenko@gmail.com, gregkh@linuxfoundation.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, jiri@resnulli.us, michaelsh@mellanox.com
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Feb 13, 2018 at 10:09:32PM +0000, Vadim Pasternak wrote:
> This patchset:
> - Adds define for the channels number for mux device.
> - Adds differed bus functionality.
> - Changes input for device create routine in mlxreg-hotplug driver.
> - Adds physical bus number auto detection.
> 
> Vadim Pasternak (4):
>   platform/x86: mlx-platform: Use define for the channel numbers
>   platform/x86: mlx-platform: Add differed bus functionality
>   platform/mellanox: mlxreg-hotplug: Change input for device create
>     routine
>   platform/x86: mlx-platform: Add physical bus number auto detection

Vadim,

I have rewritten most of the commit messages after parsing through them
and reviewing the code. I believe they are much more concise now, and
make the intent of the patches much clearer. I have not changed the
patch content (code).

Please review the commit messages for the top 4 commits:
http://git.infradead.org/linux-platform-drivers-x86.git/shortlog/refs/heads/review-dvhart-mellanox

Does this still match your intent?

-- 
Darren Hart
VMware Open Source Technology Center

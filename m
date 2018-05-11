From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v1 0/7] platform/x86: Mellanox add fixes and new features
Date: Fri, 11 May 2018 08:28:48 -0700
Message-ID: <20180511152848.GB6391@fury>
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

Patches 1,2 are queued up. Dropping 3-7 and reviewing them now from v2.

-- 
Darren Hart
VMware Open Source Technology Center

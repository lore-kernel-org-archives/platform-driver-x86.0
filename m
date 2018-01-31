From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 11/11] platform/x86: mlx-platform: Add hotplug platform
 driver un-registration for faulty flow
Date: Wed, 31 Jan 2018 12:59:32 -0800
Message-ID: <20180131205932.GA21498@fury>
References: <1517435713-124919-1-git-send-email-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1517435713-124919-1-git-send-email-vadimp@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: andy.shevchenko@gmail.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jan 31, 2018 at 09:55:13PM +0000, Vadim Pasternak wrote:
> Add hotplug platform driver un-registration in case regmap cache
> synchronization failed. In such case hotplug platform driver registration
> should be rolled back.

Queued up, thanks Vadim.

-- 
Darren Hart
VMware Open Source Technology Center

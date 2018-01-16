From: Darren Hart <dvhart@infradead.org>
Subject: Re: [patch v8 2/3] platform/mellanox: mlxreg-hotplug: allow driver
 for ARM architecture
Date: Mon, 15 Jan 2018 19:43:13 -0800
Message-ID: <20180116034313.GC4590@fury>
References: <1515661123-76604-1-git-send-email-vadimp@mellanox.com>
 <1515661123-76604-3-git-send-email-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1515661123-76604-3-git-send-email-vadimp@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: andy.shevchenko@gmail.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Jan 11, 2018 at 08:58:42AM +0000, Vadim Pasternak wrote:
> It allows driver to run on x86 and ARM architecture based systems.
> Also some unnecessary includes are removed.

Hi Vadim,

These changes are not all readily mapped to this description, nor to the
changelog below.

Only the kconfig change is obviously linked to building on ARM and not just x86.

Things like the removal of the dev_err messages and the relocation of the
create and destroy methods seem entirely unrelated to building on ARM.

I'd like to get this merged sooner rather than later as it has been lingering
for quite some time now - can you provide some more detail about how the changes
included in this patch are needed to make this driver build on ARM?

Thanks,

-- 
Darren Hart
VMware Open Source Technology Center

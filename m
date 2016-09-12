From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [patch v1] x86/platform/mellanox: introduce support for Mellanox
 systems platform
Date: Mon, 12 Sep 2016 08:12:37 +0200
Message-ID: <20160912061237.GB11230@kroah.com>
References: <1473661798-112691-1-git-send-email-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1473661798-112691-1-git-send-email-vadimp@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: vadimp@mellanox.com
Cc: tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, davem@davemloft.net, geert@linux-m68k.org, akpm@linux-foundation.org, kvalo@codeaurora.org, mchehab@kernel.org, linux@roeck-us.net, x86@kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Sep 12, 2016 at 06:29:58AM +0000, vadimp@mellanox.com wrote:
> From: Vadim Pasternak <vadimp@mellanox.com>
> 
> Enable system support for the Mellanox Technologies platform, which
> provides support for the next Mellanox basic systems: "msx6710",
> "msx6720", "msb7700", "msn2700", "msx1410", "msn2410", "msb7800",
> "msn2740", "msn2100" and also various number of derivative systems from
> the above basic types.

What does "system support" mean?

Why can't this just be a "normal" PCI driver, as you are just accessing
a PCI device and doing something with it, seems odd to claim it is a
"platform" driver.

thanks,

greg k-h

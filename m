From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v6 6/8] platform/mellanox: Introduce support for Mellanox
 register access driver
Date: Tue, 19 Jun 2018 17:20:25 -0700
Message-ID: <20180620002025.GC11460@fury>
References: <1529254615-88124-1-git-send-email-vadimp@mellanox.com>
 <b804ccc4-77c3-e7a9-9486-8d12d50ec5f7@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <b804ccc4-77c3-e7a9-9486-8d12d50ec5f7@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Vadim Pasternak <vadimp@mellanox.com>, andy.shevchenko@gmail.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us, michaelsh@mellanox.com, ivecera@redhat.com
List-Id: platform-driver-x86.vger.kernel.org

On Sun, Jun 17, 2018 at 09:52:16AM -0700, Randy Dunlap wrote:
> On 06/17/2018 09:56 AM, Vadim Pasternak wrote:
> > diff --git a/drivers/platform/mellanox/Kconfig b/drivers/platform/mellanox/Kconfig
...
> > +	  space trough sysfs interface. The sets of registers for sysfs access
> 
> 	        through
> 
> > +	  are defined per system type bases and includes the registers related
> 
> 	                                    and include the
> 

I've taken care of these, thanks Randy, and applied the series to my testing
queue. Once the builds complete, I'll move these to for-next.

Vadim, I see you've already updated the kernel version in the sys documentation
to 4.19, so I won't attempt to push these into the 4.18 RC cycle.

-- 
Darren Hart
VMware Open Source Technology Center

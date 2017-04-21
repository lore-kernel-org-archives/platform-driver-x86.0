From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform/x86: INT33FE: add I2C dependency
Date: Fri, 21 Apr 2017 14:42:19 -0700
Message-ID: <20170421214219.GB31650@fury>
References: <20170421210331.876697-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170421210331.876697-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Andy Shevchenko <andy@infradead.org>, Hans de Goede <hdegoede@redhat.com>, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Apr 21, 2017 at 11:03:13PM +0200, Arnd Bergmann wrote:
> When I2C is disabled, we get a link error:
> 
> drivers/platform/built-in.o: In function `cht_int33fe_remove':
> intel_cht_int33fe.c:(.text+0x8ba): undefined reference to `i2c_unregister_device'
> drivers/platform/built-in.o: In function `cht_int33fe_probe':
> intel_cht_int33fe.c:(.text+0x9ec): undefined reference to `i2c_acpi_new_device'
> intel_cht_int33fe.c:(.text+0xa7a): undefined reference to `i2c_unregister_device'
> 
> This adds a Kconfig dependency to ensure I2C is available to this
> driver.
> 
> Fixes: 1cd706df8a9c ("platform/x86: Add Intel Cherry Trail ACPI INT33FE device driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks Arnd, Tobias submitted a fix a short time ago, it'll be in next tomorrow.
Thanks!

-- 
Darren Hart
VMware Open Source Technology Center

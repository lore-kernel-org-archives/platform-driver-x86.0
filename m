From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform: intel_pmic: make gpio explicitly non-modular
Date: Tue, 16 Aug 2016 17:23:19 -0700
Message-ID: <20160817002319.GB81374@f23x64.localdomain>
References: <20160815222459.1279-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160815222459.1279-1-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-kernel@vger.kernel.org, Alek Du <alek.du@intel.com>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Aug 15, 2016 at 06:24:59PM -0400, Paul Gortmaker wrote:
> The Kconfig entry controlling compilation of this code is:
> 
> drivers/platform/x86/Kconfig:config GPIO_INTEL_PMIC
> drivers/platform/x86/Kconfig:   bool "Intel PMIC GPIO support"
> 
> ...meaning that it currently is not being built as a module by anyone.
> 
> Lets remove the couple traces of modular infrastructure use, so that
> when reading the driver there is no doubt it is builtin-only.
> 
> We delete the MODULE_LICENSE tag etc. since all that information
> was (or is now) contained at the top of the file in the comments.
> 
> We don't replace module.h with init.h since the file already has that.
> 
> Cc: Darren Hart <dvhart@infradead.org>
> Cc: Alek Du <alek.du@intel.com>
> Cc: platform-driver-x86@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Queued to fixes for 4.8, thank you.

-- 
Darren Hart
Intel Open Source Technology Center

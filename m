From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform/x86/toshiba_acpi.c: fix defined but not used
 build warnings
Date: Mon, 9 Jul 2018 14:25:11 -0700
Message-ID: <20180709212511.GB30247@fury>
References: <59774e7f-103c-70b1-11bf-b2af16947dc8@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <59774e7f-103c-70b1-11bf-b2af16947dc8@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, Andy Shevchenko <andy@infradead.org>, LKML <linux-kernel@vger.kernel.org>, Azael Avalos <coproscefalo@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Jul 06, 2018 at 08:53:09PM -0700, Randy Dunlap wrote:
> From: Randy Dunlap <rdunlap@infradead.org>
> 
> Fix a build warning in toshiba_acpi.c when CONFIG_PROC_FS is not enabled
> by marking the unused function as __maybe_unused.
> 
> ../drivers/platform/x86/toshiba_acpi.c:1685:12: warning: 'version_proc_show' defined but not used [-Wunused-function]
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Azael Avalos <coproscefalo@gmail.com>
> Cc: platform-driver-x86@vger.kernel.org
> Cc: Darren Hart <dvhart@infradead.org>
> Cc: Andy Shevchenko <andy@infradead.org>

Thanks Randy, queued.

-- 
Darren Hart
VMware Open Source Technology Center

From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v6 11/19] mfd: intel_soc_pmic_bxtwc: Convert to use new
 SCU IPC API
Date: Tue, 25 Feb 2020 09:24:57 +0000
Message-ID: <20200225092457.GY3494@dell>
References: <20200217131446.32818-1-mika.westerberg@linux.intel.com>
 <20200217131446.32818-12-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200217131446.32818-12-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Zha Qipeng <qipeng.zha@intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, 17 Feb 2020, Mika Westerberg wrote:

> Convert the Intel Broxton Whiskey Cover PMIC driver to use the new SCU
> IPC API. This allows us to get rid of the PMC IPC implementation which
> is now covered in SCU IPC driver. We drop the error log if the IPC
> command fails because intel_scu_ipc_dev_command() does that already.
> 
> Also move PMIC specific IPC message constants to the PMIC driver from
> the intel_pmc_ipc.h header.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  arch/x86/include/asm/intel_pmc_ipc.h |  3 ---
>  drivers/mfd/intel_soc_pmic_bxtwc.c   | 34 ++++++++++++++--------------
>  2 files changed, 17 insertions(+), 20 deletions(-)

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog

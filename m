From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 3/4] platform/x86: intel-hid: Add new Tiger Lake
 hardware ID to support HID driver
Date: Mon, 16 Dec 2019 14:13:20 +0200
Message-ID: <20191216121320.GQ32742@smile.fi.intel.com>
References: <cover.1576260216.git.gayatri.kammela@intel.com>
 <a70a856e9a87c89ba92da514c1dda1f46f10b0de.1576260216.git.gayatri.kammela@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <a70a856e9a87c89ba92da514c1dda1f46f10b0de.1576260216.git.gayatri.kammela@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gayatri Kammela <gayatri.kammela@intel.com>
Cc: linux-pm@vger.kernel.org, platform-driver-x86@vger.kernel.org, alex.hung@canonical.com, linux-acpi@vger.kernel.org, lenb@kernel.org, rjw@rjwysocki.net, linux-kernel@vger.kernel.org, daniel.lezcano@linaro.org, amit.kucheria@verdurent.com, charles.d.prestopine@intel.com, dvhart@infradead.org, Zhang Rui <rui.zhang@intel.com>, Srinivas Pandruvada <srinivas.pandruvada@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Dec 13, 2019 at 10:14:22AM -0800, Gayatri Kammela wrote:
> Tiger Lake has a new unique hardware ID to support Intel's HID event
> filter driver. Hence, add it.
> 

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Cc: Zhang Rui <rui.zhang@intel.com>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Srinivas Pandruvada <srinivas.pandruvada@intel.com>
> Signed-off-by: Gayatri Kammela <gayatri.kammela@intel.com>
> ---
>  drivers/platform/x86/intel-hid.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/intel-hid.c b/drivers/platform/x86/intel-hid.c
> index ef6d4bd77b1a..43d590250228 100644
> --- a/drivers/platform/x86/intel-hid.c
> +++ b/drivers/platform/x86/intel-hid.c
> @@ -19,6 +19,7 @@ MODULE_LICENSE("GPL");
>  MODULE_AUTHOR("Alex Hung");
>  
>  static const struct acpi_device_id intel_hid_ids[] = {
> +	{"INT1051", 0},
>  	{"INT33D5", 0},
>  	{"", 0},
>  };
> -- 
> 2.17.1
> 

-- 
With Best Regards,
Andy Shevchenko

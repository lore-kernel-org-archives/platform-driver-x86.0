From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 4/4] thermal: int340x_thermal: Add new Tiger Lake
 hardware IDs to support thermal driver
Date: Fri, 13 Dec 2019 11:35:47 +0200
Message-ID: <20191213093547.GR32742@smile.fi.intel.com>
References: <cover.1576189376.git.gayatri.kammela@intel.com>
 <38c00cdcff470563b238da953b66532f08b83b25.1576189376.git.gayatri.kammela@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <38c00cdcff470563b238da953b66532f08b83b25.1576189376.git.gayatri.kammela@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gayatri Kammela <gayatri.kammela@intel.com>
Cc: linux-pm@vger.kernel.org, platform-driver-x86@vger.kernel.org, alex.hung@canonical.com, linux-acpi@vger.kernel.org, lenb@kernel.org, rjw@rjwysocki.net, linux-kernel@vger.kernel.org, daniel.lezcano@linaro.org, amit.kucheria@verdurent.com, charles.d.prestopine@intel.com, dvhart@infradead.org, Zhang rui <rui.zhang@intel.com>, Srinivas Pandruvada <srinivas.pandruvada@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Dec 12, 2019 at 02:37:20PM -0800, Gayatri Kammela wrote:
> Tiger Lake has a new unique hardware IDs to support thermal driver.
> Hence, add them.

>  	{"INT3400", 0},
> +	{"INT1040", 0},

>  	{"INT3403", 0},
> +	{"INT1043", 0},

And here

-- 
With Best Regards,
Andy Shevchenko

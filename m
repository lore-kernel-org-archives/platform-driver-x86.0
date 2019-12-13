From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/4] acpi: dptf: Add new Tiger Lake hardware IDs to
 support DPTF drivers in acpi
Date: Fri, 13 Dec 2019 11:34:37 +0200
Message-ID: <20191213093437.GO32742@smile.fi.intel.com>
References: <cover.1576189376.git.gayatri.kammela@intel.com>
 <baaa3d7d1d1129a31c5a000578d1ad8198ca3881.1576189376.git.gayatri.kammela@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <baaa3d7d1d1129a31c5a000578d1ad8198ca3881.1576189376.git.gayatri.kammela@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gayatri Kammela <gayatri.kammela@intel.com>
Cc: linux-pm@vger.kernel.org, platform-driver-x86@vger.kernel.org, alex.hung@canonical.com, linux-acpi@vger.kernel.org, lenb@kernel.org, rjw@rjwysocki.net, linux-kernel@vger.kernel.org, daniel.lezcano@linaro.org, amit.kucheria@verdurent.com, charles.d.prestopine@intel.com, dvhart@infradead.org, Zhang Rui <rui.zhang@intel.com>, Srinivas Pandruvada <srinivas.pandruvada@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Dec 12, 2019 at 02:37:17PM -0800, Gayatri Kammela wrote:
> Tiger Lake has new unique hardware IDs that are needed to support
> DPTF drivers. Hence, add them.

>  	{"INT3407", 0},
> +	{"INT1047", 0},

Can we keep them in sorted order?

>  	{"INT3409"},
>  	{"INT340A"},
>  	{"INT340B"},
> +	{"INT1040"},
> +	{"INT1043"},
> +	{"INT1044"},
> +	{"INT1047"},

Ditto.

-- 
With Best Regards,
Andy Shevchenko

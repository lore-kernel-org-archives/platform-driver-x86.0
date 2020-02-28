From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 2/4] platform/x86: intel_pmc_core: fix: Make
 pmc_core_lpm_display() generic for platforms that support sub-states
Date: Fri, 28 Feb 2020 12:06:28 +0200
Message-ID: <20200228100628.GJ1224808@smile.fi.intel.com>
References: <cover.1582845395.git.gayatri.kammela@intel.com>
 <49e90f024d89746d5955331e023231149210917c.1582845395.git.gayatri.kammela@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <49e90f024d89746d5955331e023231149210917c.1582845395.git.gayatri.kammela@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gayatri Kammela <gayatri.kammela@intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, vishwanath.somayaji@intel.com, dvhart@infradead.org, mika.westerberg@intel.com, peterz@infradead.org, charles.d.prestopine@intel.com, Chen Zhou <chenzhou10@huawei.com>, "David E . Box" <david.e.box@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Feb 27, 2020 at 03:29:14PM -0800, Gayatri Kammela wrote:
> Currently pmc_core_lpm_display() uses array of struct pointers i.e.,
> tgl_lpm_maps for Tiger Lake directly to iterate through and to get the
> number of status/live status registers which is hardcoded and cannot
> be re-used for future platforms that support sub-states. To maintain
> readability, make pmc_core_lpm_display() generic, so that it can re-used
> for future platforms.

This patch need more work, see below.
That said, I would prefer to see it last in the series for next version.

...

> +	lpm_regs = kmalloc_array(arr_size, sizeof(*lpm_regs), GFP_KERNEL);

No error check?
Besides that it is obvious memory leak.

> +	for (index = 0; maps[index]; index++) {
>  		lpm_regs[index] = pmc_core_reg_read(pmcdev, offset);
>  		offset += 4;
>  	}

-- 
With Best Regards,
Andy Shevchenko

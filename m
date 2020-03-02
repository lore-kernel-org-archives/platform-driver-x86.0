From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v3 5/5] platform/x86: intel_pmc_core: fix: Make
 pmc_core_lpm_display() generic for platforms that support sub-states
Date: Mon, 2 Mar 2020 14:53:43 +0200
Message-ID: <20200302125343.GU1224808@smile.fi.intel.com>
References: <cover.1583093898.git.gayatri.kammela@intel.com>
 <5e28f488a6cc8b7c1e08b536868844b586a1eaf1.1583093898.git.gayatri.kammela@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5e28f488a6cc8b7c1e08b536868844b586a1eaf1.1583093898.git.gayatri.kammela@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gayatri Kammela <gayatri.kammela@intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, vishwanath.somayaji@intel.com, dvhart@infradead.org, mika.westerberg@intel.com, peterz@infradead.org, charles.d.prestopine@intel.com, Chen Zhou <chenzhou10@huawei.com>, "David E . Box" <david.e.box@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

On Sun, Mar 01, 2020 at 12:44:26PM -0800, Gayatri Kammela wrote:
> Currently pmc_core_lpm_display() uses array of struct pointers i.e.,
> tgl_lpm_maps for Tiger Lake directly to iterate through and to get the
> number of status/live status registers which is hardcoded and cannot
> be re-used for future platforms that support sub-states. To maintain
> readability, make pmc_core_lpm_display() generic, so that it can re-used
> for future platforms.

My comments below.

...

> +static int pmc_core_lpm_get_arr_size(const struct pmc_bit_map **maps)
> +{
> +	int idx, arr_size = 0;

And why do you need arr_size variable at all?

> +
> +	for (idx = 0; maps[idx]; idx++)
> +		arr_size++;
> +
> +	return arr_size;
> +}

...

> -	int index, idx, len = 32, bit_mask;
> +	int index, idx, bit_mask, len = 32;

What's the point of shuffling this?

> +	int arr_size = pmc_core_lpm_get_arr_size(maps);

This would be better in a split manner, i.e.

	int arr_size;

	...

	arr_size = ...;

...

> +	lpm_regs = kmalloc_array(arr_size, sizeof(*lpm_regs), GFP_KERNEL);
> +	if(!lpm_regs)

> +		goto err;

There is no point to have the label. Simple return will work.

> -	for (index = 0; tgl_lpm_maps[index]; index++) {
> +	for (index = 0; maps[index]; index++) {

Why not to reuse arr_size here?

>  		lpm_regs[index] = pmc_core_reg_read(pmcdev, offset);
>  		offset += 4;
>  	}

-- 
With Best Regards,
Andy Shevchenko

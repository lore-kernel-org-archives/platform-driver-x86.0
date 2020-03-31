From: Zhang Rui <rui.zhang@intel.com>
Subject: Re: [PATCH v2 3/3] thermal: int340x_thermal: fix: Update Tiger Lake
 ACPI device IDs
Date: Tue, 31 Mar 2020 10:38:04 +0800
Message-ID: <25a7feacbd75821385aa310f3dbd87f70ed3ead2.camel@intel.com>
References: <cover.1585343507.git.gayatri.kammela@intel.com>
         <24125c0777458384f5b4449cafb5115b9985e3bd.1585343507.git.gayatri.kammela@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <24125c0777458384f5b4449cafb5115b9985e3bd.1585343507.git.gayatri.kammela@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gayatri Kammela <gayatri.kammela@intel.com>, linux-pm@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, lenb@kernel.org, dvhart@infradead.org, alex.hung@canonical.com, daniel.lezcano@linaro.org, amit.kucheria@verdurent.com, mika.westerberg@intel.com, peterz@infradead.org, charles.d.prestopine@intel.com, "5 . 6+" <stable@vger.kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Srinivas Pandruvada <srinivas.pandruvada@intel.com>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, 2020-03-27 at 14:28 -0700, Gayatri Kammela wrote:
> Tiger Lake's new unique ACPI device IDs for Intel thermal driver are
> not
> valid because of missing 'C' in the IDs. Fix the IDs by updating
> them.
> 
> After the update, the new IDs should now look like
> INT1040 --> INTC1040
> INT1043 --> INTC1043
> 
> Fixes: 9b1b5535dfc9 ("thermal: int340x_thermal: Add Tiger Lake ACPI
> device IDs")
> Cc: 5.6+ <stable@vger.kernel.org> # 5.6+
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Srinivas Pandruvada <srinivas.pandruvada@intel.com>
> Cc: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Suggested-by: Srinivas Pandruvada <srinivas.pandruvada@intel.com>
> Signed-off-by: Gayatri Kammela <gayatri.kammela@intel.com>

Acked-by: Zhang Rui <rui.zhang@intel.com>

thanks,
rui
> ---
>  drivers/thermal/intel/int340x_thermal/int3400_thermal.c | 2 +-
>  drivers/thermal/intel/int340x_thermal/int3403_thermal.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/thermal/intel/int340x_thermal/int3400_thermal.c
> b/drivers/thermal/intel/int340x_thermal/int3400_thermal.c
> index efae0c02d898..71a9877b85a5 100644
> --- a/drivers/thermal/intel/int340x_thermal/int3400_thermal.c
> +++ b/drivers/thermal/intel/int340x_thermal/int3400_thermal.c
> @@ -369,7 +369,7 @@ static int int3400_thermal_remove(struct
> platform_device *pdev)
>  }
>  
>  static const struct acpi_device_id int3400_thermal_match[] = {
> -	{"INT1040", 0},
> +	{"INTC1040", 0},
>  	{"INT3400", 0},
>  	{}
>  };
> diff --git a/drivers/thermal/intel/int340x_thermal/int3403_thermal.c
> b/drivers/thermal/intel/int340x_thermal/int3403_thermal.c
> index aeece1e136a5..3849d5869609 100644
> --- a/drivers/thermal/intel/int340x_thermal/int3403_thermal.c
> +++ b/drivers/thermal/intel/int340x_thermal/int3403_thermal.c
> @@ -282,7 +282,7 @@ static int int3403_remove(struct platform_device
> *pdev)
>  }
>  
>  static const struct acpi_device_id int3403_device_ids[] = {
> -	{"INT1043", 0},
> +	{"INTC1043", 0},
>  	{"INT3403", 0},
>  	{"", 0},
>  };

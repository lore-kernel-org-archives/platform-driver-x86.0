From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 0/3] Fixes: update Tiger Lake ACPI device IDs
Date: Sat, 28 Mar 2020 22:43:44 +0200
Message-ID: <CAHp75VcEO0udSzpWX14vaZcjLni2RA3NGXNqr50HMK=S7GWjxg@mail.gmail.com>
References: <cover.1585343507.git.gayatri.kammela@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1585343507.git.gayatri.kammela@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gayatri Kammela <gayatri.kammela@intel.com>
Cc: Linux PM <linux-pm@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Len Brown <lenb@kernel.org>, Darren Hart <dvhart@infradead.org>, Alex Hung <alex.hung@canonical.com>, "Zhang, Rui" <rui.zhang@intel.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amit.kucheria@verdurent.com>, Mika Westerberg <mika.westerberg@intel.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, "Prestopine, Charles D" <charles.d.prestopine@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Srinivas Pandruvada <srinivas.pandruvada@intel.com>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Mar 27, 2020 at 11:34 PM Gayatri Kammela
<gayatri.kammela@intel.com> wrote:
>
> Hi,
>
> The hardware IDs for devices supported by Tiger Lake for various drivers
> such as DPTF, fan, Intel thermal and intel-hid are added with missing 'C'
> which makes them invalid. Hence fix these IDs by updating.
>
> For instance, the updated ID now looks like
> INT1047 --> INTC1047
>
> Patch 1: Update Tiger Lake ACPI device IDs for DPTF and fan drivers
> Patch 2: Update Tiger Lake ACPI device ID for intel-hid driver
> Patch 3: Update Tiger Lake ACPI device IDs for thermal driver
>

Please, keep the IDs sorted (INTC should go after INT, etc).
Also I will need an Ack for patch 1 (at least).

> Changes since v1:
> 1) Added fixes tag to each patch
>
> Gayatri Kammela (3):
>   ACPI: fix: Update Tiger Lake ACPI device IDs
>   platform/x86: intel-hid: fix: Update Tiger Lake ACPI device ID
>   thermal: int340x_thermal: fix: Update Tiger Lake ACPI device IDs
>
>  drivers/acpi/device_pm.c                                | 2 +-
>  drivers/acpi/dptf/dptf_power.c                          | 2 +-
>  drivers/acpi/dptf/int340x_thermal.c                     | 8 ++++----
>  drivers/platform/x86/intel-hid.c                        | 2 +-
>  drivers/thermal/intel/int340x_thermal/int3400_thermal.c | 2 +-
>  drivers/thermal/intel/int340x_thermal/int3403_thermal.c | 2 +-
>  6 files changed, 9 insertions(+), 9 deletions(-)
>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Srinivas Pandruvada <srinivas.pandruvada@intel.com>
> Cc: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko

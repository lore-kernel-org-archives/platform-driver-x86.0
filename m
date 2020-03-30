From: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v2 1/3] ACPI: fix: Update Tiger Lake ACPI device IDs
Date: Mon, 30 Mar 2020 18:43:35 +0200
Message-ID: <CAJZ5v0j8OaqM6k52Ar9sYn0Ea_u9+MBB0rcMWv6vGBt5jXCQBQ@mail.gmail.com>
References: <cover.1585343507.git.gayatri.kammela@intel.com> <9359b8e261d69983b1eed2b8e53ef9eabfdfdd51.1585343507.git.gayatri.kammela@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9359b8e261d69983b1eed2b8e53ef9eabfdfdd51.1585343507.git.gayatri.kammela@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gayatri Kammela <gayatri.kammela@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "Zhang, Rui" <rui.zhang@intel.com>
Cc: Linux PM <linux-pm@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Len Brown <lenb@kernel.org>, Darren Hart <dvhart@infradead.org>, Alex Hung <alex.hung@canonical.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amit.kucheria@verdurent.com>, Mika Westerberg <mika.westerberg@intel.com>, Peter Zijlstra <peterz@infradead.org>, "Prestopine, Charles D" <charles.d.prestopine@intel.com>, "5 . 6+" <stable@vger.kernel.org>, Srinivas Pandruvada <srinivas.pandruvada@intel.com>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Mar 27, 2020 at 10:34 PM Gayatri Kammela
<gayatri.kammela@intel.com> wrote:
>
> Tiger Lake's new unique ACPI device IDs for DPTF and fan drivers are not
> valid as the IDs are missing 'C'. Fix the IDs by updating them.
>
> After the update, the new IDs should now look like
> INT1047 --> INTC1047
> INT1040 --> INTC1040
> INT1043 --> INTC1043
> INT1044 --> INTC1044
>
> Fixes: 55cfe6a5c582 ("ACPI: DPTF: Add Tiger Lake ACPI device IDs")
> Fixes: c248dfe7e0ca ("ACPI: fan: Add Tiger Lake ACPI device ID")
> Cc: 5.6+ <stable@vger.kernel.org> # 5.6+
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Srinivas Pandruvada <srinivas.pandruvada@intel.com>
> Cc: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Suggested-by: Srinivas Pandruvada <srinivas.pandruvada@intel.com>
> Signed-off-by: Gayatri Kammela <gayatri.kammela@intel.com>
> ---
>  drivers/acpi/device_pm.c            | 2 +-
>  drivers/acpi/dptf/dptf_power.c      | 2 +-
>  drivers/acpi/dptf/int340x_thermal.c | 8 ++++----
>  3 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/acpi/device_pm.c b/drivers/acpi/device_pm.c
> index b64c62bfcea5..80dae3b3c36a 100644
> --- a/drivers/acpi/device_pm.c
> +++ b/drivers/acpi/device_pm.c
> @@ -1321,7 +1321,7 @@ int acpi_dev_pm_attach(struct device *dev, bool power_on)
>          */
>         static const struct acpi_device_id special_pm_ids[] = {
>                 {"PNP0C0B", }, /* Generic ACPI fan */
> -               {"INT1044", }, /* Fan for Tiger Lake generation */
> +               {"INTC1044", }, /* Fan for Tiger Lake generation */
>                 {"INT3404", }, /* Fan */
>                 {}
>         };
> diff --git a/drivers/acpi/dptf/dptf_power.c b/drivers/acpi/dptf/dptf_power.c
> index 387f27ef3368..e5fb34bfa52c 100644
> --- a/drivers/acpi/dptf/dptf_power.c
> +++ b/drivers/acpi/dptf/dptf_power.c
> @@ -97,7 +97,7 @@ static int dptf_power_remove(struct platform_device *pdev)
>  }
>
>  static const struct acpi_device_id int3407_device_ids[] = {
> -       {"INT1047", 0},
> +       {"INTC1047", 0},
>         {"INT3407", 0},
>         {"", 0},
>  };
> diff --git a/drivers/acpi/dptf/int340x_thermal.c b/drivers/acpi/dptf/int340x_thermal.c
> index 1ec7b6900662..29b5c77256dd 100644
> --- a/drivers/acpi/dptf/int340x_thermal.c
> +++ b/drivers/acpi/dptf/int340x_thermal.c
> @@ -13,10 +13,10 @@
>
>  #define INT3401_DEVICE 0X01
>  static const struct acpi_device_id int340x_thermal_device_ids[] = {
> -       {"INT1040"},
> -       {"INT1043"},
> -       {"INT1044"},
> -       {"INT1047"},
> +       {"INTC1040"},
> +       {"INTC1043"},
> +       {"INTC1044"},
> +       {"INTC1047"},
>         {"INT3400"},
>         {"INT3401", INT3401_DEVICE},
>         {"INT3402"},
> --

I can take this along with the other two patches in the series if that
is fine by Andy and Rui.

Thanks!

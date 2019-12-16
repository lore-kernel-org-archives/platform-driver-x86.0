From: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v2 2/4] acpi: fan: Add new Tiger Lake hardware ID to
 support fan driver in acpi
Date: Mon, 16 Dec 2019 09:58:27 +0100
Message-ID: <CAJZ5v0hysFS+tVKz3fJ0yoOTqaGpx+4oD2Nh98HCzT86=hXawA@mail.gmail.com>
References: <cover.1576260216.git.gayatri.kammela@intel.com> <3c1ed2c9964c63fc956ec249d7bfce8d49f53fee.1576260216.git.gayatri.kammela@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3c1ed2c9964c63fc956ec249d7bfce8d49f53fee.1576260216.git.gayatri.kammela@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gayatri Kammela <gayatri.kammela@intel.com>
Cc: Linux PM <linux-pm@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Alex Hung <alex.hung@canonical.com>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Len Brown <lenb@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amit.kucheria@verdurent.com>, "Prestopine, Charles D" <charles.d.prestopine@intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Zhang Rui <rui.zhang@intel.com>, Srinivas Pandruvada <srinivas.pandruvada@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Dec 13, 2019 at 9:40 PM Gayatri Kammela
<gayatri.kammela@intel.com> wrote:
>
> Tiger Lake has a new unique hardware ID to support fan driver. Hence,
> add it.
>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Zhang Rui <rui.zhang@intel.com>
> Cc: Srinivas Pandruvada <srinivas.pandruvada@intel.com>
> Signed-off-by: Gayatri Kammela <gayatri.kammela@intel.com>
> ---
>  drivers/acpi/fan.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/acpi/fan.c b/drivers/acpi/fan.c
> index 816b0803f7fb..13708fb48038 100644
> --- a/drivers/acpi/fan.c
> +++ b/drivers/acpi/fan.c
> @@ -25,6 +25,7 @@ static int acpi_fan_remove(struct platform_device *pdev);
>
>  static const struct acpi_device_id fan_device_ids[] = {
>         {"PNP0C0B", 0},
> +       {"INT1044", 0},

This has to go into device_pm.c:acpi_dev_pm_attach() too, see commit

b9ea0bae260f ACPI: PM: Avoid attaching ACPI PM domain to certain devices

>         {"INT3404", 0},
>         {"", 0},
>  };
> --

From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] intel_menlow: avoid null pointer deference error
Date: Sat, 29 Jun 2019 16:17:01 +0300
Message-ID: <CAHp75Vc1gMowXgBPFaTo9_B_4B443+F2XDn_2xGj6chahk1wOg@mail.gmail.com>
References: <1559094951-25391-1-git-send-email-92siuyang@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1559094951-25391-1-git-send-email-92siuyang@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Young Xiao <92siuyang@gmail.com>
Cc: Sujith Thomas <sujith.thomas@intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, May 29, 2019 at 4:55 AM Young Xiao <92siuyang@gmail.com> wrote:
>
> Fix a null pointer deference by acpi_driver_data() if device is
> null (dereference before check). We should only set cdev and check
> this is OK after we are sure device is not null.
>

Pushed to my review and testing queue, thanks!

> Signed-off-by: Young Xiao <92siuyang@gmail.com>
> ---
>  drivers/platform/x86/intel_menlow.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/x86/intel_menlow.c b/drivers/platform/x86/intel_menlow.c
> index 77eb870..28feb5c 100644
> --- a/drivers/platform/x86/intel_menlow.c
> +++ b/drivers/platform/x86/intel_menlow.c
> @@ -180,9 +180,13 @@ static int intel_menlow_memory_add(struct acpi_device *device)
>
>  static int intel_menlow_memory_remove(struct acpi_device *device)
>  {
> -       struct thermal_cooling_device *cdev = acpi_driver_data(device);
> +       struct thermal_cooling_device *cdev;
> +
> +       if (!device)
> +               return -EINVAL;
>
> -       if (!device || !cdev)
> +       cdev = acpi_driver_data(device);
> +       if (!cdev)
>                 return -EINVAL;
>
>         sysfs_remove_link(&device->dev.kobj, "thermal_cooling");
> --
> 2.7.4
>


-- 
With Best Regards,
Andy Shevchenko

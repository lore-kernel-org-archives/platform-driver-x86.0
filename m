From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v5 1/2] platform/x86 asus_wmi: Support throttle thermal policy
Date: Mon, 25 Nov 2019 13:12:43 +0200
Message-ID: <CAHp75VcVj5=DQ8faTtC2CWk86-VMPGroQ+aCK+tLpkFEyPe-MQ@mail.gmail.com>
References: <20191124140625.20736-1-leonmaxx@gmail.com> <20191124140744.20830-1-leonmaxx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191124140744.20830-1-leonmaxx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Leonid Maksymchuk <leonmaxx@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Chris Chiu <chiu@endlessm.com>, Kristian Klausen <kristian@klausen.dk>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Corentin Chary <corentin.chary@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

On Sun, Nov 24, 2019 at 4:07 PM Leonid Maksymchuk <leonmaxx@gmail.com> wrote:
>
> Throttle thermal policy ACPI device is used to control CPU cooling and

> throttling. This patch adds sysfs entry for setting current mode and
> Fn+F5 hotkey that switches to next.

sysfs means ABI. ABI must be documented.

> Policy modes:
> * 0x00 - default
> * 0x01 - overboost
> * 0x02 - silent

> +static int throttle_thermal_policy_check_present(struct asus_wmi *asus)
> +{
> +       u32 result;
> +       int err;
> +
> +       asus->throttle_thermal_policy_available = false;
> +
> +       err = asus_wmi_get_devstate(asus,
> +                                   ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY,
> +                                   &result);
> +       if (err) {
> +               if (err == -ENODEV)
> +                       return 0;

> +               else

Redundant.

> +                       return err;
> +       }
> +

> +       if ((result & ASUS_WMI_DSTS_PRESENCE_BIT))

Too many parentheses.

> +               asus->throttle_thermal_policy_available = true;
> +
> +       return 0;
> +}

> +       pr_info("Set throttle thermal policy: %u\n", value);

Do we really need this message?

> +       return scnprintf(buf, PAGE_SIZE, "%d\n",
> +                        asus->throttle_thermal_policy_mode);

Can it be one line?

> +       result = kstrtou8(buf, 10, &new_mode);
> +       if (result < 0) {

> +               pr_warn("Trying to store invalid value\n");

Redundant. By error code user space will get a message.

> +               return result;
> +       }



-- 
With Best Regards,
Andy Shevchenko

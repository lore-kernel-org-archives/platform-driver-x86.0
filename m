From: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: psensor
 interface
Date: Mon, 27 Jul 2020 13:34:57 +0300
Message-ID: <CAHp75Vcwg9aEpybYwEFvhYH4gpy7952i+zMs-2TKGPzkzuhO=g@mail.gmail.com>
References: <markpearson@lenovo.com>
 <20200715235242.4934-1-markpearson@lenovo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <20200715235242.4934-1-markpearson-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Mark Pearson <markpearson-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>
Cc: Thinkpad-acpi devel ML <ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, Henrique de Moraes Holschuh <ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>, Nitin Joshi <njoshi1-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>, Platform Driver <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Jul 16, 2020 at 2:53 AM Mark Pearson <markpearson-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org> wrote:
>
> Some Lenovo Thinkpad platforms are equipped with a 'palm sensor' so as
> to be able to determine if a user is physically proximate to the device.
>
> This patch provides the ability to retrieve the psensor state via sysfs
> entrypoints and will be used by userspace for WWAN functionality to
> control the transmission level safely

...


>         case TP_HKEY_EV_PALM_DETECTED:
>         case TP_HKEY_EV_PALM_UNDETECTED:
> -               /* palm detected hovering the keyboard, forward to user-space
> -                * via netlink for consumption */
> +               /* palm detected - pass on to event handler */
> +               tpacpi_driver_event(hkey);
>                 return true;

Comment here tells something about the netlink interface to user
space. Can you elaborate why we need sysfs now and how it's all
supposed to work?

...

> +static int psensor_get(bool *state)
> +{
> +       acpi_handle psensor_handle;
> +       int output;
> +
> +       if (ACPI_FAILURE(acpi_get_handle(hkey_handle, "GPSS", &psensor_handle)))
> +               return -ENODEV;
> +
> +       if (!acpi_evalf(psensor_handle, &output, NULL, "d"))
> +               return -EIO;
> +
> +       /* Check if sensor has a Psensor */
> +       if (!(output & BIT(PSENSOR_PRESENT_BIT)))
> +               return -ENODEV;
> +
> +       /* Return if psensor is set or not */
> +       *state = output & BIT(PSENSOR_ON_BIT) ? true : false;
> +       return 0;
> +}

It reminds me of a function you created in one of the previous
changes. Can you rather create a parameterized helper which will serve
for both?

...

> +/* sysfs psensor entry */
> +static ssize_t psensor_state_show(struct device *dev,
> +                                       struct device_attribute *attr,
> +                                       char *buf)
> +{

> +       return snprintf(buf, PAGE_SIZE, "%d\n", psensor_state);

We know that %d takes much less than PAGE_SIZE, use sprintf().

> +}

> +

No blank line here.

> +static DEVICE_ATTR_RO(psensor_state);

...

> +static struct attribute *psensor_attributes[] = {
> +       &dev_attr_psensor_state.attr,

> +       NULL,

No comma for terminator line(s).

> +};

...

> +       /* If support isn't available (ENODEV) then don't return an error
> +        * but just don't create the sysfs group
> +        */

/*
 * Consider to use a proper multi-line comment style.
 * Like here. (It's applicable to the entire patch)
 */

...

> +       err = sysfs_create_group(&tpacpi_pdev->dev.kobj, &psensor_attr_group);
> +       return err;

return sysfs...

-- 
With Best Regards,
Andy Shevchenko

From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2] platform/x86: ideapad-laptop: Expose conservation mode switch
Date: Mon, 14 Aug 2017 18:32:48 +0300
Message-ID: <CAHp75Vc8r0YWUZ77+nFmwn5_Yz7XqhJ5C+qRcjemmtmK+=YXXA@mail.gmail.com>
References: <cd64f959-5fa0-50e2-183a-70c28aa121d9@in04.sg>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f193.google.com ([209.85.216.193]:35432 "EHLO
        mail-qt0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752602AbdHNPcu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Aug 2017 11:32:50 -0400
In-Reply-To: <cd64f959-5fa0-50e2-183a-70c28aa121d9@in04.sg>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Hao Wei Tee <angelsl@in04.sg>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Ike Panhc <ike.pan@canonical.com>

On Mon, Aug 14, 2017 at 5:17 PM, Hao Wei Tee <angelsl@in04.sg> wrote:
> This exposes the battery conservation mode present on some (?) IdeaPads.
> The mode is set by calling ACPI method SBMC with argument 3 (on) or
> 5 (off). Status is reported in bit 5 of the return value of ACPI method
> GBMD.

Thanks for an update, this looks pretty much good!

Still some kind of nitpicks below.

> +#define GBMD_CONSERVATION_BIT (5)

> +enum {
> +       SBMC_CONSERVATION_ON = 3,
> +       SBMC_CONSERVATION_OFF = 5,

Looks to me like
GBMD = Get BM Data
SBMC = Send BM Command

Thus, I would leave BM only in the above (do you know by the way what
BM stands for?

> +static int method_gbmd(acpi_handle handle, unsigned long *ret)
> +{
> +       int val;
> +       int result = read_method_int(handle, "GBMD", &val);

Reversed X-mas tree order in new code, please.

> +static ssize_t show_ideapad_conservation(struct device *dev,
> +                               struct device_attribute *attr,
> +                               char *buf)
> +{
> +       unsigned long result;
> +       struct ideapad_private *priv = dev_get_drvdata(dev);

Ditto.

> +}
> +
> +static ssize_t store_ideapad_conservation(struct device *dev,
> +                                struct device_attribute *attr,
> +                                const char *buf, size_t count)
> +{
> +       int ret;
> +       bool state;
> +       struct ideapad_private *priv = dev_get_drvdata(dev);

Ditto.

> +
> +       ret = kstrtobool(buf, &state);
> +       if (ret)
> +               return ret;
> +
> +       ret = method_sbmc(priv->adev->handle, state ?
> +                                             SBMC_CONSERVATION_ON :
> +                                             SBMC_CONSERVATION_OFF);
> +       if (ret < 0)
> +               return -EIO;
> +       return count;
> +}
> +
> +static DEVICE_ATTR(conservation_mode, 0644, show_ideapad_conservation,
> +                                           store_ideapad_conservation);

DEVICE_ATTR_RW() ?

-- 
With Best Regards,
Andy Shevchenko

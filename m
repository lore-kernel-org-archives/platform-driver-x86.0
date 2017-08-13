From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: ideapad-laptop: Expose conservation mode switch
Date: Sun, 13 Aug 2017 15:15:28 +0300
Message-ID: <CAHp75Vc6SeP6bF7U_bdvy=DBSx8G78B7LWnwGR8Tg7-1O2NK8Q@mail.gmail.com>
References: <b667a2be-8021-93a0-d87a-e6fa6b2aa633@angelsl.xyz>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b667a2be-8021-93a0-d87a-e6fa6b2aa633@angelsl.xyz>
Sender: linux-kernel-owner@vger.kernel.org
To: Hao Wei Tee <angelsl@angelsl.xyz>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Ike Panhc <ike.pan@canonical.com>
List-Id: platform-driver-x86.vger.kernel.org

On Sat, May 27, 2017 at 10:31 AM, Hao Wei Tee <angelsl@angelsl.xyz> wrote:
> This exposes the battery conservation mode present on some (?) IdeaPads.
> The mode is set by calling ACPI method SBMC with argument 3 (on) or
> 5 (off). Status is reported in bit 5 of the return value of ACPI method
> GBMD.
>
> This patch was written based on an IdeaPad U430p. I'm not sure if the ACPI
> methods are the same across all IdeaPads, so it would be great if this got more
> testing across other models before it's merged.

Okay, since there is no reply from Ideapad maintainer I'm going to
accept v2 of this. (Sorry it took so long)

Why v2? See my comments below.

> +#define GBMD_CONSERVATION_BIT (5)

Please separate this line, it's not in CFG_ namespace AFAIU.

>  #define CFG_BT_BIT     (16)
>  #define CFG_3G_BIT     (17)
>  #define CFG_WIFI_BIT   (18)

>  enum {
> +       VPCCMD_CONSERVATION_ON = 3,
> +       VPCCMD_CONSERVATION_OFF = 5,

This should be separate enum. Below related to EC commands, you do
something else.

>         VPCCMD_R_VPC1 = 0x10,
>         VPCCMD_R_BL_MAX,
>         VPCCMD_R_BL,

> +static int conservation_mode_status(acpi_handle handle, bool *ret)

Should be called method_gbmd(). And please use unsigned long as return value.

> +{
> +       acpi_status status;
> +       unsigned long long result;
> +
> +       status = acpi_evaluate_integer(handle, "GBMD", NULL, &result);
> +       if (ACPI_FAILURE(status))
> +               return -1;

You may use read_method_int() helper.

> +
> +       *ret = (result & (1 << GBMD_CONSERVATION_BIT)) != 0;

"("  and "!= 0)" will gone with change of returned value type.

> +       return 0;
> +}

> +       bool boolval;

Reuse value instead.

>
>         if (!priv)
>                 return -EINVAL;
> @@ -250,6 +275,12 @@ static int debugfs_status_show(struct seq_file *s, void *data)
>         if (!read_ec_data(priv->adev->handle, VPCCMD_R_CAMERA, &value))
>                 seq_printf(s, "Camera status:\t%s(%lu)\n",
>                            value ? "On" : "Off", value);
> +       seq_puts(s, "=====================\n");
> +
> +       if (!conservation_mode_status(priv->adev->handle, &boolval)) {

Ditto.

> +               seq_printf(s, "Conservation mode:\t%s(%u)\n",
> +                          boolval ? "On" : "Off", boolval);
> +       }

-- 
With Best Regards,
Andy Shevchenko

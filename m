From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH] platform/x86: Export LPC attributes for the system SPI chip
Date: Thu, 7 May 2020 19:05:31 +0200
Message-ID: <CABxcv=kTL_grDUL00c_e2jyPD4hTtFS8Jze6pQBEz_arR6TPVA@mail.gmail.com>
References: <18e48255d68a1408b3e3152780f0e789df540059.camel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-security-module-owner@vger.kernel.org>
In-Reply-To: <18e48255d68a1408b3e3152780f0e789df540059.camel@gmail.com>
Sender: owner-linux-security-module@vger.kernel.org
To: Richard Hughes <hughsient@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-security-module@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hello Richard,

On Wed, May 6, 2020 at 5:52 PM Richard Hughes <hughsient@gmail.com> wrote:
>
> Export standard LPC configuration values from various LPC/eSPI
> controllers. This allows userspace components such as fwupd to
> verify the most basic SPI protections are set correctly.
> For instance, checking BIOSWE is disabled and BLE is enabled.
>
> More cutting-edge checks (e.g. PRx and BootGuard) can be added
> once the basics are in place. Exporting these values from the
> kernel allows us to report the security level of the platform
> without rebooting and running an unsigned EFI binary like
> chipsec.
>
> Signed-off-by: Richard Hughes <richard@hughsie.com>
> ---

The patch looks good to me, I just have some small comments.

> +config INTEL_SPI_LPC
> +       tristate "Intel SPI LPC configuration"
> +       depends on SECURITY

Maybe "depends on SECURITYFS" instead? I would also add ||
COMPILE_TEST to have more build coverage.

Another option is to not even add a dependency here since the
securityfs_*() functions are still defined if SECURITYFS isn't
enabled. They just return -ENODEV.

[snip]

> +       spi_dir = securityfs_create_dir("spi", NULL);
> +       if (IS_ERR(spi_dir))
> +               return -1;
> +
> +       spi_bioswe =
> +           securityfs_create_file("bioswe",
> +                                  0600, spi_dir, NULL,
> +                                  &spi_bioswe_ops);
> +       if (IS_ERR(spi_bioswe))
> +               goto out;
> +       spi_ble =
> +           securityfs_create_file("ble",
> +                                  0600, spi_dir, NULL,
> +                                  &spi_ble_ops);
> +       if (IS_ERR(spi_ble))
> +               goto out;
> +       spi_smm_bwp =
> +           securityfs_create_file("smm_bwp",
> +                                  0600, spi_dir, NULL,
> +                                  &spi_smm_bwp_ops);
> +       if (IS_ERR(spi_smm_bwp))
> +               goto out;
> +
> +       return 0;
> +out:
> +       securityfs_remove(spi_bioswe);
> +       securityfs_remove(spi_ble);
> +       securityfs_remove(spi_smm_bwp);

I don't think this is needed since if smm_bwp was successfully created
then it will never reach the error handling.

> +       securityfs_remove(spi_dir);

The convention is to remove these in the reverse order that were created, i.e:

securityfs_remove(spi_ble);
securityfs_remove(spi_bioswe);
securityfs_remove(spi_dir);

> +static void __exit mod_exit(void)
> +{
> +       securityfs_remove(spi_bioswe);
> +       securityfs_remove(spi_ble);
> +       securityfs_remove(spi_smm_bwp);
> +       securityfs_remove(spi_dir);
> +}
> +

Same here. It makes it easier if in the future other entries are added.

I wonder if these new entries should be documented in
Documentation/ABI/. Or maybe that's not a requirement for securityfs?

Best regards,
Javier

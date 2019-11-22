From: =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
Subject: Re: [PATCH] Revert "platform/x86: wmi: Destroy on cleanup rather than unregister"
Date: Fri, 22 Nov 2019 12:38:47 +0100
Message-ID: <87blt45eew.fsf@miraculix.mork.no>
References: <20191115052710.46880-1-yongxin.liu@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191115052710.46880-1-yongxin.liu@windriver.com> (Yongxin Liu's
        message of "Fri, 15 Nov 2019 13:27:10 +0800")
Sender: linux-kernel-owner@vger.kernel.org
To: Yongxin Liu <yongxin.liu@windriver.com>
Cc: andy@infradead.org, dvhart@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, mario.limonciello@dell.com
List-Id: platform-driver-x86.vger.kernel.org

Yongxin Liu <yongxin.liu@windriver.com> writes:

> This reverts commit 7b11e8989618581bc0226ad313264cdc05d48d86.
>
> Consider the following hardware setting.
>
> |-PNP0C14:00
> |  |-- device #1
> |-PNP0C14:01
> |  |-- device #2
>
> When unloading wmi driver module, device #2 will be first unregistered.
> But device_destroy() using MKDEV(0, 0) will locate PNP0C14:00 first
> and unregister it. This is incorrect. Should use device_unregister() to
> unregister the real parent device.
>
> Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
> ---
>  drivers/platform/x86/wmi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
> index 59e9aa0f9643..e16f660aa117 100644
> --- a/drivers/platform/x86/wmi.c
> +++ b/drivers/platform/x86/wmi.c
> @@ -1347,7 +1347,7 @@ static int acpi_wmi_remove(struct platform_device *=
device)
>  	acpi_remove_address_space_handler(acpi_device->handle,
>  				ACPI_ADR_SPACE_EC, &acpi_wmi_ec_space_handler);
>  	wmi_free_devices(acpi_device);
> -	device_destroy(&wmi_bus_class, MKDEV(0, 0));
> +	device_unregister((struct device *)dev_get_drvdata(&device->dev));
>=20=20
>  	return 0;
>  }
> @@ -1401,7 +1401,7 @@ static int acpi_wmi_probe(struct platform_device *d=
evice)
>  	return 0;
>=20=20
>  err_remove_busdev:
> -	device_destroy(&wmi_bus_class, MKDEV(0, 0));
> +	device_unregister(wmi_bus_dev);
>=20=20
>  err_remove_notify_handler:
>  	acpi_remove_notify_handler(acpi_device->handle, ACPI_DEVICE_NOTIFY,


Definitely!  Good catch!

device_create() will allow registering multiple devices with a zero
major.  Using device_destroy() with MKDEV(0, 0) will unregister an
arbitrary one of them.

I believe all of these should be reviewed and fixed up:

drivers/nvme/host/fabrics.c:    device_destroy(nvmf_class, MKDEV(0, 0));
drivers/nvme/host/fabrics.c:    device_destroy(nvmf_class, MKDEV(0, 0));
drivers/nvme/host/fc.c: device_destroy(&fc_class, MKDEV(0, 0));
drivers/nvme/host/fc.c: device_destroy(&fc_class, MKDEV(0, 0));
drivers/nvme/target/fcloop.c:   device_destroy(fcloop_class, MKDEV(0, 0));
drivers/platform/x86/wmi.c:     device_destroy(&wmi_bus_class, MKDEV(0, 0));
drivers/platform/x86/wmi.c:     device_destroy(&wmi_bus_class, MKDEV(0, 0));
drivers/staging/comedi/drivers/comedi_test.c:   device_destroy(ctcls, MKDEV=
(0, 0));
drivers/staging/comedi/drivers/comedi_test.c:           device_destroy(ctcl=
s, MKDEV(0, 0));
drivers/video/fbdev/core/fbcon.c:       device_destroy(fb_class, MKDEV(0, 0=
));
net/netfilter/xt_IDLETIMER.c:   device_destroy(idletimer_tg_class, MKDEV(0,=
 0));
net/netfilter/xt_IDLETIMER.c:   device_destroy(idletimer_tg_class, MKDEV(0,=
 0));


Note that most of these probably are not bugs.  yet...

But there is no reason to look up the device by dev_t for drivers
allowing only one device anyway. Using device_unregister() directly
makes the code easier to follow and prevents future bugs in case
someone decides to support more devices.

Maybe we should add a WARN_ON(!MAJOR(devt)) or similar to
device_destroy() to prevent similar future problems?


Bj=C3=B8rn

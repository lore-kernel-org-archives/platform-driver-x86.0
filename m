From: AceLan Kao <acelan.kao@canonical.com>
Subject: Re: [PATCH] platform/x86: dell-uart-backlight: new backlight driver
 for DELL AIO
Date: Fri, 27 Oct 2017 10:15:15 +0800
Message-ID: <CAMz9Wg-gMCsZGhfy7tmo4H-BYA7FnwA0mi+1VkBaQ7A4aC-TmA@mail.gmail.com>
References: <1509004429-1596-1-git-send-email-acelan.kao@canonical.com> <08add166d5b34992ba167a878ca2a808@ausx13mpc124.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f52.google.com ([209.85.215.52]:47840 "EHLO
        mail-lf0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751947AbdJ0CPS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 26 Oct 2017 22:15:18 -0400
In-Reply-To: <08add166d5b34992ba167a878ca2a808@ausx13mpc124.AMER.DELL.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario.Limonciello@dell.com
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, LKML <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

Hi Mario,

2017-10-26 23:54 GMT+08:00  <Mario.Limonciello@dell.com>:
>> -----Original Message-----
>> From: platform-driver-x86-owner@vger.kernel.org [mailto:platform-driver-=
x86-
>> owner@vger.kernel.org] On Behalf Of AceLan Kao
>> Sent: Thursday, October 26, 2017 2:54 AM
>> To: Darren Hart <dvhart@infradead.org>; Andy Shevchenko
>> <andy@infradead.org>; linux-kernel@vger.kernel.org; platform-driver-
>> x86@vger.kernel.org
>> Subject: [PATCH] platform/x86: dell-uart-backlight: new backlight driver=
 for DELL
>> AIO
>>
>> The Dell AIO machines released after 2017 come with a UART interface
>> to communicate with the backlight scalar board. This driver creates
>> a standard backlight interface and talks to the scalar board through
>> UART.
>>
>> In DSDT this uart port will be defined as
>>    Name (_HID, "DELL0501")
>>    Name (_CID, EisaId ("PNP0501")
>> The 8250 PNP driver will be loaded by default, and this driver uses
>> "DELL0501" to confirm the uart port is a backlight interface and
>> leverages the port created by 8250 PNP driver to communicate with
>> the scalar board.
>>
>> Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
>> ---
>>  MAINTAINERS                                |   6 +
>>  drivers/platform/x86/Kconfig               |  14 ++
>>  drivers/platform/x86/Makefile              |   1 +
>>  drivers/platform/x86/dell-uart-backlight.c | 361
>> +++++++++++++++++++++++++++++
>>  drivers/platform/x86/dell-uart-backlight.h |  88 +++++++
>>  5 files changed, 470 insertions(+)
>>  create mode 100644 drivers/platform/x86/dell-uart-backlight.c
>>  create mode 100644 drivers/platform/x86/dell-uart-backlight.h
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index d85c089..581cb09 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -4013,6 +4013,12 @@ M:     Pali Roh=C3=A1r <pali.rohar@gmail.com>
>>  S:   Maintained
>>  F:   drivers/platform/x86/dell-wmi.c
>>
>> +DELL AIO UART BACKLIGHT DRIVER
>> +M:   AceLan Kao <acelan.kao@canonical.com>
>> +L:   platform-driver-x86@vger.kernel.org
>> +S:   Maintained
>> +F:   drivers/platform/x86/dell-uart-backlight.c
>> +
>>  DELTA ST MEDIA DRIVER
>>  M:   Hugues Fruchet <hugues.fruchet@st.com>
>>  L:   linux-media@vger.kernel.org
>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
>> index 80b8795..58e26bc 100644
>> --- a/drivers/platform/x86/Kconfig
>> +++ b/drivers/platform/x86/Kconfig
>> @@ -175,6 +175,20 @@ config DELL_RBTN
>>         To compile this driver as a module, choose M here: the module wi=
ll
>>         be called dell-rbtn.
>>
>> +config DELL_UART_BACKLIGHT
>> +     tristate "Dell AIO UART Backlight driver"
>> +     depends on SERIAL_8250
>> +     depends on ACPI
>> +     ---help---
>> +       Say Y here if you want to support Dell AIO UART backlight interf=
ace.
>> +       The Dell AIO machines released after 2017 come with a UART inter=
face
>> +       to communicate with the backlight scalar board. This driver crea=
tes
>> +       a standard backlight interface and talks to the scalar board thr=
ough
>> +       UART to adjust the AIO screen brightness.
>> +
>> +       To compile this driver as a module, choose M here: the module wi=
ll
>> +       be called dell_uart_backlight.
>> +
>>
>>  config FUJITSU_LAPTOP
>>       tristate "Fujitsu Laptop Extras"
>> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefi=
le
>> index 91cec17..3cf576f 100644
>> --- a/drivers/platform/x86/Makefile
>> +++ b/drivers/platform/x86/Makefile
>> @@ -18,6 +18,7 @@ obj-$(CONFIG_DELL_WMI_AIO)  +=3D dell-wmi-aio.o
>>  obj-$(CONFIG_DELL_WMI_LED)   +=3D dell-wmi-led.o
>>  obj-$(CONFIG_DELL_SMO8800)   +=3D dell-smo8800.o
>>  obj-$(CONFIG_DELL_RBTN)              +=3D dell-rbtn.o
>> +obj-$(CONFIG_DELL_UART_BACKLIGHT) +=3D dell-uart-backlight.o
>>  obj-$(CONFIG_ACER_WMI)               +=3D acer-wmi.o
>>  obj-$(CONFIG_ACERHDF)                +=3D acerhdf.o
>>  obj-$(CONFIG_HP_ACCEL)               +=3D hp_accel.o
>> diff --git a/drivers/platform/x86/dell-uart-backlight.c b/drivers/platfo=
rm/x86/dell-
>> uart-backlight.c
>> new file mode 100644
>> index 0000000..400be77
>> --- /dev/null
>> +++ b/drivers/platform/x86/dell-uart-backlight.c
>> @@ -0,0 +1,361 @@
>> +/*
>> + *  Dell AIO Serial Backlight Driver
>> + *
>> + *  Copyright (C) 2017 AceLan Kao <acelan.kao@canonical.com>
>> + *
>> + *  This program is free software; you can redistribute it and/or modif=
y
>> + *  it under the terms of the GNU General Public License as published b=
y
>> + *  the Free Software Foundation; either version 2 of the License, or
>> + *  (at your option) any later version.
>> + *
>> + *  This program is distributed in the hope that it will be useful,
>> + *  but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + *  GNU General Public License for more details.
>> + *
>> + */
>> +
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/acpi.h>
>> +#include <linux/serial_8250.h>
>> +#include <linux/delay.h>
>> +#include <linux/backlight.h>
>> +#include <acpi/video.h>
>> +
>> +#include "dell-uart-backlight.h"
>> +
>> +struct dell_uart_backlight {
>> +     struct device *dev;
>> +     struct backlight_device *dell_uart_bd;
>> +     struct mutex brightness_mutex;
>> +     int line;
>> +     int bl_power;
>> +};
>> +struct uart_8250_port *serial8250_get_port(int line);
>> +struct tty_struct *tty;
>> +struct file *ftty;
>> +
>> +unsigned int (*io_serial_in)(struct uart_port *p, int offset);
>> +int (*uart_write)(struct tty_struct *tty, const unsigned char *buf, int=
 count);
>> +int (*uart_chars_in_buffer)(struct tty_struct *tty);
>> +
>> +static int dell_uart_write(struct uart_8250_port *up, __u8 *buf, int le=
n)
>> +{
>> +     int actual =3D 0;
>> +     struct uart_port *port =3D &up->port;
>> +
>> +     tty_port_tty_wakeup(&port->state->port);
>> +     tty =3D tty_port_tty_get(&port->state->port);
>> +     actual =3D uart_write(tty, buf, len);
>> +     while (uart_chars_in_buffer(tty)) {
>> +             udelay(10);
>> +     }
>> +
>> +     return actual;
>> +}
>> +
>> +static int dell_uart_read(struct uart_8250_port *up, __u8 *buf, int len=
)
>> +{
>> +     int i, retry;
>> +     unsigned long flags;
>> +
>> +     spin_lock_irqsave(&up->port.lock, flags);
>> +     for (i =3D 0; i < len; i++) {
>> +             retry =3D 10;
>> +             while (!(io_serial_in(&up->port, UART_LSR) & UART_LSR_DR))=
 {
>> +                     if (--retry =3D=3D 0)
>> +                             break;
>> +                     mdelay(20);
>> +             }
>> +
>> +             if (retry =3D=3D 0)
>> +                     break;
>> +             buf[i] =3D io_serial_in(&up->port, UART_RX);
>> +     }
>> +     spin_unlock_irqrestore(&up->port.lock, flags);
>> +
>> +     return i;
>> +}
>> +
>> +static void dell_uart_dump_cmd(const char *func, const char *prefix,
>> +                            const char *cmd, int len)
>> +{
>> +     char buf[80];
>> +
>> +     snprintf(buf, 80, "dell_uart_backlight:%s:%s", func, prefix);
>> +     if (len !=3D 0)
>> +             print_hex_dump_debug(buf, DUMP_PREFIX_NONE,
>> +                                     16, 1, cmd, len, false);
>> +     else
>> +             pr_debug("dell_uart_backlight:%s:%sNULL\n", func, prefix);
>> +
>> +}
>> +
>> +/*
>> + * checksum: SUM(Length and Cmd and Data)xor 0xFF)
>> + */
>> +static unsigned char dell_uart_checksum(unsigned char *buf, int len)
>> +{
>> +     unsigned char val =3D 0;
>> +
>> +     while (len-- > 0)
>> +             val +=3D buf[len];
>> +
>> +     return val ^ 0xff;
>> +}
>> +
>> +/*
>> + * There is no command to get backlight power status,
>> + * so we set the backlight power to "on" while initializing,
>> + * and then track and report its status by bl_power variable
>> + */
>> +static int dell_uart_get_bl_power(struct dell_uart_backlight *dell_pdat=
a)
>> +{
>> +     return dell_pdata->bl_power;
>> +}
>> +
>> +static int dell_uart_set_bl_power(struct backlight_device *bd, int powe=
r)
>> +{
>> +     struct dell_uart_bl_cmd *bl_cmd =3D
>> +             &uart_cmd[DELL_UART_SET_BACKLIGHT_POWER];
>> +     struct dell_uart_backlight *dell_pdata =3D bl_get_data(bd);
>> +     struct uart_8250_port *uart =3D serial8250_get_port(dell_pdata->li=
ne);
>> +     int rx_len;
>> +
>> +     if (power !=3D FB_BLANK_POWERDOWN)
>> +             power =3D FB_BLANK_UNBLANK;
>> +
>> +     bl_cmd->cmd[2] =3D power?0:1;
>> +     bl_cmd->cmd[3] =3D dell_uart_checksum(bl_cmd->cmd, bl_cmd->tx_len =
- 1);
>> +
>> +     dell_uart_dump_cmd(__func__, "tx: ", bl_cmd->cmd, bl_cmd->tx_len);
>> +
>> +     if (mutex_lock_killable(&dell_pdata->brightness_mutex) < 0) {
>> +             pr_debug("Failed to get mutex_lock");
>> +             return 0;
>> +     }
>> +
>> +     dell_uart_write(uart, bl_cmd->cmd, bl_cmd->tx_len);
>> +     rx_len =3D dell_uart_read(uart, bl_cmd->ret, bl_cmd->rx_len);
>> +
>> +     mutex_unlock(&dell_pdata->brightness_mutex);
>> +
>> +     dell_uart_dump_cmd(__func__, "rx: ", bl_cmd->ret, rx_len);
>> +
>> +     bd->props.power =3D power;
>> +     dell_pdata->bl_power =3D power;
>> +
>> +     return 0;
>> +}
>> +
>> +static int dell_uart_get_brightness(struct backlight_device *bd)
>> +{
>> +     struct dell_uart_bl_cmd *bl_cmd =3D
>> &uart_cmd[DELL_UART_GET_BRIGHTNESS];
>> +     struct dell_uart_backlight *dell_pdata =3D bl_get_data(bd);
>> +     struct uart_8250_port *uart =3D serial8250_get_port(dell_pdata->li=
ne);
>> +     int rx_len, brightness =3D 0;
>> +
>> +     dell_uart_dump_cmd(__func__, "tx: ", bl_cmd->cmd, bl_cmd->tx_len);
>> +
>> +     if (mutex_lock_killable(&dell_pdata->brightness_mutex) < 0) {
>> +             pr_debug("Failed to get mutex_lock");
>> +             return 0;
>> +     }
>> +
>> +     dell_uart_write(uart, bl_cmd->cmd, bl_cmd->tx_len);
>> +     rx_len =3D dell_uart_read(uart, bl_cmd->ret, bl_cmd->rx_len);
>> +
>> +     mutex_unlock(&dell_pdata->brightness_mutex);
>> +
>> +     dell_uart_dump_cmd(__func__, "rx: ", bl_cmd->ret, rx_len);
>> +
>> +     brightness =3D (unsigned int)bl_cmd->ret[2];
>> +
>> +     return brightness;
>> +}
>> +
>> +static int dell_uart_update_status(struct backlight_device *bd)
>> +{
>> +     struct dell_uart_bl_cmd *bl_cmd =3D
>> &uart_cmd[DELL_UART_SET_BRIGHTNESS];
>> +     struct dell_uart_backlight *dell_pdata =3D bl_get_data(bd);
>> +     struct uart_8250_port *uart =3D serial8250_get_port(dell_pdata->li=
ne);
>> +     int rx_len;
>> +
>> +     bl_cmd->cmd[2] =3D bd->props.brightness;
>> +     bl_cmd->cmd[3] =3D dell_uart_checksum(bl_cmd->cmd, bl_cmd->tx_len =
- 1);
>> +
>> +     dell_uart_dump_cmd(__func__, "tx: ", bl_cmd->cmd, bl_cmd->tx_len);
>> +
>> +     if (mutex_lock_killable(&dell_pdata->brightness_mutex) < 0) {
>> +             pr_debug("Failed to get mutex_lock");
>> +             return 0;
>> +     }
>> +
>> +     dell_uart_write(uart, bl_cmd->cmd, bl_cmd->tx_len);
>> +     rx_len =3D dell_uart_read(uart, bl_cmd->ret, bl_cmd->rx_len);
>> +
>> +     mutex_unlock(&dell_pdata->brightness_mutex);
>> +
>> +     dell_uart_dump_cmd(__func__, "rx: ", bl_cmd->ret, rx_len);
>> +
>> +     if (bd->props.power !=3D dell_uart_get_bl_power(dell_pdata))
>> +             dell_uart_set_bl_power(bd, bd->props.power);
>> +
>> +     return 0;
>> +}
>> +
>> +static void dell_uart_show_firmware_ver(struct dell_uart_backlight *del=
l_pdata)
>> +{
>> +     struct dell_uart_bl_cmd *bl_cmd =3D
>> &uart_cmd[DELL_UART_GET_FIRMWARE_VER];
>> +     struct uart_8250_port *uart =3D serial8250_get_port(dell_pdata->li=
ne);
>> +     int rx_len, retry =3D 10;
>> +
>> +     dell_uart_dump_cmd(__func__, "tx: ", bl_cmd->cmd, bl_cmd->tx_len);
>> +
>> +     if (mutex_lock_killable(&dell_pdata->brightness_mutex) < 0) {
>> +             pr_debug("Failed to get mutex_lock");
>> +             return;
>> +     }
>> +
>> +     dell_uart_write(uart, bl_cmd->cmd, bl_cmd->tx_len);
>> +     while (retry-- > 0) {
>> +             /* first byte is data length */
>> +             dell_uart_read(uart, bl_cmd->ret, 1);
>> +             rx_len =3D (int)bl_cmd->ret[0];
>> +             if (bl_cmd->ret[0] > 80 || bl_cmd->ret[0] <=3D 0) {
>> +                     pr_debug("Failed to get firmware version\n");
>> +                     if (retry =3D=3D 0) {
>> +                             mutex_unlock(&dell_pdata->brightness_mutex=
);
>> +                             return;
>> +                     }
>> +                     msleep(100);
>> +                     continue;
>> +             }
>> +
>> +             dell_uart_read(uart, bl_cmd->ret+1, rx_len-1);
>> +             break;
>> +     }
>> +     mutex_unlock(&dell_pdata->brightness_mutex);
>> +
>> +     dell_uart_dump_cmd(__func__, "rx: ", bl_cmd->ret, rx_len);
>> +
>> +     pr_debug("Firmare str(%d)=3D %s\n", (int)bl_cmd->ret[0], bl_cmd->r=
et+2);
>> +}
>> +
>> +static const struct backlight_ops dell_uart_backlight_ops =3D {
>> +     .get_brightness =3D dell_uart_get_brightness,
>> +     .update_status =3D dell_uart_update_status,
>> +};
>> +
>> +static int dell_uart_startup(struct dell_uart_backlight *dell_pdata)
>> +{
>> +     struct uart_8250_port *uartp;
>> +     struct uart_port *port;
>> +     int ret;
>> +
>> +     dell_pdata->line =3D 0;
>> +     uartp =3D serial8250_get_port(dell_pdata->line);
>> +     port =3D &uartp->port;
>> +     ret =3D port->state->port.ops->activate(&port->state->port, port->=
state-
>> >port.tty);
>> +     tty =3D port->state->port.tty;
>> +     io_serial_in =3D port->serial_in;
>> +     uart_write =3D tty->driver->ops->write;
>> +     uart_chars_in_buffer =3D tty->driver->ops->chars_in_buffer;
>> +
>
> Looking at the comment for serial8250_get_port, it sounds like the serial=
 driver
> doesn't really want other drivers using this function outside of suspend/=
resume callback.
>
> /**
>  * serial8250_get_port - retrieve struct uart_8250_port
>  * @line: serial line number
>  *
>  * This function retrieves struct uart_8250_port for the specific line.
>  * This struct *must* *not* be used to perform a 8250 or serial core oper=
ation
>  * which is not accessible otherwise. Its only purpose is to make the str=
uct
>  * accessible to the runtime-pm callbacks for context suspend/restore.
>  * The lock assumption made here is none because runtime-pm suspend/resum=
e
>  * callbacks should not be invoked if there is any operation performed on=
 the
>  * port.
>  */
> http://elixir.free-electrons.com/linux/v4.13/source/drivers/tty/serial/82=
50/8250_core.c#L409
>
> If serial core doesn't provide an API, have you already discussed with se=
rial maintainer
> to review your approach?  It might make sense to work with serial maintai=
ner to provide
> an API for this type of usecase if it doesn't exist.
Yes, I know the pointer returned from serial8250_get_port() becomes
unavailable after S3.
So, I provide a suspend/resume function try to workaround it.
But just like the comment described, it's risky to perform serial
operations by using the structure,
and there is a new interface to deal with this kind of requirement, serdev.
But serdev is introduced after v4.12, to make it work before serdev, I
can't find other good solutions for it.

>
>> +     return 0;
>> +}
>> +
>> +static int dell_uart_bl_add(struct acpi_device *dev)
>> +{
>> +     struct dell_uart_backlight *dell_pdata;
>> +     struct backlight_properties props;
>> +     struct backlight_device *dell_uart_bd;
>> +
>> +     dell_pdata =3D kzalloc(sizeof(struct dell_uart_backlight), GFP_KER=
NEL);
>> +     dell_pdata->dev =3D &dev->dev;
>> +     dell_uart_startup(dell_pdata);
>> +     dev->driver_data =3D dell_pdata;
>> +
>> +     mutex_init(&dell_pdata->brightness_mutex);
>> +
>> +     memset(&props, 0, sizeof(struct backlight_properties));
>> +     props.type =3D BACKLIGHT_PLATFORM;
>> +     props.max_brightness =3D 100;
>
> Is the memset of zero actually necessary?  Of the items in
> backlight_properties:
> * you set brightness a few lines later
> (after it's been memcpy'ed in the backlight device)
> * You set max brightness explicitly
> * You set power a few lines below
>
> So the only attribute missing is fb_blank.  That's marked "to be removed"=
.

Yes, I believe it should work after memset() is removed.
I'll remove it and verify it.

>> +
>> +     dell_uart_bd =3D backlight_device_register("dell_uart_backlight",
>> +                                              &dev->dev,
>> +                                              dell_pdata,
>> +                                              &dell_uart_backlight_ops,
>> +                                              &props);
>> +     dell_pdata->dell_uart_bd =3D dell_uart_bd;
>> +
>> +     dell_uart_show_firmware_ver(dell_pdata);
>> +     dell_uart_set_bl_power(dell_uart_bd, FB_BLANK_UNBLANK);
>> +     dell_uart_bd->props.brightness =3D 100;
>> +     backlight_update_status(dell_uart_bd);
>> +
>> +     /* unregister acpi backlight interface */
>> +     acpi_video_set_dmi_backlight_type(acpi_backlight_vendor);
>
> Since you change this when the driver is loaded, you should cache the old
> value and restore it when the driver is unloaded too.

In this case, acpi backlight doesn't work, all the backlight
operations would go through UART commands.
So, it safe to remove it.

>
>> +
>> +     return 0;
>> +}
>> +
>> +static int dell_uart_bl_remove(struct acpi_device *dev)
>> +{
>> +     struct dell_uart_backlight *dell_pdata =3D dev->driver_data;
>> +
>> +     backlight_device_unregister(dell_pdata->dell_uart_bd);
>> +
>> +     return 0;
>> +}
>> +
>> +static int dell_uart_bl_suspend(struct device *dev)
>> +{
>> +     filp_close(ftty, NULL);
>> +     return 0;
>> +}
>> +
>> +static int dell_uart_bl_resume(struct device *dev)
>> +{
>> +     ftty =3D filp_open("/dev/ttyS0", O_RDWR | O_NOCTTY | O_NDELAY, 0);
>> +     return 0;
>> +}
>> +
>> +static SIMPLE_DEV_PM_OPS(dell_uart_bl_pm, dell_uart_bl_suspend,
>> dell_uart_bl_resume);
>> +
>> +static const struct acpi_device_id dell_uart_bl_ids[] =3D {
>> +     {"DELL0501", 0},
>> +     {"", 0},
>> +};
>> +
>> +static struct acpi_driver dell_uart_backlight_driver =3D {
>> +     .name =3D "Dell AIO serial backlight",
>> +     .ids =3D dell_uart_bl_ids,
>> +     .ops =3D {
>> +             .add =3D dell_uart_bl_add,
>> +             .remove =3D dell_uart_bl_remove,
>> +     },
>> +     .drv.pm =3D &dell_uart_bl_pm,
>> +};
>> +
>> +static int __init dell_uart_bl_init(void)
>> +{
>> +     ftty =3D filp_open("/dev/ttyS0", O_RDWR | O_NOCTTY | O_NDELAY, 0);
>
> I guess this is to prevent other userspace apps from accessing the port
> simultaneously right?  I think you'll need to check if the open failed
> IS_ERR(ftty)
> or similar to make sure that this driver would fail to load if the file
> didn't exist or was opened by userspace with an exclusive lock or somethi=
ng.

No, it's not for the port simultaneously.
There are some magics been done after the uart port is opened.
If I don't open the port, I can't get any data from the uart read
command, no clock/interrupt I believe.
Have no clues how to achieve it without opening it, so I open the port
explicitly here.

>
>> +
>> +     return acpi_bus_register_driver(&dell_uart_backlight_driver);
>> +}
>> +
>> +static void __exit dell_uart_bl_exit(void)
>> +{
>> +     filp_close(ftty, NULL);
>> +
>> +     acpi_bus_unregister_driver(&dell_uart_backlight_driver);
>> +}
>> +
>> +module_init(dell_uart_bl_init);
>> +module_exit(dell_uart_bl_exit);
>> +MODULE_DEVICE_TABLE(acpi, dell_uart_bl_ids);
>> +MODULE_DESCRIPTION("Dell AIO Serial Backlight module");
>> +MODULE_AUTHOR("AceLan Kao <acelan.kao@canonical.com>");
>> +MODULE_LICENSE("GPL");
>> diff --git a/drivers/platform/x86/dell-uart-backlight.h b/drivers/platfo=
rm/x86/dell-
>> uart-backlight.h
>> new file mode 100644
>> index 0000000..b8bca12
>> --- /dev/null
>> +++ b/drivers/platform/x86/dell-uart-backlight.h
>> @@ -0,0 +1,88 @@
>> +/*
>> + *  Dell AIO Serial Backlight Driver
>> + *
>> + *  Copyright (C) 2017 AceLan Kao <acelan.kao@canonical.com>
>> + *
>> + *  This program is free software; you can redistribute it and/or modif=
y
>> + *  it under the terms of the GNU General Public License as published b=
y
>> + *  the Free Software Foundation; either version 2 of the License, or
>> + *  (at your option) any later version.
>> + *
>> + *  This program is distributed in the hope that it will be useful,
>> + *  but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + *  GNU General Public License for more details.
>> + *
>> + */
>> +
>> +#ifndef _DELL_UART_BACKLIGHT_H_
>> +#define _DELL_UART_BACKLIGHT_H_
>> +
>> +enum {
>> +     DELL_UART_GET_FIRMWARE_VER,
>> +     DELL_UART_GET_BRIGHTNESS,
>> +     DELL_UART_SET_BRIGHTNESS,
>> +     DELL_UART_SET_BACKLIGHT_POWER,
>> +};
>> +
>> +struct dell_uart_bl_cmd {
>> +     unsigned char   cmd[10];
>> +     unsigned char   ret[80];
>> +     unsigned short  tx_len;
>> +     unsigned short  rx_len;
>> +};
>> +
>> +static struct dell_uart_bl_cmd uart_cmd[] =3D {
>> +     /*
>> +      * Get Firmware Version: Tool uses this command to get firmware ve=
rsion.
>> +      * Command: 0x6A 0x06 0x8F (Length:3 Type: 0x0A, Cmd:6 Checksum:0x=
8F)
>> +      * Return data: 0x0D 0x06 Data checksum (Length:13,Cmd:0x06,
>> +      *              Data :F/W version(APRILIA=3DAPR27-VXXX,PHINE=3DPHI=
23-VXXX),
>> +      *              checksum:SUM(Length and Cmd and Data)xor 0xFF .
>> +      */
>> +     [DELL_UART_GET_FIRMWARE_VER] =3D {
>> +             .cmd    =3D {0x6A, 0x06, 0x8F},
>> +             .tx_len =3D 3,
>> +     },
>> +     /*
>> +      * Get Brightness level: Application uses this command for scaler =
to get
>> brightness.
>> +      * Command: 0x6A 0x0C 0x89 (Length:3 Type: 0x0A, Cmd:0x0C,
>> Checksum:0x89)
>> +      * Return data: 0x04 0x0C Data checksum
>> +      * (Length:4 Cmd: 0x0C Data: brightness level checksum: SUM(Length=
 and
>> Cmd and Data)xor 0xFF)
>> +      *           brightness level which ranges from 0~100.
>> +      */
>> +     [DELL_UART_GET_BRIGHTNESS] =3D {
>> +             .cmd    =3D {0x6A, 0x0C, 0x89},
>> +             .ret    =3D {0x04, 0x0C, 0x00, 0x00},
>> +             .tx_len =3D 3,
>> +             .rx_len =3D 4,
>> +     },
>> +     /* Set Brightness level: Application uses this command for scaler =
to set
>> brightness.
>> +      * Command: 0x8A 0x0B Byte2 Checksum (Length:4 Type: 0x0A, Cmd:0x0=
B)
>> +      *          where Byte2 is the brightness level which ranges from =
0~100.
>> +      * Return data: 0x03 0x0B 0xF1(Length:3,Cmd:B,checksum:0xF1)
>> +      * Scaler must send the 3bytes ack within 1 second when success, o=
ther
>> value if error
>> +      */
>> +     [DELL_UART_SET_BRIGHTNESS] =3D {
>> +             .cmd    =3D {0x8A, 0x0B, 0x0, 0x0},
>> +             .ret    =3D {0x03, 0x0B, 0xF1},
>> +             .tx_len =3D 4,
>> +             .rx_len =3D 3,
>> +     },
>> +     /*
>> +      * Screen ON/OFF Control: Application uses this command to control=
 screen
>> ON or OFF.
>> +      * Command: 0x8A 0x0E Byte2 Checksum (Length:4 Type: 0x0A, Cmd:0x0=
E)
>> where
>> +      *          Byte2=3D0 to turn OFF the screen.
>> +      *          Byte2=3D1 to turn ON the screen
>> +      *          Other value of Byte2 is reserved and invalid.
>> +      * Return data: 0x03 0x0E 0xEE(Length:3,Cmd:E,checksum:0xEE)
>> +      */
>> +     [DELL_UART_SET_BACKLIGHT_POWER] =3D {
>> +             .cmd    =3D {0x8A, 0x0E, 0x00, 0x0},
>> +             .ret    =3D {0x03, 0x0E, 0xEE},
>> +             .tx_len =3D 4,
>> +             .rx_len =3D 3,
>> +     },
>> +};
>> +
>> +#endif /* _DELL_UART_BACKLIGHT_H_ */
>> --
>> 2.7.4
>



--=20
Chia-Lin Kao(AceLan)
http://blog.acelan.idv.tw/
E-Mail: acelan.kaoATcanonical.com (s/AT/@/)

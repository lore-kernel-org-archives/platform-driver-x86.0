Received: from mail-244119.protonmail.ch (mail-244119.protonmail.ch [109.224.244.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D8B14A60F
	for <platform-driver-x86@vger.kernel.org>; Sun,  9 Aug 2026 13:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786281749; cv=none; b=qAesnaD9fCVeJHqho6v9uuWV6cjvZIhwj7F/esGuGFIIts2NbjLIwU8naP3xlqdyaFI2qt3OlnobQeta0EBTiN9bT1TfFTOxlJeDyDFH0h0Y5kbNZIi9FGMoXUGKitBm/ANPQOWCo37oUAVCMUgDSx/y5QyGRXIzzuRh+1VrDZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786281749; c=relaxed/simple;
	bh=bbMAlE56EVfNmyZT2AiGUTlr9fjSVaPHbM11RqGcV6Y=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AEAMZZXeyhTKKQtSad1b4usF3CIX5YZqp9rosF5X8/hCsDZPOKW8wgsuSHBLEXQjY2YHtaZgx3sJMIYf28rEznZuzAUNXTKsJPu67wzssTwWuBAAPXftYEfU4Xz6HANT0QY5qOdUM9oaaKM9F9+RBYWoJeDF3pufsGlxiedqRZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=Vdlci1Yv; arc=none smtp.client-ip=109.224.244.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="Vdlci1Yv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail2; t=1786281740; x=1786540940;
	bh=2KI8GEh8cDmIWVinlkYdZftm7oA5xRTpEB4A2uY9g+E=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Vdlci1YvIqnB4kpqsR3yOTGx1adBIFUPNaOHomnIqdETiI8y6/0lF4bteh+RyGPD2
	 XJiN5Z2KKi8CaMz/lqjTg+PNt5GvlVxhIAtGUnQNZkkJnP5O2XDj9mN/QxDLdIkwn3
	 tvaU+sFwyLGZoL3DUgmFOPUCb2dOGXIs39mVaCNoWBKQqXV1ZytsBz++Klfp9jKW6D
	 gM83CQJHYG8Uet43kJT9u6OW5rw7HsnbvV0d/g4kSauLPX8NXGQnw3rLLC5DoeM1Um
	 qiBf7ddBgX19O33z97m77dLO18lmhvOw5PuU4hYGfbnSi9kjhcpWH1fMgtnvBrWA7m
	 CSkPbFcW/emXw==
Date: Sun, 09 Aug 2026 13:22:14 +0000
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, laurentiu.tudor1@dell.com, Abel Vesa <abel.vesa@oss.qualcomm.com>, Tobias Heider <tobias.heider@canonical.com>, Val Packett <val@packett.cool>, Neil Armstrong <neil.armstrong@linaro.org>, Stephan Gerhold <stephan.gerhold@linaro.org>
Subject: Re: [PATCH v3 2/3] platform: arm64: dell-xps-ec: new driver
Message-ID: <6BXqGe3dUjlSSoYUgSDvrO0rn9-g1fATSBg3KqwoG4kXZNXsPYKBQd4ZtFx7iYwxhm8zIC8QW9zZSHxb716u_8XhOiHeHkhs2Ah4kwuwSIg=@vinarskis.com>
In-Reply-To: <42505e53-ff1a-43ba-8125-3f00b0895ebd@linaro.org>
References: <20260801-dell-xps-9345-ec-v3-0-9f4bdb5a5dad@vinarskis.com> <20260801-dell-xps-9345-ec-v3-2-9f4bdb5a5dad@vinarskis.com> <42505e53-ff1a-43ba-8125-3f00b0895ebd@linaro.org>
Feedback-ID: 158356072:user:proton
X-Pm-Message-ID: f320a2a7a8eb1c8b9e8f59bc90afa47cb2d6c0ca
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On Saturday, August 1st, 2026 at 23:15, Bryan O'Donoghue <bryan.odonoghue@l=
inaro.org> wrote:

Hi Bryan,

Thanks for review;

> On 01/08/2026 19:22, Aleksandrs Vinarskis wrote:
> > Introduce EC driver for Dell XPS 13 9345 (codename 'tributo') which may
> > partially of fully compatible with Snapdragon-based Dell Latitude,
> > Inspiron ('thena'). Primary function of this driver is unblock EC's
> > thermal management, specifically to provide it with necessary
> > information to control device fans, peripherals power.
> >
> > The driver was developed primarily by analyzing ACPI DSDT's _DSM and
> > i2c dumps of communication between SoC and EC. Changes to Windows
> > driver's behavior include increasing temperature feed loop from ~50ms
> > to 100ms here.
> >
> > While Xps's EC is rather complex and controls practically all device
> > peripherals including touch row's brightness and special keys such as
> > mic mute, these do not go over this particular i2c interface.
> >
> > Not yet implemented features:
> > - On lid-close IRQ event is registered. Windows performs what to
> >    appears to be thermistor constants readout, though its not obvious
> >    what it used for.
> > - According to ACPI's _DSM there is a method to readout fans' RPM.
> > - Initial thermistor constants were sniffed from Windows, these can be
> >    likely fine tuned for better cooling performance.
> > - There is additional temperature reading that Windows sents to EC but
> >    more rare than others, likely SoC T_j / TZ98 or TZ4. This is the onl=
y
> >    thermal zone who's reading can exceed 115C without triggering therma=
l
> >    shutdown.
> > - Given similarities between 'tributo' and 'thena' platforms, including
> >    EC i2c address, driver can be potentially extended to support both.
> >
> > Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> > ---
> >   MAINTAINERS                          |   1 +
> >   drivers/platform/arm64/Kconfig       |  12 ++
> >   drivers/platform/arm64/Makefile      |   1 +
> >   drivers/platform/arm64/dell-xps-ec.c | 268 ++++++++++++++++++++++++++=
+++++++++
> >   4 files changed, 282 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 9b5efed4c430..64e143bc5129 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -7347,6 +7347,7 @@ DELL XPS EMBEDDED CONTROLLER DRIVER
> >   M:=09Aleksandrs Vinarskis <alex@vinarskis.com>
> >   S:=09Maintained
> >   F:=09Documentation/devicetree/bindings/embedded-controller/dell,xps13=
-9345-ec.yaml
> > +F:=09drivers/platform/arm64/dell-xps-ec.c
> >
> >   DELTA AHE-50DC FAN CONTROL MODULE DRIVER
> >   M:=09Zev Weiss <zev@bewilderbeest.net>
> > diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kc=
onfig
> > index e32e01b2a9bd..29416f8d7232 100644
> > --- a/drivers/platform/arm64/Kconfig
> > +++ b/drivers/platform/arm64/Kconfig
> > @@ -33,6 +33,18 @@ config EC_ACER_ASPIRE1
> >   =09  laptop where this information is not properly exposed via the
> >   =09  standard ACPI devices.
> >
> > +config EC_DELL_XPS
> > +=09tristate "Dell XPS 9345 Embedded Controller driver"
> > +=09depends on ARCH_QCOM || COMPILE_TEST
> > +=09depends on I2C
> > +=09depends on IIO
> > +=09help
> > +=09  Driver for the Embedded Controller in the Qualcomm Snapdragon-bas=
ed
> > +=09  Dell XPS 13 9345, which handles thermal management and fan speed
> > +=09  control.
> > +
> > +=09  Say M or Y here to include this support.
> > +
> >   config EC_HUAWEI_GAOKUN
> >   =09tristate "Huawei Matebook E Go Embedded Controller driver"
> >   =09depends on ARCH_QCOM || COMPILE_TEST
> > diff --git a/drivers/platform/arm64/Makefile b/drivers/platform/arm64/M=
akefile
> > index 7681be4a46e9..669dc9e79afb 100644
> > --- a/drivers/platform/arm64/Makefile
> > +++ b/drivers/platform/arm64/Makefile
> > @@ -6,6 +6,7 @@
> >   #
> >
> >   obj-$(CONFIG_EC_ACER_ASPIRE1)=09+=3D acer-aspire1-ec.o
> > +obj-$(CONFIG_EC_DELL_XPS)=09+=3D dell-xps-ec.o
> >   obj-$(CONFIG_EC_HUAWEI_GAOKUN)=09+=3D huawei-gaokun-ec.o
> >   obj-$(CONFIG_EC_LENOVO_YOGA_C630) +=3D lenovo-yoga-c630.o
> >   obj-$(CONFIG_EC_LENOVO_THINKPAD_T14S) +=3D lenovo-thinkpad-t14s.o
> > diff --git a/drivers/platform/arm64/dell-xps-ec.c b/drivers/platform/ar=
m64/dell-xps-ec.c
> > new file mode 100644
> > index 000000000000..7758f5dd9342
> > --- /dev/null
> > +++ b/drivers/platform/arm64/dell-xps-ec.c
> > @@ -0,0 +1,268 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (c) 2026, Aleksandrs Vinarskis <alex@vinarskis.com>
> > + */
> > +
> > +#include <linux/array_size.h>
> > +#include <linux/dev_printk.h>
> > +#include <linux/device.h>
> > +#include <linux/devm-helpers.h>
> > +#include <linux/err.h>
> > +#include <linux/i2c.h>
> > +#include <linux/iio/consumer.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/jiffies.h>
> > +#include <linux/module.h>
> > +#include <linux/pm.h>
> > +#include <linux/unaligned.h>
> > +#include <linux/workqueue.h>
> > +
> > +#define DELL_XPS_EC_SUSPEND_CMD=09=090xb9
> > +#define DELL_XPS_EC_SUSPEND_MSG_LEN=0964
> > +
> > +#define DELL_XPS_EC_TEMP_CMD0=09=090xfb
> > +#define DELL_XPS_EC_TEMP_CMD1=09=090x20
> > +#define DELL_XPS_EC_TEMP_CMD3=09=090x02
> > +#define DELL_XPS_EC_TEMP_MSG_LEN=096
> > +#define DELL_XPS_EC_TEMP_POLL_JIFFIES=09msecs_to_jiffies(100)
> > +
> > +/*
> > + * Format:
> > + * - header/unknown (2 bytes)
> > + * - per-thermistor entries (3 bytes): thermistor_id, param1, param2
> > + */
> > +static const u8 dell_xps_ec_thermistor_profile[] =3D {
> > +=090xff, 0x54,
> > +=090x01, 0x00, 0x2b,=09/* sys_therm0 */
> > +=090x02, 0x44, 0x2a,=09/* sys_therm1 */
> > +=090x03, 0x44, 0x2b,=09/* sys_therm2 */
> > +=090x04, 0x44, 0x28,=09/* sys_therm3 */
> > +=090x05, 0x55, 0x2a,=09/* sys_therm4 */
> > +=090x06, 0x44, 0x26,=09/* sys_therm5 */
> > +=090x07, 0x44, 0x2b,=09/* sys_therm6 */
> > +};
>=20
> You ready have intuited this as a data-structure so if you define it as
> such with __attribute(packed); it will look neater.
>=20

I looked into it again, and I think its safer to assume that the init
sequence is a 'magic byte sequence' instead. The order and total amount
of thermistors does not match the data structure that is being sent on
regular intervals (off by one, short by one). I am also not sure it
would be the same across different platforms.

> > +
> > +/*
> > + * Mapping from IIO channel name to EC command byte
> > + */
> > +static const struct {
> > +=09const char *name;
> > +=09u8 cmd;
> > +} dell_xps_ec_therms[] =3D {
> > +=09/* TODO: 0x01 is sent only occasionally, likely TZ98 or TZ4 */
> > +=09{ "sys_therm0", 0x02 },
> > +=09{ "sys_therm1", 0x03 },
> > +=09{ "sys_therm2", 0x04 },
> > +=09{ "sys_therm3", 0x05 },
> > +=09{ "sys_therm4", 0x06 },
> > +=09{ "sys_therm5", 0x07 },
> > +=09{ "sys_therm6", 0x08 },
> > +};
> > +
> > +struct dell_xps_ec {
> > +=09struct device *dev;
> > +=09struct i2c_client *client;
> > +=09struct iio_channel *therm_channels[ARRAY_SIZE(dell_xps_ec_therms)];
>=20
> This should come from data supplied via the probe .data and compat string=
.

Good idea, will rework.

>=20
> > +=09struct delayed_work temp_work;
> > +};
> > +
> > +static int dell_xps_ec_suspend_cmd(struct dell_xps_ec *ec, bool suspen=
d)
> > +{
> > +=09u8 buf[DELL_XPS_EC_SUSPEND_MSG_LEN] =3D {};
> > +=09int ret;
> > +
> > +=09buf[0] =3D DELL_XPS_EC_SUSPEND_CMD;
> > +=09buf[1] =3D suspend ? 0x01 : 0x00;
> > +=09/* bytes 2..63 remain zero */
> > +
> > +=09ret =3D i2c_master_send(ec->client, buf, sizeof(buf));
> > +=09if (ret < 0)
> > +=09=09return ret;
> > +
> > +=09return 0;
> > +}
> > +
> > +static int dell_xps_ec_send_temp(struct dell_xps_ec *ec, u8 cmd_byte,
> > +=09=09=09=09 int milli_celsius)
> > +{
> > +=09u8 buf[DELL_XPS_EC_TEMP_MSG_LEN];
> > +=09u16 deci_celsius;
> > +=09int ret;
> > +
> > +=09/* Convert milli-Celsius to deci-Celsius (Celsius * 10) */
>=20
> milli-Celsius is very strange hyphenation just use the lower-case kernel
> terminology for it millicelsius.
>=20
> https://www.kernel.org/doc/Documentation/devicetree/bindings/thermal/ther=
mal.txt

Will fix.

>=20
> > +=09deci_celsius =3D milli_celsius / 100;
> > +
> > +=09buf[0] =3D DELL_XPS_EC_TEMP_CMD0;
> > +=09buf[1] =3D DELL_XPS_EC_TEMP_CMD1;
> > +=09buf[2] =3D cmd_byte;
> > +=09buf[3] =3D DELL_XPS_EC_TEMP_CMD3;
> > +=09put_unaligned_le16(deci_celsius, &buf[4]);
> > +
> > +=09ret =3D i2c_master_send(ec->client, buf, sizeof(buf));
> > +=09if (ret < 0)
> > +=09=09return ret;
> > +
> > +=09return 0;
> > +}
> > +
> > +static void dell_xps_ec_temp_work_fn(struct work_struct *work)
> > +{
> > +=09struct dell_xps_ec *ec =3D container_of(work, struct dell_xps_ec,
> > +=09=09=09=09=09      temp_work.work);
> > +=09int val, ret, i;
> > +
> > +=09for (i =3D 0; i < ARRAY_SIZE(dell_xps_ec_therms); i++) {
> > +=09=09if (!ec->therm_channels[i])
> > +=09=09=09continue;
> > +
> > +=09=09ret =3D iio_read_channel_processed(ec->therm_channels[i], &val);
> > +=09=09if (ret < 0) {
> > +=09=09=09dev_err_ratelimited(ec->dev,
> > +=09=09=09=09=09    "Failed to read thermistor %s: %d\n",
> > +=09=09=09=09=09    dell_xps_ec_therms[i].name, ret);
> > +=09=09=09continue;
>=20
> Is it really legitimate to continue on in this case ? I'll leave it up
> to you to think about that for yourself, perhaps yes is the answer but
> if term_channels[i] is true and a read of a channel fails - surely
> that's indicative of a bail-out situation not read the next channel
> situation

I think, its still good to continue, since its probably better to have
some channels working than none. It is not failing silently, developer
will be able to see it.

>=20
> > +=09=09}
> > +
> > +=09=09ret =3D dell_xps_ec_send_temp(ec, dell_xps_ec_therms[i].cmd, val=
);
> > +=09=09if (ret < 0) {
> > +=09=09=09dev_err_ratelimited(ec->dev,
> > +=09=09=09=09=09    "Failed to send temp for %s: %d\n",
> > +=09=09=09=09=09    dell_xps_ec_therms[i].name, ret);
> > +=09=09}
> > +=09}
> > +
> > +=09schedule_delayed_work(&ec->temp_work, DELL_XPS_EC_TEMP_POLL_JIFFIES=
);
> > +}
> > +
> > +static irqreturn_t dell_xps_ec_irq_handler(int irq, void *data)
> > +{
> > +=09struct dell_xps_ec *ec =3D data;
> > +
> > +=09/*
> > +=09 * TODO: IRQ is fired on lid-close. Follow Windows example to read =
out
> > +=09 *       the thermistor thresholds and potentially fan speeds.
> > +=09 */
> > +=09dev_info_ratelimited(ec->dev, "IRQ triggered! (irq=3D%d)\n", irq);
> > +
> > +=09return IRQ_HANDLED;
> > +}
> > +
> > +static int dell_xps_ec_probe(struct i2c_client *client)
> > +{
> > +=09struct device *dev =3D &client->dev;
> > +=09struct dell_xps_ec *ec;
> > +=09int ret, i;
> > +
> > +=09ec =3D devm_kzalloc(dev, sizeof(*ec), GFP_KERNEL);
> > +=09if (!ec)
> > +=09=09return -ENOMEM;
> > +
> > +=09ec->dev =3D dev;
> > +=09ec->client =3D client;
> > +=09i2c_set_clientdata(client, ec);
> > +
> > +=09/* Set default thermistor profile */
> > +=09ret =3D i2c_master_send(client, dell_xps_ec_thermistor_profile,
> > +=09=09=09      sizeof(dell_xps_ec_thermistor_profile));
> > +=09if (ret < 0)
> > +=09=09return dev_err_probe(dev, ret, "Failed to set thermistor profile=
\n");
> > +
> > +=09/* Get IIO channels for thermistors */
> > +=09for (i =3D 0; i < ARRAY_SIZE(dell_xps_ec_therms); i++) {
>=20
> This should be num_channels passed from your compat .data

Will fix.

>=20
> > +=09=09ec->therm_channels[i] =3D
> > +=09=09=09devm_iio_channel_get(dev, dell_xps_ec_therms[i].name);
> > +=09=09if (IS_ERR(ec->therm_channels[i])) {
> > +=09=09=09ret =3D PTR_ERR(ec->therm_channels[i]);
> > +=09=09=09ec->therm_channels[i] =3D NULL;
> > +=09=09=09if (ret =3D=3D -EPROBE_DEFER)
> > +=09=09=09=09return ret;
> > +=09=09=09dev_warn(dev, "Thermistor %s not available: %d\n",
> > +=09=09=09=09 dell_xps_ec_therms[i].name, ret);
> > +=09=09}
> > +=09}
> > +
> > +=09/* Start periodic temperature reporting */
> > +=09ret =3D devm_delayed_work_autocancel(dev, &ec->temp_work,
> > +=09=09=09=09=09   dell_xps_ec_temp_work_fn);
> > +=09if (ret)
> > +=09=09return ret;
> \n
>=20
> > +=09schedule_delayed_work(&ec->temp_work, DELL_XPS_EC_TEMP_POLL_JIFFIES=
);
> > +=09dev_dbg(dev, "Started periodic temperature reporting to EC every %d=
 ms\n",
> > +=09=09jiffies_to_msecs(DELL_XPS_EC_TEMP_POLL_JIFFIES));
> > +
> > +=09/* Request IRQ for EC events */
> > +=09ret =3D devm_request_threaded_irq(dev, client->irq, NULL,
> > +=09=09=09=09=09dell_xps_ec_irq_handler,
> > +=09=09=09=09=09IRQF_ONESHOT, dev_name(dev), ec);
> > +=09if (ret < 0)
> > +=09=09return dev_err_probe(dev, ret, "Failed to request IRQ\n");
> > +
> > +=09return 0;
>=20
> You aren't returning the ret.

Good catch, switched to `if (ret)` with `return 0;` in the end instead
to match existing implementations.

>=20
> > +}
> > +
> > +/*
> > + * Notify EC of suspend
> > + *
> > + * This will:
> > + * - Cut power to display/trackpad/keyboard/touchrow, wake-up source s=
till works
> > + */
> > +static int dell_xps_ec_suspend(struct device *dev)
> > +{
> > +=09struct dell_xps_ec *ec =3D dev_get_drvdata(dev);
> > +
> > +=09cancel_delayed_work_sync(&ec->temp_work);
> > +
> > +=09return dell_xps_ec_suspend_cmd(ec, true);
> > +}
> > +
> > +/*
> > + * Notify EC of resume
> > + *
> > + * This will undo the suspend actions
> > + * Without the resume signal, device would wake up but be forced back =
into
> > + * suspend by EC within seconds
> > + */
> > +static int dell_xps_ec_resume(struct device *dev)
> > +{
> > +=09struct dell_xps_ec *ec =3D dev_get_drvdata(dev);
> > +=09int ret;
> > +
> > +=09ret =3D dell_xps_ec_suspend_cmd(ec, false);
> > +=09if (ret)
> > +=09=09return ret;
> > +
> > +=09schedule_delayed_work(&ec->temp_work, DELL_XPS_EC_TEMP_POLL_JIFFIES=
);
> \n> +=09return 0;
> > +}
> > +
> > +static const struct of_device_id dell_xps_ec_of_match[] =3D {
> > +=09{ .compatible =3D "dell,xps13-9345-ec" },
> > +=09{}
> > +};
> > +MODULE_DEVICE_TABLE(of, dell_xps_ec_of_match);
> > +
> > +static const struct i2c_device_id dell_xps_ec_i2c_id[] =3D {
> > +=09{ "dell-xps-ec" },
>=20
> A nice .data will allow extension of this to other systems with
> more/less channels.
>=20
> Which is why you shouldn't use the ARRAY_SIZE() extents from statics
> declared up top directly.

Indeed, will fix.

Thanks,
Alex

>=20
> > +=09{}
> > +};
> > +MODULE_DEVICE_TABLE(i2c, dell_xps_ec_i2c_id);
> > +
> > +static const struct dev_pm_ops dell_xps_ec_pm_ops =3D {
> > +=09SYSTEM_SLEEP_PM_OPS(dell_xps_ec_suspend, dell_xps_ec_resume)
> > +};
> > +
> > +static struct i2c_driver dell_xps_ec_driver =3D {
> > +=09.driver =3D {
> > +=09=09.name =3D "dell-xps-ec",
> > +=09=09.of_match_table =3D dell_xps_ec_of_match,
> > +=09=09.pm =3D &dell_xps_ec_pm_ops,
> > +=09},
> > +=09.probe =3D dell_xps_ec_probe,
> > +=09.id_table =3D dell_xps_ec_i2c_id,
> > +};
> > +module_i2c_driver(dell_xps_ec_driver);
> > +
> > +MODULE_AUTHOR("Aleksandrs Vinarskis <alex@vinarskis.com>");
> > +MODULE_DESCRIPTION("Dell XPS 13 9345 Embedded Controller");
> > +MODULE_LICENSE("GPL");
> > +MODULE_IMPORT_NS("IIO_CONSUMER");
> >
>=20
> 

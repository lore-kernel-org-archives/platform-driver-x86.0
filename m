From: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH] platform/x86: dell-uart-backlight: new backlight driver
 for DELL AIO
Date: Fri, 27 Oct 2017 11:24:27 +0100
Message-ID: <1c55d305-51de-d5f2-1b86-7e3bc1c17d4a@linaro.org>
References: <1509004429-1596-1-git-send-email-acelan.kao@canonical.com>
 <08add166d5b34992ba167a878ca2a808@ausx13mpc124.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <08add166d5b34992ba167a878ca2a808@ausx13mpc124.AMER.DELL.COM>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mario.Limonciello@dell.com, acelan.kao@canonical.com, dvhart@infradead.org, andy@infradead.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On 26/10/17 16:54, Mario.Limonciello@dell.com wrote:
>> +static int dell_uart_bl_add(struct acpi_device *dev)
>> +{
>> +	struct dell_uart_backlight *dell_pdata;
>> +	struct backlight_properties props;
>> +	struct backlight_device *dell_uart_bd;
>> +
>> +	dell_pdata = kzalloc(sizeof(struct dell_uart_backlight), GFP_KERNEL);
>> +	dell_pdata->dev = &dev->dev;
>> +	dell_uart_startup(dell_pdata);
>> +	dev->driver_data = dell_pdata;
>> +
>> +	mutex_init(&dell_pdata->brightness_mutex);
>> +
>> +	memset(&props, 0, sizeof(struct backlight_properties));
>> +	props.type = BACKLIGHT_PLATFORM;
>> +	props.max_brightness = 100;
> 
> Is the memset of zero actually necessary?  Of the items in
> backlight_properties:
> * you set brightness a few lines later
> (after it's been memcpy'ed in the backlight device)
> * You set max brightness explicitly
> * You set power a few lines below
> 
> So the only attribute missing is fb_blank.  That's marked "to be removed".

fb_blank may be scheduled for removal but it is still honored by the 
backlight core so it should definitely not be left undefined.

I reviewed this recently and concluded that all drivers default it to 
unblanked (mostly by a memset like the one above). Without this then I 
think there is a risk that some code paths through DRM drivers won't 
turn the backlight on.


Daniel.


>> +
>> +	dell_uart_bd = backlight_device_register("dell_uart_backlight",
>> +						 &dev->dev,
>> +						 dell_pdata,
>> +						 &dell_uart_backlight_ops,
>> +						 &props);
>> +	dell_pdata->dell_uart_bd = dell_uart_bd;
>> +
>> +	dell_uart_show_firmware_ver(dell_pdata);
>> +	dell_uart_set_bl_power(dell_uart_bd, FB_BLANK_UNBLANK);
>> +	dell_uart_bd->props.brightness = 100;
>> +	backlight_update_status(dell_uart_bd);
>> +
>> +	/* unregister acpi backlight interface */
>> +	acpi_video_set_dmi_backlight_type(acpi_backlight_vendor);
> 
> Since you change this when the driver is loaded, you should cache the old
> value and restore it when the driver is unloaded too.
> 
>> +
>> +	return 0;
>> +}
>> +
>> +static int dell_uart_bl_remove(struct acpi_device *dev)
>> +{
>> +	struct dell_uart_backlight *dell_pdata = dev->driver_data;
>> +
>> +	backlight_device_unregister(dell_pdata->dell_uart_bd);
>> +
>> +	return 0;
>> +}
>> +
>> +static int dell_uart_bl_suspend(struct device *dev)
>> +{
>> +	filp_close(ftty, NULL);
>> +	return 0;
>> +}
>> +
>> +static int dell_uart_bl_resume(struct device *dev)
>> +{
>> +	ftty = filp_open("/dev/ttyS0", O_RDWR | O_NOCTTY | O_NDELAY, 0);
>> +	return 0;
>> +}
>> +
>> +static SIMPLE_DEV_PM_OPS(dell_uart_bl_pm, dell_uart_bl_suspend,
>> dell_uart_bl_resume);
>> +
>> +static const struct acpi_device_id dell_uart_bl_ids[] = {
>> +	{"DELL0501", 0},
>> +	{"", 0},
>> +};
>> +
>> +static struct acpi_driver dell_uart_backlight_driver = {
>> +	.name = "Dell AIO serial backlight",
>> +	.ids = dell_uart_bl_ids,
>> +	.ops = {
>> +		.add = dell_uart_bl_add,
>> +		.remove = dell_uart_bl_remove,
>> +	},
>> +	.drv.pm = &dell_uart_bl_pm,
>> +};
>> +
>> +static int __init dell_uart_bl_init(void)
>> +{
>> +	ftty = filp_open("/dev/ttyS0", O_RDWR | O_NOCTTY | O_NDELAY, 0);
> 
> I guess this is to prevent other userspace apps from accessing the port
> simultaneously right?  I think you'll need to check if the open failed
> IS_ERR(ftty)
> or similar to make sure that this driver would fail to load if the file
> didn't exist or was opened by userspace with an exclusive lock or something.
> 
>> +
>> +	return acpi_bus_register_driver(&dell_uart_backlight_driver);
>> +}
>> +
>> +static void __exit dell_uart_bl_exit(void)
>> +{
>> +	filp_close(ftty, NULL);
>> +
>> +	acpi_bus_unregister_driver(&dell_uart_backlight_driver);
>> +}
>> +
>> +module_init(dell_uart_bl_init);
>> +module_exit(dell_uart_bl_exit);
>> +MODULE_DEVICE_TABLE(acpi, dell_uart_bl_ids);
>> +MODULE_DESCRIPTION("Dell AIO Serial Backlight module");
>> +MODULE_AUTHOR("AceLan Kao <acelan.kao@canonical.com>");
>> +MODULE_LICENSE("GPL");
>> diff --git a/drivers/platform/x86/dell-uart-backlight.h b/drivers/platform/x86/dell-
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
>> + *  This program is free software; you can redistribute it and/or modify
>> + *  it under the terms of the GNU General Public License as published by
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
>> +	DELL_UART_GET_FIRMWARE_VER,
>> +	DELL_UART_GET_BRIGHTNESS,
>> +	DELL_UART_SET_BRIGHTNESS,
>> +	DELL_UART_SET_BACKLIGHT_POWER,
>> +};
>> +
>> +struct dell_uart_bl_cmd {
>> +	unsigned char	cmd[10];
>> +	unsigned char	ret[80];
>> +	unsigned short	tx_len;
>> +	unsigned short	rx_len;
>> +};
>> +
>> +static struct dell_uart_bl_cmd uart_cmd[] = {
>> +	/*
>> +	 * Get Firmware Version: Tool uses this command to get firmware version.
>> +	 * Command: 0x6A 0x06 0x8F (Length:3 Type: 0x0A, Cmd:6 Checksum:0x8F)
>> +	 * Return data: 0x0D 0x06 Data checksum (Length:13,Cmd:0x06,
>> +	 * 	        Data :F/W version(APRILIA=APR27-VXXX,PHINE=PHI23-VXXX),
>> +	 * 	        checksum:SUM(Length and Cmd and Data)xor 0xFF .
>> +	 */
>> +	[DELL_UART_GET_FIRMWARE_VER] = {
>> +		.cmd	= {0x6A, 0x06, 0x8F},
>> +		.tx_len	= 3,
>> +	},
>> +	/*
>> +	 * Get Brightness level: Application uses this command for scaler to get
>> brightness.
>> +	 * Command: 0x6A 0x0C 0x89 (Length:3 Type: 0x0A, Cmd:0x0C,
>> Checksum:0x89)
>> +	 * Return data: 0x04 0x0C Data checksum
>> +	 * (Length:4 Cmd: 0x0C Data: brightness level checksum: SUM(Length and
>> Cmd and Data)xor 0xFF)
>> +	 *           brightness level which ranges from 0~100.
>> +	 */
>> +	[DELL_UART_GET_BRIGHTNESS] = {
>> +		.cmd	= {0x6A, 0x0C, 0x89},
>> +		.ret	= {0x04, 0x0C, 0x00, 0x00},
>> +		.tx_len	= 3,
>> +		.rx_len	= 4,
>> +	},
>> +	/* Set Brightness level: Application uses this command for scaler to set
>> brightness.
>> +	 * Command: 0x8A 0x0B Byte2 Checksum (Length:4 Type: 0x0A, Cmd:0x0B)
>> +	 * 	    where Byte2 is the brightness level which ranges from 0~100.
>> +	 * Return data: 0x03 0x0B 0xF1(Length:3,Cmd:B,checksum:0xF1)
>> +	 * Scaler must send the 3bytes ack within 1 second when success, other
>> value if error
>> +	 */
>> +	[DELL_UART_SET_BRIGHTNESS] = {
>> +		.cmd	= {0x8A, 0x0B, 0x0, 0x0},
>> +		.ret	= {0x03, 0x0B, 0xF1},
>> +		.tx_len	= 4,
>> +		.rx_len	= 3,
>> +	},
>> +	/*
>> +	 * Screen ON/OFF Control: Application uses this command to control screen
>> ON or OFF.
>> +	 * Command: 0x8A 0x0E Byte2 Checksum (Length:4 Type: 0x0A, Cmd:0x0E)
>> where
>> +	 * 	    Byte2=0 to turn OFF the screen.
>> +	 * 	    Byte2=1 to turn ON the screen
>> +	 * 	    Other value of Byte2 is reserved and invalid.
>> +	 * Return data: 0x03 0x0E 0xEE(Length:3,Cmd:E,checksum:0xEE)
>> +	 */
>> +	[DELL_UART_SET_BACKLIGHT_POWER] = {
>> +		.cmd	= {0x8A, 0x0E, 0x00, 0x0},
>> +		.ret	= {0x03, 0x0E, 0xEE},
>> +		.tx_len	= 4,
>> +		.rx_len	= 3,
>> +	},
>> +};
>> +
>> +#endif /* _DELL_UART_BACKLIGHT_H_ */
>> --
>> 2.7.4
> 

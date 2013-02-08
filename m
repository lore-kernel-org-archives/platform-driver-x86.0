From: Benoit Gschwind <gschwind@gnu-log.net>
Subject: Macbook Pro retina 15", switcheroo and gmux
Date: Fri, 08 Feb 2013 19:40:48 +0100
Message-ID: <511546B0.70301@gnu-log.net>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------070301060301010408010509"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:57876 "EHLO
	relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1946779Ab3BHSky (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 8 Feb 2013 13:40:54 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: airlied@redhat.com, platform-driver-x86@vger.kernel.org, Seth Forshee <seth.forshee@canonical.com>, andreas@meetr.de

This is a multi-part message in MIME format.
--------------070301060301010408010509
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I don't know if some one already noticed this but is it possible to 
start intel and nvidia card properly with kernel 3.8-rc6.

the way to do so is :

- Disable EFI frame buffer in kernel option,
- switch to intel ouput with gmux, I made the attached durty code based 
on kernel code to do so. It should be the default but if not, you have 
to switch. USE at your own risk
- load nouveau module.
- switch to intel ouput with gmux.
- load i915 module

it make both card loaded properly but there still issue with 
console/frame buffer switch since console are bind to only one video 
output by default, I managed to remap them with fbcon=map:01 that cause 
half console are on intel and other half are on nvidia output.

but this allow to boot with intel video card or nvidia video card (via 
boot script) without the help of MacOS X.

I tested several thinks based on this the following working:

- switch to nvidia output (apple-gmux 1)
- load nouveau
- switch to intel output (apple-gmux 0)
- load i915
- echo OFF > /sys/kernel/debug/vgaswitcheroo/switch

this allow to turn of nvidia (i guess) and run intel a main video output.

I currently use the following:

- switch to intel output
- load i915
- switch to nvidia output
- load nvidia (proprietary driver)
- startx

X start properly with nvidia proprietary driver, with side effect to not 
disable gmux. vt are show by intel output, and X are show with nvidia 
output, consequently vt switch is not trivial but posible (I use actkbd 
to do so)

All this test was done by ssh because most of time I do not have video 
output working.

I don't know who care about that, or who already know that, but if this 
can help, please send this information to people that need them.

Best regards.


--------------070301060301010408010509
Content-Type: text/x-csrc;
 name="apple-gmux.c"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="apple-gmux.c"

/*
 *  Gmux driver for Apple laptops
 *
 *  Copyright (C) Canonical Ltd. <seth.forshee@canonical.com>
 *  Copyright (C) 2010-2012 Andreas Heider <andreas@meetr.de>
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License version 2 as
 *  published by the Free Software Foundation.
 */

#include <stdint.h>
#include <unistd.h>
#include <sys/io.h>
#include <stdio.h>
#include <stdlib.h>

#define bool int
#define u8 uint8_t
#define u16 uint16_t
#define u32 uint32_t
#define false 0
#define true 1
#define udelay usleep
#define pr_debug printf
#define pr_info printf
#define ENODEV 4;
#define ENOMEM 3;
#define EBUSY 2;
#define ENXIO 1;

struct apple_gmux_data {
	unsigned long iostart;
	unsigned long iolen;
	bool indexed;
};

static struct apple_gmux_data *apple_gmux_data;

#define VGA_SWITCHEROO_IGD 0
#define VGA_SWITCHEROO_DIS 1


#define VGA_SWITCHEROO_ON 1

/*
 * gmux port offsets. Many of these are not yet used, but may be in the
 * future, and it's useful to have them documented here anyhow.
 */
#define GMUX_PORT_VERSION_MAJOR		0x04
#define GMUX_PORT_VERSION_MINOR		0x05
#define GMUX_PORT_VERSION_RELEASE	0x06
#define GMUX_PORT_SWITCH_DISPLAY	0x10
#define GMUX_PORT_SWITCH_GET_DISPLAY	0x11
#define GMUX_PORT_INTERRUPT_ENABLE	0x14
#define GMUX_PORT_INTERRUPT_STATUS	0x16
#define GMUX_PORT_SWITCH_DDC		0x28
#define GMUX_PORT_SWITCH_EXTERNAL	0x40
#define GMUX_PORT_SWITCH_GET_EXTERNAL	0x41
#define GMUX_PORT_DISCRETE_POWER	0x50
#define GMUX_PORT_MAX_BRIGHTNESS	0x70
#define GMUX_PORT_BRIGHTNESS		0x74
#define GMUX_PORT_VALUE			0xc2
#define GMUX_PORT_READ			0xd0
#define GMUX_PORT_WRITE			0xd4

#define GMUX_MIN_IO_LEN			(GMUX_PORT_BRIGHTNESS + 4)

#define GMUX_INTERRUPT_ENABLE		0xff
#define GMUX_INTERRUPT_DISABLE		0x00

#define GMUX_INTERRUPT_STATUS_ACTIVE	0
#define GMUX_INTERRUPT_STATUS_DISPLAY	(1 << 0)
#define GMUX_INTERRUPT_STATUS_POWER	(1 << 2)
#define GMUX_INTERRUPT_STATUS_HOTPLUG	(1 << 3)

#define GMUX_BRIGHTNESS_MASK		0x00ffffff
#define GMUX_MAX_BRIGHTNESS		GMUX_BRIGHTNESS_MASK



static u8 gmux_pio_read8(struct apple_gmux_data *gmux_data, int port)
{
	return inb(gmux_data->iostart + port);
}

static void gmux_pio_write8(struct apple_gmux_data *gmux_data, int port,
			       u8 val)
{
	outb(val, gmux_data->iostart + port);
}

static u32 gmux_pio_read32(struct apple_gmux_data *gmux_data, int port)
{
	return inl(gmux_data->iostart + port);
}

static void gmux_pio_write32(struct apple_gmux_data *gmux_data, int port,
			     u32 val)
{
	int i;
	u8 tmpval;

	for (i = 0; i < 4; i++) {
		tmpval = (val >> (i * 8)) & 0xff;
		outb(tmpval, gmux_data->iostart + port + i);
	}
}

static int gmux_index_wait_ready(struct apple_gmux_data *gmux_data)
{
	int i = 200;
	u8 gwr = inb(gmux_data->iostart + GMUX_PORT_WRITE);

	while (i && (gwr & 0x01)) {
		inb(gmux_data->iostart + GMUX_PORT_READ);
		gwr = inb(gmux_data->iostart + GMUX_PORT_WRITE);
		udelay(100);
		i--;
	}

	return !!i;
}

static int gmux_index_wait_complete(struct apple_gmux_data *gmux_data)
{
	int i = 200;
	u8 gwr = inb(gmux_data->iostart + GMUX_PORT_WRITE);

	while (i && !(gwr & 0x01)) {
		gwr = inb(gmux_data->iostart + GMUX_PORT_WRITE);
		udelay(100);
		i--;
	}

	if (gwr & 0x01)
		inb(gmux_data->iostart + GMUX_PORT_READ);

	return !!i;
}

static u8 gmux_index_read8(struct apple_gmux_data *gmux_data, int port)
{
	u8 val;

	//mutex_lock(&gmux_data->index_lock);
	gmux_index_wait_ready(gmux_data);
	outb((port & 0xff), gmux_data->iostart + GMUX_PORT_READ);
	gmux_index_wait_complete(gmux_data);
	val = inb(gmux_data->iostart + GMUX_PORT_VALUE);
	//mutex_unlock(&gmux_data->index_lock);

	return val;
}

static void gmux_index_write8(struct apple_gmux_data *gmux_data, int port,
			      u8 val)
{
	//mutex_lock(&gmux_data->index_lock);
	outb(val, gmux_data->iostart + GMUX_PORT_VALUE);
	gmux_index_wait_ready(gmux_data);
	outb(port & 0xff, gmux_data->iostart + GMUX_PORT_WRITE);
	gmux_index_wait_complete(gmux_data);
	//mutex_unlock(&gmux_data->index_lock);
}

static u32 gmux_index_read32(struct apple_gmux_data *gmux_data, int port)
{
	u32 val;

	//mutex_lock(&gmux_data->index_lock);
	gmux_index_wait_ready(gmux_data);
	outb((port & 0xff), gmux_data->iostart + GMUX_PORT_READ);
	gmux_index_wait_complete(gmux_data);
	val = inl(gmux_data->iostart + GMUX_PORT_VALUE);
	//mutex_unlock(&gmux_data->index_lock);

	return val;
}

static void gmux_index_write32(struct apple_gmux_data *gmux_data, int port,
			       u32 val)
{
	int i;
	u8 tmpval;

	//mutex_lock(&gmux_data->index_lock);

	for (i = 0; i < 4; i++) {
		tmpval = (val >> (i * 8)) & 0xff;
		outb(tmpval, gmux_data->iostart + GMUX_PORT_VALUE + i);
	}

	gmux_index_wait_ready(gmux_data);
	outb(port & 0xff, gmux_data->iostart + GMUX_PORT_WRITE);
	gmux_index_wait_complete(gmux_data);
	//mutex_unlock(&gmux_data->index_lock);
}

static u8 gmux_read8(struct apple_gmux_data *gmux_data, int port)
{
	if (gmux_data->indexed)
		return gmux_index_read8(gmux_data, port);
	else
		return gmux_pio_read8(gmux_data, port);
}

static void gmux_write8(struct apple_gmux_data *gmux_data, int port, u8 val)
{
	if (gmux_data->indexed)
		gmux_index_write8(gmux_data, port, val);
	else
		gmux_pio_write8(gmux_data, port, val);
}

static u32 gmux_read32(struct apple_gmux_data *gmux_data, int port)
{
	if (gmux_data->indexed)
		return gmux_index_read32(gmux_data, port);
	else
		return gmux_pio_read32(gmux_data, port);
}

static void gmux_write32(struct apple_gmux_data *gmux_data, int port,
			     u32 val)
{
	if (gmux_data->indexed)
		gmux_index_write32(gmux_data, port, val);
	else
		gmux_pio_write32(gmux_data, port, val);
}

static bool gmux_is_indexed(struct apple_gmux_data *gmux_data)
{
	u16 val;

	outb(0xaa, gmux_data->iostart + 0xcc);
	outb(0x55, gmux_data->iostart + 0xcd);
	outb(0x00, gmux_data->iostart + 0xce);

	val = inb(gmux_data->iostart + 0xcc) |
		(inb(gmux_data->iostart + 0xcd) << 8);

	if (val == 0x55aa)
		return true;

	return false;
}



static int gmux_switchto(int id)
{
	if (id == VGA_SWITCHEROO_IGD) {
		gmux_write8(apple_gmux_data, GMUX_PORT_SWITCH_DDC, 1);
		gmux_write8(apple_gmux_data, GMUX_PORT_SWITCH_DISPLAY, 2);
		gmux_write8(apple_gmux_data, GMUX_PORT_SWITCH_EXTERNAL, 2);
	} else {
		gmux_write8(apple_gmux_data, GMUX_PORT_SWITCH_DDC, 2);
		gmux_write8(apple_gmux_data, GMUX_PORT_SWITCH_DISPLAY, 3);
		gmux_write8(apple_gmux_data, GMUX_PORT_SWITCH_EXTERNAL, 3);
	}

	return 0;
}

static int gmux_set_discrete_state(struct apple_gmux_data *gmux_data,
				   int state)
{
	//INIT_COMPLETION(gmux_data->powerchange_done);

	if (state == VGA_SWITCHEROO_ON) {
		gmux_write8(gmux_data, GMUX_PORT_DISCRETE_POWER, 1);
		gmux_write8(gmux_data, GMUX_PORT_DISCRETE_POWER, 3);
		pr_debug("Discrete card powered up\n");
	} else {
		gmux_write8(gmux_data, GMUX_PORT_DISCRETE_POWER, 1);
		gmux_write8(gmux_data, GMUX_PORT_DISCRETE_POWER, 0);
		pr_debug("Discrete card powered down\n");
	}

	//gmux_data->power_state = state;

	//if (gmux_data->gpe >= 0 &&
	//    !wait_for_completion_interruptible_timeout(&gmux_data->powerchange_done,
	//					       msecs_to_jiffies(200)))
	//	pr_warn("Timeout waiting for gmux switch to complete\n");

	return 0;
}

static int gmux_set_power_state(int id, int state)
{
	if (id == VGA_SWITCHEROO_IGD)
		return 0;
	return gmux_set_discrete_state(apple_gmux_data, state);
}

static int gmux_active_client(struct apple_gmux_data *gmux_data)
{
	if (gmux_read8(gmux_data, GMUX_PORT_SWITCH_DISPLAY) == 2)
		return VGA_SWITCHEROO_IGD;
	return VGA_SWITCHEROO_DIS;
}


static inline void gmux_disable_interrupts(struct apple_gmux_data *gmux_data)
{
	gmux_write8(gmux_data, GMUX_PORT_INTERRUPT_ENABLE,
		    GMUX_INTERRUPT_DISABLE);
}

static inline void gmux_enable_interrupts(struct apple_gmux_data *gmux_data)
{
	gmux_write8(gmux_data, GMUX_PORT_INTERRUPT_ENABLE,
		    GMUX_INTERRUPT_ENABLE);
}

static inline u8 gmux_interrupt_get_status(struct apple_gmux_data *gmux_data)
{
	return gmux_read8(gmux_data, GMUX_PORT_INTERRUPT_STATUS);
}

static void gmux_clear_interrupts(struct apple_gmux_data *gmux_data)
{
	u8 status;
	/* to clear interrupts write back current status */
	status = gmux_interrupt_get_status(gmux_data);
	gmux_write8(gmux_data, GMUX_PORT_INTERRUPT_STATUS, status);
}

//static void gmux_notify_handler(acpi_handle device, u32 value, void *context)
//{
//	u8 status;
//	struct pnp_dev *pnp = (struct pnp_dev *)context;
//	struct apple_gmux_data *gmux_data = pnp_get_drvdata(pnp);
//
//	status = gmux_interrupt_get_status(gmux_data);
//	gmux_disable_interrupts(gmux_data);
//	pr_debug("Notify handler called: status %d\n", status);
//
//	gmux_clear_interrupts(gmux_data);
//	gmux_enable_interrupts(gmux_data);
//
//	if (status & GMUX_INTERRUPT_STATUS_POWER)
//		complete(&gmux_data->powerchange_done);
//}

//static int gmux_suspend(struct pnp_dev *pnp, pm_message_t state)
//{
//	struct apple_gmux_data *gmux_data = pnp_get_drvdata(pnp);
//	gmux_data->resume_client_id = gmux_active_client(gmux_data);
//	gmux_disable_interrupts(gmux_data);
//	return 0;
//}
//
//static int gmux_resume(struct pnp_dev *pnp)
//{
//	struct apple_gmux_data *gmux_data = pnp_get_drvdata(pnp);
//	gmux_enable_interrupts(gmux_data);
//	gmux_switchto(gmux_data->resume_client_id);
//	if (gmux_data->power_state == VGA_SWITCHEROO_OFF)
//		gmux_set_discrete_state(gmux_data, gmux_data->power_state);
//	return 0;
//}

int gmux_probe() {

	struct apple_gmux_data * gmux_data;
	u8 ver_major, ver_minor, ver_release;
	int ret = -ENXIO;
	unsigned long long gpe;

	if (apple_gmux_data)
		return -EBUSY;


	gmux_data = (struct apple_gmux_data *)malloc(sizeof(*gmux_data));
	apple_gmux_data = gmux_data;
	if (!gmux_data)
		return -ENOMEM;

	gmux_data->iostart = 0x700;
	gmux_data->iolen = 0xfd;

	ioperm(gmux_data->iostart, gmux_data->iolen, 1);

	/*
	 * Invalid version information may indicate either that the gmux
	 * device isn't present or that it's a new one that uses indexed
	 * io
	 */

	ver_major = gmux_read8(gmux_data, GMUX_PORT_VERSION_MAJOR);
	ver_minor = gmux_read8(gmux_data, GMUX_PORT_VERSION_MINOR);
	ver_release = gmux_read8(gmux_data, GMUX_PORT_VERSION_RELEASE);
	if (ver_major == 0xff && ver_minor == 0xff && ver_release == 0xff) {
		if (gmux_is_indexed(gmux_data)) {
			u32 version;
			//mutex_init(&gmux_data->index_lock);
			gmux_data->indexed = true;
			version = gmux_read32(gmux_data,
				GMUX_PORT_VERSION_MAJOR);
			ver_major = (version >> 24) & 0xff;
			ver_minor = (version >> 16) & 0xff;
			ver_release = (version >> 8) & 0xff;
		} else {
			pr_info("gmux device not present\n");
			ret = -ENODEV;
			goto err_release;
		}
	}
	pr_info("Found gmux version %d.%d.%d [%s]\n", ver_major, ver_minor,
		ver_release, (gmux_data->indexed ? "indexed" : "classic"));

	//memset(&props, 0, sizeof(props));
	//props.type = BACKLIGHT_PLATFORM;
	//props.max_brightness = gmux_read32(gmux_data, GMUX_PORT_MAX_BRIGHTNESS);

	/*
	 * Currently it's assumed that the maximum brightness is less than
	 * 2^24 for compatibility with old gmux versions. Cap the max
	 * brightness at this value, but print a warning if the hardware
	 * reports something higher so that it can be fixed.
	 */
	//if (WARN_ON(props.max_brightness > GMUX_MAX_BRIGHTNESS))
	//	props.max_brightness = GMUX_MAX_BRIGHTNESS;

	//bdev = backlight_device_register("gmux_backlight", &pnp->dev,
	//				 gmux_data, &gmux_bl_ops, &props);
	//if (IS_ERR(bdev)) {
	//	ret = PTR_ERR(bdev);
	//	goto err_release;
	//}

	//gmux_data->bdev = bdev;
	//bdev->props.brightness = gmux_get_brightness(bdev);
	//backlight_update_status(bdev);

	/*
	 * The backlight situation on Macs is complicated. If the gmux is
	 * present it's the best choice, because it always works for
	 * backlight control and supports more levels than other options.
	 * Disable the other backlight choices.
	 */
	//acpi_video_dmi_promote_vendor();
	//acpi_video_unregister();
	//apple_bl_unregister();

	//gmux_data->power_state = VGA_SWITCHEROO_ON;

	//gmux_data->dhandle = DEVICE_ACPI_HANDLE(&pnp->dev);
	//if (!gmux_data->dhandle) {
	//	pr_err("Cannot find acpi handle for pnp device %s\n",
	//	       dev_name(&pnp->dev));
	//	ret = -ENODEV;
	//	goto err_notify;
	//}

	//status = acpi_evaluate_integer(gmux_data->dhandle, "GMGP", NULL, &gpe);
	//if (ACPI_SUCCESS(status)) {
//		gmux_data->gpe = (int)gpe;
//
//		status = acpi_install_notify_handler(gmux_data->dhandle,
//						     ACPI_DEVICE_NOTIFY,
//						     &gmux_notify_handler, pnp);
//		if (ACPI_FAILURE(status)) {
//			pr_err("Install notify handler failed: %s\n",
//			       acpi_format_exception(status));
//			ret = -ENODEV;
//			goto err_notify;
//		}
//
//		status = acpi_enable_gpe(NULL, gmux_data->gpe);
//		if (ACPI_FAILURE(status)) {
//			pr_err("Cannot enable gpe: %s\n",
//			       acpi_format_exception(status));
//			goto err_enable_gpe;
//		}
//	} else {
//		pr_warn("No GPE found for gmux\n");
//		gmux_data->gpe = -1;
//	}

//	if (vga_switcheroo_register_handler(&gmux_handler)) {
//		ret = -ENODEV;
//		goto err_register_handler;
//	}

//	init_completion(&gmux_data->powerchange_done);
//	apple_gmux_data = gmux_data;
//	gmux_enable_interrupts(gmux_data);

	return 0;

//err_register_handler:
	//if (gmux_data->gpe >= 0)
	//	acpi_disable_gpe(NULL, gmux_data->gpe);
//err_enable_gpe:
	//if (gmux_data->gpe >= 0)
	//	acpi_remove_notify_handler(gmux_data->dhandle,
	//				   ACPI_DEVICE_NOTIFY,
	//				   &gmux_notify_handler);
//err_notify:
	//backlight_device_unregister(bdev);
err_release:
	//release_region(gmux_data->iostart, gmux_data->iolen);
//err_free:
	free(gmux_data);
	return ret;
}

//static void gmux_remove(struct pnp_dev *pnp)
//{
//	struct apple_gmux_data *gmux_data = pnp_get_drvdata(pnp);
//
//	vga_switcheroo_unregister_handler();
//	gmux_disable_interrupts(gmux_data);
//	if (gmux_data->gpe >= 0) {
//		acpi_disable_gpe(NULL, gmux_data->gpe);
//		acpi_remove_notify_handler(gmux_data->dhandle,
//					   ACPI_DEVICE_NOTIFY,
//					   &gmux_notify_handler);
//	}
//
//	backlight_device_unregister(gmux_data->bdev);
//
//	release_region(gmux_data->iostart, gmux_data->iolen);
//	apple_gmux_data = NULL;
//	kfree(gmux_data);
//
//	acpi_video_dmi_demote_vendor();
//	acpi_video_register();
//	apple_bl_register();
//}

int main(int argc, char ** argv) {

	int x = atoi(argv[1]);
	gmux_probe();
	gmux_switchto(x);

}

--------------070301060301010408010509--

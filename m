Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E7317A314;
	Tue, 15 Sep 2026 12:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476380; cv=none; b=S1NfoWBHaW1wnSrbIaolVSOiQixMylncnt2kYr8DlZmB1hIf8ZOQJIWb3pfQacmr434w3ytJtTET6Czu3EQ0iqRv+D2LqWsZUL005VbYxBhqWMkF7YXziB+olRFxX+ROE40UjEEnFn6ANPbpxDjvC+ol5YCDkHJB3Q0eIQze6J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476380; c=relaxed/simple;
	bh=Ly4sfqIkpha/Rxy8cpcf5FNQSLKPWny/MhKu5/RmrIk=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=halS+mBMZmptP6Ym1nM/TQDFrQ1oHg6LCq5EwkUFOt1KjsvyMBVzlDMTb85JcppP8QVLN+xB2fsurX/sx8gVfnMe5wy50bza5H2kHd7oLgOyt0JFZcj+9JM+ziaUG8SAqvuYBHCJl/AMQdsOQjEGDgvn+cSN3X12w/BF2qDyIXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CFcBSVb9; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CFcBSVb9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789476378; x=1821012378;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Ly4sfqIkpha/Rxy8cpcf5FNQSLKPWny/MhKu5/RmrIk=;
  b=CFcBSVb9H/BMe90esa+Yh16qyrIV3uCY/k+DJb94tEUyIeBtMoone1b9
   HMUcy7YS5MthvWmcS8VfzLoY8puvfWo82GlWdByqOClESY5acLrWS1LmQ
   vqjAIjS46OAy+w0Y/fx5Kfoe96bjGbkvTe3/xdAmKDfTdtlKHpkP1Ibp0
   RlFg41yaJOSLi94ubrUCJ25C+oJwg5sNmqJn6GiIhQ44qiTVjRoGZIPBM
   W5Nq95xrdnbCRDef2nJpTRfcfAACC3U6/7kP1k6W86tK5tac4+j89Xqfj
   Ow1Bh6SvmBzp4nDlp8wymiMoOoaiOJ7360Wxf4F/QpTikzzUix9FqTpvc
   w==;
X-CSE-ConnectionGUID: XiHCKJUpQEWs2O0Dnz5n6g==
X-CSE-MsgGUID: RbMCf11jTy2n4TXW7FM3yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="107349392"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="107349392"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 05:46:17 -0700
X-CSE-ConnectionGUID: jTaiEFLxSgGAqPo2T0JwTA==
X-CSE-MsgGUID: ocCfgf6BTamD/k/FYzt8xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="276761121"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 05:46:14 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 15 Sep 2026 15:46:09 +0300 (EEST)
To: Antheas Kapenekakis <lkml@antheas.dev>
cc: Alexander Egorov <begeebe@gmail.com>, platform-driver-x86@vger.kernel.org, 
    Hans de Goede <hansg@kernel.org>, derekjohn.clark@gmail.com, 
    samsagax@gmail.com, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] platform/x86: oxpec: Report tablet mode on
 OneXPlayer detachables
In-Reply-To: <CAGwozwFAcHh0iUsKRcvtMe=Cn+pdNXAoSYqZ09k2srsSrqWs_w@mail.gmail.com>
Message-ID: <5e115a2e-5317-0238-86aa-d9e75cf18dbe@linux.intel.com>
References: <20260727215947.118292-1-begeebe@gmail.com> <20260728083529.329772-1-begeebe@gmail.com> <20260728083529.329772-3-begeebe@gmail.com> <CAGwozwFAcHh0iUsKRcvtMe=Cn+pdNXAoSYqZ09k2srsSrqWs_w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 30 Jul 2026, Antheas Kapenekakis wrote:

> On Tue, 28 Jul 2026 at 10:35, Alexander Egorov <begeebe@gmail.com> wrote:
> >
> > The OneXPlayer X1 family and Super X have detachable pogo-pin
> > keyboards. The firmware does not expose a tablet-mode input switch.
> >
> > The Super X keyboard enumerates as 1a86:1305. The X1 family folio
> > keyboard enumerates as 258a:001e.
> >
> > Register an input device on these boards and report SW_TABLET_MODE from
> > the model-specific pogo keyboard USB hotplug state. Other USB and
> > Bluetooth keyboards do not affect the switch.
> >
> > A complete dump of the 256-byte Super X EC register map was compared
> > with the keyboard attached, detached, and reattached. No register
> > changed predictably with the attachment state.
> >
> > Tested on a OneXPlayer Super X. Mutter enables accelerometer-driven
> > display rotation only while the pogo keyboard is absent.
> >
> > Assisted-by: Codex:gpt-5.6
> > Signed-off-by: Alexander Egorov <begeebe@gmail.com>
> > ---
> >  drivers/platform/x86/Kconfig |   2 +
> >  drivers/platform/x86/oxpec.c | 103 +++++++++++++++++++++++++++++++++++
> >  2 files changed, 105 insertions(+)
> >
> > diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> > index b54b521..3bcbd49 100644
> > --- a/drivers/platform/x86/Kconfig
> > +++ b/drivers/platform/x86/Kconfig
> > @@ -1055,6 +1055,8 @@ config OXP_EC
> >         depends on ACPI_EC
> >         depends on ACPI_BATTERY
> >         depends on HWMON
> > +       depends on INPUT
> > +       depends on USB
> >         depends on X86
> >         help
> >                 Enables support for the platform EC of OneXPlayer and AOKZOE
> > diff --git a/drivers/platform/x86/oxpec.c b/drivers/platform/x86/oxpec.c
> > index df29e41..5c07a35 100644
> > --- a/drivers/platform/x86/oxpec.c
> > +++ b/drivers/platform/x86/oxpec.c
> > @@ -18,10 +18,12 @@
> >  #include <linux/dmi.h>
> >  #include <linux/hwmon.h>
> >  #include <linux/init.h>
> > +#include <linux/input.h>
> >  #include <linux/kernel.h>
> >  #include <linux/module.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/processor.h>
> > +#include <linux/usb.h>
> >  #include <acpi/battery.h>
> >
> >  /* Handle ACPI lock mechanism */
> > @@ -55,6 +57,8 @@ enum oxp_board {
> >
> >  static enum oxp_board board;
> >  static struct device *oxp_dev;
> > +static struct input_dev *oxp_tablet_mode_input;
> > +static struct notifier_block oxp_usb_notifier;
> >
> >  /* Fan reading and PWM */
> >  #define OXP_SENSOR_FAN_REG             0x76 /* Fan reading is 2 registers long */
> > @@ -293,6 +297,74 @@ static const struct dmi_system_id dmi_table[] = {
> >         {},
> >  };
> >
> > +#define OXP_KEYBOARD_VID_QINHENG       0x1a86
> > +#define OXP_KEYBOARD_PID_K2445         0x1305
> > +#define OXP_KEYBOARD_VID_HAILUCK       0x258a
> > +#define OXP_KEYBOARD_PID_HAILUCK       0x001e
> 
> These defines need to go above with the other defines.
> 
> Can you explain the reasoning behind the name PID_K2445 and PID_HAILUCK?
> 
> > +
> > +static int oxp_find_keyboard(struct usb_device *udev, void *data)
> > +{
> > +       bool *keyboard_attached = data;
> > +       u16 vid = le16_to_cpu(udev->descriptor.idVendor);
> > +       u16 pid = le16_to_cpu(udev->descriptor.idProduct);
> > +
> > +       switch (board) {
> > +       case oxp_x1:
> > +               if (vid == OXP_KEYBOARD_VID_HAILUCK &&
> > +                   pid == OXP_KEYBOARD_PID_HAILUCK)
> > +                       *keyboard_attached = true;
> > +               break;
> > +       case oxp_super_x:
> > +               if (vid == OXP_KEYBOARD_VID_QINHENG &&
> > +                   pid == OXP_KEYBOARD_PID_K2445)
> > +                       *keyboard_attached = true;
> > +               break;
> > +       default:
> > +               break;
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> > +static int oxp_usb_notify(struct notifier_block *nb,
> > +                         unsigned long action, void *data)
> > +{
> > +       struct usb_device *udev = data;
> > +       u16 vid = le16_to_cpu(udev->descriptor.idVendor);
> > +       u16 pid = le16_to_cpu(udev->descriptor.idProduct);
> > +       bool keyboard = false;
> > +
> > +       switch (board) {
> > +       case oxp_x1:
> > +               keyboard = vid == OXP_KEYBOARD_VID_HAILUCK &&
> > +                          pid == OXP_KEYBOARD_PID_HAILUCK;
> > +               break;
> > +       case oxp_super_x:
> > +               keyboard = vid == OXP_KEYBOARD_VID_QINHENG &&
> > +                          pid == OXP_KEYBOARD_PID_K2445;

Why are you doing these manually instead of constructing proper usb id 
table, etc.?

> > +               break;
> > +       default:
> > +               break;
> > +       }
> > +
> > +       if (!keyboard)
> > +               return NOTIFY_DONE;
> > +
> > +       switch (action) {
> > +       case USB_DEVICE_ADD:
> > +               input_report_switch(oxp_tablet_mode_input, SW_TABLET_MODE, false);
> > +               break;
> > +       case USB_DEVICE_REMOVE:
> > +               input_report_switch(oxp_tablet_mode_input, SW_TABLET_MODE, true);
> > +               break;
> > +       default:
> > +               return NOTIFY_DONE;
> > +       }
> > +
> > +       input_sync(oxp_tablet_mode_input);
> > +       return NOTIFY_OK;
> > +}
> > +
> >  /* Helper functions to handle EC read/write */
> >  static int read_from_ec(u8 reg, int size, long *val)
> >  {
> > @@ -948,6 +1020,7 @@ static const struct hwmon_chip_info oxp_ec_chip_info = {
> >  /* Initialization logic */
> >  static int oxp_platform_probe(struct platform_device *pdev)
> >  {
> > +       bool keyboard_attached = false;
> >         struct device *dev = &pdev->dev;
> >         struct device *hwdev;
> >         int ret;
> > @@ -965,6 +1038,33 @@ static int oxp_platform_probe(struct platform_device *pdev)
> >                         return ret;
> >         }
> >
> > +       switch (board) {
> > +       case oxp_x1:
> > +       case oxp_super_x:
> > +               oxp_tablet_mode_input = devm_input_allocate_device(dev);
> > +               if (!oxp_tablet_mode_input)
> > +                       return -ENOMEM;
> > +
> > +               oxp_tablet_mode_input->name = "OneXPlayer Tablet Mode Switch";
> > +               oxp_tablet_mode_input->phys = "oxp-platform/input0";
> > +               oxp_tablet_mode_input->id.bustype = BUS_HOST;
> > +               input_set_capability(oxp_tablet_mode_input, EV_SW, SW_TABLET_MODE);
> > +
> > +               ret = input_register_device(oxp_tablet_mode_input);
> > +               if (ret)
> > +                       return ret;
> > +
> > +               oxp_usb_notifier.notifier_call = oxp_usb_notify;
> > +               usb_register_notify(&oxp_usb_notifier);
> > +               usb_for_each_dev(&keyboard_attached, oxp_find_keyboard);
> > +               input_report_switch(oxp_tablet_mode_input, SW_TABLET_MODE,
> > +                                   !keyboard_attached);
> > +               input_sync(oxp_tablet_mode_input);
> > +               break;
> > +       default:
> > +               break;
> > +       }
> > +
> >         return 0;
> >  }
> >
> > @@ -1005,6 +1105,9 @@ static int __init oxp_platform_init(void)
> >
> >  static void __exit oxp_platform_exit(void)
> >  {
> > +       if (board == oxp_x1 || board == oxp_super_x)
> > +               usb_unregister_notify(&oxp_usb_notifier);
> 
> You used a switch statement above. Match the logic and use a switch
> statement here too.

Yes, definitely.

> Give it a few days before sending a V3 for Ilpo to reply.
>
> @Ilpo do you think this is an acceptable expansion for the EC driver?

Often platform drivers start with a one feature, and may even be very 
specifically named after that feature, but then more platform stuff gets
added.

(Even our mailing list now bears "x86" in its name despite the scope of 
platform drivers having expanded also to non-x86 platforms.)

-- 
 i.

> The rest of the patch looks fine to me.
> 
> Best,
> Antheas
> 
> > +
> >         platform_device_unregister(oxp_platform_device);
> >         platform_driver_unregister(&oxp_platform_driver);
> >  }
> > --
> > 2.55.0
> >
> >
> 


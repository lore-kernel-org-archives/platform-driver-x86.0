Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D7F1C83F11
	for <platform-driver-x86@archiver.kernel.org>; Sun, 27 Aug 2023 13:23:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229916AbjH0NWo (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 27 Aug 2023 09:22:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229932AbjH0NWb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 27 Aug 2023 09:22:31 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A904B186
        for <platform-driver-x86@vger.kernel.org>; Sun, 27 Aug 2023 06:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693142548; x=1724678548;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=WGn1LL0tX5sxiXIpBZECLOKA/z3p2yTp6pMcgAKw/fU=;
  b=iqhRNKdN1XS97wPoMt6SKEwEYJhTJxw7Foeyv/x8xpZhH6qpIZGGomI+
   SmTluwG9Hj6QeW1bWGOC216vKvbMVdVY9t6pPsB/ltfkKnsDILdI1CU24
   9OJDkjxwlN7on0zgF1p/w076YkdvC5xO+WQya0p9Gqueyf3aJch7bVSs5
   v7Dic78/5QwPgIZwrzIaEnNGLDoYOIPikVC1SRDtxldP5jMUqZ8j5QQqe
   jpwd3SYUqs152oDCcMQQR/X+gXbDfwevRNbQnbjEG6aJMExY08eIQtXJY
   NDfXQeuN7wxXxkc8sf39IDAYeOcQp8IBkCb/qIj0QNPiM6u76JJq0gLxk
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="373829378"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="373829378"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2023 06:22:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="772984745"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="772984745"
Received: from dplotkin-mobl.ger.corp.intel.com ([10.249.41.231])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2023 06:22:25 -0700
Date:   Sun, 27 Aug 2023 16:22:13 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Stuart <stuart.a.hayhurst@gmail.com>
cc:     platform-driver-x86@vger.kernel.org,
        Mark Gross <markgross@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Ike Panhc <ike.pan@canonical.com>
Subject: Re: [PATCH 1/1] platform/x86: ideapad-laptop: Add support for keyboard
 backlights using KBLC ACPI symbol
In-Reply-To: <CALTg27=QFgAqd5irDmg2E-=wnOb4RkDSUUdboEHVm5Ut2z+q8A@mail.gmail.com>
Message-ID: <b5b89cef-c183-79f5-5cd0-3da9bbc13@linux.intel.com>
References: <20230825122925.7941-1-stuart.a.hayhurst@gmail.com> <6b50fffa-57df-032-9418-206a919ab828@linux.intel.com> <CALTg27=QFgAqd5irDmg2E-=wnOb4RkDSUUdboEHVm5Ut2z+q8A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1168695384-1693141965=:1592"
Content-ID: <e9cd1ed-2074-4e45-88a7-ac6e168d9e8c@linux.intel.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1168695384-1693141965=:1592
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <ed7c73-121e-769-b885-b6aed467ebd@linux.intel.com>

On Fri, 25 Aug 2023, Stuart wrote:

> Thanks for the quick review, I've addressed most of the comments for
> V2, do you want that submitted in this thread, or should I create a
> new one?
>
> > Could these bits too be named with defines, it would be helpful for those
> > reading the code?
> 
> > (If you can add the names to all these other bits too, it should be put
> > into own patch and not into this one.)
> 
> Sorry, I have no idea about the other events. I can do this one if
> you'd like, or leave a comment for the future if you'd rather they all
> be done together.

No worries, I assumed you might not know about them.

Lets just have the named define for this and leave the others as they are
(hopefully one day we can get them named as well).

-- 
 i.


> On Fri, Aug 25, 2023 at 2:01 PM Ilpo Järvinen
> <ilpo.jarvinen@linux.intel.com> wrote:
> >
> > On Fri, 25 Aug 2023, Stuart Hayhurst wrote:
> >
> > > Newer Lenovo laptops seem to use the KBLC symbol to control the backlight
> > > Add support for handling the keyboard backlight on these devices
> > >
> > > Signed-off-by: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>
> > > ---
> > >
> > > This has been tested on both new types of keyboard backlight being supported.
> > > KBD_BL_TRISTATE_AUTO is used for keyboards that support automatic brightness.
> > > AUTO is reported as '0' with this patch, as it doesn't fit numerically, I'm not sure how else to
> > > report AUTO, hopefully someone has some insight :)
> > >
> > > ---
> > >  drivers/platform/x86/ideapad-laptop.c | 107 ++++++++++++++++++++++++--
> > >  1 file changed, 100 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> > > index d2fee9a3e239..0e4cdd471a4a 100644
> > > --- a/drivers/platform/x86/ideapad-laptop.c
> > > +++ b/drivers/platform/x86/ideapad-laptop.c
> > > @@ -85,6 +85,21 @@ enum {
> > >       SALS_FNLOCK_OFF       = 0xf,
> > >  };
> > >
> > > +/*
> > > + * These correspond to the number of supported states - 1
> > > + * Future keyboard types may need a new system, if there's a collision
> > > + * KBD_BL_TRISTATE_AUTO has no way to report or set the auto state
> > > + * so it effectively has 3 states, but needs to handle 4
> > > + */
> > > +enum {
> > > +     KBD_BL_STANDARD      = 1,
> > > +     KBD_BL_TRISTATE      = 2,
> > > +     KBD_BL_TRISTATE_AUTO = 3,
> > > +};
> > > +
> > > +#define KBD_BL_COMMAND_GET 0x2
> > > +#define KBD_BL_COMMAND_SET 0x3
> > > +
> > >  struct ideapad_dytc_priv {
> > >       enum platform_profile_option current_profile;
> > >       struct platform_profile_handler pprof;
> > > @@ -122,6 +137,7 @@ struct ideapad_private {
> > >       } features;
> > >       struct {
> > >               bool initialized;
> > > +             int type;
> > >               struct led_classdev led;
> > >               unsigned int last_brightness;
> > >       } kbd_bl;
> > > @@ -242,6 +258,16 @@ static int exec_sals(acpi_handle handle, unsigned long arg)
> > >       return exec_simple_method(handle, "SALS", arg);
> > >  }
> > >
> > > +static int exec_kblc(acpi_handle handle, unsigned long arg)
> > > +{
> > > +     return exec_simple_method(handle, "KBLC", arg);
> > > +}
> > > +
> > > +static int eval_kblc(acpi_handle handle, unsigned long cmd, unsigned long *res)
> > > +{
> > > +     return eval_int_with_arg(handle, "KBLC", cmd, res);
> > > +}
> > > +
> > >  static int eval_dytc(acpi_handle handle, unsigned long cmd, unsigned long *res)
> > >  {
> > >       return eval_int_with_arg(handle, "DYTC", cmd, res);
> > > @@ -1272,14 +1298,42 @@ static void ideapad_backlight_notify_brightness(struct ideapad_private *priv)
> > >   */
> > >  static int ideapad_kbd_bl_brightness_get(struct ideapad_private *priv)
> > >  {
> > > -     unsigned long hals;
> > > +     unsigned long value;
> > >       int err;
> > >
> > > -     err = eval_hals(priv->adev->handle, &hals);
> > > +     if (priv->kbd_bl.type == KBD_BL_TRISTATE ||
> > > +         priv->kbd_bl.type == KBD_BL_TRISTATE_AUTO) {
> > > +             err = eval_kblc(priv->adev->handle,
> > > +                             (priv->kbd_bl.type << 4) | KBD_BL_COMMAND_GET,
> > > +                             &value);
> > > +
> > > +             if (err)
> > > +                     return err;
> > > +
> > > +             /* Convert returned value to brightness level */
> > > +             value = (value & 0xFFFF) >> 1;
> >
> > You should define a field for thiswith GENMASK() and use FIELD_GET()
> > instead of manual masking and shifting.
> >
> > > +
> > > +             if (value >= 0 && value <= 2) {
> >
> > How can unsigned long be < 0??
> >
> > If that 2 is the same as priv->kbd_bl.led.max_brightness, it would make
> > sense to use it rather than literal.
> >
> > > +                     /* Off, low or high */
> > > +                     return value;
> > > +             } else if (value == 3) {
> > > +                     /* Auto, report as off */
> > > +                     return 0;
> > > +             } else {
> >
> > Since those blocks above return, the elses are unnecessary.
> >
> > > +                     /* Unknown value */
> > > +                     dev_warn(&priv->platform_device->dev,
> > > +                              "Unknown keyboard backlight value: %i",
> > > +                              value);
> > > +                     return -EINVAL;
> > > +             }
> > > +     }
> > > +
> > > +
> >
> > Remove one of the newlines.
> >
> > > +     err = eval_hals(priv->adev->handle, &value);
> > >       if (err)
> > >               return err;
> > >
> > > -     return !!test_bit(HALS_KBD_BL_STATE_BIT, &hals);
> > > +     return !!test_bit(HALS_KBD_BL_STATE_BIT, &value);
> > >  }
> > >
> > >  static enum led_brightness ideapad_kbd_bl_led_cdev_brightness_get(struct led_classdev *led_cdev)
> > > @@ -1291,13 +1345,27 @@ static enum led_brightness ideapad_kbd_bl_led_cdev_brightness_get(struct led_cla
> > >
> > >  static int ideapad_kbd_bl_brightness_set(struct ideapad_private *priv, unsigned int brightness)
> > >  {
> > > -     int err = exec_sals(priv->adev->handle, brightness ? SALS_KBD_BL_ON : SALS_KBD_BL_OFF);
> > > +     int err;
> > > +     unsigned long value;
> > > +     int type = priv->kbd_bl.type;
> > > +
> > > +     if (type == KBD_BL_TRISTATE ||
> > > +         type == KBD_BL_TRISTATE_AUTO) {
> > > +             if (brightness >= 0 && brightness <= 2) {
> >
> > Brightness is unsigned int so no need for < 0 check.
> >
> > Reverse the logic here:
> >
> >                 if (brightness > 2)
> >                         return -EINVAL;
> >
> > ...as it avoid the need to use else.
> >
> > Consider using .max_brightness here too.
> >
> > > +                     value = (brightness << 16) | (type << 4) | KBD_BL_COMMAND_SET;
> >
> > There would also be a readability benefit for these if you define these
> > as fields and use FIELD_PREP().
> >
> > > +             } else {
> > > +                     return -EINVAL;
> > > +             }
> > > +
> > > +             err = exec_kblc(priv->adev->handle, value);
> > > +     } else {
> > > +             err = exec_sals(priv->adev->handle, brightness ? SALS_KBD_BL_ON : SALS_KBD_BL_OFF);
> > > +     }
> > >
> > >       if (err)
> > >               return err;
> > >
> > >       priv->kbd_bl.last_brightness = brightness;
> > > -
> >
> > Stray change.
> >
> > >       return 0;
> > >  }
> > >
> > > @@ -1344,8 +1412,14 @@ static int ideapad_kbd_bl_init(struct ideapad_private *priv)
> > >
> > >       priv->kbd_bl.last_brightness = brightness;
> > >
> > > +     if (priv->kbd_bl.type == KBD_BL_TRISTATE ||
> > > +         priv->kbd_bl.type == KBD_BL_TRISTATE_AUTO) {
> >
> > Please add a helper for this check as it seems to appear multiple times in
> > this patch.
> >
> > > +             priv->kbd_bl.led.max_brightness = 2;
> > > +     } else {
> > > +             priv->kbd_bl.led.max_brightness = 1;
> > > +     }
> > > +
> > >       priv->kbd_bl.led.name                    = "platform::" LED_FUNCTION_KBD_BACKLIGHT;
> > > -     priv->kbd_bl.led.max_brightness          = 1;
> > >       priv->kbd_bl.led.brightness_get          = ideapad_kbd_bl_led_cdev_brightness_get;
> > >       priv->kbd_bl.led.brightness_set_blocking = ideapad_kbd_bl_led_cdev_brightness_set;
> > >       priv->kbd_bl.led.flags                   = LED_BRIGHT_HW_CHANGED;
> > > @@ -1456,6 +1530,7 @@ static void ideapad_acpi_notify(acpi_handle handle, u32 event, void *data)
> > >               case 2:
> > >                       ideapad_backlight_notify_power(priv);
> > >                       break;
> > > +             case 12:
> >
> > Could these bits too be named with defines, it would be helpful for those
> > reading the code?
> >
> > (If you can add the names to all these other bits too, it should be put
> > into own patch and not into this one.)
> >
> > >               case 1:
> > >                       /*
> > >                        * Some IdeaPads report event 1 every ~20
> > > @@ -1557,13 +1632,31 @@ static void ideapad_check_features(struct ideapad_private *priv)
> > >                       if (test_bit(HALS_FNLOCK_SUPPORT_BIT, &val))
> > >                               priv->features.fn_lock = true;
> > >
> > > -                     if (test_bit(HALS_KBD_BL_SUPPORT_BIT, &val))
> > > +                     if (test_bit(HALS_KBD_BL_SUPPORT_BIT, &val)) {
> > >                               priv->features.kbd_bl = true;
> > > +                             priv->kbd_bl.type = KBD_BL_STANDARD;
> > > +                     }
> > >
> > >                       if (test_bit(HALS_USB_CHARGING_SUPPORT_BIT, &val))
> > >                               priv->features.usb_charging = true;
> > >               }
> > >       }
> > > +
> > > +     if (acpi_has_method(handle, "KBLC")) {
> > > +             if (!eval_kblc(priv->adev->handle, 0x1, &val)) {
> > > +                     if (val == 0x5) {
> > > +                             priv->features.kbd_bl = true;
> > > +                             priv->kbd_bl.type = KBD_BL_TRISTATE;
> > > +                     } else if (val == 0x7) {
> >
> > Name these three literals with defines.
> >
> > > +                             priv->features.kbd_bl = true;
> > > +                             priv->kbd_bl.type = KBD_BL_TRISTATE_AUTO;
> > > +                     } else {
> > > +                             dev_warn(&priv->platform_device->dev,
> > > +                                      "Unknown keyboard type: %i",
> > > +                                      val);
> > > +                     }
> > > +             }
> > > +     }
> > >  }
> > >
> > >  #if IS_ENABLED(CONFIG_ACPI_WMI)
> > >
> >
> > --
> >  i.
> >
> 
--8323329-1168695384-1693141965=:1592--

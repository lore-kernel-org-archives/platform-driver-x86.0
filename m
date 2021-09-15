Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B7C2C433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed, 15 Sep 2021 20:56:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0ABA561108
	for <platform-driver-x86@archiver.kernel.org>; Wed, 15 Sep 2021 20:56:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232047AbhIOU5V (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 15 Sep 2021 16:57:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47237 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231830AbhIOU5U (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 15 Sep 2021 16:57:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1631739359;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EVZOt2yNFvEK2KV/w0c180vRiMblSsQZvJPb+fL2cd4=;
        b=HkZ+7puuIMmVmzzRT74jE9mIKQO+OxU4x78Wd9p3TeOxx2CdpjP2CPsynbqgXTs+K/ddRD
        KSmJm6zoBYkAvl81t3HS+hEf8DVIbzn3soTffxdhRAmqoywvib8eBANDSFBd7UdtYc85Ov
        FUx0a4L0WJgSwP5z3R2BQ7gFx5iCH/c=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-N1sUtG8SOTeJjgaNl4yZng-1; Wed, 15 Sep 2021 16:55:58 -0400
X-MC-Unique: N1sUtG8SOTeJjgaNl4yZng-1
Received: by mail-qt1-f198.google.com with SMTP id q19-20020ac87353000000b0029a09eca2afso9096881qtp.21
        for <platform-driver-x86@vger.kernel.org>; Wed, 15 Sep 2021 13:55:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:organization:user-agent:mime-version
         :content-transfer-encoding;
        bh=EVZOt2yNFvEK2KV/w0c180vRiMblSsQZvJPb+fL2cd4=;
        b=3fJTVhryxgzhg5Iw/shON9BRuKiooCm5bFh2otLUjMfOxV6ExCqOWliVByJTwyiefz
         7AtpsKywLX7p5r/+uU32QLcS9tuefBebBD3tmYrb/W2lj//PI4lItoQN3SjC7plOO1+Z
         kKm2rIuY96hN9jtFCt80v2/aM4mba6zlzovSFwuVhbepo9dsW9f9KzNRg7qTAgaBszV+
         o5f4a7TNbp1EL5xfSVuY8X6U8IdoufbRWEg27e7DbDjzK6NDNE82W36o8iY3Wr/7ShkU
         F37uVoepg7z4iZhXC41N4RtmnCf3Wy4ptsq/UQbGJI2i5lOs+E/aWcOhkAeR3zLpiE69
         eYgw==
X-Gm-Message-State: AOAM532U1wEFy7i0cOdoZ5lg8a1LlWFyTBpBA0IJ4mRnmGwzM/M7A1S1
        eYXFg6rEZ+Gxvdk9DMN0AQVjhmQgOQfB92ci+yR6zQxbM9vM/6O2nvsxxD4UPOXj6QpGg2f7HGk
        0Jphs23lrOdJPcLVNb8hw3MwXd1Hk7/DR/A==
X-Received: by 2002:a0c:c2c1:: with SMTP id c1mr1744084qvi.59.1631739358343;
        Wed, 15 Sep 2021 13:55:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8LcLnn6veIMJWpMDTiS3JAcd5beHCHimwu1jggYQTdzXZNZBI9TPYzn5vw4pw85qGtbU59w==
X-Received: by 2002:a0c:c2c1:: with SMTP id c1mr1744060qvi.59.1631739358041;
        Wed, 15 Sep 2021 13:55:58 -0700 (PDT)
Received: from [192.168.8.206] (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
        by smtp.gmail.com with ESMTPSA id i67sm804812qkd.90.2021.09.15.13.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 13:55:57 -0700 (PDT)
Message-ID: <b6c1346378af6792a0a0b4bcf334d21b56747fc6.camel@redhat.com>
Subject: Re: [PATCH 8/9] platform/x86: thinkpad_acpi: Register a
 privacy-screen device
From:   Lyude Paul <lyude@redhat.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rajat Jain <rajatja@google.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
        Pekka Paalanen <pekka.paalanen@collabora.com>,
        Mario Limonciello <mario.limonciello@outlook.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Sebastien Bacher <seb128@ubuntu.com>,
        Marco Trevisan <marco.trevisan@canonical.com>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org,
        platform-driver-x86@vger.kernel.org
Date:   Wed, 15 Sep 2021 16:55:55 -0400
In-Reply-To: <20210906073519.4615-9-hdegoede@redhat.com>
References: <20210906073519.4615-1-hdegoede@redhat.com>
         <20210906073519.4615-9-hdegoede@redhat.com>
Organization: Red Hat
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, 2021-09-06 at 09:35 +0200, Hans de Goede wrote:
> Register a privacy-screen device on laptops with a privacy-screen,
> this exports the PrivacyGuard features to user-space using a
> standardized vendor-agnostic sysfs interface. Note the sysfs interface
> is read-only.
> 
> Registering a privacy-screen device with the new privacy-screen class
> code will also allow the GPU driver to get a handle to it and export
> the privacy-screen setting as a property on the DRM connector object
> for the LCD panel. This DRM connector property is news standardized

Looks like a typo here ------------------------------^

> interface which all user-space code should use to query and control
> the privacy-screen.
> 
> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v2:
> - Make the new lcdshadow_set_sw_state, lcdshadow_get_hw_state and
>   lcdshadow_ops symbols static
> - Update state and call drm_privacy_screen_call_notifier_chain()
>   when the state is changed by pressing the Fn + D hotkey combo
> ---
>  drivers/platform/x86/Kconfig         |  2 +
>  drivers/platform/x86/thinkpad_acpi.c | 91 ++++++++++++++++++++--------
>  2 files changed, 68 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index d12db6c316ea..ae00a27f9f95 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -509,7 +509,9 @@ config THINKPAD_ACPI
>         depends on ACPI_VIDEO || ACPI_VIDEO = n
>         depends on BACKLIGHT_CLASS_DEVICE
>         depends on I2C
> +       depends on DRM
>         select ACPI_PLATFORM_PROFILE
> +       select DRM_PRIVACY_SCREEN
>         select HWMON
>         select NVRAM
>         select NEW_LEDS
> diff --git a/drivers/platform/x86/thinkpad_acpi.c
> b/drivers/platform/x86/thinkpad_acpi.c
> index b8f2556c4797..044b238730ba 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -73,6 +73,7 @@
>  #include <linux/uaccess.h>
>  #include <acpi/battery.h>
>  #include <acpi/video.h>
> +#include <drm/drm_privacy_screen_driver.h>
>  #include "dual_accel_detect.h"
>  
>  /* ThinkPad CMOS commands */
> @@ -157,6 +158,7 @@ enum tpacpi_hkey_event_t {
>         TP_HKEY_EV_VOL_UP               = 0x1015, /* Volume up or unmute */
>         TP_HKEY_EV_VOL_DOWN             = 0x1016, /* Volume down or unmute
> */
>         TP_HKEY_EV_VOL_MUTE             = 0x1017, /* Mixer output mute */
> +       TP_HKEY_EV_PRIVACYGUARD_TOGGLE  = 0x130f, /* Toggle priv.guard
> on/off */
>  
>         /* Reasons for waking up from S3/S4 */
>         TP_HKEY_EV_WKUP_S3_UNDOCK       = 0x2304, /* undock requested, S3 */
> @@ -3889,6 +3891,12 @@ static bool hotkey_notify_extended_hotkey(const u32
> hkey)
>  {
>         unsigned int scancode;
>  
> +       switch (hkey) {
> +       case TP_HKEY_EV_PRIVACYGUARD_TOGGLE:
> +               tpacpi_driver_event(hkey);
> +               return true;
> +       }
> +
>         /* Extended keycodes start at 0x300 and our offset into the map
>          * TP_ACPI_HOTKEYSCAN_EXTENDED_START. The calculated scancode
>          * will be positive, but might not be in the correct range.
> @@ -9819,30 +9827,40 @@ static struct ibm_struct battery_driver_data = {
>   * LCD Shadow subdriver, for the Lenovo PrivacyGuard feature
>   */
>  
> +static struct drm_privacy_screen *lcdshadow_dev;
>  static acpi_handle lcdshadow_get_handle;
>  static acpi_handle lcdshadow_set_handle;
> -static int lcdshadow_state;
>  
> -static int lcdshadow_on_off(bool state)
> +static int lcdshadow_set_sw_state(struct drm_privacy_screen *priv,
> +                                 enum drm_privacy_screen_status state)
>  {
>         int output;
>  
> +       if (WARN_ON(!mutex_is_locked(&priv->lock)))
> +               return -EIO;
> +
>         if (!acpi_evalf(lcdshadow_set_handle, &output, NULL, "dd",
> (int)state))
>                 return -EIO;
>  
> -       lcdshadow_state = state;
> +       priv->hw_state = priv->sw_state = state;
>         return 0;
>  }
>  
> -static int lcdshadow_set(bool on)
> +static void lcdshadow_get_hw_state(struct drm_privacy_screen *priv)
>  {
> -       if (lcdshadow_state < 0)
> -               return lcdshadow_state;
> -       if (lcdshadow_state == on)
> -               return 0;
> -       return lcdshadow_on_off(on);
> +       int output;
> +
> +       if (!acpi_evalf(lcdshadow_get_handle, &output, NULL, "dd", 0))
> +               return;
> +
> +       priv->hw_state = priv->sw_state = output & 0x1;
>  }
>  
> +static const struct drm_privacy_screen_ops lcdshadow_ops = {
> +       .set_sw_state = lcdshadow_set_sw_state,
> +       .get_hw_state = lcdshadow_get_hw_state,
> +};
> +
>  static int tpacpi_lcdshadow_init(struct ibm_init_struct *iibm)
>  {
>         acpi_status status1, status2;
> @@ -9850,36 +9868,44 @@ static int tpacpi_lcdshadow_init(struct
> ibm_init_struct *iibm)
>  
>         status1 = acpi_get_handle(hkey_handle, "GSSS",
> &lcdshadow_get_handle);
>         status2 = acpi_get_handle(hkey_handle, "SSSS",
> &lcdshadow_set_handle);
> -       if (ACPI_FAILURE(status1) || ACPI_FAILURE(status2)) {
> -               lcdshadow_state = -ENODEV;
> +       if (ACPI_FAILURE(status1) || ACPI_FAILURE(status2))
>                 return 0;
> -       }
>  
> -       if (!acpi_evalf(lcdshadow_get_handle, &output, NULL, "dd", 0)) {
> -               lcdshadow_state = -EIO;
> +       if (!acpi_evalf(lcdshadow_get_handle, &output, NULL, "dd", 0))
>                 return -EIO;
> -       }
> -       if (!(output & 0x10000)) {
> -               lcdshadow_state = -ENODEV;
> +
> +       if (!(output & 0x10000))
>                 return 0;
> -       }
> -       lcdshadow_state = output & 0x1;
> +
> +       lcdshadow_dev = drm_privacy_screen_register(&tpacpi_pdev->dev,
> +                                                   &lcdshadow_ops);
> +       if (IS_ERR(lcdshadow_dev))
> +               return PTR_ERR(lcdshadow_dev);
>  
>         return 0;
>  }
>  
> +static void lcdshadow_exit(void)
> +{
> +       drm_privacy_screen_unregister(lcdshadow_dev);
> +}
> +
>  static void lcdshadow_resume(void)
>  {
> -       if (lcdshadow_state >= 0)
> -               lcdshadow_on_off(lcdshadow_state);
> +       if (!lcdshadow_dev)
> +               return;
> +
> +       mutex_lock(&lcdshadow_dev->lock);
> +       lcdshadow_set_sw_state(lcdshadow_dev, lcdshadow_dev->sw_state);
> +       mutex_unlock(&lcdshadow_dev->lock);
>  }
>  

For privacy screens provided by x86 platform drivers this is -probably-
correct, but only so long as we're confident that the privacy screen is always
going to be controllable regardless of the power state of the actual LCD
panel.

I'd think we would need to handle suspend/resume in the atomic commit though
if we ever have to support systems where the two are dependent on one another,
but, that's a simple enough change to do later if it arises that I think we
can ignore it for now.

>  static int lcdshadow_read(struct seq_file *m)
>  {
> -       if (lcdshadow_state < 0) {
> +       if (!lcdshadow_dev) {
>                 seq_puts(m, "status:\t\tnot supported\n");
>         } else {
> -               seq_printf(m, "status:\t\t%d\n", lcdshadow_state);
> +               seq_printf(m, "status:\t\t%d\n", lcdshadow_dev->hw_state);
>                 seq_puts(m, "commands:\t0, 1\n");
>         }
>  
> @@ -9891,7 +9917,7 @@ static int lcdshadow_write(char *buf)
>         char *cmd;
>         int res, state = -EINVAL;
>  
> -       if (lcdshadow_state < 0)
> +       if (!lcdshadow_dev)
>                 return -ENODEV;
>  
>         while ((cmd = strsep(&buf, ","))) {
> @@ -9903,11 +9929,18 @@ static int lcdshadow_write(char *buf)
>         if (state >= 2 || state < 0)
>                 return -EINVAL;
>  
> -       return lcdshadow_set(state);
> +       mutex_lock(&lcdshadow_dev->lock);
> +       res = lcdshadow_set_sw_state(lcdshadow_dev, state);
> +       mutex_unlock(&lcdshadow_dev->lock);
> +
> +       drm_privacy_screen_call_notifier_chain(lcdshadow_dev);
> +
> +       return res;
>  }
>  
>  static struct ibm_struct lcdshadow_driver_data = {
>         .name = "lcdshadow",
> +       .exit = lcdshadow_exit,
>         .resume = lcdshadow_resume,
>         .read = lcdshadow_read,
>         .write = lcdshadow_write,
> @@ -10717,6 +10750,14 @@ static void tpacpi_driver_event(const unsigned int
> hkey_event)
>                 if (!atomic_add_unless(&dytc_ignore_event, -1, 0))
>                         dytc_profile_refresh();
>         }
> +
> +       if (lcdshadow_dev && hkey_event == TP_HKEY_EV_PRIVACYGUARD_TOGGLE) {
> +               mutex_lock(&lcdshadow_dev->lock);
> +               lcdshadow_get_hw_state(lcdshadow_dev);
> +               mutex_unlock(&lcdshadow_dev->lock);
> +
> +               drm_privacy_screen_call_notifier_chain(lcdshadow_dev);
> +       }
>  }
>  
>  static void hotkey_driver_event(const unsigned int scancode)

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat


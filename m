Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93E46C6FA99
	for <platform-driver-x86@archiver.kernel.org>; Fri, 10 Mar 2023 11:56:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230197AbjCJL4M (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 10 Mar 2023 06:56:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229761AbjCJLzm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 10 Mar 2023 06:55:42 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B26EE6DA0
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Mar 2023 03:55:02 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id h14so4796159wru.4
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Mar 2023 03:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678449300;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bZSCJ747z4f8p81WHQ5TSaYZQR5H7+n5vacnZVnb7o0=;
        b=aTARI5CHYiCi4eg5TfH4XWbuJwWLxF0sRoj8gwbDrxbI2eSJcg3d4hstnax+dxnWm6
         z7aclkrDPIT4CXTzQCMR8Y/tR9mfH5AaC+Lk230nLULO1i7eOnF+hgpoS5/ytJ0FT9fG
         RPxrxcySoq5GTYYdts1OXw+QlG2dESv6Sn5gO28EDSSkxDvT+IowcR6Co6cnncKOFMza
         XimkVk/YuH0HrjuZz9wMGcRqmzSb3f/SLsoQrCASliJ1MhBdWmfAm6rpklSy6syyj+k9
         2qNCa0+Hl/+to5Ks4O6H8+81ujNYk8UUJ2YzZsAiLPrQZvhe9ary4sN6hBA1Fu+9P6lG
         0kvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678449300;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bZSCJ747z4f8p81WHQ5TSaYZQR5H7+n5vacnZVnb7o0=;
        b=58nXBsNNOCa7h5/b0XhPCLPzhJ62Wan0JB2SW9UwvEQHHpm0L32Ygfs2Iwaal9DnbP
         yg4MTNs2mys7Oapeo+a5SxmXsk7FOOXTZw+7w4Xgj4G8mDwDhQuMx7eGImr6xo8sPmDO
         d3k0bSQGc8kpM/R66MuvyP4AVUYkuUQ7mgfq2zrrxbN/d9ggv9adGyhNnrVME6/0SBlK
         fiqn0tUJ7ZnQ1woBzl7fWZFMCTA1wXiNdvbQenTPiUebaHiGoBpu07ecxTMA+cQkxJcT
         FKclm7ctOg5NXBV5UFxCgYotrqBVNKjzS2GUkNXU6e6fchiZzwQkLDJz/Ac49XOzJaD1
         Wucw==
X-Gm-Message-State: AO0yUKUP87Mh73S6NEOxRJHMjZKyRswt6rchJ7rdCVyLk2gILW+xI37U
        tLloJ/IpP0Bvt+dzZEErmvWgn3k2Vyk=
X-Google-Smtp-Source: AK7set8pj1ulPN5O686r9P/niLoB0C7V7LIjLH1zBnsUctwVb8zGTymS/7TnA5QYRs070kcvo+uIUQ==
X-Received: by 2002:a5d:66ce:0:b0:2bf:f735:1310 with SMTP id k14-20020a5d66ce000000b002bff7351310mr17223416wrw.2.1678449300325;
        Fri, 10 Mar 2023 03:55:00 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id j13-20020a5d564d000000b002c5694aef92sm2065229wrw.21.2023.03.10.03.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 03:54:59 -0800 (PST)
Date:   Fri, 10 Mar 2023 14:54:55 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     hdegoede@redhat.com
Cc:     platform-driver-x86@vger.kernel.org
Subject: [bug report] platform/x86: apple-gmux: Add
 acpi_video_get_backlight_type() check
Message-ID: <26580467-902b-4e0a-bbf6-68d7b0b7fc6d@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hello Hans de Goede,

The patch 315e560c1526: "platform/x86: apple-gmux: Add
acpi_video_get_backlight_type() check" from Mar 7, 2023, leads to the
following Smatch static checker warning:

	drivers/platform/x86/apple-gmux.c:974 gmux_probe()
	error: uninitialized symbol 'bdev'.

drivers/platform/x86/apple-gmux.c
    780 static int gmux_probe(struct pnp_dev *pnp, const struct pnp_device_id *id)
    781 {
    782         struct apple_gmux_data *gmux_data;
    783         struct resource *res;
    784         struct backlight_properties props;
    785         struct backlight_device *bdev;
    786         u8 ver_major, ver_minor, ver_release;
    787         bool register_bdev = true;
    788         int ret = -ENXIO;
    789         acpi_status status;
    790         unsigned long long gpe;
    791         enum apple_gmux_type type;
    792         u32 version;
    793 
    794         if (apple_gmux_data)
    795                 return -EBUSY;
    796 
    797         if (!apple_gmux_detect(pnp, &type)) {
    798                 pr_info("gmux device not present\n");
    799                 return -ENODEV;
    800         }
    801 
    802         gmux_data = kzalloc(sizeof(*gmux_data), GFP_KERNEL);
    803         if (!gmux_data)
    804                 return -ENOMEM;
    805         pnp_set_drvdata(pnp, gmux_data);
    806 
    807         switch (type) {
    808         case APPLE_GMUX_TYPE_MMIO:
    809                 gmux_data->config = &apple_gmux_mmio;
    810                 mutex_init(&gmux_data->index_lock);
    811 
    812                 res = pnp_get_resource(pnp, IORESOURCE_MEM, 0);
    813                 gmux_data->iostart = res->start;
    814                 /* Although the ACPI table only allocates 8 bytes, we need 16. */
    815                 gmux_data->iolen = 16;
    816                 if (!request_mem_region(gmux_data->iostart, gmux_data->iolen,
    817                                         "Apple gmux")) {
    818                         pr_err("gmux I/O already in use\n");
    819                         goto err_free;
    820                 }
    821                 gmux_data->iomem_base = ioremap(gmux_data->iostart, gmux_data->iolen);
    822                 if (!gmux_data->iomem_base) {
    823                         pr_err("couldn't remap gmux mmio region");
    824                         goto err_release;
    825                 }
    826                 goto get_version;
    827         case APPLE_GMUX_TYPE_INDEXED:
    828                 gmux_data->config = &apple_gmux_index;
    829                 mutex_init(&gmux_data->index_lock);
    830                 break;
    831         case APPLE_GMUX_TYPE_PIO:
    832                 gmux_data->config = &apple_gmux_pio;
    833                 break;
    834         }
    835 
    836         res = pnp_get_resource(pnp, IORESOURCE_IO, 0);
    837         gmux_data->iostart = res->start;
    838         gmux_data->iolen = resource_size(res);
    839 
    840         if (!request_region(gmux_data->iostart, gmux_data->iolen,
    841                             "Apple gmux")) {
    842                 pr_err("gmux I/O already in use\n");
    843                 goto err_free;
    844         }
    845 
    846 get_version:
    847         if (gmux_data->config->read_version_as_u32) {
    848                 version = gmux_read32(gmux_data, GMUX_PORT_VERSION_MAJOR);
    849                 ver_major = (version >> 24) & 0xff;
    850                 ver_minor = (version >> 16) & 0xff;
    851                 ver_release = (version >> 8) & 0xff;
    852         } else {
    853                 ver_major = gmux_read8(gmux_data, GMUX_PORT_VERSION_MAJOR);
    854                 ver_minor = gmux_read8(gmux_data, GMUX_PORT_VERSION_MINOR);
    855                 ver_release = gmux_read8(gmux_data, GMUX_PORT_VERSION_RELEASE);
    856         }
    857         pr_info("Found gmux version %d.%d.%d [%s]\n", ver_major, ver_minor,
    858                 ver_release, gmux_data->config->name);
    859 
    860         memset(&props, 0, sizeof(props));
    861         props.type = BACKLIGHT_PLATFORM;
    862         props.max_brightness = gmux_read32(gmux_data, GMUX_PORT_MAX_BRIGHTNESS);
    863 
    864 #if IS_REACHABLE(CONFIG_ACPI_VIDEO)
    865         register_bdev = acpi_video_get_backlight_type() == acpi_backlight_apple_gmux;
    866 #endif
    867         if (register_bdev) {
    868                 /*
    869                  * Currently it's assumed that the maximum brightness is less than
    870                  * 2^24 for compatibility with old gmux versions. Cap the max
    871                  * brightness at this value, but print a warning if the hardware
    872                  * reports something higher so that it can be fixed.
    873                  */
    874                 if (WARN_ON(props.max_brightness > GMUX_MAX_BRIGHTNESS))
    875                         props.max_brightness = GMUX_MAX_BRIGHTNESS;
    876 
    877                 bdev = backlight_device_register("gmux_backlight", &pnp->dev,
    878                                                  gmux_data, &gmux_bl_ops, &props);
    879                 if (IS_ERR(bdev)) {
    880                         ret = PTR_ERR(bdev);
    881                         goto err_unmap;
    882                 }
    883 
    884                 gmux_data->bdev = bdev;
    885                 bdev->props.brightness = gmux_get_brightness(bdev);
    886                 backlight_update_status(bdev);
    887 
    888                 /*
    889                  * The backlight situation on Macs is complicated. If the gmux is
    890                  * present it's the best choice, because it always works for
    891                  * backlight control and supports more levels than other options.
    892                  * Disable the other backlight choices.
    893                  */
    894                 apple_bl_unregister();
    895         }

bdev isn't initialized on the error path.

    896 
    897         gmux_data->power_state = VGA_SWITCHEROO_ON;
    898 
    899         gmux_data->dhandle = ACPI_HANDLE(&pnp->dev);
    900         if (!gmux_data->dhandle) {
    901                 pr_err("Cannot find acpi handle for pnp device %s\n",
    902                        dev_name(&pnp->dev));
    903                 ret = -ENODEV;
    904                 goto err_notify;
    905         }
    906 
    907         status = acpi_evaluate_integer(gmux_data->dhandle, "GMGP", NULL, &gpe);
    908         if (ACPI_SUCCESS(status)) {
    909                 gmux_data->gpe = (int)gpe;
    910 
    911                 status = acpi_install_notify_handler(gmux_data->dhandle,
    912                                                      ACPI_DEVICE_NOTIFY,
    913                                                      &gmux_notify_handler, pnp);
    914                 if (ACPI_FAILURE(status)) {
    915                         pr_err("Install notify handler failed: %s\n",
    916                                acpi_format_exception(status));
    917                         ret = -ENODEV;
    918                         goto err_notify;
    919                 }
    920 
    921                 status = acpi_enable_gpe(NULL, gmux_data->gpe);
    922                 if (ACPI_FAILURE(status)) {
    923                         pr_err("Cannot enable gpe: %s\n",
    924                                acpi_format_exception(status));
    925                         goto err_enable_gpe;
    926                 }
    927         } else {
    928                 pr_warn("No GPE found for gmux\n");
    929                 gmux_data->gpe = -1;
    930         }
    931 
    932         /*
    933          * If Thunderbolt is present, the external DP port is not fully
    934          * switchable. Force its AUX channel to the discrete GPU.
    935          */
    936         gmux_data->external_switchable =
    937                 !bus_for_each_dev(&pci_bus_type, NULL, NULL, is_thunderbolt);
    938         if (!gmux_data->external_switchable)
    939                 gmux_write8(gmux_data, GMUX_PORT_SWITCH_EXTERNAL, 3);
    940 
    941         apple_gmux_data = gmux_data;
    942         init_completion(&gmux_data->powerchange_done);
    943         gmux_enable_interrupts(gmux_data);
    944         gmux_read_switch_state(gmux_data);
    945 
    946         /*
    947          * Retina MacBook Pros cannot switch the panel's AUX separately
    948          * and need eDP pre-calibration. They are distinguishable from
    949          * pre-retinas by having an "indexed" or "T2" gmux.
    950          *
    951          * Pre-retina MacBook Pros can switch the panel's DDC separately.
    952          */
    953         ret = vga_switcheroo_register_handler(gmux_data->config->gmux_handler,
    954                         gmux_data->config->handler_flags);
    955         if (ret) {
    956                 pr_err("Failed to register vga_switcheroo handler\n");
    957                 goto err_register_handler;
    958         }
    959 
    960         gmux_init_debugfs(gmux_data);
    961         return 0;
    962 
    963 err_register_handler:
    964         gmux_disable_interrupts(gmux_data);
    965         apple_gmux_data = NULL;
    966         if (gmux_data->gpe >= 0)
    967                 acpi_disable_gpe(NULL, gmux_data->gpe);
    968 err_enable_gpe:
    969         if (gmux_data->gpe >= 0)
    970                 acpi_remove_notify_handler(gmux_data->dhandle,
    971                                            ACPI_DEVICE_NOTIFY,
    972                                            &gmux_notify_handler);
    973 err_notify:
--> 974         backlight_device_unregister(bdev);
                                            ^^^^
    975 err_unmap:
    976         if (gmux_data->iomem_base)
    977                 iounmap(gmux_data->iomem_base);
    978 err_release:
    979         if (gmux_data->config->resource_type == IORESOURCE_MEM)
    980                 release_mem_region(gmux_data->iostart, gmux_data->iolen);
    981         else
    982                 release_region(gmux_data->iostart, gmux_data->iolen);
    983 err_free:
    984         kfree(gmux_data);
    985         return ret;
    986 }

regards,
dan carpenter

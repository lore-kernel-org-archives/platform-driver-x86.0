Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C85BC6FD19
	for <platform-driver-x86@archiver.kernel.org>; Thu, 16 Mar 2023 12:33:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229875AbjCPMdE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 16 Mar 2023 08:33:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229708AbjCPMdD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 16 Mar 2023 08:33:03 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A2CDCA1DC
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Mar 2023 05:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678969936;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TEogrFg8XHdwFBYM2nV7XE3xI4fNggnjER6NmQ1iO6g=;
        b=Qzw+rqT+G5njhauhouv0aYJFznaWOGlQOiIcR5jwoJGLWOajgGtLvR7HdSfSQDJd4Ubia/
        AaXAOHN/jElteseqac9+5YbHYE6H0dL30Kr3Dkktj5qE7R9MoyE8n3hz9A/7ZLiHeidJ+l
        vhTNk+F3zfoqXxu60QKwAvc3B3y7e+A=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-403-XDQsKIFEOvyE5sBlJ4SqcA-1; Thu, 16 Mar 2023 08:32:14 -0400
X-MC-Unique: XDQsKIFEOvyE5sBlJ4SqcA-1
Received: by mail-ed1-f71.google.com with SMTP id b1-20020aa7dc01000000b004ad062fee5eso2789010edu.17
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Mar 2023 05:32:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678969933;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TEogrFg8XHdwFBYM2nV7XE3xI4fNggnjER6NmQ1iO6g=;
        b=1ssokVMspWuL7OHRWbYR2kv8L2zlC6WANI7v/MiA0hSBX7vRywM6I2UdcTwkBzR69N
         ceyEEb6tmxKS021f7woeMKAaGf0j+cQKekNP53yXW+8MibGCX/oGtVWS0D8rD3Hly7Xq
         aF5pRCT78bxg8k5RhumceMIIHBoqDohz26jVs87IvcxUMwPl2HkP0nBk4g0ZkB0e0Rgn
         020JWQg1S0TuEzZkBnHSveomPKdCKSsDYaP5kM/VyIApsaPh4LK22AHFkALmOsXLmxG4
         cQdaBEm5zoW0WuCYnmZjD6QLMcffAEFn9J24dEleUY15yTanrNSASC6Qj1Xe9nZEjmq/
         cyPw==
X-Gm-Message-State: AO0yUKU/Lxi2pWZn84ezGUPkEUNM/D+jXggmauZVtQaNfIadb9zjTHsi
        7wbS9IHXYmY894+KotoZAez2/iBrdJPAT4GVlXM8XSzdnXbtGH7MooObZobayU+NJPnuE5VIshN
        t1zRInk2YbIvKJ2kP2mCVrOnKjqRLG6eP9A==
X-Received: by 2002:a17:906:fe4c:b0:931:b34:4172 with SMTP id wz12-20020a170906fe4c00b009310b344172mr795042ejb.3.1678969933040;
        Thu, 16 Mar 2023 05:32:13 -0700 (PDT)
X-Google-Smtp-Source: AK7set82UbGNf5lkDeCwEUmEflsbWOaHwTOJQtteFuRMcgbvS+4pyZ9SMNoRaKN/6azprBymMAoGaQ==
X-Received: by 2002:a17:906:fe4c:b0:931:b34:4172 with SMTP id wz12-20020a170906fe4c00b009310b344172mr795017ejb.3.1678969932735;
        Thu, 16 Mar 2023 05:32:12 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id hb12-20020a170907160c00b008d9ddd2da88sm3797911ejc.6.2023.03.16.05.32.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Mar 2023 05:32:12 -0700 (PDT)
Message-ID: <6b8d44ef-d693-9af5-29ce-746f5cb2d1d7@redhat.com>
Date:   Thu, 16 Mar 2023 13:32:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [bug report] platform/x86: apple-gmux: Add
 acpi_video_get_backlight_type() check
Content-Language: en-US, nl
To:     Dan Carpenter <error27@gmail.com>
Cc:     platform-driver-x86@vger.kernel.org
References: <26580467-902b-4e0a-bbf6-68d7b0b7fc6d@kili.mountain>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <26580467-902b-4e0a-bbf6-68d7b0b7fc6d@kili.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/10/23 12:54, Dan Carpenter wrote:
> Hello Hans de Goede,
> 
> The patch 315e560c1526: "platform/x86: apple-gmux: Add
> acpi_video_get_backlight_type() check" from Mar 7, 2023, leads to the
> following Smatch static checker warning:
> 
> 	drivers/platform/x86/apple-gmux.c:974 gmux_probe()
> 	error: uninitialized symbol 'bdev'.

Thank you for reporting this.

Since I had to rebase anyway I have squashed a fix into the orginal commit (initialize bdev to NULL, backlight_device_unregister() can handle NULL).

Regards,

Hans



> 
> drivers/platform/x86/apple-gmux.c
>     780 static int gmux_probe(struct pnp_dev *pnp, const struct pnp_device_id *id)
>     781 {
>     782         struct apple_gmux_data *gmux_data;
>     783         struct resource *res;
>     784         struct backlight_properties props;
>     785         struct backlight_device *bdev;
>     786         u8 ver_major, ver_minor, ver_release;
>     787         bool register_bdev = true;
>     788         int ret = -ENXIO;
>     789         acpi_status status;
>     790         unsigned long long gpe;
>     791         enum apple_gmux_type type;
>     792         u32 version;
>     793 
>     794         if (apple_gmux_data)
>     795                 return -EBUSY;
>     796 
>     797         if (!apple_gmux_detect(pnp, &type)) {
>     798                 pr_info("gmux device not present\n");
>     799                 return -ENODEV;
>     800         }
>     801 
>     802         gmux_data = kzalloc(sizeof(*gmux_data), GFP_KERNEL);
>     803         if (!gmux_data)
>     804                 return -ENOMEM;
>     805         pnp_set_drvdata(pnp, gmux_data);
>     806 
>     807         switch (type) {
>     808         case APPLE_GMUX_TYPE_MMIO:
>     809                 gmux_data->config = &apple_gmux_mmio;
>     810                 mutex_init(&gmux_data->index_lock);
>     811 
>     812                 res = pnp_get_resource(pnp, IORESOURCE_MEM, 0);
>     813                 gmux_data->iostart = res->start;
>     814                 /* Although the ACPI table only allocates 8 bytes, we need 16. */
>     815                 gmux_data->iolen = 16;
>     816                 if (!request_mem_region(gmux_data->iostart, gmux_data->iolen,
>     817                                         "Apple gmux")) {
>     818                         pr_err("gmux I/O already in use\n");
>     819                         goto err_free;
>     820                 }
>     821                 gmux_data->iomem_base = ioremap(gmux_data->iostart, gmux_data->iolen);
>     822                 if (!gmux_data->iomem_base) {
>     823                         pr_err("couldn't remap gmux mmio region");
>     824                         goto err_release;
>     825                 }
>     826                 goto get_version;
>     827         case APPLE_GMUX_TYPE_INDEXED:
>     828                 gmux_data->config = &apple_gmux_index;
>     829                 mutex_init(&gmux_data->index_lock);
>     830                 break;
>     831         case APPLE_GMUX_TYPE_PIO:
>     832                 gmux_data->config = &apple_gmux_pio;
>     833                 break;
>     834         }
>     835 
>     836         res = pnp_get_resource(pnp, IORESOURCE_IO, 0);
>     837         gmux_data->iostart = res->start;
>     838         gmux_data->iolen = resource_size(res);
>     839 
>     840         if (!request_region(gmux_data->iostart, gmux_data->iolen,
>     841                             "Apple gmux")) {
>     842                 pr_err("gmux I/O already in use\n");
>     843                 goto err_free;
>     844         }
>     845 
>     846 get_version:
>     847         if (gmux_data->config->read_version_as_u32) {
>     848                 version = gmux_read32(gmux_data, GMUX_PORT_VERSION_MAJOR);
>     849                 ver_major = (version >> 24) & 0xff;
>     850                 ver_minor = (version >> 16) & 0xff;
>     851                 ver_release = (version >> 8) & 0xff;
>     852         } else {
>     853                 ver_major = gmux_read8(gmux_data, GMUX_PORT_VERSION_MAJOR);
>     854                 ver_minor = gmux_read8(gmux_data, GMUX_PORT_VERSION_MINOR);
>     855                 ver_release = gmux_read8(gmux_data, GMUX_PORT_VERSION_RELEASE);
>     856         }
>     857         pr_info("Found gmux version %d.%d.%d [%s]\n", ver_major, ver_minor,
>     858                 ver_release, gmux_data->config->name);
>     859 
>     860         memset(&props, 0, sizeof(props));
>     861         props.type = BACKLIGHT_PLATFORM;
>     862         props.max_brightness = gmux_read32(gmux_data, GMUX_PORT_MAX_BRIGHTNESS);
>     863 
>     864 #if IS_REACHABLE(CONFIG_ACPI_VIDEO)
>     865         register_bdev = acpi_video_get_backlight_type() == acpi_backlight_apple_gmux;
>     866 #endif
>     867         if (register_bdev) {
>     868                 /*
>     869                  * Currently it's assumed that the maximum brightness is less than
>     870                  * 2^24 for compatibility with old gmux versions. Cap the max
>     871                  * brightness at this value, but print a warning if the hardware
>     872                  * reports something higher so that it can be fixed.
>     873                  */
>     874                 if (WARN_ON(props.max_brightness > GMUX_MAX_BRIGHTNESS))
>     875                         props.max_brightness = GMUX_MAX_BRIGHTNESS;
>     876 
>     877                 bdev = backlight_device_register("gmux_backlight", &pnp->dev,
>     878                                                  gmux_data, &gmux_bl_ops, &props);
>     879                 if (IS_ERR(bdev)) {
>     880                         ret = PTR_ERR(bdev);
>     881                         goto err_unmap;
>     882                 }
>     883 
>     884                 gmux_data->bdev = bdev;
>     885                 bdev->props.brightness = gmux_get_brightness(bdev);
>     886                 backlight_update_status(bdev);
>     887 
>     888                 /*
>     889                  * The backlight situation on Macs is complicated. If the gmux is
>     890                  * present it's the best choice, because it always works for
>     891                  * backlight control and supports more levels than other options.
>     892                  * Disable the other backlight choices.
>     893                  */
>     894                 apple_bl_unregister();
>     895         }
> 
> bdev isn't initialized on the error path.
> 
>     896 
>     897         gmux_data->power_state = VGA_SWITCHEROO_ON;
>     898 
>     899         gmux_data->dhandle = ACPI_HANDLE(&pnp->dev);
>     900         if (!gmux_data->dhandle) {
>     901                 pr_err("Cannot find acpi handle for pnp device %s\n",
>     902                        dev_name(&pnp->dev));
>     903                 ret = -ENODEV;
>     904                 goto err_notify;
>     905         }
>     906 
>     907         status = acpi_evaluate_integer(gmux_data->dhandle, "GMGP", NULL, &gpe);
>     908         if (ACPI_SUCCESS(status)) {
>     909                 gmux_data->gpe = (int)gpe;
>     910 
>     911                 status = acpi_install_notify_handler(gmux_data->dhandle,
>     912                                                      ACPI_DEVICE_NOTIFY,
>     913                                                      &gmux_notify_handler, pnp);
>     914                 if (ACPI_FAILURE(status)) {
>     915                         pr_err("Install notify handler failed: %s\n",
>     916                                acpi_format_exception(status));
>     917                         ret = -ENODEV;
>     918                         goto err_notify;
>     919                 }
>     920 
>     921                 status = acpi_enable_gpe(NULL, gmux_data->gpe);
>     922                 if (ACPI_FAILURE(status)) {
>     923                         pr_err("Cannot enable gpe: %s\n",
>     924                                acpi_format_exception(status));
>     925                         goto err_enable_gpe;
>     926                 }
>     927         } else {
>     928                 pr_warn("No GPE found for gmux\n");
>     929                 gmux_data->gpe = -1;
>     930         }
>     931 
>     932         /*
>     933          * If Thunderbolt is present, the external DP port is not fully
>     934          * switchable. Force its AUX channel to the discrete GPU.
>     935          */
>     936         gmux_data->external_switchable =
>     937                 !bus_for_each_dev(&pci_bus_type, NULL, NULL, is_thunderbolt);
>     938         if (!gmux_data->external_switchable)
>     939                 gmux_write8(gmux_data, GMUX_PORT_SWITCH_EXTERNAL, 3);
>     940 
>     941         apple_gmux_data = gmux_data;
>     942         init_completion(&gmux_data->powerchange_done);
>     943         gmux_enable_interrupts(gmux_data);
>     944         gmux_read_switch_state(gmux_data);
>     945 
>     946         /*
>     947          * Retina MacBook Pros cannot switch the panel's AUX separately
>     948          * and need eDP pre-calibration. They are distinguishable from
>     949          * pre-retinas by having an "indexed" or "T2" gmux.
>     950          *
>     951          * Pre-retina MacBook Pros can switch the panel's DDC separately.
>     952          */
>     953         ret = vga_switcheroo_register_handler(gmux_data->config->gmux_handler,
>     954                         gmux_data->config->handler_flags);
>     955         if (ret) {
>     956                 pr_err("Failed to register vga_switcheroo handler\n");
>     957                 goto err_register_handler;
>     958         }
>     959 
>     960         gmux_init_debugfs(gmux_data);
>     961         return 0;
>     962 
>     963 err_register_handler:
>     964         gmux_disable_interrupts(gmux_data);
>     965         apple_gmux_data = NULL;
>     966         if (gmux_data->gpe >= 0)
>     967                 acpi_disable_gpe(NULL, gmux_data->gpe);
>     968 err_enable_gpe:
>     969         if (gmux_data->gpe >= 0)
>     970                 acpi_remove_notify_handler(gmux_data->dhandle,
>     971                                            ACPI_DEVICE_NOTIFY,
>     972                                            &gmux_notify_handler);
>     973 err_notify:
> --> 974         backlight_device_unregister(bdev);
>                                             ^^^^
>     975 err_unmap:
>     976         if (gmux_data->iomem_base)
>     977                 iounmap(gmux_data->iomem_base);
>     978 err_release:
>     979         if (gmux_data->config->resource_type == IORESOURCE_MEM)
>     980                 release_mem_region(gmux_data->iostart, gmux_data->iolen);
>     981         else
>     982                 release_region(gmux_data->iostart, gmux_data->iolen);
>     983 err_free:
>     984         kfree(gmux_data);
>     985         return ret;
>     986 }
> 
> regards,
> dan carpenter
> 


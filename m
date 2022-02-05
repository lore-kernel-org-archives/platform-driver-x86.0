Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C556BC433F5
	for <platform-driver-x86@archiver.kernel.org>; Sat,  5 Feb 2022 20:42:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242000AbiBEUm3 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 5 Feb 2022 15:42:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232067AbiBEUm2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 5 Feb 2022 15:42:28 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A2C3C061348
        for <platform-driver-x86@vger.kernel.org>; Sat,  5 Feb 2022 12:42:26 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id y3so9294526ejf.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 05 Feb 2022 12:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eveK/DheJYtfO16iJrLvC34BOnAiluCoPRkWLTo9HOY=;
        b=qTi0UKaSFcpWUB8po93AaWapBFPkDnXQ+YxlDpeODmBsuHg/NguhwAWqRXRuddOAo3
         dVKuHqkupmLbtOYOpvHeVtzsoUsiNVPvgTxMYlZ1IJLO61xmwGNEWa40kRovjT64/5oK
         fmYN80JxFFw344OX/qRto+OXojdal70279mP/LOxeZyG+0X8mTKH+SEVOv+qCbm1mjhG
         /aPGA/47bDRWojKkGiycNvgAThOutG4owDukMaT+nw0Lt4Yg2sMO+Rw7jF22oiykzd8D
         wetKFFh8ik0L9IpGMXg/FZFsUyFeQL0pkgtvTis8XxdHkRe3pjGjpFpJl2mp2Au43kzM
         M09A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eveK/DheJYtfO16iJrLvC34BOnAiluCoPRkWLTo9HOY=;
        b=PznpzlV/JZi24QJ7ZXUSyHbyVXGr5RyPUe8xfcoJHqtr2RY6N7DKCCf8owrnM3nx4s
         eD5FJ2ODoUYRNwQPP3UsnNUqrimfPJbAV2CcNV7We6Fw4u3aFQqIeHf50ZeD5rFt5sKt
         nvCj3TJ1lbk32Dwe6wtC+1GiakoFjXP1mySNnvbCbbhsk2TpVxtJfQZmS/xjdANZh59j
         e6dRvEJb3RIWg6znZd3Nl2/IDX/dL0fR6bdfu3tk532YmsdkVxhYEActXtNBQiM7qcAm
         SWN5SJHxSknJ/Iv6FXMkAtC9x/MtEpPQN1hmmHT+Geyzsju00y+kA3nA77c1z3fMGwhA
         LxTA==
X-Gm-Message-State: AOAM530oqppA+1ZHcrG6y5+Lee6OeAQM2KqRN4MwHP9LhvlxwZfkSL/r
        V1S4h7EGEX0UPj4Yp4JThS+aV67mm49f9EVLB74=
X-Google-Smtp-Source: ABdhPJyVY2kztAvaZrd4FmgYQwzcZkK9M2AFr4onKLUf2KF9oMpGSnzlwi2ywCKHUBgTjtrFTzFMew/WnVhj1T6r11U=
X-Received: by 2002:a17:906:c14d:: with SMTP id dp13mr4409603ejc.132.1644093744635;
 Sat, 05 Feb 2022 12:42:24 -0800 (PST)
MIME-Version: 1.0
References: <20220205191356.225505-1-hdegoede@redhat.com>
In-Reply-To: <20220205191356.225505-1-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 5 Feb 2022 22:41:48 +0200
Message-ID: <CAHp75Vep66axJzXAdBQa4qzxRZG-Nzf=YeVSZHAg7enkwDLTAw@mail.gmail.com>
Subject: Re: [PATCH 1/6] platform/x86: x86-android-tablets: Add battery swnode support
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Sat, Feb 5, 2022 at 9:14 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> power_supply_get_battery_info() which is used by charger and fuel-gauge
> drivers on x86-android-tablets, expects the battery properties to be
> described in a stand-alone battery fwnode which is then referenced
> from both the charger and fuel-gauge device's fwnodes.
>
> Add support for registering + unregistering a swnode for this.

All non-commented looks good to me,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/x86-android-tablets.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/platform/x86/x86-android-tablets.c b/drivers/platform/x86/x86-android-tablets.c
> index 3120acf9837c..80d113c41623 100644
> --- a/drivers/platform/x86/x86-android-tablets.c
> +++ b/drivers/platform/x86/x86-android-tablets.c
> @@ -146,6 +146,7 @@ struct x86_serdev_info {
>  struct x86_dev_info {
>         char *invalid_aei_gpiochip;
>         const char * const *modules;
> +       const struct software_node *bat_swnode;
>         struct gpiod_lookup_table * const *gpiod_lookup_tables;
>         const struct x86_i2c_client_info *i2c_client_info;
>         const struct platform_device_info *pdev_info;
> @@ -727,6 +728,7 @@ static struct i2c_client **i2c_clients;
>  static struct platform_device **pdevs;
>  static struct serdev_device **serdevs;
>  static struct gpiod_lookup_table * const *gpiod_lookup_tables;
> +static const struct software_node *bat_swnode;
>  static void (*exit_handler)(void);
>
>  static __init int x86_instantiate_i2c_client(const struct x86_dev_info *dev_info,
> @@ -850,6 +852,8 @@ static void x86_android_tablet_cleanup(void)
>
>         for (i = 0; gpiod_lookup_tables && gpiod_lookup_tables[i]; i++)
>                 gpiod_remove_lookup_table(gpiod_lookup_tables[i]);
> +
> +       software_node_unregister(bat_swnode);
>  }
>
>  static __init int x86_android_tablet_init(void)
> @@ -886,6 +890,13 @@ static __init int x86_android_tablet_init(void)
>         for (i = 0; dev_info->modules && dev_info->modules[i]; i++)
>                 request_module(dev_info->modules[i]);
>
> +       bat_swnode = dev_info->bat_swnode;
> +       if (bat_swnode) {
> +               ret = software_node_register(bat_swnode);
> +               if (ret)
> +                       return ret;
> +       }
> +
>         gpiod_lookup_tables = dev_info->gpiod_lookup_tables;
>         for (i = 0; gpiod_lookup_tables && gpiod_lookup_tables[i]; i++)
>                 gpiod_add_lookup_table(gpiod_lookup_tables[i]);
> --
> 2.33.1
>


-- 
With Best Regards,
Andy Shevchenko

Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F56DC433F5
	for <platform-driver-x86@archiver.kernel.org>; Sat,  5 Feb 2022 20:41:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241194AbiBEUl2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 5 Feb 2022 15:41:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232067AbiBEUl1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 5 Feb 2022 15:41:27 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7B84C061348
        for <platform-driver-x86@vger.kernel.org>; Sat,  5 Feb 2022 12:41:25 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id m11so20970944edi.13
        for <platform-driver-x86@vger.kernel.org>; Sat, 05 Feb 2022 12:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tJ/9YaKYjvHyjrWV2KRzAX+Ux9jmjiv5ci7Jw7hnqQo=;
        b=NIjXqXI8IBXFSmpGOLbgYLz7Dt+vaiIjzxaPk97GgrARh10MQ7OFnlmk2iNpR4Onac
         zbNus3WfEMrKyzR2KApHSDQIyIJLYqzH2m2FdC6BwjiBJnM9NUDTBzOr6vIUxdUH9BH1
         KQncthevC5h5bSWou9xbKnTT5ludyaC+thhgr/LQmrPyUwDH0yzyUb+lrTUZ6kSF+6TF
         2zBcYrh1k4t7ZD3HyTyjF1CkJzPFnJgsl6yUw5uB48wx4olBIHByLGttFW2PO9pmTZJf
         GEhjuV6SwXYQYny1Boxu4BFs1HfmqHKVkfAeYDoWzBsZ7vn/c51rs2Uyu69UA4nZA+Pu
         1YSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tJ/9YaKYjvHyjrWV2KRzAX+Ux9jmjiv5ci7Jw7hnqQo=;
        b=n6ncojjKFF+HuBm3ClwMK0ZrQj+AS+HxRf6XSQ8wGDa+l2kLoY3IcDPsoUPUqBT5dL
         Yy3UQuxjqaSbLIWBvuJCrrP5PXhsJ/QKXg0akT1zR4g2Op06itTVwPOrriRM8VzTmBnd
         E+WOXLm9bRxI8VltxB7hETZv4karpIvsn+Gvr0MZNpviVfoxeTmwVzWIsTObT7AUz3vq
         tCurfdVmSB/cLDiOhZUrvfYwvqc9p81tSpxAJRocVDi/eA8fSUZhoQuaG2KlGCIhLoKB
         1rhQMmiqz6RQxWEUwKkFKPM1fRRG/YsnLAR3I4P3/CawABsj3vKMPEe2WOclVshEd4LL
         ygsg==
X-Gm-Message-State: AOAM532P175s0Ry7EIdM37SPI7r9ePhkK5toZym+qBq9fJ4o+HiyVL8m
        ZgXO+aVe2K9pf6zZnCkyOAl8uIhubd8A33arapcuvMtU+Ao=
X-Google-Smtp-Source: ABdhPJwUvNZXvpv8KZWANqPIo/HZO0uP9JwU/OJ1Do6y48Ek3b/I8iN0lwbbb+x5B+5CAE0BT84GyD4HGHsFnEtpk7o=
X-Received: by 2002:a05:6402:424e:: with SMTP id g14mr6210874edb.281.1644093684015;
 Sat, 05 Feb 2022 12:41:24 -0800 (PST)
MIME-Version: 1.0
References: <20220205191356.225505-1-hdegoede@redhat.com> <20220205191356.225505-4-hdegoede@redhat.com>
In-Reply-To: <20220205191356.225505-4-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 5 Feb 2022 22:40:47 +0200
Message-ID: <CAHp75VcBNentfYMymyCnCav-NGK+DrDzTG3Mf973ERXpyvT2uQ@mail.gmail.com>
Subject: Re: [PATCH 4/6] platform/x86: x86-android-tablets: Add lid-switch
 gpio-keys pdev to Asus ME176C + TF103C
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
> The Asus ME176C + TF103C both have a lid-switch (for a cover in the ME176C
> case), add a gpio-keys platform-device and platform-data describing the
> lid-switch on both.

USB ID change is not described here.

...

 +/* Asus ME176C and TF103C tablets shared data */
> +static struct gpio_keys_button asus_me176c_tf103c_lid = {
> +       .code = SW_LID,

> +       /* .gpio gets filled in by asus_me176c_tf103c_init() */

I'm wondering if we can switch gpio_keys*.c drivers to accept GPIO
descriptor directly.

> +       .active_low = true,
> +       .desc = "lid_sw",
> +       .type = EV_SW,
> +       .wakeup = true,
> +       .debounce_interval = 50,
> +};


-- 
With Best Regards,
Andy Shevchenko

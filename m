Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF2B9C433F5
	for <platform-driver-x86@archiver.kernel.org>; Fri,  7 Jan 2022 19:05:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229532AbiAGTFZ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 7 Jan 2022 14:05:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232022AbiAGTFW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 7 Jan 2022 14:05:22 -0500
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B880BC06173E
        for <platform-driver-x86@vger.kernel.org>; Fri,  7 Jan 2022 11:05:22 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id v11so5914019pfu.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 07 Jan 2022 11:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+S72sOYOwXg9RPix1lZvjtLtkj3XFLsZ4gEDpSvt8vs=;
        b=UNlRvA2ZuRZGr24qbY8d8HRyinc6EpOYSKt7DfYa7U+pylhqD10egaBHZVcWbFvg+d
         HZZoCKimfsUYVZ6hLdx9fE8635nsrgDrj+L00L/QA/Cjac6/OItLx2Gm1LMQY7kdBjlm
         gUl11sQ+hRSXhsijE3Lz0JsafCc/WMzMcjN+p2ZjS7WJkqTYR8lO8OzMXzBLllf3FZN8
         6SuFHJFHb0+VTxIFi9KbZl/oUBDvS7ua7q/kqOUOmGT9RC+dhhVS1J2U1EpVpDJqJhew
         Efg7LRldeNgMVDWyPjGhSj7BNZ5UuIesQ0y/zYKcFCgYdMO4ccJ3NrTfKraxrHj6N1TQ
         QivQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+S72sOYOwXg9RPix1lZvjtLtkj3XFLsZ4gEDpSvt8vs=;
        b=YlviZcmomDLLMP49KU9CTpV3+hU04+5dg0KZ5c4v2WJQYY4B97+teJIHdqTLMvMhUW
         riOi+YTL9g2fCCiNpjCddFHHufszq3vUZB0A/3UssAi1VsYy+WEhTlXiTqS68JI78oIO
         E54RJ9GrcbljlzhdSRF2cXkdD+YITLVwlIE2xUvQm9Du7K0g/ukX5lQqfwQfo5E8ETZ/
         +lETAj/W3P0YIuZFvwiMspWQchVl672BwpYhf8NobUHeKcQD+mBPnebyxm7mQ9fvrL3E
         Ly9Ez09ZlEXbO6cLfRJWsjDa6E+js/piETuOkDswsybmqr0tixz6BnXN4iPmmkboK/ql
         lnLQ==
X-Gm-Message-State: AOAM532ehdzKvzfOPLl0JZi4kSpjZTT4zOezPR/cJDzGUBY0KGB55Ps7
        7auA51Ussgiuw4wue2YomweLmpx0Pnux+d3JRtqobQ==
X-Google-Smtp-Source: ABdhPJybEblBw8MdINxXy3+9JK7qlDbdUwo1shN48fzEsrE5iAHxprn/bdZ6bdR1DoPb8Rx12GSfNjxZRna6xpg2RNM=
X-Received: by 2002:a05:6a00:1249:b0:4bb:4a31:1e0a with SMTP id
 u9-20020a056a00124900b004bb4a311e0amr65535466pfi.81.1641582321973; Fri, 07
 Jan 2022 11:05:21 -0800 (PST)
MIME-Version: 1.0
References: <20211222001127.3337471-1-rajatja@google.com> <20211222001127.3337471-2-rajatja@google.com>
 <Ydh7u1kuXSMzwmW0@google.com>
In-Reply-To: <Ydh7u1kuXSMzwmW0@google.com>
From:   Rajat Jain <rajatja@google.com>
Date:   Fri, 7 Jan 2022 11:04:46 -0800
Message-ID: <CACK8Z6HbKR5QktJjK1+QCKoLCJUHK8btQN5Xbij8A66VYzhcHw@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] platform/chrome: Add driver for ChromeOS privacy-screen
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Hans de Goede <hdegoede@redhat.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Benson Leung <bleung@chromium.org>,
        Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
        Mark Gross <markgross@kernel.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, gwendal@google.com,
        seanpaul@google.com, marcheu@google.com, rajatxjain@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Dmitry, Benson,

On Fri, Jan 7, 2022 at 9:43 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi Rajat,
>
> On Tue, Dec 21, 2021 at 04:11:26PM -0800, Rajat Jain wrote:
> > +static int chromeos_privacy_screen_remove(struct acpi_device *adev)
> > +{
> > +     struct drm_privacy_screen *drm_privacy_screen = acpi_driver_data(adev);
>
> Please add an empty line here:
>
> WARNING: Missing a blank line after declarations
> #292: FILE: drivers/platform/chrome/chromeos_privacy_screen.c:129:
> +       struct drm_privacy_screen *drm_privacy_screen = acpi_driver_data(adev);
> +       drm_privacy_screen_unregister(drm_privacy_screen);
>
> > +     drm_privacy_screen_unregister(drm_privacy_screen);
> > +     return 0;
> > +}
> > +
> > +static const struct acpi_device_id chromeos_privacy_screen_device_ids[] = {
> > +     {"GOOG0010", 0}, /* Google's electronic privacy screen for eDP-1 */
> > +     {}
> > +};
> > +MODULE_DEVICE_TABLE(acpi, chromeos_privacy_screen_device_ids);
> > +
> > +static struct acpi_driver chromeos_privacy_screen_driver = {
> > +     .name = "chromeos_privacy_screen_drvr",
>
> Could I buy 2 move vowels? ;)
>
> > +     .class = "ChromeOS",
> > +     .ids = chromeos_privacy_screen_device_ids,
> > +     .ops = {
> > +             .add = chromeos_privacy_screen_add,
> > +             .remove = chromeos_privacy_screen_remove,
> > +     },
> > +};
> > +
> > +module_acpi_driver(chromeos_privacy_screen_driver);
> > +MODULE_LICENSE("GPL v2");
> > +MODULE_DESCRIPTION("ChromeOS ACPI Privacy Screen driver");
> > +MODULE_AUTHOR("Rajat Jain <rajatja@google.com>");
>
> Otherwise
>
> Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks! I took care of your comments and posted a v5:
https://patchwork.kernel.org/project/platform-driver-x86/patch/20220107190208.95479-2-rajatja@google.com/

Thanks & Best Regards,

Rajat


>
> Thanks.
>
> --
> Dmitry

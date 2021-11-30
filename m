Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41149C4332F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 30 Nov 2021 15:04:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233645AbhK3PHT (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 30 Nov 2021 10:07:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244743AbhK3PCl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 30 Nov 2021 10:02:41 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6D6CC08EA4E
        for <platform-driver-x86@vger.kernel.org>; Tue, 30 Nov 2021 06:53:56 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id r25so22484831edq.7
        for <platform-driver-x86@vger.kernel.org>; Tue, 30 Nov 2021 06:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LSoUEPfZWo9iRX2Mz1XAPI/SsoWmN/IZhzfNigK/dPQ=;
        b=Ju9q7YkAABm4nDPXHhodnwR5GxgFmycUnAOWfBaaPAWDp58Quq0X37RBiKQT9URZqL
         SIv2zi1XZtegXpokh+E+qJ7rQXvmInPQ9eEWhs7BE0Zg9RxUvhkZV278jYBbR4sMuIdU
         ResQA0jIrg1IMNZne+sCqeAmleOuaPfo4Yv14qislBsELjJ6UxRiJtcMDOBZMSLtSpUh
         iaihYJAAV6B2sQ6su7nT5vK0gBcjXIm/G+E+3jNOjvm1ENcZ2+HS2IdVoxp6p59M2JAB
         dGJL9lm2Cf8X30H4+44mdTt6ilR2PDOzYBbtPAixUNs7UQw3kYxyPO5ZW40wvfRH4w97
         NVFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LSoUEPfZWo9iRX2Mz1XAPI/SsoWmN/IZhzfNigK/dPQ=;
        b=x1U4XEDJlcbwsWEuhtNU+swdkxQwYsyA1HYtxuQ7fSIcbiF0c32/B9+gimtqGs8Z2m
         dsoQwDwSMpg8mB8hE0DIk8SZWo2DvNTxTwsXW80WqA5tkEKD3dNdJR1dvJw6JRgHGudJ
         xSRNHXNp/+2NdJ0TIuukAFHaOeM3/GUpVUkERYme8pj6Vyo+Pitla6I9X1GBcridtUKB
         SmoQ1yom0DUI8Gbo7LOvIwegHbQLztFxM4LrA5w3YtcziALhxVpC7bActstItUqBpHvw
         mHWSbsZCcF7EfWW+O5jwD/nQkdYs1RHIvwyPdAQu8f6+MczorRpWkcz/kdp+h06b/zYy
         kqCQ==
X-Gm-Message-State: AOAM530mPWtZsEzle+cC8/w3z0tr1qd2DbsWASsfN2TO8xJj3f9F4io+
        MiN+h/QcsLBmcpfQanuR0o4vom3l5DJYAvhxQAY=
X-Google-Smtp-Source: ABdhPJxJfgg1dcywtP0a8F/gjl3In/mwAZJ8sFRQEPuSmfXPqIBForpb5959rPU1sQo+iIABnBUq7B97sD5JS9UgF0o=
X-Received: by 2002:a50:c35b:: with SMTP id q27mr5519839edb.154.1638284033966;
 Tue, 30 Nov 2021 06:53:53 -0800 (PST)
MIME-Version: 1.0
References: <20211128190031.405620-1-hdegoede@redhat.com>
In-Reply-To: <20211128190031.405620-1-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 30 Nov 2021 16:52:16 +0200
Message-ID: <CAHp75VeCy1_oGu-TTmdadzek69UFq=NbkEn_jXA9Ps0oWi33vg@mail.gmail.com>
Subject: Re: [PATCH 1/5] platform/x86: wmi: Replace read_takes_no_args with a
 flags field
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Yauhen Kharuzhy <jekhor@gmail.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Sun, Nov 28, 2021 at 9:00 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Replace the wmi_block.read_takes_no_args bool field with
> an unsigned long flags field, used together with test_bit()
> and friends.
>
> This is a preparation patch for fixing a driver->notify() vs ->probe()
> race, which requires atomic flag handling.

For patches 1,2,3 and 5 (after addressing minor spelling issues) are fine to me,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>


> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/wmi.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
> index c34341f4da76..46178e03aeca 100644
> --- a/drivers/platform/x86/wmi.c
> +++ b/drivers/platform/x86/wmi.c
> @@ -57,6 +57,10 @@ static_assert(sizeof(typeof_member(struct guid_block, guid)) == 16);
>  static_assert(sizeof(struct guid_block) == 20);
>  static_assert(__alignof__(struct guid_block) == 1);
>
> +enum { /* wmi_block flags */
> +       WMI_READ_TAKES_NO_ARGS,
> +};
> +
>  struct wmi_block {
>         struct wmi_device dev;
>         struct list_head list;
> @@ -67,8 +71,7 @@ struct wmi_block {
>         wmi_notify_handler handler;
>         void *handler_data;
>         u64 req_buf_size;
> -
> -       bool read_takes_no_args;
> +       unsigned long flags;
>  };
>
>
> @@ -367,7 +370,7 @@ static acpi_status __query_block(struct wmi_block *wblock, u8 instance,
>         wq_params[0].type = ACPI_TYPE_INTEGER;
>         wq_params[0].integer.value = instance;
>
> -       if (instance == 0 && wblock->read_takes_no_args)
> +       if (instance == 0 && test_bit(WMI_READ_TAKES_NO_ARGS, &wblock->flags))
>                 input.count = 0;
>
>         /*
> @@ -1113,7 +1116,7 @@ static int wmi_create_device(struct device *wmi_bus_dev,
>          * laptops, WQxx may not be a method at all.)
>          */
>         if (info->type != ACPI_TYPE_METHOD || info->param_count == 0)
> -               wblock->read_takes_no_args = true;
> +               set_bit(WMI_READ_TAKES_NO_ARGS, &wblock->flags);
>
>         kfree(info);
>
> --
> 2.33.1
>


--
With Best Regards,
Andy Shevchenko

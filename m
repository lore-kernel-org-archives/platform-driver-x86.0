Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA531C4361B
	for <platform-driver-x86@archiver.kernel.org>; Mon,  7 Dec 2020 17:01:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BD1BD23884
	for <platform-driver-x86@archiver.kernel.org>; Mon,  7 Dec 2020 17:01:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727412AbgLGRBK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 7 Dec 2020 12:01:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727274AbgLGRBK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 7 Dec 2020 12:01:10 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C88A7C061793
        for <platform-driver-x86@vger.kernel.org>; Mon,  7 Dec 2020 09:00:29 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id y17so4040616wrr.10
        for <platform-driver-x86@vger.kernel.org>; Mon, 07 Dec 2020 09:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vzGOzPfD/JaYCYoIC9cA0/eYK2pCmtSoBZFyQ+NjR64=;
        b=TCIza82zBYdyA7jhBvdBZG14nnmdv5AgFTUH78VfC0VOXir7iHMGfNCvpu+X66rbEb
         bkFUOlsgNiR47x45E8E6A5S+jF/a6KrLEXY+vbtopqUoNf0RJnTjHIaxisbY7qwUAGki
         0gSRQUfRuOjoEvxdMWkCFdljbH/oV2JaYTZC3eXSWiIyn+wo+PLN79gDIISEboXPYxQ4
         Le0l2PBhXAKkc191eaF+ouF7PjP98OphkWwayLT7u2046P43MB+95Cz/PfKyijwVQnF+
         0ibccYxy/5A7sSR+tB2ZsnNWRPunahxlvM+S362gAS6tMcC7TF+EyfI0foPMhV3igVB1
         GEYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vzGOzPfD/JaYCYoIC9cA0/eYK2pCmtSoBZFyQ+NjR64=;
        b=Z5B26Yl6U6RPkyXB2uq6tOkmWlJAaNY70bpYdag9EskHD8xvaYkBDXpPe/E2fbyTUf
         cTrRyNor/VpUopr2IzRI+EfFbpEJZbYzXs2l9DnBTKbOBKLWjRuH7Rwm9EhtKnCnd2WX
         D+9aM4MLdCSbts2o5Hta5CZ1vQSdge23fVzhRWPcEtWd6rifESN30pYqkJNDXMIJDLof
         4Bh9oZIILnpExsDdqnzCblw2Kp3YhrHLCaW39LS5C6vM7/E/ctiKPx9c9l3BWaL1lrat
         ptPps532AEvNywQq6cK5pFoqUViXMVQzVtTMhZLREiaJX6tIJRDlCJ4lS+eUIPfzedDv
         VPaw==
X-Gm-Message-State: AOAM531e+VaqQvV8FfCBVWRb4RTpSLDzW4q90u2+btQp0aNXS1WOO1hH
        X/ItNaFsgPEMHZwVf4gwOI1xOfdJ9HiB+mTBouA=
X-Google-Smtp-Source: ABdhPJzUBAGwB8U3e9x2VfQfC8ydUvDc/wCcxiy9suoDLuZJtcmykJ8DaWjG+kanr9NJoAJU2JH6zK2fevqjkA8wYJE=
X-Received: by 2002:a5d:474f:: with SMTP id o15mr21094887wrs.100.1607360428439;
 Mon, 07 Dec 2020 09:00:28 -0800 (PST)
MIME-Version: 1.0
References: <20201207165129.396298-1-hdegoede@redhat.com>
In-Reply-To: <20201207165129.396298-1-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 7 Dec 2020 19:01:16 +0200
Message-ID: <CAHp75VdM=3JthfWLqrFtcEfcvRAYBit6NungzOdQ8gMkEq1YQA@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: intel-hid: Do not create SW_TABLET_MODE
 input-dev when a KIOX010A ACPI dev is present
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Elia Devito <eliadevito@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Dec 7, 2020 at 6:51 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Some 360 degree hinges (yoga) style 2-in-1 devices use 2 accelerometers

Yoga

> to allow the OS to determine the angle between the display and the base
> of the device. On Windows these are read by a special HingeAngleService
> process which calls an ACPI DSM (Device Specific Method) on the

_DSM

> ACPI KIOX010A device node for the sensor in the display, to let the
> firmware know if the 2-in-1 is in tablet- or laptop-mode so that it can
> disable the kbd and touchpad to avoid spurious input in tablet-mode.

keyboard

> The linux kxcjk1013 driver calls the DSM for this once at probe time

Perhaps similar way as above: On Linux the ...

(Note 'Linux' with capital letter)

_DSM

> to ensure that the builtin kbd and touchpad work. On some devices this

keyboard

> causes a "spurious" 0xcd event on the intel-hid ACPI dev. In this case

device

> there is not a functional tablet-mode switch, so we should not register
> the tablet-mode switch device.

Same comments for below text (IIUC that one is identical).

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Cc: Elia Devito <eliadevito@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/intel-hid.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/intel-hid.c b/drivers/platform/x86/intel-hid.c
> index 66ccdc17a64d..4a396ef54d2e 100644
> --- a/drivers/platform/x86/intel-hid.c
> +++ b/drivers/platform/x86/intel-hid.c
> @@ -441,8 +441,23 @@ static void notify_handler(acpi_handle handle, u32 event, void *context)
>          * Some convertible have unreliable VGBS return which could cause incorrect
>          * SW_TABLET_MODE report, in these cases we enable support when receiving
>          * the first event instead of during driver setup.
> +        *
> +        * Some 360 degree hinges (yoga) style 2-in-1 devices use 2 accelerometers
> +        * to allow the OS to determine the angle between the display and the base
> +        * of the device. On Windows these are read by a special HingeAngleService
> +        * process which calls an ACPI DSM (Device Specific Method) on the
> +        * ACPI KIOX010A device node for the sensor in the display, to let the
> +        * firmware know if the 2-in-1 is in tablet- or laptop-mode so that it can
> +        * disable the kbd and touchpad to avoid spurious input in tablet-mode.
> +        *
> +        * The linux kxcjk1013 driver calls the DSM for this once at probe time
> +        * to ensure that the builtin kbd and touchpad work. On some devices this
> +        * causes a "spurious" 0xcd event on the intel-hid ACPI dev. In this case
> +        * there is not a functional tablet-mode switch, so we should not register
> +        * the tablet-mode switch device.
>          */
> -       if (!priv->switches && (event == 0xcc || event == 0xcd)) {
> +       if (!priv->switches && (event == 0xcc || event == 0xcd) &&
> +           !acpi_dev_present("KIOX010A", NULL, -1)) {
>                 dev_info(&device->dev, "switch event received, enable switches supports\n");
>                 err = intel_hid_switches_setup(device);
>                 if (err)
> --
> 2.28.0
>


-- 
With Best Regards,
Andy Shevchenko

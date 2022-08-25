Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFA62C04AA5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 25 Aug 2022 08:21:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239554AbiHYIVX (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 25 Aug 2022 04:21:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239611AbiHYIVX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 25 Aug 2022 04:21:23 -0400
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 602C973901
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 Aug 2022 01:21:22 -0700 (PDT)
Received: by mail-qt1-x82d.google.com with SMTP id y18so14651798qtv.5
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 Aug 2022 01:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=MOOR/xnru5JB9Pvx4L8hIAhFXd79Blrfn/UjoxhtgwE=;
        b=OyIXmSmTm2dY23o2Asy/BKwr2LGGLf7QLW3cu4XQx1LNxBqvNGVQ+DrM4DOOed2+fk
         v/PmEE5ROOup0HrMSZxVDlq6I9CRUUYt+DixLxXzuuhltLbDjtMik4KOkkYxGjmheLG1
         jEzZ3r77Z2vYPNmeFsqam15j79xgvIU+DDo93nX0QaEbHlJ4OMzRCuEDn7rbfUPFi8zB
         gMnZgTfxtOvQ/qExKZ7b0GaznUaXKITlnx1ZSRc7XZasvw5yWs2SeFXrSu28Z2eZJZxu
         lq9sc91I9gsWSWteSIVlDGPaVCPn7RwvcUn93W1n7NcHzcBJebqELBqEMi9HEMw3W6V5
         m6gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=MOOR/xnru5JB9Pvx4L8hIAhFXd79Blrfn/UjoxhtgwE=;
        b=O5gY+S6F5uLy2miBDGfUOtqD2nIqTDbayX1q0mvoXLbhvJ/OVrnemwumUteV0vSsXh
         uCw34KsYaC20DC8tQWpBNR2VUl1vhwlaTJA1w/uCpJ/k5SP2wuwaUOwkHZY8jBz8J7pr
         GaRiXwjOMRYYIZroQv78xc+UxOZ01FH9Jdp6dkIBtiCaNsQqhRB7ED7Ak+ZNMlhibdbu
         eKuIF0xCqWFIkO59eQ07FR9lLFt5SGvGxtyeHNlhBxY9IbXGiGxlvk+nYMajPh4WgDtJ
         rtTIyoXABVxjF7lLZuUlO4Z50v6aINh+kwelfooFaa1afNX3oEsu6dbtvhScvoaAyWhy
         kkVw==
X-Gm-Message-State: ACgBeo0VwTmtyc6RyapX/Dy3kuEUagAG2j5CoBuo6SBJkfAwEjBmnIkk
        Yh176xFGfIYWfWacYo30YdPtEmDtFwjCVcknV28=
X-Google-Smtp-Source: AA6agR5QEvosRoI96qS9n/3s8aFFm3vAurO53ZWz0vr4SvMQvjVa2GloMfwzUYySMnYzDYi0puSIUWai0X6vmvqsLL0=
X-Received: by 2002:a05:622a:491:b0:344:95bf:8f05 with SMTP id
 p17-20020a05622a049100b0034495bf8f05mr2588685qtx.61.1661415681524; Thu, 25
 Aug 2022 01:21:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220825004305.709539-1-PaddyKP_Yao@asus.com>
In-Reply-To: <20220825004305.709539-1-PaddyKP_Yao@asus.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 25 Aug 2022 11:20:45 +0300
Message-ID: <CAHp75VfM9zwUrzPk2w5g5J4wEh5KLc_ij5Ai+S=NbZ0SYQThjw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] platform/x86: asus-wmi: Fix name of mic-mute LED classdev
To:     PaddyKP_Yao <ispaddy@gmail.com>
Cc:     Corentin Chary <corentin.chary@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        acpi4asus-user <acpi4asus-user@lists.sourceforge.net>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        paddykp_yao@asus.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, Aug 25, 2022 at 3:48 AM PaddyKP_Yao <ispaddy@gmail.com> wrote:
>
> According to well-known-leds.txt, we sould use "platform::micmute"

should

> instead of "asus::micmute" for name of mic-mute LED classdev. This patch

the name

> fix it into good name.

a good

With typos fixed,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: PaddyKP_Yao <PaddyKP_Yao@asus.com>
> ---
>  drivers/platform/x86/asus-wmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 89b604e04d7f..3acc75c24c79 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -1118,7 +1118,7 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
>         }
>
>         if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_MICMUTE_LED)) {
> -               asus->micmute_led.name = "asus::micmute";
> +               asus->micmute_led.name = "platform::micmute";
>                 asus->micmute_led.max_brightness = 1;
>                 asus->micmute_led.brightness = ledtrig_audio_get(LED_AUDIO_MICMUTE);
>                 asus->micmute_led.brightness_set_blocking = micmute_led_set;
> --
> 2.34.1
>


-- 
With Best Regards,
Andy Shevchenko

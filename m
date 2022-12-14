Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97132C4332F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 14 Dec 2022 09:13:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229836AbiLNJNs (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 14 Dec 2022 04:13:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229806AbiLNJNr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 14 Dec 2022 04:13:47 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AA3B6587
        for <platform-driver-x86@vger.kernel.org>; Wed, 14 Dec 2022 01:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671009180;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HsJGjBLMgROuD+/oqPR1+obvho6Y8Z7VClnuHTwkTTU=;
        b=YClGL8tw0Y35/eu/NJQDAp70bTXBM+yEllbF0clthvbSOOqAbAo8DbNFRe//F3ZHPgNYrV
        WIAfLAtaJ6JuZbc21XZiQaPZ5PkYX/7c8kcpzwlz7w/DmxjVcBuIzmauxeDffDl5JdWPfs
        C5nZmuU8/q9Kc1z404ugu2MXjrtuLJ4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-626-qMn09IwLMoeqhE4k8Hb9Ig-1; Wed, 14 Dec 2022 04:12:58 -0500
X-MC-Unique: qMn09IwLMoeqhE4k8Hb9Ig-1
Received: by mail-ed1-f71.google.com with SMTP id w15-20020a05640234cf00b0046d32d7b153so8960599edc.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 14 Dec 2022 01:12:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HsJGjBLMgROuD+/oqPR1+obvho6Y8Z7VClnuHTwkTTU=;
        b=h0WaSl0opz5JfPAtmjicz71mTObVwxmlDib6UyRN4wJDd2WSRW93Avvn5Ps1dGRTcU
         gOGkNv3+TI5QjcKPacTj0TrAiyarDAX/qzkpv4kCZiTEh91Nes7TciSWa0il3j2kI3QX
         GSVzF0Zm0WYGw66bKdSExAf5q0HGJD425Sxwq4FGCzzfIivw4AoUMIGpNkeNi9pv8Pxi
         aPZ/9HF7qKI8bblUMyfcmr2o6dWWlWJwkGcwVJZ0VedgfBFH7/Mr6Z5c+Z3JUVYYOUoJ
         jUcUWBd7RvyBTpFtaodBJde47cCsttDsIkTj8zHew+S2Rh82Bdko9+ph21Wg9bQZqi+7
         F7DQ==
X-Gm-Message-State: ANoB5plidiBePOE3wpRVjoysopT4fSS9gsiGZnC0OcN2MP8GoTJXqGE2
        0EwdlpJDtI3tMgHqsDv4hMXEXIR2rDFEtoNmIEvyOg3fw/OPIq6aIwSXXdTbt2OtOTgNYxIQidq
        Sow4vuIosNyV/iV3nUMpA616noJ+iecRS0w==
X-Received: by 2002:a17:906:dfed:b0:7c1:3f04:efa2 with SMTP id lc13-20020a170906dfed00b007c13f04efa2mr16702163ejc.29.1671009177417;
        Wed, 14 Dec 2022 01:12:57 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6VvF0ZaI5mOQIa+IJUycXPXLq5Gu++WuE6yRWeGnOyZrVmhG1ZV3KsPe/rSFa7uDW6sJ9BKg==
X-Received: by 2002:a17:906:dfed:b0:7c1:3f04:efa2 with SMTP id lc13-20020a170906dfed00b007c13f04efa2mr16702158ejc.29.1671009177255;
        Wed, 14 Dec 2022 01:12:57 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id n24-20020a170906689800b007bd9e683639sm5465483ejr.130.2022.12.14.01.12.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Dec 2022 01:12:56 -0800 (PST)
Message-ID: <f2cc7aaf-3a2d-f3f0-9a65-1a67ac780131@redhat.com>
Date:   Wed, 14 Dec 2022 10:12:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] platform/x86: sony-laptop: Don't turn off 0x153 keyboard
 backlight during probe
To:     Mattia Dongili <malattia@linux.it>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        platform-driver-x86@vger.kernel.org
References: <20221213122943.11123-1-hdegoede@redhat.com>
 <CANER=bYHYNSi3fTwqAt89n-6uS5dSV+o+6H4oD6doeSzgtoZoQ@mail.gmail.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CANER=bYHYNSi3fTwqAt89n-6uS5dSV+o+6H4oD6doeSzgtoZoQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Mattia,

On 12/14/22 09:55, Mattia Dongili wrote:
> On Tue, 13 Dec 2022 at 21:29, Hans de Goede <hdegoede@redhat.com <mailto:hdegoede@redhat.com>> wrote:
> 
>     The 0x153 version of the kbd backlight control SNC handle has no separate
>     address to probe if the backlight is there.
> 
>     This turns the probe call into a set keyboard backlight call with a value
>     of 0 turning off the keyboard backlight.
> 
>     Skip probing when there is no separate probe address to avoid this.
> 
>     Link: https://bugzilla.redhat.com/show_bug.cgi?id=1583752 <https://bugzilla.redhat.com/show_bug.cgi?id=1583752>
>     Fixes: 800f20170dcf ("Keyboard backlight control for some Vaio Fit models")
>     Signed-off-by: Hans de Goede <hdegoede@redhat.com <mailto:hdegoede@redhat.com>>
> 
> 
> Signed-off-by: Mattia Dongili <malattia@linux.it <mailto:malattia@linux.it>>
>  
> 
>     ---
>      drivers/platform/x86/sony-laptop.c | 21 ++++++++++++++-------
>      1 file changed, 14 insertions(+), 7 deletions(-)
> 
>     diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
>     index 765fcaba4d12..5ff5aaf92b56 100644
>     --- a/drivers/platform/x86/sony-laptop.c
>     +++ b/drivers/platform/x86/sony-laptop.c
>     @@ -1888,14 +1888,21 @@ static int sony_nc_kbd_backlight_setup(struct platform_device *pd,
>                     break;
>             }
> 
>     -       ret = sony_call_snc_handle(handle, probe_base, &result);
>     -       if (ret)
>     -               return ret;
>     +       /*
>     +        * Only probe if there is a separate probe_base, otherwise the probe call
>     +        * is equivalent to __sony_nc_kbd_backlight_mode_set(0), resulting in
>     +        * the keyboard backlight being turned off.
>     +        */
>     +       if (probe_base) {
>     +               ret = sony_call_snc_handle(handle, probe_base, &result);
>     +               if (ret)
>     +                       return ret;
> 
>     -       if ((handle == 0x0137 && !(result & 0x02)) ||
>     -                       !(result & 0x01)) {
>     -               dprintk("no backlight keyboard found\n");
>     -               return 0;
>     +               if ((handle == 0x0137 && !(result & 0x02)) ||
>     +                               !(result & 0x01)) {
>     +                       dprintk("no backlight keyboard found\n");
>     +                       return 0;
>     +               }
>             }
> 
>             kbdbl_ctl = kzalloc(sizeof(*kbdbl_ctl), GFP_KERNEL);
>     -- 
>     2.38.1
> 
> ---
> 
> Aha, looking at the bug report and the commit that caused it I think this fix makes sense.
> You can add my sign-off too.

I think you mean Reviewed-by? Singed-off-by: is only for patches passing
through you. E.g. it was send to you personally and you then submit it
to the list.

Regards,

Hans



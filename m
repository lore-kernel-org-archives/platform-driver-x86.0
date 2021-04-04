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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C07DAC433B4
	for <platform-driver-x86@archiver.kernel.org>; Sun,  4 Apr 2021 15:51:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8CBAC611BE
	for <platform-driver-x86@archiver.kernel.org>; Sun,  4 Apr 2021 15:51:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230039AbhDDPvE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 4 Apr 2021 11:51:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229861AbhDDPvD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 4 Apr 2021 11:51:03 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11ECAC061756
        for <platform-driver-x86@vger.kernel.org>; Sun,  4 Apr 2021 08:50:59 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id u17so7512404ejk.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 04 Apr 2021 08:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Ks3Vz5QPwskZ0d5doSmQeL1Q306j0tnI3m0C7fUkCeQ=;
        b=p0FMxbF1z/xKGJyRuowi2w1mGsMvDQjLEMZ68fHOhMQ5l+cdvREgXONSce7vr9L7FD
         WmqBdKCtjjC1fCr59a6OehQ004IsDE1AzsmhR9P/4WcocxOBIr5Cfg12FsUKaPsGc6Kb
         H52F0/Bhn1XtUc6Ptk03LNmLnkMmW+e6IP9gY67emJ41FQcCLlCH12ULOuxX0QLcjt0/
         9gNZCKfP8G/s+Jcyn2GzLiMBnopGIi4uKuCESuc7OKctB47gc8iWeJrr2YsotwT10Kx+
         VqCPpG/+T1XXPHL6vf3oVAKMatLvRHNxsKKlLKJ+ftTMk36RBznjoI+9U9TIJRKI1Qov
         FtnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Ks3Vz5QPwskZ0d5doSmQeL1Q306j0tnI3m0C7fUkCeQ=;
        b=TrEz7Rykl7+5TPzMRRE3l8scOaX9QjRpuqpC9gOgEvWZwqb8a7lmkGaQpqIXtu9a2B
         SeHS5K/8Ay1OtdXmZhtbbQNXZnbP1VD0NOGCMrCDv03eD2GuzwUzWfJa4IbXN89m88F9
         sIHZ+1VSsgbFClaRn5gIsXq3yJLdwTPW+MujvUZlWChHiv5i345L3coT6CJPaktSuoPD
         vJJRXAEm3NHA5tMzidlOd1a+EgH9r16EWbqFWj7uOvIPVY5tggPfWt5Lv1f0n2TWoCNT
         XMsRNz+tIJlyade9Wrzx8VgVqPclQcSNq3Z/fgiCiRjdZ8Of/pm8Ah9DeuGIGxwZZkGP
         rQzA==
X-Gm-Message-State: AOAM533oQvCaOODFKek2aFpxAXE3KduRh1PG0Nn+uwhzu6d6M/49+jjS
        e0As8tnK5g2LQ1TmxHO22Eg=
X-Google-Smtp-Source: ABdhPJwJ2dr0A+mk3X5EKFlFSfkXrttqcuseTk7idfKFCGwkZFz5WCYvCyAJdqBHpT8VRqZe0LDMEA==
X-Received: by 2002:a17:907:1692:: with SMTP id hc18mr23881047ejc.265.1617551457682;
        Sun, 04 Apr 2021 08:50:57 -0700 (PDT)
Received: from spectre.fritz.box (host-79-47-116-73.retail.telecomitalia.it. [79.47.116.73])
        by smtp.gmail.com with ESMTPSA id w25sm3463460edq.66.2021.04.04.08.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Apr 2021 08:50:57 -0700 (PDT)
Message-ID: <b5666155ad821c700934397e27e6c5e461503014.camel@gmail.com>
Subject: Re: [PATCH] platform/x86: intel-hid: Fix spurious wakeups caused by
 tablet-mode events during suspend
From:   Elia Devito <eliadevito@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     platform-driver-x86@vger.kernel.org
Date:   Sun, 04 Apr 2021 17:50:55 +0200
In-Reply-To: <20210404143831.25173-1-hdegoede@redhat.com>
References: <20210404143831.25173-1-hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Hans,
> Some devices send (duplicate) tablet-mode events when moved around even
> though the mode has not changed; and they do this even when suspended.
> 
> Change the tablet-mode event handling when priv->wakeup_mode is set to
> update the switch state in case it changed and then return immediately
> (without calling pm_wakeup_hard_event()) to avoid spurious wakeups.
> 
> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=212537
> Fixes: 537b0dd4729e ("platform/x86: intel-hid: Add support for
> SW_TABLET_MODE")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/intel-hid.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel-hid.c
> b/drivers/platform/x86/intel-hid.c
> index 57cc92891a57..078648a9201b 100644
> --- a/drivers/platform/x86/intel-hid.c
> +++ b/drivers/platform/x86/intel-hid.c
> @@ -483,11 +483,16 @@ static void notify_handler(acpi_handle handle,
> u32 event, void *context)
>                         goto wakeup;
>  
>                 /*
> -                * Switch events will wake the device and report the
> new switch
> -                * position to the input subsystem.
> +                * Some devices send (duplicate) tablet-mode events
> when moved
> +                * around even though the mode has not changed; and
> they do this
> +                * even when suspended.
> +                * Update the switch state in case it changed and then
> return
> +                * without waking up to avoid spurious wakeups.
>                  */
> -               if (priv->switches && (event == 0xcc || event == 0xcd))
> -                       goto wakeup;
> +               if (event == 0xcc || event == 0xcd) {
> +                       report_tablet_mode_event(priv->switches,
> event);
> +                       return;
> +               }
>  
>                 /* Wake up on 5-button array events only. */
>                 if (event == 0xc0 || !priv->array)
> @@ -501,9 +506,6 @@ static void notify_handler(acpi_handle handle, u32
> event, void *context)
>  wakeup:
>                 pm_wakeup_hard_event(&device->dev);
>  
> -               if (report_tablet_mode_event(priv->switches, event))
> -                       return;
> -
>                 return;
>         }
> 

No regression noted on HP Spectre x360 15-df0xxx.

Reviewed-by: Elia Devito <eliadevito@gmail.com>

Regards,
Elia



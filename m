Return-Path: <SRS0=1Jx7=C6=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2463DC43463
	for <platform-driver-x86@archiver.kernel.org>; Mon, 21 Sep 2020 09:04:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D6D7B20773
	for <platform-driver-x86@archiver.kernel.org>; Mon, 21 Sep 2020 09:04:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TLc7LgGm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726406AbgIUJEA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 21 Sep 2020 05:04:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726427AbgIUJEA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 21 Sep 2020 05:04:00 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBD01C061755
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Sep 2020 02:03:59 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id x23so11317920wmi.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Sep 2020 02:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rzlqQEdCq0O5R0lQr5kmEjDwC5U+MU8eNI8RaonrABk=;
        b=TLc7LgGmokHLIr7Cc4vLVkiX/536S+SVG4U7924eF9kfaLw49/aWS0jiU+vyUwbqCI
         C6F71CSRO2SAn1jWDzTCS8g6GjTm1v6/M9C2EEDbuLCNBOoE6bJnupfo7LjAnk/lY2nk
         bFw7VnS7zi9Hvjg4f7ID+kE5TTclejld7gK0rhHsP/jWG9Gg+4ElH5WXaTY3Z353P5v2
         /hp0zTjy2PDVU/L55WwxEMiYsl165A6vGtFaPBfS24trqxxvCTTsuVubAkLhX7OTqqR5
         wSjDigv/Yj34TVsGWdKL3vk+8Gow/UlHLzytUfjN4lhiKpWLezvYiLL6MxiVsq4hIWFK
         DGAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rzlqQEdCq0O5R0lQr5kmEjDwC5U+MU8eNI8RaonrABk=;
        b=pSIOIeKbdGO6lYutl5DfkzmPFrCSp1WjTeJRd2UCKjec1SGsJ7+fUZFCHQZyi7RMl8
         zGHkbVsmn2167Y+p7XLugLURq12mfnRmqO2mlzTfDl+Cd17x0iq4P97xHnL8uol5jnQy
         zV/7Nbp2YMJxYK4ZtIFHJpWjqpXrvJ9rwRTAAR36CLHuZHfLLHA88JHxq/gKyge4C1+I
         8UkaIrko4R8VkyuGKujf9Sg3sVKrhOXQPOApWvMQ97Ho3wFRs8gRE1JfsfnROna+mwYr
         hXkKiIJtXdh/PS+yMvwnUAZNnz8BbkuvnFMiYobj8SN5miel/htzSHlNca6MGn0cOrQ3
         a2DA==
X-Gm-Message-State: AOAM533icKg7oVOugUhIyOmFoaX6Pn+st18RasR99VG6Np6xsVY/Yvd6
        keecPdhACRK3k2aIbNVJdCo=
X-Google-Smtp-Source: ABdhPJxOAj2PE9osZ6sDKV8pQJhyPgMXRshvtgrOiQhboTK6E01mwcAOEfLxKqorCvzcdU9BvzoAPg==
X-Received: by 2002:a1c:1d52:: with SMTP id d79mr30707394wmd.82.1600679038425;
        Mon, 21 Sep 2020 02:03:58 -0700 (PDT)
Received: from pce.localnet (host-79-12-92-76.retail.telecomitalia.it. [79.12.92.76])
        by smtp.gmail.com with ESMTPSA id t10sm16143806wmi.1.2020.09.21.02.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 02:03:57 -0700 (PDT)
From:   Elia Devito <eliadevito@gmail.com>
To:     Mark Pearson <markpearson@lenovo.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Bastien Nocera <hadess@hadess.net>,
        Mark Pearson <mpearson@lenovo.com>,
        Benjamin Berg <bberg@redhat.com>
Cc:     Jared Dominguez <jaredz@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [External] Re: RFC: offering a standardized (/sys/class) userspace API for selecting system/laptop performance-profiles
Date:   Mon, 21 Sep 2020 11:03:55 +0200
Message-ID: <9766663.nUPlyArG6x@pce>
In-Reply-To: <261328975238951d0412727220a1b7d915cebb99.camel@redhat.com>
References: <bbe4ebef-0845-2719-ac9a-fbc9c7bcd7be@redhat.com> <3ed9ac0a-2e24-7d3a-f264-c3bb03b846d9@lenovo.com> <261328975238951d0412727220a1b7d915cebb99.camel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi all, sorry for response delay I'm very busy at work this period

A common interface is surely the best solution, especially because it allows 
to standardize the user-space tools and maybe to integrate its with desktop, 
like Bastien is doing with gnome-power-profiles-daemon or like the similar tool
plasma-pstate.

I think we should keep separate performance and thermal profiles thus leaving 
the possibility of setting a thermal profile independently of the performance
profile and vice versa.

Hp implements up to 4 thermal profiles (apparently the same ones that implement
dell), my patch implements the first 3 profiles which are the ones supported by
my hardware.

1. HP Recommended -> fan stay off and start at low~medium speed when necessary
2. Performance    -> fan stay off and start at medium~hight speed when 
necessary
3. Cool           -> fan stay off and start at medium~hight speed when 
necessary
4. Quiet          -> fan should stay off and start at very low speed if 
necessary

for each profile the firmware set also a OEM variable to select DPTF profile
with the adeguate power limit.

combining these profiles with the performance profiles it is possible to obtain
the desired performance according to the needs of the moment

e.g.

For gaming purpose when the CPU and GPU share the thermal budget, in this case 
the best solution is to set thermal profile to performance to maximize the heat 
dissipation and the p-state profile to powersave, in this way during loadings 
the cpu gain a performance boost that allow to reduce loading time, instead, 
during gameplay the cpu performance will be limited in favor of the GPU 
allowing the maximum framerate to be reached.
(feral had to handle it for its gamemode tool: 
https://github.com/FeralInteractive/gamemode/pull/179)

Another opposed particular case could be thermal profile set to quiet and
p-state set to performance, usefull for example to maximizze cpu performance 
in silent ambient room like a library, obviously for CPU-only intesive tasks 
the best solution is to set either thermal and performance profile to 
performance.

Basically there are infinite combinations that can be made to obtain the best 
configuration for each situation, to allow this a common interface should offer
a possibility to:

- Define the list of thermal profiles separately from the performance ones
- Eventually define a list of on/off attributes (useful for lenovo lap_mode?)
- Provide a description of them
- Switching between thermal profiles regardless of the performance profile

A possible solution could be a "slider like" interface for performance level
and a list of thermal profile.

On Thu, 2020-09-17 at 13:22 +0200, Hans de Goede wrote:
> Elia, Mark, I assume that both of you want to get your patches for this
> upstream sooner, rather then later. But I think we should put them on
> hold until we have an agreement on a shared userspace API for this.
> 

I could maybe update the patch to expose the interface via debugfs like Mark
wants to do with lenovo driver and make update later when a common interface
will be fully defined.

I would prefer the patch to be merged (at lest the init function) because it
fix the thermald behaviour whit default thermal profile on fresh boot.

In the next days I will update the patch and send it in other thread to 
discuss and evaluate a merge in two steps

Best Regards
Elia




Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E115C433FE
	for <platform-driver-x86@archiver.kernel.org>; Tue,  1 Nov 2022 17:37:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230512AbiKARhr (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 1 Nov 2022 13:37:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231186AbiKARhn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 1 Nov 2022 13:37:43 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 147001D0E6
        for <platform-driver-x86@vger.kernel.org>; Tue,  1 Nov 2022 10:37:41 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id a13so22839996edj.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 01 Nov 2022 10:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cdUAsiAgmBJ1jbIAcY/gGR+Z/7ih0XBIpAP4mnSXYwg=;
        b=U+3jcriNI6G3mRzAxSj20osZtTDZErBW8Nh3ObL1xuyZVmynG7VTQ6hdaJDZfvYuc4
         BsAvfNmsSOYVQr1aPoTaBNp/Wjsp/mcsuXhQVkBEvgszY1b+jniCkvoAvlnhfUO9/7Ew
         nYABzAW6uipYWW4pCOp3Jvxu/hanu2Vo9v1kg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cdUAsiAgmBJ1jbIAcY/gGR+Z/7ih0XBIpAP4mnSXYwg=;
        b=3oTI6/X4kVtsKq4ijfQjuxZgkSc0wHf5PSN20z1X0KXYQ2wj7qnfAjbnGFezHSSwRi
         0byOXBhG0+91onJINDRw5hbBygtfBLXB6O2kqGiF7ZuvAQmDs/nOhImqnITEdha2tofC
         a2Ztafs8OxV9loqMvVRRPpAtyy5kGc14y54Gt9Duv90C3oZiAwlHEadES5Y6KuhP7eZ2
         Da/NStOAiCGtfqvczAUK3iF74Z5A0YJzwpdocVhPzDaO2WYd8uWDb8+0D2a545cwKOzm
         gPqxHFD5bQVKazPUaf/K257IoxF5slFfnYJRai8Rz4kgi/JduEsdLENNKhTjBhtNHLPE
         kKkw==
X-Gm-Message-State: ACrzQf1v/Fwl6L/g4JDgOaGGnV33rqm/ERa8PXBKVivEbRdHxeyZAQ8J
        +XnGdFavO9D1syYTxENQ11mtyf3j4AZVMJiN
X-Google-Smtp-Source: AMsMyM5DnoOgrGti08p+lfJWQYnElBtX6T8oQouC7ma1JsqnbdVqTDO+tYJuJKkJzixBAvkzqaGQsg==
X-Received: by 2002:a05:6402:1cca:b0:460:7d72:8f2 with SMTP id ds10-20020a0564021cca00b004607d7208f2mr20453066edb.205.1667324259461;
        Tue, 01 Nov 2022 10:37:39 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id ku11-20020a170907788b00b0073d84a321c8sm4382576ejc.166.2022.11.01.10.37.37
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Nov 2022 10:37:38 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id z18so17799711edb.9
        for <platform-driver-x86@vger.kernel.org>; Tue, 01 Nov 2022 10:37:37 -0700 (PDT)
X-Received: by 2002:a05:6402:1947:b0:461:a47d:274 with SMTP id
 f7-20020a056402194700b00461a47d0274mr20093632edz.165.1667324257158; Tue, 01
 Nov 2022 10:37:37 -0700 (PDT)
MIME-Version: 1.0
References: <20221031204320.22464-1-mario.limonciello@amd.com> <20221031204320.22464-2-mario.limonciello@amd.com>
In-Reply-To: <20221031204320.22464-2-mario.limonciello@amd.com>
From:   Sven van Ashbrook <svenva@chromium.org>
Date:   Tue, 1 Nov 2022 13:37:26 -0400
X-Gmail-Original-Message-ID: <CAM7w-FXAGki+k9aP0wV1Qs8dKqpPXgY9ZJR_a83ETrUF6ZRZOw@mail.gmail.com>
Message-ID: <CAM7w-FXAGki+k9aP0wV1Qs8dKqpPXgY9ZJR_a83ETrUF6ZRZOw@mail.gmail.com>
Subject: Re: [RFC 1/3] PM: Add a sysfs file to represent whether hardware
 reached the deepest state
To:     Mario Limonciello <mario.limonciello@amd.com>
Cc:     Rafael J Wysocki <rafael@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Len Brown <len.brown@intel.com>,
        Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
        S-k Shyam-sundar <Shyam-sundar.S-k@amd.com>,
        rrangel@chromium.org, platform-driver-x86@vger.kernel.org,
        Rajat Jain <rajatja@google.com>,
        David E Box <david.e.box@intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Oct 31, 2022 at 4:43 PM Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
> +void pm_set_hw_deepest_state(u64 duration)
> +{
> +       suspend_stats.last_hw_deepest_state = duration;

I'm wondering if we could add a userspace notification here. Then
userspace wouldn't have to synchronize with the suspend/resume state
of the system when reading this entry.

What about sysfs_notify() ? Or via udev?

> +}
> +EXPORT_SYMBOL_GPL(pm_set_hw_deepest_state);

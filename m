Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A7B8C4332F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 15 Nov 2022 08:27:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229998AbiKOI1D (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 15 Nov 2022 03:27:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbiKOI1C (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 15 Nov 2022 03:27:02 -0500
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F3EB1E73D
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Nov 2022 00:27:02 -0800 (PST)
Received: by mail-qk1-x72f.google.com with SMTP id k2so9046535qkk.7
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Nov 2022 00:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=poHL0aJVeHYHhSuQPqkHuaDkI/0+1RYf79D0JWK5b3I=;
        b=KC7xtfQURzp9IJAJMETdlZBEQpQfr/C2A6K90FWx0WjURJYJKhd1ymSwcdPK3JOm6Q
         UZuq6gnstGaQP7MJ4IeUsMXI42GaQMZG85baHRcBiVKAyAiFoIyyTs1wN5YjtEfUxuhF
         9cgjwqeQzaOgFJwjFSLjuDxrSxtsEt1SKb6mGIRmGjU13CmZfH8qplWKhOvjKgc3Sz94
         G2Jjzg54TpIoM4fK3O98ohHa1xiX5gmVHlEkA+gI/sc/qxbgE9pLsKUrBaoZd09bZ5Yp
         ItRtLOtVa2+mhjczEjtJs3ARvOZJWtE3SL9V32X1UyqUOCuTuzlI3FNTsjb9cQPa7uG9
         G52A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=poHL0aJVeHYHhSuQPqkHuaDkI/0+1RYf79D0JWK5b3I=;
        b=a95prtK3lOTs6CoGPSg+NVZKwdy6ZpOcdA7bWwKh/5D7qno6uKW78UYQXBBHwtiWTz
         6FRGvSrTtPFw9Agt15vGl6V68mySmysJyBvUatJM4Cen3ZZWz49r8girPMSJWT9fXmq7
         Zw1ScsZVBdBeiJ2w04WCucg3sWA+CwkcBZSRKgOn3SqmBdnXMBy+h192C7H+exllPqrz
         dxzQ/9J0fku79Lenvm8m0n++6RKVkQOTW34cRlIXXWpx6o8ZZRgE4HwyyMDVhsw2v0EO
         LE4ylyJYxXg7eSkHNtbbOnXFGEFo7gInrzjEborG7HEiX5uOMxWsd68ZQN6z+qXUl5Z+
         xWTg==
X-Gm-Message-State: ANoB5pnXaAdmFwpLZnPuHGhTP7vuZCqYNWsgnJOtl842zsY2MO1Y3OII
        Z7kORuSDJueIuPbQxUXixRcPEPIkUgq6lpcRXs+R0oEkYm94Sg==
X-Google-Smtp-Source: AA0mqf7C7M/VdwOqWMH2Uczo9x8X9ogKnuWJc7xHz4wTsr4pPW2JQjuQQYMHvgQyZJmNuRlUWMOlBkoCw4T+X2OGa4U=
X-Received: by 2002:a05:620a:21cc:b0:6fa:b56f:7ede with SMTP id
 h12-20020a05620a21cc00b006fab56f7edemr14318880qka.383.1668500821106; Tue, 15
 Nov 2022 00:27:01 -0800 (PST)
MIME-Version: 1.0
References: <20221115073636.25412-1-yuancan@huawei.com>
In-Reply-To: <20221115073636.25412-1-yuancan@huawei.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 15 Nov 2022 10:26:25 +0200
Message-ID: <CAHp75VfOP=TVL95=LzabQGzf4N3uXHi7KvwH4a_4Ez=vjzL9aQ@mail.gmail.com>
Subject: Re: [PATCH] x86/platform/intel/iosf_mbi: Fix error handling in iosf_mbi_init()
To:     Yuan Can <yuancan@huawei.com>
Cc:     dvhart@infradead.org, andy@infradead.org, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
        x86@kernel.org, hpa@zytor.com, david.e.box@linux.intel.com,
        jarkko.nikula@linux.intel.com, wsa@kernel.org, hdegoede@redhat.com,
        rafael.j.wysocki@intel.com, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, Nov 15, 2022 at 9:38 AM Yuan Can <yuancan@huawei.com> wrote:
>
> A problem about modprobe iosf_mbi failed is triggered with the following
> log given:
>
>  debugfs: Directory 'iosf_sb' with parent '/' already present!
>
> The reason is that iosf_mbi_init() returns pci_register_driver()
> directly without checking its return value, if pci_register_driver()
> failed, it returns without removing debugfs, resulting the debugfs of
> iosf_sb can never be created later.
>
>  iosf_mbi_init()
>    iosf_mbi_dbg_init() # create debugfs
>    pci_register_driver()
>      driver_register()
>        bus_add_driver()
>          priv = kzalloc(...) # OOM happened
>    # return without remove debugfs and destroy workqueue
>
> Fix by remove debugfs and iosf_mbi_pm_qos when pci_register_driver()

removing

> returns error.

>  static int __init iosf_mbi_init(void)
>  {
> +       int ret;
> +
>         iosf_debugfs_init();
>
>         cpu_latency_qos_add_request(&iosf_mbi_pm_qos, PM_QOS_DEFAULT_VALUE);
>
> -       return pci_register_driver(&iosf_mbi_pci_driver);
> +       ret = pci_register_driver(&iosf_mbi_pci_driver);
> +       if (ret) {
> +               cpu_latency_qos_remove_request(&iosf_mbi_pm_qos);
> +               iosf_debugfs_remove();
> +       }
> +
> +       return ret;
>  }

Can we rewrite it as

  if (ret)
    goto err_remove;

  return 0;

err_remove:
  ...
  return ret;

?

-- 
With Best Regards,
Andy Shevchenko

Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7A00C48BCF
	for <platform-driver-x86@archiver.kernel.org>; Sun, 13 Jun 2021 14:22:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ADB82611CE
	for <platform-driver-x86@archiver.kernel.org>; Sun, 13 Jun 2021 14:22:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231782AbhFMOYz (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 13 Jun 2021 10:24:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231755AbhFMOYz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 13 Jun 2021 10:24:55 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BAFCC061574
        for <platform-driver-x86@vger.kernel.org>; Sun, 13 Jun 2021 07:22:39 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id ei4so8284414pjb.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 13 Jun 2021 07:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=4pONQngXz4wBjkaDpA2w0y8/XycGaMQaNQOf7XiKps4=;
        b=DQtWX+r5TqZ++kSsuqNEg/HwhTwBMa0civnV8MMGMrp8oXuxq7aPh7ooT72ZrYU99j
         /upLfw6ZeezeiW+pZYAmrN9pzBymYus6q62x/a1tsvBoFiy9f0B/M3My+xtY0JgRpSXC
         5MqD5Pg3nZZ6A0dtgE4ucxX89VZ+DiLPBf8CQM1WTUaJcxLS/9OOGdJXLuPkwpm24hIA
         Y+OcjzyahiNHbrlfuaZeG8Gqr3oZs0O3UE2EeeC4z1EXUrTAcV/QSDg+o7ZSug+i9KmL
         Z9koMJnbFbRPhwl28MrhL/iDs4FkqSdnX85ONOaJ3TIbgmZJVUIkS7LjjzHXO+hINH8h
         iOXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4pONQngXz4wBjkaDpA2w0y8/XycGaMQaNQOf7XiKps4=;
        b=csUk78T5eYZhje/0vVQhakiWIflSBhI7pGHPGVKT8CXceGdfS4BEc9zNhu8dx9jzBJ
         tpZVjCOK520UJis8F1XcLknf7j/xo0vO73w6WG0Z+hO1XPsyLaCq1tbpmXbY+CtchcTY
         huVf3eORDhiFIoAVYNnDAIDYpNv1sAsweW7S2WEsNVO0KIyiMyEhQ4CZhX5N/n7LEqyg
         aIq9Vcv6aYNh8cofoUk37F7uIjs0XNNX7EH5VqRMy4Vgs5mNLvEjEdBlyinc31qOkHgw
         HOgUXom22m2ksyecMgOL44kmid558B0+3QV3hm28JNePqgJeIeUprurs5R8EdfcB95lo
         kyXQ==
X-Gm-Message-State: AOAM532AS0t8pbbD9Me8cWCOZCk9+sFZmkpxYVijGot5kDZwm/QwQFrT
        7t70edKze7jfbRQJr/OhdEr0gbFMzDSaQ8hRXiCE2THFJYE2/A==
X-Google-Smtp-Source: ABdhPJyyu5u6+vmZcQF96t7UOlOUuegPNnmxT9L/KLu9Ndt+bd3BSk7jCIc75A7ZewaZS5BK6wqIQEi5iYrge7cMm7w=
X-Received: by 2002:a17:902:d305:b029:10d:c8a3:657f with SMTP id
 b5-20020a170902d305b029010dc8a3657fmr12694249plc.0.1623594158873; Sun, 13 Jun
 2021 07:22:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210428032224.8299-1-s.shravan@intel.com>
In-Reply-To: <20210428032224.8299-1-s.shravan@intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 13 Jun 2021 17:22:22 +0300
Message-ID: <CAHp75Vfq6B0=q0dsQPTP_A8sdPh9tepBooa7cW=KJYX78ekWtw@mail.gmail.com>
Subject: Re: [PATCH 0/1] [x86] BIOS SAR Driver for M.2 Intel Modems
To:     Shravan S <s.shravan@intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        sudhakar.an@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Fri, Jun 11, 2021 at 12:46 PM Shravan S <s.shravan@intel.com> wrote:
>
> SAR (Specific Absorption Rate) driver is a host driver implemented for Li=
nux
> or chrome platform to limit the exposure of human body to RF frequency by=
 informing
> the Intel M.2 modem to regulate the RF power based on SAR data obtained f=
rom the sensors
> captured in the BIOS. ACPI interface exposes this data from the BIOS to S=
AR driver. The
> front end application in userspace ( eg: Modem Manager) will interact wit=
h SAR driver
> to obtain information like the device mode (Example: tablets, laptops, et=
x), Antenna index,
> baseband index, SAR table index and use available communication like MBIM=
 interface to enable
> data communication to modem for RF power regulation.
>
> The BIOS gets notified about device mode changes through Sensor Driver. T=
his information is
> given to a (newly created) WWAN ACPI function driver when there is a devi=
ce mode change.
> The driver then uses a _DSM method to retrieve the required information f=
rom BIOS.
> This information is then forwarded/multicast to the User-space using the =
NETLINK interface.
> A lookup table is maintained inside the BIOS which suggests the SAR Table=
 index and Antenna
> Tuner Table Index values for individual device modes.
>
> The SAR parameters to be used on the Modem differs for each Regulatory Mo=
de like FCC, CE and ISED.
> Hence, the SAR parameters are stored separately in the SMBIOS table in th=
e OEM BIOS,
> for each of the Regulatory mode. Regulatory modes will be different based=
 on the region and network
> available in that region.
>
> Hence the entire SAR functionality handling is divided into 2 parts:
>
> =E2=80=A2       A ACPI function driver implemented that uses a dedicated =
ACPI node for WWAN device.
>     sends notifications whenever there is change in Device Mode. (each OE=
M has different mechanism
>     of updating this DEVICE Mode info). This is notified to User-space ap=
plications using
>     the RT-NETLINK interface.
> =E2=80=A2       WWAN Device Service listens for RT-NETLINK messages and r=
outes them to Modem using MBIM.

That's a nice feature!
Why is it not a part of some generic subsubsystem under wireless
network subsystem?


--=20
With Best Regards,
Andy Shevchenko

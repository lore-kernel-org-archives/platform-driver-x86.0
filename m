Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CBA7C636CC
	for <platform-driver-x86@archiver.kernel.org>; Tue,  7 Feb 2023 14:07:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231892AbjBGOH6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 7 Feb 2023 09:07:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232385AbjBGOHq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 7 Feb 2023 09:07:46 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96DB6C169
        for <platform-driver-x86@vger.kernel.org>; Tue,  7 Feb 2023 06:07:30 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id dr8so43330460ejc.12
        for <platform-driver-x86@vger.kernel.org>; Tue, 07 Feb 2023 06:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5FCfGZQ6QcRLAbCiEs0inxCj6h4/+YX1h9G8rkZvCE8=;
        b=e80aBW1nqn+FqG1ZCgMOg8MDk9N8g4xboySe8jAFdTVh3ri88PPk1r1w3i7MYVUWBe
         hy/SERaB82O0T+C+/cFyO3w5an5B4LgNfSZVPSfEcwIhQcu2MJfXwpcoeNicl7/n8iqj
         J/gUt9cNDiKYnLKQVOc6N4X5kkmuTOGR1NLNCixvWV8DCduQFuZhqHVJIM6dbSPvX8sl
         K8hvFPnHthNBH1SGJJ8zK7YC4NNbhS9taqPDB2/QBACu35fgiFBxqKjSQrpmqRXd8Zwc
         qzHr8dtq6Qd1ZgCofcaMI9GjnNTDMs4zXZVNyLVZ4blNYrS5zl7R1zUYXRdue5l8BK3Z
         1quA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5FCfGZQ6QcRLAbCiEs0inxCj6h4/+YX1h9G8rkZvCE8=;
        b=wrjY4mr0HYiHH6fMqF7RubOWCjsQb13wS1xNp9qlIbRZlrfJJi05NqqKHtbbFO4NDI
         nzkTC8Dl5sYwa7nbF9uwWr8qERU5AZL/Mf3CdTAIj0ZkGFHEGTO4LMKDhzPr1JUPdu8w
         MZrTZy3xhAEUmt0r38ylXnJSMon/FVg45mWAk5zezr0VM6OOF61LvDF4THSB5KEe7x2f
         /NdAjWMVQnAsD6oaI16GJZNxWYQqfCAoDZ68u+yG2tGUqre8J9GGNvj+JpUCiZ2h5JYV
         G/FtYe9kUt2ddxdypjzuq0reu6wMb7llQ7XoqRy4KODRWbVaHvkNHdHH+t0rdsYrMQWU
         WPBQ==
X-Gm-Message-State: AO0yUKWfl2KnaboqMK/hkHWcsIbPUwEuybEt1zKgzk0MLJAcVQGRgRaO
        Zgr9jyb4y+q/NQoZjxXBqQI=
X-Google-Smtp-Source: AK7set+KcHPhGXX8vRnTDkj4FuhtI+HaLMN+388RqiLAfRjdSiI/mr6/B13Wd8LVf0w/yCPKt6iFSg==
X-Received: by 2002:a17:906:2011:b0:881:4d98:fe2e with SMTP id 17-20020a170906201100b008814d98fe2emr3861500ejo.29.1675778849029;
        Tue, 07 Feb 2023 06:07:29 -0800 (PST)
Received: from localhost ([5.188.50.6])
        by smtp.gmail.com with ESMTPSA id b14-20020a1709063f8e00b0088dc98e4510sm6959144ejj.112.2023.02.07.06.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 06:07:27 -0800 (PST)
Date:   Tue, 7 Feb 2023 16:07:22 +0200
From:   Maxim Mikityanskiy <maxtram95@gmail.com>
To:     Jorge Lopez <jorge.lopez2@hp.com>, Alex Hung <alexhung@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org
Cc:     Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>,
        Rishit Bansal <rishitbansal0@gmail.com>,
        Enver Balalic <balalic.enver@gmail.com>
Subject: Firmware upgrade broke SW_TABLET_MODE on HP Dragonfly G2
Message-ID: <Y+JbBiMJw+VLo2Nr@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hello,

I use HP Dragonfly G2, Arch linux, kernel 6.1.9, and I upgraded the
firmware from 1.9.1 to 1.11 (using fwupdmgr/LVFS), and this upgrade
broke tablet mode detection on my laptop. I did some debugging, and
that's what I found:

1. On both firmware versions: hp-wmi registers SW_TABLET_MODE, but never
reports events. Although HPWMI_EVENT_GUID is present on my system,
hp_wmi_notify never gets any events of any kind. Good thing is that at
least hp_wmi_get_tablet_mode (/sys/devices/platform/hp-wmi/tablet) works
on my laptop.

2. "Intel HID switches" is the device that reports actual SW_TABLET_MODE
events on firmware 1.9.1, but not anymore on firmware 1.11.
SW_TABLET_MODE is registered after the first event (by auto_add_switch,
on firmware 1.9.1 only).

3. SW_TABLET_MODE reported by "Intel HID switches" (on firmware 1.9.1)
differs from /sys/devices/platform/hp-wmi/tablet, when the laptop is not
fully folded, but put into a stand position (the hinge is open more than
180°, the keyboard faces the table). The reason is because hp-wmi only
treats system_device_mode[0] == 6 as tablet, but 5 (stand mode) isn't
included, while "Intel HID switches" report SW_TABLET_MODE = 1 in the
stand mode.

I'm pretty sure about my findings, I flashed each of these two firmware
versions again and tested what happens in hp-wmi and intel/hid, of
course without changing any software versions.

Regarding point 3, I can send a patch for hp-wmi, but it's not going to
be useful for my laptop because of point 1, and I can't be fully sure it
doesn't break other HP laptops (unless Jorge confirms?).

Now back to the main topic. There are two directions that I see:

1. Fix the regression in the firmware and make Intel HID switches work
again. Unfortunately, I didn't have success reporting the firmware bug
via HP customer support, and they don't seem to admit the bug or even
having uploaded their firmware to LVFS. If Jorge (or anyone else on the
mailing list) could give me some contact of a person responsible for
firmware on LVFS or the proper way to file a bug report, I would highly
appreciate it. Maybe Alex has an idea why intel/hid could stop working?

2. Somehow tweak hp-wmi to start getting events on my laptop and switch
to SW_TABLET_MODE reports from hp-wmi (also fixing the stand mode
reports). For this, I would need help from Jorge (or someone who knows
HP laptop internals), I don't have ideas why it might be broken for me.

I will appreciate any help, and I'm happy to provide additional
information if needed.

Thanks,
Max

Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E03FC636D4
	for <platform-driver-x86@archiver.kernel.org>; Tue,  7 Feb 2023 16:49:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231172AbjBGQto (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 7 Feb 2023 11:49:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230433AbjBGQtn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 7 Feb 2023 11:49:43 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C10839B9D
        for <platform-driver-x86@vger.kernel.org>; Tue,  7 Feb 2023 08:49:42 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id l14so6822421eds.4
        for <platform-driver-x86@vger.kernel.org>; Tue, 07 Feb 2023 08:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YKGof1EaBrEeA7rciwlZxnMtbYUb4+mL1sFVdHRp+Wk=;
        b=gz1IkPOXGafAySBWPCLA2hoP5ZZr+lBLH0Rojkt2LPbSTdp7+SYpuVZVDDXZ9RHIJz
         NZ2UwDvD/7QUcqOnkktIYYTRzkjNnjLankImxpkcLGyj8KIRUycb4K3bt8uVHvx7sIx4
         jbGTpodYvMBSzXoYePOcRniN701P6dOFWgmF3RfngtCJhM4nlCBwrHBixbElf1NFyU0a
         NM4g0e1rGwpvExBaUQB3cnAf85I+5LP9Gy0UEGRe/k+I/iQ6CQqFOfgZuv5Mlm//ESbI
         gmugdMxJDF96WF+3V2ul/hj2jzMrqtqy9z+S/Ynu7kSvTLcSdW7XErlAtoQHddN0f6KB
         IBnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YKGof1EaBrEeA7rciwlZxnMtbYUb4+mL1sFVdHRp+Wk=;
        b=lnHvtQIQwF9amd6768eG3GJPWZFXOIKWzFOaXMbfckYxeaG7bC9uEgSM7b0zjYUQZR
         ybH5FTNe0dY1pbApRvauE4Qa9TfdURT4B7VJ3cbbn7dItw2SY9Ge1P4XTv47LWp/bvr1
         uA9J+AP7iK7pTCQtuY2cGK9OoLMztUOYsQkTybHk17EuFiytoVkJUnQlDEIlYboxMDoI
         8xbLPEJkVjCWeYDgVuOuPX4b9xzam7/4xXav9IAMF7uzR1DmjYghYfxA/Mxp6G8GXkyB
         PffWa1797kbIFx9FkwklD8DAFRtN+DFgZRTU/+T5xL6VXMgbkgfSOnpbR6ibTFpydjKn
         FwSw==
X-Gm-Message-State: AO0yUKWt3HWsCu5NRU6XGRGGQeasXMg2IYyOoyYRjbJ8qWVcJSOMna//
        VX3Ono7Wz1ogaFURCakPpiw=
X-Google-Smtp-Source: AK7set/dVtfI0qEp+0j7gFN89qtE4dawyLb8iF6RKLhrJOW3dXjPtRI9CxmHAsggJJ+i8qACBgjLLQ==
X-Received: by 2002:a17:906:a189:b0:87b:db62:d659 with SMTP id s9-20020a170906a18900b0087bdb62d659mr4330063ejy.19.1675788580570;
        Tue, 07 Feb 2023 08:49:40 -0800 (PST)
Received: from localhost (tor-exit-at-the.quesadilla.party. [103.251.167.21])
        by smtp.gmail.com with ESMTPSA id z20-20020a1709060ad400b0085d6bfc6201sm7090069ejf.86.2023.02.07.08.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 08:49:40 -0800 (PST)
Date:   Tue, 7 Feb 2023 18:49:33 +0200
From:   Maxim Mikityanskiy <maxtram95@gmail.com>
To:     "Lopez, Jorge A (Security)" <jorge.lopez2@hp.com>
Cc:     Alex Hung <alexhung@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>,
        Rishit Bansal <rishitbansal0@gmail.com>,
        Enver Balalic <balalic.enver@gmail.com>
Subject: Re: Firmware upgrade broke SW_TABLET_MODE on HP Dragonfly G2
Message-ID: <Y+KBHcOwGMG5Z+zA@mail.gmail.com>
References: <Y+JbBiMJw+VLo2Nr@mail.gmail.com>
 <PH0PR84MB1953959E3B2E51839A529CBFA8DB9@PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PH0PR84MB1953959E3B2E51839A529CBFA8DB9@PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, Feb 07, 2023 at 04:14:18PM +0000, Lopez, Jorge A (Security) wrote:
> Hi Maxim,
> 
> Thank you for the detailed debugging and information.  
> 
> The BIOS upgrade should have not affected the tablet mode behaviour.  Unfortunately, HP does not have an official process to support HP Dragonfly G2 under Linux that I am aware of with exception of a few HP team members.  Nonetheless, this is unacceptable, and I will forward the information to the BIOS team for them to investigate.
> Personally, I work in a different team so I will try to get a patch out depending on BIOS team response.  

Thanks a lot Jorge, you are really helpful! Let's see what the BIOS team
says then, please keep me updated.

> 
> 
> 
> Regards,
> 
> Jorge Lopez
> Hewlett-Packard 
> 
> "Once you stop learning, you start dying"
> Albert Einstein
> 
> > -----Original Message-----
> > From: Maxim Mikityanskiy <maxtram95@gmail.com>
> > Sent: Tuesday, February 7, 2023 8:07 AM
> > To: Lopez, Jorge A (Security) <jorge.lopez2@hp.com>; Alex Hung
> > <alexhung@gmail.com>; Hans de Goede <hdegoede@redhat.com>; Mark
> > Gross <markgross@kernel.org>; platform-driver-x86@vger.kernel.org
> > Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>; Mario Limonciello
> > <mario.limonciello@amd.com>; Barnabás Pőcze <pobrn@protonmail.com>;
> > Rishit Bansal <rishitbansal0@gmail.com>; Enver Balalic
> > <balalic.enver@gmail.com>
> > Subject: Firmware upgrade broke SW_TABLET_MODE on HP Dragonfly G2
> > 
> > CAUTION: External Email
> > 
> > Hello,
> > 
> > I use HP Dragonfly G2, Arch linux, kernel 6.1.9, and I upgraded the firmware
> > from 1.9.1 to 1.11 (using fwupdmgr/LVFS), and this upgrade broke tablet
> > mode detection on my laptop. I did some debugging, and that's what I
> > found:
> > 
> > 1. On both firmware versions: hp-wmi registers SW_TABLET_MODE, but
> > never reports events. Although HPWMI_EVENT_GUID is present on my
> > system, hp_wmi_notify never gets any events of any kind. Good thing is that
> > at least hp_wmi_get_tablet_mode (/sys/devices/platform/hp-wmi/tablet)
> > works on my laptop.
> > 
> > 2. "Intel HID switches" is the device that reports actual SW_TABLET_MODE
> > events on firmware 1.9.1, but not anymore on firmware 1.11.
> > SW_TABLET_MODE is registered after the first event (by auto_add_switch,
> > on firmware 1.9.1 only).
> > 
> > 3. SW_TABLET_MODE reported by "Intel HID switches" (on firmware 1.9.1)
> > differs from /sys/devices/platform/hp-wmi/tablet, when the laptop is not
> > fully folded, but put into a stand position (the hinge is open more than
> > 180°, the keyboard faces the table). The reason is because hp-wmi only
> > treats system_device_mode[0] == 6 as tablet, but 5 (stand mode) isn't
> > included, while "Intel HID switches" report SW_TABLET_MODE = 1 in the
> > stand mode.
> > 
> > I'm pretty sure about my findings, I flashed each of these two firmware
> > versions again and tested what happens in hp-wmi and intel/hid, of course
> > without changing any software versions.
> > 
> > Regarding point 3, I can send a patch for hp-wmi, but it's not going to be
> > useful for my laptop because of point 1, and I can't be fully sure it doesn't
> > break other HP laptops (unless Jorge confirms?).
> > 
> > Now back to the main topic. There are two directions that I see:
> > 
> > 1. Fix the regression in the firmware and make Intel HID switches work
> > again. Unfortunately, I didn't have success reporting the firmware bug via
> > HP customer support, and they don't seem to admit the bug or even having
> > uploaded their firmware to LVFS. If Jorge (or anyone else on the mailing list)
> > could give me some contact of a person responsible for firmware on LVFS or
> > the proper way to file a bug report, I would highly appreciate it. Maybe Alex
> > has an idea why intel/hid could stop working?
> > 
> > 2. Somehow tweak hp-wmi to start getting events on my laptop and switch
> > to SW_TABLET_MODE reports from hp-wmi (also fixing the stand mode
> > reports). For this, I would need help from Jorge (or someone who knows HP
> > laptop internals), I don't have ideas why it might be broken for me.
> > 
> > I will appreciate any help, and I'm happy to provide additional information
> > if needed.
> > 
> > Thanks,
> > Max
> 

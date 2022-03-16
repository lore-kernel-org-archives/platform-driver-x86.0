Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19581C433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Mar 2022 20:13:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345643AbiCPUPI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 16 Mar 2022 16:15:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237845AbiCPUPF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 16 Mar 2022 16:15:05 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0424C2C131
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Mar 2022 13:13:51 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id 1so2848691qke.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Mar 2022 13:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=aKE+Cit8eEUjLUyfWWNsql+5B4eKvzfrB1KogqRS2Zc=;
        b=ZZMBd1BTgXADDgtPnQGS8LyLQK4l3kJ/dBgk4T1u70xs4vc/eMA2wLtK+kai3T5ENO
         gvQuuPkAX86AjQ4mxgv7ZGmtXqiDrqGKqZAvdP/cYEC2VnUdbveqJV3JGu9WsEnAarvN
         supdUcFyIeIrxnfQmlNx59JZ36BVAtI6nGNShBfI1kXcAgOwS6iGsyEFBW2g+p3cIaSl
         E7a+YDB8PowPowT6WtBv4PhPE1HwXdkAmxfbDZGKSZGTHkmz1cIWlpsjE7gZViAcamhA
         C+TXScKxztH1+9tJbedH8LalEmlnh9VhEuCQN1a8XUHK0RkMsUCzSHS086febUrbbZXM
         qEwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=aKE+Cit8eEUjLUyfWWNsql+5B4eKvzfrB1KogqRS2Zc=;
        b=5lKvpK/lkjGzR/aQn4tq/simHbURPvaMiE7FvxbzWkXeUovP7+xdn5+2ujMjMLjKJQ
         7XbZaEGDz+f1RGvHgatz0Rqf8GPVeyVq+yrBYIyi7LH6pJEI3xAmNpmHXHrBXLRbg4Lx
         rWVWjE36wAwlh/eHnPuj/wr/lowfXUnynk69BskGAaJQrKHe7OspRwUCpJKSzXi/6mix
         thA/fI4cTL4+13x8TZyJvwxMFR97sgbWUfK4Wv48ZMyAwewHQy7uPosL7Sm/6AYPPcVF
         gVUONYXylebFT3e5sQ+Ze3AFNFsq4dibIiLfbgewXo2S/WsE5puPhybsf65oEVpVnLMh
         25xQ==
X-Gm-Message-State: AOAM533L5e5/NsgKuUVj3WxDueeiYWR6k0mrlQLopnFFqYi/xVcJo0PF
        FGkHpoJ0Q2pzY/vFkcN3SGU5KviyYW8ir1Dkz84LIiftA6Y9zA==
X-Google-Smtp-Source: ABdhPJzWa8xHDNxdn1IFzMRKMe8CYXVREwImFLphRzQLFGP7grVoCgSK+6HlWXOfSw09PAvgpgE4PIcZ7OdWXtBKeqo=
X-Received: by 2002:a05:620a:404f:b0:67d:dc82:6319 with SMTP id
 i15-20020a05620a404f00b0067ddc826319mr943851qko.359.1647461630010; Wed, 16
 Mar 2022 13:13:50 -0700 (PDT)
MIME-Version: 1.0
From:   Alexandru Dinu <alex.dinu07@gmail.com>
Date:   Wed, 16 Mar 2022 22:13:14 +0200
Message-ID: <CAJOTRr6bhe7pHPAH04BYpwjY9k2bu5ufK93vo6FsWO8U+02zXg@mail.gmail.com>
Subject: RE: [PATCH] nvidia-wmi-ec-backlight: Add workarounds for confused firmware
To:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

> I'll send out a v2 shortly: Alex, can you
please retest when I do to make sure there aren't any regressions? None
of these suggestions affect the core flow of how either of the
workarounds work, so I'm not expecting any that wouldn't also reproduce
on my EC backlight system that doesn't have either of these problems,
but I can send you the updated version off-list first if you prefer.

It's ok either way. You can send me an updated version off-list.

> Alex, just FYI this was something that came to an AMD bug tracker and wanted you to be aware there are W/A going into nvidia-wmi-ec-backlight for some firmware problems with the mux.
IIRC that was the original suspicion too on the bug reports.

Yes, thanks -- I followed this issue first:
https://gitlab.freedesktop.org/drm/amd/-/issues/1671.

> However I think it's still worth at least noting near the quirk in a comment
what firmware version it was identified.  If later there is confirmation that
a particular firmware version had fixed it the quirk can be adjusted to be
dropped.

That's a good tip. The laptop I tested this on (Lenovo Legion S7
15ACH6) originally shipped with:

UEFI: LENOVO v: HACN27WW date: 08/02/2021

There is an update to version HACN31WW -- see
https://support.lenovo.com/ro/en/downloads/ds550201-bios-update-for-windows-10-64-bit-legion-s7-15ach6
I updated, however, the issue was not addressed, which seems to be
expected given the rather short /changelog:
HACN31WW
BIOS Notification    :
1. Fixed
 1) N/A.
2. Add
  1) Add BOE0A1C support with Cookie and DR Key
3. Modified
  1) Modify MinShortTerm & MinLongTerm PowerLimit value
EC Notification      :
1. Fixed
  1) None.
2. Add
   1) None.
3. Modified
  1)None.

> If you end up introducing a module parameter to try to activate these quirks
it might be viable to ask the folks in those issues to try the v2 of
your patch too
when you're ready with the module parameter.

I posted a link to this mailing list to
https://gitlab.freedesktop.org/drm/amd/-/issues/1671, so people can be
aware and try to test.

Regards,
Alex

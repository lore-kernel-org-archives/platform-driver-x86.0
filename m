Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2E1AC63777
	for <platform-driver-x86@archiver.kernel.org>; Wed, 25 Nov 2020 09:08:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 918F7206F9
	for <platform-driver-x86@archiver.kernel.org>; Wed, 25 Nov 2020 09:08:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pMc/87l5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726614AbgKYJH7 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 25 Nov 2020 04:07:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726284AbgKYJH6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 25 Nov 2020 04:07:58 -0500
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2F4DC0613D4
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2020 01:07:58 -0800 (PST)
Received: by mail-il1-x12d.google.com with SMTP id k8so1454501ilr.4
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2020 01:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IbmfGTNFdF4KKbGJR49a0FviWxRTXELhGNCg8LdU4e8=;
        b=pMc/87l5zA53Dl8W0jOa8A8u3P3oa8ieunl2+9psHTOCuy7jcDR68sth5WE172aMU6
         Qe23mU4FaiWwp6dp9+ZriokvrjT3qKZ0kDODXuTi/6uc/VweZvD8oPdZ+JWeDfZvhMji
         ot0C37qiMxy8HUjWIIRUSH1AXEVrH2tZM5vmxIVhgDWn+F3wP+udKYI7V9ZcxS6m27OZ
         MhSCTqsByzeksQ66R6vhsl96DQopm5Ka3H3O8yb+inryU9oIfk/gEpuzZo56J7TJHpGC
         1WVtgzOWKk3BAvwM3xXqZdcs/tVLa4AoFatjzEJo4npSXg4PdogonAIEG8FwHjRpOFCn
         eNdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IbmfGTNFdF4KKbGJR49a0FviWxRTXELhGNCg8LdU4e8=;
        b=cBHlAzj9/Oz2Ju17S6MEED+dhh7ExE7tPh8OP3cbNgEmIqWOjGNbE3gt3zVGDTvmfm
         nixrfpjF9Bre0zPS0vAJzKqsbnPoVnzibokNO2yiPQMFrQ63mLa0yjc6FX50HWOKQrXJ
         Bcpn9z5zD5Z1HARsurIq47zJ4KuMwAxh7AsiCwM7lphc+Oq3q9fmTkxBj8QDIyJqM89T
         y1zQomUkOQE6A/YKWkpNlQJ7ydjWoq6+KIBvvg+5gBuxhkyhOHK1X8a0Ez68fHnAHBih
         AGhaMYTVGvUI4hSabq9q6CfcqNGt8AEplWVgfdYX1zZvBJDcR5pul6O80Bq4a3MB2FHO
         DNXw==
X-Gm-Message-State: AOAM532mCiMXW93lXIT7hyp1fc2X6rtozM/w/Fzi7k5zgAzWw1nPqhed
        pHn8yXsSx1zIc6BGWbmTuOSewhfaJaVQB5Z8edjfUlNluUE=
X-Google-Smtp-Source: ABdhPJw1HqbUuMjkYXbhqMGiswl1HGOPhJdlSOxnqsG5v5bbjbMKk7FFPNKQJvXHGWXlBQ4rKagJdtiFz4Cuqqr3f+c=
X-Received: by 2002:a92:da10:: with SMTP id z16mr2098009ilm.20.1606295278297;
 Wed, 25 Nov 2020 01:07:58 -0800 (PST)
MIME-Version: 1.0
References: <CAC+zXp_w2T5BYvzC+rF+7LGsgn64+9rLt8BT-=X2XE7qKqG=QQ@mail.gmail.com>
 <0c2fd9aa-7af4-5adb-ae6d-923c5eefb0b8@redhat.com> <dd32369a-f85e-45f2-dbc3-97721a253de1@redhat.com>
 <6b34e486-69bc-4d1d-5217-44936cc57de7@redhat.com>
In-Reply-To: <6b34e486-69bc-4d1d-5217-44936cc57de7@redhat.com>
From:   Mamchyts Dmitry <mamchyts@gmail.com>
Date:   Wed, 25 Nov 2020 12:07:47 +0300
Message-ID: <CAC+zXp-7tU=C6yNK2Neeh9GS83-i5k4o3XxEPc7zjMT_R0oyzQ@mail.gmail.com>
Subject: Re: Asus Zephyrus G14 GA401IH-HE003 problem with sound and fan
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     platform-driver-x86@vger.kernel.org,
        andriy.shevchenko@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi, ok
Thank you. I will report issue into https://bugzilla.kernel.org/ -
category Sound(ALSA)

On Wed, Nov 25, 2020 at 12:35 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 11/24/20 10:34 PM, Hans de Goede wrote:
> > Hi,
> >
> > On 11/24/20 2:28 PM, Hans de Goede wrote:
> >> Hi,
> >>
> >> On 11/12/20 8:19 PM, Mamchyts Dmitry wrote:
> >>> I got an Asus Zephyrus G14 GA401IH-HE003 with AMD Ryzen 7 4800HS and a
> >>> NVIDIA GeForce GTX 1650.
> >>> I am use 5.9.8-050908-generic kernel from
> >>> (kernel.ubuntu.com/~kernel-ppa/mainline/v5.9.8/)
> >>>
> >>>     dmamchyts@ga401ih:~$ cat /etc/os-release
> >>>     NAME="Ubuntu"
> >>>     VERSION="20.10 (Groovy Gorilla)"
> >>>
> >>> I have some problem with sound and fan:
> >>> The first problem is a sound from notebook speakers: when I use
> >>> headphones via 3.5 jack - all works fine. I can control sound level
> >>> (from low to high). But when I try to listen to any sounds from
> >>> notebook speakers - volume always has a high level (I think it's a max
> >>> level of notebook speakers sound). I am using KDE, and I hear a sound
> >>> level of 5% the same as 100%.
> >>
> >> Next time please try reporting 1 issue per bug report. The
> >> platform-driver-x86@vger.kernel.org mailinglist is the right address
> >> for the fan issue, but for the sound issue you really should send
> >> a separate bug report to the sound/alsa developers.
> >
> > I asked the sound devs what they best place is to report a bug for
> > this and they told me the best place is:
> >
> > https://bugzilla.kernel.org/ - category Sound(ALSA)
>
> p.s. they also said:
>
> > Usually, the first request to reporter is to provide the the output from
> > the alsa-info.sh script (in alsa-utils) to see the sound specific information.
>
> So please attach alsa-info.sh output to the bug when you file it.
>
> Regards,
>
> Hans
>

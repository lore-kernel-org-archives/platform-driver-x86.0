From: Daniel Drake <drake@endlessm.com>
Subject: Re: [PATCH] asus-nb-wmi: Add wapf=4 quirk for X456UA/X456UF
Date: Mon, 7 Sep 2015 07:55:43 -0600
Message-ID: <CAD8Lp47xazmsX8vt0Syc+gTjahDmeKnuNecGPXY=dtr0aV0wKA@mail.gmail.com>
References: <1441231834-12873-1-git-send-email-drake@endlessm.com>
	<20150903225452.GA60159@vmdeb7>
	<CAHR064ihJRzCCqOTn4fdhZSUae4Qfwed0fHUUfU56CDduBUGPQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f170.google.com ([209.85.212.170]:36628 "EHLO
	mail-wi0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751206AbbIGNzo (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 7 Sep 2015 09:55:44 -0400
Received: by wicgb1 with SMTP id gb1so46764682wic.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 07 Sep 2015 06:55:43 -0700 (PDT)
In-Reply-To: <CAHR064ihJRzCCqOTn4fdhZSUae4Qfwed0fHUUfU56CDduBUGPQ@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, AceLan Kao <acelan.kao@canonical.com>, Carlo Caione <carlo@endlessm.com>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

On Sun, Sep 6, 2015 at 2:40 AM, Corentin Chary <corentin.chary@gmail.com> wrote:
> Looks good.
>
> Acked-by: Corentin Chary <corentin.chary@gmail.com>
>
> I'd like to get somebody from Asus help us guess these values instead
> of just hard-coding them.. Unfortunately I have no contact with them
> anymore.

I'll see if I can get a conversation going. I don't fully grasp this
WAPF situation though. Are you hoping that they would provide us with
a complete list of laptops to quirk, or do you think there is instead
some way we could improve the code to work with all models without a
specific whitelist/blacklist?

Thanks
Daniel

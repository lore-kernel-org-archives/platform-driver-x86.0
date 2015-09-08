From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH] asus-nb-wmi: Add wapf=4 quirk for X456UA/X456UF
Date: Tue, 8 Sep 2015 11:28:23 +0200
Message-ID: <CAHR064jg7NKUkZHeAjNFQsdreLKLZHWqKHypDQb1UOw5V9e1uQ@mail.gmail.com>
References: <1441231834-12873-1-git-send-email-drake@endlessm.com>
	<20150903225452.GA60159@vmdeb7>
	<CAHR064ihJRzCCqOTn4fdhZSUae4Qfwed0fHUUfU56CDduBUGPQ@mail.gmail.com>
	<CAD8Lp47xazmsX8vt0Syc+gTjahDmeKnuNecGPXY=dtr0aV0wKA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lb0-f173.google.com ([209.85.217.173]:33509 "EHLO
	mail-lb0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754416AbbIHJ2Z (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 8 Sep 2015 05:28:25 -0400
Received: by lbcjc2 with SMTP id jc2so49808139lbc.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 08 Sep 2015 02:28:23 -0700 (PDT)
In-Reply-To: <CAD8Lp47xazmsX8vt0Syc+gTjahDmeKnuNecGPXY=dtr0aV0wKA@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Daniel Drake <drake@endlessm.com>
Cc: Darren Hart <dvhart@infradead.org>, AceLan Kao <acelan.kao@canonical.com>, Carlo Caione <carlo@endlessm.com>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

On Mon, Sep 7, 2015 at 3:55 PM, Daniel Drake <drake@endlessm.com> wrote:
> On Sun, Sep 6, 2015 at 2:40 AM, Corentin Chary <corentin.chary@gmail.com> wrote:
>> Looks good.
>>
>> Acked-by: Corentin Chary <corentin.chary@gmail.com>
>>
>> I'd like to get somebody from Asus help us guess these values instead
>> of just hard-coding them.. Unfortunately I have no contact with them
>> anymore.
>
> I'll see if I can get a conversation going. I don't fully grasp this
> WAPF situation though. Are you hoping that they would provide us with
> a complete list of laptops to quirk, or do you think there is instead
> some way we could improve the code to work with all models without a
> specific whitelist/blacklist?

I think at least having proper documentation of the intended behavior
of WAPF and how they themselves set the value for windows would be
great.

> Thanks
> Daniel



-- 
Corentin Chary
http://xf.iksaif.net

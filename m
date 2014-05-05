From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Subject: Re: [PATCH v2] mba6x_bl: Backlight driver for mid 2013 MacBook Air
Date: Mon, 5 May 2014 22:26:20 +0200
Message-ID: <CAMeQTsZriJatEY7cd7BsrNfnQ7FhEFN_afbdDFuKjzwk7dxCDw@mail.gmail.com>
References: <1398781312-3607-1-git-send-email-patrik.r.jakobsson@gmail.com>
	<CAMeQTsYA0tGQ1SfhNhMctPW6H_y1NGjGXsM5ZcMSwOqE-bApyg@mail.gmail.com>
	<1399314503.17557.0.camel@x230.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-la0-f47.google.com ([209.85.215.47]:36623 "EHLO
	mail-la0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752411AbaEEU0W (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 5 May 2014 16:26:22 -0400
In-Reply-To: <1399314503.17557.0.camel@x230.lan>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>
Cc: "hdegoede@redhat.com" <hdegoede@redhat.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

On Mon, May 5, 2014 at 8:28 PM, Matthew Garrett
<matthew.garrett@nebula.com> wrote:
> On Mon, 2014-05-05 at 16:49 +0200, Patrik Jakobsson wrote:
>> Hi Matthew,
>>
>> This seems to be in good shape. Do you have anything to add?
>> If not, can you pick this patch up through platform-drivers-x86?
>
> I'm a bit reluctant. Do we have any evidence that this is the way OS X
> behaves? What's the actual difference in state before and after suspend?

I cannot see any change in state on either the LP8550 or on the Intel GPU side.
Both me and Jani have twisted our heads around this but cannot see anything
wrong. The ACPI methods only trigger the opregion so that's a dead end as well.
My guess is that OSX is quirking this in the GPU driver which is something that
doesn't belong in i915.

So unfortunately, this is the best approach I can come up with without probing
the signal or reversing the OSX GPU driver.

Thanks
Patrik

> --
> Matthew Garrett <matthew.garrett@nebula.com>

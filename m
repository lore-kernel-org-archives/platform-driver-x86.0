From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v4 04/14] platform/x86: dell-wmi: increase severity of
 some failures
Date: Thu, 5 Oct 2017 21:22:31 +0300
Message-ID: <CAHp75Vec=VX9CZSzBWDX5YCEKSoAn=B0403g+1Xhg4Jo5g00HA@mail.gmail.com>
References: <cover.1507156392.git.mario.limonciello@dell.com>
 <f9dd40ebcda3238fa431a8a0d38595b808fae38b.1507156392.git.mario.limonciello@dell.com>
 <CAHp75Vd2h5K-Zi4VP=Qesx9=kEEsD-pJGWzBE_LmVVuqPt=h9w@mail.gmail.com> <720fa15b9c6840e79452186ccbdd50ce@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f182.google.com ([209.85.216.182]:53333 "EHLO
        mail-qt0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751421AbdJESWc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 5 Oct 2017 14:22:32 -0400
In-Reply-To: <720fa15b9c6840e79452186ccbdd50ce@ausx13mpc120.AMER.DELL.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <Mario.Limonciello@dell.com>
Cc: "dvhart@infradead.org" <dvhart@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, mjg59@google.com, Christoph Hellwig <hch@lst.de>, Greg KH <greg@kroah.com>

On Thu, Oct 5, 2017 at 6:02 PM,  <Mario.Limonciello@dell.com> wrote:

>> > -       if (strncmp(obj->string.pointer, "DELL WMI", 8) != 0)
>> > -               dev_warn(&wdev->dev, "Dell descriptor buffer has invalid signature
>> (%8ph)\n",
>> > +       if (strncmp(obj->string.pointer, "DELL WMI", 8) != 0) {
>> > +               dev_err(&wdev->dev, "Dell descriptor buffer has invalid signature
>> (%8ph)\n",
>>
>> A nit: ping-pong programming detected.
>> Looks like current patch 2 should go at least after this one.

> I'll re-order them, but either way both patches are touching these lines in some
> way.

Yeah, I noticed as well.

The rule of thumb is to arrange such small and non-so-important clean
ups at the tail of the series (as possible).

-- 
With Best Regards,
Andy Shevchenko

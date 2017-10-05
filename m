From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v4 08/14] platform/x86: dell-smbios: Add a sysfs interface
 for SMBIOS tokens
Date: Thu, 5 Oct 2017 17:22:05 +0300
Message-ID: <CAHp75VcCqB5v1=z3VvnKKG7KT7XND0d-2S823siqaC5EZPdLXA@mail.gmail.com>
References: <cover.1507156392.git.mario.limonciello@dell.com>
 <0af6d03ee32bd5c1529a38de008aa94c03331d7e.1507156392.git.mario.limonciello@dell.com>
 <CAHp75VdT5Dofm+O4cVfADhZu_PFB345-VNbc8os_c4qDaegB-w@mail.gmail.com> <377f8d466565498aa50d8e39a0caf08d@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f195.google.com ([209.85.220.195]:34049 "EHLO
        mail-qk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751350AbdJEOWH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 5 Oct 2017 10:22:07 -0400
In-Reply-To: <377f8d466565498aa50d8e39a0caf08d@ausx13mpc120.AMER.DELL.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <Mario.Limonciello@dell.com>
Cc: "dvhart@infradead.org" <dvhart@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, mjg59@google.com, Christoph Hellwig <hch@lst.de>, Greg KH <greg@kroah.com>

On Thu, Oct 5, 2017 at 4:58 PM,  <Mario.Limonciello@dell.com> wrote:

>> > Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>>
>> To be clear I just suggested the output format in ->show() callback.
>
> Andy, do you mean you would prefer not to be attributed in the description,
> or should I be clearer that was your suggestion?

I think that there is bigger threshold for being included one's name
in Suggested-by tag. You have few dozens of lines changed and only one
is suggested by me. And that one doesn't influence the initial idea,
just a format change.

So, I'm not against it per se, I just think it confuses more than attributes.

Summarize: I would not put it in this patch.

-- 
With Best Regards,
Andy Shevchenko

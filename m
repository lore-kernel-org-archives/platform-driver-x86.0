From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 10/15] platform/x86: wmi: make device_type const
Date: Wed, 30 Aug 2017 22:23:15 +0300
Message-ID: <CAHp75VfGrHiEO_J69UCxfTAbqwjE_AUzUCv3pvtz6Xjcx0i3Pg@mail.gmail.com>
References: <1503130946-2854-1-git-send-email-bhumirks@gmail.com> <1503130946-2854-11-git-send-email-bhumirks@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f196.google.com ([209.85.216.196]:34609 "EHLO
        mail-qt0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750757AbdH3TXQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 30 Aug 2017 15:23:16 -0400
In-Reply-To: <1503130946-2854-11-git-send-email-bhumirks@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Bhumika Goyal <bhumirks@gmail.com>, Andy Lutomirski <luto@kernel.org>
Cc: "dvhart@infradead.org" <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sat, Aug 19, 2017 at 11:22 AM, Bhumika Goyal <bhumirks@gmail.com> wrote:
> Make these const as they are only stored in the type field of a device
> structure, which is const.
> Done using Coccinelle.
>

Please, stop spamming so many people and MLs with no relation to the subsystem!

Now, resend with reduced Cc (see headers) and don't forget to include
Andy Lutomirski


-- 
With Best Regards,
Andy Shevchenko

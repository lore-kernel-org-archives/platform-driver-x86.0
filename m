From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH][V2] intel-hid: add a DMI quirk to support Wacom
 MobileStudio Pro
Date: Tue, 12 Dec 2017 18:13:48 +0200
Message-ID: <CAHp75VcRdjJef3VmBkF-pVu+bn=ho2aX26u=u2EXukT7mkpwWw@mail.gmail.com>
References: <1512618023-30209-1-git-send-email-alex.hung@canonical.com>
 <20171209000423.GD14187@fury> <CANRwn3SpSfwpJk7OitXv6aLK4ES=AbHkmj7iyQsUP_dbZqbJTA@mail.gmail.com>
 <20171212005118.GF27831@fury> <CAHp75VeDarmDs1tALkv4tiO_NMa7uhC26bF_Yc0Bv98KpK_nHw@mail.gmail.com>
 <20171212160012.GI27831@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f181.google.com ([209.85.216.181]:36488 "EHLO
        mail-qt0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752172AbdLLQNu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 12 Dec 2017 11:13:50 -0500
Received: by mail-qt0-f181.google.com with SMTP id a16so48583527qtj.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 12 Dec 2017 08:13:49 -0800 (PST)
In-Reply-To: <20171212160012.GI27831@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Jason Gerecke <killertofu@gmail.com>, Alex Hung <alex.hung@canonical.com>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Jason Gerecke <jason.gerecke@wacom.com>

On Tue, Dec 12, 2017 at 6:00 PM, Darren Hart <dvhart@infradead.org> wrote:
> On Tue, Dec 12, 2017 at 10:02:36AM +0200, Andy Shevchenko wrote:

>> Just in case you didn't promote it yet, could you move inclusion to be
>> more ordered alphabetically? (After linux/acpi.h I suppose)
>
> I had done that initially, but realized the entire list is in no apparent order
> and it wasn't just moving the one line he added. So it'll need to be a cleanup
> patch since all the test builds have run already.

Ah, fair enough.

-- 
With Best Regards,
Andy Shevchenko

From: =?UTF-8?B?SsOpcsOpbXk=?= Lefaure <jeremy.lefaure@lse.epita.fr>
Subject: Re: [PATCH] platform/x86: asus-wmi: fix cpufv sysfs file permission
Date: Mon, 24 Apr 2017 11:31:17 -0400
Message-ID: <20170424113117.03ba9c77@blatinox-laptop.localdomain>
References: <20170422021945.5260-1-jeremy.lefaure@lse.epita.fr>
        <CAHp75Vf7qKmbzJLfsHJXw_DQ3t8+WKHLEzLHweAq5eE2TTHKNA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from blatinox.fr ([51.254.120.209]:35914 "EHLO vps202351.ovh.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S971449AbdDXPbW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 24 Apr 2017 11:31:22 -0400
In-Reply-To: <CAHp75Vf7qKmbzJLfsHJXw_DQ3t8+WKHLEzLHweAq5eE2TTHKNA@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, 24 Apr 2017 12:14:14 +0300
Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> On Sat, Apr 22, 2017 at 5:19 AM, Jérémy Lefaure
> <jeremy.lefaure@lse.epita.fr> wrote:
> > The cpufv sysfs file is defined as readable by anyone even if the
> > attribute does not have a show function. The result of every read is an
> > IO error. This file should be write only.  
> 
> Per se patch looks good to me, though would be better to add show()
> hook as well?
> 
It depends if we want to keep it write-only as it is documented in
Documentation/ABI/testing/sysfs-platform-asus-wmi.

If we want to have this file read/write, I can send a v2 of this patch.

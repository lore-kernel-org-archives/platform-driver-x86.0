From: Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH v2] dell-wmi, dell-laptop: hide dell-smbios
Date: Thu, 5 Jan 2017 09:12:57 +0100
Message-ID: <20170105091257.54e4b52d@endymion>
References: <20170104135917.43eedcc0@endymion>
        <CAHp75VfDWqba5igt48Kqtju7BdubPCaiTp+ixZ5+wZa3RgF5Jg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VfDWqba5igt48Kqtju7BdubPCaiTp+ixZ5+wZa3RgF5Jg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>, Pali =?UTF-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Hi Andy,

Thanks for the review.

On Wed, 4 Jan 2017 15:14:10 +0200, Andy Shevchenko wrote:
> On Wed, Jan 4, 2017 at 2:59 PM, Jean Delvare <jdelvare@suse.de> wrote:
> > Dell-smbios is a helper module, it serves no purpose on its own, so
> > do not present it as an option to the user. Instead, select it
> > automatically whenever a driver which needs it is selected.
> >
> 
> Please, use prefix "platform/x86: ".
> Perhaps, use just "dell_smbios: " as second one.

OK, will change.

> >  config DELL_SMBIOS
> > -       tristate "Dell SMBIOS Support"
> > -       depends on DCDBAS
> > +       tristate
> > +       select DCDBAS
> 
> >         default n
> 
> Do we need this one?

Probably not. "n" being the default default, I guess the 844
occurrences of "default n" in the Kconfig tree are pointless ;-)

I'll post v3 of the patch in a minute.

-- 
Jean Delvare
SUSE L3 Support

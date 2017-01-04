From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2] dell-wmi, dell-laptop: hide dell-smbios
Date: Wed, 4 Jan 2017 15:14:10 +0200
Message-ID: <CAHp75VfDWqba5igt48Kqtju7BdubPCaiTp+ixZ5+wZa3RgF5Jg@mail.gmail.com>
References: <20170104135917.43eedcc0@endymion>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170104135917.43eedcc0@endymion>
Sender: linux-kernel-owner@vger.kernel.org
To: Jean Delvare <jdelvare@suse.de>
Cc: Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jan 4, 2017 at 2:59 PM, Jean Delvare <jdelvare@suse.de> wrote:
> Dell-smbios is a helper module, it serves no purpose on its own, so
> do not present it as an option to the user. Instead, select it
> automatically whenever a driver which needs it is selected.
>

Please, use prefix "platform/x86: ".
Perhaps, use just "dell_smbios: " as second one.

>  config DELL_SMBIOS
> -       tristate "Dell SMBIOS Support"
> -       depends on DCDBAS
> +       tristate
> +       select DCDBAS

>         default n

Do we need this one?

-- 
With Best Regards,
Andy Shevchenko

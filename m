From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 1/3] platform/x86: dell-smbios: Correct some style warnings
Date: Tue, 27 Feb 2018 18:04:12 +0200
Message-ID: <CAHp75VfS4vif1_S1Z=z2jAZfERmsiqG0h0j5k6zrmjiQwPGekA@mail.gmail.com>
References: <1519747014-17561-1-git-send-email-mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1519747014-17561-1-git-send-email-mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: Darren Hart <dvhart@infradead.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, LKML <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Feb 27, 2018 at 5:56 PM, Mario Limonciello
<mario.limonciello@dell.com> wrote:

>         /* 4 bytes of table header, plus 7 bytes of Dell header, plus at least
> -          6 bytes of entry */
> +        * 6 bytes of entry
> +        */

I would prefer not to mix with net style, since you are fixing this, perhaps

/*
 * 4 ...
 * 6 ...
 */

?

-- 
With Best Regards,
Andy Shevchenko

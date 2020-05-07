From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: dell-laptop: don't register
 platform::micmute if the related tokens don't exist.
Date: Thu, 7 May 2020 15:58:26 +0300
Message-ID: <CAHp75VcC4sXC7_jbhFM2bE01NGks0zzQBNquAc_Xz6jcmwvkpw@mail.gmail.com>
References: <20200507122703.14617-1-koba.ko@canonical.com> <CAJB-X+XwshJp1ud32kXxRGkE+8WdM+=e1MSewmOUvgERk2yGMw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJB-X+XwshJp1ud32kXxRGkE+8WdM+=e1MSewmOUvgERk2yGMw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Koba Ko <koba.ko@canonical.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mario Limonciello <mario.limonciello@dell.com>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, May 7, 2020 at 3:36 PM Koba Ko <koba.ko@canonical.com> wrote:
>
> Hi All,
> I enhanced the patch and refine the commet.
> please check it again.

Thank you.
What you should or shouldn't have done:
- you need to use version in the patch (-v<n>, where <n> is a version)
- you need to write a changelog after cutter line '---' instead of
separate messages or so
- you need to avoid top postings like this very email you send
- you need to wait for a while (usually one day or so) to give a
change for people to look at it

-- 
With Best Regards,
Andy Shevchenko

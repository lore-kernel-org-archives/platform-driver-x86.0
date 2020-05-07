From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: dell-laptop: don't register
 platform::micmute if the related tokens don't exist.
Date: Thu, 7 May 2020 12:02:23 +0300
Message-ID: <CAHp75VfpX8dZEMkkGrpNyCRXojfvGoJEusYVpri=JCpArj-FRw@mail.gmail.com>
References: <20200507084932.5486-1-koba.ko@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200507084932.5486-1-koba.ko@canonical.com>
Sender: linux-kernel-owner@vger.kernel.org
To: koba.ko@canonical.com
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, May 7, 2020 at 11:49 AM <koba.ko@canonical.com> wrote:
>
> From: Koba Ko <koba.ko@canonical.com>
>
> First, get the related tokens of SMBIOS, GLOBAL_MIC_MUTE_DISABLE/ENABLE.
> If one of two tokens doesn't exist, don't register platform::micmute.

This doesn't explain why.

-- 
With Best Regards,
Andy Shevchenko

From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
Subject: Re: [PATCH] platform/x86: dell-laptop: don't register
 platform::micmute if the related tokens don't exist.
Date: Thu, 7 May 2020 14:57:40 +0200
Message-ID: <20200507125740.f3ttcsk4pqgb5xwj@pali>
References: <20200507094242.7523-1-koba.ko@canonical.com>
 <20200507111331.dzge7htw5toejh72@pali>
 <CAJB-X+WKqrWuKK0=BWtj7f8AovsMzbCO-QaLi2ZaP0_Q6321WQ@mail.gmail.com>
 <20200507114517.tslux7m7aysuwaok@pali>
 <CAHp75Vcz+HgR1Vxjio+HvLOi_gpZiZLe4P-iPtsLRY8nVWE2+w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHp75Vcz+HgR1Vxjio+HvLOi_gpZiZLe4P-iPtsLRY8nVWE2+w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Koba Ko <koba.ko@canonical.com>, Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thursday 07 May 2020 15:54:06 Andy Shevchenko wrote:
> On Thu, May 7, 2020 at 2:45 PM Pali Rohár <pali@kernel.org> wrote:
> > On Thursday 07 May 2020 19:27:47 Koba Ko wrote:
> 
> > > don't understand "registration and deregistration would be optional',
> > > could you explain more!?
> >
> > After your patch led_classdev_register() function is not always called.
> > And led_classdev_unregister() should not be called when there is no
> > device registered.
> 
> I think it's not a strong requirement after the commit
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=1dbb9fb4082ce2a2f1cf9596881ddece062d15d0

Thank you for update. I did know about this change.

From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 0/3] Auto configuration mode and error
Date: Wed, 9 Oct 2019 14:46:22 +0300
Message-ID: <CAHp75VeJPNhuWK0NiTg9dWk9Kg26ApzVi7NUKfGxydHm1v6bPA@mail.gmail.com>
References: <20190923185906.76032-1-srinivas.pandruvada@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190923185906.76032-1-srinivas.pandruvada@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: Andriy Shevchenko <andriy.shevchenko@intel.com>, Prarit Bhargava <prarit@redhat.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Sep 26, 2019 at 1:32 AM Srinivas Pandruvada
<srinivas.pandruvada@linux.intel.com> wrote:
>
> These are some changes, which help users to use the base-freq and
> turbo-freq features without going through multiple steps for
> basic configuration. Also add some error when user is trying
> to disable core-power feature while it is getting used.
>
> None of these patches are urgent and can wait for kernel version v5.5.

I'm completely lost in ISST patches.
Please send an updated version of the entire bunch of changes for ISST
driver and do the same for tools.
Thanks.

I'm going to drop these ones from my review queue, so, I'm expecting
it as a part of new version against tools.

-- 
With Best Regards,
Andy Shevchenko

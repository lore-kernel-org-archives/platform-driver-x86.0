From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v1 0/6] PMC Driver cleanup
Date: Thu, 11 Jan 2018 15:39:08 +0200
Message-ID: <CAHp75VfCMXJrAxvRYZnjFYwPxMaqEmBZtA1uoE_PS=1HLveF+g@mail.gmail.com>
References: <1515669036-3465-1-git-send-email-rajneesh.bhardwaj@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f196.google.com ([209.85.220.196]:32799 "EHLO
        mail-qk0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932693AbeAKNjJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 11 Jan 2018 08:39:09 -0500
In-Reply-To: <1515669036-3465-1-git-send-email-rajneesh.bhardwaj@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Vishwanath Somayaji <vishwanath.somayaji@intel.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

On Thu, Jan 11, 2018 at 1:10 PM, Rajneesh Bhardwaj
<rajneesh.bhardwaj@intel.com> wrote:
> This patch series aims to cleanup the PMC Core driver and convert it to a
> module.
>
> Subsequent patch series will add support for newer Intel SoC like Coffeelake
> and Cannonlake, this series builds a foundation for them.
>

All 6 are pushed to my review and testing queue, thanks!

> Rajneesh Bhardwaj (5):
>   platform/x86: intel_pmc_core: Remove unused EXPORTED API
>   platform/x86: intel_pmc_core: Remove unused variable
>   platform/x86: intel_pmc_core: Fix kernel doc for pmc_dev
>   platform/x86: intel_pmc_core: Fix file permission warnings
>   platform/x86: intel_pmc_core: Update Kconfig
>
> Srinivas Pandruvada (1):
>   platform/x86: intel_pmc_core: Change driver to a module
>
>  drivers/platform/x86/Kconfig          |  7 ++--
>  drivers/platform/x86/intel_pmc_core.c | 65 +++++++++++------------------------
>  drivers/platform/x86/intel_pmc_core.h | 15 ++++----
>  3 files changed, 32 insertions(+), 55 deletions(-)
>
> --
> 2.7.4
>



-- 
With Best Regards,
Andy Shevchenko

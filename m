From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 0/3] Get rid of BUG()
Date: Sat, 28 Jan 2017 15:32:17 +0200
Message-ID: <CAHp75VeZ13zeEL_pG6CGnD9Tzi0aGDwHvFdTEU8p0AsC1x1hdA@mail.gmail.com>
References: <20170126212038.12809-1-jarkko.sakkinen@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170126212038.12809-1-jarkko.sakkinen@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: intel-sgx-kernel-dev@lists.01.org, open list <linux-kernel@vger.kernel.org>, "open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Jan 26, 2017 at 11:20 PM, Jarkko Sakkinen
<jarkko.sakkinen@linux.intel.com> wrote:
> The use of BUG() is not favored for any new kernel code. This patch set
> implements more reasonable error recovery. In all cases the recovery is not
> ideal but it is an improvement to the current situation.
>
> In addition, sgx_free_page() has been simplified by removing the parameter for
> skipping EREMOVE. EREMOVE can be successfully executed for an unused EPC page.
>
> Jarkko Sakkinen (3):

By some reason I only see first patch.
What's going on?

>   intel_sgx: do not use BUG() in sgx_free_page()
>   intel_sgx: remove flags parameter from sgx_free_page()
>   intel_sgx: fix error paths for EBLOCK and ETRACK
>
>  drivers/platform/x86/intel_sgx.h            |  4 +-
>  drivers/platform/x86/intel_sgx_ioctl.c      | 12 ++--
>  drivers/platform/x86/intel_sgx_page_cache.c | 89 +++++++++++++++--------------
>  drivers/platform/x86/intel_sgx_util.c       |  6 +-
>  drivers/platform/x86/intel_sgx_vma.c        |  6 +-
>  5 files changed, 55 insertions(+), 62 deletions(-)
>
> --
> 2.9.3
>



-- 
With Best Regards,
Andy Shevchenko

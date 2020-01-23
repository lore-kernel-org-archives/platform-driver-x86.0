From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 0/5] Intel Speed Select Core Power Support
Date: Thu, 23 Jan 2020 14:32:34 +0200
Message-ID: <CAHp75VcJXC6jtgXcxV2ikEEw_q=UPHyHYCST9QvyhWK+oRGvnQ@mail.gmail.com>
References: <20200114192217.580364-1-srinivas.pandruvada@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200114192217.580364-1-srinivas.pandruvada@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: Andriy Shevchenko <andriy.shevchenko@intel.com>, Prarit Bhargava <prarit@redhat.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Jan 14, 2020 at 9:22 PM Srinivas Pandruvada
<srinivas.pandruvada@linux.intel.com> wrote:
>
> This series add core-power or SST-CP support. Also fixes some display
> issue with SST-TF.
>

Pushed to my review and testing queue, thanks!

> Srinivas Pandruvada (5):
>   platform/x86: ISST: Allow additional core-power mailbox commands
>   tools/power/x86/intel-speed-select: Add support for core-power
>     discovery
>   tools/power/x86/intel-speed-select: Fix result display for turbo-freq
>     auto mode
>   tools/power/x86/intel-speed-select: Change the order for clos disable
>   tools/power/x86/intel-speed-select: Update version
>
>  .../intel_speed_select_if/isst_if_common.c    |  3 +
>  .../x86/intel-speed-select/isst-config.c      | 34 ++++++------
>  .../power/x86/intel-speed-select/isst-core.c  | 55 +++++++++++++++++++
>  .../x86/intel-speed-select/isst-display.c     | 27 ++++++---
>  tools/power/x86/intel-speed-select/isst.h     |  6 ++
>  5 files changed, 100 insertions(+), 25 deletions(-)
>
> --
> 2.24.1
>


-- 
With Best Regards,
Andy Shevchenko

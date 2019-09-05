From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: Re: [PATCH v2 0/9] tools-power-x86-intel-speed-select: Fixes and
 updates for output
Date: Thu, 05 Sep 2019 16:05:55 -0700
Message-ID: <e02287479ad936142a21cbd7c6c00947ca0c5088.camel@linux.intel.com>
References: <20190905120311.15286-1-prarit@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190905120311.15286-1-prarit@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Prarit Bhargava <prarit@redhat.com>, platform-driver-x86@vger.kernel.org
Cc: andriy.shevchenko@intel.com, David Arcari <darcari@redhat.com>, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Thu, 2019-09-05 at 08:03 -0400, Prarit Bhargava wrote:
> Some general fixes and updates for intel-speed-select.  Fixes include
> some
> typos as well as an off-by-one cpu count reporting error.  Updates
> for the
> output are
> 
> - switching to MHz as a standard
> - reporting CPU frequencies instead of ratios as a standard
> - viewing a human-readable CPU list.
> - avoiding reporting "0|1" as success|fail as these can be confusing
> for a
>   user.
> 
> v2: Add additional patch to fix memory leak and remove help text in
> 8/9.

For the series

Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

> 
> Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> Cc: David Arcari <darcari@redhat.com>
> Cc: linux-kernel@vger.kernel.org
> 
> Prarit Bhargava (9):
>   tools/power/x86/intel-speed-select: Fix package typo
>   tools/power/x86/intel-speed-select: Fix help option typo
>   tools/power/x86/intel-speed-select: Fix cpu-count output
>   tools/power/x86/intel-speed-select: Simplify output for turbo-freq
> and
>     base-freq
>   tools/power/x86/intel-speed-select: Switch output to MHz
>   tools/power/x86/intel-speed-select: Change turbo ratio output to
>     maximum turbo frequency
>   tools/power/x86/intel-speed-select: Output human readable CPU list
>   tools/power/x86/intel-speed-select: Output success/failed for
> command
>     output
>   tools/power/x86/intel-speed-select: Fix memory leak
> 
>  .../x86/intel-speed-select/isst-config.c      |  21 +--
>  .../x86/intel-speed-select/isst-display.c     | 120 +++++++++++++---
> --
>  2 files changed, 98 insertions(+), 43 deletions(-)
> 

From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: Re: [PATCH 0/8] tools-power-x86-intel-speed-select: Fixes and
 updates for output
Date: Wed, 04 Sep 2019 13:06:29 -0700
Message-ID: <e6390a656dfd29b114b1e0659e3db169344cfa81.camel@linux.intel.com>
References: <20190903153734.11904-1-prarit@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190903153734.11904-1-prarit@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Prarit Bhargava <prarit@redhat.com>, platform-driver-x86@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: David Arcari <darcari@redhat.com>, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, 2019-09-03 at 11:37 -0400, Prarit Bhargava wrote:
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
Series looks fine, except 8/8.
So please submit v2. Better to resubmit as a series as v2, unless Andy
has other preference.

Thanks,
Srinivas

> 
> Signed-off-by: Prarit Bhargava <prarit@redhat.com>
> Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> Cc: David Arcari <darcari@redhat.com>
> Cc: linux-kernel@vger.kernel.org
> 
> Prarit Bhargava (8):
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
> 
>  .../x86/intel-speed-select/isst-config.c      |   4 +-
>  .../x86/intel-speed-select/isst-display.c     | 116 ++++++++++++--
> ----
>  2 files changed, 83 insertions(+), 37 deletions(-)
> 

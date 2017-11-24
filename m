From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v3 0/4] platform/x86: intel_telemetry: Fix logs and formatting
Date: Fri, 24 Nov 2017 22:55:03 +0200
Message-ID: <CAHp75VdCw6Q0Yr18jn4MZx=yRVL6zCdSohh9ss55zBSCrfZk4g@mail.gmail.com>
References: <1511530484-29845-1-git-send-email-souvik.k.chakravarty@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1511530484-29845-1-git-send-email-souvik.k.chakravarty@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, "dvhart@infradead.org" <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Nov 24, 2017 at 3:34 PM, Souvik Kumar Chakravarty
<souvik.k.chakravarty@intel.com> wrote:
> This patchset fixes https://bugzilla.kernel.org/show_bug.cgi?id=197833, and
> other issues related to telemetry counters. It also cleans up formatting
> and removes redundant code.
>
> It is rebased on top of the TESTING branch.
>

Pushed to my review and testing queue, thanks!

> Changes since v2:
>  * Changes in GCR read API name and adding back static qualifier to account
>    for case of missing logs during suspend/resume
>
> Changes since v1:
>  * Code-Review comments have been incorporated.
>
> Souvik Kumar Chakravarty (4):
>   platform/x86: intel_pmc_ipc: Add read64 API
>   platform/x86: intel_telemetry: Fix suspend stats
>   platform/x86: intel_telemetry: Improve S0ix logs
>   platform/x86: intel_telemetry: Remove redundancies
>
>  arch/x86/include/asm/intel_pmc_ipc.h           |  6 ++
>  drivers/platform/x86/intel_pmc_ipc.c           | 33 +++++++++-
>  drivers/platform/x86/intel_telemetry_debugfs.c | 83 +++++++++++---------------
>  3 files changed, 72 insertions(+), 50 deletions(-)
>
> --
> 2.7.4
>



-- 
With Best Regards,
Andy Shevchenko

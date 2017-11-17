From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v1 0/5] platform/x86: intel_telemetry: Fix counters and formatting
Date: Fri, 17 Nov 2017 15:37:11 +0200
Message-ID: <CAHp75VcYMeRkuSO46WQRVPfAjuaJy1PmGfpdiZ-zod6RpXx4nQ@mail.gmail.com>
References: <1510827497-25188-1-git-send-email-souvik.k.chakravarty@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f196.google.com ([209.85.216.196]:46397 "EHLO
        mail-qt0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756986AbdKQNhM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 17 Nov 2017 08:37:12 -0500
In-Reply-To: <1510827497-25188-1-git-send-email-souvik.k.chakravarty@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, "dvhart@infradead.org" <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>

On Thu, Nov 16, 2017 at 12:18 PM, Souvik Kumar Chakravarty
<souvik.k.chakravarty@intel.com> wrote:
> This patchset fixes https://bugzilla.kernel.org/show_bug.cgi?id=197833, and
> other issues related to telemetry counters. It also cleans up formatting
> and removes redundanant code.
>
> It is rebased on top of the TESTING branch.

Overall looks not so bad, please address my comments.

>
> Souvik Kumar Chakravarty (5):
>   platform/x86: intel_pmc_ipc: Fix register names
>   platform/x86: intel_telemetry: Fix suspend stats
>   platform/x86: intel_telemetry: Fix local variables
>   platform/x86: intel_telemetry: Remove redundancies
>   platform/x86: intel_telemetry: Improve S0ix logs
>
>  arch/x86/include/asm/intel_pmc_ipc.h           |  10 ++-
>  drivers/platform/x86/intel_pmc_ipc.c           |   4 +-
>  drivers/platform/x86/intel_telemetry_debugfs.c | 101 +++++++++++++------------
>  3 files changed, 59 insertions(+), 56 deletions(-)
>
> --
> 2.7.4
>



-- 
With Best Regards,
Andy Shevchenko

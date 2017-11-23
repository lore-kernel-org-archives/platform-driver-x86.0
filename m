From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 2/4] platform/x86: intel_telemetry: Fix suspend stats
Date: Thu, 23 Nov 2017 23:25:24 +0200
Message-ID: <CAHp75VeghsstATQ2YE2MyvbWf9etmRY9HMksiNo+Xe_jUQezvg@mail.gmail.com>
References: <1511274984-6165-1-git-send-email-souvik.k.chakravarty@intel.com> <1511274984-6165-3-git-send-email-souvik.k.chakravarty@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f175.google.com ([209.85.220.175]:40460 "EHLO
        mail-qk0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752928AbdKWVZ0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 23 Nov 2017 16:25:26 -0500
In-Reply-To: <1511274984-6165-3-git-send-email-souvik.k.chakravarty@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, "dvhart@infradead.org" <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>

On Tue, Nov 21, 2017 at 4:36 PM, Souvik Kumar Chakravarty
<souvik.k.chakravarty@intel.com> wrote:
> Suspend stats are not reported consistently due to a limitation in the PMC
> firmware. This limitation causes a delay in updating the s0ix counters and
> residencies in the telemetry log upon s0ix exit. As a consequence, reading
> these counters from the suspend-exit notifier may result in zero read.
>
> This patch fixes this issue by cross-verifying the s0ix residencies from
> the GCR TELEM registers in case the counters are not incremented in the
> telemetry log after suspend.
>
> This fixes https://bugzilla.kernel.org/show_bug.cgi?id=197833
>
> We also remove unnecessary 'static' qualifiers from local variables.
>
> Reported-and-tested-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
> Signed-off-by: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>

> -       static u32 suspend_shlw_ctr_exit, suspend_deep_ctr_exit;
> -       static u64 suspend_shlw_res_exit, suspend_deep_res_exit;
>         struct telemetry_debugfs_conf *conf = debugfs_conf;
> +       u32 suspend_shlw_ctr_exit, suspend_deep_ctr_exit;
> +       u64 suspend_shlw_res_exit, suspend_deep_res_exit;
>         int ret, index;

> +       if (suspend_shlw_ctr_exit == suspend_shlw_ctr_temp &&
> +           suspend_deep_ctr_exit == suspend_deep_ctr_temp) {

kbuildbot is absolutely right. How this code is supposed to work? It's flaky.

Please, redesign this approach.

-- 
With Best Regards,
Andy Shevchenko

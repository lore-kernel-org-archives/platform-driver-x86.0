From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v1 1/4] platform/x86: intel_pmc_ipc: Add readq API for GCR
Date: Thu, 23 Nov 2017 23:17:47 +0200
Message-ID: <CAHp75VeJsnpxL08RXfz3KH8SogY5ivabiZZGaffPutO6uY5eCg@mail.gmail.com>
References: <1511274984-6165-1-git-send-email-souvik.k.chakravarty@intel.com> <1511274984-6165-2-git-send-email-souvik.k.chakravarty@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f177.google.com ([209.85.216.177]:37791 "EHLO
        mail-qt0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752488AbdKWVRt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 23 Nov 2017 16:17:49 -0500
In-Reply-To: <1511274984-6165-2-git-send-email-souvik.k.chakravarty@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, "dvhart@infradead.org" <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>

On Tue, Nov 21, 2017 at 4:36 PM, Souvik Kumar Chakravarty
<souvik.k.chakravarty@intel.com> wrote:
> Add intel_pmc_gcr_readq API for reading from 64-bit GCR registers.
> This API will be called from intel_telemetry. Rename intel_pmc_gcr_read
> to more appropriate intel_pmc_gcr_readl.

>  int intel_pmc_s0ix_counter_read(u64 *data);
> -int intel_pmc_gcr_read(u32 offset, u32 *data);
> +int intel_pmc_gcr_readl(u32 offset, u32 *data);
> +int intel_pmc_gcr_readq(u32 offset, u64 *data);
>  int intel_pmc_gcr_write(u32 offset, u32 data);
>  int intel_pmc_gcr_update(u32 offset, u32 mask, u32 val);

Ah, I didn't notice that we have a bunch of related functions.

From above it looks like we better to leave read as is and introduce
_read64() instead of _readq(). This makes names more clear in case we
would need _update64 in the future.

Something like below at the end:

int intel_pmc_gcr_read(u32 offset, u32 *data);
int intel_pmc_gcr_write(u32 offset, u32 data);
int intel_pmc_gcr_update(u32 offset, u32 mask, u32 val);

+int intel_pmc_gcr_read64(u32 offset, u64 *data);

-- 
With Best Regards,
Andy Shevchenko

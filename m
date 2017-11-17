From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v1 5/5] platform/x86: intel_telemetry: Improve S0ix logs
Date: Fri, 17 Nov 2017 15:36:32 +0200
Message-ID: <CAHp75VetzcSH=HBm+GK6X04W2ZZLgLsVJWw_RW-Qg2thN2V9zQ@mail.gmail.com>
References: <1510827497-25188-1-git-send-email-souvik.k.chakravarty@intel.com> <1510827497-25188-6-git-send-email-souvik.k.chakravarty@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f176.google.com ([209.85.216.176]:33975 "EHLO
        mail-qt0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756986AbdKQNgd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 17 Nov 2017 08:36:33 -0500
In-Reply-To: <1510827497-25188-6-git-send-email-souvik.k.chakravarty@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, "dvhart@infradead.org" <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>

On Thu, Nov 16, 2017 at 12:18 PM, Souvik Kumar Chakravarty
<souvik.k.chakravarty@intel.com> wrote:
> Suspend with shallow wakes is not a useful parameter since the phenomena
> does not exist on deployed devices and is only a parameter of use during
> device power-on phase. The field always reads zero. Additionally there
> are other easier methods to detect it, e.g., if the S0ix counter
> increments by more than one during suspend. Hence the field is superfluous
> and can be removed.
>
> This patch also slightly renames the S0ix total field for better
> viewability.

> -                               (u64)(s0ix_total_res*10/192));
> +                  (u64)(s0ix_total_res*10/192));

Why indentation is changed? Candidate for the patch wrt indentation thingy.

> -       if (suspend_shlw_ctr_exit == 1) {
> +       if (suspend_shlw_ctr_exit > 0) {

How could it be less than 0?

!= 0 ?

> -       if (suspend_deep_ctr_exit == 1) {
> +       if (suspend_deep_ctr_exit > 0) {

Ditto.

-- 
With Best Regards,
Andy Shevchenko

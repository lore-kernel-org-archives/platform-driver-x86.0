From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v1 0/9] platform/x86: hp-wmi: Driver refactoring and cleanups
Date: Thu, 20 Apr 2017 10:38:56 +0300
Message-ID: <CAHp75VfrOxBA6hbEds-dQaAtGcMaRhNo=tSZT+gnMeAASEasmA@mail.gmail.com>
References: <cover.1492654448.git.dvhart@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f195.google.com ([209.85.216.195]:33923 "EHLO
        mail-qt0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934597AbdDTHi5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 20 Apr 2017 03:38:57 -0400
In-Reply-To: <cover.1492654448.git.dvhart@infradead.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Carlo Caione <carlo@caione.org>

On Thu, Apr 20, 2017 at 5:25 AM, Darren Hart <dvhart@infradead.org> wrote:
> From: "Darren Hart (VMware)" <dvhart@infradead.org>
>
> This series factors out some redundant code, cleans up a number of style issues,
> modernizes the sysfs usage, and cleans up the return paths. All told, the driver
> is reduced in size by 37 lines (3.6%).
>
> I do not have an HP laptop, so I'm hoping Carlo can help out with some testing.
> In particular we need to verify that hotkeys and sysfs continue to work as
> before.
>

Series looks good to me except patch 2. So,

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

with above exception.

> This series is also available here for convenience:
> git://git.infradead.org/users/dvhart/linux-platform-drivers-x86.git hp-wmi
>
>
> Darren Hart (VMware) (9):
>   platform/x86: hp-wmi: Cleanup local variable declarations
>   platform/x86: hp-wmi: Add bios_args initializer
>   platform/x86: hp-wmi: Standardize enum usage for constants
>   platform/x86: hp-wmi: Refactor redundant HPWMI_READ functions
>   platform/x86: hp-wmi: Cleanup wireless get_(hw|sw)state functions
>   platform/x86: hp-wmi: Refactor dock and tablet state fetchers
>   platform/x86: hp-wmi: Use DEVICE_ATTR_(RO|RW) helper macros
>   platform/x86: hp-wmi: Do not shadow errors in sysfs show functions
>   platform/x86: hp-wmi: Cleanup exit paths
>
>  drivers/platform/x86/hp-wmi.c | 385 +++++++++++++++++++-----------------------
>  1 file changed, 174 insertions(+), 211 deletions(-)
>
> --
> 2.9.3
>



-- 
With Best Regards,
Andy Shevchenko

From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] Documentation: fix lg-laptop.rst warnings
Date: Mon, 11 Feb 2019 13:31:58 +0200
Message-ID: <CAHp75VeLCFD8EKG+hHGNUyoE9VJrFEgTvv9aD23NH49n6SMOgg@mail.gmail.com>
References: <16ce109c-69a3-1f27-7fd4-9b99c9780565@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <16ce109c-69a3-1f27-7fd4-9b99c9780565@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Matan Ziv-Av <matan@svgalib.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Feb 11, 2019 at 8:30 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> From: Randy Dunlap <rdunlap@infradead.org>
>
> Fix markup warnings by inserting blank lines.
> Also correct one typo.
>
> Documentation/laptops/lg-laptop.rst:2: WARNING: Explicit markup ends without a blank line; unexpected unindent.
> Documentation/laptops/lg-laptop.rst:16: WARNING: Unexpected indentation.
> Documentation/laptops/lg-laptop.rst:17: WARNING: Block quote ends without a blank line; unexpected unindent.
>

Thanks!

Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Matan Ziv-Av <matan@svgalib.org>
> Cc: platform-driver-x86@vger.kernel.org
> ---
>  Documentation/laptops/lg-laptop.rst |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> --- lnx-50-rc6.orig/Documentation/laptops/lg-laptop.rst
> +++ lnx-50-rc6/Documentation/laptops/lg-laptop.rst
> @@ -1,4 +1,5 @@
>  .. SPDX-License-Identifier: GPL-2.0+
> +
>  LG Gram laptop extra features
>  =============================
>
> @@ -9,6 +10,7 @@ Hotkeys
>  -------
>
>  The following FN keys are ignored by the kernel without this driver:
> +
>  - FN-F1 (LG control panel)   - Generates F15
>  - FN-F5 (Touchpad toggle)    - Generates F13
>  - FN-F6 (Airplane mode)      - Generates RFKILL
> @@ -16,7 +18,7 @@ The following FN keys are ignored by the
>    This key also changes keyboard backlight mode.
>  - FN-F9 (Reader mode)        - Generates F14
>
> -The rest of the FN key work without a need for a special driver.
> +The rest of the FN keys work without a need for a special driver.
>
>
>  Reader mode
>
>


-- 
With Best Regards,
Andy Shevchenko

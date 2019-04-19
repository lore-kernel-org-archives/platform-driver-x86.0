From: Daniel Drake <drake@endlessm.com>
Subject: Re: [PATCH] platform/x86: asus-wmi: Add fn-lock mode switch support
Date: Fri, 19 Apr 2019 16:52:25 +0800
Message-ID: <CAD8Lp45JbfQ2LVMT0LNV7j+D2GpCzWU36KHqaCvh9kKQOAXkNQ@mail.gmail.com>
References: <20190418064648.25706-1-chiu@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190418064648.25706-1-chiu@endlessm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Chiu <chiu@endlessm.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Linux Upstreaming Team <linux@endlessm.com>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Apr 18, 2019 at 2:47 PM Chris Chiu <chiu@endlessm.com> wrote:
>
> Some of latest ASUS laptops support new fn-lock mode switching.
> This commit detect whether if the fn-lock option is enabled in
> BIOS setting, and toggle the fn-lock mode via a new WMI DEVID
> 0x00100023 when the corresponding notify code captured.
>
> The ASUS fn-lock mode switch is activated by pressing Fn+Esc.
> When on, keys F1 to F12 behave as applicable, with meanings
> defined by the application being used at the time. When off,
> F1 to F12 directly triggers hardware features, well known audio
> volume up/down, brightness up/down...etc, which were triggered
> by holding down Fn key and F-keys.
>
> Because there's no way to retrieve the fn-lock mode via existing
> WMI methods per ASUS spec, driver need to initialize and keep the
> fn-lock mode by itself.
>
> Signed-off-by: Chris Chiu <chiu@endlessm.com>

Reviewed-by: Daniel Drake <drake@endlessm.com>

From: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v3 0/5] drivers: Add Tiger Lake hardware IDs to support ACPI,
Date: Mon, 16 Dec 2019 22:35:34 +0100
Message-ID: <CAJZ5v0g2UHJcnczekgegX6_7kzHrmXNS_e3KRCC2d4LQ1+RceA@mail.gmail.com>
References: <cover.1576520244.git.gayatri.kammela@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1576520244.git.gayatri.kammela@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gayatri Kammela <gayatri.kammela@intel.com>
Cc: Linux PM <linux-pm@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Alex Hung <alex.hung@canonical.com>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Len Brown <lenb@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amit.kucheria@verdurent.com>, "Prestopine, Charles D" <charles.d.prestopine@intel.com>, Darren Hart <dvhart@infradead.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Zhang Rui <rui.zhang@intel.com>, Srinivas Pandruvada <srinivas.pandruvada@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Dec 16, 2019 at 7:33 PM Gayatri Kammela
<gayatri.kammela@intel.com> wrote:
>
> Hi,
>
> Tiger Lake supports devices whose hardware IDs are changed for various
> drivers. Hence, add the new hardware IDs.
>
> Patch 1: Add Tiger Lake support to DPTF driver
> Patch 2: Add Tiger Lake support to fan driver
> Patch 3: Add Tiger Lake support to device_pm
> Patch 4: Add Tiger Lake support to Intel's HID driver
> Patch 5: Add Tiger Lake support to thermal driver

I'm going to apply the whole series (for 5.6) if nobody has any issues
with that.

Thanks!

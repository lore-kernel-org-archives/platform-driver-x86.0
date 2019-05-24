From: Daniel Drake <drake@endlessm.com>
Subject: Re: [PATCH v4 01/13] platform/x86: asus-wmi: Fix hwmon device cleanup
Date: Fri, 24 May 2019 13:54:44 -0600
Message-ID: <CAD8Lp45namPGpKjcBMo8ivQjzBdsVNM4_sThSaaXxGH=NrSRVQ@mail.gmail.com>
References: <c8cdb347-e206-76b2-0d43-546ef660ffb7@gmail.com> <e0f78773-518b-b62d-3d95-12225724ea5f@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e0f78773-518b-b62d-3d95-12225724ea5f@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Chris Chiu <chiu@endlessm.com>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, May 14, 2019 at 12:50 PM Yurii Pavlovskyi
<yurii.pavlovskyi@gmail.com> wrote:
>
> The driver does not clean up the hwmon device on exit or error. To
> reproduce the bug, repeat rmmod, insmod to verify that device number
> /sys/devices/platform/asus-nb-wmi/hwmon/hwmon?? grows every time. Replace
> call for registering device with devm_* version that unregisters it
> automatically.
>
> Signed-off-by: Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>

Reviewed-by: Daniel Drake <drake@endlessm.com>

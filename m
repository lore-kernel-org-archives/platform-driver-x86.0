From: Daniel Drake <drake@endlessm.com>
Subject: Re: [PATCH v4 02/13] platform/x86: asus-wmi: Fix preserving keyboard
 backlight intensity on load
Date: Fri, 24 May 2019 13:57:50 -0600
Message-ID: <CAD8Lp44PeLhTb=g3zz9mfOZpco8ybDqcKDVD6ZmJZL+D_+3X7Q@mail.gmail.com>
References: <c8cdb347-e206-76b2-0d43-546ef660ffb7@gmail.com> <40403d07-293a-62a1-e0e9-ad6a2ba84844@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <40403d07-293a-62a1-e0e9-ad6a2ba84844@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Chris Chiu <chiu@endlessm.com>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, May 14, 2019 at 12:51 PM Yurii Pavlovskyi
<yurii.pavlovskyi@gmail.com> wrote:
>
> The error code and return value are mixed up. The intensity is always set
> to 0 on load as kbd_led_read returns either 0 or negative value. To
> reproduce set backlight to maximum, reload driver and try to increase it
> using keyboard hotkey, the intensity will drop as a result. Correct the
> implementation.
>
> Signed-off-by: Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>

Reviewed-by: Daniel Drake <drake@endlessm.com>

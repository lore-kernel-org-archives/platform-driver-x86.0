From: Daniel Drake <drake@endlessm.com>
Subject: Re: [PATCH] HID: asus: only support backlight when it's not driven by WMI
Date: Mon, 15 Jan 2018 14:33:29 -0600
Message-ID: <CAD8Lp476c1stJOScWBuX2ZsNrORKVYnUJL1UnwCp6hQOzXASvw@mail.gmail.com>
References: <20180109012042.13947-1-drake@endlessm.com> <CAHp75Veyrzh+gV_8ff7TRqWpVx4h+2Qg05j9OpNXCH+E1+hsQg@mail.gmail.com>
 <CAD8Lp46gbny3mV2CgWnrJnEpZpNo-P-GgKA5-DypykbmGoUhQg@mail.gmail.com>
 <CAHp75Vc962G3rufA_D1GY=Giy7u0vri4_vQnFPYCxZ_w6N_2GQ@mail.gmail.com> <CAMz_NCr-3taeHeZ3NF2LYXrMGf25gWgL+dzdO=Ca=Bxug2EbCw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <CAMz_NCr-3taeHeZ3NF2LYXrMGf25gWgL+dzdO=Ca=Bxug2EbCw@mail.gmail.com>
Sender: linux-input-owner@vger.kernel.org
To: Mustafa Kuscu <mustafakuscu@gmail.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-input <linux-input@vger.kernel.org>, Linux Upstreaming Team <linux@endlessm.com>, Carlo Caione <carlo@endlessm.com>, Corentin Chary <corentin.chary@gmail.com>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi Mustafa,
On Fri, Jan 12, 2018 at 1:33 PM, Mustafa Kuscu <mustafakuscu@gmail.com> wrote:

>      { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
> -        USB_DEVICE_ID_ASUSTEK_ROG_KEYBOARD1) },
> +        USB_DEVICE_ID_ASUSTEK_ROG_KEYBOARD1), QUIRK_USE_KBD_BACKLIGHT },

This change is already included in the latest version of Linux so I
assume you are just running an old version.

Andy, still waiting for any more feedback on the issue detailed in
this thread once you have a chance.

Thanks
Daniel

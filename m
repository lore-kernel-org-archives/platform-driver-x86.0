From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: peaq-wmi: Add DMI check before binding to
 the WMI interface
Date: Thu, 5 Oct 2017 21:19:23 +0300
Message-ID: <CAHp75VfxGqrrk_Cs9w8PVMY2o9=cYE9SENDTUs=39RHmqXDmAQ@mail.gmail.com>
References: <20171005180404.15044-1-hdegoede@redhat.com> <20171005180404.15044-2-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171005180404.15044-2-hdegoede@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Kai Heng Feng <kai.heng.feng@canonical.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, stable@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Oct 5, 2017 at 9:04 PM, Hans de Goede <hdegoede@redhat.com> wrote:
> It seems that the WMI GUID used by the PEAQ 2-in-1 WMI hotkeys is not
> as unique as a GUID should be and is used on some other devices too.
>
> This is causing spurious key-press reports on these other devices.
>
> This commits adds a DMI check to the PEAQ 2-in-1 WMI hotkeys driver to
> ensure that it is actually running on a PEAQ 2-in-1, fixing the
> spurious key-presses on these other devices.

Thanks!

One comment though.

>  static void __exit peaq_wmi_exit(void)
>  {
> +       if (!dmi_check_system(peaq_dmi_table))
> +               return;
> +
>         if (!wmi_has_guid(PEAQ_DOLBY_BUTTON_GUID))
>                 return;

I was thinking, after got kbuid bot complains on Kai's patch on
sections mismatch, do we need these checks at all?
How would be possible to get a module loaded in the first place if
system is not in whitelist?

If I'm right, please, drop the check and move table to __initconst.

-- 
With Best Regards,
Andy Shevchenko

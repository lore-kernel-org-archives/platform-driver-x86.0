From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] thinkpad_acpi: Add sysfs entry for lcdshadow feature
Date: Thu, 20 Feb 2020 12:42:53 +0200
Message-ID: <CAHp75VcJmEOu1-b7F2UAsv=Gujb=pPLzjz2ye9t4=Q68+ors-w@mail.gmail.com>
References: <20200220074637.7578-1-njoshi1@lenovo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200220074637.7578-1-njoshi1@lenovo.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nitin Joshi <nitjoshi@gmail.com>, Mat King <mathewk@google.com>, Jani Nikula <jani.nikula@linux.intel.com>, Daniel Thompson <daniel.thompson@linaro.org>, Jingoo Han <jingoohan1@gmail.com>, Rajat Jain <rajatja@google.com>
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Thinkpad-acpi devel ML <ibm-acpi-devel@lists.sourceforge.net>, Platform Driver <platform-driver-x86@vger.kernel.org>, mpearson@lenovo.com, Nitin Joshi <njoshi1@lenovo.com>, Benjamin Berg <bberg@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Feb 20, 2020 at 9:48 AM Nitin Joshi <nitjoshi@gmail.com> wrote:
>
>   This feature is supported on some Thinkpad products like T490s, Thinkpad
>   X1 yoga 4th Gen etc . The lcdshadow feature can be enabled and disabled
>   when user press "Fn" + "D" key. Currently, no user feedback is given for
>   this action. Adding as sysfs entry allows userspace to show an On Screen
>   Display whenever the setting changes.
>
>   Summary of changes is mentioned below :
>
>  - Added TP_HKEY_EV_LCDSHADOW_CHANGED for consistency inside the driver
>  - Added unmapped LCDSHADOW to keymap
>  - Added lcdshadow_get function to read value using ACPI
>  - Added lcdshadow_refresh function to re-read value and send notification
>  - Added sysfs group creation to tpaci_lcdshadow_init
>  - Added lcdshadow_exit to remove sysfs group again
>  - Implemented lcdshadow_enable_show/lcdshadow_enable_store
>  - Added handler to tpacpi_driver_event to update refresh lcdshadow
>  - Explicitly call tpacpi_driver_event for extended keyset

Adding custom PrivacyGuard support to this driver was my mistake,
There is a discussion [1] how to do this in generic way to cover other
possible users.
I Cc this to people from that discussion.

[1]: https://lore.kernel.org/dri-devel/CAL_quvRknSSVvXN3q_Se0hrziw2oTNS3ENNoeHYhvciCRq9Yww@mail.gmail.com/


--
With Best Regards,
Andy Shevchenko

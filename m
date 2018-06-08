From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: ThinkPad T480s & thinkpad_acpi.ko
Date: Fri, 8 Jun 2018 12:40:32 +0300
Message-ID: <CAHp75VfFA6ghuSeAAfcbRS47A12BCcQiAmBt_N5ejm8EsP+3yA@mail.gmail.com>
References: <20180608081204.ztv4yb62szuyfsz6@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180608081204.ztv4yb62szuyfsz6@pali>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, ibm-acpi-devel@lists.sourceforge.net, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Jun 8, 2018 at 11:12 AM, Pali Roh=C3=A1r <pali.rohar@gmail.com> wro=
te:
> Hi! I just found out that thinkpad_acpi.ko is not automatically loaded
> on new ThinkPad T480s. Is there any reason for it? Manually calling
> modprobe thinkpad_acpi is working fine, but I would expect that it
> should be loaded automatically.
>
> Here is dmesg output after loading it manually:
>
> thinkpad_acpi: ThinkPad ACPI Extras v0.25
> thinkpad_acpi: http://ibm-acpi.sf.net/
> thinkpad_acpi: ThinkPad BIOS N22ET34W (1.11 ), EC unknown
> thinkpad_acpi: Lenovo ThinkPad T480s, model 20L7S03000
> thinkpad_acpi: radio switch found; radios are enabled
> thinkpad_acpi: This ThinkPad has standard ACPI backlight brightness contr=
ol, supported by the ACPI video driver
> thinkpad_acpi: Disabling thinkpad-acpi brightness events by default...
> thinkpad_acpi: rfkill switch tpacpi_bluetooth_sw: radio is unblocked
> thinkpad_acpi: Standard ACPI backlight interface available, not loading n=
ative one

Did you run depmod -a?
Is it present in the output?

There are three ways of enumeration as far as I can see from the driver's c=
ode:
- by short driver name "tpacpi" (not likely our case)
- by DMI matching (only for old BIOS'es)
- by ACPI ID

So, does the ACPI contain one of the listed IDs?

#define TPACPI_ACPI_IBM_HKEY_HID        "IBM0068"
#define TPACPI_ACPI_LENOVO_HKEY_HID     "LEN0068"
#define TPACPI_ACPI_LENOVO_HKEY_V2_HID  "LEN0268"
?

--=20
With Best Regards,
Andy Shevchenko

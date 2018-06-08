From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: ThinkPad T480s & thinkpad_acpi.ko
Date: Fri, 8 Jun 2018 12:29:10 +0200
Message-ID: <20180608102910.24c2l43ffgwxalgq@pali>
References: <20180608081204.ztv4yb62szuyfsz6@pali>
 <CAHp75VfFA6ghuSeAAfcbRS47A12BCcQiAmBt_N5ejm8EsP+3yA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHp75VfFA6ghuSeAAfcbRS47A12BCcQiAmBt_N5ejm8EsP+3yA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, ibm-acpi-devel@lists.sourceforge.net, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Friday 08 June 2018 12:40:32 Andy Shevchenko wrote:
> On Fri, Jun 8, 2018 at 11:12 AM, Pali Rohár <pali.rohar@gmail.com> wrote:
> > Hi! I just found out that thinkpad_acpi.ko is not automatically loaded
> > on new ThinkPad T480s. Is there any reason for it? Manually calling
> > modprobe thinkpad_acpi is working fine, but I would expect that it
> > should be loaded automatically.
> >
> > Here is dmesg output after loading it manually:
> >
> > thinkpad_acpi: ThinkPad ACPI Extras v0.25
> > thinkpad_acpi: http://ibm-acpi.sf.net/
> > thinkpad_acpi: ThinkPad BIOS N22ET34W (1.11 ), EC unknown
> > thinkpad_acpi: Lenovo ThinkPad T480s, model 20L7S03000
> > thinkpad_acpi: radio switch found; radios are enabled
> > thinkpad_acpi: This ThinkPad has standard ACPI backlight brightness control, supported by the ACPI video driver
> > thinkpad_acpi: Disabling thinkpad-acpi brightness events by default...
> > thinkpad_acpi: rfkill switch tpacpi_bluetooth_sw: radio is unblocked
> > thinkpad_acpi: Standard ACPI backlight interface available, not loading native one
> 
> Did you run depmod -a?
> Is it present in the output?
> 
> There are three ways of enumeration as far as I can see from the driver's code:
> - by short driver name "tpacpi" (not likely our case)
> - by DMI matching (only for old BIOS'es)
> - by ACPI ID
> 
> So, does the ACPI contain one of the listed IDs?
> 
> #define TPACPI_ACPI_IBM_HKEY_HID        "IBM0068"
> #define TPACPI_ACPI_LENOVO_HKEY_HID     "LEN0068"
> #define TPACPI_ACPI_LENOVO_HKEY_V2_HID  "LEN0268"
> ?

DSDT contains only LEN0268. And so I found reason. I'm using Debian
which has only 4.9 kernel and LEN0268 identifier was added in git commit
a3c42a467a254a17236ab817d5c7c6bc054e4f84 for 4.10.

-- 
Pali Rohár
pali.rohar@gmail.com

From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: ThinkPad T480s & thinkpad_acpi.ko
Date: Fri, 8 Jun 2018 10:12:04 +0200
Message-ID: <20180608081204.ztv4yb62szuyfsz6@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi! I just found out that thinkpad_acpi.ko is not automatically loaded
on new ThinkPad T480s. Is there any reason for it? Manually calling
modprobe thinkpad_acpi is working fine, but I would expect that it
should be loaded automatically.

Here is dmesg output after loading it manually:

thinkpad_acpi: ThinkPad ACPI Extras v0.25
thinkpad_acpi: http://ibm-acpi.sf.net/
thinkpad_acpi: ThinkPad BIOS N22ET34W (1.11 ), EC unknown
thinkpad_acpi: Lenovo ThinkPad T480s, model 20L7S03000
thinkpad_acpi: radio switch found; radios are enabled
thinkpad_acpi: This ThinkPad has standard ACPI backlight brightness control, supported by the ACPI video driver
thinkpad_acpi: Disabling thinkpad-acpi brightness events by default...
thinkpad_acpi: rfkill switch tpacpi_bluetooth_sw: radio is unblocked
thinkpad_acpi: Standard ACPI backlight interface available, not loading native one

-- 
Pali Rohár
pali.rohar@gmail.com

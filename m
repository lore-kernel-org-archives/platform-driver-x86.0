From: Chris Chiu <chiu@endlessm.com>
Subject: asus-wmi fails to load on new ASUS laptop UX325JA
Date: Thu, 21 May 2020 18:33:34 +0800
Message-ID: <CAB4CAweJ6Zi2DqQ5qgQq-apAMzSSk3uzoohEJ443F5T=LohAAA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Hans de Goede <hdegoede@redhat.com>, gregkh@linuxfoundation.org, gayatri.kammela@intel.com, Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Linux Upstreaming Team <linux@endlessm.com>
List-Id: platform-driver-x86.vger.kernel.org

Hi,
    I have the ASUS new laptop UX325JA and most of the media keys are
not working even with the latest kernel (5.7.0-rc5+). Looking into the
dmesg log, the ASUS WMI driver fails to load because of
[    7.827241] asus-nb-wmi: probe of asus-nb-wmi failed with error -5.

    Before this message, the following message repeat 5 times, please
check the full dmesg log here
https://gist.github.com/mschiu77/9a53cd8ff17029e949210dfb3ec1213f
[    7.825975] ACPI BIOS Error (bug): AE_AML_BUFFER_LIMIT, Field
[IIA3] at bit offset/length 96/32 exceeds size of target Buffer (96
bits) (20200326/dsopcode-203)
[    7.825985] No Local Variables are initialized for Method [WMNB]
[    7.826005] ACPI Error: Aborting method \_SB.ATKD.WMNB due to
previous error (AE_AML_BUFFER_LIMIT) (20200326/psparse-531)

    It fails the \_SB.ATKD.WMNB because the local variable IIA3
exceeds the buffer limit. The WMNB is the function to deal with all
ASUS WMI functions, such as ASUS_WMI_METHODID_INIT...etc. The related
code in DSDT is as follows. The full DSDT is here
https://gist.github.com/mschiu77/849c6cb89a8d8cadd015fa75465882dd

Method (WMNB, 3, Serialized)
{
    P8XH (Zero, 0x11)
    CreateDWordField (Arg2, Zero, IIA0)
    CreateDWordField (Arg2, 0x04, IIA1)
    CreateDWordField (Arg2, 0x08, IIA2)
    CreateDWordField (Arg2, 0x0C, IIA3)
    CreateDWordField (Arg2, 0x10, IIA4)
    Local0 = (Arg1 & 0xFFFFFFFF)
    If ((Local0 == 0x54494E49))

    Just as the error messages indicated,  the IIA3 is out of boundary
for the target Buffer. The limit 96bits (12 bytes) is determined by
the input acpi_buffer size, which refers to internally defined struct
bios_args, in asus_wmi_evaluate_method3. Because all ASUS WMI
evaluations will invoke  asus_wmi_evaluate_method3 at last, so all
ASUS WMI functions fail to work. I can simply fix this by extending
the bios_args from 3 args to 5 u32 args as follows, but I don't think
it's generic enough and may have to change if there're more local
variables declared in ACPI method on the future ASUS machines. Any
suggestions for this?

--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -116,6 +116,8 @@ struct bios_args {
        u32 arg0;
        u32 arg1;
        u32 arg2; /* At least TUF Gaming series uses 3 dword input buffer. */
+       u32 arg3;
+       u32 arg4;
 } __packed;


Chris

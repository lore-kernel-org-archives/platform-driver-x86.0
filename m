From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 5.6 regression fix 0/2] ACPI: PM: s2idle: Fix some systems no longer waking up from suspend
Date: Mon, 30 Mar 2020 00:34:17 +0200
Message-ID: <20200329223419.122796-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-acpi-owner@vger.kernel.org>
Sender: linux-acpi-owner@vger.kernel.org
To: "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi Rafael, Andy and Darren,

I've been debugging an issue I noticed on various Cherry Trail devices
this weekend. The issue is that when trying to wakeup the laptop / 2-in-1
with the USB keyboard, then it not only not wakes up, after this wakeup
attempt it will also no longer wakeup through other means such as the
power-button, IOW the system hangs which is not so nice.

This is also happening in 5.5 since 5.5.5 .

Here is the explanation of the problem from the commit message of the
first patch:

###

Since commit fdde0ff8590b ("ACPI: PM: s2idle: Prevent spurious SCIs from
waking up the system") the SCI triggering without there being a wakeup
cause recognized by the ACPI sleep code will no longer wakeup the system.

This works as intended, but this is a problem for devices where the SCI
is shared with another device which is also a wakeup source.

In the past these from the pov of the ACPI sleep code spurious SCIs would
still cause a wakeup so the wakeup from the device sharing the interrupt
would actually wakeup the system. This now no longer works.

This is a problem on e.g. Bay Trail-T and Cherry Trail devices where
some peripherals (typically the XHCI controller) can signal a
Power Management Event (PME) to the Power Management Controller (PMC)
to wakeup the system, this uses the same interrupt as the SCI.
These wakeups are handled through a special INT0002 ACPI device which
checks for events in the GPE0a_STS for this and takes care of acking
the PME so that the shared interrupt stops triggering.

The change to the ACPI sleep code to ignore the spurious SCI, causes
the system to no longer wakeup on these PME events. To make things
worse this means that the INT0002 device driver interrupt handler will
no longer run, causing the PME to not get cleared and resulting in the
system hanging. Trying to wakeup the system after such a PME through e.g.
the power button no longer works.

###

The first patch in this series adds an acpi_s2idle_register_wake_callback=
()
function the ACPI sleep code which registers a callback to be called from
acpi_s2idle_wake() and when the callback returns true, return true from
acpi_s2idle_wake().

The second patch in this series makes the INT0002 driver use this mechani=
sm
to check the GPE0a_STS register from acpi_s2idle_wake() and to tell the
system to wakeup if a PME is signaled in the register.

This is the cleanest solution I could come up with. I hope it is to your
liking.

Since the INT0002 driver change depends on the changes from the first
patch I suggest that we merge both patches to Rafael's tree.
Andy or Darren, may we have your Acked-by for that?

Regards,

Hans

From: Hans de Goede <hdegoede@redhat.com>
Subject: RFC: Writing a small superio kernel driver to allow superio probing
 on locked down systems?
Date: Tue, 2 Jun 2020 13:13:27 +0200
Message-ID: <0d7e97e0-fe78-163a-cdaf-825b9d0b50ee@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-hwmon-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-hwmon-owner@vger.kernel.org
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: linux-hwmon@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi All,

Yesterday Fedora received this bug report:

https://bugzilla.redhat.com/show_bug.cgi?id=1842611

The problem reported here is that sensors-detect is denied
/dev/ports access when run on systems booted with secure-boot
enabled (and thus kernel-lockdown mode activated).

I've been thinking a bit about this issue and I was thinking
that maybe we could do a very small kernel driver to help
sensors-detect here (and which might also be useful for
other diagnostic purposes) ?

The idea would be to take the superio probe code from
sensors-detect and put it in a kernel module under
drivers/platform/x86.

This module will never autoload (sensors-detect will
need to modprobe it); and this module will offer a couple
of sysfs attributes, all of which will only be readable
by root (to avoid a regular user being able to trigger
the probe if the module does somehow end up being loaded
through some other mechanism).

When the first sysfs attr is read then the module will
do the probe and export the results through sysfs
attr. With the results being the super-io base address
(0x2e or 0x4e IIRC) and the device-id of the super-io
chip; and maybe some other info.

The above proposal is a bit fuzy wrt what info will be
exported through sysfs attributes because I've not looked
at super-io probing for ages, details to be filled in later.

The main purpose of this email is to test the waters
for the concept of such a module, so some questions:

1. Do you (hwmon and platform/x86 maintainers) think
that the proposed security comprise is ok?

IOW is it ok to allow root to trigger a super-io probe,
which involves poking some io-ports. Note this will
only allow root to cause the kernel to do the probe,
the probe itself and thus the exact io-port reads / writes
are fully under the kernel's control.

2. Do you think that the concept of having a little
helper module for this, with a simple sysfs interface
is ok?

Regards,

Hans

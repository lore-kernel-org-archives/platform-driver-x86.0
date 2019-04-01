From: Matteo Croce <mcroce@redhat.com>
Subject: [PATCH 0/4] Introduce the aural error reporting framework
Date: Mon,  1 Apr 2019 12:24:51 +0200
Message-ID: <20190401102456.11162-1-mcroce@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: x86@kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-sound@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

The Linux kernel has had verbal error reporting since the beginning.
Different error conditions trigger different error messages, with
different severity: from a simple warning to the most feared kernel panic.

While this detailed error reporting is much helpful to developers or end
users, there are some cases in which it's impossible to notice that an
error happened.
The most common case is headless devices, such as home servers without an
attached display, or routers without an exposed serial port. Needless
to say, logging into the machine via SSH is not an option after such
a severe error.
In other cases the monitor might be attached, but the system is unable to
display the error, probably because there is an X server running and
the KMS switch fails. Or simply the user is visually impaired.

These are all cases when the aural errors framework comes to help. This
framework adds to the kernel a generic library to play sounds, which can
be used to report errors or generic events.

As the sound card driver could, and most probably will, become unusable
during a kernel crash, the sounds are played via the system buzzer which
has been around since the dawn of time.
The buzzer driver is simple, requires just a few register writes to work,
the hardware is extremely cheap and is already present on most machines.

The first patch introduces the framework functions, the other three make
use of it in, respectively, kernel panic, warning and oops.
The last patch, not to be merged, creates a procfs handler useful to test
the error reporting.

Matteo Croce (4):
  aural error reporting framework
  panic: use the aural error reporting framework to report panics
  bug: use the aural error reporting framework to report warnings
  oops: use the aural error reporting framework to report oopses

 arch/x86/lib/Makefile |  1 +
 arch/x86/lib/play.c   | 75 +++++++++++++++++++++++++++++++++++++++++++
 include/linux/play.h  | 34 ++++++++++++++++++++
 kernel/panic.c        | 61 +++++++++++++++++++++++++++++++++++
 lib/Kconfig.debug     | 35 ++++++++++++++++++++
 5 files changed, 206 insertions(+)
 create mode 100644 arch/x86/lib/play.c
 create mode 100644 include/linux/play.h

-- 
2.20.1

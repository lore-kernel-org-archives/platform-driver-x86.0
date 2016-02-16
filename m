From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH v3 0/5] Process Dell Instant Launch hotkey on Vostro V131 and Inspiron M5110
Date: Tue, 16 Feb 2016 15:50:25 +0100
Message-ID: <1455634230-1487-1-git-send-email-kernel@kempniu.pl>
References: <20160121090401.GR7192@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160121090401.GR7192@pali>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>
Cc: Darek Stojaczyk <darek.stojaczyk@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Changes from v2:

  - Use a static variable instead of a quirk structure

  - Use the API exported by dell-smbios to issue the SMBIOS request
    required for generating WMI events, returning with error from
    dell_wmi_init() if it fails

  - Move dell_smi_error() from dell-laptop to dell-smbios and use it to
    determine the error code for returning from dell_wmi_init() when
    enabling WMI fails

  - Support Dell Inspiron M5110

Changes from v1:

  - Use DMI matching instead of a module parameter
  - Change flag name to improve readability

This patch series makes use of the API exported by dell-smbios, so it
should be applied to either testing or dell-smbios.

This patch series was tested on a Dell Inspiron M5110 by Darek Stojaczyk
(CC'd), who reported that it had similar issues as Dell Vostro V131 back
in July 2015 [1].

Pali, returning to our debate whether to place the WMI-enabling SMBIOS
request in dell-laptop or in dell-wmi, I still strongly recommend the
latter.  Apart from the reasons I had discussed before [2], I came up
with another one.  The SMBIOS request in question registers/unregisters
an event listener (dell-wmi).  If we only register for WMI events in
dell-laptop and dell-wmi gets unloaded at some point further on,
brightness keys will not be properly processed any more as they will
only be reported using WMI.  If we properly unregister in
dell_wmi_exit(), brightness keys will be properly reported by ACPI as if
dell-wmi was never loaded.

[1] https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1205791/comments/12
[2] http://www.spinics.net/lists/platform-driver-x86/msg08289.html

 drivers/platform/x86/Kconfig       |    1 +
 drivers/platform/x86/dell-laptop.c |   30 +++++------------
 drivers/platform/x86/dell-smbios.c |   16 +++++++++
 drivers/platform/x86/dell-smbios.h |    2 ++
 drivers/platform/x86/dell-wmi.c    |   63 +++++++++++++++++++++++++++++++++++-
 5 files changed, 89 insertions(+), 23 deletions(-)

-- 
1.7.10.4

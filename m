From: Mathias Krause <minipli@googlemail.com>
Subject: [PATCH 00/15] Random collection of x86 platform driver cleanups
Date: Wed, 16 Jul 2014 19:43:02 +0200
Message-ID: <1405532597-28262-1-git-send-email-minipli@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-we0-f175.google.com ([74.125.82.175]:58065 "EHLO
	mail-we0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933174AbaGPRng (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 16 Jul 2014 13:43:36 -0400
Received: by mail-we0-f175.google.com with SMTP id t60so1304520wes.34
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Jul 2014 10:43:35 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>
Cc: platform-driver-x86@vger.kernel.org, Mathias Krause <minipli@googlemail.com>

Hi Matthew,

this series is a rather random collection of cleanups for the x86
platform drivers. However, my main intention was to mark as much DMI
tables as possible as __initconst so their memory can be released
after initialization is done. This is especially useful for those
tables as they tend to be quite large (see, e.g., patch 2, which moves
~10 kB to the .init sections). Not all of them can be marked this way,
though, as some of the tables are referenced from non-init code, too.

Beside that DMI table markings a few cleanups slipped in I found while
hunting for the former, e.g. constification of r/o data structures or
declaring variables static that are only used within one compilation
unit.

Most important, patch 1 updates the git URL of the MAINTAINERS file,
so others know where to pull from, as well.

Please apply!


Mathias Krause (15):
  MAINTAINERS: Update git URL for x86 platform drivers
  acer-wmi: Mark init data and code as such
  acer-wmi: Mark acer_wmi_keymap[] as __initconst
  acer-wmi: Hide acer_{suspend,resume} for !CONFIG_PM_SLEEP
  alienware-wmi: Mark DMI table as __initconst
  asus-nb-wmi: Constify asus_quirks[] DMI table
  dell-laptop: Mark dell_quirks[] DMI table as __initconst
  eeepc-wmi: Constify asus_quirks[] DMI table
  fujitsu-laptop: Mark fujitsu_dmi_table[] DMI table as __initconst
  fujitsu-tablet: Mark DMI callbacks as __init code
  hp-wmi: Add missing __init annotations to initialization code
  hp_accel: Constify ACPI and DMI tables
  ideapad-laptop: Constify DMI table and other r/o variables
  intel_ips: Make ips_mcp_limits variables static
  thinkpad_acpi: Mark volume_alsa_control_{vol,mute} as __initdata

 MAINTAINERS                           |    2 +-
 drivers/platform/x86/acer-wmi.c       |   48 ++++++++++++++++++---------------
 drivers/platform/x86/alienware-wmi.c  |    4 +--
 drivers/platform/x86/asus-nb-wmi.c    |    2 +-
 drivers/platform/x86/dell-laptop.c    |    6 ++---
 drivers/platform/x86/eeepc-wmi.c      |    2 +-
 drivers/platform/x86/fujitsu-laptop.c |   10 +++----
 drivers/platform/x86/fujitsu-tablet.c |    6 ++---
 drivers/platform/x86/hp-wmi.c         |    6 ++---
 drivers/platform/x86/hp_accel.c       |    4 +--
 drivers/platform/x86/ideapad-laptop.c |    6 ++---
 drivers/platform/x86/intel_ips.c      |    6 ++---
 drivers/platform/x86/thinkpad_acpi.c  |    4 +--
 13 files changed, 56 insertions(+), 50 deletions(-)

-- 
1.7.10.4

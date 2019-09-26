From: Prarit Bhargava <prarit@redhat.com>
Subject: [PATCH 0/7] intel-speed-select: Add CascadeLake-N support
Date: Thu, 26 Sep 2019 08:54:54 -0400
Message-ID: <20190926125501.1616-1-prarit@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Prarit Bhargava <prarit@redhat.com>
List-Id: platform-driver-x86.vger.kernel.org

Add support for SST-BF on CascadeLake-N support.  The CascadeLake-N
processor only support SST-BF and not other SST functionality.

Prarit Bhargava (7):
  intel-speed-select: Add int argument to command functions
  intel-speed-select: Make process_command generic
  intel-speed-select: Add check for CascadeLake-N models
  intel-speed-select: Add configuration for CascadeLake-N
  intel-speed-select: Implement CascadeLake-N help and command functions
    structures
  intel-speed-select: Implement 'perf-profile info' on CascadeLake-N
  intel-speed-select: Implement base-freq commands on CascadeLake-N

 .../x86/intel-speed-select/isst-config.c      | 443 ++++++++++++------
 .../x86/intel-speed-select/isst-display.c     |  28 +-
 tools/power/x86/intel-speed-select/isst.h     |   8 +-
 3 files changed, 319 insertions(+), 160 deletions(-)

-- 
2.21.0

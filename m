From: Prarit Bhargava <prarit@redhat.com>
Subject: [PATCH v2 0/7] Add CascadeLake-N Support
Date: Thu,  3 Oct 2019 08:11:05 -0400
Message-ID: <20191003121112.25870-1-prarit@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, srinivas.pandruvada@linux.intel.com, Prarit Bhargava <prarit@redhat.com>
List-Id: platform-driver-x86.vger.kernel.org

Add support for SST-BF on CascadeLake-N support.  The CascadeLake-N
processor only support SST-BF and not other SST functionality.

v2: Updated with comments from Srinivas (use common clx_n_* function names,
common is_clx_n_platform() function call to identify CascadeLake-N)

Signed-off-by: Prarit Bhargava <prarit@redhat.com>

Prarit Bhargava (7):
  intel-speed-select: Add int argument to command functions
  intel-speed-select: Make process_command generic
  intel-speed-select: Add check for CascadeLake-N models
  intel-speed-select: Add configuration for CascadeLake-N
  intel-speed-select: Implement CascadeLake-N help and command functions
    structures
  intel-speed-select: Implement 'perf-profile info' on CascadeLake-N
  intel-speed-select: Implement base-freq commands on CascadeLake-N

 .../x86/intel-speed-select/isst-config.c      | 493 ++++++++++++------
 .../x86/intel-speed-select/isst-display.c     |  14 +-
 tools/power/x86/intel-speed-select/isst.h     |   3 +
 3 files changed, 339 insertions(+), 171 deletions(-)

-- 
2.18.1

From: Prarit Bhargava <prarit@redhat.com>
Subject: [PATCH 0/2] intel-speed-select: Convert output to tables
Date: Mon, 23 Sep 2019 09:16:36 -0400
Message-ID: <20190923131638.6668-1-prarit@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Prarit Bhargava <prarit@redhat.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

The turbo ratio limits and turbo frequencies add a large amount of
lines to the output.  The output can be truncated into human and
machine readable tables to reduce the number of lines of output.

Signed-off-by: Prarit Bhargava <prarit@redhat.com>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

Prarit Bhargava (2):
  intel-speed-select: Display turbo-ratio-limits as a table
  intel-speed-select: Display turbo frequencies in a table

 .../x86/intel-speed-select/isst-display.c     | 196 +++++++++---------
 1 file changed, 94 insertions(+), 102 deletions(-)

-- 
2.21.0

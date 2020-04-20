From: Prarit Bhargava <prarit@redhat.com>
Subject: [PATCH] intel-speed-select: Fix speed-select-base-freq-properties output on CLX-N
Date: Mon, 20 Apr 2020 10:10:54 -0400
Message-ID: <20200420141054.26173-1-prarit@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Prarit Bhargava <prarit@redhat.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On CLX-N, the perf-profile-level's output is terminated before the
speed-select-base-freq-properties are output which results in a corrupt
json file.

Adjust the output of speed-select-base-freq-properties by one on CLX-N.

Signed-off-by: Prarit Bhargava <prarit@redhat.com>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org
---
 tools/power/x86/intel-speed-select/isst-display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/power/x86/intel-speed-select/isst-display.c b/tools/po=
wer/x86/intel-speed-select/isst-display.c
index 51dbaa5f02ec..f6e2ce181123 100644
--- a/tools/power/x86/intel-speed-select/isst-display.c
+++ b/tools/power/x86/intel-speed-select/isst-display.c
@@ -470,7 +470,7 @@ void isst_ctdp_display_information(int cpu, FILE *out=
f, int tdp_level,
 				_isst_pbf_display_information(cpu, outf,
 							      tdp_level,
 							  &ctdp_level->pbf_info,
-							      level + 1);
+							      level + 2);
 			continue;
 		}
=20
--=20
2.18.2

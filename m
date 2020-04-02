From: Prarit Bhargava <prarit@redhat.com>
Subject: [PATCH] tools/power/x86/intel-speed-select: Fix CLX-N package information output
Date: Thu,  2 Apr 2020 14:07:32 -0400
Message-ID: <20200402180732.24684-1-prarit@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Prarit Bhargava <prarit@redhat.com>, andriy.shevchenko@linux.intel.com, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On CLX-N the perf-profile output is missing the package, die, and cpu
output.  On CLX-N the pkg_dev struct will never be evaluated by the core
code so pkg_dev.processed is always 0 and the package, die, and cpu
information is never output.

Set the pkg_dev.processed flag to 1 for CLX-N processors.

Signed-off-by: Prarit Bhargava <prarit@redhat.com>
Cc: andriy.shevchenko@linux.intel.com
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org
---
 tools/power/x86/intel-speed-select/isst-config.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/power/x86/intel-speed-select/isst-config.c b/tools/pow=
er/x86/intel-speed-select/isst-config.c
index d1ac57be0cbd..2e64b9b6eb2e 100644
--- a/tools/power/x86/intel-speed-select/isst-config.c
+++ b/tools/power/x86/intel-speed-select/isst-config.c
@@ -1169,6 +1169,7 @@ static void dump_clx_n_config_for_cpu(int cpu, void=
 *arg1, void *arg2,
=20
 		ctdp_level =3D &clx_n_pkg_dev.ctdp_level[0];
 		pbf_info =3D &ctdp_level->pbf_info;
+		clx_n_pkg_dev.processed =3D 1;
 		isst_ctdp_display_information(cpu, outf, tdp_level, &clx_n_pkg_dev);
 		free_cpu_set(ctdp_level->core_cpumask);
 		free_cpu_set(pbf_info->core_cpumask);
--=20
2.18.2

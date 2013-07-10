From: Shuah Khan <shuah.kh@samsung.com>
Subject: [PATCH 0/4] pnp: Change pnp bus pm_ops to invoke pnp driver dev_pm_ops if specified
Date: Tue,  9 Jul 2013 22:11:42 -0600
Message-ID: <1373429502-4025-1-git-send-email-shuah.kh@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: rafael.j.wysocki@intel.com, bhelgaas@google.com, a.zummo@towertech.it, key@linux.vnet.ibm.com, mail@srajiv.net, tpmdd@selhorst.net, tpmdd@sirrix.com, matthew.garrett@nebula.com
Cc: Shuah Khan <shuah.kh@samsung.com>, linux-kernel@vger.kernel.org, rtc-linux@googlegroups.com, tpmdd-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, shuahkhan@gmail.com
List-Id: platform-driver-x86.vger.kernel.org

pnp_bus_suspend() and pnp_bus_resume() invoke legacy pm_ops from
pnp_driver. Changed pnp_bus_suspend() and pnp_bus_resume() to check
if pnp driver has dev_pm_ops and call. If dev_pm_ops don't exist, then
call use legacy pm_ops. Without this change, pnp_driver dev_pm_ops will
not get called.

In addition to the pnp driver bus pm_ops change to invoke driver dev_pm_ops,
this patch set contains changes to rtc-cmos, tpm_tis, and apple-gmux pnp
drivers to convert from legacy pm_ops to dev_pm_ops.

Shuah Khan (4):
pnp: Change pnp bus pm_ops to invoke pnp driver dev_pm_ops
rtc: convert rtc-cmos to dev_pm_ops from legacy pm_ops
tpm: Convert tpm_tis driver to use dev_pm_ops from legacy pm_ops
platform: Convert apple-gmux driver to dev_pm_ops from legacy pm_ops

 drivers/pnp/driver.c |   13 +++++++++++++
 1 file changed, 13 insertions(+)

 drivers/rtc/rtc-cmos.c |   24 +++++-------------------
 1 file changed, 5 insertions(+), 19 deletions(-)

 drivers/char/tpm/tpm_tis.c |   60 ++++++++++++++++++--------------------------
 1 file changed, 24 insertions(+), 36 deletions(-)

 drivers/platform/x86/apple-gmux.c |   18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

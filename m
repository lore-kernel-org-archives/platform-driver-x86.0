From: Akio Idehara <zbe64533@gmail.com>
Subject: [PATCH] xf86-video-intel: Add support for toshiba
	backlight interface
Date: Wed, 14 Mar 2012 23:37:39 +0900
Message-ID: <1331735859-6337-1-git-send-email-zbe64533@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <intel-gfx-bounces+gcfxdi-intel-gfx=m.gmane.org@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/intel-gfx>,
	<mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
	<mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Sender: intel-gfx-bounces+gcfxdi-intel-gfx=m.gmane.org@lists.freedesktop.org
Errors-To: intel-gfx-bounces+gcfxdi-intel-gfx=m.gmane.org@lists.freedesktop.org
To: chris@chris-wilson.co.uk
Cc: seth.forshee@canonical.com, intel-gfx@lists.freedesktop.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

xfce4-power-manager cannot control backlight brightness via
toshiba backlight sysfs interface.
The reason is that xf86-video-intel doesn't treat it.
This patch adds support for toshiba backlight sysfs interface.

This was tested on a Toshiba Portege R500.

Signed-off-by: Akio Idehara <zbe64533@gmail.com>
---
 src/intel_display.c   |    1 +
 src/sna/sna_display.c |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/src/intel_display.c b/src/intel_display.c
index 11d0e2b..8eb8df8 100644
--- a/src/intel_display.c
+++ b/src/intel_display.c
@@ -131,6 +131,7 @@ static const char *backlight_interfaces[] = {
 	"fujitsu-laptop",
 	"sony",
 	"samsung",
+	"toshiba",
 	"acpi_video1", /* finally fallback to the generic acpi drivers */
 	"acpi_video0",
 	"intel_backlight",
diff --git a/src/sna/sna_display.c b/src/sna/sna_display.c
index 9401ca4..10c67f7 100644
--- a/src/sna/sna_display.c
+++ b/src/sna/sna_display.c
@@ -109,6 +109,7 @@ static const char *backlight_interfaces[] = {
 	"fujitsu-laptop",
 	"sony",
 	"samsung",
+	"toshiba",
 	"acpi_video1", /* finally fallback to the generic acpi drivers */
 	"acpi_video0",
 	NULL,
-- 
1.7.7.6

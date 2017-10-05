From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 6/6] platform/x86: intel_ips: Remove FSF address from GPL notice
Date: Thu,  5 Oct 2017 14:54:20 +0300
Message-ID: <20171005115420.2786-6-andriy.shevchenko@linux.intel.com>
References: <20171005115420.2786-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171005115420.2786-1-andriy.shevchenko@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

This patch removes the FSF address from the GPL notice to fix a
checkpatch.pl CHECK message.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/intel_ips.c | 4 ----
 drivers/platform/x86/intel_ips.h | 4 ----
 2 files changed, 8 deletions(-)

diff --git a/drivers/platform/x86/intel_ips.c b/drivers/platform/x86/intel_ips.c
index 9f5afdd123bb..680ab4fd7087 100644
--- a/drivers/platform/x86/intel_ips.c
+++ b/drivers/platform/x86/intel_ips.c
@@ -10,10 +10,6 @@
  * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
  * more details.
  *
- * You should have received a copy of the GNU General Public License along with
- * this program; if not, write to the Free Software Foundation, Inc.,
- * 51 Franklin St - Fifth Floor, Boston, MA 02110-1301 USA.
- *
  * The full GNU General Public License is included in this distribution in
  * the file called "COPYING".
  *
diff --git a/drivers/platform/x86/intel_ips.h b/drivers/platform/x86/intel_ips.h
index 73299beff5b3..60f4e3ddbe9f 100644
--- a/drivers/platform/x86/intel_ips.h
+++ b/drivers/platform/x86/intel_ips.h
@@ -10,10 +10,6 @@
  * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
  * more details.
  *
- * You should have received a copy of the GNU General Public License along with
- * this program; if not, write to the Free Software Foundation, Inc.,
- * 51 Franklin St - Fifth Floor, Boston, MA 02110-1301 USA.
- *
  * The full GNU General Public License is included in this distribution in
  * the file called "COPYING".
  */
-- 
2.14.2

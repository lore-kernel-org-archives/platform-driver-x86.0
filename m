From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
Subject: [PATCH 2/2] ABI: ibm_rtl: the "What:" fields are incomplete
Date: Sat, 29 Oct 2016 08:10:03 -0200
Message-ID: <650a057df924aff3b70a445694fcb1e3af524c8d.1477735797.git.mchehab@s-opensource.com>
References: <364a36215c44e0c2785911e9d9259cd866283cb9.1477735797.git.mchehab@s-opensource.com>
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <364a36215c44e0c2785911e9d9259cd866283cb9.1477735797.git.mchehab@s-opensource.com>
In-Reply-To: <364a36215c44e0c2785911e9d9259cd866283cb9.1477735797.git.mchehab@s-opensource.com>
References: <364a36215c44e0c2785911e9d9259cd866283cb9.1477735797.git.mchehab@s-opensource.com>
Sender: linux-doc-owner@vger.kernel.org
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>, Mauro Carvalho Chehab <mchehab@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Vernon Mauery <vernux@us.ibm.com>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

The "What:" field at the ABI should describe the location of
the ABI, e. g. the position under a mounted sysfs. However,
this file has only the basename without the path.

Fix it.

Cc: Vernon Mauery <vernux@us.ibm.com>
Cc: Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org
Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/ABI/testing/sysfs-devices-system-ibm-rtl | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-devices-system-ibm-rtl b/Documentation/ABI/testing/sysfs-devices-system-ibm-rtl
index b82deeaec314..470def06ab0a 100644
--- a/Documentation/ABI/testing/sysfs-devices-system-ibm-rtl
+++ b/Documentation/ABI/testing/sysfs-devices-system-ibm-rtl
@@ -1,4 +1,4 @@
-What:           state
+What:           /sys/devices/system/ibm_rtl/state
 Date:           Sep 2010
 KernelVersion:  2.6.37
 Contact:        Vernon Mauery <vernux@us.ibm.com>
@@ -10,7 +10,7 @@ Description:    The state file allows a means by which to change in and
 Users:          The ibm-prtm userspace daemon uses this interface.
 
 
-What:           version
+What:           /sys/devices/system/ibm_rtl/version
 Date:           Sep 2010
 KernelVersion:  2.6.37
 Contact:        Vernon Mauery <vernux@us.ibm.com>
-- 
2.7.4


From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2 4/4] platform:x86: Makefile/Kconfig/MAINTAINERS
 changes for Intel Telemetry
Date: Sat, 10 Oct 2015 11:38:29 -0700
Message-ID: <20151010183829.GA23749@malice.jf.intel.com>
References: <1442912500-1878-1-git-send-email-souvik.k.chakravarty@intel.com>
 <20151008165209.GE101005@vmdeb7>
 <5F7315E704FA0841B5DFCE90329B2BB42AD0C76E@BGSMSX102.gar.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:47070 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750775AbbJJSib (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 10 Oct 2015 14:38:31 -0400
Content-Disposition: inline
In-Reply-To: <5F7315E704FA0841B5DFCE90329B2BB42AD0C76E@BGSMSX102.gar.corp.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Chakravarty, Souvik K" <souvik.k.chakravarty@intel.com>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "Kasagar, Srinidhi" <srinidhi.kasagar@intel.com>, "Zha, Qipeng" <qipeng.zha@intel.com>

On Fri, Oct 09, 2015 at 04:31:40AM +0000, Chakravarty, Souvik K wrote:
> Hi Darren,
> 
> I am a bit confused as checkpatch that I pulled from Linus' tree gave me all clear.
> Can you please send me the log, because I have a clean checkpatch report at my end.
> 

Sure, using checkpatch.pl from Linux v4.3-rc4:

$ scripts/checkpatch.pl ~/incoming/*mbox
------------------------------------------------------------------------------------
/home/dvhart/incoming/PATCH_v2_1-4_platform-x86_Add_Intel_Telemetry_Core_Driver.mbox
------------------------------------------------------------------------------------
WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
#51: 
new file mode 100644

WARNING: Comparisons should place the constant on the right side of the test
#645: FILE: drivers/platform/x86/intel_telemetry_core.c:437:
+	if (TELEM_PSS == telem_unit)

WARNING: Comparisons should place the constant on the right side of the test
#648: FILE: drivers/platform/x86/intel_telemetry_core.c:440:
+	else if (TELEM_IOSS == telem_unit)

total: 0 errors, 3 warnings, 611 lines checked

/home/dvhart/incoming/PATCH_v2_1-4_platform-x86_Add_Intel_Telemetry_Core_Driver.mbox has style problems, please review.
-------------------------------------------------------------------------------------------------
/home/dvhart/incoming/PATCH_v2_2-4_platform-x86_Add_Intel_telemetry_platform_device_&_driver.mbox
-------------------------------------------------------------------------------------------------
WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
#211: 
new file mode 100644

WARNING: Block comments use * on subsequent lines
#318: FILE: drivers/platform/x86/intel_telemetry_pltdrv.c:103:
+/* The following counters are programmed by default during setup.
+   Only 20 allocated to kernel driver */

WARNING: Block comments use a trailing */ on a separate line
#318: FILE: drivers/platform/x86/intel_telemetry_pltdrv.c:103:
+   Only 20 allocated to kernel driver */

WARNING: Comparisons should place the constant on the right side of the test
#388: FILE: drivers/platform/x86/intel_telemetry_pltdrv.c:173:
+	if (TELEM_PSS == telem_unit)

WARNING: Comparisons should place the constant on the right side of the test
#390: FILE: drivers/platform/x86/intel_telemetry_pltdrv.c:175:
+	else if (TELEM_IOSS == telem_unit)

WARNING: Comparisons should place the constant on the right side of the test
#421: FILE: drivers/platform/x86/intel_telemetry_pltdrv.c:206:
+		if ((len > 0) && (NULL == evtmap))

WARNING: Comparisons should place the constant on the right side of the test
#431: FILE: drivers/platform/x86/intel_telemetry_pltdrv.c:216:
+		if ((len > 0) && (NULL == evtmap))

WARNING: Comparisons should place the constant on the right side of the test
#509: FILE: drivers/platform/x86/intel_telemetry_pltdrv.c:294:
+	if (TELEM_RESET == action) {

WARNING: Comparisons should place the constant on the right side of the test
#539: FILE: drivers/platform/x86/intel_telemetry_pltdrv.c:324:
+	if (TELEM_UPDATE == action) {

WARNING: Comparisons should place the constant on the right side of the test
#571: FILE: drivers/platform/x86/intel_telemetry_pltdrv.c:356:
+	if (TELEM_ADD == action) {

WARNING: Comparisons should place the constant on the right side of the test
#642: FILE: drivers/platform/x86/intel_telemetry_pltdrv.c:427:
+	if (TELEM_RESET == action) {

WARNING: Comparisons should place the constant on the right side of the test
#669: FILE: drivers/platform/x86/intel_telemetry_pltdrv.c:454:
+	if (TELEM_UPDATE == action) {

WARNING: Comparisons should place the constant on the right side of the test
#699: FILE: drivers/platform/x86/intel_telemetry_pltdrv.c:484:
+	if (TELEM_ADD == action) {

WARNING: Comparisons should place the constant on the right side of the test
#1204: FILE: drivers/platform/x86/intel_telemetry_pltdrv.c:989:
+	if (NULL == verbosity)

total: 0 errors, 14 warnings, 1371 lines checked

/home/dvhart/incoming/PATCH_v2_2-4_platform-x86_Add_Intel_telemetry_platform_device_&_driver.mbox has style problems, please review.
-------------------------------------------------------------------------------------------
/home/dvhart/incoming/PATCH_v2_3-4_platform-x86_Add_Intel_Telemetry_Debugfs_interfaces.mbox
-------------------------------------------------------------------------------------------
WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
#46: 
new file mode 100644

total: 0 errors, 1 warnings, 1094 lines checked

/home/dvhart/incoming/PATCH_v2_3-4_platform-x86_Add_Intel_Telemetry_Debugfs_interfaces.mbox has style problems, please review.
-------------------------------------------------------------------------------------------------------------
/home/dvhart/incoming/PATCH_v2_4-4_platform-x86_Makefile-Kconfig-MAINTAINERS_changes_for_Intel_Telemetry.mbox
-------------------------------------------------------------------------------------------------------------
total: 0 errors, 0 warnings, 36 lines checked

/home/dvhart/incoming/PATCH_v2_4-4_platform-x86_Makefile-Kconfig-MAINTAINERS_changes_for_Intel_Telemetry.mbox has no obvious style problems and is ready for submission.

NOTE: If any of the errors are false positives, please report
      them to the maintainer, see CHECKPATCH in MAINTAINERS.

-- 
Darren Hart
Intel Open Source Technology Center

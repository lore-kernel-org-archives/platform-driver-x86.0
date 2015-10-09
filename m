From: "Chakravarty, Souvik K" <souvik.k.chakravarty@intel.com>
Subject: RE: [PATCH v2 4/4] platform:x86: Makefile/Kconfig/MAINTAINERS
 changes for Intel Telemetry
Date: Fri, 9 Oct 2015 04:31:40 +0000
Message-ID: <5F7315E704FA0841B5DFCE90329B2BB42AD0C76E@BGSMSX102.gar.corp.intel.com>
References: <1442912500-1878-1-git-send-email-souvik.k.chakravarty@intel.com>
 <20151008165209.GE101005@vmdeb7>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:58547 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756652AbbJIEbq convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 9 Oct 2015 00:31:46 -0400
In-Reply-To: <20151008165209.GE101005@vmdeb7>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "Kasagar, Srinidhi" <srinidhi.kasagar@intel.com>, "Zha, Qipeng" <qipeng.zha@intel.com>

Hi Darren,

I am a bit confused as checkpatch that I pulled from Linus' tree gave me all clear.
Can you please send me the log, because I have a clean checkpatch report at my end.

BR,
Souvik

skchakra@intel-desktop:~/disk2/linux-platform-drivers-x86/linux$ ./scripts/checkpatch.pl 0004-platform-x86-Makefile-Kconfig-MAINTAINERS-changes-fo.patch
total: 0 errors, 0 warnings, 36 lines checked

0004-platform-x86-Makefile-Kconfig-MAINTAINERS-changes-fo.patch has no obvious style problems and is ready for submission.
skchakra@intel-desktop:~/disk2/linux-platform-drivers-x86/linux$ ./scripts/checkpatch.pl 0003-platform-x86-Add-Intel-Telemetry-Debugfs-interfaces.patch
WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
#29:
new file mode 100644

total: 0 errors, 1 warnings, 1094 lines checked

0003-platform-x86-Add-Intel-Telemetry-Debugfs-interfaces.patch has style problems, please review.

NOTE: If any of the errors are false positives, please report
      them to the maintainer, see CHECKPATCH in MAINTAINERS.
skchakra@intel-desktop:~/disk2/linux-platform-drivers-x86/linux$ ./scripts/checkpatch.pl 0002-platform-x86-Add-Intel-telemetry-platform-device-dri.patch
WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
#195:
new file mode 100644

total: 0 errors, 1 warnings, 1371 lines checked

0002-platform-x86-Add-Intel-telemetry-platform-device-dri.patch has style problems, please review.

NOTE: If any of the errors are false positives, please report
      them to the maintainer, see CHECKPATCH in MAINTAINERS.
skchakra@intel-desktop:~/disk2/linux-platform-drivers-x86/linux$ ./scripts/checkpatch.pl 0001-platform-x86-Add-Intel-Telemetry-Core-Driver.patch
WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
#34:
new file mode 100644

total: 0 errors, 1 warnings, 611 lines checked

0001-platform-x86-Add-Intel-Telemetry-Core-Driver.patch has style problems, please review.

NOTE: If any of the errors are false positives, please report
      them to the maintainer, see CHECKPATCH in MAINTAINERS.

> -----Original Message-----
> From: platform-driver-x86-owner@vger.kernel.org [mailto:platform-driver-x86-
> owner@vger.kernel.org] On Behalf Of Darren Hart
> Sent: Thursday, October 8, 2015 10:22 PM
> To: Chakravarty, Souvik K <souvik.k.chakravarty@intel.com>
> Cc: platform-driver-x86@vger.kernel.org; Kasagar, Srinidhi
> <srinidhi.kasagar@intel.com>; Zha, Qipeng <qipeng.zha@intel.com>
> Subject: Re: [PATCH v2 4/4] platform:x86: Makefile/Kconfig/MAINTAINERS
> changes for Intel Telemetry
> 
> On Tue, Sep 22, 2015 at 02:31:40PM +0530, Souvik Kumar Chakravarty wrote:
> > Makefile, Kconfig & MAINTAINERS changes for compiling Telemetry.
> > It depends on PUNIT and PMC IPC drivers.
> >
> > Signed-off-by: Souvik Kumar Chakravarty
> > <souvik.k.chakravarty@intel.com>
> 
> Souvik, v2 seems to be the latest I have from you and checkpatch still reports
> several basic coding style errors about comment blocks and comparison
> constant location.
> 
> See my response to v1 regarding that on Sep 18.
> 
> --
> Darren Hart
> Intel Open Source Technology Center
> --
> To unsubscribe from this list: send the line "unsubscribe platform-driver-x86"
> in the body of a message to majordomo@vger.kernel.org More majordomo
> info at  http://vger.kernel.org/majordomo-info.html

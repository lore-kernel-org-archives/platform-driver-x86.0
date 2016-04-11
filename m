From: "Zha, Qipeng" <qipeng.zha@intel.com>
Subject: RE: [PATCH] platform:x86 decouple telemetry driver from the
 optional IPC resources
Date: Mon, 11 Apr 2016 02:04:28 +0000
Message-ID: <C6287702A945AC47BE5DB5DFD4B5C6DD039027C0@SHSMSX104.ccr.corp.intel.com>
References: <1459452489-46827-1-git-send-email-aubrey.li@linux.intel.com>
 <20160410024513.GA18689@dvhart-mobl5.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:62811 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751336AbcDKCEc convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 10 Apr 2016 22:04:32 -0400
In-Reply-To: <20160410024513.GA18689@dvhart-mobl5.amr.corp.intel.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Aubrey Li <aubrey.li@linux.intel.com>, "Chakravarty, Souvik K" <souvik.k.chakravarty@intel.com>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

>> Currently the optional IPC resources prevent telemetry driver from 
>> probing if these resources are not in ACPI table. This patch decouples 
>> telemetry driver from these optional resources, so that telemetry 
>> driver has dependency only on the necessary ACPI resources.
>> 
>> Signed-off-by: Aubrey Li <aubrey.li@linux.intel.com>

>Given the impact to their recent contributions, I'm looking for reviews from Qipeng and Souvik before I merge this.

>Qipeng, as the listed maintainer for these two files, I particularly need to hear from you.

>Thanks,

Hi Darren,  I think this is a reasonable solution for such issue.
Thanks Aubrey for this fixing patch.

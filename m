From: "Zha, Qipeng" <qipeng.zha@intel.com>
Subject: RE: [PATCH] platform:x86: add Intel Broxton PMC IPC driver
Date: Thu, 23 Apr 2015 01:06:59 +0000
Message-ID: <C6287702A945AC47BE5DB5DFD4B5C6DD0188BC92@SHSMSX104.ccr.corp.intel.com>
References: <1429571069-55055-1-git-send-email-qipeng.zha@intel.com>
	<20150420182603.7d469d06@lxorguk.ukuu.org.uk>
	<C6287702A945AC47BE5DB5DFD4B5C6DD0187F65D@SHSMSX104.ccr.corp.intel.com>
	<20150421125848.179725f4@lxorguk.ukuu.org.uk>
	<C6287702A945AC47BE5DB5DFD4B5C6DD0188B916@SHSMSX104.ccr.corp.intel.com>
 <20150422113631.301079a1@lxorguk.ukuu.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:41713 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750771AbbDWBIN convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 22 Apr 2015 21:08:13 -0400
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "dvhart@infradead.org" <dvhart@infradead.org>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>
Cc: "Zheng, Qi" <qi.zheng@intel.com>, "Zhong, Huiquan" <huiquan.zhong@intel.com>, "Chen, Jason CJ" <jason.cj.chen@intel.com>, "Yang, Fei" <fei.yang@intel.com>

Hi Alan

Thanks.
The register  access ipc command is only used to r/w registers on PMIC which is controlled by PMC, Based on current pmic core driver design and Fei's suggestion, we implement regmap interface to Access such registers based on PMC ipc command.
Then pmic device driver(or other driver need to access pmic registers) can use generic regmap_read/_write Directly.




Best wishes
Qipeng

-----Original Message-----
From: One Thousand Gnomes [mailto:gnomes@lxorguk.ukuu.org.uk]
Sent: Wednesday, April 22, 2015 6:37 PM
To: Zha, Qipeng
Cc: "platform-driver-x86@vger.kernel.org\" <platform-driver-x86@vger.kernel.org>, " dvhart@infradead.org " <dvhart@infradead.org>, " Yang; Fei " <fei.yang@intel.com>, " Zhong@lxorguk.ukuu.org.uk; Huiquan " <huiquan.zhong@intel.com>, " Chen@lxorguk.ukuu.org.uk; Jason.CJ " <jason.cj.chen@intel.com>, " Zheng@lxorguk.ukuu.org.uk; Qi " <qi.zheng@intel.com>"@lxorguk.ukuu.org.uk
Subject: Re: [PATCH] platform:x86: add Intel Broxton PMC IPC driver

On Wed, 22 Apr 2015 10:32:44 +0000
"Zha, Qipeng" <qipeng.zha@intel.com> wrote:

> Hi Alan
> 
> a) Register access is one of ipc commands, and we do provide more generic APIs based on regmap subsystem in other patch,
>     with that, there will be not necessary to check platform(Broxton) for register access.

Ok that is good... but can I ask why you have two layers of IPC commands and then regmap - not just a single file that solely provides the regmap interface ?

> b) we separate scu and pmc ipc in two drivers, is because they are many difference in hw itself,  it composite several sub devices
> in hardware layer, and supported ipc commands are different,    I expected user driver will not check platform(Broxston...) to do
> ipc with scu or pmc when no common commands.

Ok

Alan

From: "Zha, Qipeng" <qipeng.zha@intel.com>
Subject: RE: [PATCH] platform:x86: add Intel Broxton PMC IPC driver
Date: Wed, 22 Apr 2015 10:32:44 +0000
Message-ID: <C6287702A945AC47BE5DB5DFD4B5C6DD0188B916@SHSMSX104.ccr.corp.intel.com>
References: <1429571069-55055-1-git-send-email-qipeng.zha@intel.com>
	<20150420182603.7d469d06@lxorguk.ukuu.org.uk>
	<C6287702A945AC47BE5DB5DFD4B5C6DD0187F65D@SHSMSX104.ccr.corp.intel.com>
 <20150421125848.179725f4@lxorguk.ukuu.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:47165 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751733AbbDVKcs convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 22 Apr 2015 06:32:48 -0400
In-Reply-To: <20150421125848.179725f4@lxorguk.ukuu.org.uk>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "dvhart@infradead.org" <dvhart@infradead.org>, "Yang, Fei" <fei.yang@intel.com>, "Zhong, Huiquan" <huiquan.zhong@intel.com>, "Chen, Jason CJ" <jason.cj.chen@intel.com>, "Zheng, Qi" <qi.zheng@intel.com>

Hi Alan

a) Register access is one of ipc commands, and we do provide more generic APIs based on regmap subsystem in other patch,
    with that, there will be not necessary to check platform(Broxton) for register access.
b) we separate scu and pmc ipc in two drivers, is because they are many difference in hw itself,  it composite several sub devices
in hardware layer, and supported ipc commands are different,    I expected user driver will not check platform(Broxston...) to do
ipc with scu or pmc when no common commands.

  

Best wishes
Qipeng

-----Original Message-----
From: One Thousand Gnomes [mailto:gnomes@lxorguk.ukuu.org.uk] 
Sent: Tuesday, April 21, 2015 7:59 PM
To: Zha, Qipeng
Cc: platform-driver-x86@vger.kernel.org; dvhart@infradead.org; Yang, Fei; Zhong, Huiquan; Chen, Jason CJ; Zheng, Qi
Subject: Re: [PATCH] platform:x86: add Intel Broxton PMC IPC driver

On Tue, 21 Apr 2015 00:59:35 +0000
"Zha, Qipeng" <qipeng.zha@intel.com> wrote:

> Hi Alan
> 
> Fei, owner of intel_scu_ipc.c, suggested separate these two, since 
> they are different hw, Not prefer to manage them in one driver.

They don't look that different to me except that it lacks some of the cleanups as well as the naming to make it more Linxulike
(intel_scu_ipc_iowrite16 etc) that were done to the scu_ipc code.

What we really want to avoid is code elsewhere that ends up doing

	if (broxton)
		intel_pmc_ipc_foo(x)
	else
		intel_scu_ipc_foo(x);

I guess to judge that really means seeing who uses these routines. At the moment the user you've posted takes the existing not very pretty API and wraps it up again in another one with no obvious reason for all the layering, but it does at least then provide the upper layer as a sort of abstraction.

For the code itself

- there are quite a few things that could be const
- you keep the register bases in both the platform resources of the
  subdevices and directly, yet don't seem to use them directly ?

Alan

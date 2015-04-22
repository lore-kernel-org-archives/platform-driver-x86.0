From: "Yang, Fei" <fei.yang@intel.com>
Subject: RE: [PATCH] platform:x86: add Intel Broxton PMC IPC driver
Date: Wed, 22 Apr 2015 15:31:23 +0000
Message-ID: <02E7334B1630744CBDC55DA858622583492DE504@ORSMSX102.amr.corp.intel.com>
References: <1429571069-55055-1-git-send-email-qipeng.zha@intel.com>
	<20150420182603.7d469d06@lxorguk.ukuu.org.uk>
	<C6287702A945AC47BE5DB5DFD4B5C6DD0187F65D@SHSMSX104.ccr.corp.intel.com>
 <20150421125848.179725f4@lxorguk.ukuu.org.uk>
 <C6287702A945AC47BE5DB5DFD4B5C6DD0188B916@SHSMSX104.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:16602 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S965612AbbDVPb0 convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 22 Apr 2015 11:31:26 -0400
In-Reply-To: <C6287702A945AC47BE5DB5DFD4B5C6DD0188B916@SHSMSX104.ccr.corp.intel.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Zha, Qipeng" <qipeng.zha@intel.com>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "dvhart@infradead.org" <dvhart@infradead.org>, "Zhong, Huiquan" <huiquan.zhong@intel.com>, "Chen, Jason CJ" <jason.cj.chen@intel.com>, "Zheng, Qi" <qi.zheng@intel.com>

>> Hi Alan
>> 
>> Fei, owner of intel_scu_ipc.c, suggested separate these two, since 
>> they are different hw, Not prefer to manage them in one driver.
>
> They don't look that different to me except that it lacks some of the cleanups as well as the naming to make it more Linxulike
> (intel_scu_ipc_iowrite16 etc) that were done to the scu_ipc code.

I proposed a different name because the so called SCU is phasing out, and I don't think anyone is
actively maintaining the scu_ipc driver. On the other hand the PMC design is expected to have a much
longer life time, so I think it's better to have fresh start, not confused with the old SCU IPC.

-Fei

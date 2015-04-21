From: One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH] platform:x86: add Intel Broxton PMC IPC driver
Date: Tue, 21 Apr 2015 12:58:48 +0100
Message-ID: <20150421125848.179725f4@lxorguk.ukuu.org.uk>
References: <1429571069-55055-1-git-send-email-qipeng.zha@intel.com>
	<20150420182603.7d469d06@lxorguk.ukuu.org.uk>
	<C6287702A945AC47BE5DB5DFD4B5C6DD0187F65D@SHSMSX104.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from 251.110.2.81.in-addr.arpa ([81.2.110.251]:50405 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752667AbbDUL7Z (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 21 Apr 2015 07:59:25 -0400
In-Reply-To: <C6287702A945AC47BE5DB5DFD4B5C6DD0187F65D@SHSMSX104.ccr.corp.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Zha, Qipeng" <qipeng.zha@intel.com>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "dvhart@infradead.org" <dvhart@infradead.org>, "Yang, Fei" <fei.yang@intel.com>, "Zhong, Huiquan" <huiquan.zhong@intel.com>, "Chen, Jason CJ" <jason.cj.chen@intel.com>, "Zheng, Qi" <qi.zheng@intel.com>

On Tue, 21 Apr 2015 00:59:35 +0000
"Zha, Qipeng" <qipeng.zha@intel.com> wrote:

> Hi Alan
> 
> Fei, owner of intel_scu_ipc.c, suggested separate these two, since they are different hw,
> Not prefer to manage them in one driver.

They don't look that different to me except that it lacks some of the
cleanups as well as the naming to make it more Linxulike
(intel_scu_ipc_iowrite16 etc) that were done to the scu_ipc code.

What we really want to avoid is code elsewhere that ends up doing

	if (broxton)
		intel_pmc_ipc_foo(x)
	else
		intel_scu_ipc_foo(x);

I guess to judge that really means seeing who uses these routines. At the
moment the user you've posted takes the existing not very pretty API and
wraps it up again in another one with no obvious reason for all the
layering, but it does at least then provide the upper layer as a sort of
abstraction.

For the code itself

- there are quite a few things that could be const
- you keep the register bases in both the platform resources of the
  subdevices and directly, yet don't seem to use them directly ?

Alan

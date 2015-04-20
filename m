From: One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH] platform:x86: add Intel Broxton PMC IPC driver
Date: Mon, 20 Apr 2015 18:26:03 +0100
Message-ID: <20150420182603.7d469d06@lxorguk.ukuu.org.uk>
References: <1429571069-55055-1-git-send-email-qipeng.zha@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from 251.110.2.81.in-addr.arpa ([81.2.110.251]:49368 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753419AbbDTR0t (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 20 Apr 2015 13:26:49 -0400
In-Reply-To: <1429571069-55055-1-git-send-email-qipeng.zha@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "qipeng.zha" <qipeng.zha@intel.com>
Cc: platform-driver-x86@vger.kernel.org, dvhart@infradead.org, fei.yang@intel.com, huiquan.zhong@intel.com, jason.cj.chen@intel.com, qi.zheng@intel.com

On Tue, 21 Apr 2015 07:04:29 +0800
"qipeng.zha" <qipeng.zha@intel.com> wrote:

> From: "qipeng.zha" <qipeng.zha@intel.com>
> 
> This driver provides support for PMC control on Broxton platforms,
> PMC is ARC processor which defined some IPC commands for communication
> with other entities running in IA

This appears to mostly be a clone of 

drivers/platform/x86/intel_scu_ipc.c

so is there any reason why it has to be another rewrite of the ancient
driver that was already cleaned up and upstreamed once.

Alan

From: "Zha, Qipeng" <qipeng.zha@intel.com>
Subject: RE: [PATCH] platform:x86: add Intel Broxton PMC IPC driver
Date: Tue, 21 Apr 2015 00:59:35 +0000
Message-ID: <C6287702A945AC47BE5DB5DFD4B5C6DD0187F65D@SHSMSX104.ccr.corp.intel.com>
References: <1429571069-55055-1-git-send-email-qipeng.zha@intel.com>
 <20150420182603.7d469d06@lxorguk.ukuu.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:26896 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751273AbbDUA7k convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 20 Apr 2015 20:59:40 -0400
In-Reply-To: <20150420182603.7d469d06@lxorguk.ukuu.org.uk>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "dvhart@infradead.org" <dvhart@infradead.org>, "Yang, Fei" <fei.yang@intel.com>, "Zhong, Huiquan" <huiquan.zhong@intel.com>, "Chen, Jason CJ" <jason.cj.chen@intel.com>, "Zheng, Qi" <qi.zheng@intel.com>

Hi Alan

Fei, owner of intel_scu_ipc.c, suggested separate these two, since they are different hw,
Not prefer to manage them in one driver.




Best wishes
Qipeng

-----Original Message-----
From: platform-driver-x86-owner@vger.kernel.org [mailto:platform-driver-x86-owner@vger.kernel.org] On Behalf Of One Thousand Gnomes
Sent: Tuesday, April 21, 2015 1:26 AM
To: Zha, Qipeng
Cc: platform-driver-x86@vger.kernel.org; dvhart@infradead.org; Yang, Fei; Zhong, Huiquan; Chen, Jason CJ; Zheng, Qi
Subject: Re: [PATCH] platform:x86: add Intel Broxton PMC IPC driver

On Tue, 21 Apr 2015 07:04:29 +0800
"qipeng.zha" <qipeng.zha@intel.com> wrote:

> From: "qipeng.zha" <qipeng.zha@intel.com>
> 
> This driver provides support for PMC control on Broxton platforms, PMC 
> is ARC processor which defined some IPC commands for communication 
> with other entities running in IA

This appears to mostly be a clone of 

drivers/platform/x86/intel_scu_ipc.c

so is there any reason why it has to be another rewrite of the ancient driver that was already cleaned up and upstreamed once.

Alan
--
To unsubscribe from this list: send the line "unsubscribe platform-driver-x86" in the body of a message to majordomo@vger.kernel.org More majordomo info at  http://vger.kernel.org/majordomo-info.html

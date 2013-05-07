From: Mattia Dongili <malattia@linux.it>
Subject: Re: [PATCH] sony-laptop: fix error return code in sony_pic_add()
Date: Wed, 8 May 2013 06:35:02 +0900
Message-ID: <20130507213502.GA2470@kamineko.org>
References: <CAPgLHd8HFBFUrwVP3xYGAz1LNhBHkARU7AUqDDb8U5RLOfQGPg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:51200 "EHLO
	smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752601Ab3EGVmI (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 7 May 2013 17:42:08 -0400
Content-Disposition: inline
In-Reply-To: <CAPgLHd8HFBFUrwVP3xYGAz1LNhBHkARU7AUqDDb8U5RLOfQGPg@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: matthew.garrett@nebula.com, yongjun_wei@trendmicro.com.cn, platform-driver-x86@vger.kernel.org

On Tue, May 07, 2013 at 08:05:44PM +0800, Wei Yongjun wrote:
> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> 
> Fix to return a negative error code in the sonypi_compat_init() error
> handling case instead of 0, as done elsewhere in this function.

Thanks Wei.
I'll pick this up and see if I have anything else for 3.11.

Regards,
-- 
mattia
:wq!

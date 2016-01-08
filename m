From: One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH] intel_punit_ipc: add NULL check for input parameters
Date: Fri, 8 Jan 2016 11:26:44 +0000
Message-ID: <20160108112644.4a64e49e@lxorguk.ukuu.org.uk>
References: <1452249147-34712-1-git-send-email-qipeng.zha@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from lxorguk.ukuu.org.uk ([81.2.110.251]:33274 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751780AbcAHL10 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 8 Jan 2016 06:27:26 -0500
In-Reply-To: <1452249147-34712-1-git-send-email-qipeng.zha@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Qipeng Zha <qipeng.zha@intel.com>
Cc: platform-driver-x86@vger.kernel.org, dvhart@infradead.org, andriy.shevchenko@linux.intel.com, souvik.k.chakravarty@intel.com

On Fri,  8 Jan 2016 18:32:27 +0800
Qipeng Zha <qipeng.zha@intel.com> wrote:

> intel_punit_ipc_command() maybe called when in or out
> data pointers are NULL.

In which case what happens: the command is not issued but there seems to
be no way for the caller to discover this, and nohing is logged.

Alan

From: =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
Subject: Re: [PATCH v3] platform:x86: add Intel Broxton PMC IPC driver
Date: Wed, 20 May 2015 12:56:37 +0200
Message-ID: <87d21vo6u2.fsf@nemi.mork.no>
References: <1432144085-49223-1-git-send-email-qipeng.zha@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from canardo.mork.no ([148.122.252.1]:59172 "EHLO canardo.mork.no"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751341AbbETK5P convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 20 May 2015 06:57:15 -0400
In-Reply-To: <1432144085-49223-1-git-send-email-qipeng.zha@intel.com> (qipeng
	zha's message of "Thu, 21 May 2015 01:48:05 +0800")
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "qipeng.zha" <qipeng.zha@intel.com>
Cc: platform-driver-x86@vger.kernel.org, dvhart@infradead.org, fei.yang@intel.com, huiquan.zhong@intel.com, jason.cj.chen@intel.com, qi.zheng@intel.com

"qipeng.zha" <qipeng.zha@intel.com> writes:

> +#ifdef CONFIG_INTEL_PMC_IPC

=2E.

> +config INTEL_PMC_IPC
> +	tristate "Intel PMC IPC Driver"


This still won't work.  Hint:  Use the IS_ENABLED macro.  See
include/linux/kconfig.h for details.

Or simply test your new tristate driver with *both* the 'y' and 'm'
alternatives....



Bj=C3=B8rn

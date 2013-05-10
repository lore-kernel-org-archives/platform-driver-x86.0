From: Hu Tao <hutao@cn.fujitsu.com>
Subject: Re: [PATCH v19] pvpanic: pvpanic device driver
Date: Fri, 10 May 2013 13:00:42 +0800
Message-ID: <20130510050042.GB2939@arch.fnst.cn.fujitsu.com>
References: <1367982932-23387-1-git-send-email-hutao@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cn.fujitsu.com ([222.73.24.84]:33756 "EHLO song.cn.fujitsu.com"
	rhost-flags-OK-FAIL-OK-OK) by vger.kernel.org with ESMTP
	id S1750824Ab3EJFBP (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 10 May 2013 01:01:15 -0400
In-Reply-To: <1367982932-23387-1-git-send-email-hutao@cn.fujitsu.com>
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, kvm@vger.kernel.org
Cc: Matthew Garrett <matthew.garrett@nebula.com>, Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>

On Wed, May 08, 2013 at 11:15:32AM +0800, Hu Tao wrote:
> pvpanic device is a qemu simulated device through which guest panic
> event is sent to host.
> 
> Signed-off-by: Hu Tao <hutao@cn.fujitsu.com>
> ---
> 
> v18 -> v19:  1. return -ENODEV early if port is 0
> 
> v17 -> v18:  1. call acpi_walk_resources to get the port, and usb outb instead
>                 of acpi_evaluate_oject in panic notifier callback
>              2. reword help message
> 
>  drivers/platform/x86/Kconfig   |   8 +++
>  drivers/platform/x86/Makefile  |   2 +
>  drivers/platform/x86/pvpanic.c | 124 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 134 insertions(+)
>  create mode 100644 drivers/platform/x86/pvpanic.c
> 

ping...

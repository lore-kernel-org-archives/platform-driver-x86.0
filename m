From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [patch] ideapad: uninitialized data in ideapad_acpi_add()
Date: Fri, 22 Jun 2012 16:57:46 +0300
Message-ID: <20120622135746.GG5390@mwanda>
References: <20120612162850.GB11077@elgon.mountain>
 <4FE1C0B1.9050901@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from acsinet15.oracle.com ([141.146.126.227]:25417 "EHLO
	acsinet15.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1762152Ab2FVN6A (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 22 Jun 2012 09:58:00 -0400
Content-Disposition: inline
In-Reply-To: <4FE1C0B1.9050901@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Ike Panhc <ike.pan@canonical.com>
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Jun 20, 2012 at 08:23:13PM +0800, Ike Panhc wrote:
> Hi Dan,
> 
> # cat /sys/kernel/debug/ideapad/cfg
> cfg: 0xFFFF8800007DE140
>        ^^^^^^^^ the uninitialized bit
> 
> I see your point, perhaps unsigned int will be better then int?
> 

I don't know if this is a question or a resend request.

I just chose that base on the fact that we are reading an int from
ACPI in read_method_int(adevice->handle, "_CFG", &cfg).  Either way
we're going to run into integer conversion issues if we get passed
a large or negative int.

I can resend if you want, I don't have strong feelings on this.

regards,
dan carpenter

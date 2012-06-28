From: Ike Panhc <ike.pan@canonical.com>
Subject: Re: [patch] ideapad: uninitialized data in ideapad_acpi_add()
Date: Thu, 28 Jun 2012 17:52:32 +0800
Message-ID: <4FEC2960.3010300@canonical.com>
References: <20120612162850.GB11077@elgon.mountain> <4FE1C0B1.9050901@canonical.com> <20120622135746.GG5390@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:60630 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932466Ab2F1Jwk (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 28 Jun 2012 05:52:40 -0400
In-Reply-To: <20120622135746.GG5390@mwanda>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org

On 06/22/2012 09:57 PM, Dan Carpenter wrote:
> On Wed, Jun 20, 2012 at 08:23:13PM +0800, Ike Panhc wrote:
>> Hi Dan,
>>
>> # cat /sys/kernel/debug/ideapad/cfg
>> cfg: 0xFFFF8800007DE140
>>        ^^^^^^^^ the uninitialized bit
>>
>> I see your point, perhaps unsigned int will be better then int?
>>
> 
> I don't know if this is a question or a resend request.
> 
> I just chose that base on the fact that we are reading an int from
> ACPI in read_method_int(adevice->handle, "_CFG", &cfg).  Either way
> we're going to run into integer conversion issues if we get passed
> a large or negative int.
> 
> I can resend if you want, I don't have strong feelings on this.
> 
> regards,
> dan carpenter
> 

ah, I asked stupid question. Never mind.

Thanks for your report.

From: Peter Meiser <meiser@gmx-topmail.de>
Subject: Re: Dell Vostro V131: special hotkey not working
Date: Fri, 11 May 2012 07:28:28 +0200
Message-ID: <4FACA37C.1050901@gmx-topmail.de>
References: <4F97FA4C.9040201@gmx-topmail.de> <20120425135328.GA13385@srcf.ucam.org> <4F980807.6000705@gmx-topmail.de> <20120425142205.GA14322@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mailout-de.gmx.net ([213.165.64.23]:40705 "HELO
	mailout-de.gmx.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1751025Ab2EKF2b (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 11 May 2012 01:28:31 -0400
In-Reply-To: <20120425142205.GA14322@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Rezwanul_Kabir@dell.com
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org

Hi Rez,

any news on this topic?

Thanks a lot in advance,
Peter

Am 25.04.2012 16:22, schrieb Matthew Garrett:
> On Wed, Apr 25, 2012 at 04:19:51PM +0200, Peter Meiser wrote:
>> Hello Matthew,
>>
>> Am 25.04.2012 15:53, schrieb Matthew Garrett:
>>> watch -n 0.1 cat /proc/interrupts
>>
>> When running "watch -n 0,1 cat /proc/interrupts" (watch -n 0.1 errors out, maybe because of German environment???), the following row increases after each press:
>>
>>   9:          5          0          0          0   IO-APIC-fasteoi   acpi
> 
> Ok, so it's definitely being handled by ACPI somehow - probably via WMI, 
> but unsure. Rez, any chance you can look at the original message and let 
> us know if this is expected to work with the current driver?
> 

From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for Aug 2 (drivers/platform/x86/apple-gmux.c)
Date: Thu, 02 Aug 2012 09:19:30 -0700
Message-ID: <501AA892.70207@xenotime.net>
References: <20120802141505.d30da7f7113e955679383acb@canb.auug.org.au> <501AA5A8.1070607@xenotime.net> <20120802161504.GG32395@thinkpad-t410>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from oproxy6-pub.bluehost.com ([67.222.54.6]:33839 "HELO
	oproxy6-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1752691Ab2HBQUn (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 2 Aug 2012 12:20:43 -0400
In-Reply-To: <20120802161504.GG32395@thinkpad-t410>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org

On 08/02/2012 09:15 AM, Seth Forshee wrote:

> On Thu, Aug 02, 2012 at 09:07:04AM -0700, Randy Dunlap wrote:
>> On 08/01/2012 09:15 PM, Stephen Rothwell wrote:
>>
>>> Hi all,
>>>
>>> Please do not add anything to linux-next included branches/series that is
>>> destined for v3.7 until after v3.6-rc1 is released.
>>>
>>> Reminder: do not rebase your branches before asking Linus to pull them ...
>>>
>>> Changes since 20120731:
>>>
>>
>>
>> when CONFIG_ACPI is not enabled: (on i386)
>>
>> drivers/platform/x86/apple-gmux.c: In function 'gmux_probe':
>> drivers/platform/x86/apple-gmux.c:196:2: error: implicit declaration of function 'acpi_video_dmi_promote_vendor'
>> drivers/platform/x86/apple-gmux.c: In function 'gmux_remove':
>> drivers/platform/x86/apple-gmux.c:219:2: error: implicit declaration of function 'acpi_video_dmi_demote_vendor'
>>
>>
>> Full randconfig file is attached.
> 
> I sent Matthew a patch that should fix this [1], but he doesn't seem to
> have picked it up yet.
> 
> Seth
> 
> [1] https://lkml.org/lkml/2012/7/2/257
> 


That patch does not fix this build error.
There is still an implicit assumption in Kconfig and
the driver source that ACPI is enabled.


-- 
~Randy

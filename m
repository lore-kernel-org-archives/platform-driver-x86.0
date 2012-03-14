From: Vaclav Mocek <vmocek@gmail.com>
Subject: Re: drivers/platform/x86/acer-wmi.c: Support for another Lenovo Ideapad
 S205
Date: Wed, 14 Mar 2012 21:49:37 +0000
Message-ID: <4F611271.70301@gmail.com>
References: <4F600A1D.5060002@gmail.com> <4F6037AF.3050002@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:64784 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1761437Ab2CNVuJ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 14 Mar 2012 17:50:09 -0400
Received: by wibhj6 with SMTP id hj6so7882382wib.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 14 Mar 2012 14:50:07 -0700 (PDT)
In-Reply-To: <4F6037AF.3050002@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Ike Panhc <ike.pan@canonical.com>
Cc: jlee@novell.com, mjg@redhat.com, platform-driver-x86@vger.kernel.org

On 03/14/2012 06:16 AM, Ike Panhc wrote:
> Hi Vaclav,
>
> Could you try this just-merged patch and see if it fix your problem?
>
> http://git.kernel.org/?p=linux/kernel/git/torvalds/linux.git;a=commit;h=461e74377cfcfc2c0d6bbdfa8fc5fbc21b052c2a

Hi Ike,

It looks like your patch effectively removes rfkill for all Lenovo's 
machines, except few hardcoded in acer_quirks[]. When I used F16 kernel 
and blacklisted acer-wmi module, it  didn't work; I am going to patch it 
and I will let you know.

Thanks.

Vaclav Mocek

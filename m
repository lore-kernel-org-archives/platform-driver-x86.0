From: Vaclav Mocek <vmocek@gmail.com>
Subject: Re: drivers/platform/x86/acer-wmi.c: Support for another Lenovo Ideapad
 S205
Date: Thu, 15 Mar 2012 23:09:07 +0000
Message-ID: <4F627693.2000606@gmail.com>
References: <4F600A1D.5060002@gmail.com> <4F6037AF.3050002@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f178.google.com ([209.85.212.178]:57182 "EHLO
	mail-wi0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965430Ab2COXJa (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 15 Mar 2012 19:09:30 -0400
Received: by wibhq7 with SMTP id hq7so6117wib.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 15 Mar 2012 16:09:29 -0700 (PDT)
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

tested, it doesn't work, basically it behaves as without your patch; my 
simple patch still works. If I understand correctly, you want to offload 
handling of rfkill to ideapad-laptop module. I will look into it during 
the weekend, any hint, what should I focus on? I am fairly new to this 
subsystem, it is quite complex and most of time I am spending studying 
how things work, which is nice, but it doesn't lead to immediate results.

BR

Vaclav M.

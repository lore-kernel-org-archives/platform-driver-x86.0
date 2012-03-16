From: Ike Panhc <ike.pan@canonical.com>
Subject: Re: drivers/platform/x86/acer-wmi.c: Support for another Lenovo Ideapad
 S205
Date: Fri, 16 Mar 2012 11:53:09 +0800
Message-ID: <4F62B925.9020508@canonical.com>
References: <4F600A1D.5060002@gmail.com> <4F6037AF.3050002@canonical.com> <4F627693.2000606@gmail.com> <4F62B793.4080405@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:56438 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758648Ab2CPDxQ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 15 Mar 2012 23:53:16 -0400
In-Reply-To: <4F62B793.4080405@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Vaclav Mocek <vmocek@gmail.com>
Cc: jlee@novell.com, mjg@redhat.com, platform-driver-x86@vger.kernel.org

On 03/16/2012 11:46 AM, Ike Panhc wrote:
> On 03/16/2012 07:09 AM, Vaclav Mocek wrote:
>> On 03/14/2012 06:16 AM, Ike Panhc wrote:
>>> Hi Vaclav,
>>>
>>> Could you try this just-merged patch and see if it fix your problem?
>>>
>>> http://git.kernel.org/?p=linux/kernel/git/torvalds/linux.git;a=commit;h=461e74377cfcfc2c0d6bbdfa8fc5fbc21b052c2a
>> Hi Ike,
>>
>> tested, it doesn't work, basically it behaves as without your patch; my simple patch still works. If I understand correctly, you want to offload handling of rfkill to ideapad-laptop module. I will look into it during the weekend, any hint, what should I focus on? I am fairly new to this subsystem, it is quite complex and most of time I am spending studying how things work, which is nice, but it doesn't lead to immediate results.
>>
>> BR
>>
>> Vaclav M.
>> -- 
>> To unsubscribe from this list: send the line "unsubscribe platform-driver-x86" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
> 
> What kernel version you use? Checked wiki and it might be 3.1 or 3.2.6. For 3.1 based kernel, you shall also backport this commit
> 
>   http://git.kernel.org/?p=linux/kernel/git/torvalds/linux.git;a=commit;h=1709adab0773616da7a8190f2762e599afb0a295
> 
> If this patch works properly, you shall see no 'acer-wireless' in `rfkill list` and you can unblock other rfkill for wifi. Then you shall be able to use your wireless.
> 
> If all rfkill is unblocked but you still can not use your wifi. Please post dmidecode here, I think, then, a possible approach is to consider to use DMI_PRODUCT_VERSION or add another DMI_PRODUCT_NAME in quirk.
> --
> To unsubscribe from this list: send the line "unsubscribe platform-driver-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

If you can put the dmidecode and acpidump somewhere I can reach, I can help with analysis the situation.

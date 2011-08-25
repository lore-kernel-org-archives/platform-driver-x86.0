From: Jason Stubbs <jasonbstubbs@gmail.com>
Subject: Re: [PATCH] Platform: Brightness quirk for samsung laptop driver
Date: Thu, 25 Aug 2011 13:27:26 +1000
Message-ID: <4E55C11E.8000704@gmail.com>
References: <1314115527-6063-1-git-send-email-dh.herrmann@googlemail.com> <20110824231053.GA7697@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-yi0-f46.google.com ([209.85.218.46]:57399 "EHLO
	mail-yi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750835Ab1HYDXX (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 24 Aug 2011 23:23:23 -0400
Received: by yie30 with SMTP id 30so1402042yie.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Aug 2011 20:23:22 -0700 (PDT)
In-Reply-To: <20110824231053.GA7697@kroah.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: David Herrmann <dh.herrmann@googlemail.com>, platform-driver-x86@vger.kernel.org, mjg@redhat.com

On 08/25/2011 09:10 AM, Greg KH wrote:
> On Tue, Aug 23, 2011 at 06:05:27PM +0200, David Herrmann wrote:
>> From: Jason Stubbs<jasonbstubbs@gmail.com>
>>
>> On some samsung laptops the brightness regulation works slightly different.
>> All SABI commands except for set_brightness work as expected. The behaviour
>> of set_brightness is as follows:
>>
>> - Setting a new brightness will only step one level toward the new brightness
>>    level. For example, setting a level of 5 when the current level is 2 will
>>    result in a brightness level of 3.
>> - A spurious KEY_BRIGHTNESS_UP or KEY_BRIGHTNESS_DOWN event is also generated
>>    along with the change in brightness.
>> - Neither of the above two issues occur when changing from/to brightness level 0.
>>
>> This patch adds detection and a non-intrusive workaround for the above issues.
>>
>> Signed-off-by: David Herrmann<dh.herrmann@googlemail.com>
>> ---
>> Hi
>>
>> This patch is originally from Jason Stubbs. See here:
>> http://git.kernel.org/?p=linux/kernel/git/gregkh/patches.git;a=blob;f=platform-samsung_laptop-add-support-for-samsung-nc210-nc110.patch;hb=HEAD
>>
>> I just wanted to ask whether there is some work going on here? My laptop model
>> needs this fix and I reviewed and tested it and it works fine. It would be nice
>> to see this upstream.
>
> I have a different patch from Jason that should fix this properly, I'll
> send it to Matthew later today.

If you're talking about the min/max calculations patch, that fixes a 
separate issue to this patch. Both patches touch set_brightness() 
though, which is probably where the confusion came from.

The version of the patch in git doesn't apply on top of the min/max 
calcs patch that you've added to the gregkh-2.6 tree, but I've 
previously posted a version that does. You can find it at 
https://lkml.org/lkml/2011/5/13/150 or I can post it again.

Regards,
Jason Stubbs

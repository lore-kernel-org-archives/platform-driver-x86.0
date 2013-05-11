From: Kyle Evans <kvans32@gmail.com>
Subject: Re: hp-wmi: SMBus hotkeys
Date: Sat, 11 May 2013 11:34:52 -0400
Message-ID: <518E651C.9020700@gmail.com>
References: <201304130331.18301@pali> <1365816906.13667.6.camel@x230.lan>       <51695169.6090306@gmail.com> <1365870087.13667.7.camel@x230.lan>      <51699843.7060905@gmail.com> <1366129583.13667.11.camel@x230.lan>     <516EC19C.3010906@gmail.com> <1366221554.13667.13.camel@x230.lan>    <516FFB3D.3060002@gmail.com> <1366300697.13667.15.camel@x230.lan>   <517023F8.5050606@gmail.com> <1366304008.13667.17.camel@x230.lan>  <5187E0F7.7010507@gmail.com> <1368046965.2425.34.camel@x230>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ie0-f181.google.com ([209.85.223.181]:57233 "EHLO
	mail-ie0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753064Ab3EKPfF (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 11 May 2013 11:35:05 -0400
Received: by mail-ie0-f181.google.com with SMTP id x12so9946118ief.12
        for <platform-driver-x86@vger.kernel.org>; Sat, 11 May 2013 08:35:05 -0700 (PDT)
In-Reply-To: <1368046965.2425.34.camel@x230>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>


On 05/08/2013 05:02 PM, Matthew Garrett wrote:
> On Mon, 2013-05-06 at 12:57 -0400, Kyle Evans wrote:
>
>> So, what is the plan for this? We have the WMI method so that ec_write
>> is not needed, but how are you thinking it should be triggered? I've got
>> some free time coming up and would like to get this banged out during
>> that time if it is something I can do.
> Well, with luck this patch would be safe on its own. How did you figure
> out that you needed to set this register to this value?
>
Well, in the end I dumped the EC contents from windows several times and 
compared the static values with those in the dump from linux. From your 
reply I understand that you are thinking that register 0xe6 is not SFHK 
on machines that the previous patch broke.... That sounds reasonable.

My concern was that SFHK required a different value on those machines, 
but I am not at all familiar with common practice.

Just a note, I found several other registers with static, non-zero 
values, which are zero in linux.

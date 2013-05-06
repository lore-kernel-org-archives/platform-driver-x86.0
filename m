From: Kyle Evans <kvans32@gmail.com>
Subject: Re: hp-wmi: SMBus hotkeys
Date: Mon, 06 May 2013 12:57:27 -0400
Message-ID: <5187E0F7.7010507@gmail.com>
References: <201304130331.18301@pali> <1365816906.13667.6.camel@x230.lan>      <51695169.6090306@gmail.com> <1365870087.13667.7.camel@x230.lan>     <51699843.7060905@gmail.com> <1366129583.13667.11.camel@x230.lan>    <516EC19C.3010906@gmail.com> <1366221554.13667.13.camel@x230.lan>   <516FFB3D.3060002@gmail.com> <1366300697.13667.15.camel@x230.lan>  <517023F8.5050606@gmail.com> <1366304008.13667.17.camel@x230.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ie0-f182.google.com ([209.85.223.182]:36442 "EHLO
	mail-ie0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753109Ab3EFQ5j (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 6 May 2013 12:57:39 -0400
Received: by mail-ie0-f182.google.com with SMTP id a14so4384879iee.27
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 May 2013 09:57:39 -0700 (PDT)
In-Reply-To: <1366304008.13667.17.camel@x230.lan>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>


On 04/18/2013 12:53 PM, Matthew Garrett wrote:
> On Thu, 2013-04-18 at 12:48 -0400, Kyle Evans wrote:
>
>> That only works if I also change:
>>
>> -#define HPWMI_BIOS_QUERY 0x8
>> +#define HPWMI_BIOS_QUERY 0x9
>>
>> But then we are still faced with a hardware detection problem I would assume.
> Heh. That's actually what it should have been in the first place - I
> just screwed it up. So, looks like that's a good starting point. I'll
> push the revert to Linux and queue this up for 3.10.
>
So, what is the plan for this? We have the WMI method so that ec_write 
is not needed, but how are you thinking it should be triggered? I've got 
some free time coming up and would like to get this banged out during 
that time if it is something I can do.

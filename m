From: Martin Kepplinger <martink@posteo.de>
Subject: Re: [PATCH] platform: acer-wmi: update notice about deprecated user
 interface
Date: Mon, 05 Oct 2015 12:34:47 +0200
Message-ID: <56125247.1020204@posteo.de>
References: <1443509198-11655-1-git-send-email-martink@posteo.de> <20150929095032.GF2115@linux-rxt1.site> <20151003172052.GF110874@vmdeb7> <20151005103002.GC2151@linux-rxt1.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151005103002.GC2151@linux-rxt1.site>
Sender: linux-kernel-owner@vger.kernel.org
To: joeyli <jlee@suse.com>, Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Am 2015-10-05 um 12:30 schrieb joeyli:
> Hi Darren, 
> 
> On Sat, Oct 03, 2015 at 10:20:52AM -0700, Darren Hart wrote:
>> On Tue, Sep 29, 2015 at 05:50:32PM +0800, joeyli wrote:
>>> Hi Martin, 
>>>
>>> On Tue, Sep 29, 2015 at 08:46:38AM +0200, Martin Kepplinger wrote:
>>>> Signed-off-by: Martin Kepplinger <martink@posteo.de>
>>>> ---
>>>> This just looks odd in the logs. Feel free to ignore it or act on it
>>>> differently ;)
>>>>
>>>>
>>>
>>> Thanks for your patch and it reminds me to remove those interfaces in acer-wmi.
>>> Please let me check and I am thinking direct remove those interfaces.
>>
>> Joey, I will wait to hear from you on this patch (or a replacement).
>>
>> Thanks,
>>
> 
> Thanks for your reminding. I just sent patch to remove sysfs interface of acer-wmi.
> 
> Joey Lee
> 

I have to leave the estimation whether this old interface won't have
users to you and others, but if it's ok, it's nice to see dead code
removed! thanks,

                  martin

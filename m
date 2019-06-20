From: Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [Linux-kernel-mentees] [PATCH] Documentation: platform: convert
 x86-laptop-drivers.txt to reST
Date: Thu, 20 Jun 2019 07:38:41 -0600
Message-ID: <bf25df8c-9135-c23b-0307-1e3ea611d9d4@linuxfoundation.org>
References: <20190618053227.31678-1-puranjay12@gmail.com>
 <20190618054158.GA3713@kroah.com> <20190618071717.2132a1b7@lwn.net>
 <20190618133948.GB5416@kroah.com>
 <8aeb222a-ee44-4125-45fd-ce9a741e7ecc@linuxfoundation.org>
 <CAHp75Vf__EtLVTOf0XvA3w7RPj+bnoQOud3gCXr1Fya0b_o4cw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75Vf__EtLVTOf0XvA3w7RPj+bnoQOud3gCXr1Fya0b_o4cw@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Puranjay Mohan <puranjay12@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, Cezary Jackiewicz <cezary.jackiewicz@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Linux Documentation List <linux-doc@vger.kernel.org>, linux-kernel-mentees@lists.linuxfoundation.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Shuah Khan <skhan@linuxfoundation.org>
List-Id: platform-driver-x86.vger.kernel.org

On 6/20/19 12:19 AM, Andy Shevchenko wrote:
> On Tue, Jun 18, 2019 at 6:06 PM Shuah Khan <skhan@linuxfoundation.org> wrote:
>> On 6/18/19 7:39 AM, Greg KH wrote:
>>> On Tue, Jun 18, 2019 at 07:17:17AM -0600, Jonathan Corbet wrote:
>>>> On Tue, 18 Jun 2019 07:41:58 +0200
>>>> Greg KH <gregkh@linuxfoundation.org> wrote:
>>>>> On Tue, Jun 18, 2019 at 11:02:27AM +0530, Puranjay Mohan wrote:
> 
>>> I bet it should be deleted, but we should ask the platform driver
>>> maintainers first before we do that :)
> 
>> Adding Platform driver maintainers Darren Hart and Andy Shevchenko, and
>> Compal laptop maintainer Cezary Jackiewicz to the discussion.
>>
>> + platform-driver-x86@vger.kernel.org
>>
>> Hi Darren, Andy, and Cezary,
>>
>> Would it be okay to remove the x86-laptop-drivers.txt or should it be
>> converted to .rst and kept around?
> 
> Shuan, thanks for heads up.
> The list of laptops supported by drivers in PDx86 subsystem is quite
> big and growing. The mentioned file contains less than per cent out of
> it and I don't think there is sense to make it up to date with
> thousands lines. Agree on removal.
> 

Thanks Andy!

Puranjay!

Please remove the file and cc everybody on this list on the v2 patch.
Make sure to build docs and see if this removal doesn't cause errors.

thanks,
-- Shuah

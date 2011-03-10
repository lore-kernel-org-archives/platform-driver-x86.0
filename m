From: Nikolai Kondrashov <spbnick@gmail.com>
Subject: Re: [PATCH] Platform: add Samsung Laptop platform driver
Date: Thu, 10 Mar 2011 09:00:36 +0200
Message-ID: <4D787714.6060405@gmail.com>
References: <20110209224006.GA11202@kroah.com> <AANLkTikrr6Gu_qoq73ASC95E0HQC1p6KzDPLxo=J_rva@mail.gmail.com> <20110225210334.GB16860@kroah.com> <4D6823DD.6040809@gmail.com> <20110225225055.GA5931@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110225225055.GA5931@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: Matthew Garrett <mjg@redhat.com>, Randy Dunlap <rdunlap@xenotime.net>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi Greg,

On 02/26/2011 12:50 AM, Greg KH wrote:
> On Sat, Feb 26, 2011 at 12:49:17AM +0300, Nikolai Kondrashov wrote:
>> On 02/26/2011 12:03 AM, Greg KH wrote:
>>> This should work, as we support the N150/N210/N220 versions.
>>>
>>> Can you provide the output of:
>>> 	grep ./sys/class/dmi/id/*
>>>
>>> so I can verify this?
>> Sure. Please find it attached. It is taken on a stock Debian kernel, without
>> your patch.
>>
>> Could I have configured the kernel incorrectly?
>
> Maybe, that's odd.
>
> Care to try the version of the patch below to see if that works better
> for you or not?
Thank you. The result is the same: ENODEV without "force" and "This computer
doesn't support SABI" and EINVAL with "force".

Sorry for the delay - I'm in the process of chaning my job as well as the
country of living now.

Sincerely,
Nick

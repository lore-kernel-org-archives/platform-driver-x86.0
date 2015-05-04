From: Azael Avalos <coproscefalo@gmail.com>
Subject: Re: [PATCH 0/3] toshiba_haps: Some misc changes plus sysfs entries documentation
Date: Mon, 4 May 2015 12:10:41 -0600
Message-ID: <CAGdLNWGUWzqnyZqFpPpzHYG4zv4pjKc8FcT2aGUcNsJRZyoOhg@mail.gmail.com>
References: <1424973511-3090-1-git-send-email-coproscefalo@gmail.com>
	<20150306183246.GJ19001@vmdeb7>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f175.google.com ([209.85.212.175]:32992 "EHLO
	mail-wi0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751007AbbEDSKn (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 4 May 2015 14:10:43 -0400
In-Reply-To: <20150306183246.GJ19001@vmdeb7>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Darren,


2015-03-06 11:32 GMT-07:00 Darren Hart <dvhart@infradead.org>:
> On Thu, Feb 26, 2015 at 10:58:29AM -0700, Azael Avalos wrote:
>> These patches make some misc chanes to the driver, replacing sscanf with
>> kstrtoint, DEVICE_ATTR_{RW, WO} macros and adding documentation about
>> the sysfs entries.
>>
>> Azael Avalos (3):
>>   toshiba_haps: Replace sscanf with kstrtoint
>>   toshiba_haps: Make use of DEVICE_ATTR_{RW, WO} macros
>>   Documentation/ABI: Add file describing the sysfs entries for
>>     toshiba_haps
>>
>>  .../ABI/testing/sysfs-driver-toshiba_haps          | 20 ++++++++++++++
>>  drivers/platform/x86/toshiba_haps.c                | 32 ++++++++++++++--------
>>  2 files changed, 40 insertions(+), 12 deletions(-)
>>  create mode 100644 Documentation/ABI/testing/sysfs-driver-toshiba_haps
>
> Queued for 4.1, thanks Azael.

These patches were supposed to be included in 4.1,
but somehow they didn't, can you re-queue for 4.2?

>
> --
> Darren Hart
> Intel Open Source Technology Center


Cheers
Azael


-- 
-- El mundo apesta y vosotros apestais tambien --

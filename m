From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] platform/x86: silead_dmi: Add touchscreen info for
 GP-electronic T701
Date: Mon, 8 May 2017 21:49:18 +0200
Message-ID: <d0d3f937-ad4f-3a15-62d7-9aadbaba6b97@redhat.com>
References: <20170507123515.12671-1-hdegoede@redhat.com>
 <20170508154026.GB17700@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:58442 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754883AbdEHTtV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 8 May 2017 15:49:21 -0400
In-Reply-To: <20170508154026.GB17700@fury>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org

Hi,

On 08-05-17 17:40, Darren Hart wrote:
> On Sun, May 07, 2017 at 02:35:15PM +0200, Hans de Goede wrote:
>> Add touchscreen info for the GP-electronic T701 tablet.
>>
> 
> Ugh, this is exactly the kind of thing ACPI _DSD was intended to solve. Not a
> lot we can do about the vendors not including the info in the DSDT of course,
> but...  ugh.
> 
> I'm curious, are the vendors involved in driving these patches?

Nope this is just a spare-time project of mine helping people who
want to run mainline Linux on various Bay Trail and Cherry Trail devices.

Regards,

Hans

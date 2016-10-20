From: Ike Panhc <ike.pan@canonical.com>
Subject: Re: [PATCH] ideapad-laptop: Add another DMI entry for Yoga 900
Date: Thu, 20 Oct 2016 08:56:30 +0800
Message-ID: <e7efc31b-7410-8386-e98e-f65762f07e40@canonical.com>
References: <20161019102740.74567-1-mika.westerberg@linux.intel.com>
 <20161019201043.GA78689@f23x64.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:51854 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756401AbcJTA4j (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 19 Oct 2016 20:56:39 -0400
In-Reply-To: <20161019201043.GA78689@f23x64.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org

On 10/20/2016 04:10 AM, Darren Hart wrote:
> On Wed, Oct 19, 2016 at 01:27:40PM +0300, Mika Westerberg wrote:
>> This particular laptop has its motherboard replaced and after that, even
>> with the latest BIOS, some DMI identification strings have become
>> "INVALID". This includes DMI_PRODUCT_VERSION which results Wifi being
>> blocked.
>>
>> It seems that DMI_BOARD_NAME is still valid so use that as an
>> alternative for Lenovo Yoga 900.
> 
> Well, that stinks. We have a similar split for the Yoga 2 11/13/Pro.
> 
> Applied.
> 

Hi Mika,

Could you post output of acpidump and `cat /sys/class/dmi/id/modalias` for record please?

Thanks a lot.

--
Ike Panhc

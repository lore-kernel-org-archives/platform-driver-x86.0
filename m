From: Ike Panhc <ike.pan@canonical.com>
Subject: Re: [PATCH] ideapad-laptop: Add Lenovo Yoga 910-13IKB to no_hw_rfkill
 dmi list
Date: Thu, 20 Oct 2016 08:58:53 +0800
Message-ID: <a848d067-25af-26a8-7f4c-d785b73232c3@canonical.com>
References: <1476228482-2823-1-git-send-email-masneyb@onstation.org>
 <20161012081739.GB4411@f23x64.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:51865 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756435AbcJTA67 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 19 Oct 2016 20:58:59 -0400
In-Reply-To: <20161012081739.GB4411@f23x64.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Brian Masney <masneyb@onstation.org>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On 10/12/2016 04:17 PM, Darren Hart wrote:
> On Tue, Oct 11, 2016 at 07:28:02PM -0400, Brian Masney wrote:
>> The Lenovo Yoga 910-13IKB does not have a hw rfkill switch, and trying
>> to read the hw rfkill switch through the ideapad module causes it to
>> always report as blocked.
>>
>> This commit adds the Lenovo Yoga 910-13IKB to the no_hw_rfkill dmi list,
>> fixing the WiFI breakage.
>>
>> Signed-off-by: Brian Masney <masneyb@onstation.org>
> 
> Thanks Brian,
> 
> Queued to testing.
> 

Hi Brian,

Could you post output of acpidump and `cat /sys/class/dmi/id/modalias` for record please?

I would like to see if there is anyway to short the growing blacklist.

Thanks a lot.

--
Ike Panhc

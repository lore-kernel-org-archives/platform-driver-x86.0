From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: ASUS X SERIES X553MA-BING-SX451B does not boot anymore
Date: Mon, 4 Sep 2017 22:52:35 -0500
Message-ID: <29a3ffbc-dc1f-1f4b-2fe2-2fe47e81efc1@linux.intel.com>
References: <1504515953.6179.3.camel@amazon.com>
 <1504517995.25945.214.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:62857 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753774AbdIEDwi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 4 Sep 2017 23:52:38 -0400
In-Reply-To: <1504517995.25945.214.camel@linux.intel.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "Casal Quinteiro, Ignacio" <qignacio@amazon.com>, "hdegoede@redhat.com" <hdegoede@redhat.com>, "irina.tirdea@intel.com" <irina.tirdea@intel.com>, "dvhart@infradead.org" <dvhart@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

On 9/4/17 4:39 AM, Andy Shevchenko wrote:
> On Mon, 2017-09-04 at 09:05 +0000, Casal Quinteiro, Ignacio wrote:
>> Hey guys,
>>
>> Just wanted to point you out to the bug report: https://bugzilla.kerne
>> l
>> .org/show_bug.cgi?id=196819
> 
> Thank you for a report, I updated it to notify Pierre-Louis. Let's
> continue there.
> 

You may need the follow-up patch that doesn't set the clocks if the 
firmware already does so. it's in 4.13rc-6, maybe it should be applied 
for 4.10..12-stable. I don't have a git tree with me but it's easy to 
find, it's the last patch to drivers/clk/x86/clk-pmc-atom.c

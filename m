Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD527C47082
	for <platform-driver-x86@archiver.kernel.org>; Mon, 31 May 2021 14:29:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C3373613AF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 31 May 2021 14:29:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232544AbhEaOao (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 31 May 2021 10:30:44 -0400
Received: from mail1.bemta24.messagelabs.com ([67.219.250.2]:23662 "EHLO
        mail1.bemta24.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233893AbhEaO15 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 31 May 2021 10:27:57 -0400
Received: from [100.112.131.194] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-2.bemta.az-a.us-west-2.aws.symcld.net id D3/C6-12171-802F4B06; Mon, 31 May 2021 14:26:16 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmplleJIrShJLcpLzFFi42JJl3vFrsvxaUu
  Cwb1+SYuXEw4zWhzacIDJ4s3x6UwWr5ofsVms3vOC2YHVY9LMGcweO2fdZfdYvOclk8f7fVfZ
  PD5vkgtgjWLNzEvKr0hgzbjQuJa9YC5vxdz+X6wNjKe4uhg5OYQE/jNKfOiU62LkArIfM0osm
  nSLBcQRFpjPKLHr8mF2kCoRAXWJqR09bCA2s0Ano8SP/dEQHR2MEtMm3GQCSbAJaEts2fILrI
  hXwFbiz9JPzF2MHBwsAqoSj9clgoRFBcIldne8ZIIoEZQ4OfMJC4jNKWAn8WpBG1g5s4CmxPp
  d+hCrxCVuPZnPBGHLS2x/O4cZxJYQUJRY/O0uK4SdINHz7xHbBEbBWUimzkKYNAvJpFlIJi1g
  ZFnFaJFUlJmeUZKbmJmja2hgoGtoaKRraGyoa2RsqpdYpZuoV1qsW55aXKJrpJdYXqxXXJmbn
  JOil5dasokRGDspBc2vdzBuePNB7xCjJAeTkiivuOLmBCG+pPyUyozE4oz4otKc1OJDjDIcHE
  oSvF4ftiQICRalpqdWpGXmAOMYJi3BwaMkwuv8HijNW1yQmFucmQ6ROsWoKCXO2wvSJwCSyCj
  Ng2uDpY5LjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5rT8CTeHJzCuBm/4KaDET0OLPoZtA
  FpckIqSkGpi2SbxLDeNKLzkY86hH5b3XHjumXW1OjmeE6jZzX+fvXD6NI9njy0a99XbXUiz3t
  h53e37Q8pjDsWfskjuaauZcSNg8K2v+8R0B/JPXWO8Jv5qbIxAjq5pyyFx4Y+Zl/Ut3U1cHsj
  lJrQn1/xsbtv3C5m0cX1N+dlypPifE5pIwcfmX0il70wobDfKS52xdK/fx5oPlSgtWrnaQqLq
  3Y8K62FwRxZcf14XsWuh8rUnItHTjT43K1vWWlyJX7hdLZf2d83a5bWGl3OMNUbqrJDZ9cXG7
  Fawl9uL3fuc3TVliBvxCoQ+iNEKv3LWRs73ceFHiyNcGmTcpIhtkH26qfnp6+oO7K594aR91j
  zI9Vu+sxFKckWioxVxUnAgAFS2peJgDAAA=
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-2.tower-336.messagelabs.com!1622471174!3693!1
X-Originating-IP: [103.30.234.7]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8438 invoked from network); 31 May 2021 14:26:16 -0000
Received: from unknown (HELO lenovo.com) (103.30.234.7)
  by server-2.tower-336.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 31 May 2021 14:26:16 -0000
Received: from reswpmail01.lenovo.com (unknown [10.62.32.20])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id 4ACEF99B178A03E3E54F;
        Mon, 31 May 2021 22:26:13 +0800 (CST)
Received: from [10.46.192.131] (10.46.192.131) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2176.2; Mon, 31 May
 2021 10:26:10 -0400
Subject: Re: [External] Re: [PATCH v5] platform/x86:
 firmware_attributes_class: Create helper file for handling
 firmware-attributes class registration events
To:     Hans de Goede <hdegoede@redhat.com>
CC:     <andy.shevchenko@gmail.com>, <Dell.Client.Kernel@dell.com>,
        <platform-driver-x86@vger.kernel.org>,
        kernel test robot <lkp@intel.com>
References: <markpearson@lenovo.com>
 <20210530223111.25929-1-markpearson@lenovo.com>
 <98d213aa-9500-64f7-9fce-b880a6322d01@redhat.com>
From:   Mark Pearson <markpearson@lenovo.com>
Message-ID: <c461244c-b31e-c8a2-1173-fdac5f7c41d2@lenovo.com>
Date:   Mon, 31 May 2021 10:26:09 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <98d213aa-9500-64f7-9fce-b880a6322d01@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.46.192.131]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


On 2021-05-31 9:56 a.m., Hans de Goede wrote:
> Hi,
> 
> On 5/31/21 12:31 AM, Mark Pearson wrote:
>> This will be used by the Dell and Lenovo WMI management drivers to
>> prevent both drivers being active.
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Signed-off-by: Mark Pearson <markpearson@lenovo.com>
>> ---
>> Changes in v2:
>>  - This is a new file requested as part of the review of the proposed
>> think_lmi.c driver. Labeling as V2 to keep series consistent
>>
>> Changes in v3:
>>  - Set default in Kconfig, and removed help text
>>  - Allow multiple modules to register with module. Change API names to
>>     better reflect this.
>>
>> Changes in v4:
>>  - version bump for consistency in series
>>
>> Changes in v5:
>>  - Fix issue reported by kernel test robot. Add header file to includes
> 
> Thanks Mark,
> 
> Unfortunately you squashed the Kconfig and Makefile changes which I made
> to v4 when fixing it up during merging into 3/3 instead of having them in
> v5 of this patch.
Oh - apologies; I tried to be careful and make sure I picked up the
fixes you'd made as well. I must have missed them here somehow :(

> 
> No worries, since this was the only problem which I could see I've fixed
> this up in my review-hans branch while merging v5 of this series there
> (replacing v4).
> 
> I did notice a bit of dead code while reviewing the changes which you
> made to 3/3 in response to Andy's review. I'll send a follow-up patch
> fixing that.
Sounds good. I'm intrigued what I've missed.

> 
> I'll leave this sit in my review-hans branch for a bit to give Andy
> a chance to give his Reviewed-by and then I'll push this to for-next.
Sounds good. Thank you!

Mark

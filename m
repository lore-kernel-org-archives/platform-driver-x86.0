Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81980C2B9F8
	for <platform-driver-x86@archiver.kernel.org>; Tue, 25 May 2021 14:02:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 661986141B
	for <platform-driver-x86@archiver.kernel.org>; Tue, 25 May 2021 14:02:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233273AbhEYODv (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 25 May 2021 10:03:51 -0400
Received: from mail1.bemta23.messagelabs.com ([67.219.246.4]:32589 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232728AbhEYODu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 25 May 2021 10:03:50 -0400
Received: from [100.112.3.43] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-4.bemta.az-b.us-east-1.aws.symcld.net id D4/14-44175-C630DA06; Tue, 25 May 2021 14:02:20 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpgleJIrShJLcpLzFFi42LJePGQVzebeW2
  CwdtPlhaHNhxgsujunstk8eb4dCaLzx2TWSxW73nBbLHo4xM2BzaPSTNnMHvMOxno8X7fVTaP
  z5vkAliiWDPzkvIrElgzFk3sZimYJ1zxe91D1gbGM/xdjJwcQgL/GSXur6/vYuQCsh8zSjyds
  4sFJCEsUCTx8cZZVhBbRCBQou36fkaQImaBJ4wSvaevMEJ09LBITF95igmkik1AW2LLll9sXY
  wcHLwCthKX/7KDhFkEVCUutf9jA7FFBcIldne8BCvnFRCUODnzCdgyTgE7iVkHFrKCtDILaEq
  s36UPEmYWEJe49WQ+E4QtL7H97RxmkBIJAUWJid90QcISAgkSPf8esU1gFJyFZOgshEGzkAya
  hWTQAkaWVYymSUWZ6RkluYmZObqGBga6hoZGuka6xpZ6iVW6SXqlxbqpicUluoZ6ieXFesWVu
  ck5KXp5qSWbGIERk1LApL6D8fLrD3qHGCU5mJREeaX8VycI8SXlp1RmJBZnxBeV5qQWH2KU4e
  BQkuA9w7Q2QUiwKDU9tSItMwcYvTBpCQ4eJRFeJpA0b3FBYm5xZjpE6hSjopQ4729GoIQASCK
  jNA+uDZYwLjHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5j0LMoUnM68EbvoroMVMQIuTclaB
  LC5JREhJNTC1nZ/I+WTn6kvLV5p6h+rN1t2VMb30xM/oa7bcUakm+a6/TjFoMQUW8PheqZi3M
  0WnZyZXjsSXSV/07Jx3ixq1/o/9GxFbdd16cs+i2IKCbytc7vblLZO8s7Du6cR1uirPLzMWRi
  n5mLC4yx7c8naJjcmUtAPZRT/uFlseePRogvHJvV/Ybs4Q25bQ360RHbzhX55tpgJP+ey7V1c
  GbI1dqBkZudcr4mRF7mePyR938kwIum0oNev3e7fPwsZ3jm607Xh72HpX7f7XK4ULPTfUOama
  /4ji4L9jfmGX84/LNy8ebtb4IWBdu9tX8TJXv0DHhdfzz5ortvNPLX5+Z9b0Hcw7/p496jejX
  tcqtNdbiaU4I9FQi7moOBEAsitpy5MDAAA=
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-17.tower-395.messagelabs.com!1621951339!105434!1
X-Originating-IP: [104.232.225.13]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30802 invoked from network); 25 May 2021 14:02:19 -0000
Received: from unknown (HELO lenovo.com) (104.232.225.13)
  by server-17.tower-395.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 25 May 2021 14:02:19 -0000
Received: from reswpmail01.lenovo.com (unknown [10.62.32.20])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id B15A867013C2D5E36E23;
        Tue, 25 May 2021 10:02:19 -0400 (EDT)
Received: from [10.46.192.114] (10.46.192.114) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2176.2; Tue, 25 May
 2021 10:02:19 -0400
Subject: Re: [External] Re: [PATCH v2 3/3] platform/x86: think-lmi: Add WMI
 interface support on Lenovo platforms
To:     Hans de Goede <hdegoede@redhat.com>,
        "Ksr, Prasanth" <Prasanth.Ksr@dell.com>
CC:     "mgross@linux.intel.com" <mgross@linux.intel.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "Bharathi, Divya" <Divya.Bharathi@Dell.com>,
        Dell Client Kernel <Dell.Client.Kernel@dell.com>
References: <markpearson@lenovo.com>
 <20210509015708.112766-1-markpearson@lenovo.com>
 <20210509015708.112766-3-markpearson@lenovo.com>
 <bbd0f3c9-63c3-2fbb-7712-ecb3131a4c0a@redhat.com>
 <ac30f95e-8398-fb11-8c94-b50050a3f88f@lenovo.com>
 <1c21c3d3-7ff1-a7b2-86d0-245050426760@redhat.com>
 <c8b706bb-5397-758e-8ab8-1d75b2920054@lenovo.com>
 <971080ef-a9c2-6de9-c6e1-895e7c5903f2@redhat.com>
 <CO1PR19MB5078C56213656707579025AD82269@CO1PR19MB5078.namprd19.prod.outlook.com>
 <b454148c-640e-f642-cd3d-17c71e573b95@redhat.com>
From:   Mark Pearson <markpearson@lenovo.com>
Message-ID: <7f6a6396-21db-6785-383d-f947b47e1a26@lenovo.com>
Date:   Tue, 25 May 2021 10:02:18 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <b454148c-640e-f642-cd3d-17c71e573b95@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.46.192.114]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi

On 2021-05-24 11:27 a.m., Hans de Goede wrote:
> Hi,
> 
> On 5/24/21 12:19 PM, Ksr, Prasanth wrote:
>> Hi,
>> 
>>> -----Original Message----- From: Hans de Goede
>>> <hdegoede@redhat.com> Sent: Friday, May 21, 2021 10:25 PM To:
>>> Mark Pearson Cc: mgross@linux.intel.com;
>>> platform-driver-x86@vger.kernel.org; Bharathi, Divya; Ksr,
>>> Prasanth; Dell Client Kernel Subject: Re: [External] Re: [PATCH
>>> v2 3/3] platform/x86: think-lmi: Add WMI interface support on
>>> Lenovo platforms
>>> 
>>> 
>>> [EXTERNAL EMAIL]
>>> 
>>> Hi,
>>> 
>>> On 5/21/21 5:55 PM, Mark Pearson wrote:
>>> 
>>> <snip>
>>> 
>>>>>> I know it would make Dell and Lenovo operate differently (I
>>>>>> can add that detail to the documentation) but it just feels
>>>>>> like a nicer design.
>>>>> 
>>>>> That works for me. Perhaps you can also do a (compile tested
>>>>> only) RFC patch for the Dell code to do the same thing
>>>>> (replace the memset 0 with the strscpy) to see if the Dell
>>>>> folks are ok with also doing things this way ?
>>>>> 
>>>> I'm not hugely comfortable with that. If for some reason it
>>>> broke things for Dell customers I wouldn't want to be
>>>> responsible :)
>>> 
>>> Right, that is why I suggested making it a RFC patch and I would
>>> certainly not apply that patch without it being tested by Dell
>>> first.
>>> 
>>> The idea behind the patch is for it to be a way to get a
>>> discussion about this started. In my experience patches tend to
>>> get more of a reaction then hypothetical discussions about
>>> changes :)
>>> 
>>>> I'd rather they made the changes and were able to test it - I
>>>> know that's what I'd prefer if it was the other way around.
>>>> Apologies if I'm being over cautious!
>>> 
>>> If you don't feel comfortable doing this, that is fine, lets wait
>>> what the Dell folks have to say; and if they don't respond I
>>> might do a RFC myself.
>>> 
>> 
>> Ack. We will implement the same from Dell side as well to have
>> uniformity and seems nicer from a user point of view rather than
>> populating the current_password field again in case of password
>> change scenario.
> 
Just as a note, testing this over the weekend, I found that the password
change doesn't become active until after a reboot on our systems.

So, at least on our systems, copying over strings is pointless.
I'll just document the behaviour in the document for our systems, and
see if we can improve it in our firmware going forward.

Thanks
Mark

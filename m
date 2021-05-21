Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EFA9C4707A
	for <platform-driver-x86@archiver.kernel.org>; Fri, 21 May 2021 19:00:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2512961244
	for <platform-driver-x86@archiver.kernel.org>; Fri, 21 May 2021 19:00:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232817AbhEUTCQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 21 May 2021 15:02:16 -0400
Received: from mail1.bemta23.messagelabs.com ([67.219.246.1]:34007 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231354AbhEUTCQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 21 May 2021 15:02:16 -0400
Received: from [100.112.2.115] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-1.bemta.az-b.us-east-1.aws.symcld.net id FD/CC-25091-46308A06; Fri, 21 May 2021 19:00:52 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpgleJIrShJLcpLzFFi42LJePGQVzeFeUW
  CwYF8i0MbDjBZdHfPZbJ4c3w6k8XnjsksFqv3vGC2WPTxCZsDm8ekmTOYPeadDPR4v+8qm8fn
  TXIBLFGsmXlJ+RUJrBlze84wFZzlrmjrzGhgnMbZxcjFISTwn1HiVP8CJgjnMaPExkPP2LoYO
  TmEBYokPt44ywpiiwioS0zt6GEDKWIWmMEoMX/hNxaIjnZmiZYlFxlBqtgEtCW2bPkF1s0rYC
  vx+dtnZhCbRUBV4vCr/0wgtqhAuMTujpdMEDWCEidnPmEBsTkF7CS6mj8A1XMAbdCUWL9LHyT
  MLCAucevJfCYIW15i+9s5YCMlBBQllk/+BmUnSPT8e8Q2gVFwFpKpsxAmzUIyaRaSSQsYWVYx
  miQVZaZnlOQmZuboGhoY6BoaGuka6VroJVbpJumVFuumJhaX6BrqJZYX6xVX5ibnpOjlpZZsY
  gRGTEoBE8cOxjuvP+gdYpTkYFIS5T18ZnmCEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQneOIYVCU
  KCRanpqRVpmTnA6IVJS3DwKInw+vwGauUtLkjMLc5Mh0idYlSUEuf9wwjUJwCSyCjNg2uDJYx
  LjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5y0Cm8GTmlcBNfwW0mAlosXv5MpDFJYkIKakG
  JmP2OS59lja6r6b4S97e3vJ/+o6ZC5tPVsRvZ7/376Tb79kWF979iYmOb9xkZCRuNWXqFTXDj
  XM2HdE8t2sVp8qBeraH0s8+7b6QOKe08ivLnN/hds6WuxkXe2+d73JFRDbvVlTHr5SHN9tzvt
  ZH1s7Z+9NLUiLy0tN3V37PmhP1yfH7N4ZrLjV6LGVdzD8VypznblwlZH/B+/cVXZWCvDMrDpo
  v0jSIC86XmlvH9+PVj2nNfCxuv/uXNjFOXsuYbHokd8Vro0uJk4Qfbn0rJLKk6XXtmxzDI1+n
  Zjme9Vn22mDznvK0Q8o2hlJPTLfasbTuMNHSuC9YvngZ59Q9CrsC5t9lYfQJX6/ybx1LkqwSS
  3FGoqEWc1FxIgACGFr2kwMAAA==
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-6.tower-396.messagelabs.com!1621623651!58016!1
X-Originating-IP: [104.232.225.13]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2990 invoked from network); 21 May 2021 19:00:52 -0000
Received: from unknown (HELO lenovo.com) (104.232.225.13)
  by server-6.tower-396.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 21 May 2021 19:00:52 -0000
Received: from reswpmail01.lenovo.com (unknown [10.62.32.20])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id C761F5BB624FDB511B01;
        Fri, 21 May 2021 15:00:51 -0400 (EDT)
Received: from [10.46.208.131] (10.46.208.131) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2176.2; Fri, 21 May
 2021 15:00:51 -0400
Subject: Re: [External] Re: [PATCH v2 3/3] platform/x86: think-lmi: Add WMI
 interface support on Lenovo platforms
To:     Hans de Goede <hdegoede@redhat.com>
CC:     <mgross@linux.intel.com>, <platform-driver-x86@vger.kernel.org>,
        <divya.bharathi@dell.com>, <prasanth.ksr@dell.com>,
        <Dell.Client.Kernel@dell.com>
References: <markpearson@lenovo.com>
 <20210509015708.112766-1-markpearson@lenovo.com>
 <20210509015708.112766-3-markpearson@lenovo.com>
 <bbd0f3c9-63c3-2fbb-7712-ecb3131a4c0a@redhat.com>
 <ac30f95e-8398-fb11-8c94-b50050a3f88f@lenovo.com>
 <1c21c3d3-7ff1-a7b2-86d0-245050426760@redhat.com>
 <c8b706bb-5397-758e-8ab8-1d75b2920054@lenovo.com>
 <971080ef-a9c2-6de9-c6e1-895e7c5903f2@redhat.com>
From:   Mark Pearson <markpearson@lenovo.com>
Message-ID: <50d9d757-d3c2-a29b-86ab-a27729c0143c@lenovo.com>
Date:   Fri, 21 May 2021 15:00:50 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <971080ef-a9c2-6de9-c6e1-895e7c5903f2@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.46.208.131]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



On 2021-05-21 12:55 p.m., Hans de Goede wrote:
> Hi,
> 
> On 5/21/21 5:55 PM, Mark Pearson wrote:
> 
> <snip>
> 
>>>> I know it would make Dell and Lenovo operate differently (I can add
>>>> that detail to the documentation) but it just feels like a nicer
>>>> design.
>>>
>>> That works for me. Perhaps you can also do a (compile tested only)
>>> RFC patch for the Dell code to do the same thing (replace the memset
>>> 0 with the strscpy) to see if the Dell folks are ok with also doing
>>> things this way ?
>>>
>> I'm not hugely comfortable with that. If for some reason it broke things
>> for Dell customers I wouldn't want to be responsible :)
> 
> Right, that is why I suggested making it a RFC patch and I would
> certainly not apply that patch without it being tested by Dell first.
> 
> The idea behind the patch is for it to be a way to get a discussion
> about this started. In my experience patches tend to get more of
> a reaction then hypothetical discussions about changes :)
> 
>> I'd rather they
>> made the changes and were able to test it - I know that's what I'd
>> prefer if it was the other way around. Apologies if I'm being over cautious!
> 
> If you don't feel comfortable doing this, that is fine, lets wait what
> the Dell folks have to say; and if they don't respond I might do a RFC
> myself.
> 

Ah - I'd misunderstood that point. I have no issues with that :)

I won't update the document and publish a RFC instead as the last patch
in the series

Mark

Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D864C433E0
	for <platform-driver-x86@archiver.kernel.org>; Thu, 18 Mar 2021 12:44:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E68DB64F59
	for <platform-driver-x86@archiver.kernel.org>; Thu, 18 Mar 2021 12:44:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230416AbhCRMnv (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 18 Mar 2021 08:43:51 -0400
Received: from mail1.bemta23.messagelabs.com ([67.219.246.115]:41499 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230398AbhCRMna (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 18 Mar 2021 08:43:30 -0400
Received: from [100.112.4.31] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-4.bemta.az-c.us-east-1.aws.symcld.net id 5A/A0-56876-1FA43506; Thu, 18 Mar 2021 12:43:29 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrDIsWRWlGSWpSXmKPExsWS8eIhr+5Hr+A
  Egy2/eS3eHJ/OZPG5YzKLxeo9L5gdmD3mnQz0eL/vKpvH501yAcxRrJl5SfkVCawZK5acYS24
  yVWx69Z+pgbGuxxdjFwcQgL/GSV+vp/IDuG8YJToO9PF1MXIwSEskCaxcoJ3FyMnh4iAusTUj
  h42EJtZwFliUssEMFtIoJ1RYvUESRCbTUBbYsuWX2BxXgFbicVnF7ODjGERUJU4cF0PJCwqEC
  7Re+U2K0SJoMTJmU9YQGxOATuJ5tZJzCDlzAKaEut36UNsEpe49WQ+E4QtL7H97RxmEFtCQEH
  i3ONf7BB2gkTPv0dsExgFZyGZOgth0iwkk2YhmbSAkWUVo1lSUWZ6RkluYmaOrqGBga6hoZGu
  ia6hpaFeYpVusl5psW5qYnGJLpBbXqxXXJmbnJOil5dasokRGAkpBSz7dzBeef1B7xCjJAeTk
  ijvS+fgBCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvOs9gXKCRanpqRVpmTnAqIRJS3DwKInw8r
  kDpXmLCxJzizPTIVKnGBWlxHn/egAlBEASGaV5cG2wRHCJUVZKmJeRgYFBiKcgtSg3swRV/hW
  jOAejkjDvI5DtPJl5JXDTXwEtZgJaHMEfBLK4JBEhJdXAxHpn8kLWIlv7z6rtXTv8Fq+dYS3Q
  9GSm4O43nSH+ne+3ql0tluudntB4fYLerB0Pn601Kb+sVf3a/Iqxxu1Dhal63mlPdI7JGIl/d
  7VTlzVQlzvIVf18QxVfTd0DX74fi/LyG1Tm28X0TQtaqbP7S8IpxyS53kWrZp5RdWrWv7Ll4v
  NX//kZ8h7PrnT/N3cdAzPrZN7iy8kMMw/+4jltsuvtxt87THaYH93tFLzjv+yO62UmTSlGt7e
  eXPG62vC62595WZNfcV1atdFMjbVhXu8OeQbLjUUJkZtVIn9bL5l1LtOYJ/f7tOKgS4/NntpW
  PIt4/Sm7X6ozcu2pFgH1v79aUnecLFsWc2Tykimi8UosxRmJhlrMRcWJAMbx9Jd/AwAA
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-7.tower-416.messagelabs.com!1616071409!72646!1
X-Originating-IP: [104.232.225.13]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1533 invoked from network); 18 Mar 2021 12:43:29 -0000
Received: from unknown (HELO lenovo.com) (104.232.225.13)
  by server-7.tower-416.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 Mar 2021 12:43:29 -0000
Received: from reswpmail01.lenovo.com (unknown [10.62.32.20])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id 0D07C71758049F68F3F1;
        Thu, 18 Mar 2021 08:43:29 -0400 (EDT)
Received: from localhost.localdomain (10.38.103.43) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2106.2; Thu, 18 Mar
 2021 08:43:28 -0400
Subject: Re: [External] Re: [PATCH] platform/x86: thinkpad_acpi: check dytc
 version for lapmode sysfs
To:     Hans de Goede <hdegoede@redhat.com>
CC:     <mgross@linux.intel.com>, <platform-driver-x86@vger.kernel.org>
References: <markpearson@lenovo.com>
 <20210311174843.3161-1-markpearson@lenovo.com>
 <df908172-ba4e-3e13-a984-47c011db50df@redhat.com>
From:   Mark Pearson <markpearson@lenovo.com>
Message-ID: <45fe105f-aa51-5438-b42d-a72cf92ea124@lenovo.com>
Date:   Thu, 18 Mar 2021 08:43:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <df908172-ba4e-3e13-a984-47c011db50df@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.38.103.43]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


On 18/03/2021 08:17, Hans de Goede wrote:
> Hi,
> 
> On 3/11/21 6:48 PM, Mark Pearson wrote:
>> Lenovo platforms with DYTC versions earlier than version 5 don't set
>> the lapmode interface correctly, causing issues with thermald on
>> older platforms.
>>
>> Add checking to only create the dytc_lapmode interface for version
>> 5 and later.
>>
>> Signed-off-by: Mark Pearson <markpearson@lenovo.com>
> 
> I've added a:
> 
> Fixes: 1ac09656bded ("platform/x86: thinkpad_acpi: Add palm sensor support")
> 
> Tag, this will help with the patch automatically getting selected for
> stable kernel-series which contain the patch pointed to by the Fixes: tag.
> 
> In this case this won't work since this patch seems to depend on code
> introduced in:
> 
> commit c3bfcd4c676238 ("platform/x86: thinkpad_acpi: lap or desk mode interface")
> 
> So you will need to manually backport this and submit it to stable@vger.kernel.org
> if you want it to be included in any of the stable kernel series.
> 
> Still it is always good to have the Fixes: tag present when a commit is actually
> fixing a previous commit.
> 
I wasn't aware of the linux-stable kernel so it was good to learn
about. I'll have a look at doing that process - I don't know how many
people it will really make a difference for, but if it saves a few folk
some headaches it seems worth trying.

Thank you!
Mark

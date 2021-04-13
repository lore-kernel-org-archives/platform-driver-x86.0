Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB341C433ED
	for <platform-driver-x86@archiver.kernel.org>; Tue, 13 Apr 2021 11:30:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 85CC86135C
	for <platform-driver-x86@archiver.kernel.org>; Tue, 13 Apr 2021 11:30:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238245AbhDMLbQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 13 Apr 2021 07:31:16 -0400
Received: from mail1.bemta23.messagelabs.com ([67.219.246.2]:49221 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231287AbhDMLbM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 13 Apr 2021 07:31:12 -0400
Received: from [100.112.2.115] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-2.bemta.az-b.us-east-1.aws.symcld.net id AC/79-00973-CE085706; Tue, 13 Apr 2021 11:30:52 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFIsWRWlGSWpSXmKPExsWSLveKTfdNQ2m
  CwanpPBZvjk9nsvjcMZnFYvWeF8wOzB7zTgZ6vN93lc3j8ya5AOYo1sy8pPyKBNaMG7uWMhZ8
  5qhYuHgbWwPjDPYuRi4OIYH/jBKXz71lgXCeM0o8+NMP5HBwCAskS9xYxNzFyMkhIqAuMbWjh
  w3EZhZwlpjUMgHMFhLoZJT4tDoTxGYT0JbYsuUXWJxXwFbiZWc3M8gYFgFVie2zNUHCogLhEr
  1XbrNClAhKnJz5BGwTp4CdxKM1UiAms4CmxPpd+hCLxCVuPZnPBGHLS2x/OwfsGAkg+/vjRSw
  QdoJEz79HbBMYBWchGToLYdIsJJNmIZm0gJFlFaNpUlFmekZJbmJmjq6hgYGuoaGRrqGuhaVe
  YpVukl5psW5qYnGJrqFeYnmxXnFlbnJOil5easkmRmAUpBQwRu5g3Pf6g94hRkkOJiVR3g1dJ
  QlCfEn5KZUZicUZ8UWlOanFhxhlODiUJHgZ60sThASLUtNTK9Iyc4ARCZOW4OBREuH9WQeU5i
  0uSMwtzkyHSJ1iVJQS510L0icAksgozYNrgyWBS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJW
  EeZmAKUWIJzOvBG76K6DFTECLL24tBFlckoiQkmpgCtzx8NrZ7nNMdnl3NNriEkqVLTbV2LkF
  nJb0K2ybkXLreW5+FtPphtDnOsYJX7Ll9W+o6bF2b+11uvL2h8X1tlVqaesUc31nnvyYMY9lp
  k7EqtKXF7itAsIeGO/47pkSk8WqJWF68vyesuWiU7slmBfr79sySci0Nkl6b3hA7k3HU3mrcq
  L3HFfquJwgUmpwYpOfbm4UY+qvx7b7dsi+1E14tvnuohXyuz57FsX5MLqHtSQI7vzPmj4xzuP
  roztTXi3yZLkztcNr1sLSU5UHOZJKf/dsKPN+e8xKzK/iRtAGlg1pC3cq5bHdODpjm+XNpVor
  Dq3nffylMGfR3IiPa50ms9YzrFx6qnb7suK/SizFGYmGWsxFxYkAFpI5OH0DAAA=
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-15.tower-395.messagelabs.com!1618313449!510019!1
X-Originating-IP: [103.30.234.6]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28569 invoked from network); 13 Apr 2021 11:30:51 -0000
Received: from unknown (HELO lenovo.com) (103.30.234.6)
  by server-15.tower-395.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 13 Apr 2021 11:30:51 -0000
Received: from reswpmail01.lenovo.com (unknown [10.62.32.20])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id 5DF50C23B6980DF9C936;
        Tue, 13 Apr 2021 19:30:48 +0800 (CST)
Received: from localhost.localdomain (10.38.52.10) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2106.2; Tue, 13 Apr
 2021 07:30:45 -0400
Subject: Re: [External] Re: [PATCH] platform/x86: thinkpad_acpi: Correct
 thermal sensor allocation
To:     Hans de Goede <hdegoede@redhat.com>
CC:     <mgross@linux.intel.com>, <platform-driver-x86@vger.kernel.org>
References: <markpearson@lenovo.com>
 <20210407212015.298222-1-markpearson@lenovo.com>
 <1f0e16b9-ab78-881b-1918-7b8cf61bc546@redhat.com>
From:   Mark Pearson <markpearson@lenovo.com>
Message-ID: <92846990-bc3f-fd1c-b854-d03a258e93c1@lenovo.com>
Date:   Tue, 13 Apr 2021 07:30:44 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <1f0e16b9-ab78-881b-1918-7b8cf61bc546@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.38.52.10]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Thanks Hans

On 13/04/2021 02:28, Hans de Goede wrote:
> Hi,
> 
> On 4/7/21 11:20 PM, Mark Pearson wrote:
>> On recent Thinkpad platforms it was reported that temp sensor 11 was
>> always incorrectly displaying 66C. It turns out the reason for this is
>> that this location in EC RAM is not a temperature sensor but is the
>> power supply ID (offset 0xC2).
>>
>> Based on feedback from the Lenovo firmware team the EC RAM version can
>> be determined and for the current version (3) only the 0x78 to 0x7F
>> range is used for temp sensors. I don't have any details for earlier
>> versions so I have left the implementation unaltered there.
>>
>> Note - in this block only 0x78 and 0x79 are officially designated (CPU &
>> GPU sensors). The use of the other locations in the block will vary from
>> platform to platform; but the existing logic to detect a sensor presence
>> holds.
>>
>> Signed-off-by: Mark Pearson <markpearson@lenovo.com>
> 
> I've merged this, note I've added one small fixup to initialize ver to
> 0 when it is declared, also see a remark inline below.
> 

Agreed on setting ver to zero - thanks for adding that

Mark


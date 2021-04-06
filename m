Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57789C433ED
	for <platform-driver-x86@archiver.kernel.org>; Tue,  6 Apr 2021 15:25:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1C894613CC
	for <platform-driver-x86@archiver.kernel.org>; Tue,  6 Apr 2021 15:25:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345618AbhDFPZ0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 6 Apr 2021 11:25:26 -0400
Received: from mail1.bemta23.messagelabs.com ([67.219.246.2]:9216 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232532AbhDFPZ0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 6 Apr 2021 11:25:26 -0400
Received: from [100.112.3.19] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-2.bemta.az-b.us-east-1.aws.symcld.net id 36/2C-00973-D5D7C606; Tue, 06 Apr 2021 15:25:17 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrHIsWRWlGSWpSXmKPExsWS8eIhj25sbU6
  CwfQ7IhZvjk9nsvjcMZnFYvWeF8wOzB7zTgZ6vN93lc3j8ya5AOYo1sy8pPyKBNaM9jk7WQvO
  81W8XP6bpYFxAk8XIxeHkMB/RonX91ewQjjPGCX2/rrL0sXIySEs4CVxpfEVK4gtIqAuMbWjh
  w3EZhZwlpjUMoENoqGTUWL95r+MIAk2AW2JLVt+gRXxCthKLG+5wNzFyMHBIqAicWx3IUhYVC
  BcovfKbVaIEkGJkzOfgO3iFLCT2HxiHhNIObOApsT6XfoQq8Qlbj2ZzwRhy0tsfzuHGcSWALJ
  /73vNCmEnSPT8e8Q2gVFwFpKpsxAmzUIyaRaSSQsYWVYxmiUVZaZnlOQmZuboGhoY6BoaGuka
  6BoZGeklVukm6ZUW66YmFpfoGuollhfrFVfmJuek6OWllmxiBEZDSgHDvR2Mf15/0DvEKMnBp
  CTKOz8xJ0GILyk/pTIjsTgjvqg0J7X4EKMMB4eSBK9UNVBOsCg1PbUiLTMHGJkwaQkOHiURXi
  uQNG9xQWJucWY6ROoUo6KUOO9xkIQASCKjNA+uDZYMLjHKSgnzMjIwMAjxFKQW5WaWoMq/YhT
  nYFQS5lUEmcKTmVcCN/0V0GImoMVSZzNBFpckIqSkGpjaBc5MEmw23Z+X+KZEweVpRPxG67WT
  ir+a1UW3ciT7F5w5+HajqOn03cf+KmhXSKyYevyybLKjriKT3jafVXK9vF0i87e+LHN+83bN0
  eX6FjOZDl6rueY4K8I9x0q2qPR3rkuP4vumR2sunxMx0NE3U1yoF3ImNbW6cfGqgkc3Oq7f8d
  xUFfE3XtWDq9P2wZVtBmejC9mY0zLfZUyYF3s9/wXrH+NT66bvvnho97mlvdcvxJ1gS5ow5b+
  Kt98sza0PYjdzvF3VojBt/sZNKdwvL06ctuXR2vQZ8TJy3Ze97y04cmppjds2Eyb7iw/zHk27
  UsVbt8C/LGqu/tYU3q25slNmKnzM7V4oebSk4LetEktxRqKhFnNRcSIAvvGE6oEDAAA=
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-4.tower-386.messagelabs.com!1617722717!153711!1
X-Originating-IP: [104.232.225.12]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24871 invoked from network); 6 Apr 2021 15:25:17 -0000
Received: from unknown (HELO lenovo.com) (104.232.225.12)
  by server-4.tower-386.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 6 Apr 2021 15:25:17 -0000
Received: from reswpmail01.lenovo.com (unknown [10.62.32.20])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id 2605E4A33489774464F5;
        Tue,  6 Apr 2021 11:25:17 -0400 (EDT)
Received: from localhost.localdomain (10.38.99.27) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2106.2; Tue, 6 Apr 2021
 11:25:16 -0400
Subject: Re: [External] Re: [PATCH] Add support for DYTC MMC_GET BIOS API.
To:     Hans de Goede <hdegoede@redhat.com>
CC:     <mgross@linux.intel.com>, <platform-driver-x86@vger.kernel.org>
References: <markpearson@lenovo.com>
 <20210406022215.199998-1-markpearson@lenovo.com>
 <a9af6b1f-f667-99b5-efc4-11d7ae7afc3b@redhat.com>
From:   Mark Pearson <markpearson@lenovo.com>
Message-ID: <187507f7-a111-90fe-5955-59115198f16d@lenovo.com>
Date:   Tue, 6 Apr 2021 11:25:15 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <a9af6b1f-f667-99b5-efc4-11d7ae7afc3b@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.38.99.27]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


On 06/04/2021 09:50, Hans de Goede wrote:
> Hi,
> 
> On 4/6/21 4:22 AM, Mark Pearson wrote:
>> The BIOS team have added a new API that allows us to retrieve the 
>> current performance profile without having to disable/enable CQL 
>> mode. Adding the changes to use this API.
>> 
>> Tested on P15 and X1C8
>> 
>> Signed-off-by: Mark Pearson <markpearson@lenovo.com> --- 
>> drivers/platform/x86/thinkpad_acpi.c | 24 ++++++++++++++++++++++-- 
>> 1 file changed, 22 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/platform/x86/thinkpad_acpi.c
>> b/drivers/platform/x86/thinkpad_acpi.c index 0d9e2ddbf..4eb1ad443
>> 100644 --- a/drivers/platform/x86/thinkpad_acpi.c +++
>> b/drivers/platform/x86/thinkpad_acpi.c @@ -10050,6 +10050,7 @@
>> static struct ibm_struct proxsensor_driver_data = { */
>> 
<snip>

>> @@ -10271,6 +10280,17 @@ static int tpacpi_dytc_profile_init(struct
>> ibm_init_struct *iibm) if (dytc_version >= 5) { 
>> dbg_printk(TPACPI_DBG_INIT, "DYTC version %d: thermal mode
>> available\n", dytc_version); +		/* +		 * Check if MMC_GET
>> functionality available +		 * Version > 6 and return success from
>> MMC_GET command +		 */ +		dytc_mmc_get_available = false; +		if
>> (dytc_version >= 6) { +			err = dytc_command(DYTC_CMD_MMC_GET,
>> &output); +			if (!err && ((output & DYTC_ERR_MASK) ==
>> DYTC_ERR_SUCCESS)) +				dytc_mmc_get_available = true; +		} +		err
>> = dytc_command(DYTC_CMD_QUERY, &output);
> 
> It seems this last:
> 
> err = dytc_command(DYTC_CMD_QUERY, &output);
> 
> Line snuck in as a copy and paste error? Or is this intentional ?
> 
> If this is intentional, may I ask why this is done / needed ?
> 
Well that's embarrassing - that is left over from some debug I
was running and it shouldn't be there.

I'll submit a new version with that removed.

Apologies - should have caught that one before pushing for review

Mark


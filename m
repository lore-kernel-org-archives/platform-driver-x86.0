Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AB85C47089
	for <platform-driver-x86@archiver.kernel.org>; Thu, 27 May 2021 12:21:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 43F4D613C5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 27 May 2021 12:21:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234410AbhE0MWo (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 27 May 2021 08:22:44 -0400
Received: from mail1.bemta24.messagelabs.com ([67.219.250.115]:18383 "EHLO
        mail1.bemta24.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234091AbhE0MWn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 27 May 2021 08:22:43 -0400
Received: from [100.112.133.58] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-4.bemta.az-b.us-west-2.aws.symcld.net id 92/AD-38455-6BE8FA06; Thu, 27 May 2021 12:21:10 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpmleJIrShJLcpLzFFi42JJl3vFprutb32
  CwZebbBYvJxxmtDi04QCTRXf3XCaLN8enM1ms3vOC2WLRxydsDmwek2bOYPbYOesuu8f7fVfZ
  PD5vkgtgiWLNzEvKr0hgzeie/5ulYCNLxd2vZ9gaGM8xdzFycggJ/GeUWHlMpIuRC8h+zCjxd
  d0EdpCEsECRxJppG8FsEQF1iakdPWwgRcwCsxklzn0+zgzRsZ1RYktbGxtIFZuAtsSWLb/AbF
  4BW4nny1ezgtgsAqoSMxbvZwKxRQXCJXZ3vGSCqBGUODnzCQuIzSlgJ/Hm1lKgoRxAGzQl1u/
  SBwkzC4hL3HoynwnClpfY/nYOWImEgKLEwSkWIGEJgQSJnn+P2CYwCs5CMnQWwqBZSAbNQjJo
  ASPLKkazpKLM9IyS3MTMHF1DAwNdQ0MjXUNjI10LvcQq3SS90mLd8tTiEl0jvcTyYr3iytzkn
  BS9vNSSTYzAuEkpaOHYwXj49Qe9Q4ySHExKorwTdNYnCPEl5adUZiQWZ8QXleakFh9ilOHgUJ
  LgFe8FygkWpaanVqRl5gBjGCYtwcGjJMK7rhsozVtckJhbnJkOkTrFqCglznsQpE8AJJFRmgf
  XBksblxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ83aATOHJzCuBm/4KaDET0GKhxHUgi0sS
  EVJSDUz2zEaHBb82zrJJklac8Sup9Cbb8Xlt8tdj084XvK9i1HN7a1DMcCStzdPlnGKVxdMEa
  zNvgU17GcQvhbHVy1Uk7VoxU/fggdbmrzFVO78UbdBluXBvV37Jj76ab6lt+67v8aj3u53mxc
  GytmVBtlGAwQr+0tj7El9+1Txfq92l9MNbRdLJdK9xxIbMfRr5zAUx4cu6LqbF+PH18ZYb+7z
  P+SX1qV1Wr2KxVM5Wh1suV+JtjM1/L9O/3VzzbdmcRxtLnfzTWi7JZKzWE1l+I6bkZV3pgp5O
  izqWPccezLVz0u4viD//Ya6zvdPc9VtYGytXJ84TbKy8EH4pmks46vSlB1t2Zr4W8T0glOyrx
  FKckWioxVxUnAgAbDr7+JYDAAA=
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-19.tower-355.messagelabs.com!1622118068!316!1
X-Originating-IP: [103.30.234.6]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28325 invoked from network); 27 May 2021 12:21:09 -0000
Received: from unknown (HELO lenovo.com) (103.30.234.6)
  by server-19.tower-355.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 May 2021 12:21:09 -0000
Received: from reswpmail01.lenovo.com (unknown [10.62.32.20])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id C2BA74A4F021406EB41B;
        Thu, 27 May 2021 20:21:06 +0800 (CST)
Received: from [10.46.208.141] (10.46.208.141) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2176.2; Thu, 27 May
 2021 08:21:00 -0400
Subject: Re: [External] Re: [PATCH v4 3/3] platform/x86: think-lmi: Add WMI
 interface support on Lenovo platforms
To:     Hans de Goede <hdegoede@redhat.com>
CC:     <andy.shevchenko@gmail.com>, <prasanth.ksr@dell.com>,
        <divya.bharathi@dell.com>, <Dell.Client.Kernel@dell.com>,
        <platform-driver-x86@vger.kernel.org>
References: <markpearson@lenovo.com>
 <20210526201447.3686-1-markpearson@lenovo.com>
 <20210526201447.3686-3-markpearson@lenovo.com>
 <d7503e00-25e2-35b1-021a-dbfca88ec2c1@redhat.com>
From:   Mark Pearson <markpearson@lenovo.com>
Message-ID: <78753cd1-6a5b-c605-8797-d6d2f90e8095@lenovo.com>
Date:   Thu, 27 May 2021 08:21:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <d7503e00-25e2-35b1-021a-dbfca88ec2c1@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.46.208.141]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



On 2021-05-27 5:19 a.m., Hans de Goede wrote:
> Hi again,
> 
> On 5/26/21 10:14 PM, Mark Pearson wrote:
>> For Lenovo platforms that support a WMI interface to the BIOS add
>> support, using the firmware-attributes class, to allow users to access
>> and modify various BIOS related settings.
>>
>> Signed-off-by: Mark Pearson <markpearson@lenovo.com>
> 
> Mark, checkpatch.pl is complaining about this patch not adding a
> MAINTAINERS entry for the think-lmi driver, can you please do a
> follow-up patch adding a MAINTAINERS entry for this?
> 

Will do.

Mark

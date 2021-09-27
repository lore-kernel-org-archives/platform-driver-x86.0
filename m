Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1D57C433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon, 27 Sep 2021 14:00:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AFCD060F46
	for <platform-driver-x86@archiver.kernel.org>; Mon, 27 Sep 2021 14:00:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234820AbhI0OBt (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 27 Sep 2021 10:01:49 -0400
Received: from mail1.bemta24.messagelabs.com ([67.219.250.4]:38668 "EHLO
        mail1.bemta24.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234743AbhI0OBl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Sep 2021 10:01:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com;
        s=Selector; t=1632751203; i=@lenovo.com;
        bh=wK4QIzqGstpsVEzqXCnmDwKUHHsokBN3HBNNoE4Tvks=;
        h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
         In-Reply-To:Content-Type:Content-Transfer-Encoding;
        b=S6nxOengjKaOl/bicnjG+5ageBDM355ZafGCKhXbVcl3y6MCSocfsPVnq/dLRRsLA
         FL92/jiUBCKUnND4QxYS6CcJ8K+lvexEc7bb6WymnnjO5DVxh5MHyfI3POq3omJwjn
         F/rYv/4BtZ2COaxy7f/ZD2w+CzTLjWyfgY+U0Ae8m3BGVASsBLzXMWwXaEfNhNVqzi
         VzfZVibAVHz23xamcNxcAFP7zLia36pbQMEsUPSNjB05Mt9Lqq4RrWy3Xaeef23Ci5
         KfANn8u4PrE8Y+GPkiNeUyvW1ZYyDxyOTzl+Lyo5hBtBLxU6wsYtu8y5VYD1iLsWl0
         Fej84tfT9F6ww==
Received: from [100.112.129.89] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-4.bemta.az-a.us-west-2.aws.symcld.net id 7D/51-04569-26EC1516; Mon, 27 Sep 2021 14:00:02 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIJsWRWlGSWpSXmKPExsWSoV9rrpt0LjD
  R4PYCBYs3x6czWRy8tIHRovXeLzaLbc2HGS1W73nBbHFl8g1Gi9O7SxzYPabca2Hz2DnrLrvH
  4k372Tw2repk83i/7yqbx+dNcgFsUayZeUn5FQmsGZ8nv2cpuMNV0XzrJ1sD42GOLkYuDkaBp
  cwSV/58ZoNwFrFKnJnVywzhdDJJTJ53jx3EERKYxyTx4c8NKOcQk8SOpmdgjoTAA0aJO50LGS
  EynYwSP16dYoFwJjFJ3JgLMVpI4AmjxL8bc5ngnOl7PwP1cHLwCthKLH4+mwXEZhFQlbg99ws
  rRFxQ4uTMJ2BxUYFwiUMrJgDZHBzCQPbHC74gc0QEzjBKfGm/C1bPLOArsfzSLDBbSCBf4vTM
  tUwgNpuAtsSWLb/YQGxOATuJT+3HGCHqLSQWvznIDmHLS2x/O4cZoldZ4lf/eTBbQkBR4sjCb
  jYIO0Gi598jKFtS4trNC+wQtqzE0bNzWCBsX4k58xcwQdhaEk9b90PNyZH493c6K4StJrHm/H
  qouJzEqd5zTBMYdWcheXkWkvNmITlvASPzKkaLpKLM9IyS3MTMHF1DAwNdQ0MjXUNjA10jQ0u
  9xCrdRL3SYt3y1OISXSO9xPJiveLK3OScFL281JJNjMDUlVLQdHsH47/XH/QOMUpyMCmJ8qoe
  CUwU4kvKT6nMSCzOiC8qzUktPsQow8GhJMH75jRQTrAoNT21Ii0zB5hGYdISHDxKIrxTQdK8x
  QWJucWZ6RCpU4y6HBNezl3ELMSSl5+XKiXOy3AWqEgApCijNA9uBCylX2KUlRLmZWRgYBDiKU
  gtys0sQZV/xSjOwagkzPv6DNAUnsy8ErhNr4COYAI6onZSAMgRJYkIKakGJrnFgbaPzZ743J3
  2wvNWls47iWNS6VxG7Yr/fUJ+/wsrE/L95dPruYalXnnWg7tHdy/dGVIo/7Ln/FJBtwdH5bsX
  pS5QN3mdbpQrcFEkXq50ZRO/asaS70vO/FtyRX/St8gvz7iOGOpO911yQPPxumOF75ySmJvkP
  VjW2KtOlxLLS1jTzHJ4u6fc4ZCT3oyfDT6c2iH2N6e8z8PoQlDxhnmWk+RNXx1Tfnl3vfP0C8
  2VageUovvtwq5N3+V35hb/MiMO4Uc/rVRDjiw57JN0ZNMr5pJXCzg7ZWZ/l+a5vyPx5q+fy12
  cc16G7bqbZNQ9/WaFDW/a87O2XAmhu1lZahUPSLh2MThHiLEvvNcko8RSnJFoqMVcVJwIANOE
  AXlkBAAA
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-4.tower-326.messagelabs.com!1632751201!445475!1
X-Originating-IP: [104.47.125.55]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11540 invoked from network); 27 Sep 2021 14:00:02 -0000
Received: from mail-sg2apc01lp2055.outbound.protection.outlook.com (HELO APC01-SG2-obe.outbound.protection.outlook.com) (104.47.125.55)
  by server-4.tower-326.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Sep 2021 14:00:02 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UbDaXCTA52ooNS8PLpLKGA82GCj/HBmZkFjC2tqvp3e6x7fNo/yvxkNW/v7YBj9lmpD8LXuPL1WVNU6X5WbseIe9VCO6Wt66lE11EgRiTMbf6tPQSu4RJF4M695tCT+A+udcSjwpribEHMzdS5KPcBBReTLwHo09tfJnZ6BE/UpMA7Vk3TyVldJqIKfjLRxbqMWCMDnfid/LrLyTioZf1/ImqHKhb5uK1uJEJ7H9qa8O53vV/vpH7oN7/gAQeIKUM/GrS5/dM/0D7K9mIcEM7c/qsoGDqsUUyGfga4IXsaG0I+H33bbtQyjsIcq9Fg+Fz1Kd5jrrvX09W7qavImB5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wK4QIzqGstpsVEzqXCnmDwKUHHsokBN3HBNNoE4Tvks=;
 b=J4xlHQ551PHrrXv+n3svhG8/FJqyCjHxpTTzDA/4rKqv/6rgHqpLJLvwbcVYgLRdIecm/x2U3bNwy4BNrb9MljyBw+lgMKJ7nUPLXym9K2Hc+sLxPb60q01NpP2xh2APnutTvJocNiG9HCwHFSi8jua1EXYZzSMMfZ8WzYczRt1tNuyPYWnhxVElf0iynPBhVo9wKVWp9I6rVhTWxtnYlGzFc+k/prBP3vevPw6+f3ZzUsvPNMeybi+iiGKZ+YsezuuZc8L6rePFiVZbWRhhH6xtP2X39hMMU/IXYQYcXmgaZ4Io5MXYrPyBnwuLe6S6SYE/x8pDOzzKirIqsLlp8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 104.232.225.7) smtp.rcpttodomain=redhat.com smtp.mailfrom=lenovo.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=lenovo.com;
 dkim=none (message not signed); arc=none
Received: from HK2P15301CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::24)
 by TYAPR03MB3056.apcprd03.prod.outlook.com (2603:1096:404:1d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.8; Mon, 27 Sep
 2021 13:59:59 +0000
Received: from HK2APC01FT037.eop-APC01.prod.protection.outlook.com
 (2603:1096:202:1:cafe::28) by HK2P15301CA0014.outlook.office365.com
 (2603:1096:202:1::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.3 via Frontend
 Transport; Mon, 27 Sep 2021 13:59:59 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 104.232.225.7) smtp.mailfrom=lenovo.com; redhat.com; dkim=none (message not
 signed) header.d=none;redhat.com; dmarc=fail action=none
 header.from=lenovo.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 lenovo.com discourages use of 104.232.225.7 as permitted sender)
Received: from mail.lenovo.com (104.232.225.7) by
 HK2APC01FT037.mail.protection.outlook.com (10.152.248.223) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Mon, 27 Sep 2021 13:59:58 +0000
Received: from reswpmail01.lenovo.com (10.62.32.20) by mail.lenovo.com
 (10.62.123.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2242.12; Mon, 27 Sep
 2021 09:59:57 -0400
Received: from [10.46.192.184] (10.46.192.184) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2242.12; Mon, 27 Sep
 2021 09:59:56 -0400
Message-ID: <2ea2d9b7-4a15-6aea-1aff-4e1cb80a026f@lenovo.com>
Date:   Mon, 27 Sep 2021 09:59:55 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [External] Re: [PATCH 1/3] thinkpad_acpi: add support for
 force_discharge
To:     Hans de Goede <hdegoede@redhat.com>,
        Nicolo' Piazzalunga <nicolopiazzalunga@gmail.com>,
        <platform-driver-x86@vger.kernel.org>,
        "Nitin Joshi1" <njoshi1@lenovo.com>,
        Sebastian Reichel <sre@kernel.org>
CC:     <jwrdegoede@fedoraproject.org>, <smclt30p@gmail.com>,
        <linrunner@gmx.net>
References: <c2504700-06e9-e7d8-80f7-de90b0b6dfb5@gmail.com>
 <06f65bb5-eca4-c1ba-a8c2-b44f8a94c699@redhat.com>
From:   Mark Pearson <markpearson@lenovo.com>
In-Reply-To: <06f65bb5-eca4-c1ba-a8c2-b44f8a94c699@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.46.192.184]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e2bfaa0-ab7c-4921-d6de-08d981bf1819
X-MS-TrafficTypeDiagnostic: TYAPR03MB3056:
X-Microsoft-Antispam-PRVS: <TYAPR03MB3056AEFF0DC493616876EE9CC5A79@TYAPR03MB3056.apcprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LcAyjQiDr9Ih/cBCcdYrfNtS8npg/xMPCs7MUbwu8qCLQGWc6ZPDL7dNV+kfHWmMeZ6XMNd7AbUyENYo4aUFs9FQITSXhZeZkfE9/slKFs4zaXSDkXQXswGuF9V7cRM+z+1dj/KYCXKs9dIu7lgSWHqiAxlggMRdWwPHlarnkFYj8OrgUAeg6A0MdTRCgoXkP8Jkr2xjFB6uPtr9ONQOzztGrP7iiLu03MeWgB5pxo/kDlE52EdgwB5B29x6Tb5xEclz2bSKrkTFSGP6zZ+YJCOO58q8li0Q2fkM0Ixkm0VAD2VNy9jE3NAsbQq5tbKwRDviY85Fm20tmA6g+9YPqIotyg4Ik8MSRzJ5IrOdZ7acLvEFOX5kej7voRdeLvNUawad2YU/K6h21ewqoxASNgU6qIElwmaNDgzVXnHGvmVWZx35lKIQTzcjBe74wpIMgYVN4kB9OcY7PHXM0cYpFyFeKDz5DNL/mOimikKkXXQXKynL8wD4H85sJ7cu9FoZMRT60/8zhAylXJNHhxDExrd18r3lir1sCsIziOLgtnGxZNOMPAm4ZBLxaDwFm3saVyHw5ZjBNQbcYpk3AqPTumcrJRQ4xy202HBpKFmlyuP8/1LWtMKg6uHItgYwcjbyAFlymHsHmVGsn/0UVeiVZxSxcJhFJ/ry5dbyjQqBFfRcEaqAT17H7ZpJwOGpCwT9lMYy9ojgTNzO5kdbEh9pS3etL+c34KRpj/xwlLIhsIxi3T6Uc5lCU8oOVwxy2JADNN1/+7EiOc7fTQJvHQwgNUY4PcDmRn8mwBydi8q8XHs=
X-Forefront-Antispam-Report: CIP:104.232.225.7;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.lenovo.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(5660300002)(2906002)(26005)(186003)(16526019)(36756003)(2616005)(70206006)(70586007)(4326008)(86362001)(336012)(426003)(8936002)(508600001)(356005)(8676002)(53546011)(47076005)(83380400001)(31696002)(16576012)(316002)(36906005)(82310400003)(54906003)(81166007)(110136005)(31686004)(36860700001)(3940600001)(43740500002)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 13:59:58.7961
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e2bfaa0-ab7c-4921-d6de-08d981bf1819
X-MS-Exchange-CrossTenant-Id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5c7d0b28-bdf8-410c-aa93-4df372b16203;Ip=[104.232.225.7];Helo=[mail.lenovo.com]
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT037.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR03MB3056
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Hans

On 2021-04-07 06:24, Hans de Goede wrote:
> Hi Nicola,
> 
> Thank you for your patch series.
> 
> I'm not sure what to do with these. I have a couple of concerns here:
> 
> 1. These features are useful, but not super useful and as such I wonder
> how often they are used and this how well tested the firmware is wrt these.
> I have added Mark and Nitin from Lenovo to the Cc. Mark, Nitin, can you
> comment on if it is ok from a firmware pov to try and use the following
> battery related ACPI methods on all thinkpads? :
> 
> #define GET_DISCHARGE	"BDSG"
> #define SET_DISCHARGE	"BDSS"
> #define GET_INHIBIT	"PSSG"
> #define SET_INHIBIT	"BICS"
> 
I followed up with the firmware team on this - and  was told these are 
intended to be internal only methods. They are not something the FW team 
expected to support or to be used by customers. From a Lenovo point of 
view these are not recommended and not supported APIs. Not sure where 
you got the API details from but they probably shouldn't have been 
disclosed :)

Obviously not our call if they get included or not, however they should 
come with a big flag that says "Don't use these unless you know what you 
are doing". Our recommendation is not to include them.

Do let me know if there are some important use cases for these so I can 
go back to the FW team and discuss supporting them properly.

Mark


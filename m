Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4522EC433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed,  2 Mar 2022 15:33:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240919AbiCBPdn (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 2 Mar 2022 10:33:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238768AbiCBPdm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 2 Mar 2022 10:33:42 -0500
Received: from mail1.bemta33.messagelabs.com (mail1.bemta33.messagelabs.com [67.219.247.4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31C7B4474E
        for <platform-driver-x86@vger.kernel.org>; Wed,  2 Mar 2022 07:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com;
        s=Selector; t=1646235177; i=@lenovo.com;
        bh=M6Pw3YQ0qF786oBJ+/hlNjpzVZfRrJ7lICJ4T1exXgQ=;
        h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
         In-Reply-To:Content-Type:Content-Transfer-Encoding;
        b=vUxN2E2JJ6Tqr7cJFIHEMrjNR8sPfcQazC3q51Uo4RpF4o7VIbnHDRKzsmckCVuyZ
         Qlg2+6QIhj+aBVYxiCXc9fZjzzwHqdXYNA81SF7FUrubYwKMWPv1sL2ZZTEHKQbXl6
         FP7r2udA8oZmPlplLxEt1803dq9dMTLJPpa2KzwpP1dqJaVZmHXzY47avRfxMApAt3
         qzuy5zunltG01Uk8qGLPDlJqWXILH9aUTY+j2dXHd1gghpOz9PVJ7ZTIwjEhDE9irb
         abc3wMoFQNihsJT6UFoApU0Nk0y15X8znephrmw5n6BmR33ClsfLuiFyRcAHjHuCJS
         zCrgueFlx0fkg==
Received: from [100.114.70.208] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-4.bemta.az-a.us-east-2.aws.ess.symcld.net id 69/FD-02539-82E8F126; Wed, 02 Mar 2022 15:32:56 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEJsWRWlGSWpSXmKPExsWSoV9jqavRJ59
  k0HpX1eLN8elMFgemTmO2WL3nBbMDs8emVZ1sHu/3XWXz+LxJLoA5ijUzLym/IoE1Y+OX3ewF
  s3gq/k05wtLA+JOzi5GLg1FgKbPE9gPv2CCcRawSx3cvYIVwOpkkJs+7xw7iCAlMZ5K43dbNC
  uHsZZKYsn0HmCMhcJxRovvQOiaITCejxI9Xp1ggnAlMEnN6rwI5nEDOY0aJ5ctiIRIPGSWWvZ
  jMCpLgFbCV2H58ARuIzSKgIrH88zI2iLigxMmZT8CaRQXCJe4/+wwWFxYIk3hxspMZxGYWEJe
  49WQ+E4gtIqAuMbWjB6iGAyjuKNFwkA9iVzujxIvNe8HmsAloS2zZ8gtsDqeAncTlmc2sEHM0
  JVq3/2aHsOUltr+dwwxxtLLEr/7zYLaEgILE0l+XoOwEieYpRxkhbEmJazcvsEPYshJHz85hA
  blBQsBXYktjPURYV2Jz81cWCDtH4tfhm1C2nMSp3nNMExh1ZyH5eBaSz2YhuW4WkusWMLKsYr
  ROKspMzyjJTczM0TU0MNA1NDTRNbPUNTI21Uus0k3UKy3WTU0sLtE10kssL9ZLLS7WK67MTc5
  J0ctLLdnECExIKUWur3cwPlr5U+8QoyQHk5Ior1m3fJIQX1J+SmVGYnFGfFFpTmrxIUYZDg4l
  Cd60HqCcYFFqempFWmYOMDnCpCU4eJREeD16gdK8xQWJucWZ6RCpU4zGHFe27d3LzLG24cBeZ
  iGWvPy8VClxXg6QUgGQ0ozSPLhBsKR9iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iw7xuQe3
  gy80rg9r0COoUJ6JStHnIgp5QkIqSkGphuJdnobrIxTlKJiDp3PKmW01h6il287qonQkf5t1c
  8jpv+Lvfe6mXtC447hSz41tiy7Nyez43S5ybfjvEPS1yeMjV+3zR5hqowzxdnk0/prGiOun/N
  iKVTTtucS2F9iFXIKcvb7NtfVLIWcMl2mi4+znjjhbzAofPvJswyKTV8vHBeoszOk7Uec/RkD
  09oVHGa4ysW3i5ixKOy01UxWOvKqZ4gsYuvfhrmcPWe/Ttb69FEt2/tVdv9TSRfnT3zrjspsn
  rjufs5bzYxqIpNm58l2r2wgT2UQbb8yReHpBvNbq1zNnoIv+lPebHZ2HJqGNeL5CK90yF9IvJ
  5tlu7fm2zUjutLGqlVXB6n/+GbiWW4oxEQy3mouJEANNONctVBAAA
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-17.tower-635.messagelabs.com!1646235174!16166!1
X-Originating-IP: [104.47.124.57]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2827 invoked from network); 2 Mar 2022 15:32:56 -0000
Received: from mail-hk2apc01lp2057.outbound.protection.outlook.com (HELO APC01-HK2-obe.outbound.protection.outlook.com) (104.47.124.57)
  by server-17.tower-635.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 2 Mar 2022 15:32:56 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iOzd0VV9QjxAsSR9nK77kjo72EHHxv1TezMX/tjVM4RlD7qMSbFsy4G5m08Fpit/cflN+rTFay06mb4q/rcPZqkiiFCIeOoEbe0aI5MF5SaVsUXQXKfRw5EVmeYih2Kho3bc80nc2RknYaay2ktETRYYjR9HcVU7GYwPOmja2C+qdWNDRxwUvIp210LAbSDfq8GTJChvv/CpQrEQaM2crlYiJA/0RmBrotgBoUqSsGZWTYB2Lwi4M/G7jcpHI6yTrIJSMmDLPKzx8SNet97L62L8dT78Ot479hpaNUQc2qZVVnaZKdL41ojSjiYmdJ493S6ODQgzwuKr0W3ZZ+EK9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M6Pw3YQ0qF786oBJ+/hlNjpzVZfRrJ7lICJ4T1exXgQ=;
 b=AqhYOP+rOWQldECZsWzjAX5PhSjPxx/XXHSG3Vg55lRHTYBBWuD+oVYVKFNiOg/Qn7Z7p9l5hKWK8RiPvEtvukllDbDBeh0SkmIkDxdUSyjI3JhHUzKG3xhE9pjiFIW6/qlUBWAbiefAHXQjrq0fijt7b5LEZtFPnFQYY8emAJ+C1As48OriWHQzTvGf8F2YOdhDXac2eh3ej6eYfba7rBjutKfab+GJ63tEPEITVQ+zRGVB8jLYUYUzXYhx4SXURFCsz16L4k/pg4tiuUoWfX17YSZWm1V4nErcR2F4H0Albs91D282QVB4EOUevHuoJCCkoxAqdnwhORF5LD/f0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 104.232.225.7) smtp.rcpttodomain=redhat.com smtp.mailfrom=lenovo.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=lenovo.com;
 dkim=none (message not signed); arc=none
Received: from SG2PR06CA0190.apcprd06.prod.outlook.com (2603:1096:4:1::22) by
 SG2PR03MB5151.apcprd03.prod.outlook.com (2603:1096:4:d7::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5038.9; Wed, 2 Mar 2022 15:32:53 +0000
Received: from SG2APC01FT0032.eop-APC01.prod.protection.outlook.com
 (2603:1096:4:1:cafe::9c) by SG2PR06CA0190.outlook.office365.com
 (2603:1096:4:1::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14 via Frontend
 Transport; Wed, 2 Mar 2022 15:32:53 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 104.232.225.7) smtp.mailfrom=lenovo.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=lenovo.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 lenovo.com discourages use of 104.232.225.7 as permitted sender)
Received: from mail.lenovo.com (104.232.225.7) by
 SG2APC01FT0032.mail.protection.outlook.com (10.13.36.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5038.14 via Frontend Transport; Wed, 2 Mar 2022 15:32:53 +0000
Received: from reswpmail01.lenovo.com (10.62.32.20) by mail.lenovo.com
 (10.62.123.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.21; Wed, 2 Mar
 2022 10:32:50 -0500
Received: from [10.38.59.144] (10.38.59.144) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.21; Wed, 2 Mar
 2022 10:32:49 -0500
Message-ID: <178b0fc2-2e65-01b7-0454-48a1a42b96ad@lenovo.com>
Date:   Wed, 2 Mar 2022 10:32:48 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [External] Re: [PATCH] platform/x86: thinkpad_acpi: Add PSC mode
 support
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>
CC:     <markgross@kernel.org>, <platform-driver-x86@vger.kernel.org>
References: <markpearson@lenovo.com>
 <20220225182505.7234-1-markpearson@lenovo.com>
 <81dfe7a3-5882-1f9f-7271-a952846d44cc@redhat.com>
From:   Mark Pearson <markpearson@lenovo.com>
In-Reply-To: <81dfe7a3-5882-1f9f-7271-a952846d44cc@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.38.59.144]
X-ClientProxiedBy: reswpmail01.lenovo.com (10.62.32.20) To
 reswpmail01.lenovo.com (10.62.32.20)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 897eb63d-16b1-49f1-eb7d-08d9fc61eb20
X-MS-TrafficTypeDiagnostic: SG2PR03MB5151:EE_
X-Microsoft-Antispam-PRVS: <SG2PR03MB5151AAF4374477DE1ACF12B8C5039@SG2PR03MB5151.apcprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1G6lw6dtm/jZLstAKUe5otcWR2cweJNxotF9AzwMbWcJjnOET2oxMG1nm3dK870+/xn6XS6oKoI9o2K5M0i7iIbEi2gyRzjZx/XWM07ZZdhG7qDDZ8Sa7fb2KOy9lt8JgNcS/Ahy58bZLoxCA+tPcMbmZYUDUjgYWZ2prpkXFL3nXkEI2ZvhlmOEWScgmMTdE/GL1F5amMHUuQ8Anx0vMeSA/KW2QdXkAqsGz0VAQpegLw1ZTfsZNJZNle2pyyXWQaW0tTVD48pugZXLUW7aZvshkSmBNP+mA2pwAsro+XJnKutu8U1hZhLRr56xPdtUILOxaElE35Sz5H3HgpvMENoR0OibbgvTSkHGSXWhoXuO/cjJLls21MCbBIozhTG9SonlPecBHSJm4UnaNVTvglbAjXb0dlUdGYspPR0LbLuIKY+UzXGeYSfrN+Ri6J0045w9xQABeYmdERvWr79/NQGIgQnIvz3DAtEJP3lYgh5GdIefhLWPnRctLh9UefL+rH/I5MWDq9g8KzB5zkclHiWve5uyPOQy3+cNv1se+3p7OUdgaadjF4ooYF2ZL7IVSz9UBtIdZ2oSDRU/dJjXdx+dm6pWHNKC0OhNvW/kAtRiXpn0MaioXwpD8inwdKTPrkZKEj4zLFA9ikWP1jrxA+RoSroEaNA8EAUuYdLPgM5xZvynQ3Qw8d+svjz0TxQLOBA1/9r3NtIQqhyC8gFYeCwKl624L0/QMIaQg2ppWVAoXYPWXk2wy6WWO7IMQwCjtMzA3f2fBWxBn2toaWMteP7BRDOsaXLngdprMqyoXyF828wOuZesmwuK3+7NxkoiAdFV5a15vkztXKfylSNROyqEwaigWmzTafDfSdqChsFHyjR+kIcSKhGYuY3VDRQNUuTiBFLbxRNqDgB+FhkZew==
X-Forefront-Antispam-Report: CIP:104.232.225.7;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.lenovo.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(70586007)(36756003)(4326008)(966005)(8676002)(40460700003)(508600001)(5660300002)(356005)(36860700001)(53546011)(81166007)(31686004)(8936002)(336012)(186003)(26005)(83380400001)(82960400001)(47076005)(16526019)(2616005)(31696002)(54906003)(86362001)(36906005)(16576012)(82310400004)(316002)(6916009)(426003)(2906002)(70206006)(3940600001)(43740500002)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2022 15:32:53.1310
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 897eb63d-16b1-49f1-eb7d-08d9fc61eb20
X-MS-Exchange-CrossTenant-Id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5c7d0b28-bdf8-410c-aa93-4df372b16203;Ip=[104.232.225.7];Helo=[mail.lenovo.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT0032.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB5151
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Thanks Hans

On 2022-03-02 09:47, Hans de Goede wrote:
> Hi,
> 
> On 2/25/22 19:25, Mark Pearson wrote:
>> The Lenovo AMD platforms use PSC mode for providing platform
>> profile support.
>>
>> Detect if PSC mode is available and add support for setting the
>> different profile modes appropriately.
>>
>> Note - if both MMC mode and PSC mode are available then MMC mode
>> will be used in preference.
>>
>> Tested on T14 G1 AMD and T14s G2 AMD.
>>
>> Signed-off-by: Mark Pearson <markpearson@lenovo.com>
> 
> Thank you for your patch, I've applied this patch to my review-hans 
> branch:
> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans>> 
> Note it will show up in my review-hans branch once I've pushed my
> local branch there, which might take a while.
> 
> Once I've run some tests on this branch the patches there will be
> added to the platform-drivers-x86/for-next branch and eventually
> will be included in the pdx86 pull-request to Linus for the next
> merge-window.
> 
> Regards,
> 
> Hans
> 
Awesome - thank you!
> 
> 
> p.s.
> 
> One small thing which I noticed which could be improved is to
> move the 2 convert_profile_to_dytc() calls in dytc_profile_set()
> to a single call at the top of the function (before taking the
> lock even) to avoid code duplication between the DYTC_FUNCMODE_MMC
> vs DYTC_FUNCMODE_PSC paths.
> 
> I didn't want to block merging the patch on this, if you can
> do a follow up patch with that as cleanup that would be great.
> 
ack - that makes sense. Will do.

Mark


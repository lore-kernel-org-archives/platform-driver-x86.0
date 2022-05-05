Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E056C433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu,  5 May 2022 01:57:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236544AbiEECA4 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 4 May 2022 22:00:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236467AbiEECA4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 4 May 2022 22:00:56 -0400
Received: from mail1.bemta31.messagelabs.com (mail1.bemta31.messagelabs.com [67.219.246.112])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59ABA3878F
        for <platform-driver-x86@vger.kernel.org>; Wed,  4 May 2022 18:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com;
        s=Selector; t=1651715837; i=@lenovo.com;
        bh=zn0OxqlNHwPG41D/e32XherED4wrl/Ssz9NtlsTtc+0=;
        h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
         In-Reply-To:Content-Type:Content-Transfer-Encoding;
        b=xJHo6L6kAJSc1x9/s9vCp8IOZDC/+u6Ytdwn7VcXaP1hEz8XWFFJX3gkQnCAKZdm/
         yYJ2dIMSS3uOjg2XcFF6fj2o/L9I6NCycEdHiToJj1puwRjLL0vW9oXUpo1VSD96tF
         blnHrDRadZMhvlDUm9DFu6NSTv9JfvGUyULGurixcRGtOLb5B/lniw+DjxBd9tjtBj
         9DxK18EpawcPeDyTWoo2rqnc212iLNb32Pxs7LPo7TkP6zaxVQO4IJ0LmAFhbBDG17
         aHzeF2/phL7o9w8oYEPbJKzIC7F4SwNCzQbjuyniGz33jm1hVXPr+Hdawo2plPPF2m
         MKTP+pFduV/Eg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKJsWRWlGSWpSXmKPExsWSoS9loPtHrzj
  J4OgZY4s3x6czWUzd3c9qcWDqNGaL1XteMFscejudzYHVY9OqTjaP9/uusnnMXnKDxePzJrkA
  lijWzLyk/IoE1ozPjQ/ZC5bKVTw48Zu5gfGcRBcjFwejwFJmiWOHDzBDOItYJZ5/+8YI4bQzS
  Vy/fIOti5GTQ0hgHpPEg7W2IAkhgUNMEstuvGACSUgIHGeU6F7lDpHoZJTYvfUHG4QzkUli3s
  81LBDOY0aJHf8esUI4dxklpm2Yww7SzytgK9H0ewcriM0ioCLR+/YgE0RcUOLkzCcsILaoQLh
  E9/79YDXCAhESJw8eB4szC4hL3HoyH6xeRMBcYsKVqYwQ8VyJF7397BDL2hgl7s9tBUuwCWhL
  bNnyC+wjTgEbiY3bpkEN0pRo3f6bHcKWl2jeOpsZ4mtliV/954FsDqBH5SRuHpeH+DlBonnKU
  UYIW1Li2s0L7BC2rMTRs3NYIGxfiV8NjWwQtq7ElO9foOI5EvPmrYbqlZM41XuOaQKj7iwkL8
  9C8tosJNfNQnLdAkaWVYyWSUWZ6RkluYmZObqGBga6hoYmuia6puZ6iVW6iXqlxbqpicUluoZ
  6ieXFeqnFxXrFlbnJOSl6eaklmxiBqSqliMVyB+Ohnp96hxglOZiURHmPCRYnCfEl5adUZiQW
  Z8QXleakFh9ilOHgUJLg3a4DlBMsSk1PrUjLzAGmTZi0BAePkgjvQ5A0b3FBYm5xZjpE6hSjJ
  ceVbXv3MnM8OHESSF5bv2AfsxBLXn5eqpQ47xZdoAYBkIaM0jy4cbDUfolRVkqYl5GBgUGIpy
  C1KDezBFX+FaM4B6OSMO9bdaApPJl5JXBbXwEdxAR00LH4QpCDShIRUlINTHFiH7QKqysXSMs
  /lG9f5LJi4un9Bg5VW3b3ieyfI3k36eQv7cN7b3ZxfFsyd/aP1/ubBepv8x6N8Jf4WLfh92Kl
  +PDJ79df1RGW2n1W+3prwqbpf+yZZPuWcgveW6JurrfszYWgma0CtbMK98/ydHZ1yUqo5wmY8
  CJqNovzvIlFrU3Nc/MWJB4UfrKjSbBKfLLgopu79CX+eOup5RwQCDZvdesX9jD355I+u+ZL9n
  FL+aszj/LzXz3i+HhRzuGEDfEs9y+sdvQr2/DWYsKiRc8MJi1NzVM1vnN2mp2m4Dm5mVpPLX2
  tAk2VpQRnxWe91WltWXZ+rUZ3mIzx96ZbalvmJF2ZpXdWduUU5zMG7EosxRmJhlrMRcWJAJps
  g5poBAAA
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-7.tower-686.messagelabs.com!1651715835!49952!1
X-Originating-IP: [104.47.26.48]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26335 invoked from network); 5 May 2022 01:57:16 -0000
Received: from mail-psaapc01lp2048.outbound.protection.outlook.com (HELO APC01-PSA-obe.outbound.protection.outlook.com) (104.47.26.48)
  by server-7.tower-686.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 5 May 2022 01:57:16 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MADdvA53LoC1MjbizW1XDtDobJJsYiiYZZg7Zn3XOfAt3x4W+GzfD6OxjQTLE15Gzy7W2I5e5fTKlxY5/voKK4FfAn5mchfcEpcznPApqHexcICCFC15ROildiQjJB5Mtv9LGkeNrA4K6YmeqmKUn1KEdKnBXli2ExkCJaNr9nyylFC9cCj0XfpMBw34Gh/QIl/zuYsQOjoy0ZlPgYryuNsG2O1by4m+3GagBsnLlTMx89/ZUHK15JvBb+njN+Vbpitg57FbiQv0SuxbT3lQ+LZHz6vhWkmNM3h48WlslgKigRBGMTVXoL+ag3BpNZ4NdhSaA5cpuEYLR2RFu0x0QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zn0OxqlNHwPG41D/e32XherED4wrl/Ssz9NtlsTtc+0=;
 b=W9nsT7KB3n/vGxewCr0F2xvEg/N36v/oA+SD22MzPPZ//8QQe/C+WrvgJC9HwKAyDKDMG/5A+EOdQanzKq+VFgHiraHf4uC2x8AaISNbdqmiL4MPP97Hn8+cOp4ziQ4mZZBhLYXwrIVGnlz+evfRLY9RNm+mC66qY1kjJ9pSA5txQ+TFXgE6gFW24DNIO+/dxVD3GhP5PKJaWedsCE9HujjRr9j6LTmV7zPvcZ8n/Cw5lBu5h9AmP/t704hEsgld9Lzg6+KywnBkIZ1hTFXd5vC7I/3cl1qPKxMKrFcyQjYzJT1dcfy4GZlQfyD+/Abh/crOaBnH8htoU2ba4umBAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 104.232.225.6) smtp.rcpttodomain=t-8ch.de smtp.mailfrom=lenovo.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=lenovo.com;
 dkim=none (message not signed); arc=none
Received: from TY2PR02CA0019.apcprd02.prod.outlook.com (2603:1096:404:56::31)
 by HK0PR03MB4724.apcprd03.prod.outlook.com (2603:1096:203:ad::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.16; Thu, 5 May
 2022 01:57:13 +0000
Received: from TYZAPC01FT023.eop-APC01.prod.protection.outlook.com
 (2603:1096:404:56:cafe::f8) by TY2PR02CA0019.outlook.office365.com
 (2603:1096:404:56::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.27 via Frontend
 Transport; Thu, 5 May 2022 01:57:13 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 104.232.225.6) smtp.mailfrom=lenovo.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=lenovo.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 lenovo.com discourages use of 104.232.225.6 as permitted sender)
Received: from mail.lenovo.com (104.232.225.6) by
 TYZAPC01FT023.mail.protection.outlook.com (10.118.152.156) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.15 via Frontend Transport; Thu, 5 May 2022 01:57:12 +0000
Received: from reswpmail01.lenovo.com (10.62.32.20) by mail.lenovo.com
 (10.62.123.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.27; Wed, 4 May
 2022 21:57:12 -0400
Received: from [10.38.60.9] (10.38.60.9) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.27; Wed, 4 May
 2022 21:58:18 -0400
Message-ID: <191b8c12-c04a-197c-d9e6-f510c738ba41@lenovo.com>
Date:   Wed, 4 May 2022 21:57:09 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [External] Re: [PATCH] platform/x86: thinkpad_acpi: Correct dual
 fan probe
Content-Language: en-US
To:     =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <thomas@t-8ch.de>
CC:     <hdegoede@redhat.com>, <markgross@kernel.org>,
        <platform-driver-x86@vger.kernel.org>, <lyude@redhat.com>
References: <markpearson@lenovo.com>
 <20220502191200.63470-1-markpearson@lenovo.com>
 <bcc78237-fa4c-4d9f-86a6-4d1a8ea0e0fe@t-8ch.de>
From:   Mark Pearson <markpearson@lenovo.com>
In-Reply-To: <bcc78237-fa4c-4d9f-86a6-4d1a8ea0e0fe@t-8ch.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.38.60.9]
X-ClientProxiedBy: reswpmail01.lenovo.com (10.62.32.20) To
 reswpmail01.lenovo.com (10.62.32.20)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ba6c190-9d8e-4cc1-45f7-08da2e3a929a
X-MS-TrafficTypeDiagnostic: HK0PR03MB4724:EE_
X-Microsoft-Antispam-PRVS: <HK0PR03MB47249C0FA669807E906BE242C5C29@HK0PR03MB4724.apcprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bz2l2Nj49vlfgMCTUs5H7HAp/Xoc4q3xEMEKkpt3DV+irJ4Dsns5Mou6rtbWgWUdc0ZqyZQ8+TqdzMhtgPAKpcaRA1IC36KTnKTgE58hREVJi71XoP8ZIhktsb5NYpMdxXOjhHjBR4kzDG0nAQPk6wBIgR3TVCdoFeg5vi/zwrJ9L6Me7kwf47W+w3oA9+f2P86zWpkHR7C63IIfRjZLKz/+mQWiJuAA4Hh/vGmjvw+xd/wSkSCp75ctTzz079npQ/PeOMK2+yqLCz6eKWJETIjchyRGa8c3wt4qp2ODyQfv0dWoQ+VnOYQQ0wkPoL2OvebYwN4eZ0EVVVZBnGZHE7bpC26/KQpXPxPyISpN/9w60vvrdgfu/kuyKl3DVasQ4n9un1LOii8dhcx+H+F4WOc9nTJkffpeZR5jEetGD1pkabdendQPS25CA2fJWzYfnR4rqX8FfpMUB1nZ1/rcMuubiAIs5eFm5AeapP9MW44R1ZAs/1BLRF/h/Uec6OpLVZ9ElMetZe19U6GNHpnCNz0drFlipPRG6d1AlnyXt8uxjmEiaL5XHUQhWGt2A4eSb1izuR+AjcFj65dP4cWMKFHTCjpWCdZykYhqCNCJ+Y0TiEJEYIk4thrnFXfyIXHfJP6Dkhlqswjig0coBp4yOpakV1H4oHKSfmHXzmE5EpjLNNgAa4tOICJvwtCrmvDr1ZDXmZI+O1GZYQMdQFui8/3v9Mj82yujFvLjjqZ1GE0NK0Xa1lG9Sf1F8rivv0xLALylTNgPSOXstbNHVRoRYj3kZQ4ZrQnsNOaATK7v6k0qahiVH+VZYcW/qyQasQ7UCv3mewoRVlYbr/kZkUApt6GputLsGRHOQ23ODp2SIO8=
X-Forefront-Antispam-Report: CIP:104.232.225.6;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.lenovo.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(86362001)(36756003)(53546011)(8936002)(5660300002)(966005)(2906002)(6666004)(82310400005)(508600001)(83380400001)(36860700001)(2616005)(356005)(81166007)(31696002)(82960400001)(26005)(47076005)(66574015)(426003)(336012)(16526019)(186003)(40460700003)(16576012)(316002)(36906005)(6916009)(70586007)(70206006)(54906003)(4326008)(8676002)(31686004)(3940600001)(43740500002)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 01:57:12.5005
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ba6c190-9d8e-4cc1-45f7-08da2e3a929a
X-MS-Exchange-CrossTenant-Id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5c7d0b28-bdf8-410c-aa93-4df372b16203;Ip=[104.232.225.6];Helo=[mail.lenovo.com]
X-MS-Exchange-CrossTenant-AuthSource: TYZAPC01FT023.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR03MB4724
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 5/4/22 02:11, Thomas Weißschuh wrote:
> Thanks!
> 
> On 2022-05-02 15:12-0400, Mark Pearson wrote:
>> Date: Mon, 2 May 2022 15:12:00 -0400
>> From: Mark Pearson <markpearson@lenovo.com>
>> To: markpearson@lenovo.com
>> CC: hdegoede@redhat.com, markgross@kernel.org,
>>  platform-driver-x86@vger.kernel.org, lyude@redhat.com, thomas@t-8ch.de
>> Subject: [PATCH] platform/x86: thinkpad_acpi: Correct dual fan probe
>> X-Mailer: git-send-email 2.35.1
>>
>> There was an issue with the dual fan probe whereby the probe was
>> failing as it assuming that second_fan support was not available.
>>
>> Corrected the logic so the probe works correctly. Cleaned up so
>> quirks only used if 2nd fan not detected.
>>
>> Tested on X1 Carbon 10 (2 fans), X1 Carbon 9 (2 fans) and T490 (1 fan)
>>
>> Signed-off-by: Mark Pearson <markpearson@lenovo.com>
>> ---
>>  drivers/platform/x86/thinkpad_acpi.c | 23 +++++++++++++----------
>>  1 file changed, 13 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
>> index f385450af864..5eea6651a312 100644
>> --- a/drivers/platform/x86/thinkpad_acpi.c
>> +++ b/drivers/platform/x86/thinkpad_acpi.c
>> @@ -8862,24 +8862,27 @@ static int __init fan_init(struct ibm_init_struct *iibm)
>>  			fan_status_access_mode = TPACPI_FAN_RD_TPEC;
>>  			if (quirks & TPACPI_FAN_Q1)
>>  				fan_quirk1_setup();
>> -			if (quirks & TPACPI_FAN_2FAN) {
>> -				tp_features.second_fan = 1;
>> -				pr_info("secondary fan support enabled\n");
>> -			}
>> -			if (quirks & TPACPI_FAN_2CTL) {
>> -				tp_features.second_fan = 1;
>> -				tp_features.second_fan_ctl = 1;
>> -				pr_info("secondary fan control enabled\n");
>> -			}
>>  			/* Try and probe the 2nd fan */
>> +			tp_features.second_fan = 1; /* needed for get_speed to work */
>>  			res = fan2_get_speed(&speed);
>>  			if (res >= 0) {
>>  				/* It responded - so let's assume it's there */
>>  				tp_features.second_fan = 1;
>>  				tp_features.second_fan_ctl = 1;
>>  				pr_info("secondary fan control detected & enabled\n");
>> +			} else {
>> +				/* Fan not auto-detected */
>> +				tp_features.second_fan = 0;
>> +				if (quirks & TPACPI_FAN_2FAN) {
>> +					tp_features.second_fan = 1;
>> +					pr_info("secondary fan support enabled\n");
>> +				}
>> +				if (quirks & TPACPI_FAN_2CTL) {
>> +					tp_features.second_fan = 1;
>> +					tp_features.second_fan_ctl = 1;
>> +					pr_info("secondary fan control enabled\n");
>> +				}
>>  			}
>> -
>>  		} else {
>>  			pr_err("ThinkPad ACPI EC access misbehaving, fan status and control unavailable\n");
>>  			return -ENODEV;
>> -- 
>> 2.35.1
>>
> 
> Tested-by: Thomas Weißschuh <linux@weissschuh.net>
> Reviewed-by: Thomas Weißschuh <linux@weissschuh.net>
> 
> FYI this now inverts the logic from "platform/x86: thinkpad_acpi: Don't probe 2nd fan if enabled by quirk" [0]
> Instead of skipping the probe when there is a quirk the quirk is skipped if the
> probe succeeds first.
> 
> Going after the rationale in the patch it might be better to turn this around
> here, too:
> 
> 	"If we already know that the system in question has a quirk telling us that
> 	the system has a second fan, there's no purpose in probing the second fan -
> 	especially when probing the second fan may not work properly with systems
> 	relying on quirks."
> 
> [0] https://lore.kernel.org/platform-driver-x86/20220429211418.4546-3-lyude@redhat.com/>
Thanks Thomas,

Fair enough - I'll look to rewrite it and get a v2 out shortly.

I had deliberately done it this was as the logic was cleaner this way
with setting/clearing the second_fan setting but I'm good with putting
the order back as it was and doing the quirks first.

I'd love to get rid of the quirks completely but looking at the list of
platforms there's some I'm not going to be able to get hold of to test
so it's moot.

Mark

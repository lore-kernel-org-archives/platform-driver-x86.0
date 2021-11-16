Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1B63C433FE
	for <platform-driver-x86@archiver.kernel.org>; Tue, 16 Nov 2021 21:08:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B967261BF8
	for <platform-driver-x86@archiver.kernel.org>; Tue, 16 Nov 2021 21:08:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231980AbhKPVLm (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 16 Nov 2021 16:11:42 -0500
Received: from mail1.bemta33.messagelabs.com ([67.219.247.1]:48543 "EHLO
        mail1.bemta33.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232004AbhKPVLh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 16 Nov 2021 16:11:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com;
        s=Selector; t=1637096919; i=@lenovo.com;
        bh=per36Q1I8S/ol+nQz8YLlcFB7DVzMVG2Va0vRCcT3Lc=;
        h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
         In-Reply-To:Content-Type:Content-Transfer-Encoding;
        b=BoEM0LFG3bSwQ3Tzu/RbfhBAYAKHFKEG+/pVoZK67R7Bqfv1kPvUXTQBPVSXzExQH
         RrJwimb9HkzX0pIhA0aNF7KjQmW9iPUcvhjNncon1IR+4y0xrtPjRVjqRyXZfrFaNV
         1/KPzevXra0pQT5mHkQKtKOhXVQykOkmnHdJFBG/8HN1QR4iuNkJstidEXvr1VtsUE
         UUOwMz68w0cJSVNyHfzJEjZEGZgVjI5D+D2Fq60hw7Pxt6J1dJkhbyLc/ad3+PUuSu
         uVo+80ICJmmEVbr++HeW0grn2ozz0NGTeMCfPGYtL6K+ah6IAS4Au+A503g3NqYPux
         NO6aKC8ksPeUg==
Received: from [100.114.65.29] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-1.bemta.az-a.us-east-2.aws.ess.symcld.net id 7D/0B-13372-6DD14916; Tue, 16 Nov 2021 21:08:38 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOJsWRWlGSWpSXmKPExsWSoS+Vr3tNdkq
  iwfo9ShZvjk9nsvjcMZnFYvWeF8wOzB7zTgZ6vN93lc3j8ya5AOYo1sy8pPyKBNaMbyu3MhZs
  FKj4dfsqYwPjRd4uRi4ORoGlzBJPHsxhgnAWsUp8X/adBcLpZJKYPO8eO4gjJDCbSeL4rQ/ME
  M5+Jomz63rBeiQEjjNKdB9axwSR6WSU+PHqFAuEM4lJYvn641A9Txgl1i3thZr2gFFi+7J7bF
  2MnBy8ArYSJ+8fYgKxWQRUJTZ/gokLSpyc+QRoFAeHqEC4RMOdYpCwsECAxOYZb8BKmAXEJW4
  9mQ/WKiKgLjG1owcq7iwxqWUCG8Su3YwSm+/0MIMk2AS0JbZs+cUGMpNTwE6i9ac/RL2mROv2
  3+wQtrzE9rdzwMqFBJQlfvWfZwYplwCKN8zkBAlLCCRI9Px7xAZhS0pcu3mBHcKWlTh6dg4Lh
  O0r0b91PSuErSWx9fw0Jgg7R2Lu4fvMELaaxMdz01knMOrNQvLwLCSfzUJy3Swk1y1gZFnFaJ
  1UlJmeUZKbmJmja2hgoGtoaKJrZqFrZGiql1ilm6hXWqybmlhcomukl1herJdaXKxXXJmbnJO
  il5dasokRmI5Silyu72D8/eWH3iFGSQ4mJVFesYeTE4X4kvJTKjMSizPii0pzUosPMcpwcChJ
  8C7gmpIoJFiUmp5akZaZA0yNMGkJDh4lEV4GKaA0b3FBYm5xZjpE6hSjJceEl3MXMXN09SwEk
  pOO7N7OLMSSl5+XKiXOe1EGqEEApCGjNA9uHCx9X2KUlRLmZWRgYBDiKUgtys0sQZV/xSjOwa
  gkzLsMZApPZl4J3NZXQAcxAR0ke3kyyEEliQgpqQamE7EsPqx7N2a0yP+b1s92/6jKQ4nvd9b
  Kti3xtqteyyb58dsV7gkL72r89pg66cSkjOmCa9qZvfZ0aPksWrL0MG/BZ2FfzU/H1/bc/Kdx
  TdJoZ1CSv4tiZYKRoeeboKflvQY3VTh3hC34W5DSHzKn9ZNb+sldtz48Trj+2+9KrYdSR3hdB
  4+O7K3is5fm/Z522ER/i4128ZO3iw7fWhi0wlqr7clhhX082/n6Pv/oqnG8mLea+cOyf0dvBQ
  Q1z3jJK2/McDw6TiSnj0svQnwz42b1jUr+Ek4VMds+M2nkMj64vaouvNrxvaFj5aU/PJ93bPp
  w+VPHlb+Wk0Vf8/t++PFd7c/BxH9a96xbsu4JKLEUZyQaajEXFScCACUWYRJaBAAA
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-10.tower-635.messagelabs.com!1637096916!40753!1
X-Originating-IP: [104.47.26.111]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9191 invoked from network); 16 Nov 2021 21:08:38 -0000
Received: from mail-sgaapc01lp2111.outbound.protection.outlook.com (HELO APC01-SG2-obe.outbound.protection.outlook.com) (104.47.26.111)
  by server-10.tower-635.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 16 Nov 2021 21:08:38 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RPYiEYpGHgJIzz9jTM2/FTvHpo4N56QYrOa4cuZ4lPXujrX0Xo+RTcTo3MAhoMiFHySf4rpeEY6hcuVOLEZflq2uAHzFQaWHFYahYnXNHOXakZYYzC0USsKp8/xO7jtsl5xoyUlrMFERzOEOeXnjIz2pETFFPx20F3uZRmVOumsF9OHRG/tp+Zzo/JSVdu+VjSVyh1v0OfINr7dd55XggaZrRoDTnpXO6ouNmN7fliEXw5TfCJW7HGznI1LnN1JT2wqpd1ut24rHk8XWyE5yujFa+ajkHszep8GNVIZlQjNct7Jm7PTIq4wxmMsVt3F3cz0ox+0vfVj76yLAGdSfrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=per36Q1I8S/ol+nQz8YLlcFB7DVzMVG2Va0vRCcT3Lc=;
 b=BMzkaSct6zwG8sXcK9gTCN4BHKiIsmMH8p+SCPd+8l6NkwlqKm2ik5ITPLuxRzsD1kDo1qc1O9elqbyud1eB8VLd4iQxa4hPIZZp+l9OE9kCHb8WSkFh5FfFmgChUsGhi6maGm+aYbSuKxO2p4hf8J0Op6xRvr7LW9nIrWTXc6SJbEsnOgZMtMIxYFSqEToMXH4lx8Ko/ttgbtIQaz8VuYoEl0R98a33/2LLu2TlX+0PvYqyYtpJ5U9FG6zI40MIJ9QSunlLFhksNyLixE/JgLq8F024pRFlpBKE37L7i8vHvMQzuG7uA17m5/PWTGFA88Fk1Bx1yaG2PSAK5PfaDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 104.232.225.7) smtp.rcpttodomain=redhat.com smtp.mailfrom=lenovo.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=lenovo.com;
 dkim=none (message not signed); arc=none
Received: from SG2PR06CA0127.apcprd06.prod.outlook.com (2603:1096:1:1d::29) by
 KL1PR03MB5570.apcprd03.prod.outlook.com (2603:1096:820:51::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.14; Tue, 16 Nov 2021 21:08:35 +0000
Received: from SG2APC01FT047.eop-APC01.prod.protection.outlook.com
 (2603:1096:1:1d:cafe::de) by SG2PR06CA0127.outlook.office365.com
 (2603:1096:1:1d::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend
 Transport; Tue, 16 Nov 2021 21:08:35 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 104.232.225.7) smtp.mailfrom=lenovo.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=lenovo.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 lenovo.com discourages use of 104.232.225.7 as permitted sender)
Received: from mail.lenovo.com (104.232.225.7) by
 SG2APC01FT047.mail.protection.outlook.com (10.152.251.172) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.19 via Frontend Transport; Tue, 16 Nov 2021 21:08:35 +0000
Received: from reswpmail01.lenovo.com (10.62.32.20) by mail.lenovo.com
 (10.62.123.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.20; Tue, 16 Nov
 2021 16:08:32 -0500
Received: from [10.38.49.20] (10.38.49.20) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.20; Tue, 16 Nov
 2021 16:08:31 -0500
Message-ID: <79b2dc73-1605-4440-5840-3a6bd071d01c@lenovo.com>
Date:   Tue, 16 Nov 2021 16:08:30 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [External] Re: [PATCH 2/2] platform/x86: think-lmi: Opcode
 support
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>
CC:     <mgross@linux.intel.com>, <platform-driver-x86@vger.kernel.org>
References: <markpearson@lenovo.com>
 <20211108232533.211693-1-markpearson@lenovo.com>
 <20211108232533.211693-2-markpearson@lenovo.com>
 <0ab21b8d-0b15-e963-fb36-d3026765f757@redhat.com>
From:   Mark Pearson <markpearson@lenovo.com>
In-Reply-To: <0ab21b8d-0b15-e963-fb36-d3026765f757@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.38.49.20]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b7bbb437-bc55-4f58-cfb0-08d9a94540ee
X-MS-TrafficTypeDiagnostic: KL1PR03MB5570:
X-Microsoft-Antispam-PRVS: <KL1PR03MB5570B73DE2B2BDA8C20F7291C5999@KL1PR03MB5570.apcprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HHpPHM94umEdq46twTPYRFHDxjvs5NqImh/9Y8d3wvKP7XvrYsjY3dY2avO40ZoIqeGnJwXjGkgqsyVSpWK7gANVyGmv8V9rH9JmXEdwGpbwCtdkAlkXiHyofgLnuoWYuZJhc6b4GI3AjQlNaZSwUOZYfH8R2+5oUEaZVMJAwsB0jBCZcEfEjqG0vXFi5bXYrzPyI/CMpXcCKAQPSOp8Drn3WOCEQfzK+dzOKOhLQuDRGxQEpxO99pfk2s8lwIZwiVXbePnVSi4UhViSjYGMnbPh61/8ET7YK0NeYA2LhIBw42t0wjHJeVnaPUiB2LMyYMi8jve50I1HRZXj2Ow+OJ2r55iFToFIBWSteSAx6yvbBD0h2JC05Ztc9t29YqknDxPGDki7k7GhnRsObu6B6QeoaDqWxYGWpeXIFE2mEfMAoviSUPLb2ze/zNf1VWQHa1+Vf7dIhJy/tmPPN4/a+sqXWnuYF7V4SOXfN13U7tqaRQ67xrPTNdrxF1EupyQLTSfUBd+i7lgY+LPyQxeGELjbBkaijw947MS5eOLU4+jVugrDXbVlTL+/3p+q2Ntmcc2+Wog65/4+Hb8VHStxSveEA2N8/il4439+tx1NnfSC53j7b4vshAwS4+vLaAarIOLVmfJAJigyuk3iTziQ2vXvr5vR16ZQuMhQawKO+Xqzjq3CG5esa2JCaO27jXh7ZW2Z+Lhrj7R3huZxlWSw+DdxvP1u0l/2lOkY8NmkbOl4U+m/uMPgDZnUBud35NDDByEJmhqR7yhFGdZJLrd+Fv6Afz1ZhLEw7wM8GmE6yvQ=
X-Forefront-Antispam-Report: CIP:104.232.225.7;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.lenovo.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(36860700001)(2616005)(31686004)(186003)(8676002)(70586007)(6916009)(316002)(508600001)(426003)(336012)(16526019)(70206006)(36756003)(31696002)(356005)(82960400001)(82310400003)(4001150100001)(2906002)(81166007)(16576012)(53546011)(83380400001)(54906003)(26005)(47076005)(8936002)(5660300002)(4326008)(36906005)(86362001)(3940600001)(43740500002)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 21:08:35.1705
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7bbb437-bc55-4f58-cfb0-08d9a94540ee
X-MS-Exchange-CrossTenant-Id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5c7d0b28-bdf8-410c-aa93-4df372b16203;Ip=[104.232.225.7];Helo=[mail.lenovo.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT047.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB5570
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


Hi Hans

On 2021-11-16 09:07, Hans de Goede wrote:
> Hi Mark,
> 
> On 11/9/21 00:25, Mark Pearson wrote:
>> Implement Opcode support.
>> This is available on ThinkCenter and ThinkStations platforms and
>> gives improved password setting capabilities
>>
>> Add options to configure System, HDD & NVMe passwords.
>> HDD & NVMe passwords need a user level (user/master) along with
>> drive index.
>>
>> Signed-off-by: Mark Pearson <markpearson@lenovo.com>
> 
> The change you are making to tlmi_probe() is already in my
> review-hans branch and the line numbers also do not seem to
> match in various places, please rebase this for v2.

Yeah - I had this written before that patch came through and wasn't sure
what to do. I'll rebase
> 
> I also have some remarks inline.
> 
>> ---
>>  drivers/platform/x86/think-lmi.c | 303 +++++++++++++++++++++++++++----
>>  drivers/platform/x86/think-lmi.h |  28 ++-
>>  2 files changed, 296 insertions(+), 35 deletions(-)
>>
>> diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
>> index 3671b5d20613..04810c5ced93 100644
>> --- a/drivers/platform/x86/think-lmi.c
>> +++ b/drivers/platform/x86/think-lmi.c
>> @@ -116,8 +116,23 @@
>>   */
>>  #define LENOVO_GET_BIOS_SELECTIONS_GUID	"7364651A-132F-4FE7-ADAA-40C6C7EE2E3B"
>>  
<snip>
>> +
>> +static struct kobj_attribute auth_level = __ATTR_RW(level);
>> +
>>  static struct attribute *auth_attrs[] = {
>>  	&auth_is_pass_set.attr,
>>  	&auth_min_pass_length.attr,
>> @@ -473,6 +606,8 @@ static struct attribute *auth_attrs[] = {
>>  	&auth_mechanism.attr,
>>  	&auth_encoding.attr,
>>  	&auth_kbdlang.attr,
>> +	&auth_index.attr,
>> +	&auth_level.attr,
> 
> This will add the index and level attr to all auth dirs,
> but they should only be added to the NVMe and HDD dirs,
> right ?
> 
> Please add an is_visible callback (see recent thinkpad_acpi changes)
> and hide these for the other auth dirs.

Good idea - I hadn't thought of that. Will do

> 

<snip>

> 
> Except for the one remark and the need to renase this 
> looks good overall, thank you.
> 
Excellent - thanks!

Mark

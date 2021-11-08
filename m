Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 409F8C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon,  8 Nov 2021 15:48:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 27E5761359
	for <platform-driver-x86@archiver.kernel.org>; Mon,  8 Nov 2021 15:48:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239326AbhKHPuz (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 8 Nov 2021 10:50:55 -0500
Received: from mail1.bemta23.messagelabs.com ([67.219.246.3]:55507 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236600AbhKHPuz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 8 Nov 2021 10:50:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com;
        s=Selector; t=1636386490; i=@lenovo.com;
        bh=SG4yCRWUNypaN3mTgh6kUrOguJftFBOuuaRDtCc6dho=;
        h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
         In-Reply-To:Content-Type:Content-Transfer-Encoding;
        b=Zv7znSzreeDXhzYLn/bJWp+BWxI8lWXYdtu52T3SbF0O5vTX9IYhLEGLR23xeEusp
         gs/FB7D3nBDtDosYTYNqkyJbXqY1sRHi2MsIb0/EFCvIVKIZuZTMUj8q0mzDQmqCAB
         MgkHv8ThjwI9pwDRHsJMB11oyyR558ie4wlEigZGX9y+5d2f+8Xo/qiKZi0n+vzGq4
         e/KOo4Uytc5gf4mT2WnpL8l5MMfrgaDxWPNNzyrtQ2OjkzHSmDIZ74ZCxTUmxD1l6j
         DKh2toRUImi26M+w55YLj5JBkTLfAIB6HtboMNWxcp69X7T+nrI6hFECySbKLwTohr
         DXe9IEt6eeo0g==
Received: from [100.112.1.55] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-3.bemta.az-b.us-east-1.aws.symcld.net id F5/B7-04465-9B649816; Mon, 08 Nov 2021 15:48:09 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGJsWRWlGSWpSXmKPExsWSoV9nqrvTrTP
  RYPNsNYs3x6czWaz/vZLFYvZhG4vrH0+xWhyYOo3ZYvWeF8wObB6LV0xh9fh9gNFj06pONo/d
  Cz4zebzfd5XN4/MmuQC2KNbMvKT8igTWjN7lm1gL7nNUrHozlamBcQl7FyMXB6PAUmaJWdNfs
  HUxcgI5i1glvn40hki0MUmsfjaDEcQREpjJJDHz2H1mCGcfk8THhldMII6EwHFGie5D65ggMp
  2MEj9enWKBcCYySVw7OR0q85hRYs7eNawga4QEHjJKbJytC2LzCthKHJl9GWw9i4CKxMIj71k
  h4oISJ2c+AZrEwSEqEC7RcKcYJCwsECdx6GkbI4jNLCAucevJfCYQW0RASWLDsnYmiPgjRok1
  m9kgVplKtB+cxAJiswloS2zZ8gsszilgJrHtayvUHAuJxW8OskPY8hLb385hhuhVlvjVfx7Ml
  hBQkNiw/i87hJ0g0fPvERuELSlx7eYFqLisxNGzc1ggbF+JTZOuQNlaEn+6n0DNyZG4deAQVL
  2axPLFn5gnMOrNQvLxLCSvzUJy3iwk5y1gZFnFaJJUlJmeUZKbmJmja2hgoGtoaKRrpGuhl1i
  lm6RXWqybmlhcomuol1herFdcmZuck6KXl1qyiRGYuFIKmDh2MN55/UHvEKMkB5OSKK+WXWei
  EF9SfkplRmJxRnxRaU5q8SFGGQ4OJQlecWegnGBRanpqRVpmDjCJwqQlOHiURHi9nIDSvMUFi
  bnFmekQqVOMxhwTXs5dxMxxctWSRcxCLHn5ealS4rxnXIBKBUBKM0rz4AbBkvslRlkpYV5GBg
  YGIZ6C1KLczBJU+VeM4hyMSsK8r0Cm8GTmlcDtewV0ChPQKQe/tIOcUpKIkJJqYJI6diCvOMV
  p4R3PKO0jJa1J8y7cvPZJusRIk2t7yOocR/bjocKXek3zRL6VeQcm/n5UvWJl8caz2rP8w1R8
  P9sf4Pqm+uO1WmleuuSZW7E/t2d0vtzR0MFmOPf9BKGSoqsvbu3NEumyLlLkX9D2OivkeE/as
  oAo8+DuKh67UzkqFs9YnrY/aNU8kbf3h/aXUAmVqOsba6X4hCqjPPmWbttlssTKxXm9yhX/3r
  jJbwUmz6ngOng+KD532sx1hyqzHjEEyvFd0C5eKGrSX59dFrvu4OepzZd7FK1WBN+ptHnTVbE
  lZVOAnfKCX7f2zrtn8Hnx/Zer1c7e/J+47TJLQItB9HvWGYsT4xkv614/o8RSnJFoqMVcVJwI
  AEJ+wdVpBAAA
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-18.tower-386.messagelabs.com!1636386488!395!1
X-Originating-IP: [104.47.126.53]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31000 invoked from network); 8 Nov 2021 15:48:09 -0000
Received: from mail-pu1apc01lp2053.outbound.protection.outlook.com (HELO APC01-PU1-obe.outbound.protection.outlook.com) (104.47.126.53)
  by server-18.tower-386.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Nov 2021 15:48:09 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I9TYU/RT0mMrzran8bAthM9uNDbpN/1CivRaF8culZflaKMy4kWeUgooMg6C9Pk4jag+IHfsNq10O8wg0NCO8w64cmXv03VE6R3WVAsB7PgxbVD7erehuA2SUrV1BeLXzdbIKQTKpLH1N8TCKzH1OdnDW3nUkkE9BR21wxIWTntG4/iJjucZeLQKAA28izuHARjnZoZibUEUTqTD6eryib/A7WO5myOYzviHoAtqzu+zOTUKMCCOIU9ZZWCdX67uleGAIIJDb2ADwoF+DCh5+zu4cubhoJrkUUtLMQyy14uN45uTDGAs10jk5R78zuZNEaFrNkTO0yQ/sxgAjdEsHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SG4yCRWUNypaN3mTgh6kUrOguJftFBOuuaRDtCc6dho=;
 b=J1AvAWZouDfRvJzl6hd0Hm7Pmr6TB+0LkrmOepnWCLK6aT5BxeaJglKVjeX722qsehEGJlKg9GtpDz1C6KYYdaNvCup+EdXOO6ZLNvWpLqSnhVZsQX1Bu5IBYaDGx1zWKKwekkLQguK2oVGt9NVKvflWcSahdtC5bXkx5W3MbrZn+Sa69glUX0zEYWm8HGEvI0Zsg4oLvOTCAYQqCKgRJW/ljx9p89fPBzutwNUV4/NiM7cdBletv15W9NBcyNznS3wOCVyNf8miEpNQDNUPS4Q7hEbHAJn6hCWiYrpYy+l0bKgylCGwFvgj0IrIr0vddcWDK0IpP/EOsOy27vSYFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 104.232.225.7) smtp.rcpttodomain=163.com smtp.mailfrom=lenovo.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=lenovo.com;
 dkim=none (message not signed); arc=none
Received: from SG2PR06CA0108.apcprd06.prod.outlook.com (2603:1096:3:14::34) by
 HK0PR03MB3844.apcprd03.prod.outlook.com (2603:1096:203:3b::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.8; Mon, 8 Nov 2021 15:48:06 +0000
Received: from SG2APC01FT050.eop-APC01.prod.protection.outlook.com
 (2603:1096:3:14:cafe::55) by SG2PR06CA0108.outlook.office365.com
 (2603:1096:3:14::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Mon, 8 Nov 2021 15:48:06 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 104.232.225.7) smtp.mailfrom=lenovo.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=lenovo.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 lenovo.com discourages use of 104.232.225.7 as permitted sender)
Received: from mail.lenovo.com (104.232.225.7) by
 SG2APC01FT050.mail.protection.outlook.com (10.152.251.238) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.10 via Frontend Transport; Mon, 8 Nov 2021 15:48:06 +0000
Received: from reswpmail01.lenovo.com (10.62.32.20) by mail.lenovo.com
 (10.62.123.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2242.12; Mon, 8 Nov
 2021 10:48:05 -0500
Received: from [10.38.62.237] (10.38.62.237) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2242.12; Mon, 8 Nov
 2021 10:48:04 -0500
Message-ID: <2c7bb3b5-26be-93cc-e946-d15cbf7ab185@lenovo.com>
Date:   Mon, 8 Nov 2021 10:48:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [External] [PATCH] platform/x86: thinkpad_acpi: Add support for
 dual fan control
Content-Language: en-US
To:     Jimmy Wang <jimmy221b@163.com>
CC:     <wangjm19@lenovo.com>,
        Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
        "Hans de Goede" <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        <ibm-acpi-devel@lists.sourceforge.net>,
        <platform-driver-x86@vger.kernel.org>
References: <20211108025534.7801-1-jimmy221b@163.com>
From:   Mark Pearson <markpearson@lenovo.com>
In-Reply-To: <20211108025534.7801-1-jimmy221b@163.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.38.62.237]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c156aa6e-0fd8-492e-b480-08d9a2cf2860
X-MS-TrafficTypeDiagnostic: HK0PR03MB3844:
X-Microsoft-Antispam-PRVS: <HK0PR03MB384417637F5A9AF15B1E4A10C5919@HK0PR03MB3844.apcprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hlW3itrvaMdPlkfO2i906XxDF6QfA0tJtUBJoTiNedONBBVqlAU6XiL+SIBPMz2qS0gE7BZmXADKafXasZhOquOoFBf22zrvWYXIJui7bAneSYdW4m0wFQRp3MllYZi3FhffQpfeLDpuLyxfSzKF9ReDaAqCh05/HVsCmSK6mLXVyjPgKbPmJ9Mwh7ZFM71YuuGzVkBfCYxtEnTVaEzNkwIuM27qFvh5XGorpfss8tpSj0atmuzXQpaAj7oPbq0RHv3f5BbWT5/f+hXv5E9Cg7pF/3TNk3+vy0o7H5dSaZhEgVgJODTZf9Z36/pX+jjisJxXhjXp3rmabhsuWDr7ytFaJKQ0+SMMjinYZ0Nu0BcZ9lxDqNJbDvW59B4ckaC5409KMpWStZu8xekmPGMJqQTL2v5KgebWO5bDjdIbK15TBeLfk5N/UzNTKCVYO2P17D1KU91PDuB61KyEf/6IFaswFxDPDqIubTsbv1y25vuST6H7K/vDKVXgnEC/6LxdcuV7DjqQP57G9f7vPF9fyj8qMYyLpwNoUZQ8keL/4HFjOrK93/FSoBNCH2wzrD5+xOH/XQj+AxvkEgcfBXbBcWPVwAzcGWcxWu1IFyciUK7xVMNXKC0y870A5OM7qHFrmb31uIVgp7UwO4Suhi4OS8TKcCWTJxZjWIDeuembxDVxjS4fe6+RED9y1F2+peQjMULIqqf7pOx9xoXfa4CCFBk7HricYBnDvfQ7xffxKVjC1yrXA38sLpQZVYXOMyc5i1VzfolGkL1qCF8yU/miS+ZGcGHHe+D1zYcpSMn3yYo=
X-Forefront-Antispam-Report: CIP:104.232.225.7;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.lenovo.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(86362001)(8936002)(36860700001)(26005)(70206006)(16526019)(82960400001)(8676002)(356005)(336012)(54906003)(36756003)(6916009)(508600001)(70586007)(186003)(47076005)(53546011)(31696002)(82310400003)(81166007)(31686004)(5660300002)(36906005)(2616005)(4326008)(316002)(426003)(16576012)(2906002)(3940600001)(43740500002)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2021 15:48:06.3656
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c156aa6e-0fd8-492e-b480-08d9a2cf2860
X-MS-Exchange-CrossTenant-Id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5c7d0b28-bdf8-410c-aa93-4df372b16203;Ip=[104.232.225.7];Helo=[mail.lenovo.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT050.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR03MB3844
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Thanks Jimmy,

On 2021-11-07 21:55, Jimmy Wang wrote:
>     This adds dual fan control for P1 / X1 Extreme Gen4
> 
> Signed-off-by: Jimmy Wang <jimmy221b@163.com>
> ---
>   drivers/platform/x86/thinkpad_acpi.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 9c632df734bb..eb201d001075 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -8766,6 +8766,7 @@ static const struct tpacpi_quirk fan_quirk_table[] __initconst = {
>   	TPACPI_Q_LNV3('N', '2', 'E', TPACPI_FAN_2CTL),	/* P1 / X1 Extreme (1st gen) */
>   	TPACPI_Q_LNV3('N', '2', 'O', TPACPI_FAN_2CTL),	/* P1 / X1 Extreme (2nd gen) */
>   	TPACPI_Q_LNV3('N', '2', 'V', TPACPI_FAN_2CTL),	/* P1 / X1 Extreme (3nd gen) */
> +	TPACPI_Q_LNV3('N', '4', '0', TPACPI_FAN_2CTL),	/* P1 / X1 Extreme (4nd gen) */
>   	TPACPI_Q_LNV3('N', '3', '0', TPACPI_FAN_2CTL),	/* P15 (1st gen) / P15v (1st gen) */
>   	TPACPI_Q_LNV3('N', '3', '2', TPACPI_FAN_2CTL),	/* X1 Carbon (9th gen) */
>   };
> 
Looks good. I have no concerns.

Mark


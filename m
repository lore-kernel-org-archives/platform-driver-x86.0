Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 916C9C433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Mar 2022 17:14:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232145AbiCIRPp (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 9 Mar 2022 12:15:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237873AbiCIRNR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 9 Mar 2022 12:13:17 -0500
Received: from mail1.bemta35.messagelabs.com (mail1.bemta35.messagelabs.com [67.219.250.3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AF06EA767
        for <platform-driver-x86@vger.kernel.org>; Wed,  9 Mar 2022 09:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com;
        s=Selector; t=1646845722; i=@lenovo.com;
        bh=YOab9p7I09Ql+8j6CHXNO0nj4kcWrVARUloXALms0do=;
        h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
         In-Reply-To:Content-Type:Content-Transfer-Encoding;
        b=ejbiuHm5x100RWPv1G4CoU2nScVfvyoELLnRwiEhC+/Qe7Yw7w1sgcbapuL7CqErY
         w5eqxHTQP7/95SI0P9MJRIJPpWW6oRJvW8vsv9DUdLtnWWuhqsSV636W5fwYNuebu5
         j1LGxV8fsin5ILvc8NQ4kS3oA05stv7w508p9FHA6+3VcMmMbSQEDt5t8Q4q3rwHIF
         Rs3ydZ94FBmroImd8reLWgXPEVn98osL08oFu1H546jBikJufaAm736NlmM/wPT9L2
         ttTPgPSiGHw25V8dXszhnefzj3aIzFjd+Rd7zSYWNz/mVrLxcsGg/uFBbvGq17AxxL
         /PO4UisHfaGwA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrLJsWRWlGSWpSXmKPExsWSoS+Voyt+XyP
  J4N4RG4uDRzayWbw5Pp3J4sDUacwWq/e8YLbYuvcquwOrR+ONG2wem1Z1snm833eVzePzJrkA
  lijWzLyk/IoE1oyVM9+yFCziqdjX9YOxgXE6VxcjFwejwFJmiTszfzFBOItYJXYt/soK4XQyS
  Uyed48dxBESmMMk8enUESjnIJPEm2nLmUEcCYHjjBLdh9YxQWQ6GSV+vDrFAuFMYJK4MucmI4
  TzmFHi6O4ZbHDO2f3/gTKcHLwCthLrZ3Yyg9gsAioSXTeusEDEBSVOznwCZosKhEvcf/aZDcQ
  WFkiS+PH2DpjNLCAucevJfCYQW0QgT2LqzFcsEPFgiZOLDoDNFxLIkFi+4hFYnE1AW2LLll9g
  vZwCVhLXZn9nhKjXlGjd/psdwpaX2P52DjNEr7LEr/7zYLaEgKLEiu/n2CDsBInmKUcZIWxJi
  Ws3L7BD2LISR8/OYYGwfSVeP3wIVaMr8fToH1YIO0di9t21UDVyEqd6zzFNYNSdheTlWUhem4
  XkvFlIzlvAyLKK0TqpKDM9oyQ3MTNH19DAQNfQ0ARIG+samuglVukm6pUW65anFpfoGukllhf
  rpRYX6xVX5ibnpOjlpZZsYgSmrJSidL4djL/6fuodYpTkYFIS5RU6oJEkxJeUn1KZkVicEV9U
  mpNafIhRhoNDSYL3xGmgnGBRanpqRVpmDjB9wqQlOHiURHhXngdK8xYXJOYWZ6ZDpE4x6nJc2
  bZ3L7MQS15+XqqUOO+lu0BFAiBFGaV5cCNgqfwSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJW
  HeRXeApvBk5pXAbXoFdAQT0BF2RmogR5QkIqSkGpiOS+0srf4vPTX/2Be5gz/i7q09Wf5AbXP
  Wpu1JXdm8XrPjrOb4nHY6df+Do7vVUbml3LoVy/refik5YPnvgEj8jKtla0T5dW2K2J4u3eWd
  LOy2TKpgSlb3DJa7yuXiWUpSqwoWPzx73n9XEff6xlVH5ns41x0V+blI69sB3SXrmvNcr++6e
  OGU/8+JrsqS5b/6X2vf8Pv3g6Wq/4rF2a3MrX4RZWIm6+WazKpXme+4+fm7kNzdk+du5ry63e
  dXz1G9ydM4zXxzytPKHFGeGx9XKbf28qQLlmYs2Mv+8qXvdN8pRc0fOyMsj17sfpewSETyC5N
  kh8/eu3+y4oocdnQuWxri9GWW36eFz0Us09WUWIozEg21mIuKEwFU/0J6YAQAAA==
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-11.tower-655.messagelabs.com!1646845718!12229!1
X-Originating-IP: [104.47.26.108]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32063 invoked from network); 9 Mar 2022 17:08:39 -0000
Received: from mail-sgaapc01lp2108.outbound.protection.outlook.com (HELO APC01-SG2-obe.outbound.protection.outlook.com) (104.47.26.108)
  by server-11.tower-655.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 9 Mar 2022 17:08:39 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lsUg5bhL6r31x8/Ltn5WdO3rKT1eYz10OYmWVhHcNExkZQsjb2eO/fhoj0ZCtBZbGG9wXXkAFj0BzEmKzbOjs+YnvbWL+GrSkozXGYzyRVaroUwdjAizZ6Z/CrRlvpxhWc0R65QmWLxSel0CHOOYbKxkQ1J70toIjaR+dcSXA/g6PZU/P67WvehhI5PK7PO2JYy0BgZOyd7q5U0cTCxuCTDSoDL0/e9R5/uJPqRhGFvlTLtRba/hUsKkGY+xdhwhddjairqxmKA2LvMqBsoAjis497hfFKctYPg7fM2a0xEsKyAdH5BXaAbA25z/B6T5DqQzF2uSQDgY68F7QrxHRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YOab9p7I09Ql+8j6CHXNO0nj4kcWrVARUloXALms0do=;
 b=a74FxTynlF0APQwNe9hWM9D+xb1uPLdDTQci8cEnz5/pbBJuasRmV6MoEld7bnfdsY1QC+HzWtOrWK3CQXHqD+d4PI4Yo5le+R8UEzWRaeXIu85M7zeO2sa3RniKwu+CHPwsD0dLMNyeq7+m1WgkenKWji1pgKFUga9VLXlqjSXIKGTwQFpRN5tTt6W2XGC41vhSGQLHpGu02IZE2BWqYF5yvp9OUQpkG/XPYC7gIN1MAKTgLjV6CtxHXTD4zBUw/G+acC4mhnLS89Z35YmY13C4SAObWtqsPd8gb/a12+x6r5O2uLfVnw930UQ9LsauWJJYUfMxUIsijpImE6zpzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 104.232.225.7) smtp.rcpttodomain=redhat.com smtp.mailfrom=lenovo.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=lenovo.com;
 dkim=none (message not signed); arc=none
Received: from PUZP153CA0009.APCP153.PROD.OUTLOOK.COM (2603:1096:301:c2::10)
 by PS1PR03MB3253.apcprd03.prod.outlook.com (2603:1096:803:4c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.7; Wed, 9 Mar
 2022 17:08:37 +0000
Received: from HK2APC01FT009.eop-APC01.prod.protection.outlook.com
 (2603:1096:301:c2:cafe::a7) by PUZP153CA0009.outlook.office365.com
 (2603:1096:301:c2::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.7 via Frontend
 Transport; Wed, 9 Mar 2022 17:08:36 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 104.232.225.7) smtp.mailfrom=lenovo.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=lenovo.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 lenovo.com discourages use of 104.232.225.7 as permitted sender)
Received: from mail.lenovo.com (104.232.225.7) by
 HK2APC01FT009.mail.protection.outlook.com (10.152.248.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5038.14 via Frontend Transport; Wed, 9 Mar 2022 17:08:35 +0000
Received: from reswpmail01.lenovo.com (10.62.32.20) by mail.lenovo.com
 (10.62.123.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.21; Wed, 9 Mar
 2022 12:08:28 -0500
Received: from [10.38.104.226] (10.38.104.226) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.21; Wed, 9 Mar
 2022 12:08:27 -0500
Message-ID: <248c280b-7469-85e9-e642-41991445a2e2@lenovo.com>
Date:   Wed, 9 Mar 2022 12:08:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [External] [PATCH 2/2] platform/x86: thinkpad_acpi: Don't use
 test_bit on an integer
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
References: <20220309170532.343384-1-hdegoede@redhat.com>
 <20220309170532.343384-2-hdegoede@redhat.com>
From:   Mark Pearson <markpearson@lenovo.com>
In-Reply-To: <20220309170532.343384-2-hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.38.104.226]
X-ClientProxiedBy: reswpmail01.lenovo.com (10.62.32.20) To
 reswpmail01.lenovo.com (10.62.32.20)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dbb3f8c1-5718-4b89-316b-08da01ef7301
X-MS-TrafficTypeDiagnostic: PS1PR03MB3253:EE_
X-Microsoft-Antispam-PRVS: <PS1PR03MB3253D6EE57A75DDF81ED5846C50A9@PS1PR03MB3253.apcprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AHa7m0hKqJ8idwEktQLiJnAS98t85sEXrbMrKcToh1rDiKegIf468hNXqkUH0wc1vDLSHhzEQPrUX6Szgp2SM99gGg+p8G2jOZ0o1yvkLWbeFZDSkKp32FyA4eE6CFHx/sLWuz4/vHDtsB5mlGs0H/ZxdyYEgHM15DikpxDgGIYDtaJmREq/8OTlIH87UYvIzXkhxzmu2u6tBz6rg2MopNRZLChWF3fIU9RNglwoZkv0UjsUZq4KKzjU/hwk1myouz5IA2o5rR0CPfBRaFWuo9S0oYdJt8gtDu+F7jLY+AilW+pvJhRjxUi7rSpD37x5fcRbk9O9U40A2bFTY8ctxpZPLXl5JbFX3YHHUCwMSndMRbvnAOathYDINwAv7nmeJ1Qm87CsSWGiGLZqiCjTJdeZ4JISmzC+yR8cOWFXqJxhCIDNB07bEWInKlLO7dFoGttymhZntuRjHltMR8PDAg71Dx1SkmkehQILoYZca2CfKI4wZTNHR5PssO0TIlnFNnbGDcP1r1nQm2TrI3fHqGOTAxgRGUIh+7KPIPGXqlTbuMPuLDxlKdesOW3OO+v5hsclr2nxdD4XhQ77JOfPLSqzPicmvndXufhLxqOfs1UK+pIVwOscau4G+vC9d+IhQhVIJkaIP514kZnmWFKGrMXvFIFaj0oOWqJv2g6P0O0M6/PyuZH6048O/RSj++NuI4el945fTX213ORhJFmZNxFn8RFrH+U4CNwYFqPi4h7MOMnbVB4OWgdYmmqo0nylsSloBA5p7ZYAKC1z1Lr08Q==
X-Forefront-Antispam-Report: CIP:104.232.225.7;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.lenovo.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(53546011)(40460700003)(16526019)(16576012)(26005)(186003)(47076005)(316002)(81166007)(36860700001)(36756003)(2906002)(82310400004)(2616005)(70586007)(4326008)(8676002)(31686004)(70206006)(54906003)(110136005)(5660300002)(31696002)(508600001)(8936002)(356005)(86362001)(336012)(426003)(82960400001)(83380400001)(3940600001)(43740500002)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 17:08:35.9616
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbb3f8c1-5718-4b89-316b-08da01ef7301
X-MS-Exchange-CrossTenant-Id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5c7d0b28-bdf8-410c-aa93-4df372b16203;Ip=[104.232.225.7];Helo=[mail.lenovo.com]
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT009.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS1PR03MB3253
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Thanks Hans,

I hadn't realised that was the case - appreciate the fix

Mark

On 2022-03-09 12:05, Hans de Goede wrote:
> test_bit can only be used on longs not on ints, fix this.
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> p.s. Mark, the need for the (void *) case in the code this replaces
> should have been a hint that something was not right; and I should
> have spotted that during review...
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 7016c7fc3440..c476a78599d6 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -10399,7 +10399,7 @@ static int tpacpi_dytc_profile_init(struct ibm_init_struct *iibm)
>  	if (err)
>  		return err;
>  
> -	if (test_bit(DYTC_FC_MMC, (void *)&output)) { /* MMC MODE */
> +	if (output & BIT(DYTC_FC_MMC)) { /* MMC MODE */
>  		dytc_profile_available = DYTC_FUNCMODE_MMC;
>  
>  		/*
> @@ -10412,7 +10412,7 @@ static int tpacpi_dytc_profile_init(struct ibm_init_struct *iibm)
>  			if (!err && ((output & DYTC_ERR_MASK) == DYTC_ERR_SUCCESS))
>  				dytc_mmc_get_available = true;
>  		}
> -	} else if (test_bit(DYTC_FC_PSC, (void *)&output)) { /*PSC MODE */
> +	} else if (output & BIT(DYTC_FC_PSC)) { /* PSC MODE */
>  		dytc_profile_available = DYTC_FUNCMODE_PSC;
>  	} else {
>  		dbg_printk(TPACPI_DBG_INIT, "No DYTC support available\n");


Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94131C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 27 Sep 2021 16:50:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 747536109F
	for <platform-driver-x86@archiver.kernel.org>; Mon, 27 Sep 2021 16:50:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235509AbhI0Qv6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 27 Sep 2021 12:51:58 -0400
Received: from mail1.bemta23.messagelabs.com ([67.219.246.116]:30179 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235285AbhI0Qv6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Sep 2021 12:51:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com;
        s=Selector; t=1632761420; i=@lenovo.com;
        bh=GlMIe13eAoofRIMDZHr5eAVZ04xHS0RmNH7C35kQDR8=;
        h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
         In-Reply-To:Content-Type:Content-Transfer-Encoding;
        b=vl2amad584LXg5GqJXVH9YwbSqGk/0oXnbF0PyYHSjD1qM9Xsmx8EXgI8fmlQ5QX3
         0EQmDHuOeh/ErjcWAEnBTN1NWTGapryHTFi1ANO8bUVnkQaPPM70HH0Ln0uHof3UIh
         CrEyb+IVn5lJRnqD/zXehzVR2atlWZlot2Mxjit//OOcsxPktrV5Lh7ObzcZGkBqL4
         JH7m67qrYZeDC9cczh61SGVdR1xO1pNKv8OQSGYX/lqDD04ZUrdoYYvON6crBEK5yy
         +S5ardlDAIbtAZpkgD7XOlrLSCPYFOtjTe6PjEQ5bKpp/1bNiM9kCnOf5XlCBrkZXy
         W1rthErO3mJMg==
Received: from [100.112.6.171] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-5.bemta.az-c.us-east-1.aws.symcld.net id 54/9C-14014-B46F1516; Mon, 27 Sep 2021 16:50:19 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPJsWRWlGSWpSXmKPExsWSoV9npev9LTD
  RYNJ/MYs3x6czWRy8tIHRovXeLzaLbc2HGS1W73nBbHFl8g1Gi9O7SxzYPabca2Hz2DnrLrvH
  4k372Tw2repk83i/7yqbx+dNcgFsUayZeUn5FQmsGVO//WQq2MheseyzTwPjN9YuRi4ORoGlz
  BIfFuxlhnAWsUo8e/OBHcLpZJKYPO8emCMkMI9J4t2bA2wQziEmiaNHt4D1SAg8YJS407mQES
  LTySjx49UpFghnEpNEy75ZUD1PGCWa16xlgXNmPu8Fcjg5eAVsJTa3nWAFsVkEVCVamqZDxQU
  lTs58AmaLCoRLHFoxAcjm4BAGsj9e8AWZIyJwh1Hi990vbCA1zAK+EssvzWKFWNDOJLGo5Qkj
  SIJNQFtiy5ZfYEWcAnYSHb9/QzVYSCx+c5AdwpaXaN46mxnEFhJQlvjVfx7MlhBQlDiysJsNw
  k6Q6Pn3CMqWlLh28wI7hC0rcfTsHBYI21fi3rTtrBC2lkTH+n6o+hyJmxNeM0HYahIfz02Hqp
  GTONV7jmkCo+4sJD/PQnLeLCTnLWBkXsVollSUmZ5RkpuYmaNraGCga2hopGuia2RsoZdYpZu
  sV1qsm5pYXKJrqJdYXqxXXJmbnJOil5dasokRmLZSClje7WA8+/qD3iFGSQ4mJVHeL48CE4X4
  kvJTKjMSizPii0pzUosPMcpwcChJ8IZ/BcoJFqWmp1akZeYAUyhMWoKDR0mE9y5Imre4IDG3O
  DMdInWKUZdjwsu5i5iFWPLy81KlxHmrQYoEQIoySvPgRsDS+SVGWSlhXkYGBgYhnoLUotzMEl
  T5V4ziHIxKwrxTQabwZOaVwG16BXQEE9ARtZMCQI4oSURISTUwHXWcGhHivi0w6JbSO8Er2rP
  NE/p9/HjWtN3YtoErfbLE2aYzPyavMHHO2MA/5Y2A+gIRa25vk/zHTyb9ePYkoPTpmQtvmNg3
  R3drKe/pXPtrY7rajxcfU1kUrYRMmrh/L9j22n5uXu9Vn7bb+7ZyWPOyRrSUp3+oEFVZ0b0+r
  +LYJ7c972ZN1/9/i/3gw+O2U8WeuZxUNijLCp0uucQpfkq2JcuhyUfLqxRKddNMnnjv6XjOM2
  Nn/DEDWTaXHs91AgfOPpOeFPjprJ8Au5LYIWbJ9aVlParLjt2+mmu9LjDitt/JzzNin3U3Ctj
  9mnNfKdwv6PnMjb/Ylzu8e92x5X8n3zf15i9Jdw0C7yYsUGIpzkg01GIuKk4EAOk+B95iBAAA
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-17.tower-415.messagelabs.com!1632761417!37270!1
X-Originating-IP: [104.47.126.58]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31654 invoked from network); 27 Sep 2021 16:50:19 -0000
Received: from mail-pu1apc01lp2058.outbound.protection.outlook.com (HELO APC01-PU1-obe.outbound.protection.outlook.com) (104.47.126.58)
  by server-17.tower-415.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Sep 2021 16:50:19 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g3I1ebU6KgO2BQWTVckmE1aNfGW24HaYJTMAarlcuaFgxV+3GD9zS8Mab8hEFHIVCARrQkkldQaWBDEWZ0VVvvLHntcn5Xqh2Z8D+5kmtUf28CMoLbozBxtAhEzHSbJXhBXLb02N0c2Qi1yBK8S4endOtlnr5mkVc8NXX6h2fxKUHA5i3reJG+9YAqVM5IeyNdpZDo0yn5fD/oqZN9UmKU0+A84E3jSuyIaRmSG2+WTD97a38jPMAz8m7ZVCSQPzuT/Zi1VSSdcccFB+gH8Krpt6E4rnO0e3OtOx4PRVkY+Ns83DJV4Wj1O21p1UeWCJU0OQSBcfdQwbHZrnOnDPZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GlMIe13eAoofRIMDZHr5eAVZ04xHS0RmNH7C35kQDR8=;
 b=G+Wu9Xyz42v3TC2JFUtBJ9DwAXzucJFmTkzZK6FaQ1HmRt0NZi8Hgw3jNFhDfBXTjEKvl0Xkr3IAxmTGrCm/eRVnkJ2EZ7Qo26Lv80bIX8Hs3IqLrtl855hXdy7P5RpqZ6uCMGdc7lBjzK/pB4D8yKnTxYFulUHZaWeSFOgr2PGyBaktkfKGfPmWJ8Zh7fVKHwZiCjSlkfD+CGgLTh2D38gjCkoCCMBAP97JVmGZtZ5+l6UVokT/VI0WUMPNPxcm26eSphyxFNmKnUQKI88EoF2B5fczdVlu6XF2H/MUNh3JeaWwnyLWBrLfn9PSEq5dr84HnJ/x8mebMk67K1voQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 104.232.225.7) smtp.rcpttodomain=redhat.com smtp.mailfrom=lenovo.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=lenovo.com;
 dkim=none (message not signed); arc=none
Received: from SL2PR03CA0003.apcprd03.prod.outlook.com (2603:1096:100:55::15)
 by PU1PR03MB3048.apcprd03.prod.outlook.com (2603:1096:803:30::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.9; Mon, 27 Sep
 2021 16:50:17 +0000
Received: from PU1APC01FT009.eop-APC01.prod.protection.outlook.com
 (2603:1096:100:55:cafe::94) by SL2PR03CA0003.outlook.office365.com
 (2603:1096:100:55::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.7 via Frontend
 Transport; Mon, 27 Sep 2021 16:50:16 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 104.232.225.7) smtp.mailfrom=lenovo.com; redhat.com; dkim=none (message not
 signed) header.d=none;redhat.com; dmarc=fail action=none
 header.from=lenovo.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 lenovo.com discourages use of 104.232.225.7 as permitted sender)
Received: from mail.lenovo.com (104.232.225.7) by
 PU1APC01FT009.mail.protection.outlook.com (10.152.252.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Mon, 27 Sep 2021 16:50:16 +0000
Received: from reswpmail01.lenovo.com (10.62.32.20) by mail.lenovo.com
 (10.62.123.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2242.12; Mon, 27 Sep
 2021 12:50:14 -0400
Received: from [10.46.192.184] (10.46.192.184) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2242.12; Mon, 27 Sep
 2021 12:50:13 -0400
Message-ID: <dc7baa0e-2a4f-3dab-43b7-afe064efea5c@lenovo.com>
Date:   Mon, 27 Sep 2021 12:50:12 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [External] Re: [PATCH 1/3] thinkpad_acpi: add support for
 force_discharge
To:     Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?Q?Nicol=c3=b2_Piazzalunga?= <nicolopiazzalunga@gmail.com>,
        <platform-driver-x86@vger.kernel.org>,
        "Nitin Joshi1" <njoshi1@lenovo.com>,
        Sebastian Reichel <sre@kernel.org>
CC:     <jwrdegoede@fedoraproject.org>, <smclt30p@gmail.com>,
        <linrunner@gmx.net>
References: <c2504700-06e9-e7d8-80f7-de90b0b6dfb5@gmail.com>
 <06f65bb5-eca4-c1ba-a8c2-b44f8a94c699@redhat.com>
 <2ea2d9b7-4a15-6aea-1aff-4e1cb80a026f@lenovo.com>
 <ac508b49-7958-3afa-25cf-416d701034e3@gmail.com>
 <ba6698de-1700-fce9-6bca-12ee577ac09b@redhat.com>
From:   Mark Pearson <markpearson@lenovo.com>
In-Reply-To: <ba6698de-1700-fce9-6bca-12ee577ac09b@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.46.192.184]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f710b041-de46-4887-9b5c-08d981d6e239
X-MS-TrafficTypeDiagnostic: PU1PR03MB3048:
X-Microsoft-Antispam-PRVS: <PU1PR03MB304879406DD7019080FF5163C5A79@PU1PR03MB3048.apcprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u+wXu45g1+ixNCGxoDr31XN9eoX7p+L4i42w4bpLLku1FtJ2kRm6lUp9Qi6MAXl+5PgV5ufGDTXjdfQ5RSVYpJOFG1etQmJAeddtiKEvaVrJHtyZktf1eDxrcbEluuTpBCJZFn46Wd1/hKkWbVKNRqIlOEALE8IE34ERHaJF7IzDBgaZKNsPutvgTBvswCp3cKGX87Tzl5Ke5VxWfP6FR3g7rLX50rNvARwek9L7SeD+NEBPp4GlrYCLO1PLclQecaHx/UpYRtLKdpAnsSbf7Lm96Yk2jLLLqvBDxqJ0W0fCM78xkf/kEhLbyE9qFTflKfCHkaK9gdQPv5u0kBQUhmC7EsrocePvBqdy3APqgJH2gfXYIizfm1zc5BzQmq5aGqmpCR3NOzHObtHwBGqYmHanUUzbSaUpayEsfgDCGprkxeVzALdOZVdRCs0HnmqVZX74gJOigXwIGmWG0OrNfNDN9tgt2I1vRHqlTVE5LhV0xZlemnpOnFHHFFjqAiLCFW9CVUS8Qgp758fBMQb4ClujNt9bBQFUHCsTQ3LagnNtlocFE1jef5ltJ/0ps8y+2kuI2MezOAkMq3JehPVo7YqNdX+cKcgNP9uzTB2bPOLb/SjVQVCfpw+jFa2Xc7XBx2R60aqLPTEn7ATV3cnVfD9Yiib1m6e9iwiACR+AL/KDwf6epOAqjl7k5Eq/811E5UZ2XO7zlHYYIcXiKWxQ/jgJkeB+Xm5dUC0C3gH0vf4odi/VM4lPJomPEmFQ6ndJEIaXu8Vmfe1RJiazvpVIV1/r+koe3wotweWu4mKkbLI=
X-Forefront-Antispam-Report: CIP:104.232.225.7;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.lenovo.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(81166007)(16526019)(70586007)(336012)(4326008)(356005)(83380400001)(70206006)(36756003)(53546011)(26005)(186003)(47076005)(16576012)(36860700001)(316002)(82310400003)(4744005)(2906002)(86362001)(31686004)(5660300002)(36906005)(8936002)(8676002)(31696002)(508600001)(110136005)(54906003)(426003)(2616005)(3940600001)(43740500002)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 16:50:16.3428
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f710b041-de46-4887-9b5c-08d981d6e239
X-MS-Exchange-CrossTenant-Id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5c7d0b28-bdf8-410c-aa93-4df372b16203;Ip=[104.232.225.7];Helo=[mail.lenovo.com]
X-MS-Exchange-CrossTenant-AuthSource: PU1APC01FT009.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1PR03MB3048
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



On 2021-09-27 11:12, Hans de Goede wrote:
> Hi Nicolò,
> 
> On 9/27/21 5:00 PM, Nicolò Piazzalunga wrote:
>> Hi,
>>
>> On 9/27/21 3:59 PM, Mark Pearson wrote:
>>> Do let me know if there are some important use cases for these so I can go back to the FW team and discuss supporting them properly.
>>
>> The important use cases are force discharge and inhibit charge.
>> These at present are dealt with using tpacpi-bat, which relies on (out of tree) acpi_call.
>> See also your previous reply.
> 
> I can see how those can be useful in certain circumstances.
> 
> I can also understand how Lenovo does not want these to be
> available by default everywhere.
> 
> I think a good compromise would be to add a bool module option
> which defaults to false to enable these.
> 
> Assuming Mark is ok with that, this is still blocked on agreeing
> on standard power_supply class property names for these 2 features.
> 
I'm OK with it. Thanks :)

Mark

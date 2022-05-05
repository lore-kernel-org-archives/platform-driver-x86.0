Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC009C433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu,  5 May 2022 17:56:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382550AbiEESAW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 5 May 2022 14:00:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243661AbiEESAV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 5 May 2022 14:00:21 -0400
Received: from mail1.bemta35.messagelabs.com (mail1.bemta35.messagelabs.com [67.219.250.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A76FE11C36
        for <platform-driver-x86@vger.kernel.org>; Thu,  5 May 2022 10:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com;
        s=Selector; t=1651773400; i=@lenovo.com;
        bh=7CwrZEsKGGZQkvXJSSEnXDtdrd2PZHt49GJIwVR2p5c=;
        h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
         In-Reply-To:Content-Type:Content-Transfer-Encoding;
        b=YhPqSw682JNdJPZI1EtpYu3jMWuuFlWAduP3NMan0FXUybIDu+8XYKRrHEodo0YDk
         oqlKlLIoSvPOh7xQszlz2rkYMpWaeXbLOSUzTd9x41MVktVMea1XEenjIGan5HPWNL
         ZEXan2MJeMh3suLdDQ+4MGXo8nXOXENWn63Qebr0mf5p6PblR8NYA7NLXfS5W+GEo/
         1nrA8m0H1rXlpVgOjMryOCsFGAavydpRtnY45gHEUJGXF8JRNK2r51I3cZpMEppy6m
         6EP5fWgIj5mR5dr+eW2bANX1WuqBo25AQH/3o6otgqoZlnqIOLedVTp4vqAVw52H7I
         oF+C+dkEwsoTg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIJsWRWlGSWpSXmKPExsWSoS9VqHuDvyT
  JYNZbJos3x6czWUzd3c9qcWDqNGaL1XteMFscejudzYHVY9OqTjaP9/uusnnMXnKDxePzJrkA
  lijWzLyk/IoE1oyX8xewFKwXq1hweilLA2O/UBcjFwejwFJmiWtb3rJAOItYJeasb2eEcDqZJ
  BZ1z2QDcYQEFjNJrJywhh3COcQk8eXFI6AeTg4JgeOMEt2r3CESnYwSu7f+gGrpZ5J42tEK1f
  KYUaK/Hca5yyjxrnU3O0g/r4CtRPfNI2wgNouAisSfo3OYIeKCEidnPgHbISoQLtG9fz8riC0
  sECFx8uBxsDizgLjErSfzmUBsEaCajbdmskLEIyWuPvrOBLHsG6PEohWLwZaxCWhLbNnyC2wZ
  p4CHxPopM5ggGjQlWrf/Zoew5SW2v4U4QkhAWeJX/3kgmwPoUTmJm8flIX5OkGiecpQRwpaUu
  HbzAjuELStx9OwcaLj4SuxvnwZl60r8edHICmHnSKydcArKlpM41XuOaQKj7iwkL89C8tosJN
  fNQnLdAkaWVYxWSUWZ6RkluYmZObqGBga6hoYmupaWusaGeolVuol6pcW65anFJbpGeonlxXq
  pxcV6xZW5yTkpenmpJZsYgekqpShZfgdjf/9PvUOMkhxMSqK8q4CJTIgvKT+lMiOxOCO+qDQn
  tfgQowwHh5IErz8vUE6wKDU9tSItMweYOmHSEhw8SiK8cYxAad7igsTc4sx0iNQpRmOOK9v27
  mXmuHToyl5mIZa8/LxUKXHex1xApQIgpRmleXCDYCn9EqOslDAvIwMDgxBPQWpRbmYJqvwrRn
  EORiVh3mMgt/Jk5pXA7XsFdAoT0CnH4gtBTilJREhJNTDJFq27Xnx6xeNnEU9T+2Q48iR/v0y
  ZNyViAft+zV/e3CxnYif8uRJZ01/W3PLtReHKt6LT2u3Pva2yz5ubEiT2Rfh0xuTtH+rfWcor
  MqdNmVBkrrzN8jhzr/Eh6X7D0qjbXI8NNF9qOXX4lYVrzv6stc+Wzcfl0xWH+i31Jlc2/EtwL
  PqdL9P3I/7PyxUrWb2unuV6zHlO5MCj19rdCtxHVhY0/Dog94CZtc7+4vJ1xacfzDnKfXF3uL
  ZcVMtaaYVYhUq7zKuxXaIqX9um/l9a6CN5UdAnVXFl97UNwj4v847+Px4VxFL1/+t1kSSm5ZU
  vBA9OOey+pSr4vZio4QXlM7VVFdv23te7zrr463MlluKMREMt5qLiRAA1Suh/ZAQAAA==
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-14.tower-655.messagelabs.com!1651773398!17047!1
X-Originating-IP: [104.47.26.113]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11545 invoked from network); 5 May 2022 17:56:39 -0000
Received: from mail-sgaapc01lp2113.outbound.protection.outlook.com (HELO APC01-SG2-obe.outbound.protection.outlook.com) (104.47.26.113)
  by server-14.tower-655.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 5 May 2022 17:56:39 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XDHo1h3/iNbdhvtdPebJ4mypvMGfJQlcJHGlQ7RMR8L2gxiyESOr2vPdwqQK1eGkfWcuZ8bhRN1QWR4xCN0qG/03OTjyvc6/opoFh2l9WuaBAs5YLR5OBFjUTvgcecGtPg48F0VmL62amxnLGw2RtRIHq54WzXw2vZsOsaTq+6Ic3eTsLiBmPa/ePtdYaQyEk7HISzRvYdtPpVqD0ygGa88Chf99dTV5nBjwTXvATrP8z0SpgRgi+UU2Qoordfs4nooUgZzLbEkKHfYR6PF2p19tHApqnhXKQenEVm90Hr8CGjlPcwhX2OkF1QzB5AnGCyg6sxOm+dB+jj5ZgEan3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7CwrZEsKGGZQkvXJSSEnXDtdrd2PZHt49GJIwVR2p5c=;
 b=Pa3VXuciS6vmOXbMT95g1yTfg+akxvKMxvfW/dlk1K5y6TBMKRspDCq8BK+QjvbsqiRycFpzdcrDtyMChVtnAcEj7oT6VE/S24C/lST46luZRxJ2AT0zOEno8mTH0wim/HvBxCG5wB17yejQNVQtqPi5YNpMiYPwLh7Ogzf+mbGndJL532MOn1UQJpfUN278IvLppCK8338Bf2fj/sTSDCNNgJFfwYE/BMSkweAfeScDHdmxjczxmLeA4xvAQ2zmZ5Pkd0ddbaVsFXEnHAr0K0IvviNXtXuHnBbB95aOiBFEK4bxOhqqFcrdIUpuyFEf0v6rbBXj4lHYZn93Qv+fFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 104.232.225.6) smtp.rcpttodomain=redhat.com smtp.mailfrom=lenovo.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=lenovo.com;
 dkim=none (message not signed); arc=none
Received: from PS1PR01CA0024.apcprd01.prod.exchangelabs.com
 (2603:1096:300:75::36) by TYZPR03MB6646.apcprd03.prod.outlook.com
 (2603:1096:400:1f5::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.6; Thu, 5 May
 2022 17:56:37 +0000
Received: from PSAAPC01FT028.eop-APC01.prod.protection.outlook.com
 (2603:1096:300:75:cafe::37) by PS1PR01CA0024.outlook.office365.com
 (2603:1096:300:75::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.27 via Frontend
 Transport; Thu, 5 May 2022 17:56:37 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 104.232.225.6) smtp.mailfrom=lenovo.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=lenovo.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 lenovo.com discourages use of 104.232.225.6 as permitted sender)
Received: from mail.lenovo.com (104.232.225.6) by
 PSAAPC01FT028.mail.protection.outlook.com (10.13.38.119) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.15 via Frontend Transport; Thu, 5 May 2022 17:56:36 +0000
Received: from reswpmail01.lenovo.com (10.62.32.20) by mail.lenovo.com
 (10.62.123.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.27; Thu, 5 May
 2022 13:56:34 -0400
Received: from [10.38.60.9] (10.38.60.9) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.27; Thu, 5 May
 2022 13:57:42 -0400
Message-ID: <5122d130-1d9c-6f70-8e6a-b267faf03cbe@lenovo.com>
Date:   Thu, 5 May 2022 13:56:33 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [External] Re: [PATCH] platform/x86: thinkpad_acpi: Correct dual
 fan probe
Content-Language: en-US
To:     Lyude Paul <lyude@redhat.com>,
        =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <thomas@t-8ch.de>
CC:     <hdegoede@redhat.com>, <markgross@kernel.org>,
        <platform-driver-x86@vger.kernel.org>
References: <markpearson@lenovo.com>
 <20220502191200.63470-1-markpearson@lenovo.com>
 <bcc78237-fa4c-4d9f-86a6-4d1a8ea0e0fe@t-8ch.de>
 <191b8c12-c04a-197c-d9e6-f510c738ba41@lenovo.com>
 <bb8fa51d02d84c2a912709f3e308e096b6fe7988.camel@redhat.com>
From:   Mark Pearson <markpearson@lenovo.com>
In-Reply-To: <bb8fa51d02d84c2a912709f3e308e096b6fe7988.camel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.38.60.9]
X-ClientProxiedBy: reswpmail01.lenovo.com (10.62.32.20) To
 reswpmail01.lenovo.com (10.62.32.20)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80d8a256-93b1-48d6-c5cb-08da2ec09974
X-MS-TrafficTypeDiagnostic: TYZPR03MB6646:EE_
X-Microsoft-Antispam-PRVS: <TYZPR03MB664699F6BD38FCF61F82B201C5C29@TYZPR03MB6646.apcprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U/e15TEGaCMDnSPL02bRLF2Hb+EWBEkoAqhm4JaAsvA6HSgfguob9aXH4H/vAmIDoZ/491eMFUpKBi9gox74461hNb88DuRozZ2Uz95hZ8P5irg2PF0C8eZC4O6cSCXxI/yKSy7Zj0KJTslofsniU57CK9JDrKewk9FD6VEMIZqdW3cBzIa2Bh2bGBUn5AsUXvkXXhZThm35oUFq0qEsvLF61khONqYnL8GVfZpe2r/cp9bt9HnZ0TZoPZ0qeNok6pFjjHVS9OFJteasSVeJwVHdcScpnlxup4sHZLAXtBCNTygMUemNdjDcgmjKvIaLjjjL8/I67LJY3ZttBtVTXZ8h5Q+khZwi1jXX2NHiMb6o5N8mw3/UBGAJUbmHFsWXJo4O6RfKQ1HBKiqKfasqHFpLMz3Pv1+GD4mYmAADKlF+ZIGdHApFlJx6Nt+GTvCiJMAKqVKqFQWTgFpsWQ8D2y/t4uYyz7X/wy0llk81Nk7p6o8L3BFORuiQSb7CvAVmz+zbWSvPnpF7SXpVgpVVMbXZTZEZYhMWp6LCWEhCLCk7BY7wf0XhYAIkp78H+FxTavTX5+5fGcUJl6sVntNRMI8GriAATFckgz6XffH+x4lAglvUrOukfSC/QU3brzytaGv2b1imqg+etVrnlM+mMbbU1clWbtf3N1Zao0t2XD3q2XFWQtcNC4ZE7zjHbhh3kKUEUYb6ABpMH5HZ/kUxhdBLOcz864P1z5XLbUZpqkJFacUcxrDaAfccPEuahtZFBi868/ikGeLsBTFAILoDAA==
X-Forefront-Antispam-Report: CIP:104.232.225.6;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.lenovo.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(70586007)(5660300002)(8936002)(70206006)(316002)(8676002)(4326008)(36906005)(336012)(6666004)(426003)(31686004)(47076005)(356005)(82960400001)(36756003)(86362001)(2906002)(81166007)(40460700003)(82310400005)(36860700001)(16576012)(110136005)(186003)(16526019)(53546011)(2616005)(54906003)(31696002)(83380400001)(508600001)(26005)(3940600001)(43740500002)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 17:56:36.4981
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80d8a256-93b1-48d6-c5cb-08da2ec09974
X-MS-Exchange-CrossTenant-Id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5c7d0b28-bdf8-410c-aa93-4df372b16203;Ip=[104.232.225.6];Helo=[mail.lenovo.com]
X-MS-Exchange-CrossTenant-AuthSource: PSAAPC01FT028.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB6646
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Lyude,

On 5/5/22 13:32, Lyude Paul wrote:
> So - no promises, but which laptops in particular did you need access to? I
> should have at least:
> 
> P50 (I think??? would have to double check this one), P1 2nd gen, X1 Extreme
> 2nd gen, and I think I may have access to a P51/P52.
> 
> As well, I only have a few old thinkpads (there may actually be a bunch in the
> boston office though). However, given how nice the older thinkpads are it's
> not too unlikely I could poke around my friends who still use ancient
> thinkpads and see if any of them have access to these. Problem is though the
> older IBM models seem to be the ones missing comments with the model numbers,
> so I'd probably need to know what those are. However, given how old these
> machines are feel free not to bother with it if identifying the model numbers
> looks to be too much work.
> 

From the list:

	TPACPI_QEC_IBM('1', 'Y', TPACPI_FAN_Q1), - no idea what this is
	TPACPI_QEC_IBM('7', '8', TPACPI_FAN_Q1), - ditto
	TPACPI_QEC_IBM('7', '6', TPACPI_FAN_Q1), - ditto
	TPACPI_QEC_IBM('7', '0', TPACPI_FAN_Q1), - ditto
	TPACPI_QEC_LNV('7', 'M', TPACPI_FAN_2FAN), - ditto
	TPACPI_Q_LNV('N', '1', TPACPI_FAN_2FAN), - ditto
	TPACPI_Q_LNV3('N', '1', 'D', TPACPI_FAN_2CTL),	/* P70 */ - I don't have
& not in lab
	TPACPI_Q_LNV3('N', '1', 'E', TPACPI_FAN_2CTL),	/* P50 */ - I don't have
- in lab
	TPACPI_Q_LNV3('N', '1', 'T', TPACPI_FAN_2CTL),	/* P71 */ - I don't have
& not in lab
	TPACPI_Q_LNV3('N', '1', 'U', TPACPI_FAN_2CTL),	/* P51 */ - I don't have
- in lab
	TPACPI_Q_LNV3('N', '2', 'C', TPACPI_FAN_2CTL),	/* P52 / P72 */ - have
P52 but not P72 (is in lab)
	TPACPI_Q_LNV3('N', '2', 'N', TPACPI_FAN_2CTL),	/* P53 / P73 */ - don't
have - in lab
	TPACPI_Q_LNV3('N', '2', 'E', TPACPI_FAN_2CTL),	/* P1 / X1 Extreme (1st
gen) */ - don't have - in lab
	TPACPI_Q_LNV3('N', '2', 'O', TPACPI_FAN_2CTL),	/* P1 / X1 Extreme (2nd
gen) */ - don't have - in lab
	TPACPI_Q_LNV3('N', '3', '0', TPACPI_FAN_2CTL),	/* P15 (1st gen) / P15v
(1st gen) */ - have P15, but not P15v (in lab)
	TPACPI_Q_LNV3('N', '3', '7', TPACPI_FAN_2CTL),  /* T15g (2nd gen) */ -
don't have - in lab
	TPACPI_Q_LNV3('N', '1', 'O', TPACPI_FAN_NOFAN),	/* X1 Tablet (2nd gen)
*/ - don't have

For the ones in the US lab so I can get one of my US colleagues to chew
thru them on a quiet day (whenever that happens...). We may be able to
'borrow' systems from the Windows teams for the P70, P71 and maybe X1
Tablet - but they do get a bit annoyed with us because we keep returning
them with a superior OS installed.

I figure given I can't reasonably fix the early platforms I should
refactor the code anyway - and then fixing the ones that are still there
becomes a low priority exercise for a rainy day. At least the list will
stop growing.

I thought I had too many systems - but going thru the list now I'm not
so sure :)

Mark


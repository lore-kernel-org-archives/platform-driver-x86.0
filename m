Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98AD1C433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 24 Nov 2021 18:54:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244460AbhKXS5i (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 24 Nov 2021 13:57:38 -0500
Received: from mail1.bemta24.messagelabs.com ([67.219.250.5]:37783 "EHLO
        mail1.bemta24.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236702AbhKXS5h (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 24 Nov 2021 13:57:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com;
        s=Selector; t=1637780067; i=@lenovo.com;
        bh=uFcLVBzlcntjKC5w/AADale8T4Gsg1roZoe4Spo+k4c=;
        h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
         In-Reply-To:Content-Type:Content-Transfer-Encoding;
        b=uCzfHqDYU//ZipGeZceaKv3q/mHcMNRnzUVbOJDnrQHpTReWj6mn9jxQWVwwwWUcA
         xFqbJOTwk7Y8iqHqhViWHLgXqCJr3bNrewoJMfknzvp6MBhpf3h8MvgRFBff6dyXXd
         4e2JjEAkP7gSun+GOXZE9xkPh32bMgWd195wI54dqzMHhfeWnBew6UVyj1a/BClxHv
         TUgDmxOZFKkxUEa0wLeTUfPnf3isEoYW8MAj+PNKhn/8uMOxvPYDYz/Zwy+LVVPcmt
         JUQ64zqq86GpVdMwPqOIbhin2TDbLLNhBj9+MuNLksGFArVns9rXLmS/r6FNE8c0SU
         C4bEvhSsjVQxg==
Received: from [100.112.129.12] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-5.bemta.az-a.us-west-2.aws.symcld.net id 68/40-25200-36A8E916; Wed, 24 Nov 2021 18:54:27 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMJsWRWlGSWpSXmKPExsWSoS+lpZvUNS/
  RYM4EQ4tJM/4zW7w5Pp3J4sDUacwWq/e8YHZg8di8Qstj06pONo/3+66yeXzeJBfAEsWamZeU
  X5HAmnH3d2bBd+6KT73NTA2MHzm7GLk4GAWWMkusmbybCcJZxCrx9sYXdgink0liUfdMNhBHS
  GABk8SCQ49ZIJzDTBIbd20Hcjg5JASOM0p0r3KHSHQySuze+oMNJCEk0M8kcfq3NUTiCaNEz+
  YtrBDOI0aJ1ds2MYNU8QrYSryf9B9sFIuAqkTfo1dQcUGJkzOfgMVFBcIlzq66DRYXFgiSeP3
  oEZjNLCAucevJfCYQW0SgUOLw3VWsEHFNiWdtHYwQV1hKLFncxg5iswloS2zZ8gvsOk4BK4kr
  197A1bdu/80OYctLbH87hxmiV1niV/95Zog3FSQmbbrLDmEnSPT8e8QGYUtKXLt5ASouK3H07
  BxosPhKnL07F8rWkpgw8RMrhJ0j0XrjNdRMVYkHV78zT2DUm4Xk5VlIXpuF5LxZSM5bwMiyit
  EiqSgzPaMkNzEzR9fQwEDX0NBI19DYQNfI0FIvsUo3Ua+0WLc8tbhE10gvsbxYr7gyNzknRS8
  vtWQTIzA1pRQ03d7B+O/1B71DjJIcTEqivGwF8xKF+JLyUyozEosz4otKc1KLDzHKcHAoSfCu
  LQfKCRalpqdWpGXmANMkTFqCg0dJhNe7DSjNW1yQmFucmQ6ROsVozzHh5dxFzByXr88Dkl09C
  4HkpCO7tzMLseTl56VKifNydQK1CYC0ZZTmwQ2FpfVLjLJSwryMDAwMQjwFqUW5mSWo8q8YxT
  kYlYR5mUGm8GTmlcDtfgV0FhPQWb17ZoOcVZKIkJJqYBKJrdr8USP4kaTk5tRvEzw4uzIf37+
  maR3R5bZt3oU/Ga2v2TYWb33zKj813NSS5QtPd/ixhOqk6ROYp8h0ng38yn0j0XS/9yLDRXGH
  7Swuu/scEvdZE/5EuSl5pUzK+9YJXSnbbCVXXVKdIM3W82Lyo0kKbCFG8htP8D3lv7TAOPKho
  9rm53sO1GkKFR+f3zKz/kMJm5/wgquVUZ2q93yYHA8sbvh4NnHrfWWh/QIPxAL4+h4d28lub7
  /3ZkZF3+m3PyeFvZ6R/GHZ2087Np879dJ2xd1OLSZNNoGDwpLPrqm8XzbtesXm+7Y9ErIbky+
  uinVWflk58f7mnpseU+qnpPhfNCoMjS9ilyziz1FiKc5INNRiLipOBAA3TLFjZgQAAA==
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-13.tower-336.messagelabs.com!1637780065!19983!1
X-Originating-IP: [104.47.26.42]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23287 invoked from network); 24 Nov 2021 18:54:26 -0000
Received: from mail-psaapc01lp2042.outbound.protection.outlook.com (HELO APC01-PSA-obe.outbound.protection.outlook.com) (104.47.26.42)
  by server-13.tower-336.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Nov 2021 18:54:26 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WkKGBD+Sq4CvAqBCebrOAdtuAtDVgiOZW14ic4KHfQCzE2YdRNsiy78z4kSCd/tQesIxx8wnePUwqS/22Zbn941SRs5+U5t3OiWHSr44oaqPqy8OOx1bXveb2nq9vNJe76/bDTFvUGf4lYzSbpjFngOPcsfeM/rMNIOuItja++Et6K1HInqZTtVgkBOPkAgWXj2T+fY8SgCzdvsM5RnepJTciTv5YATIUaqvK8zFaVkcK2VVP82+F1vzd53w8g69FakfecCot1nOUqtGTUqQAHSOsq8z977RpdxO3DSskv0d8qDrigaZ8JiLJf4GIeKBkJ7OiI5cEo/3tExpDedlMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uFcLVBzlcntjKC5w/AADale8T4Gsg1roZoe4Spo+k4c=;
 b=aapj0hjqg7WCVAQ/UABb0b/SyRnw17YlfbfGNPNGpZhEhUiT20B1/VupVVx5QOozYdYOoOJ6a4Faky415ZPbqXpT9/yjJbYJMSretuV4Zj9ckstGmDpAEjIlxVxCol1up58sfy41744iPZj3tzUCYUPHO3TUzDKu79BCwHmiIpQ67LbTCips/GkHtZCoBJuWaaUENKxQ5qZm4tObX7VBj7SZXkg62cyxZpY5alUCHpm2nSQIK+a/+xwjbJdmItDfKvE+8jJ4AhqnblbnE2D+R6pmcnHUSlXJiDilPKg0eQVD3d1pQ6pcsXWaw5Yw1Eo+WZbaV2BE21fsFLZXzUv9lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 104.232.225.6) smtp.rcpttodomain=redhat.com smtp.mailfrom=lenovo.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=lenovo.com;
 dkim=none (message not signed); arc=none
Received: from PS1PR0601CA0091.apcprd06.prod.outlook.com (2603:1096:803:1::17)
 by KL1PR03MB5112.apcprd03.prod.outlook.com (2603:1096:820:1e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.14; Wed, 24 Nov
 2021 18:54:24 +0000
Received: from PSAAPC01FT027.eop-APC01.prod.protection.outlook.com
 (2603:1096:803:1:cafe::71) by PS1PR0601CA0091.outlook.office365.com
 (2603:1096:803:1::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20 via Frontend
 Transport; Wed, 24 Nov 2021 18:54:24 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 104.232.225.6) smtp.mailfrom=lenovo.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=lenovo.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 lenovo.com discourages use of 104.232.225.6 as permitted sender)
Received: from mail.lenovo.com (104.232.225.6) by
 PSAAPC01FT027.mail.protection.outlook.com (10.13.38.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.20 via Frontend Transport; Wed, 24 Nov 2021 18:54:24 +0000
Received: from reswpmail01.lenovo.com (10.62.32.20) by mail.lenovo.com
 (10.62.123.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.20; Wed, 24 Nov
 2021 13:54:22 -0500
Received: from [10.38.101.45] (10.38.101.45) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.20; Wed, 24 Nov
 2021 13:54:22 -0500
Message-ID: <a480685a-d5b8-c647-6f15-e89350d5f7ea@lenovo.com>
Date:   Wed, 24 Nov 2021 13:54:21 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [External] [PATCH 0/7] thinkpad_acpi: 1 bugfix + a bunch of
 cleanups
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>
CC:     <platform-driver-x86@vger.kernel.org>
References: <20211121191129.256713-1-hdegoede@redhat.com>
From:   Mark Pearson <markpearson@lenovo.com>
In-Reply-To: <20211121191129.256713-1-hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.38.101.45]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c94ef80-15e0-4c2b-bf5e-08d9af7bd570
X-MS-TrafficTypeDiagnostic: KL1PR03MB5112:
X-Microsoft-Antispam-PRVS: <KL1PR03MB5112E59BD9EC84CD6895B418C5619@KL1PR03MB5112.apcprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:983;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GOyiMK3FoZUPXbKdfQwu2juJ9+DBwmSvvp65v6IiHIO2AUO1TuLne4RyG5oNRCcawPQle8i4xl5z4Xankh6gglTt8jeey/6zmGHxUC73vsZE6sYIyIkhNnI98YwsxJtSJKqK7x8gM9ebpEyKP8zMCPSr75UBO63pnTmf54K4EwRjPIEpvwF1rlDxGY0eIn2IkQWgBYMQrfxasb5oyYcERt3sVQL2mFAYSSa1iqqtb0+q98HubjTE20RFdL8syJ9TbJyj+Xc7joWqCsES/Cmc6CNO4Y1UjcWKq6PA3Fj83t5w2mrVwC4tLhQljrPecywaj0bW5UkqEuzJMJFNYoOPOiKy/7E8w7qjKCjRYIKdaMi+LNPIbslZ+lPyDdAL9dth24QnIgXDFZvV3Ih1rFmzCCxXnKsSgdDCDDIldGj7bidFNwRkjauqVJ1mHz+4ISLVl2xB3GQ/nQzT7p/gJOhoG2HpzFuiFZAAdy84dybukU3IAJB1GQ6h+X7qeyUNMlTufGMgvxIopbk4HbHL0z6SLiGtM+ZKCWLSiCsBySXDXrEh16R+JbuGJ51DkSXwk0MzIJGzWyasn2wRP6SsouFw9Df00NB4OwlUAIKI7ynkqTi4JyTQturF6wLbyjPla4kFOecEFUwcbYvbqqP4A7bwgg//ADtFD6krbADu/28F6qwqVJYfbkektgndTFCz2Hcp6CsDQ9R8dLISb5SS6VvaFkXhf8uw4w96TNFqTSXG/RrwN0NpaDEFDBa6xT0udDbwmUGC91nhtYayK59FcMCLc8on3EecLzf/VfZU0eXJJ5I=
X-Forefront-Antispam-Report: CIP:104.232.225.6;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.lenovo.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(4001150100001)(53546011)(31696002)(81166007)(426003)(83380400001)(336012)(26005)(82960400001)(2616005)(8936002)(8676002)(47076005)(2906002)(4326008)(186003)(36906005)(356005)(5660300002)(110136005)(70206006)(31686004)(86362001)(82310400004)(508600001)(70586007)(36756003)(16576012)(36860700001)(316002)(16526019)(3940600001)(36900700001)(43740500002);DIR:OUT;SFP:1102;
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2021 18:54:24.1982
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c94ef80-15e0-4c2b-bf5e-08d9af7bd570
X-MS-Exchange-CrossTenant-Id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5c7d0b28-bdf8-410c-aa93-4df372b16203;Ip=[104.232.225.6];Helo=[mail.lenovo.com]
X-MS-Exchange-CrossTenant-AuthSource: PSAAPC01FT027.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB5112
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Hans

On 2021-11-21 14:11, Hans de Goede wrote:
> Hi All,
> 
> Here is a patch-series for the thinkpad_acpi driver starting with one
> important bugfix which fixes a bug introduced by commit 79f960e29cfc
> ("platform/x86: thinkpad_acpi: Convert platform driver to use dev_groups")
> in platform-drivers-x86/for-next which is causing the driver to not load
> at all on many devices.
> 
> Followed by a bunch of cleanup patches.
> 
> Please test and review.
> 
> Regards,
> 
> Hans
> 
> 
> Hans de Goede (7):
>   platform/x86: thinkpad_acpi: Accept ibm_init_struct.init() returning
>     -ENODEV
>   platform/x86: thinkpad_acpi: Make *_init() functions return -ENODEV
>     instead of 1
>   platform/x86: thinkpad_acpi: Simplify dytc_version handling
>   platform/x86: thinkpad_acpi: Cleanup dytc_profile_available
>   platform/x86: thinkpad_acpi: Properly indent code in
>     tpacpi_dytc_profile_init()
>   platform/x86: thinkpad_acpi: Remove "goto err_exit" from hotkey_init()
>   platform/x86: thinkpad_acpi: Fix thermal_temp_input_attr sorting
> 
>  drivers/platform/x86/thinkpad_acpi.c | 221 ++++++++++-----------------
>  1 file changed, 78 insertions(+), 143 deletions(-)
> 
Thanks for these - I didn't see any issues (I like the fix for ENODEV -
I remember that giving me a headache when we added the dytc feature and
it breaking older platforms)
I've tried them out on my P1G4 and everything looks good. I'll aim to
run it on a few other platforms as time allows

tested-by: Mark Pearson <mpearson@lenovo.com>

Mark

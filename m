Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E7D2C433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed, 26 Jan 2022 21:02:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231712AbiAZVCn (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 26 Jan 2022 16:02:43 -0500
Received: from mail1.bemta31.messagelabs.com ([67.219.246.114]:32916 "EHLO
        mail1.bemta31.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231654AbiAZVCk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 26 Jan 2022 16:02:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com;
        s=Selector; t=1643230959; i=@lenovo.com;
        bh=mSuODvGzbvlkAfbeDrNZnxtQBRStm2z8FiWODyDpzNU=;
        h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
         In-Reply-To:Content-Type:Content-Transfer-Encoding;
        b=rJ1NI/3aXrEJ/mNmDWR748CDy9BBoqXOXMyF+0ohXEeZu33HWAGpOJTyUdid/oOjq
         7LRbqwW/zyL4dBBNNTdOKyfiuXM9hOfBF+b1NF8WzSMOW9VQ/EmAIZ1GpcsHcQVWKk
         TAu90+9hRXNjDr9whsecGzC4SZFWMV579jEKYrzTtDlGtj6YfA0ov678obNZIwMDm6
         B0BsCKM6JJ3s82iLkcevNiaRvnw/qD7aj2htGU1THhBz5c/3MGtlLmR4j9ElOpR42G
         fB1AieXAzENYxRV19bNg9zVhkWsJbIK/DQ4pcanbXdWZVIs4kBUNrUQVHbwik8K7rG
         eqQNtq6Cpy0fQ==
Received: from [100.114.2.76] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-6.bemta.az-a.us-east-1.aws.ess.symcld.net id A6/4E-09493-FE6B1F16; Wed, 26 Jan 2022 21:02:39 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOJsWRWlGSWpSXmKPExsWSoS+lp/t+28d
  Eg3+fWC3eHJ/OZLF4/TJGiwNTpzFbrN7zgtmBxaP10l82j02rOtk83u+7yubxeZNcAEsUa2Ze
  Un5FAmvGp3/bWQveSVc871vA2MDYLNHFyMXBKLCUWeLG7XMsXYycQM4iVomXp20gEp1MEou6Z
  7KBOEICs5gktnzexgTh7GeSODrnNxtIi4TAcUaJ7lXuEIlORondW39AtfQzSXR2r2WBcJ4wSs
  ycsA7KecAo8bnjJytIP6+ArUTjyfXsIDaLgKrE02MQc3kFBCVOznwCdpaoQLjE/WefweLCAhU
  S0ztuMYPYzALiEreezGcCsUUE1CWmdvSwQcTjJfbdfQx17FtGia8n/jGCJNgEtCW2bPkFVsQp
  YCdxe9VKqEGaEq3bf7ND2PISzVtng8WFBJQlfvWfZ4Z4VF7i9Nx9TBB2gkTzlKOMELakxLWbF
  9ghbFmJo2fnsEDYvhLbWw4CPckBZOtKfLjuDRHOkXjwoBeqVU1ib9s3tgmMerOQvDwLyWuzkF
  w3C8l1CxhZVjFaJRVlpmeU5CZm5ugaGhjoGhqa6JroGppa6iVW6SbqlRbrpiYWl+ga6iWWF+u
  lFhfrFVfmJuek6OWllmxiBKaolCKW+TsYN/T81DvEKMnBpCTKm7v1Y6IQX1J+SmVGYnFGfFFp
  TmrxIUYZDg4lCd5JIDnBotT01Iq0zBxguoRJS3DwKInwWm8GSvMWFyTmFmemQ6ROMdpzTHg5d
  xEzx86j84BkV89CIDnpyO7tzEIsefl5qVLivK9ApgqAtGWU5sENhaX3S4yyUsK8jAwMDEI8Ba
  lFuZklqPKvGMU5GJWEedmA2UKIJzOvBG73K6CzmIDO+n3+HchZJYkIKakGpkVRDWq/sg/dOhD
  /t57LYZ/fdQlOrZwPgk0WE9wUVnDEbfBRDWsxfGm1vUM7z3RflXFazK+ES9sFu7f5Pe/fsqCw
  bLbcZJs5Qe2ef85pCpWxu7d59h69VSGlnFkXMqdxDcd2/fbKrvwzGg8TDE+kVfvfnTkp3cX8W
  VakmAS/i+WCaU8Fs8JelTd+mmYbbntrjlbS2skvDePUwqZr/Py8c8eq37Jvrt/X2Cuj9j4j+F
  KSpUuE7I8tbT26jMyvn9knx9y6Yn7xWajro/cL9RnqNz0KZWNYP6Mxdo5EOF+9pEaZ0a1v8nU
  PbSexLNDaExW/7/CbfXx8L1eKGt24doYxXV1fqvlaUdD33UYOaYFKLMUZiYZazEXFiQDOqyHC
  agQAAA==
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-11.tower-706.messagelabs.com!1643230957!23443!1
X-Originating-IP: [104.47.26.46]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20166 invoked from network); 26 Jan 2022 21:02:38 -0000
Received: from mail-psaapc01lp2046.outbound.protection.outlook.com (HELO APC01-PSA-obe.outbound.protection.outlook.com) (104.47.26.46)
  by server-11.tower-706.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 26 Jan 2022 21:02:38 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RCh9o6dVjbbkxH7dDyEwZ3195tHa/dWtX25zmEzQAwHLcVL5+01V4MKDWM4nqOvpUXIOhET6+8tO6CWs/mi+Ymv/CGmzJKUYWPhsmSXQtwC9RbiKczgZAlcFmKhf1QFfb2EFfhaZWPTOJK30bsJscbz0iXWGWi4exI/pQ//BZC1zv35xtY6zB2WFJhxEebUvNeb4UexdGP1gFR1z3hNlxgdfVZZ1YnNMLXwLUp09z1GiYLqS9JFrZCyGytClb28k+/l8TvUeqdDH4XuAkCEZ4crhVhP4SzRpcFWcOiH+ogHj0A5dR3cQ5X4xSf+Kh9A+zZV++3cPtBsH+paYPGLQnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mSuODvGzbvlkAfbeDrNZnxtQBRStm2z8FiWODyDpzNU=;
 b=nUNjZQ9wnXzGtYfdTnrtvRy8ZuwTWBwg6ACnr2aeokBbfUbR63xHBwqMhl2CNmT3oYVTZfE8mMAP7524j7dyyygK/YU0c9w63GL9V3FnGuSCTwM60EVyNfCjo6rTBu2CSxWStHZmQjH0epaDJZNcNQEyFm/a1ssWptREIRD8QEgzb46tqkRVIZCUzlJNN/fXjus2dRCB7RxbVClh0dbfPnJ3TI51atviQOdxdIkTzGoS6I48NPUzXE00hgZDvebHPP1FUZJgBYVpf8wFUQ/Gfm7Ucc6DDctbjdCgWh9DfxtV5GquddUh8ItCICasZE8NUFqKBq3WbvBENKI4HtH2Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 104.232.225.6) smtp.rcpttodomain=redhat.com smtp.mailfrom=lenovo.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=lenovo.com;
 dkim=none (message not signed); arc=none
Received: from PSBPR02CA0002.apcprd02.prod.outlook.com (2603:1096:301::12) by
 KL1PR03MB4805.apcprd03.prod.outlook.com (2603:1096:820:15::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4951.5; Wed, 26 Jan 2022 21:02:35 +0000
Received: from PSAAPC01FT010.eop-APC01.prod.protection.outlook.com
 (2603:1096:301:0:cafe::64) by PSBPR02CA0002.outlook.office365.com
 (2603:1096:301::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17 via Frontend
 Transport; Wed, 26 Jan 2022 21:02:35 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 104.232.225.6) smtp.mailfrom=lenovo.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=lenovo.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 lenovo.com discourages use of 104.232.225.6 as permitted sender)
Received: from mail.lenovo.com (104.232.225.6) by
 PSAAPC01FT010.mail.protection.outlook.com (10.13.39.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4930.15 via Frontend Transport; Wed, 26 Jan 2022 21:02:34 +0000
Received: from reswpmail01.lenovo.com (10.62.32.20) by mail.lenovo.com
 (10.62.123.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.21; Wed, 26 Jan
 2022 16:02:32 -0500
Received: from [10.38.62.98] (10.38.62.98) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.21; Wed, 26 Jan
 2022 16:02:32 -0500
Message-ID: <a38ab105-ed3b-4ac6-7e0e-5ef2026cd5b1@lenovo.com>
Date:   Wed, 26 Jan 2022 16:02:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [External] Re: [PATCH] platform/x86: thinkpad_acpi: Fix incorrect
 use of platform profile on AMD platforms
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>
CC:     <markgross@kernel.org>, <platform-driver-x86@vger.kernel.org>,
        <mario.limonciello@amd.com>
References: <markpearson@lenovo.com>
 <20220121201722.3423-1-markpearson@lenovo.com>
 <cedb4ef6-867b-7c00-2f77-1ad7b07c5aa2@redhat.com>
 <a3df9ada-29d1-d172-6144-2093fa345366@lenovo.com>
 <85f50641-fc14-ee82-81b0-d2f72c022c6b@redhat.com>
From:   Mark Pearson <markpearson@lenovo.com>
In-Reply-To: <85f50641-fc14-ee82-81b0-d2f72c022c6b@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.38.62.98]
X-ClientProxiedBy: reswpmail01.lenovo.com (10.62.32.20) To
 reswpmail01.lenovo.com (10.62.32.20)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ed1921f-9e27-4933-3ca2-08d9e10f2d3f
X-MS-TrafficTypeDiagnostic: KL1PR03MB4805:EE_
X-Microsoft-Antispam-PRVS: <KL1PR03MB4805E367A59DB64C07094BD9C5209@KL1PR03MB4805.apcprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fel/0wmbkp3zvYkhW5ttF1z0q0/pIoq3NFTHWvQr57JZ4R8Hyiv2nbRmujCPYskRVZOtZOt5u7lXd8E3slir09LQZfwr5av24Q3ZsAlWqZJl98FQuRXnGvFCVXU8s4YbmlfdBRLv6iMp3rYH0CIHAZcCjWemb+6JP3NocP7xZkwlgylgsiRgX1W6UrJa3gdLATarBPtIJYrCFRqH+BRZKDTX/+5unWPRqmBh1juuZE9saCRuYO6NIJJDuATBrwjm7owEvKusJCuYQiXUasA4rYEAu4TDpxdBZoikpDoHpVMvMgy4XCgDlR2Hw6NkUklUHdgf/fJ39533bd5rPuqeV1aHW6hXMRO5z0E2Xbfs1Iy/uKAVa20NnvGhHySL+Ke882fRok6mu9DJEJj7PuMkBO95eVF1KDrs2o/pjY7xhkA8KNbHQ7yeuHLypSREjt0MLe0fN13MRbOlQkGe55d+mw+0go+VLfVejSih2sLs/EkSXTF+C7nGvUFdtC1EEuavdhQUV/haHRyh8b60GZyvwJ84lc7Hm/XnsChMowakBnBbZRLvSsFoGvfnyKMKmT0kguBLF+6FH4zm4p0U075EhGfny9pQEA7umd71TDwtNjxExPi7B5wruY+JpbqdEOq539kaASVliP+XPEuan2arcPhvd6AYLMvTiQmL/CfVM0HSyH50aTF1L7xWn8TeRv464NtukWms63Lhi5SzreOCN5m9pvzHZUELvHbhl7kSa9RL5qFNVcedXHZQoVvBTRY3McUknv7riDY57gGCDbfQsMOudwwyKx3kSk4yv3Dt7lcHWGFyI1oaUhxHHqa9QEFduGy2Grm/jybHw8jYvQ0wgj+qXCBR2X6OCncylI6h/90=
X-Forefront-Antispam-Report: CIP:104.232.225.6;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.lenovo.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(82960400001)(86362001)(2906002)(356005)(81166007)(2616005)(40460700003)(53546011)(36756003)(966005)(5660300002)(31686004)(508600001)(26005)(186003)(82310400004)(316002)(54906003)(83380400001)(336012)(426003)(47076005)(16526019)(6916009)(36860700001)(8936002)(8676002)(4326008)(70206006)(70586007)(31696002)(16576012)(36906005)(3940600001)(43740500002)(36900700001)(20210929001);DIR:OUT;SFP:1102;
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 21:02:34.5139
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ed1921f-9e27-4933-3ca2-08d9e10f2d3f
X-MS-Exchange-CrossTenant-Id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5c7d0b28-bdf8-410c-aa93-4df372b16203;Ip=[104.232.225.6];Helo=[mail.lenovo.com]
X-MS-Exchange-CrossTenant-AuthSource: PSAAPC01FT010.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB4805
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


On 1/26/22 15:03, Hans de Goede wrote:
> Hi,
> 
> On 1/26/22 17:49, Mark Pearson wrote:
>>
>> On 1/24/22 05:42, Hans de Goede wrote:
>>> Hi Mark,
>>>
>>> On 1/21/22 21:17, Mark Pearson wrote:
>>>> Lenovo AMD based platforms have been offering platform_profiles but they
>>>> are not working correctly. This is because the mode we are using on the
>>>> Intel platforms (MMC) is not available on the AMD platforms.
>>>>
>>>> This commit adds checking of the functional capabilities returned by the
>>>> BIOS to confirm if MMC is supported or not. Profiles will not be
>>>> available if the platform is not MMC capable.
>>>>
>>>> I'm investigating and working on an alternative for AMD platforms but
>>>> that is still work-in-progress.
>>>>
>>>> Signed-off-by: Mark Pearson <markpearson@lenovo.com>
>>>> ---
>>>>   drivers/platform/x86/thinkpad_acpi.c | 13 +++++++++++++
>>>>   1 file changed, 13 insertions(+)
>>>>
>>>> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
>>>> index 9c632df734bb..42a04e44135b 100644
>>>> --- a/drivers/platform/x86/thinkpad_acpi.c
>>>> +++ b/drivers/platform/x86/thinkpad_acpi.c
>>>> @@ -10026,6 +10026,9 @@ static struct ibm_struct proxsensor_driver_data = {
>>>>   #define DYTC_CMD_MMC_GET      8 /* To get current MMC function and mode */
>>>>   #define DYTC_CMD_RESET    0x1ff /* To reset back to default */
>>>>   +#define DYTC_CMD_FUNC_CAP     3 /* To get DYTC capabilities */
>>>> +#define DYTC_FC_MMC           27 /* MMC Mode supported */
>>>> +
>>>>   #define DYTC_GET_FUNCTION_BIT 8  /* Bits  8-11 - function setting */
>>>>   #define DYTC_GET_MODE_BIT     12 /* Bits 12-15 - mode setting */
>>>>   @@ -10253,6 +10256,16 @@ static int tpacpi_dytc_profile_init(struct ibm_init_struct *iibm)
>>>>       if (dytc_version >= 5) {
>>>>           dbg_printk(TPACPI_DBG_INIT,
>>>>                   "DYTC version %d: thermal mode available\n", dytc_version);
>>> This code has been refactored and this will not apply as is:
>>>
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/platform/x86/thinkpad_acpi.c?id=0b0d2fba4f3302b601c429c9286e66b3af2d29cb>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/platform/x86/thinkpad_acpi.c?id=798682e236893a20e5674de02ede474373dd342d>>>>
>>> Please rebase on top of 5.17-rc1
>> My apologies - I thought I was on the latest. Will rebase
> 
> No problem.
> 
> 
>>>
>>>> +
>>>> +        /* Check what capabilities are supported. Currently MMC is needed */
>>>> +        err = dytc_command(DYTC_CMD_FUNC_CAP, &output);
>>>> +        if (err)
>>>> +            return err;
>>>> +        if (!test_bit(DYTC_FC_MMC, (void *)&output)) {
>>>> +            dbg_printk(TPACPI_DBG_INIT, " DYTC MMC mode not supported\n");
>>>> +            return 0;
>>> This should be return -ENODEV;
>>
>> I'll double check, but I don't think we want an error here as we want to continue on, it's just the feature is not supported so 0 is OK?
> 
> -ENODEV is treated as "feature not supported" and will not cause any
> errors be printed and probing will continue normally with an -ENODEV
> error.
> 
> Where as 0 will still cause the corresponding exit function to get
> called on module unload, causing platform_profile_remove() to get
> called even though we never registered the platform_profile handler.
> So -ENODEV is better.
> 
Ah - my bad. I'll correct that.
Thanks!
Mark

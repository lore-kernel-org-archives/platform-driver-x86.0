Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E005C2BA4C
	for <platform-driver-x86@archiver.kernel.org>; Wed, 26 Jan 2022 16:49:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236704AbiAZQtz (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 26 Jan 2022 11:49:55 -0500
Received: from mail1.bemta35.messagelabs.com ([67.219.250.113]:25634 "EHLO
        mail1.bemta35.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236507AbiAZQtz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 26 Jan 2022 11:49:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com;
        s=Selector; t=1643215795; i=@lenovo.com;
        bh=UGvyWNUmIqjaaiINmznrRz19W3rWjTHMDDJkVOyaDfo=;
        h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
         In-Reply-To:Content-Type:Content-Transfer-Encoding;
        b=QzUrlEIq5mHESXVt89uYaS2BfFXb1sdsdYxAFumLtPy+Q+1vVuVSdsP5/pY5K5hDB
         zIUFWA+hnjtLNimNf2isxAOrKoR+FoFvQFxO3kUXxQCSRv7I9fZ6l1bRauAlo7v6YF
         cHQqcIiPi251cNULOYzH4kgW5DHb+kaq77epM7hOKnO44v+MtsmxV6cymUuj0giF6Q
         CvrO+UagA3AIj5kEpZScbmYVQyuam9oVeyxEnz9WXfjafFx2xbf12TNRIjL4/uqz7W
         yImgAVsoG8zhzyczdhb0/Jx9PwoDmeiR+StgDOHb3+M2vDtKHmQYfjwaLcFwF0GSVu
         nchGZaioVC//Q==
Received: from [100.114.102.156] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-5.bemta.az-a.us-west-2.aws.ess.symcld.net id C5/47-13492-2BB71F16; Wed, 26 Jan 2022 16:49:54 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrFJsWRWlGSWpSXmKPExsWSoS9lqLup+mO
  iwZwvEhZvjk9nsli8fhmjxYGp05gtVu95wezA4tF66S+bx6ZVnWwe7/ddZfP4vEkugCWKNTMv
  Kb8igTVj34SlzAXLRCum9m9ib2B8KtjFyMXBKLCUWeJQ2yZGCGcRq8Sbh7/YIJxOJonJ8+6xg
  zhCAjOZJO69ew/l7GeSaO2+wAziSAgcZ5ToPrSOCSLTySjx49Upli5GTiCnn0niyQFmiMQTRo
  mvG0+yQTgPGCXWzjjBDlLFK2Ar8XPJI1YQm0VAVeLDoweMEHFBiZMzn4BNEhUIl7j/7DMbiC0
  sUCExveMWM4jNLCAucevJfCYQW0RAXWJqRw8bRDxeYt/dx0wQV7QzSjQfiwCx2QS0JbZs+QVW
  wylgJ3H95F5WiHoLicVvDrJD2PIS29/OYYboVZb41X8ezJYAip+eu48Jwk6QaJ5ylBHClpS4d
  vMCO4QtK3H07BwWCNtX4tKsaawQtq7Ezks9UHaORHf/Q6g5ahLHb/5gn8CoNwvJy7OQvDYLyX
  mzkJy3gJFlFaNNUlFmekZJbmJmjq6hgYGuoaEJmDYyttBLrNJN1Cst1i1PLS7RNdJLLC/WSy0
  u1iuuzE3OSdHLSy3ZxAhMVClFKe92MP7t+6l3iFGSg0lJlFfI9WOiEF9SfkplRmJxRnxRaU5q
  8SFGGQ4OJQneuHKgnGBRanpqRVpmDjBpwqQlOHiURHgZKoHSvMUFibnFmekQqVOM9hwTXs5dx
  Myx8+g8INnVsxBITjqyezuzEEtefl6qlDhvShVQmwBIW0ZpHtxQWJK/xCgrJczLyMDAIMRTkF
  qUm1mCKv+KUZyDUUmYtw9kCk9mXgnc7ldAZzEBnfX7/DuQs0oSEVJSDUzRbE+8g7bcn39n46P
  wn/YzGPdL6DxZ3uogzuFiso/l0o4z+ouWzLVc2pcm8OvzyWcZOdKLu+Icr3ZaHfrFvlc0yG/T
  6X7XNVM/bj58uTJu4SoFiV9tB6wvnmFzWSglJMT/cM3Vffu8mh1/X1L6XcKXZCxVyh79tnVeY
  hzX0fcXbLbJ9uleMJe23xohcbvNvOq4tNjMwtd/Vy1TLvq++eyBB3sWvvDdqXNKvT72R5XvtO
  MM3ZpzGQxexM27wiVQYrXixgIfxp73vOmzTmxPzvrNfne+FMvE13yMQY7r5Cti5t5NfrC5/qR
  FKOvjq0Jn29fsvBfXJ5uhvM9mV/rLZwySp8q+6UapHwuO85p7zOCZEktxRqKhFnNRcSIAdDXn
  sm0EAAA=
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-15.tower-636.messagelabs.com!1643215793!13963!1
X-Originating-IP: [104.47.26.49]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4332 invoked from network); 26 Jan 2022 16:49:54 -0000
Received: from mail-psaapc01lp2049.outbound.protection.outlook.com (HELO APC01-PSA-obe.outbound.protection.outlook.com) (104.47.26.49)
  by server-15.tower-636.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 26 Jan 2022 16:49:54 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lg1Rxoi32UGfwYv3PjvbR/VxDO8o1QnxieQk7aaearP1mR0O1E350y6mdSrrAJR5PibEiCEJGhGlHdy7sgR+dfXeawbAulSlbPmQEw1tec4cxTRQMCOhUriKNPemqlnRgLj1tdj8gxmUvNj6cuCLVQCS7w2CPH0J7nqlfzw1+mMWXQM+FMRY7RmpjhvMEsGVfO4yyDGJ77PdwR1gZqEmp9MUXs5rKnI0ltmIHknaYkmz1/Fk3Tu0FN3dwBjgfFeTlkK0UviNMznXCwI6leyZ3VzEk3yaY0hIRYPzVbxOy2y5CqbXFT6u2KydXcVpBwlTLFKKVsU9PoyJEkdBv57dcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UGvyWNUmIqjaaiINmznrRz19W3rWjTHMDDJkVOyaDfo=;
 b=nLpGUZogJouSD3AmG9TtFRjEYPHp0dMPw+bgNa8Vme3BC2cJjNLchd2TJgQKk8M4sdahJJowYLT3exyj/jEmiFj90T0OVy6RXJrMp+A1of0treT+CaKsSOvyuJA7NSArZc2ZLBZ+m8da9C8JDxR3e+AsWPww1Id43pHaesgWBVKIfxrWNMs4R1Jyhu2P4x/r1VkLaC4yU5sCtKa3XAarNxeUTQXgIR3zIZYQCHaFQdPYgZPdtMz5urnajAEcAZblAhU9JvaVLLJCA9qZx5GHcg6YOteSZ1cvJXCd9Bk47A6jf58KlevzpteaRs+oUIl9vSv7UpkM9QgSX+jpPs7plA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 104.232.225.7) smtp.rcpttodomain=redhat.com smtp.mailfrom=lenovo.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=lenovo.com;
 dkim=none (message not signed); arc=none
Received: from SL2P216CA0091.KORP216.PROD.OUTLOOK.COM (2603:1096:101:3::6) by
 KL1PR03MB6198.apcprd03.prod.outlook.com (2603:1096:820:91::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4930.8; Wed, 26 Jan 2022 16:49:51 +0000
Received: from PSAAPC01FT003.eop-APC01.prod.protection.outlook.com
 (2603:1096:101:3:cafe::8) by SL2P216CA0091.outlook.office365.com
 (2603:1096:101:3::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15 via Frontend
 Transport; Wed, 26 Jan 2022 16:49:50 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 104.232.225.7) smtp.mailfrom=lenovo.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=lenovo.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 lenovo.com discourages use of 104.232.225.7 as permitted sender)
Received: from mail.lenovo.com (104.232.225.7) by
 PSAAPC01FT003.mail.protection.outlook.com (10.13.38.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4930.15 via Frontend Transport; Wed, 26 Jan 2022 16:49:49 +0000
Received: from reswpmail01.lenovo.com (10.62.32.20) by mail.lenovo.com
 (10.62.123.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.21; Wed, 26 Jan
 2022 11:49:48 -0500
Received: from [10.38.62.98] (10.38.62.98) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.21; Wed, 26 Jan
 2022 11:49:47 -0500
Message-ID: <a3df9ada-29d1-d172-6144-2093fa345366@lenovo.com>
Date:   Wed, 26 Jan 2022 11:49:46 -0500
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
From:   Mark Pearson <markpearson@lenovo.com>
In-Reply-To: <cedb4ef6-867b-7c00-2f77-1ad7b07c5aa2@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.38.62.98]
X-ClientProxiedBy: reswpmail01.lenovo.com (10.62.32.20) To
 reswpmail01.lenovo.com (10.62.32.20)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b0af583d-6ad3-4cc0-5754-08d9e0ebde5f
X-MS-TrafficTypeDiagnostic: KL1PR03MB6198:EE_
X-Microsoft-Antispam-PRVS: <KL1PR03MB619838D850D719E242E027C3C5209@KL1PR03MB6198.apcprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fCpMSiN3yg3kaJ1xLNnRpV6JgTYBYInDJosYgm3ptUxmKjfHJxQBvq3/fYXU1IrEpd9cdB/w++0PR/hsXhGZmIOLjpo+qiqZhEeS0UC63h796yqOybHvDCRsV0iDbRFKYHlAOzZ7uS8M6f3mHSnE9aeLVNm4fch1xRa6MHFJE4yqQKI4XEdt31Z3yEw1Z8VwxBmkesqIlgtn+4KX2Gvvttdy2Wnhn9tycx5n48G3HOxzoAF6tnRiTC2CsDJv92X1oJSflJoWxKSZLdGXb4GZKnDI/Ke4AHz5hQQwepzXospPq5xlCbGdH5i6U28clvg9h/IyRxPBJOykP0Zwndr1NH9H2VGyfN1HUXQ4IyON2yi81DZL2I3ZZ5MwlZ4CTvH2jtecJcTVsR122VIV7CX0AYBuA3zEFjP8LEyD6bsuz+tzxVvytMJSQ9QivMyDiWrr1s5AIxWd5swIRfFQdfq9dxshlObgworDPHVGIzIiRWA65O1vG+adAwQYfHP6nGCQH3ijE85zjnAVG3yPeScAPG4MrvgDXEDgzDarfEJ3EfdvOdtpORj4bSpczPIZR2OFqWADLxr0hBL/wHoNDS2CyhKK3xuJL7z5aHY6yC+gUFD7DMi3TerkbZTO8kztS0oGbmnYijOaKRwJYDz7VIXNxbvz74HlrESUjBB2itp/qR2gppxufjlXEYOL4juj8NKwmiPF2J6LhrRtDmqre7lIbv/OQWgkQTiIai46alUela7LQBscOi6mIUaIojsGj7DA9YrQAeu9WLIPDO1okNgsL0MBTO6mNDq8CCsd+Mjf5ZphWUz38HO8CCeqaBKmqz7hMhmFX9e7kAZmQ6CxyGUyLwDhdgjBzGj8R63i0IzvQF8=
X-Forefront-Antispam-Report: CIP:104.232.225.7;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.lenovo.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(47076005)(2906002)(82960400001)(36756003)(82310400004)(36906005)(53546011)(6916009)(966005)(31696002)(54906003)(31686004)(4326008)(356005)(508600001)(16576012)(26005)(86362001)(426003)(316002)(336012)(2616005)(186003)(36860700001)(40460700003)(16526019)(83380400001)(70206006)(8676002)(81166007)(70586007)(8936002)(5660300002)(3940600001)(36900700001)(43740500002)(20210929001);DIR:OUT;SFP:1102;
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 16:49:49.7675
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0af583d-6ad3-4cc0-5754-08d9e0ebde5f
X-MS-Exchange-CrossTenant-Id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5c7d0b28-bdf8-410c-aa93-4df372b16203;Ip=[104.232.225.7];Helo=[mail.lenovo.com]
X-MS-Exchange-CrossTenant-AuthSource: PSAAPC01FT003.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB6198
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


On 1/24/22 05:42, Hans de Goede wrote:
> Hi Mark,
>
> On 1/21/22 21:17, Mark Pearson wrote:
>> Lenovo AMD based platforms have been offering platform_profiles but they
>> are not working correctly. This is because the mode we are using on the
>> Intel platforms (MMC) is not available on the AMD platforms.
>>
>> This commit adds checking of the functional capabilities returned by the
>> BIOS to confirm if MMC is supported or not. Profiles will not be
>> available if the platform is not MMC capable.
>>
>> I'm investigating and working on an alternative for AMD platforms but
>> that is still work-in-progress.
>>
>> Signed-off-by: Mark Pearson <markpearson@lenovo.com>
>> ---
>>   drivers/platform/x86/thinkpad_acpi.c | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
>> index 9c632df734bb..42a04e44135b 100644
>> --- a/drivers/platform/x86/thinkpad_acpi.c
>> +++ b/drivers/platform/x86/thinkpad_acpi.c
>> @@ -10026,6 +10026,9 @@ static struct ibm_struct proxsensor_driver_data = {
>>   #define DYTC_CMD_MMC_GET      8 /* To get current MMC function and mode */
>>   #define DYTC_CMD_RESET    0x1ff /* To reset back to default */
>>   
>> +#define DYTC_CMD_FUNC_CAP     3 /* To get DYTC capabilities */
>> +#define DYTC_FC_MMC           27 /* MMC Mode supported */
>> +
>>   #define DYTC_GET_FUNCTION_BIT 8  /* Bits  8-11 - function setting */
>>   #define DYTC_GET_MODE_BIT     12 /* Bits 12-15 - mode setting */
>>   
>> @@ -10253,6 +10256,16 @@ static int tpacpi_dytc_profile_init(struct ibm_init_struct *iibm)
>>   	if (dytc_version >= 5) {
>>   		dbg_printk(TPACPI_DBG_INIT,
>>   				"DYTC version %d: thermal mode available\n", dytc_version);
> This code has been refactored and this will not apply as is:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/platform/x86/thinkpad_acpi.c?id=0b0d2fba4f3302b601c429c9286e66b3af2d29cb
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/platform/x86/thinkpad_acpi.c?id=798682e236893a20e5674de02ede474373dd342d
>
> Please rebase on top of 5.17-rc1
My apologies - I thought I was on the latest. Will rebase
>
>> +
>> +		/* Check what capabilities are supported. Currently MMC is needed */
>> +		err = dytc_command(DYTC_CMD_FUNC_CAP, &output);
>> +		if (err)
>> +			return err;
>> +		if (!test_bit(DYTC_FC_MMC, (void *)&output)) {
>> +			dbg_printk(TPACPI_DBG_INIT, " DYTC MMC mode not supported\n");
>> +			return 0;
> This should be return -ENODEV;

I'll double check, but I don't think we want an error here as we want to 
continue on, it's just the feature is not supported so 0 is OK?

Thanks

Mark


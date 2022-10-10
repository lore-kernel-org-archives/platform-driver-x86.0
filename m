Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 637B2C433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon, 10 Oct 2022 16:57:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229544AbiJJQ5o (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 10 Oct 2022 12:57:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbiJJQ5n (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 10 Oct 2022 12:57:43 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2073.outbound.protection.outlook.com [40.107.94.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBD1A474C0
        for <platform-driver-x86@vger.kernel.org>; Mon, 10 Oct 2022 09:57:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OhowbKc73L4jIifPP/YsUHNVTWWRNEKh1x9gvMz8yZheHNHsLbNVnXOUhLhoqpl42wvkkOnhaKhGvdiGJtloOA+JcXsfmyiXXuIoi6cvQ+LInLoaaHBQcwm+K/eopeMb6ON1/VHAq4W5GZY9v5cFi5MVXimpo3EKUu5R5yNyQtSQieNhwtggcjHoPWaKKVkD6UCGyxVnpGmzIHe+G01pWHi5XCEItIAIqXK0j71fMYbv3ETwNH/gDzQ3dlImpIA09BlcRUeJxVwskn3RVxJM3Aab+8dKSEJ7GFcdxhPKjJ/vaeTk5/pRpLPGTslgPtmBK1wDejT8NRJ4wR4c3a9BFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NlBHUJwN1d/85Ch1SyW3NzRiuOVJhLSOc7HFNxaaPIc=;
 b=B7mq0KdIB4DD9JMgVPK5aE/ZPpO95UPCXwdq6r3t5kOR3uCnL0nRhNW5P7MUpG3VPO10J7db4KSutEc2iGp2+u+cv8lL8mZ82Lmi2wDQcDtelZiSRQTjojMqF2bYcnCcdI5T87av3s1N3jBgamc+MMC9vQDZl/Ga0i6gKzLc/vPVsLt9MlkGqT66v/VIluadYhFRVlvUXZKisAGFamS5dn6wwaJdsSwiOD1yiytWEGlZYRBq7FTPXySg4iWpTMWLOgxuM+aMeWYHY8ZB0e4f2PoiXQkVAJDdXOnESI2lBMPBT5ch2SOC6ka8KyI3ubGXfzbrOBbVixI6dxVafn6LXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NlBHUJwN1d/85Ch1SyW3NzRiuOVJhLSOc7HFNxaaPIc=;
 b=i3AU1Ur40DN5W4Ri9Ldj7g94Oeagdu4OUH+n/iYFFt4+1QjVzDunD8cSgV4C5qKxqfAxj4SueIt7rQrjTN/NKisT4sdN+qww5eTV6/4joCyqUP1jm2RnsC8l1pAkQPS16IJLsy3XTXfdyWTY8srcYaTSXlBVmOv/g6zFOzC+qls=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Mon, 10 Oct
 2022 16:57:31 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::76ec:6acf:dd4d:76a3]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::76ec:6acf:dd4d:76a3%9]) with mapi id 15.20.5676.030; Mon, 10 Oct 2022
 16:57:30 +0000
Message-ID: <a50407fd-6969-9e9a-23a3-39879af639cd@amd.com>
Date:   Mon, 10 Oct 2022 11:57:12 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v1 1/1] Introduction of HP-BIOSCFG driver
Content-Language: en-US
To:     Jorge Lopez <jorgealtxwork@gmail.com>, hdegoede@redhat.com,
        platform-driver-x86@vger.kernel.org
References: <20221010162326.12957-1-jorge.lopez2@hp.com>
 <20221010162326.12957-2-jorge.lopez2@hp.com>
From:   "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <20221010162326.12957-2-jorge.lopez2@hp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BLAPR03CA0004.namprd03.prod.outlook.com
 (2603:10b6:208:32b::9) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|PH8PR12MB7446:EE_
X-MS-Office365-Filtering-Correlation-Id: ad0d79b8-671a-4a61-d6a4-08daaae0849b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DXaBUaSXkRbRBZHJMjYkH2yVV0fO9hUhisAEnRqCSF8/5FUEU0iTh0ly+MbH484j1+jjDeML4plZMeQrVRKYRDBSFS04mW0C6u2KUMUTiMoryqZ0GVW5B8Rga6u6kRa2Faq3JyZvUuFDVQSDLI3EakBGvrCMRfNttM141dKSUWDHP80jjbYkdxLSr7vCptECUm00QDkfMfLK9oZxomrTw7cA2qlBAdfcj1VFjLqAYqP3Yza+eWgWC3TZuyVxg8IgCjsvVnYNQ6bXrhxV4m6poSOWXWRyCAD9+6+9pZ3ChV0ytdEDhCpgtUGPFjntIiAZZeO0u0iHCh7pupPsiSFdjqVU3lc9rTAFp4dEqdaL5/tsV7jLQ1PLGSLWQbGbwAXsg0hmqmB2XYokZmO6Yf2kKitPWJ9rqFDFWp0RMeqcStAK3zgQ4KofqJ0zpLL4BaQwK8iFAnpScD5hJ+rQ3B0e/2DfDFM2V3vdJ7ORZ2w1g5Jf/pN/+rReJ4nih+aSlOkKQIBSn/xG9OWjl+NDGA2l4zXaDve85UvrIXNZCHtqn5r6J1GpHpKAoVbQS0WFi+bDf2gaVtYVm/yg1GwUDuaSVHruHoOVeN9rCb6TY/RivffyLlOWgNWxTnFpWbfk093sZoHxg9uMknr0bOZWdQGJbriIBiJ+y7CJFVMTSTDpJtcJtOsJfL/5iv7W++N0oZiS+YOkLxjtkUhw6HHj3KJiiPx3uKrFflT5yU2YdfCfSrzYLt3qbEKQn6eWtih+BKCp+4KY+VcBn++l3DBRU1y/489koVZZtI4opoOnGRrLiKLTt9dR0gLhy2LTQ+N9+qgpPTIzfus1gTIBpr3ecTsmLg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(39860400002)(376002)(136003)(366004)(451199015)(66556008)(53546011)(5660300002)(30864003)(6506007)(2616005)(26005)(6512007)(316002)(2906002)(8676002)(31696002)(86362001)(84970400001)(83380400001)(8936002)(66476007)(38100700002)(186003)(41300700001)(66946007)(36756003)(31686004)(6666004)(6486002)(478600001)(43740500002)(45980500001)(559001)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajFSSUZkUS83cE1EWTIyWkdCd3QxbnkycGM0V2lOR243d0l6RTVnMTZYa3kx?=
 =?utf-8?B?MWlHcHdRSlAzN3VhQ0dET2w1cnhLWlAvUHlpRTgvNUI5MHJxdnpwcHZ4THJZ?=
 =?utf-8?B?bUVyVDFIelIxRmFKTmJjdFM0NnRxOG5rQjk3aTRDUTdYcWU3eEVhR0xHNkZR?=
 =?utf-8?B?YlorREJzOFJpd3hKdytHUDdrOFNqdDdLWG5raVROMkJxYTdhUndYaE9mL0xy?=
 =?utf-8?B?QmNTNUFINVpLd0xYQnhGQ0RucHZDQlBpU3BWZjdOZmx5YTB4dWJmemtNZWxu?=
 =?utf-8?B?bEx3eko4VEl3S0w0MXZwQStMVlZqc3FMayttTGRWd0xhRzhrNHp3TzVLUWhB?=
 =?utf-8?B?d1d2VlVlbU1BTHdoRjdmRXFoK0JRYURMR3VBV09mTWFGMThKQ08rdERKNjZ1?=
 =?utf-8?B?bWFzdjVkekh3TGozcTh2azBaejlrMXZIVDVPeDdRUVYrZlZ4clVTZlhsWXM3?=
 =?utf-8?B?dERwcFFURmtlSVlDbVMzbWR6cFZENWRpWkxJUUo4YWE3Nkw4eTlqMjJwZWVL?=
 =?utf-8?B?U1JuRDBaVmw2OFV1c2ZmNUtVSi9nR2JoMEVVSG9sWU1lby9ZS2JiRjhCU1FM?=
 =?utf-8?B?ajVtNGd2MHpabnArWVArSVZCaGg5dUp6R3pST3QvcVdHOTNNelBUb1AzS1ZT?=
 =?utf-8?B?ckRTNkJOTkZFRnRFN3VjZjhzWjU1SFVNUVhJLytpcnBSNksweVZaWWxvK1Vw?=
 =?utf-8?B?WXBJODVqbi9PTXdWY2tNQXRENWE0WnN3ZEtMcXkrNldUSmV5WEVybkUzL2Qx?=
 =?utf-8?B?STQ4Q0o4dG5PMDM1ZmNzMmlUTWFraS80cDAwR2VyR0FnMGNaQk9VaWZIQVVw?=
 =?utf-8?B?UEVjMkdSVUhHQUVrVUlCNElleXBhemJXN3J1ZVZHZWtLQ1Nhb1ZDc3BiQVlC?=
 =?utf-8?B?aFhWYTRzSVo0aEZRMm1rMlB2SE9qaEpzNktJdnd5bktKTVQ2aHZIQ3dCeXox?=
 =?utf-8?B?MVpLaXU3Uk9OcDJBMG5HTUtFSlc1aTBVckVHaGZWWUlFZzAva1FjaHd2VDdC?=
 =?utf-8?B?NjRhcVh1N1BBSS9iQmJqOFBGNTROdXo0RnNqWk5mQXpZZ1lnbm85RjFkOEdr?=
 =?utf-8?B?aUZ3dTh4ZmNnVmhFL2lDNUhXWlNMWENGT1ZQTW9QSTY5ZW01NjN4ZnZZZmt0?=
 =?utf-8?B?dVRsSjdkeWhMYkZqTlRyUWFaQ0F2bTB4VUliQW5zUk5sRkFuZVNUd2E2bDQw?=
 =?utf-8?B?c3ZSSS9wZG9Zak5tVjVpbmwzbVlYQysyaUpXSHZIaE9pVFpmOHRXbVF3T1A4?=
 =?utf-8?B?ejM3VWZQbitIWUhFQ200NmljTktiS2FLL3dUd0sxUWdCRU1FeXJOYWhsTTF1?=
 =?utf-8?B?VzNDNGhmMnZVZmF5dGtkUnpHUzRFMU8rbEpyR1BvUTZYTWJXOXREZDh5LzdC?=
 =?utf-8?B?cFN2a0NIeUF1cXJEV1ovRUVqT2hxYjgwNVJEODFjK1lRaUE4bXA4SmF1UEhZ?=
 =?utf-8?B?bFBiaHdqM2NhbDhLQzVLZmFMeUtiYVdxbkN4alB0aTNtSWVyRzB0MHlneTdy?=
 =?utf-8?B?N0EvRHpEdm55ZEpPRUJMeVZXVzY3cUthNVlyb1owQnd5WGVLSmc1R3NReGJu?=
 =?utf-8?B?Ti9wNEhhY2ptd1RYcmljeHZwQnlkQWdhWXB5V2IxYmhzZ0NMVWRUSUl5UzFU?=
 =?utf-8?B?ZnpsS0M3eDZFZEIzUnllbkxDbkdFcEJ1TGhjeEszalNQcUdiWkpnelZLc1Uy?=
 =?utf-8?B?R1pFY3pFZldmcGp1Mmpmcm1OMWRScHV4Nko5a3VxcXh6SkJ5NVdCQk9NQzA4?=
 =?utf-8?B?QStJK2pIQVp5dFdhVDBVOFd6d0hNTWgwbVAyRHh2WnF2b0ducWM2RjB0NUtl?=
 =?utf-8?B?NzE4NTRheVV0QThocHUzZ2xuYXFtK3FyT04vUnZmL3FHdTBiZWh2bmZlbVlP?=
 =?utf-8?B?czZhSldQaHBvdDVMb3FjTkEzMlNzUVVMendROTRwNGs4dHhzbHc5RkFEeWZJ?=
 =?utf-8?B?UmwvS0pnbm8vUm1MS1FYOUdtQXphZTFQNExrdzRLbEw2KzBpalRleUZ5eUts?=
 =?utf-8?B?MG80MWhzb1JvTk1kRU95ODd4QUltNVduTlFlRHgzZXhMcWtNeWNZMEZuc3h1?=
 =?utf-8?B?ZWRvVzgvYlFGMHRHWnFCSm5DMVd3VHB6dk5KT1JRV01PbUxQTHA4c1VlOFJ1?=
 =?utf-8?Q?MtIY0kHx2UwTeJomxMyais930?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad0d79b8-671a-4a61-d6a4-08daaae0849b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2022 16:57:30.4310
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q1K9rnNTzhs9con6Og1yVQMSHWr/pF2RdxMvG2wdmZLCJPRx0vrNErGnIEaOfukaIk8ehK5QEZIqh04O7BBdFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7446
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Jorge,

Thanks for submitting this.  I had a try with a HP pro x360 435 that I 
have on my side.

I have some high level comments nested and below.

1) I noticed that some attributes are definitely read only, I wonder if
it makes sense to set current_value as "r" instead of "rw" in those cases.

Such as "Born On Date" or "AMD PSP FW Version" and "BIOS Build Version"

2) I noticed that "pending_reboot" is only updated for two attributes, 
should it be updated for more than that?

3) I didn't look exhaustively, but a lot of cases the attribute name and 
display_name key seem to have the same values.  Is that intended?

On 10/10/2022 11:23, Jorge Lopez wrote:
> The purpose for this patch is submit HP BIOSCFG driver to be list of
> HP Linux kernel drivers.  HP BIOS Configuration driver purpose is to
> provide a driver supporting the latest sysfs class firmware attributes
> framework allowing the user to change BIOS settings and security
> solutions on HP Inc.’s commercial notebooks.
> 
> Many features of HP Commercial PC’s can be managed using Windows
> Management Instrumentation (WMI). WMI is an implementation of Web-Based
> Enterprise Management (WBEM) that provides a standards-based interface
> for changing and monitoring system settings.  HP BISOCFG driver provides
> a native Linux solution and the exposed features facilitates the
> migration to Linux environments.
> 
> The Linux security features to be provided in hp-bioscfg driver enables
> managing the BIOS settings and security solutions via sysfs, a virtual
> filesystem that can be used by user-mode applications.   The new
> documentation cover features such Secure Platform Management, Sure
> Admin, and Sure Start.  Each section provides security feature
> description and identifies sysfs directories and files exposed by
> the driver.
> 
> Many HP Commercial PC’s include a feature called Secure Platform
> Management (SPM), which replaces older password-based BIOS settings
> management with public key cryptography. PC secure product management
> begins when a target system is provisioned with cryptographic keys
> that are used to ensure the integrity of communications between system
> management utilities and the BIOS.
> 
> HP Commercial PC’s have several BIOS settings that control its behaviour
> and capabilities, many of which are related to security. To prevent
> unauthorized changes to these settings, the system can be configured
> to use a Sure Admin cryptographic signature-based authorization string
> that the BIOS will use to verify authorization to modify the setting.
> 
> Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>
> 
> ---
> Based on the latest platform-drivers-x86.git/for-next
> ---
>   .../testing/sysfs-class-firmware-attributes   |  175 ++-
>   drivers/platform/x86/Kconfig                  |    1 +
>   drivers/platform/x86/Makefile                 |    1 +
>   drivers/platform/x86/hp/Kconfig               |   35 +
>   drivers/platform/x86/hp/Makefile              |   19 +
>   drivers/platform/x86/hp/biosattr-interface.c  |  286 +++++
>   drivers/platform/x86/hp/bioscfg.c             | 1029 +++++++++++++++++
>   drivers/platform/x86/hp/bioscfg.h             |  667 +++++++++++
>   drivers/platform/x86/hp/enum-attributes.c     |  504 ++++++++
>   drivers/platform/x86/hp/int-attributes.c      |  461 ++++++++
>   drivers/platform/x86/hp/ordered-attributes.c  |  568 +++++++++
>   .../platform/x86/hp/passwdattr-interface.c    |   50 +
>   .../platform/x86/hp/passwdobj-attributes.c    |  640 ++++++++++
>   drivers/platform/x86/hp/spmobj-attributes.c   |  408 +++++++
>   drivers/platform/x86/hp/string-attributes.c   |  447 +++++++
>   .../platform/x86/hp/sureadmin-attributes.c    |  984 ++++++++++++++++
>   .../platform/x86/hp/surestart-attributes.c    |  145 +++
>   17 files changed, 6419 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/platform/x86/hp/Kconfig
>   create mode 100644 drivers/platform/x86/hp/Makefile
>   create mode 100644 drivers/platform/x86/hp/biosattr-interface.c
>   create mode 100644 drivers/platform/x86/hp/bioscfg.c
>   create mode 100644 drivers/platform/x86/hp/bioscfg.h
>   create mode 100644 drivers/platform/x86/hp/enum-attributes.c
>   create mode 100644 drivers/platform/x86/hp/int-attributes.c
>   create mode 100644 drivers/platform/x86/hp/ordered-attributes.c
>   create mode 100644 drivers/platform/x86/hp/passwdattr-interface.c
>   create mode 100644 drivers/platform/x86/hp/passwdobj-attributes.c
>   create mode 100644 drivers/platform/x86/hp/spmobj-attributes.c
>   create mode 100644 drivers/platform/x86/hp/string-attributes.c
>   create mode 100644 drivers/platform/x86/hp/sureadmin-attributes.c
>   create mode 100644 drivers/platform/x86/hp/surestart-attributes.c
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-firmware-attributes b/Documentation/ABI/testing/sysfs-class-firmware-attributes
> index 4cdba3477176..d3830b8a398f 100644
> --- a/Documentation/ABI/testing/sysfs-class-firmware-attributes
> +++ b/Documentation/ABI/testing/sysfs-class-firmware-attributes
> @@ -22,6 +22,13 @@ Description:
>   			- integer: a range of numerical values
>   			- string
>   
> +		HP specific types
> +		-----------------
> +			- ordered-list - a set of ordered list valid values
> +			- sure-admin
> +			- sure-start
> +
> +
>   		All attribute types support the following values:
>   
>   		current_value:
> @@ -126,6 +133,63 @@ Description:
>   					value will not be effective through sysfs until this rule is
>   					met.
>   
> +		HP specific class extensions
> +		------------------------------
> +
> +		On HP systems the following additional attributes are available:
> +
> +		"ordered-list"-type specific properties:
> +
> +		elements:
> +					A file that can be read to obtain the possible
> +					list of values of the <attr>. Values are separated using
> +					semi-colon (``;``)

This should be clarified that it's values of particular priority when 
written to current_value.

> +
> +		"sure-admin"-type specific properties:
> +
> +		settings:
> +					A file associated with Sure Admin. BIOS settings can
> +					be read or written through the Sure Admin settings file in sysfs.
> +
> +					[BIOS setting],[new value],[auth token]
> +
> +					Sample settings reported data
> +
> +					{
> +						"Class": "HPBIOS_BIOSEnumeration",
> +						"Name": "USB Storage Boot",
> +						"Path": "\\Advanced\\Boot Options",
> +						"IsReadOnly": 0,
> +						...
> +						"Value": "Enable",
> +						"Size": 2,
> +						"PossibleValues": [
> +							"Disable",
> +							"Enable"
> +							]
> +					}
> +
> +					This file can also be written to in order to update
> +					the value sof a <attr> using a CMSL generated payload.
> +					For example:
> +
> +					<attr>,[value],[CMSL generated payload]
> +
> +		"sure-start"-type specific properties:
> +
> +		audit_log_entries:
> +					A read-only file that returns the events in the log.
> +
> +					Audit log entry format
> +
> +					Byte 0-15:   Requested Audit Log entry  (Each Audit log is 16 bytes)
> +					Byte 16-127: Unused
> +
> +		audit_log_entry_count:
> +					A read-only file that returns the number of existing audit log events available to be read.
> +
> +					[No of entries],[log entry size],[Max number of entries supported]
> +
>   What:		/sys/class/firmware-attributes/*/authentication/
>   Date:		February 2021
>   KernelVersion:	5.11
> @@ -206,7 +270,7 @@ Description:
>   		Drivers may emit a CHANGE uevent when a password is set or unset
>   		userspace may check it again.
>   
> -		On Dell and Lenovo systems, if Admin password is set, then all BIOS attributes
> +		On Dell, Lenovo, and HP systems, if Admin password is set, then all BIOS attributes
>   		require password validation.
>   		On Lenovo systems if you change the Admin password the new password is not active until
>   		the next boot.
> @@ -296,6 +360,15 @@ Description:
>   						echo "signature" > authentication/Admin/signature
>   						echo "password" > authentication/Admin/certificate_to_password
>   
> +		HP specific class extensions
> +		--------------------------------
> +
> +		On HP systems the following additional settings are available:
> +
> +		role: enhanced-bios-auth:
> +					This role is specific to Secure Platform Management (SPM) attribute.
> +					It requires configuring an endorsement (kek) and signing certificate (sk).
> +
>   
>   What:		/sys/class/firmware-attributes/*/attributes/pending_reboot
>   Date:		February 2021
> @@ -364,3 +437,103 @@ Description:
>   		use it to enable extra debug attributes or BIOS features for testing purposes.
>   
>   		Note that any changes to this attribute requires a reboot for changes to take effect.
> +
> +
> +		HP specific class extensions
> +		--------------------------------
> +
> +What:		/sys/class/firmware-attributes/*/authentication/SPM/kek
> +Date:		March 29
> +KernelVersion:	5.18
> +Contact:	"Jorge Lopez" <jorge.lopez2@hp.com>
> +Description:	'kek' is a write-only file that can be used to configure the
> +		RSA public key that will be used by the BIOS to verify
> +		signatures when setting the signing key.  When written,
> +		the bytes should correspond to the KEK certificate
> +		(x509 .DER format containing an OU).  The size of the
> +		certificate must be less than or equal to 4095 bytes.
> +
> +
> +What:		/sys/class/firmware-attributes/*/authentication/SPM/sk
> +Date:		March 29
> +KernelVersion:	5.18
> +Contact:	"Jorge Lopez" <jorge.lopez2@hp.com>
> +Description:	'sk' is a write-only file that can be used to configure the RSA
> +		public key that will be used by the BIOS to verify signatures
> +		when configuring BIOS settings and security features.  When
> +		written, the bytes should correspond to the modulus of the
> +		public key.  The exponent is assumed to be 0x10001.
> +
> +
> +What:		/sys/class/firmware-attributes/*/authentication/SPM/status
> +Date:		March 29
> +KernelVersion:	5.18
> +Contact:	"Jorge Lopez" <jorge.lopez2@hp.com>
> +Description:	'status' is a read-only file that returns ASCII text reporting
> +		the status information.
> +
> +		  State:  Not Provisioned / Provisioned / Provisioning in progress
> +		  Version:  Major.   Minor
> +		  Feature Bit Mask: <16-bit unsigned number display in hex>
> +		  SPM Counter: <16-bit unsigned number display in base 10>
> +		  Signing Key Public Key Modulus (base64):
> +		  KEK Public Key Modulus (base64):
> +
> +
> +What:		/sys/class/firmware-attributes/*/authentication/SPM/statusbin
> +Date:		March 29
> +KernelVersion:	5.18
> +Contact:	"Jorge Lopez" <jorge.lopez2@hp.com>
> +Description:	'statusbin' is a read-only file that returns identical status
> +		information reported by 'status' file in binary format.
> +
> +
> +What:		/sys/class/firmware-attributes/*/attributes/Sure_Admin/settings
> +Date:		March 29
> +KernelVersion:	5.18
> +Contact:	"Jorge Lopez" <jorge.lopez2@hp.com>
> +Description:	'settings' is a file associated with Sure Admin. BIOS settings can
> +		be read or written through the Sure Admin settings file in sysfs.
> +
> +		Expected data format to update BIOS setting
> +
> +		  [BIOS setting],[new value],[auth token]
> +
> +		Sample settings reported data
> +
> +		  {
> +			  "Class": "HPBIOS_BIOSEnumeration",
> +			  "Name": "USB Storage Boot",
> +			  "Path": "\\Advanced\\Boot Options",
> +			  "IsReadOnly": 0,
> +			  ...
> +			  "Value": "Enable",
> +			  "Size": 2,
> +			  "PossibleValues": [
> +				"Disable",
> +				"Enable"
> +				]
> +		  }
> +
> +
> +What:		/sys/class/firmware-attributes/*/attributes/Sure_Start/audit_log_entry_count
> +Date:		March 29
> +KernelVersion:	5.18
> +Contact:	"Jorge Lopez" <jorge.lopez2@hp.com>
> +Description:	audit_log_entry_count is a read-only file that returns the
> +		number of existing audit log events available to be read.
> +
> +		  [No of entries],[log entry size],[Max number of entries supported]
> +
> +
> +What:		/sys/class/firmware-attributes/*/attributes/Sure_Start/audit_log_entries
> +Date:		March 29
> +KernelVersion:	5.18
> +Contact:	"Jorge Lopez" <jorge.lopez2@hp.com>
> +Description:	audit_log_entries is a read-only file that returns the events
> +		in the log.
> +
> +		Audit log entry format
> +
> +		  Byte 0-15:   Requested Audit Log entry  (Each Audit log is 16 bytes)
> +		  Byte 16-127: Unused
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index f5312f51de19..013f5510b5f2 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -366,6 +366,7 @@ config EEEPC_WMI
>   	  here.
>   
>   source "drivers/platform/x86/dell/Kconfig"
> +source "drivers/platform/x86/hp/Kconfig"
>   
>   config AMILO_RFKILL
>   	tristate "Fujitsu-Siemens Amilo rfkill support"
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index 5a428caa654a..7f4fdec482a5 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -58,6 +58,7 @@ obj-$(CONFIG_GPD_POCKET_FAN)	+= gpd-pocket-fan.o
>   obj-$(CONFIG_HP_ACCEL)		+= hp_accel.o
>   obj-$(CONFIG_HP_WMI)		+= hp-wmi.o
>   obj-$(CONFIG_TC1100_WMI)	+= tc1100-wmi.o
> +obj-$(CONFIG_HP_BIOSCFG)        += hp/
>   
>   # Hewlett Packard Enterprise
>   obj-$(CONFIG_UV_SYSFS)       += uv_sysfs.o
> diff --git a/drivers/platform/x86/hp/Kconfig b/drivers/platform/x86/hp/Kconfig
> new file mode 100644
> index 000000000000..b17b99449ee5
> --- /dev/null
> +++ b/drivers/platform/x86/hp/Kconfig
> @@ -0,0 +1,35 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# HP X86 Platform Specific Drivers
> +#
> +
> +menuconfig X86_PLATFORM_DRIVERS_HP
> +	bool "HP X86 Platform Specific Device Drivers"
> +	depends on X86_PLATFORM_DEVICES
> +	help
> +	  Say Y here to get to see options for device drivers for various
> +	  HP x86 platforms, including vendor-specific laptop extension drivers.
> +	  This option alone does not add any kernel code.
> +
> +	  If you say N, all options in this submenu will be skipped and disabled.
> +

Presumably if this is going into it's own directory you should move all 
platform-x86 HP drivers to this directory earlier in the series too.

> +if X86_PLATFORM_DRIVERS_HP
> +
> +config HP_BIOSCFG
> +	tristate "HP BIOS Configuration Driver"
> +	default m
> +	depends on ACPI_WMI
> +	depends on DMI
> +	select NLS
> +	select FW_ATTR_CLASS
> +	help
> +	  This driver enables administrators to securely manage BIOS settings
> +	  using digital certificates and public-key cryptography that eliminate
> +	  the need for passwords for both remote and local management. It supports
> +          changing BIOS settings on many HP machines from 2018 and newer without
> +	  the use of any additional software.
> +
> +	  To compile this driver as a module, choose M here: the module will
> +	  be called hp-bioscfg.
> +
> +endif # X86_PLATFORM_DRIVERS_HP
> diff --git a/drivers/platform/x86/hp/Makefile b/drivers/platform/x86/hp/Makefile
> new file mode 100644
> index 000000000000..e3790e223084
> --- /dev/null
> +++ b/drivers/platform/x86/hp/Makefile
> @@ -0,0 +1,19 @@
> +obj-m           := hp-bioscfg.o
> +
> +hp-bioscfg-objs := bioscfg.o 	\
> +	enum-attributes.o 	\
> +	int-attributes.o 	\
> +	string-attributes.o 	\
> +	passwdobj-attributes.o 	\
> +	biosattr-interface.o  	\
> +	passwdattr-interface.o 	\
> +	ordered-attributes.o 	\
> +	surestart-attributes.o 	\
> +	spmobj-attributes.o 	\
> +	sureadmin-attributes.o
> +
> +default:
> +	make -C /lib/modules/`uname -r`/build M=$(PWD) hp-bioscfg.ko
> +
> +clean:
> +	make -C /lib/modules/`uname -r`/build M=$(PWD) clean
> diff --git a/drivers/platform/x86/hp/biosattr-interface.c b/drivers/platform/x86/hp/biosattr-interface.c
> new file mode 100644
> index 000000000000..c983ef21a9ed
> --- /dev/null
> +++ b/drivers/platform/x86/hp/biosattr-interface.c
> @@ -0,0 +1,286 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Functions corresponding to methods under BIOS interface GUID
> + * for use with hp-bioscfg driver.
> + *
> + *  Copyright (c) 2022 Hewlett-Packard Inc.
> + */
> +
> +#include <linux/wmi.h>
> +#include "bioscfg.h"
> +#include <stddef.h>
> +

I applied this to 6.0 but failed to build:

drivers/platform/x86/hp/biosattr-interface.c:11:10: fatal error: 
stddef.h: No such file or directory
    11 | #include <stddef.h>
       |          ^~~~~~~~~~

I was able to fix my local build using this patch:

--- a/drivers/platform/x86/hp/biosattr-interface.c
+++ b/drivers/platform/x86/hp/biosattr-interface.c
@@ -6,9 +6,9 @@
   *  Copyright (c) 2022 Hewlett-Packard Inc.
   */

-#include <linux/wmi.h>
  #include "bioscfg.h"
-#include <stddef.h>
+#include <linux/stddef.h>
+#include <linux/wmi.h>

  #define SET_DEFAULT_VALUES_METHOD_ID   0x02
  #define SET_BIOS_DEFAULTS_METHOD_ID    0x03

> +#define SET_DEFAULT_VALUES_METHOD_ID	0x02
> +#define SET_BIOS_DEFAULTS_METHOD_ID	0x03
> +#define SET_ATTRIBUTE_METHOD_ID		0x04
> +
> +/*
> + * set_attribute() - Update an attribute value
> + * @a_name: The attribute name
> + * @a_value: The attribute value
> + *
> + * Sets an attribute to new value
> + */
> +int hp_set_attribute(const char *a_name, const char *a_value)
> +{
> +	size_t security_area_size;
> +	size_t a_name_size, a_value_size;
> +	u16 *buffer = NULL;
> +	u16 *start = NULL;
> +	int  buffer_size;
> +	int ret;
> +	int instance;
> +	char *auth_empty_value = " ";
> +
> +	mutex_lock(&bioscfg_drv.mutex);
> +	if (!bioscfg_drv.bios_attr_wdev) {
> +		ret = -ENODEV;
> +		goto out_set_attribute;
> +	}
> +
> +	instance = get_password_instance_for_type(SETUP_PASSWD);
> +	if (instance < 0)
> +		goto out_set_attribute;
> +
> +	if (strlen(bioscfg_drv.password_data[instance].current_password) == 0)
> +		strncpy(bioscfg_drv.password_data[instance].current_password,
> +			auth_empty_value,
> +			sizeof(bioscfg_drv.password_data[instance].current_password));
> +
> +	a_name_size = calculate_string_buffer(a_name);
> +	a_value_size = calculate_string_buffer(a_value);
> +	security_area_size = calculate_security_buffer(bioscfg_drv.password_data[instance].current_password);
> +	buffer_size = a_name_size + a_value_size + security_area_size;
> +
> +	buffer = kzalloc(buffer_size, GFP_KERNEL);
> +	if (!buffer) {
> +		ret = -ENOMEM;
> +		goto out_set_attribute;
> +	}
> +
> +	/* build variables to set */
> +	start = buffer;
> +	start = ascii_to_utf16_unicode(start, a_name);
> +	if (!start)
> +		goto out_set_attribute;
> +
> +	start = ascii_to_utf16_unicode(start, a_value);
> +	if (!start)
> +		goto out_set_attribute;
> +
> +	populate_security_buffer(start, bioscfg_drv.password_data[instance].current_password);
> +	ret = hp_wmi_set_bios_setting(buffer, buffer_size);
> +
> +
> +out_set_attribute:
> +	kfree(buffer);
> +	mutex_unlock(&bioscfg_drv.mutex);
> +	return ret;
> +}
> +
> +/*
> + * hp_wmi_perform_query
> + *
> + * query:	The commandtype (enum hp_wmi_commandtype)
> + * write:	The command (enum hp_wmi_command)
> + * buffer:	Buffer used as input and/or output
> + * insize:	Size of input buffer
> + * outsize:	Size of output buffer
> + *
> + * returns zero on success
> + *         an HP WMI query specific error code (which is positive)
> + *         -EINVAL if the query was not successful at all
> + *         -EINVAL if the output buffer size exceeds buffersize
> + *
> + * Note: The buffersize must at least be the maximum of the input and output
> + *       size. E.g. Battery info query is defined to have 1 byte input
> + *       and 128 byte output. The caller would do:
> + *       buffer = kzalloc(128, GFP_KERNEL);
> + *       ret = hp_wmi_perform_query(HPWMI_BATTERY_QUERY, HPWMI_READ, buffer, 1, 128)
> + */
> +int hp_wmi_perform_query(int query, enum hp_wmi_command command, void *buffer, int insize, int outsize)
> +{
> +	struct acpi_buffer input, output = { ACPI_ALLOCATE_BUFFER, NULL };
> +	struct bios_return *bios_return;
> +	union acpi_object *obj = NULL;
> +	struct bios_args *args = NULL;
> +	int mid, actual_insize, actual_outsize;
> +	size_t bios_args_size;
> +	int ret;
> +
> +	mid = encode_outsize_for_pvsz(outsize);
> +	if (WARN_ON(mid < 0))
> +		return mid;
> +
> +	actual_insize = insize;
> +	bios_args_size = struct_size(args, data, insize);
> +	args = kmalloc(bios_args_size, GFP_KERNEL);
> +	if (!args)
> +		return -ENOMEM;
> +
> +	input.length = bios_args_size;
> +	input.pointer = args;
> +
> +	args->signature = 0x55434553;
> +	args->command = command;
> +	args->commandtype = query;
> +	args->datasize = insize;
> +	memcpy(args->data, buffer, flex_array_size(args, data, insize));
> +
> +	ret = wmi_evaluate_method(HP_WMI_BIOS_GUID, 0, mid, &input, &output);
> +	bioscfg_drv.last_wmi_status = ret;
> +	if (ret)
> +		goto out_free;
> +
> +	obj = output.pointer;
> +	if (!obj) {
> +		ret = -EINVAL;
> +		goto out_free;
> +	}
> +
> +	bios_return = (struct bios_return *)obj->buffer.pointer;
> +	ret = bios_return->return_code;
> +	bioscfg_drv.last_wmi_status = ret;
> +	if (ret) {
> +		if (ret != HPWMI_RET_UNKNOWN_COMMAND &&
> +		    ret != HPWMI_RET_UNKNOWN_CMDTYPE)
> +			pr_warn("query 0x%x returned error 0x%x\n", query, ret);
> +		goto out_free;
> +	}
> +
> +	/* Ignore output data of zero size */
> +	if (!outsize)
> +		goto out_free;
> +
> +	actual_outsize = min(outsize, (int)(obj->buffer.length - sizeof(*bios_return)));
> +	memcpy(buffer, obj->buffer.pointer + sizeof(*bios_return), actual_outsize);
> +	memset(buffer + actual_outsize, 0, outsize - actual_outsize);
> +
> +out_free:
> +	kfree(obj);
> +	kfree(args);
> +	return ret;
> +}
> +
> +/*
> + * ascii_to_utf16_unicode -  Convert ascii string to UTF-16 unicode
> + *
> + * @p:   Unicode buffer address
> + * @str: string to convert to unicode
> + *
> + * Returns a void pointer to the buffer containing unicode string
> + */
> +void *ascii_to_utf16_unicode(u16 *p, const u8 *str)
> +{
> +	int len = strlen(str);
> +	int ret;
> +
> +	/*
> +	 * Add null character when reading an empty string
> +	 */
> +	if (len == 0) {
> +		*p++ = 2;
> +		*p++ = (u8)0x00;
> +		return p;
> +	}
> +	*p++ = len * 2;
> +	ret = utf8s_to_utf16s(str, strlen(str), UTF16_HOST_ENDIAN, p, len);
> +
> +	if (ret < 0) {
> +		dev_err(bioscfg_drv.class_dev, "UTF16 conversion failed\n");
> +		goto ascii_to_utf16_unicode_out;
> +	}
> +
> +	if ((ret * sizeof(u16)) > U16_MAX) {
> +		dev_err(bioscfg_drv.class_dev, "Error string too long\n");
> +		goto ascii_to_utf16_unicode_out;
> +	}
> +
> +ascii_to_utf16_unicode_out:
> +	p += len;
> +	return p;
> +}
> +
> +/*
> + * hp_wmi_set_bios_setting - Set setting's value in BIOS
> + *
> + * @input_buffer: Input buffer address
> + * @input_size:   Input buffer size
> + *
> + * Returns: Count of unicode characters written to BIOS if successful, otherwise
> + *		-ENOMEM unable to allocate memory
> + *		-EINVAL buffer not allocated or too small
> + */
> +int hp_wmi_set_bios_setting(void *input_buffer, int input_size)
> +{
> +	union acpi_object *obj;
> +	struct acpi_buffer input = {input_size, input_buffer};
> +	struct acpi_buffer output = {ACPI_ALLOCATE_BUFFER, NULL};
> +	int ret = 0;
> +
> +	ret = wmi_evaluate_method(HP_WMI_SET_BIOS_SETTING_GUID, 0, 1, &input, &output);
> +
> +	obj = output.pointer;
> +	if (!obj)
> +		return -EINVAL;
> +
> +	if (obj->type != ACPI_TYPE_INTEGER)
> +		ret = -EINVAL;
> +
> +	ret = obj->integer.value;
> +
> +	kfree(obj);
> +	return ret;
> +}
> +
> +/*
> + * set_bios_defaults() - Resets BIOS defaults
> + *
> + * @deftype: the type of BIOS value reset to issue.
> + *
> + * Resets BIOS defaults
> + */
> +int set_bios_defaults(u8 deftype)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static int bios_attr_set_interface_probe(struct wmi_device *wdev, const void *context)
> +{
> +	mutex_lock(&bioscfg_drv.mutex);
> +	bioscfg_drv.bios_attr_wdev = wdev;
> +	mutex_unlock(&bioscfg_drv.mutex);
> +	return 0;
> +}
> +
> +static void bios_attr_set_interface_remove(struct wmi_device *wdev)
> +{
> +	mutex_lock(&bioscfg_drv.mutex);
> +	bioscfg_drv.bios_attr_wdev = NULL;
> +	mutex_unlock(&bioscfg_drv.mutex);
> +}
> +
> +static const struct wmi_device_id bios_attr_set_interface_id_table[] = {
> +	{ .guid_string = HP_WMI_BIOS_GUID},
> +	{ },
> +};
> +static struct wmi_driver bios_attr_set_interface_driver = {
> +	.driver = {
> +		.name = DRIVER_NAME
> +	},
> +	.probe = bios_attr_set_interface_probe,
> +	.remove = bios_attr_set_interface_remove,
> +	.id_table = bios_attr_set_interface_id_table,
> +};
> +
> +int init_bios_attr_set_interface(void)
> +{
> +	return wmi_driver_register(&bios_attr_set_interface_driver);
> +}
> +
> +void exit_bios_attr_set_interface(void)
> +{
> +	wmi_driver_unregister(&bios_attr_set_interface_driver);
> +}
> +
> +MODULE_DEVICE_TABLE(wmi, bios_attr_set_interface_id_table);
> diff --git a/drivers/platform/x86/hp/bioscfg.c b/drivers/platform/x86/hp/bioscfg.c
> new file mode 100644
> index 000000000000..f08bcae5752a
> --- /dev/null
> +++ b/drivers/platform/x86/hp/bioscfg.c
> @@ -0,0 +1,1029 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Common methods for use with hp-bioscfg driver
> + *
> + *  Copyright (c) 2022 HP Development Company, L.P.
> + */
> +
> +#include <asm-generic/errno-base.h>
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/fs.h>
> +#include <linux/dmi.h>
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/wmi.h>
> +#include "bioscfg.h"
> +#include "../firmware_attributes_class.h"
> +#include <linux/nls.h>
> +
> +MODULE_AUTHOR("Jorge Lopez <jorge.lopez2@hp.com>");
> +MODULE_DESCRIPTION("HP BIOS Configuration Driver");
> +MODULE_LICENSE("GPL");
> +
> +
> +#define MAX_TYPES  4
> +
> +struct bioscfg_priv bioscfg_drv = {
> +	.mutex = __MUTEX_INITIALIZER(bioscfg_drv.mutex),
> +};
> +
> +/* reset bios to defaults */
> +static const char * const reset_types[] = {"builtinsafe", "lastknowngood", "factory", "custom"};
> +static struct class *fw_attr_class;
> +
> +int get_integer_from_buffer(int **buffer, int *integer)
> +{
> +	int *ptr = PTR_ALIGN(*buffer, 4);
> +	*integer = *(ptr++);
> +	*buffer = ptr;
> +	return 0;
> +}
> +
> +int get_string_from_buffer(u16 **buffer, char **str)
> +{
> +	u16 *ptr = *buffer;
> +	u16 ptrlen;
> +
> +	u16 size;
> +	int i;
> +	char *output = NULL;
> +	int escape = 0;
> +
> +	ptrlen = *(ptr++);
> +	size = ptrlen / 2;
> +
> +	for (i = 0; i < size; i++)
> +		if (ptr[i] == '\\' || ptr[i] == '\r' || ptr[i] == '\n' || ptr[i] == '\t')
> +			escape++;
> +
> +	size += escape;
> +	*str = kcalloc(size + 1, sizeof(char), GFP_KERNEL);
> +	if (!*str)
> +		return -ENOMEM;
> +
> +	output = *str;
> +
> +	/*
> +	 * convert from UTF-16 unicode to ASCII
> +	 */
> +	utf16s_to_utf8s(ptr, ptrlen, UTF16_HOST_ENDIAN, output, size);
> +
> +	for (i = 0; i < size; i++) {
> +		if (*ptr == '\\' || *ptr == '\r' || *ptr == '\n' || *ptr == '\t')
> +			output[i++] = '\\';
> +
> +		if (*ptr == '\r')
> +			output[i] = 'r';
> +		else if (*ptr == '\n')
> +			output[i] = 'n';
> +		else if (*ptr == '\t')
> +			output[i] = 't';
> +		else if (*ptr == '"')
> +			output[i] = '\'';
> +		else
> +			output[i] = *ptr;
> +		ptr++;
> +	}
> +
> +	*buffer = ptr;
> +	return 0;
> +}
> +
> +int store_acpi_string_from_buffer(u16 **buffer, char *str_data, int str_data_len)
> +{
> +	int ret;
> +	char *str_read = NULL;
> +
> +	ret  = get_string_from_buffer(buffer, &str_read);
> +	if (ACPI_SUCCESS(ret))
> +		strscpy(str_data, str_read, str_data_len);
> +
> +	pr_warn("%s\n", str_data);
> +
> +	kfree(str_read);
> +	str_read = NULL;
> +	return ret;
> +}
> +
> +/*
> + * populate_string_buffer() - populates a string buffer
> + * @buffer: the start of the destination buffer
> + * @buffer_len: length of the destination buffer
> + * @str: the string to insert into buffer
> + */
> +ssize_t populate_string_buffer(u16 *buffer, size_t buffer_len, const char *str)
> +{
> +	u16 *target = buffer;
> +	int ret;
> +
> +	ret = utf8s_to_utf16s(str, strlen(str), UTF16_HOST_ENDIAN,
> +			      target, buffer_len - sizeof(u16));
> +	if (ret < 0) {
> +		dev_err(bioscfg_drv.class_dev, "UTF16 conversion failed\n");
> +		return ret;
> +	}
> +	if ((ret * sizeof(u16)) > U16_MAX) {
> +		dev_err(bioscfg_drv.class_dev, "Error string too long\n");
> +		return -ERANGE;
> +	}
> +	return buffer_len;
> +}
> +
> +/*
> + * calculate_string_buffer() - determines size of string buffer for use with BIOS communication
> + * @str: the string to calculate based upon
> + */
> +size_t calculate_string_buffer(const char *str)
> +{
> +	/* u16 length field + one UTF16 char for each input char */
> +	int size =  sizeof(u16) + strlen(str) * sizeof(u16);
> +
> +	return size;
> +}
> +
> +int wmi_error_and_message(int error_code, char *msg)
> +{
> +	char *error_msg = NULL;
> +	int ret = -EIO;
> +
> +	switch (error_code) {
> +	case SUCCESS:
> +		error_msg = "Success";
> +		ret = 0;
> +		break;
> +	case CMD_FAILED:
> +		error_msg = "Command failed";
> +		ret = -EINVAL;
> +		break;
> +	case INVALID_SIGN:
> +		error_msg = "Invalid signature";
> +		ret = -EINVAL;
> +		break;
> +	case INVALID_CMD_VALUE:
> +		error_msg = "Invalid command value/Feature not supported";
> +		ret = -EOPNOTSUPP;
> +		break;
> +	case INVALID_CMD_TYPE:
> +		error_msg = "Invalid command type";
> +		ret = -EINVAL;
> +		break;
> +	case INVALID_DATA_SIZE:
> +		error_msg = "Invalid data size";
> +		ret = -EINVAL;
> +		break;
> +	case INVALID_CMD_PARAM:
> +		error_msg = "Invalid command parameter";
> +		ret = -EINVAL;
> +		break;
> +	case ENCRYP_CMD_REQUIRED:
> +		error_msg = "Secure/encrypted command required";
> +		ret = -EACCES;
> +		break;
> +	case NO_SECURE_SESSION:
> +		error_msg = "No secure session established";
> +		ret = -EACCES;
> +		break;
> +	case SECURE_SESSION_FOUND:
> +		error_msg = "Secure session already established";
> +		ret = -EACCES;
> +		break;
> +	case SECURE_SESSION_FAILED:
> +		error_msg = "Secure session failed";
> +		ret = -EIO;
> +		break;
> +	case AUTH_FAILED:
> +		error_msg = "Other permission/Authentication failed";
> +		ret = -EACCES;
> +		break;
> +	case INVALID_BIOS_AUTH:
> +		error_msg = "Invalid BIOS administrator password";
> +		ret = -EINVAL;
> +		break;
> +	case NONCE_DID_NOT_MATCH:
> +		error_msg = "Nonce did not match";
> +		ret = -EINVAL;
> +		break;
> +	case GENERIC_ERROR:
> +		error_msg = "Generic/Other error";
> +		ret = -EIO;
> +		break;
> +	case BIOS_ADMIN_POLICY_NOT_MET:
> +		error_msg = "BIOS Admin password does not meet password policy requirements";
> +		ret = -EINVAL;
> +		break;
> +	case BIOS_ADMIN_NOT_SET:
> +		error_msg = "BIOS Setup password is not set.";
> +		ret = -EPERM;
> +		break;
> +	case P21_NO_PROVISIONED:
> +		error_msg = "P21 is not provisioned";
> +		ret = -EPERM;
> +		break;
> +	case P21_PROVISION_IN_PROGRESS:
> +		error_msg = "P21 is already provisioned or provisioning is in progress and a signing key has already been sent.";
> +		ret = -EINPROGRESS;
> +		break;
> +	case P21_IN_USE:
> +		error_msg = "P21 in use (cannot deprovision)";
> +		ret = -EPERM;
> +		break;

What exactly is P21?  Can this be a more friendly error?

> +	case HEP_NOT_ACTIVE:
> +		error_msg = "HEP not activated";
> +		ret = -EPERM;
> +		break;
> +	case HEP_ALREADY_SET:
> +		error_msg = "HEP Transport already set";
> +		ret = -EINVAL;
> +		break;
> +	case HEP_CHECK_STATE:
> +		error_msg = "Check the current HEP state";
> +		ret = -EINVAL;
> +		break;

What's HEP?  Can this be a more friendly error?

> +	default:
> +		error_msg = "Generic/Other error";
> +		ret = -EIO;
> +		break;
> +	}
> +
> +	sprintf(msg, "%d,\"%s\"", error_code, error_msg);
> +	return error_code;
> +}
> +
> +/*
> + * reset_bios_show() - sysfs implementaton for read reset_bios
> + * @kobj: Kernel object for this attribute
> + * @attr: Kernel object attribute
> + * @buf: The buffer to display to userspace
> + */
> +static ssize_t reset_bios_show(struct kobject *kobj,
> +			       struct kobj_attribute *attr, char *buf)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +/*
> + * reset_bios_store() - sysfs implementaton for write reset_bios
> + * @kobj: Kernel object for this attribute
> + * @attr: Kernel object attribute
> + * @buf: The buffer from userspace
> + * @count: the size of the buffer from userspace
> + */
> +static ssize_t reset_bios_store(struct kobject *kobj,
> +				struct kobj_attribute *attr,
> +				const char *buf, size_t count)
> +{
> +	return -EOPNOTSUPP;
> +}
> +static struct kobj_attribute reset_bios = __ATTR_RW(reset_bios);
> +
> +/*
> + * pending_reboot_show() - sysfs implementaton for read pending_reboot
> + * @kobj: Kernel object for this attribute
> + * @attr: Kernel object attribute
> + * @buf: The buffer to display to userspace
> + *
> + * Stores default value as 0
> + * When current_value is changed this attribute is set to 1 to notify reboot may be required
> + */
> +static ssize_t pending_reboot_show(struct kobject *kobj,
> +				   struct kobj_attribute *attr,
> +				   char *buf)
> +{
> +	return sprintf(buf, "%d\n", bioscfg_drv.pending_reboot);
> +}
> +static struct kobj_attribute pending_reboot = __ATTR_RO(pending_reboot);
> +
> +/*
> + * last_error_show() - sysfs implementaton for reporting the WMI
> + * error/success value.
> + * @kobj: Kernel object for this attribute
> + * @attr: Kernel object attribute
> + * @buf: The buffer to display to userspace
> + */
> +static ssize_t last_error_show(struct kobject *kobj,
> +			       struct kobj_attribute *attr,
> +				   char *buf)
> +{
> +	wmi_error_and_message(bioscfg_drv.last_wmi_status, buf);
> +	return sprintf(buf, "%s\n", buf);
> +}
> +static struct kobj_attribute last_error = __ATTR_RO(last_error);
> +
> +/*
> + * create_attributes_level_sysfs_files() - Creates reset_bios,
> + * pending_reboot, and last_error attributes
> + */
> +static int create_attributes_level_sysfs_files(void)
> +{
> +	int ret;
> +
> +	ret = sysfs_create_file(&bioscfg_drv.main_dir_kset->kobj, &reset_bios.attr);
> +	if (ret)
> +		return ret;
> +
> +	ret = sysfs_create_file(&bioscfg_drv.main_dir_kset->kobj, &pending_reboot.attr);
> +	if (ret)
> +		return ret;
> +
> +	ret = sysfs_create_file(&bioscfg_drv.main_dir_kset->kobj, &last_error.attr);
> +	if (ret)
> +		return ret;
> +
> +	bioscfg_drv.last_wmi_status = 0;
> +	return 0;
> +}
> +
> +
> +static ssize_t bioscfg_attr_show(struct kobject *kobj, struct attribute *attr,
> +				    char *buf)
> +{
> +	struct kobj_attribute *kattr;
> +	ssize_t ret = -EIO;
> +
> +	kattr = container_of(attr, struct kobj_attribute, attr);
> +	if (kattr->show)
> +		ret = kattr->show(kobj, kattr, buf);
> +	return ret;
> +}
> +
> +static ssize_t bioscfg_attr_store(struct kobject *kobj, struct attribute *attr,
> +				     const char *buf, size_t count)
> +{
> +	struct kobj_attribute *kattr;
> +	ssize_t ret = -EIO;
> +
> +	kattr = container_of(attr, struct kobj_attribute, attr);
> +	if (kattr->store)
> +		ret = kattr->store(kobj, kattr, buf, count);
> +	return ret;
> +}
> +
> +static const struct sysfs_ops bioscfg_kobj_sysfs_ops = {
> +	.show	= bioscfg_attr_show,
> +	.store	= bioscfg_attr_store,
> +};
> +
> +static void attr_name_release(struct kobject *kobj)
> +{
> +	kfree(kobj);
> +}
> +
> +static struct kobj_type attr_name_ktype = {
> +	.release	= attr_name_release,
> +	.sysfs_ops	= &bioscfg_kobj_sysfs_ops,
> +};
> +
> +/*
> + * strlcpy_attr - Copy a length-limited, NULL-terminated string with bound checks
> + * @dest: Where to copy the string to
> + * @src: Where to copy the string from
> + */
> +void strlcpy_attr(char *dest, char *src)
> +{
> +	size_t len = strlen(src) + 1;
> +
> +	if (len > 1 && len <= MAX_BUFF)
> +		strscpy(dest, src, len);
> +
> +	/*
> +	 * len can be zero because any property not-applicable to attribute can
> +	 * be empty so check only for too long buffers and log error
> +	 */
> +	if (len > MAX_BUFF)
> +		pr_err("Source string returned from BIOS is out of bound!\n");
> +}
> +
> +/*
> + * get_wmiobj_pointer() - Get Content of WMI block for particular instance
> + *
> + * @instance_id: WMI instance ID
> + * @guid_string: WMI GUID (in str form)
> + *
> + * Fetches the content for WMI block (instance_id) under GUID (guid_string)
> + * Caller must kfree the return
> + */
> +union acpi_object *get_wmiobj_pointer(int instance_id, const char *guid_string)
> +{
> +	struct acpi_buffer out = { ACPI_ALLOCATE_BUFFER, NULL };
> +	acpi_status status;
> +
> +	status = wmi_query_block(guid_string, instance_id, &out);
> +	return ACPI_SUCCESS(status) ? (union acpi_object *)out.pointer : NULL;
> +}
> +
> +/*
> + * get_instance_count() - Compute total number of instances under guid_string
> + *
> + * @guid_string: WMI GUID (in string form)
> + */
> +int get_instance_count(const char *guid_string)
> +{
> +	union acpi_object *wmi_obj = NULL;
> +	int i = 0;
> +
> +	do {
> +		kfree(wmi_obj);
> +		wmi_obj = get_wmiobj_pointer(i, guid_string);
> +		i++;
> +	} while (wmi_obj);
> +
> +	return (i-1);
> +}
> +
> +/*
> + * alloc_attributes_data() - Allocate attributes data for a particular type
> + *
> + * @attr_type: Attribute type to allocate
> + */
> +static int alloc_attributes_data(int attr_type)
> +{
> +	int retval = 0;
> +
> +	switch (attr_type) {
> +	case HPWMI_STRING_TYPE:
> +		retval = alloc_string_data();
> +		break;
> +	case HPWMI_INTEGER_TYPE:
> +		retval = alloc_integer_data();
> +		break;
> +	case HPWMI_ENUMERATION_TYPE:
> +		retval = alloc_enumeration_data();
> +		break;
> +	case HPWMI_ORDERED_LIST_TYPE:
> +		retval = alloc_ordered_list_data();
> +		break;
> +	case HPWMI_PASSWORD_TYPE:
> +		retval = alloc_password_data();
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return retval;
> +}
> +
> +int convert_hexstr_to_int(char *str, int *int_value)
> +{
> +	int ret;
> +
> +	ret = kstrtou32(str, 10, int_value);
> +	return ret;
> +}
> +
> +int convert_hexstr_to_str(char **hex, int input_len, char **str, int *len)
> +{
> +	int ret = 0;
> +	int new_len = 0;
> +	char tmp[] = "0x00";
> +	char *input = *hex;
> +	char *new_str = NULL;
> +	long  ch;
> +	int i;
> +
> +	if (input_len <= 0 || hex == NULL || str == NULL || len == NULL)
> +		return -EINVAL;
> +
> +	*len = 0;
> +	*str = NULL;
> +
> +	new_str = kmalloc(input_len, GFP_KERNEL);
> +	if (!new_str)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < input_len; i += 5) {
> +		strncpy(tmp, input + i, strlen(tmp));
> +		if (kstrtol(tmp, 16, &ch) == 0) {
> +			// escape char
> +			if (ch == '\\' || ch == '\r' || ch == '\n' || ch == '\t') {
> +				if (ch == '\r')
> +					ch = 'r';
> +				else if (ch == '\n')
> +					ch = 'n';
> +				else if (ch == '\t')
> +					ch = 't';
> +				new_str[new_len++] = '\\';
> +			}
> +			new_str[new_len++] = ch;
> +			if (ch == '\0')
> +				break;
> +		}
> +	}
> +
> +	if (new_len) {
> +		new_str[new_len] = '\0';
> +		*str = krealloc(new_str, (new_len + 1) * sizeof(char), GFP_KERNEL);
> +		if (*str)
> +			*len = new_len;
> +		else
> +			ret = -ENOMEM;
> +	} else {
> +		ret = -EFAULT;
> +	}
> +
> +	if (ret)
> +		kfree(new_str);
> +	return ret;
> +}
> +
> +/* map output size to the corresponding WMI method id */
> +inline int encode_outsize_for_pvsz(int outsize)
> +{
> +	if (outsize > 4096)
> +		return -EINVAL;
> +	if (outsize > 1024)
> +		return 5;
> +	if (outsize > 128)
> +		return 4;
> +	if (outsize > 4)
> +		return 3;
> +	if (outsize > 0)
> +		return 2;
> +	return 1;
> +}
> +
> +/**
> + * destroy_attribute_objs() - Free a kset of kobjects
> + * @kset: The kset to destroy
> + *
> + * Fress kobjects created for each attribute_name under attribute type kset
> + */
> +static void destroy_attribute_objs(struct kset *kset)
> +{
> +	struct kobject *pos, *next;
> +
> +	list_for_each_entry_safe(pos, next, &kset->list, entry)
> +		kobject_put(pos);
> +}
> +
> +/**
> + * release_attributes_data() - Clean-up all sysfs directories and files created
> + */
> +static void release_attributes_data(void)
> +{
> +	mutex_lock(&bioscfg_drv.mutex);
> +
> +	exit_string_attributes();
> +	exit_integer_attributes();
> +	exit_enumeration_attributes();
> +	exit_ordered_list_attributes();
> +	exit_password_attributes();
> +	exit_sure_start_attributes();
> +	exit_sure_admin_attributes();
> +	exit_secure_platform_attributes();
> +
> +	if (bioscfg_drv.authentication_dir_kset) {
> +		destroy_attribute_objs(bioscfg_drv.authentication_dir_kset);
> +		kset_unregister(bioscfg_drv.authentication_dir_kset);
> +		bioscfg_drv.authentication_dir_kset = NULL;
> +	}
> +	if (bioscfg_drv.main_dir_kset) {
> +		sysfs_remove_file(&bioscfg_drv.main_dir_kset->kobj, &reset_bios.attr);
> +		sysfs_remove_file(&bioscfg_drv.main_dir_kset->kobj, &pending_reboot.attr);
> +		sysfs_remove_file(&bioscfg_drv.main_dir_kset->kobj, &last_error.attr);
> +		destroy_attribute_objs(bioscfg_drv.main_dir_kset);
> +		kset_unregister(bioscfg_drv.main_dir_kset);
> +		bioscfg_drv.main_dir_kset = NULL;
> +	}
> +	mutex_unlock(&bioscfg_drv.mutex);
> +}
> +
> +
> +/*
> + * hp_add_other_attributes - Initialize HP custom attributes not reported by
> + * BIOS and required to support Secure Platform, Sure Start, and Sure
> + * Admin.
> + * @attr_type: Custom HP attribute not reported by BIOS
> + *
> + * Initialiaze all 3 types of attributes: Platform, Sure Start, and Sure
> + * Admin object.  Populates each attrbute types respective properties
> + * under sysfs files.
> + *
> + * Returns zero(0) if successful.  Otherwise, a negative value.
> + */
> +static int hp_add_other_attributes(int attr_type)
> +{
> +	struct kobject *attr_name_kobj;
> +	union acpi_object *obj = NULL;
> +	int retval = 0;
> +	u8 *attr_name;
> +
> +	mutex_lock(&bioscfg_drv.mutex);
> +
> +	attr_name_kobj = kzalloc(sizeof(*attr_name_kobj), GFP_KERNEL);
> +	if (!attr_name_kobj) {
> +		retval = -ENOMEM;
> +		goto err_other_attr_init;
> +	}
> +
> +	/* Check if attribute type is supported */
> +	switch (attr_type) {
> +	case HPWMI_SECURE_PLATFORM_TYPE:
> +		attr_name_kobj->kset = bioscfg_drv.authentication_dir_kset;
> +		attr_name = SPM_STR;
> +		break;
> +
> +	case HPWMI_SURE_START_TYPE:
> +		attr_name_kobj->kset = bioscfg_drv.main_dir_kset;
> +		attr_name = SURE_START_STR;
> +		break;
> +
> +	case HPWMI_SURE_ADMIN_TYPE:
> +		attr_name_kobj->kset = bioscfg_drv.main_dir_kset;
> +		attr_name = SURE_ADMIN_STR;
> +		break;
> +	default:
> +		pr_err("Error: Unknown attr_type: %d\n", attr_type);
> +		retval = -EINVAL;
> +		goto err_other_attr_init;
> +	}
> +
> +	retval = kobject_init_and_add(attr_name_kobj, &attr_name_ktype,
> +				      NULL, "%s", attr_name);
> +	if (retval) {
> +		pr_err("Error encountered [%d]\n", retval);
> +		kobject_put(attr_name_kobj);
> +		goto err_other_attr_init;
> +	}
> +
> +	/* Populate attribute data */
> +	switch (attr_type) {
> +	case HPWMI_SECURE_PLATFORM_TYPE:
> +		retval = populate_secure_platform_data(attr_name_kobj);
> +		break;
> +
> +	case HPWMI_SURE_START_TYPE:
> +		retval = populate_sure_start_data(attr_name_kobj);
> +		break;
> +
> +	case HPWMI_SURE_ADMIN_TYPE:
> +		retval = populate_sure_admin_data(attr_name_kobj);
> +		break;
> +
> +	default:
> +		goto err_other_attr_init;
> +	}
> +
> +	mutex_unlock(&bioscfg_drv.mutex);
> +	return 0;
> +
> +err_other_attr_init:
> +	mutex_unlock(&bioscfg_drv.mutex);
> +	kfree(obj);
> +	return retval;
> +}
> +
> +/*
> + * hp_init_bios_attributes - Initialize all attributes for a type
> + * @attr_type: The attribute type to initialize
> + * @guid: The WMI GUID associated with this type to initialize
> + *
> + * Initialiaze all 5 types of attributes: enumeration, integer,
> + * string, password, ordered list  object.  Populates each attrbute types
> + * respective properties under sysfs files
> + */
> +static int hp_init_bios_attributes(int attr_type, const char *guid)
> +{
> +	struct kobject *attr_name_kobj;
> +	union acpi_object *obj = NULL;
> +	union acpi_object *elements;
> +	struct kset *tmp_set;
> +	int min_elements;
> +	char *str = NULL;
> +	char *temp_str = NULL;
> +	char *str_value = NULL;
> +	int str_len;
> +	int ret = 0;
> +
> +	/* instance_id needs to be reset for each type GUID
> +	 * also, instance IDs are unique within GUID but not across
> +	 */
> +	int instance_id = 0;
> +	int retval = 0;
> +
> +	retval = alloc_attributes_data(attr_type);
> +	if (retval)
> +		return retval;
> +
> +	switch (attr_type) {
> +	case HPWMI_STRING_TYPE:
> +		min_elements = 12;
> +		break;
> +	case HPWMI_INTEGER_TYPE:
> +		min_elements = 13;
> +		break;
> +	case HPWMI_ENUMERATION_TYPE:
> +		min_elements = 13;
> +		break;
> +	case HPWMI_ORDERED_LIST_TYPE:
> +		min_elements = 12;
> +		break;
> +	case HPWMI_PASSWORD_TYPE:
> +		min_elements = 15;
> +		break;
> +	default:
> +		pr_err("Error: Unknown attr_type: %d\n", attr_type);
> +		return -EINVAL;
> +	}
> +
> +	/* need to use specific instance_id and guid combination to get right data */
> +	obj = get_wmiobj_pointer(instance_id, guid);
> +
> +	if (!obj)
> +		return -ENODEV;
> +
> +	mutex_lock(&bioscfg_drv.mutex);
> +	while (obj) {
> +		if (obj->type != ACPI_TYPE_PACKAGE && obj->type != ACPI_TYPE_BUFFER) {
> +			pr_err("Error: Expected ACPI-package or buffer type, got: %d\n", obj->type);
> +			retval = -EIO;
> +			goto err_attr_init;
> +		}
> +
> +		/* Take action appropriate to each ACPI TYPE */
> +		if (obj->type == ACPI_TYPE_PACKAGE) {
> +			if (obj->package.count < min_elements) {
> +				pr_err("Error: ACPI-package does not have enough elements: %d < %d\n",
> +				       obj->package.count, min_elements);
> +				goto nextobj;
> +			}
> +
> +			elements = obj->package.elements;
> +			/* sanity checking */
> +			if (elements[NAME].type != ACPI_TYPE_STRING) {
> +				pr_debug("incorrect element type\n");
> +				goto nextobj;
> +			}
> +			if (strlen(elements[NAME].string.pointer) == 0) {
> +				pr_debug("empty attribute found\n");
> +				goto nextobj;
> +			}
> +			if (attr_type == HPWMI_PASSWORD_TYPE)
> +				tmp_set = bioscfg_drv.authentication_dir_kset;
> +			else
> +				tmp_set = bioscfg_drv.main_dir_kset;
> +
> +			/* convert attribute name to string */
> +			retval = convert_hexstr_to_str(&(elements[NAME].string.pointer),
> +						       elements[NAME].string.length,
> +						       &str_value, &str_len);
> +
> +			if (ACPI_FAILURE(retval)) {
> +				pr_warn("Failed to populate integer package data. Error [0%0x]\n", ret);
> +				kfree(str_value);
> +				return ret;
> +			}
> +
> +			if (kset_find_obj(tmp_set, str_value)) {
> +				pr_debug("Duplicate attribute name found - %s\n",
> +					 str_value);
> +				goto nextobj;
> +			}
> +
> +			/* build attribute */
> +			attr_name_kobj = kzalloc(sizeof(*attr_name_kobj), GFP_KERNEL);
> +			if (!attr_name_kobj) {
> +				retval = -ENOMEM;
> +				goto err_attr_init;
> +			}
> +
> +			attr_name_kobj->kset = tmp_set;
> +
> +			retval = kobject_init_and_add(attr_name_kobj, &attr_name_ktype,
> +						      NULL, "%s", str_value);
> +			if (retval) {
> +				kobject_put(attr_name_kobj);
> +				goto err_attr_init;
> +			}
> +
> +			/* enumerate all of these attributes */
> +			switch (attr_type) {
> +			case HPWMI_STRING_TYPE:
> +				retval = populate_string_package_data(elements,
> +								      instance_id,
> +								      attr_name_kobj);
> +				break;
> +			case HPWMI_INTEGER_TYPE:
> +				retval = populate_integer_package_data(elements,
> +								       instance_id,
> +								       attr_name_kobj);
> +				break;
> +			case HPWMI_ENUMERATION_TYPE:
> +				retval = populate_enumeration_package_data(elements,
> +									   instance_id,
> +									   attr_name_kobj);
> +				break;
> +			case HPWMI_ORDERED_LIST_TYPE:
> +				retval = populate_ordered_list_package_data(elements,
> +									    instance_id,
> +									    attr_name_kobj);
> +				break;
> +			case HPWMI_PASSWORD_TYPE:
> +				retval = populate_password_package_data(elements,
> +									instance_id,
> +									attr_name_kobj);
> +				break;
> +			default:
> +				break;
> +			}
> +
> +			kfree(str_value);
> +			str_value = NULL;
> +		}
> +
> +		if (obj->type == ACPI_TYPE_BUFFER) {
> +			retval = get_string_from_buffer((u16 **)&obj->buffer.pointer, &str);
> +
> +			if (attr_type == HPWMI_PASSWORD_TYPE || attr_type == HPWMI_SECURE_PLATFORM_TYPE)
> +				tmp_set = bioscfg_drv.authentication_dir_kset;
> +			else
> +				tmp_set = bioscfg_drv.main_dir_kset;
> +
> +			if (kset_find_obj(tmp_set, str)) {
> +				pr_warn("Duplicate attribute name found - %s\n",
> +					 str);
> +				goto nextobj;
> +			}
> +
> +			/* build attribute */
> +			attr_name_kobj = kzalloc(sizeof(*attr_name_kobj), GFP_KERNEL);
> +			if (!attr_name_kobj) {
> +				retval = -ENOMEM;
> +				goto err_attr_init;
> +			}
> +
> +			attr_name_kobj->kset = tmp_set;
> +
> +			temp_str = str;
> +			if (attr_type == HPWMI_SECURE_PLATFORM_TYPE)
> +				temp_str = "SPM";
> +
> +			retval = kobject_init_and_add(attr_name_kobj,
> +						      &attr_name_ktype, NULL, "%s",
> +						      temp_str);
> +			if (retval) {
> +				kobject_put(attr_name_kobj);
> +				goto err_attr_init;
> +			}
> +
> +			/* enumerate all of these attributes */
> +			switch (attr_type) {
> +			case HPWMI_STRING_TYPE:
> +				retval = populate_string_buffer_data(obj, instance_id, attr_name_kobj);
> +				break;
> +			case HPWMI_INTEGER_TYPE:
> +				retval = populate_integer_buffer_data(obj, instance_id, attr_name_kobj);
> +				break;
> +			case HPWMI_ENUMERATION_TYPE:
> +				retval = populate_enumeration_buffer_data(obj, instance_id, attr_name_kobj);
> +				break;
> +			case HPWMI_ORDERED_LIST_TYPE:
> +				retval = populate_ordered_list_buffer_data(obj, instance_id, attr_name_kobj);
> +				break;
> +			case HPWMI_PASSWORD_TYPE:
> +				retval = populate_password_buffer_data(obj, instance_id, attr_name_kobj);
> +				break;
> +			default:
> +				break;
> +			}
> +		}
> +
> +nextobj:
> +		kfree(obj);
> +		instance_id++;
> +		obj = get_wmiobj_pointer(instance_id, guid);
> +	}
> +	mutex_unlock(&bioscfg_drv.mutex);
> +	return 0;
> +
> +err_attr_init:
> +	mutex_unlock(&bioscfg_drv.mutex);
> +	kfree(obj);
> +	return retval;
> +}
> +
> +static int __init bioscfg_init(void)
> +{
> +	int ret = 0;
> +	int bios_capable = wmi_has_guid(HP_WMI_BIOS_GUID);
> +
> +	if (!bios_capable) {
> +		pr_err("Unable to run on non-HP system\n");
> +		return -ENODEV;
> +	}
> +
> +	ret = init_bios_attr_set_interface();
> +	if (ret)
> +		return ret;
> +
> +	ret = init_bios_attr_pass_interface();
> +	if (ret)
> +		goto err_exit_bios_attr_set_interface;
> +
> +	if (!bioscfg_drv.bios_attr_wdev || !bioscfg_drv.password_attr_wdev) {
> +		pr_debug("Failed to find set or pass interface\n");
> +		ret = -ENODEV;
> +		goto err_exit_bios_attr_pass_interface;
> +	}
> +
> +	ret = fw_attributes_class_get(&fw_attr_class);
> +	if (ret)
> +		goto err_exit_bios_attr_pass_interface;
> +
> +	bioscfg_drv.class_dev = device_create(fw_attr_class, NULL, MKDEV(0, 0),
> +					      NULL, "%s", DRIVER_NAME);
> +	if (IS_ERR(bioscfg_drv.class_dev)) {
> +		ret = PTR_ERR(bioscfg_drv.class_dev);
> +		goto err_unregister_class;
> +	}
> +
> +	bioscfg_drv.main_dir_kset = kset_create_and_add("attributes", NULL,
> +						     &bioscfg_drv.class_dev->kobj);
> +	if (!bioscfg_drv.main_dir_kset) {
> +		ret = -ENOMEM;
> +		pr_debug("Failed to create and add attributes\n");
> +		goto err_destroy_classdev;
> +	}
> +
> +	bioscfg_drv.authentication_dir_kset = kset_create_and_add("authentication", NULL,
> +								&bioscfg_drv.class_dev->kobj);
> +	if (!bioscfg_drv.authentication_dir_kset) {
> +		ret = -ENOMEM;
> +		pr_debug("Failed to create and add authentication\n");
> +		goto err_release_attributes_data;
> +	}
> +
> +	/*
> +	 * sysfs level attributes.
> +	 * - reset_bios
> +	 * - pending_reboot
> +	 * - last_error (WMI error)
> +	 */
> +	ret = create_attributes_level_sysfs_files();
> +	if (ret)
> +		pr_debug("Failed to create sysfs level attributes\n");
> +
> +	ret = hp_init_bios_attributes(HPWMI_STRING_TYPE, HP_WMI_BIOS_STRING_GUID);
> +	if (ret)
> +		pr_debug("Failed to populate string type attributes\n");
> +
> +	ret = hp_init_bios_attributes(HPWMI_INTEGER_TYPE, HP_WMI_BIOS_INTEGER_GUID);
> +	if (ret)
> +		pr_debug("Failed to populate integer type attributes\n");
> +
> +	ret = hp_init_bios_attributes(HPWMI_ENUMERATION_TYPE, HP_WMI_BIOS_ENUMERATION_GUID);
> +	if (ret)
> +		pr_debug("Failed to populate enumeration type attributes\n");
> +
> +	ret = hp_init_bios_attributes(HPWMI_ORDERED_LIST_TYPE, HP_WMI_BIOS_ORDERED_LIST_GUID);
> +	if (ret)
> +		pr_debug("Failed to populate ordered list object type attributes\n");
> +
> +	ret = hp_init_bios_attributes(HPWMI_PASSWORD_TYPE, HP_WMI_BIOS_PASSWORD_GUID);
> +	if (ret)
> +		pr_debug("Failed to populate password object type attributes\n");
> +
> +	ret = hp_add_other_attributes(HPWMI_SECURE_PLATFORM_TYPE);
> +	if (ret)
> +		pr_debug("Failed to populate secure platform object type attribute\n");
> +
> +	ret = hp_add_other_attributes(HPWMI_SURE_START_TYPE);
> +	if (ret)
> +		pr_debug("Failed to populate sure start object type attribute\n");
> +
> +	ret = hp_add_other_attributes(HPWMI_SURE_ADMIN_TYPE);
> +	if (ret)
> +		pr_debug("Failed to populate sure admin object type attribute\n");
> +
> +	return 0;
> +
> +err_release_attributes_data:
> +	release_attributes_data();
> +
> +err_destroy_classdev:
> +	device_destroy(fw_attr_class, MKDEV(0, 0));
> +
> +err_unregister_class:
> +	fw_attributes_class_put();
> +
> +err_exit_bios_attr_pass_interface:
> +	exit_bios_attr_pass_interface();
> +
> +err_exit_bios_attr_set_interface:
> +	exit_bios_attr_set_interface();
> +
> +	return ret;
> +}
> +
> +static void __exit bioscfg_exit(void)
> +{
> +	release_attributes_data();
> +	device_destroy(fw_attr_class, MKDEV(0, 0));
> +
> +	fw_attributes_class_put();
> +	exit_bios_attr_set_interface();
> +	exit_bios_attr_pass_interface();
> +}
> +
> +module_init(bioscfg_init);
> +module_exit(bioscfg_exit);
> diff --git a/drivers/platform/x86/hp/bioscfg.h b/drivers/platform/x86/hp/bioscfg.h
> new file mode 100644
> index 000000000000..ac02c8c1e5f2
> --- /dev/null
> +++ b/drivers/platform/x86/hp/bioscfg.h
> @@ -0,0 +1,667 @@
> +/* SPDX-License-Identifier: GPL-2.0
> + *
> + * Definitions for kernel modules using hp_bioscfg driver
> + *
> + *  Copyright (c) 2022 HP Development Company, L.P.
> + */
> +
> +#ifndef _HP_BIOSCFG_H_
> +#define _HP_BIOSCFG_H_
> +
> +#include <linux/wmi.h>
> +#include <linux/types.h>
> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/capability.h>
> +#include <linux/nls.h>
> +
> +
> +#define DRIVER_NAME	"hp-bioscfg"
> +
> +#define MAX_BUFF		512
> +#define MAX_KEY_MOD		256
> +#define MAX_PASSWD_SIZE		64
> +#define MAX_MESSAGE_SIZE        256
> +
> +#define SPM_STR_DESC	"Secure Platform Management"
> +#define SPM_STR		"SPM"
> +#define SURE_START_DESC "Sure Start"
> +#define SURE_START_STR  "Sure_Start"
> +#define SURE_ADMIN_DESC "Sure Admin"
> +#define SURE_ADMIN_STR  "Sure_Admin"
> +#define SETUP_PASSWD	"Setup Password"
> +#define POWER_ON_PASSWD	"Power-On Password"
> +
> +#define LANG_CODE_STR	"en_US.UTF-8"
> +
> +/* Sure Admin Functions */
> +
> +#define UTF_PREFIX	((unsigned char *)"<utf-16/>")
> +#define BEAM_PREFIX	((unsigned char *)"<BEAM/>")
> +
> +/* mechanism - Authentication attribute */
> +
> +#define MAX_MECHANISM_TYPES 3
> +
> +enum mechanism_values {
> +	PASSWORD	= 0x00,
> +	NOT_PROVISION   = 0x00,
> +	SIGNING_KEY	= 0x01,
> +	ENDORSEMENT_KEY = 0x02
> +};
> +
> +static const char * const spm_mechanism_types[] = {
> +	"not provision",
> +	"signing-key",
> +	"endorsement-key"
> +};
> +
> +static const char * const passwd_mechanism_types[] = {
> +	"password",
> +};
> +
> +/* roles - Authentication attribute */
> +enum role_values {
> +	BIOS_ADMIN	= 0x00,
> +	POWER_ON	= 0x01,
> +	BIOS_SPM	= 0x02
> +};
> +
> +static const char * const role_type[] = {
> +	"bios-admin",
> +	"power-on",
> +	"enhanced-bios-auth"
> +};
> +
> +
> +#define HP_WMI_BIOS_GUID		"5FB7F034-2C63-45e9-BE91-3D44E2C707E4"
> +
> +#define HP_WMI_BIOS_STRING_GUID		"988D08E3-68F4-4c35-AF3E-6A1B8106F83C"
> +#define HP_WMI_BIOS_INTEGER_GUID	"8232DE3D-663D-4327-A8F4-E293ADB9BF05"
> +#define HP_WMI_BIOS_ENUMERATION_GUID	"2D114B49-2DFB-4130-B8FE-4A3C09E75133"
> +#define HP_WMI_BIOS_ORDERED_LIST_GUID	"14EA9746-CE1F-4098-A0E0-7045CB4DA745"
> +#define HP_WMI_BIOS_PASSWORD_GUID	"322F2028-0F84-4901-988E-015176049E2D"
> +#define HP_WMI_SET_BIOS_SETTING_GUID	"1F4C91EB-DC5C-460b-951D-C7CB9B4B8D5E"
> +
> +enum hp_wmi_spm_commandtype {
> +	HPWMI_SECUREPLATFORM_GET_STATE  = 0x10,
> +	HPWMI_SECUREPLATFORM_SET_KEK	= 0x11,
> +	HPWMI_SECUREPLATFORM_SET_SK	= 0x12,
> +};
> +
> +enum hp_wmi_surestart_commandtype {
> +	HPWMI_SURESTART_GET_LOG_COUNT	= 0x01,
> +	HPWMI_SURESTART_GET_LOG		= 0x02,
> +};
> +
> +enum hp_wmi_command {
> +	HPWMI_READ		= 0x01,
> +	HPWMI_WRITE		= 0x02,
> +	HPWMI_ODM		= 0x03,
> +	HPWMI_SURESTART		= 0x20006,
> +	HPWMI_GM		= 0x20008,
> +	HPWMI_SECUREPLATFORM	= 0x20010,
> +};
> +
> +struct bios_return {
> +	u32 sigpass;
> +	u32 return_code;
> +};
> +
> +enum hp_return_value {
> +	HPWMI_RET_WRONG_SIGNATURE	= 0x02,
> +	HPWMI_RET_UNKNOWN_COMMAND	= 0x03,
> +	HPWMI_RET_UNKNOWN_CMDTYPE	= 0x04,
> +	HPWMI_RET_INVALID_PARAMETERS	= 0x05,
> +};
> +
> +enum wmi_error_values {
> +	SUCCESS			= 0x00,
> +	CMD_FAILED			= 0x01,
> +	INVALID_SIGN			= 0x02,
> +	INVALID_CMD_VALUE		= 0x03,
> +	INVALID_CMD_TYPE		= 0x04,
> +	INVALID_DATA_SIZE		= 0x05,
> +	INVALID_CMD_PARAM		= 0x06,
> +	ENCRYP_CMD_REQUIRED		= 0x07,
> +	NO_SECURE_SESSION		= 0x08,
> +	SECURE_SESSION_FOUND		= 0x09,
> +	SECURE_SESSION_FAILED		= 0x0A,
> +	AUTH_FAILED			= 0x0B,
> +	INVALID_BIOS_AUTH		= 0x0E,
> +	NONCE_DID_NOT_MATCH		= 0x18,
> +	GENERIC_ERROR			= 0x1C,
> +	BIOS_ADMIN_POLICY_NOT_MET	= 0x28,
> +	BIOS_ADMIN_NOT_SET		= 0x38,
> +	P21_NO_PROVISIONED		= 0x1000,
> +	P21_PROVISION_IN_PROGRESS	= 0x1001,
> +	P21_IN_USE			= 0x1002,
> +	HEP_NOT_ACTIVE			= 0x1004,
> +	HEP_ALREADY_SET		= 0x1006,
> +	HEP_CHECK_STATE		= 0x1007
> +};
> +
> +enum spm_features {
> +	HEP_ENABLED		= 0x01,
> +	PLATFORM_RECOVERY	= 0x02,
> +	ENHANCED_BIOS_AUTH_MODE	= 0x04
> +};
> +
> +
> +/*
> + * struct bios_args buffer is dynamically allocated.  New WMI command types
> + * were introduced that exceeds 128-byte data size.  Changes to handle
> + * the data size allocation scheme were kept in hp_wmi_perform_qurey function.
> + */
> +struct bios_args {
> +	u32 signature;
> +	u32 command;
> +	u32 commandtype;
> +	u32 datasize;
> +	u8 data[];
> +};
> +
> +
> +#pragma pack(1)
> +struct secureplatform_provisioning_data {
> +	u8 state;
> +	u8 version[2];
> +	u8 reserved1;
> +	u32 features;
> +	u32 nonce;
> +	u8 reserved2[28];
> +	u8 sk_mod[MAX_KEY_MOD];
> +	u8 kek_mod[MAX_KEY_MOD];
> +};
> +
> +#pragma pack()
> +
> +
> +struct string_data {
> +	struct kobject *attr_name_kobj;
> +	u8 attribute_name[MAX_BUFF];
> +	u8 display_name[MAX_BUFF];
> +	u8 current_value[MAX_BUFF];
> +	u8 new_value[MAX_BUFF];
> +	u8 path[MAX_BUFF];
> +	u32 is_readonly;
> +	u32 display_in_ui;
> +	u32 requires_physical_presence;
> +	u32 sequence;
> +	u32 prerequisitesize;
> +	u8 prerequisites[MAX_BUFF];
> +	u32 security_level;
> +	u32 min_length;
> +	u32 max_length;
> +	u8 display_name_language_code[MAX_BUFF];
> +	u32 type;
> +};
> +
> +struct integer_data {
> +	struct kobject *attr_name_kobj;
> +	u8 attribute_name[MAX_BUFF];
> +	u8 display_name[MAX_BUFF];
> +	u32 current_value;
> +	u32 new_value;
> +	u8 path[MAX_BUFF];
> +	u32 is_readonly;
> +	u32 display_in_ui;
> +	u32 requires_physical_presence;
> +	u32 sequence;
> +	u32 prerequisitesize;
> +	u8 prerequisites[MAX_BUFF];
> +	u32 security_level;
> +	u32 lower_bound;
> +	u32 upper_bound;
> +	u32 scalar_increment;
> +	u8 display_name_language_code[MAX_BUFF];
> +	u32 type;
> +};
> +
> +struct enumeration_data {
> +	struct kobject *attr_name_kobj;
> +	u8 attribute_name[MAX_BUFF];
> +	u8 display_name[MAX_BUFF];
> +	u8 path[MAX_BUFF];
> +	u32 is_readonly;
> +	u32 display_in_ui;
> +	u32 requires_physical_presence;
> +	u32 sequence;
> +	u32 prerequisitesize;
> +	u8 prerequisites[MAX_BUFF];
> +	u32 security_level;
> +	u8 current_value[MAX_BUFF];
> +	u8 new_value[MAX_BUFF];
> +	u32 size;
> +	u8 possible_values[MAX_BUFF];
> +	u8 display_name_language_code[MAX_BUFF];
> +	u32 type;
> +};
> +
> +struct ordered_list_data {
> +	struct kobject *attr_name_kobj;
> +	u8 attribute_name[MAX_BUFF];
> +	u8 display_name[MAX_BUFF];
> +	u8 current_value[MAX_BUFF];
> +	u8 new_value[MAX_BUFF];
> +	u8 path[MAX_BUFF];
> +	u32 is_readonly;
> +	u32 display_in_ui;
> +	u32 requires_physical_presence;
> +	u32 sequence;
> +	u32 prerequisitesize;
> +	u8 prerequisites[MAX_BUFF];
> +	u32 security_level;
> +	u32 size;
> +	u8 elements[MAX_BUFF];
> +	u8 display_name_language_code[MAX_BUFF];
> +	u32 type;
> +};
> +
> +struct password_data {
> +	struct kobject *attr_name_kobj;
> +	u8 attribute_name[MAX_BUFF];
> +	u8 display_name[MAX_BUFF];
> +	u8 current_password[MAX_PASSWD_SIZE];
> +	u8 new_password[MAX_PASSWD_SIZE];
> +	u8 path[MAX_BUFF];
> +	u32 is_readonly;
> +	u32 display_in_ui;
> +	u32 requires_physical_presence;
> +	u32 sequence;
> +	u32 prerequisitesize;
> +	u8 prerequisites[MAX_BUFF];
> +	u32 security_level;
> +	u32 min_password_length;
> +	u32 max_password_length;
> +	u32 encoding_size;
> +	u8 supported_encoding[MAX_BUFF];
> +	u8 display_name_language_code[MAX_BUFF];
> +	u32 is_enabled;
> +
> +	// 'bios-admin' 'power-on'
> +	u32 role;
> +
> +	//'password'
> +	u32 mechanism;
> +	u32 type;
> +};
> +
> +struct secure_platform_data {
> +	struct kobject *attr_name_kobj;
> +	u8 attribute_name[MAX_BUFF];
> +	u8 display_name[MAX_BUFF];
> +
> +	u8 *endorsement_key;
> +	u8 *signing_key;
> +
> +	u32 is_enabled;
> +	u32 mechanism;
> +	u32 type;
> +};
> +
> +struct bioscfg_priv {
> +	struct wmi_device *password_attr_wdev;
> +	struct wmi_device *bios_attr_wdev;
> +	struct kset *authentication_dir_kset;
> +	struct kset *main_dir_kset;
> +	struct device *class_dev;
> +	struct string_data *string_data;
> +	u32 string_instances_count;
> +	struct integer_data *integer_data;
> +	u32 integer_instances_count;
> +	struct enumeration_data *enumeration_data;
> +	u32 enumeration_instances_count;
> +	struct ordered_list_data *ordered_list_data;
> +	u32 ordered_list_instances_count;
> +	struct password_data *password_data;
> +	u32 password_instances_count;
> +
> +	struct kobject *sure_start_attr_kobj;
> +	struct kobject *sure_admin_attr_kobj;
> +	struct secure_platform_data spm_data;
> +
> +	int  last_wmi_status;
> +	bool pending_reboot;
> +	struct mutex mutex;
> +};
> +
> +/* global structure used by multiple WMI interfaces */
> +extern struct bioscfg_priv bioscfg_drv;
> +
> +enum hp_wmi_data_type {
> +	HPWMI_STRING_TYPE		= 0x00,
> +	HPWMI_INTEGER_TYPE		= 0x01,
> +	HPWMI_ENUMERATION_TYPE		= 0x02,
> +	HPWMI_ORDERED_LIST_TYPE		= 0x03,
> +	HPWMI_PASSWORD_TYPE		= 0x04,
> +	HPWMI_SECURE_PLATFORM_TYPE	= 0x05,
> +	HPWMI_SURE_START_TYPE		= 0x06,
> +	HPWMI_SURE_ADMIN_TYPE           = 0x07,
> +};
> +
> +enum hp_wmi_data_elements {
> +
> +	/* Common elements */
> +	NAME = 0,
> +	VALUE = 1,
> +	PATH = 2,
> +	IS_READONLY = 3,
> +	DISPLAY_IN_UI = 4,
> +	REQUIRES_PHYSICAL_PRESENCE = 5,
> +	SEQUENCE = 6,
> +	PREREQUISITE_SIZE = 7,
> +	PREREQUISITES = 8,
> +	SECURITY_LEVEL = 9,
> +
> +	/* String elements */
> +	STR_MIN_LENGTH = 10,
> +	STR_MAX_LENGTH = 11,
> +
> +	/* Integer elements */
> +	INT_LOWER_BOUND = 10,
> +	INT_UPPER_BOUND = 11,
> +	INT_SCALAR_INCREMENT = 12,
> +
> +	/* Enumeration elements */
> +	ENUM_CURRENT_VALUE = 10,
> +	ENUM_SIZE = 11,
> +	ENUM_POSSIBLE_VALUES = 12,
> +
> +	/* Ordered list elements */
> +	ORD_LIST_SIZE = 10,
> +	ORD_LIST_ELEMENTS = 11,
> +
> +	/* Password elements */
> +	PSWD_MIN_LENGTH = 10,
> +	PSWD_MAX_LENGTH = 11,
> +	PSWD_SIZE = 12,
> +	PSWD_SUPPORTED_ENCODING = 13,
> +	PSWD_IS_SET = 14
> +};
> +
> +
> +static const int hp_wmi_elements_count[] = {
> +	12,   // string
> +	13,   // integer
> +	13,   // enumeration
> +	12,   // ordered list
> +	15    // password
> +};
> +
> +#define get_instance_id(type)							\
> +static int get_##type##_instance_id(struct kobject *kobj)			\
> +{										\
> +	int i; \
> +								\
> +	for (i = 0; i <= bioscfg_drv.type##_instances_count; i++) { \
> +		if (!(strcmp(kobj->name, bioscfg_drv.type##_data[i].attribute_name))) \
> +			return i;						\
> +	}									\
> +	return -EIO;								\
> +}
> +
> +#define get_instance_id_for_attribute(type)			\
> +static int get_instance_id_for_##type(char *attr_name)	        \
> +{										\
> +	int i;									\
> +										\
> +	for (i = 0; i < bioscfg_drv.type##_instances_count; i++) {		\
> +		if (strcmp(bioscfg_drv.type##_data[i].attribute_name, attr_name) == 0)						\
> +			return i;						\
> +	}									\
> +	return -EIO;								\
> +}
> +
> +#define attribute_s_property_show(name, type)					\
> +static ssize_t name##_show(struct kobject *kobj, struct kobj_attribute *attr,	\
> +			   char *buf)						\
> +{										\
> +	int i = get_##type##_instance_id(kobj);					\
> +	if (i >= 0)								\
> +		return sprintf(buf, "%s\n", bioscfg_drv.type##_data[i].name);	\
> +	return 0;								\
> +}
> +/* There is no need to keep track of default and current values
> + * separately
> + */
> +#define attribute_s_default_property_show(name, type, new_name)			\
> +static ssize_t name##_show(struct kobject *kobj, struct kobj_attribute *attr,	\
> +			   char *buf)						\
> +{										\
> +	int i = get_##type##_instance_id(kobj);					\
> +	if (i >= 0)								\
> +		return sprintf(buf, "%s\n", bioscfg_drv.type##_data[i].new_name);	\
> +	return 0;								\
> +}
> +
> +#define attribute_n_default_property_show(name, type, new_name)			\
> +static ssize_t name##_show(struct kobject *kobj, struct kobj_attribute *attr,	\
> +			   char *buf)						\
> +{										\
> +	int i = get_##type##_instance_id(kobj);					\
> +	if (i >= 0)								\
> +		return sprintf(buf, "%d\n", bioscfg_drv.type##_data[i].new_name); \
> +	return 0;								\
> +}
> +
> +#define attribute_n_property_show(name, type)					\
> +static ssize_t name##_show(struct kobject *kobj, struct kobj_attribute *attr,	\
> +			   char *buf)						\
> +{										\
> +	int i = get_##type##_instance_id(kobj);					\
> +	if (i >= 0)								\
> +		return sprintf(buf, "%d\n", bioscfg_drv.type##_data[i].name);	\
> +	return 0;								\
> +}
> +
> +
> +#define attribute_property_store(curr_val, type)				\
> +static ssize_t curr_val##_store(struct kobject *kobj,				\
> +				struct kobj_attribute *attr,			\
> +				const char *buf, size_t count)			\
> +{										\
> +	char *p = NULL;								\
> +	char *attr_value = NULL;						\
> +	char *attr_name = NULL;							\
> +	int i;									\
> +	int ret = -EIO;								\
> +										\
> +	attr_name = kstrdup(kobj->name, GFP_KERNEL);				\
> +	if (!attr_name)								\
> +		return -ENOMEM;							\
> +										\
> +	attr_value = kstrdup(buf, GFP_KERNEL);					\
> +	if (!attr_value)							\
> +		return -ENOMEM;							\
> +										\
> +	p = memchr(attr_value, '\n', count);					\
> +	if (p != NULL)								\
> +		*p = '\0';							\
> +										\
> +	i = get_##type##_instance_id(kobj);					\
> +	if (i >= 0)								\
> +		ret = validate_##type##_input(i, attr_value);			\
> +	if (!ret)								\
> +		ret = hp_set_attribute(attr_name, attr_value);			\
> +	if (!ret)								\
> +		update_##type##_value(i);					\
> +										\
> +	clear_all_passwords();							\
> +	kfree(attr_name);							\
> +	kfree(attr_value);							\
> +										\
> +	return ret ? ret : count;						\
> +}
> +
> +#define attribute_spm_n_property_show(name, type)				\
> +static ssize_t name##_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf) \
> +{									\
> +	return sprintf(buf, "%d\n", bioscfg_drv.type##_data.name);\
> +}
> +
> +#define attribute_spm_s_property_show(name, type)				\
> +static ssize_t name##_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf) \
> +{									\
> +	return sprintf(buf, "%s\n", bioscfg_drv.type##_data.name);		\
> +}
> +
> +#define check_property_type(attr, prop, valuetype)\
> +	(attr##_obj[prop].type != valuetype)
> +
> +#define HPWMI_BINATTR_RW(_group, _name, _size)	\
> +static struct bin_attribute _group##_##_name =	\
> +__BIN_ATTR(_name, 0444 | 0200, _group##_##_name##_read, _group##_##_name##_write, _size)
> +
> +/*
> + * Prototypes
> + */
> +union acpi_object *get_wmiobj_pointer(int instance_id, const char *guid_string);
> +int get_instance_count(const char *guid_string);
> +void strlcpy_attr(char *dest, char *src);
> +
> +/* String attributes */
> +int populate_string_buffer_data(union acpi_object *str_obj,
> +			 int instance_id,
> +			 struct kobject *attr_name_kobj);
> +int populate_string_elements_from_buffer(union acpi_object *string_obj,
> +					 int instance_id,
> +					 enum hp_wmi_data_type type);
> +int alloc_string_data(void);
> +void exit_string_attributes(void);
> +int populate_string_package_data(union acpi_object *str_obj,
> +				 int instance_id,
> +				 struct kobject *attr_name_kobj);
> +int populate_string_elements_from_package(union acpi_object *str_obj,
> +						  int instance_id,
> +						  enum hp_wmi_data_type type);
> +
> +/* Integer attributes */
> +int populate_integer_buffer_data(union acpi_object *integer_obj,
> +			  int instance_id,
> +			  struct kobject *attr_name_kobj);
> +int populate_integer_elements_from_buffer(union acpi_object *integer_obj,
> +					  int instance_id,
> +					  enum hp_wmi_data_type type);
> +int alloc_integer_data(void);
> +void exit_integer_attributes(void);
> +int populate_integer_package_data(union acpi_object *integer_obj,
> +				  int instance_id,
> +				  struct kobject *attr_name_kobj);
> +int populate_integer_elements_from_package(union acpi_object *integer_obj,
> +						  int instance_id,
> +						  enum hp_wmi_data_type type);
> +
> +/* Enumeration attributes */
> +int populate_enumeration_buffer_data(union acpi_object *enum_obj,
> +			      int instance_id,
> +			      struct kobject *attr_name_kobj);
> +int populate_enumeration_elements_from_buffer(union acpi_object *enum_obj,
> +					      int instance_id,
> +					      enum hp_wmi_data_type type);
> +int alloc_enumeration_data(void);
> +void exit_enumeration_attributes(void);
> +int populate_enumeration_package_data(union acpi_object *enum_obj,
> +				      int instance_id,
> +				      struct kobject *attr_name_kobj);
> +int populate_enumeration_elements_from_package(union acpi_object *enum_obj,
> +					       int instance_id,
> +					       enum hp_wmi_data_type type);
> +
> +/* Ordered list */
> +int populate_ordered_list_buffer_data(union acpi_object *order_obj, int instance_id,
> +				      struct kobject *attr_name_kobj);
> +int populate_ordered_list_elements_from_buffer(union acpi_object *order_obj,
> +					       int instance_id,
> +					       enum hp_wmi_data_type
> +					       type);
> +int alloc_ordered_list_data(void);
> +void exit_ordered_list_attributes(void);
> +int populate_ordered_list_package_data(union acpi_object *order_obj,
> +				       int instance_id,
> +				       struct kobject *attr_name_kobj);
> +int populate_ordered_list_elements_from_package(union acpi_object *order_obj,
> +						int instance_id,
> +						enum hp_wmi_data_type type);
> +
> +/* Password authentication attributes */
> +int populate_password_buffer_data(union acpi_object *password_obj,
> +			   int instance_id,
> +			   struct kobject *attr_name_kobj);
> +int populate_password_elements_from_buffer(union acpi_object *password_obj,
> +					   int instance_id,
> +					   enum hp_wmi_data_type type);
> +int populate_password_package_data(union acpi_object *password_obj, int instance_id,
> +				   struct kobject *attr_name_kobj);
> +int populate_password_elements_from_package(union acpi_object *password_obj,
> +					   int instance_id,
> +					    enum hp_wmi_data_type type);
> +int alloc_password_data(void);
> +int alloc_secure_platform_data(void);
> +void exit_password_attributes(void);
> +void exit_secure_platform_attributes(void);
> +int populate_secure_platform_data(struct kobject *attr_name_kobj);
> +int password_is_set(const char *auth);
> +int check_spm_is_enabled(void);
> +int wmi_error_and_message(int error_code, char *message);
> +int hp_wmi_set_bios_setting(void *input_buffer, int input_size);
> +int hp_wmi_perform_query(int query, enum hp_wmi_command command,
> +				void *buffer, int insize, int outsize);
> +
> +/* Sure Start attributes */
> +void exit_sure_start_attributes(void);
> +int populate_sure_start_data(struct kobject *attr_name_kobj);
> +
> +/* Sure Admin Attributes */
> +void exit_sure_admin_attributes(void);
> +int populate_sure_admin_data(struct kobject *attr_name_kobj);
> +int hp_set_attribute(const char *a_name, const char *a_value);
> +int hp_set_attribute_with_payload(const char *a_name,
> +				  const char *a_value,
> +				  const char *auth_payload);
> +int update_attribute_value(char *attr_name, char *attr_value);
> +int hp_bios_settings_fill_buffer(void);
> +int hp_bios_settings_free_buffer(void);
> +int hp_bios_settings_realloc_buffer(char **buf, int *buf_size,
> +					   int *alloc_size);
> +int append_read_string_attributes(char *buf, int alloc_size,
> +					int instance,
> +					enum hp_wmi_data_type type);
> +int append_read_integer_attributes(char *buf, int alloc_size,
> +					 int instance,
> +					 enum hp_wmi_data_type type);
> +int append_read_enumeration_attributes(char *buf, int alloc_size,
> +					     int instance,
> +					     enum hp_wmi_data_type type);
> +int append_read_ordered_list_attributes(char *buf, int alloc_size,
> +					      int instance,
> +					      enum hp_wmi_data_type type);
> +int append_read_password_attributes(char *buf, int alloc_size,
> +					 int instance,
> +					 enum hp_wmi_data_type type);
> +int append_read_settings(enum hp_wmi_data_type type, char **buf,
> +			      int *buf_size, int *alloc_size);
> +int append_read_attributes(char **buf, int alloc_size,
> +				 int instance, enum hp_wmi_data_type type);
> +int set_bios_defaults(u8 defType);
> +int get_password_instance_for_type(const char *name);
> +int clear_all_passwords(void);
> +int clear_passwords(const int instance);
> +void exit_bios_attr_set_interface(void);
> +int init_bios_attr_set_interface(void);
> +size_t calculate_string_buffer(const char *str);
> +size_t calculate_security_buffer(const char *authentication);
> +void populate_security_buffer(u16 *buffer, const char *authentication);
> +ssize_t populate_string_buffer(u16 *buffer, size_t buffer_len, const char *str);
> +int set_new_password(const char *password_type, const char *new_password);
> +int init_bios_attr_pass_interface(void);
> +void exit_bios_attr_pass_interface(void);
> +void *ascii_to_utf16_unicode(u16 *p, const u8 *str);
> +int get_integer_from_buffer(int **buffer, int *integer);
> +int get_string_from_buffer(u16 **buffer, char **str);
> +int convert_hexstr_to_str(char **hex, int input_len, char **str, int *len);
> +int convert_hexstr_to_int(char *str, int *int_value);
> +inline int encode_outsize_for_pvsz(int outsize);
> +
> +#endif
> diff --git a/drivers/platform/x86/hp/enum-attributes.c b/drivers/platform/x86/hp/enum-attributes.c
> new file mode 100644
> index 000000000000..6ec02b61857c
> --- /dev/null
> +++ b/drivers/platform/x86/hp/enum-attributes.c
> @@ -0,0 +1,504 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Functions corresponding to enumeration type attributes under
> + * BIOS Enumeration GUID for use with hp-bioscfg driver.
> + *
> + *  Copyright (c) 2022 HP Development Company, L.P.
> + */
> +
> +#include "bioscfg.h"
> +
> +get_instance_id(enumeration);
> +
> +static ssize_t current_value_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
> +{
> +	int instance_id = get_enumeration_instance_id(kobj);
> +	union acpi_object *obj = NULL;
> +	ssize_t ret;
> +
> +	if (instance_id < 0)
> +		return -EIO;
> +
> +	/* need to use specific instance_id and guid combination to get right data */
> +	obj = get_wmiobj_pointer(instance_id, HP_WMI_BIOS_ENUMERATION_GUID);
> +	if (!obj)
> +		return -EIO;
> +
> +	ret = snprintf(buf, PAGE_SIZE, "%s\n",
> +		       bioscfg_drv.enumeration_data[instance_id].current_value);
> +
> +	kfree(obj);
> +	return ret;
> +}
> +
> +
> +/*
> + * validate_enumeration_input() -
> + * Validate input of current_value against possible values
> + *
> + * @instance_id: The instance on which input is validated
> + * @buf: Input value
> + */
> +static int validate_enumeration_input(int instance_id, const char *buf)
> +{
> +	char *options = NULL;
> +	char *p;
> +	int ret = 0;
> +	int found = 0;
> +
> +	options = kstrdup(bioscfg_drv.enumeration_data[instance_id].possible_values,
> +			  GFP_KERNEL);
> +
> +	if (!options) {
> +		ret = -ENOMEM;
> +		goto exit_validate_enum_input;
> +	}
> +
> +	/* Is it a read only attribute */
> +	if (bioscfg_drv.enumeration_data[instance_id].is_readonly) {
> +		ret = -EIO;
> +		goto exit_validate_enum_input;
> +	}
> +
> +	while ((p = strsep(&options, ";")) != NULL) {
> +		if (!*p)
> +			continue;
> +
> +		if (!strcasecmp(p, buf)) {
> +			found = 1;
> +			break;
> +		}
> +	}
> +
> +	if (!found) {
> +		ret = -EINVAL;
> +		goto exit_validate_enum_input;
> +	}
> +
> +	strscpy(bioscfg_drv.enumeration_data[instance_id].new_value,
> +		buf,
> +		sizeof(bioscfg_drv.enumeration_data[instance_id].new_value));
> +
> +exit_validate_enum_input:
> +	kfree(options);
> +	return ret;
> +}
> +
> +static void update_enumeration_value(int instance_id)
> +{
> +	strscpy(bioscfg_drv.enumeration_data[instance_id].current_value,
> +		bioscfg_drv.enumeration_data[instance_id].new_value,
> +		sizeof(bioscfg_drv.enumeration_data[instance_id].current_value));
> +}
> +
> +
> +attribute_s_property_show(display_name_language_code, enumeration);
> +static struct kobj_attribute enumeration_display_langcode =
> +		__ATTR_RO(display_name_language_code);
> +
> +attribute_s_property_show(display_name, enumeration);
> +static struct kobj_attribute  enumeration_display_name =
> +		__ATTR_RO(display_name);
> +
> +attribute_property_store(current_value, enumeration);
> +static struct kobj_attribute enumeration_current_val =
> +	__ATTR_RW_MODE(current_value, 0600);
> +
> +attribute_s_property_show(possible_values, enumeration);
> +static struct kobj_attribute  enumeration_poss_val =
> +		__ATTR_RO(possible_values);
> +
> +static ssize_t type_show(struct kobject *kobj, struct kobj_attribute *attr,
> +			 char *buf)
> +{
> +	return sprintf(buf, "enumeration\n");
> +}
> +static struct kobj_attribute enumeration_type =
> +		__ATTR_RO(type);
> +
> +static struct attribute *enumeration_attrs[] = {
> +	&enumeration_display_langcode.attr,
> +	&enumeration_display_name.attr,
> +	&enumeration_current_val.attr,
> +	&enumeration_poss_val.attr,
> +	&enumeration_type.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group enumeration_attr_group = {
> +	.attrs = enumeration_attrs,
> +};
> +
> +int alloc_enumeration_data(void)
> +{
> +	int ret = 0;
> +
> +	bioscfg_drv.enumeration_instances_count =
> +		get_instance_count(HP_WMI_BIOS_ENUMERATION_GUID);
> +
> +	bioscfg_drv.enumeration_data = kcalloc(bioscfg_drv.enumeration_instances_count,
> +					sizeof(struct enumeration_data), GFP_KERNEL);
> +	if (!bioscfg_drv.enumeration_data) {
> +		bioscfg_drv.enumeration_instances_count = 0;
> +		ret = -ENOMEM;
> +	}
> +	return ret;
> +}
> +
> +/*
> + * populate_enumeration_package_data() -
> + * Populate all properties of an instance under enumeration attribute
> + *
> + * @enum_obj: ACPI object with enumeration data
> + * @instance_id: The instance to enumerate
> + * @attr_name_kobj: The parent kernel object
> + */
> +int populate_enumeration_package_data(union acpi_object *enum_obj, int instance_id,
> +			struct kobject *attr_name_kobj)
> +{
> +	char *str_value = NULL;
> +	int str_len;
> +	int ret = 0;
> +
> +	bioscfg_drv.enumeration_data[instance_id].type = HPWMI_ENUMERATION_TYPE;
> +	bioscfg_drv.enumeration_data[instance_id].attr_name_kobj = attr_name_kobj;
> +
> +	ret = convert_hexstr_to_str(&(enum_obj[NAME].string.pointer),
> +				    enum_obj[NAME].string.length,
> +				    &str_value, &str_len);
> +	if (ACPI_FAILURE(ret)) {
> +		pr_warn("Failed to populate enumeration package data. Error [0%0x]\n", ret);
> +		kfree(str_value);
> +		return ret;
> +	}
> +
> +	strscpy(bioscfg_drv.enumeration_data[instance_id].attribute_name,
> +		str_value,
> +		sizeof(bioscfg_drv.enumeration_data[instance_id].attribute_name));
> +
> +	strscpy(bioscfg_drv.enumeration_data[instance_id].display_name,
> +		str_value,
> +		sizeof(bioscfg_drv.enumeration_data[instance_id].display_name));
> +
> +	kfree(str_value);
> +	str_value = NULL;
> +
> +	populate_enumeration_elements_from_package(enum_obj, instance_id, HPWMI_ENUMERATION_TYPE);
> +
> +	return sysfs_create_group(attr_name_kobj, &enumeration_attr_group);
> +}
> +
> +int populate_enumeration_elements_from_package(union acpi_object *enum_obj,
> +					   int instance_id,
> +					   enum hp_wmi_data_type type)
> +{
> +	char *str_value = NULL;
> +	int value_len;
> +	int status = 0;
> +	u32 size = 0;
> +	u32 int_value;
> +	int elem = 0;
> +	int reqs;
> +	int eloc;
> +	int pos_values;
> +
> +	strscpy(bioscfg_drv.enumeration_data[instance_id].display_name_language_code,
> +		LANG_CODE_STR,
> +		sizeof(bioscfg_drv.enumeration_data[instance_id].display_name_language_code));
> +
> +	for (elem = 1, eloc = 1; elem < hp_wmi_elements_count[type]; elem++, eloc++) {
> +
> +		switch (enum_obj[elem].type) {
> +		case ACPI_TYPE_STRING:
> +
> +			if (PREREQUISITES != elem && ENUM_POSSIBLE_VALUES != elem) {
> +				status = convert_hexstr_to_str(&enum_obj[elem].string.pointer,
> +							       enum_obj[elem].string.length,
> +							       &str_value, &value_len);
> +				if (ACPI_FAILURE(status))
> +					continue;
> +
> +			}
> +			break;
> +		case ACPI_TYPE_INTEGER:
> +			int_value = (u32)enum_obj[elem].integer.value;
> +			break;
> +		default:
> +			pr_warn("Unsupported object type [%d]\n", enum_obj[elem].type);
> +			continue;
> +		}
> +
> +		/* stop if extra counter is greater than total number
> +		 * of elements for enumeration type
> +		 */
> +		if (eloc == hp_wmi_elements_count[type])
> +			goto exit_enumeration_package;
> +
> +		/* Assign appropriate element value to corresponding field*/
> +		switch (eloc) {
> +		case VALUE:
> +			break;
> +		case PATH:
> +			strscpy(bioscfg_drv.enumeration_data[instance_id].path, str_value,
> +				sizeof(bioscfg_drv.enumeration_data[instance_id].path));
> +			break;
> +		case IS_READONLY:
> +			bioscfg_drv.enumeration_data[instance_id].is_readonly = int_value;
> +			break;
> +		case DISPLAY_IN_UI:
> +			bioscfg_drv.enumeration_data[instance_id].display_in_ui = int_value;
> +			break;
> +		case REQUIRES_PHYSICAL_PRESENCE:
> +			bioscfg_drv.enumeration_data[instance_id].requires_physical_presence = int_value;
> +			break;
> +		case SEQUENCE:
> +			bioscfg_drv.enumeration_data[instance_id].sequence = int_value;
> +			break;
> +		case PREREQUISITE_SIZE:
> +			bioscfg_drv.enumeration_data[instance_id].prerequisitesize = int_value;
> +			if (int_value > 20)
> +				pr_warn("Prerequisites size value exceeded the maximum number of elements supported or data may be malformed\n");
> +			/*
> +			 * prerequisites element is omitted when
> +			 * prerequisitesSize value is zero.
> +			 */
> +			if (int_value == 0)
> +				eloc++;
> +			break;
> +		case PREREQUISITES:
> +			size = bioscfg_drv.enumeration_data[instance_id].prerequisitesize;
> +
> +			for (reqs = 0; reqs < size; reqs++) {
> +				status = convert_hexstr_to_str(&enum_obj[elem].string.pointer,
> +							       enum_obj[elem].string.length,
> +							       &str_value, &value_len);
> +				if (ACPI_FAILURE(status))
> +					break;
> +
> +				strlcat(bioscfg_drv.enumeration_data[instance_id].prerequisites,
> +					str_value,
> +					sizeof(bioscfg_drv.enumeration_data[instance_id].prerequisites));
> +				if (reqs != (size - 1))
> +					strlcat(bioscfg_drv.enumeration_data[instance_id].prerequisites, ";",
> +						sizeof(bioscfg_drv.enumeration_data[instance_id].prerequisites));
> +
> +				kfree(str_value);
> +				str_value = NULL;
> +			}
> +			break;
> +
> +		case SECURITY_LEVEL:
> +			bioscfg_drv.enumeration_data[instance_id].security_level = int_value;
> +			break;
> +
> +		case ENUM_CURRENT_VALUE:
> +			strscpy(bioscfg_drv.enumeration_data[instance_id].current_value,
> +				str_value, sizeof(bioscfg_drv.enumeration_data[instance_id].current_value));
> +			break;
> +		case ENUM_SIZE:
> +			bioscfg_drv.enumeration_data[instance_id].size = int_value;
> +			break;
> +		case ENUM_POSSIBLE_VALUES:
> +			size = bioscfg_drv.enumeration_data[instance_id].size;
> +			for (pos_values = 0; pos_values < size; pos_values++) {
> +				status = convert_hexstr_to_str(&enum_obj[elem + pos_values].string.pointer,
> +							       enum_obj[elem  + pos_values].string.length,
> +							       &str_value, &value_len);
> +				if (ACPI_FAILURE(status))
> +					break;
> +
> +				strlcat(bioscfg_drv.enumeration_data[instance_id].possible_values,
> +					str_value,
> +					sizeof(bioscfg_drv.enumeration_data[instance_id].possible_values));
> +				if (pos_values < (size - 1))
> +					strlcat(bioscfg_drv.enumeration_data[instance_id].possible_values, ";",
> +						sizeof(bioscfg_drv.enumeration_data[instance_id].possible_values));
> +				kfree(str_value);
> +				str_value = NULL;
> +			}
> +			break;
> +		default:
> +			pr_warn("Invalid element: %d found in Enumeration attribute or data may be malformed\n", elem);
> +			break;
> +		}
> +
> +		kfree(str_value);
> +		str_value = NULL;
> +	}
> +
> +exit_enumeration_package:
> +		kfree(str_value);
> +		str_value = NULL;
> +	return 0;
> +}
> +
> +/*
> + * populate_enumeration_buffer_data() -
> + * Populate all properties of an instance under enumeration attribute
> + *
> + * @enum_obj: ACPI object with enumeration data
> + * @instance_id: The instance to enumerate
> + * @attr_name_kobj: The parent kernel object
> + * @enumeration_property_count: Total properties count under enumeration type
> + */
> +int populate_enumeration_buffer_data(union acpi_object *enum_obj, int instance_id,
> +			      struct kobject *attr_name_kobj)
> +{
> +
> +	bioscfg_drv.enumeration_data[instance_id].type = HPWMI_ENUMERATION_TYPE;
> +	bioscfg_drv.enumeration_data[instance_id].attr_name_kobj = attr_name_kobj;
> +	strscpy(bioscfg_drv.enumeration_data[instance_id].attribute_name,
> +		attr_name_kobj->name,
> +		sizeof(bioscfg_drv.enumeration_data[instance_id].attribute_name));
> +	strscpy(bioscfg_drv.enumeration_data[instance_id].display_name,
> +		attr_name_kobj->name,
> +		sizeof(bioscfg_drv.enumeration_data[instance_id].display_name));
> +
> +	/* Populate enumeration elements */
> +	populate_enumeration_elements_from_buffer(enum_obj, instance_id, HPWMI_ENUMERATION_TYPE);
> +
> +	return sysfs_create_group(attr_name_kobj, &enumeration_attr_group);
> +}
> +
> +int populate_enumeration_elements_from_buffer(union acpi_object *enum_obj,
> +					      int instance_id,
> +					      enum hp_wmi_data_type type)
> +{
> +	int status;
> +	char *str = NULL;
> +	int elem;
> +	int reqs;
> +	int integer;
> +	int size = 0;
> +	int values;
> +
> +	elem = 0;
> +
> +	strscpy(bioscfg_drv.enumeration_data[instance_id].display_name_language_code,
> +		LANG_CODE_STR,
> +		sizeof(bioscfg_drv.enumeration_data[instance_id].display_name_language_code));
> +
> +	for (elem = 1; elem < 3; elem++) {
> +
> +		status = get_string_from_buffer((u16 **)&enum_obj->buffer.pointer, &str);
> +		if (ACPI_FAILURE(status))
> +			continue;
> +
> +		switch (elem) {
> +		case VALUE:
> +			/* Skip 'Value' since 'CurrentValue' is reported. */
> +			break;
> +		case PATH:
> +			strscpy(bioscfg_drv.enumeration_data[instance_id].path,
> +				str, sizeof(bioscfg_drv.enumeration_data[instance_id].path));
> +			break;
> +		default:
> +			pr_warn("Invalid element: %d found in Enumeration attribute or data may be malformed\n", elem);
> +			break;
> +		}
> +		kfree(str);
> +		str = NULL;
> +	}
> +
> +	for (elem = 3; elem < hp_wmi_elements_count[type]; elem++) {
> +		if (PREREQUISITES != elem && ENUM_CURRENT_VALUE != elem && ENUM_POSSIBLE_VALUES != elem)
> +			status = get_integer_from_buffer((int **)&enum_obj->buffer.pointer, (int *)&integer);
> +
> +		if (ACPI_FAILURE(status))
> +			continue;
> +		switch (elem) {
> +		case IS_READONLY:
> +			bioscfg_drv.enumeration_data[instance_id].is_readonly = integer;
> +			break;
> +		case DISPLAY_IN_UI:
> +			bioscfg_drv.enumeration_data[instance_id].display_in_ui = integer;
> +			break;
> +		case REQUIRES_PHYSICAL_PRESENCE:
> +			bioscfg_drv.enumeration_data[instance_id].requires_physical_presence = integer;
> +			break;
> +		case SEQUENCE:
> +			bioscfg_drv.enumeration_data[instance_id].sequence = integer;
> +			break;
> +		case PREREQUISITE_SIZE:
> +			bioscfg_drv.enumeration_data[instance_id].prerequisitesize = integer;
> +			if (integer > 20)
> +				pr_warn("Prerequisites size value exceeded the maximum number of elements supported or data may be malformed\n");
> +			break;
> +		case PREREQUISITES:
> +			size = bioscfg_drv.enumeration_data[instance_id].prerequisitesize;
> +			for (reqs = 0; reqs < size; reqs++) {
> +				status = get_string_from_buffer((u16 **)&enum_obj->buffer.pointer, &str);
> +				if (ACPI_FAILURE(status))
> +					continue;
> +
> +				strlcat(bioscfg_drv.enumeration_data[instance_id].prerequisites,
> +					str,
> +					sizeof(bioscfg_drv.enumeration_data[instance_id].prerequisites));
> +				if (reqs != (size - 1))
> +					strlcat(bioscfg_drv.enumeration_data[instance_id].prerequisites, ";",
> +						sizeof(bioscfg_drv.enumeration_data[instance_id].prerequisites));
> +				kfree(str);
> +				str = NULL;
> +			}
> +			break;
> +		case SECURITY_LEVEL:
> +			bioscfg_drv.enumeration_data[instance_id].security_level = integer;
> +			break;
> +		case ENUM_CURRENT_VALUE:
> +			status = get_string_from_buffer((u16 **)&enum_obj->buffer.pointer, &str);
> +			strscpy(bioscfg_drv.enumeration_data[instance_id].current_value,
> +				str,
> +				sizeof(bioscfg_drv.enumeration_data[instance_id].current_value));
> +			break;
> +		case ENUM_SIZE:
> +			bioscfg_drv.enumeration_data[instance_id].size = integer;
> +			break;
> +		case ENUM_POSSIBLE_VALUES:
> +			size = bioscfg_drv.enumeration_data[instance_id].size;
> +			for (values = 0; values < size; values++) {
> +				status = get_string_from_buffer((u16 **)&enum_obj->buffer.pointer, &str);
> +				if (ACPI_FAILURE(status))
> +					continue;
> +
> +				strlcat(bioscfg_drv.enumeration_data[instance_id].possible_values,
> +					str,
> +					sizeof(bioscfg_drv.enumeration_data[instance_id].possible_values));
> +				if (values != (size - 1))
> +					strlcat(bioscfg_drv.enumeration_data[instance_id].possible_values, ";",
> +						sizeof(bioscfg_drv.enumeration_data[instance_id].possible_values));
> +				kfree(str);
> +				str = NULL;
> +			}
> +			break;
> +		default:
> +			pr_warn("Invalid element: %d found in Enumeration attribute or data may be malformed\n", elem);
> +			break;
> +		}
> +		kfree(str);
> +		str = NULL;
> +	}
> +	kfree(str);
> +	str = NULL;
> +
> +	return 0;
> +}
> +
> +/**
> + * exit_enumeration_attributes() - Clear all attribute data
> + *
> + * Clears all data allocated for this group of attributes
> + */
> +void exit_enumeration_attributes(void)
> +{
> +	int instance_id;
> +
> +	for (instance_id = 0; instance_id < bioscfg_drv.enumeration_instances_count; instance_id++) {
> +		if (bioscfg_drv.enumeration_data[instance_id].attr_name_kobj)
> +			sysfs_remove_group(bioscfg_drv.enumeration_data[instance_id].attr_name_kobj,
> +								&enumeration_attr_group);
> +	}
> +	bioscfg_drv.enumeration_instances_count = 0;
> +
> +	kfree(bioscfg_drv.enumeration_data);
> +	bioscfg_drv.enumeration_data = NULL;
> +}
> diff --git a/drivers/platform/x86/hp/int-attributes.c b/drivers/platform/x86/hp/int-attributes.c
> new file mode 100644
> index 000000000000..9a49a528fd9e
> --- /dev/null
> +++ b/drivers/platform/x86/hp/int-attributes.c
> @@ -0,0 +1,461 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Functions corresponding to integer type attributes under
> + * BIOS Enumeration GUID for use with hp-bioscfg driver.
> + *
> + *  Copyright (c) 2022 Hewlett-Packard Inc.
> + */
> +
> +#include "bioscfg.h"
> +
> +get_instance_id(integer);
> +
> +static ssize_t current_value_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
> +{
> +	int instance_id = get_integer_instance_id(kobj);
> +	union acpi_object *obj = NULL;
> +	ssize_t ret;
> +
> +	if (instance_id < 0)
> +		return instance_id;
> +
> +	/* need to use specific instance_id and guid combination to get right data */
> +	obj = get_wmiobj_pointer(instance_id, HP_WMI_BIOS_INTEGER_GUID);
> +	if (!obj) {
> +		ret = -EIO;
> +		goto current_value_show_out;
> +	}
> +
> +	ret = snprintf(buf, PAGE_SIZE, "%d\n",  bioscfg_drv.integer_data[instance_id].current_value);
> +
> +current_value_show_out:
> +	kfree(obj);
> +	return ret;
> +}
> +
> +/*
> + * validate_integer_input() -
> + * Validate input of current_value against lower and upper bound
> + *
> + * @instance_id: The instance on which input is validated
> + * @buf: Input value
> + */
> +static int validate_integer_input(int instance_id, char *buf)
> +{
> +	int in_val;
> +	int ret;
> +
> +	ret = kstrtoint(buf, 10, &in_val);
> +
> +	/* BIOS treats it as a read only attribute */
> +	if (bioscfg_drv.integer_data[instance_id].is_readonly)
> +		return -EIO;
> +
> +	if (in_val < bioscfg_drv.integer_data[instance_id].lower_bound ||
> +			in_val > bioscfg_drv.integer_data[instance_id].upper_bound)
> +		return -EINVAL;
> +
> +	bioscfg_drv.integer_data[instance_id].new_value = in_val;
> +
> +	return 0;
> +}
> +
> +static void update_integer_value(int instance_id)
> +{
> +	bioscfg_drv.integer_data[instance_id].current_value =
> +		bioscfg_drv.integer_data[instance_id].new_value;
> +}
> +
> +attribute_s_property_show(display_name_language_code, integer);
> +static struct kobj_attribute integer_display_langcode =
> +	__ATTR_RO(display_name_language_code);
> +
> +attribute_s_property_show(display_name, integer);
> +static struct kobj_attribute integer_display_name =
> +	__ATTR_RO(display_name);
> +
> +attribute_property_store(current_value, integer);
> +static struct kobj_attribute integer_current_val =
> +	__ATTR_RW_MODE(current_value, 0600);
> +
> +attribute_n_property_show(lower_bound, integer);
> +static struct kobj_attribute integer_lower_bound =
> +	__ATTR_RO(lower_bound);
> +
> +attribute_n_property_show(upper_bound, integer);
> +static struct kobj_attribute integer_upper_bound =
> +	__ATTR_RO(upper_bound);
> +
> +attribute_n_property_show(scalar_increment, integer);
> +static struct kobj_attribute integer_scalar_increment =
> +	__ATTR_RO(scalar_increment);
> +
> +static ssize_t type_show(struct kobject *kobj, struct kobj_attribute *attr,
> +			 char *buf)
> +{
> +	return sprintf(buf, "integer\n");
> +}
> +static struct kobj_attribute integer_type =
> +	__ATTR_RO(type);
> +
> +static struct attribute *integer_attrs[] = {
> +	&integer_display_langcode.attr,
> +	&integer_display_name.attr,
> +	&integer_current_val.attr,
> +	&integer_lower_bound.attr,
> +	&integer_upper_bound.attr,
> +	&integer_scalar_increment.attr,
> +	&integer_type.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group integer_attr_group = {
> +	.attrs = integer_attrs,
> +};
> +
> +int alloc_integer_data(void)
> +{
> +	int ret = 0;
> +
> +	bioscfg_drv.integer_instances_count = get_instance_count(HP_WMI_BIOS_INTEGER_GUID);
> +	bioscfg_drv.integer_data = kcalloc(bioscfg_drv.integer_instances_count,
> +					sizeof(struct integer_data), GFP_KERNEL);
> +	if (!bioscfg_drv.integer_data) {
> +		bioscfg_drv.integer_instances_count = 0;
> +		ret = -ENOMEM;
> +	}
> +	return ret;
> +}
> +
> +/*
> + * populate_int_data() -
> + * Populate all properties of an instance under integer attribute
> + *
> + * @elements: ACPI object with integer data
> + * @instance_id: The instance to enumerate
> + * @attr_name_kobj: The parent kernel object
> + */
> +int populate_integer_package_data(union acpi_object *elements, int instance_id,
> +			struct kobject *attr_name_kobj)
> +{
> +	char *str_value = NULL;
> +	int str_len;
> +	int ret = 0;
> +
> +	bioscfg_drv.integer_data[instance_id].type = HPWMI_INTEGER_TYPE;
> +	bioscfg_drv.integer_data[instance_id].attr_name_kobj = attr_name_kobj;
> +
> +	ret = convert_hexstr_to_str(&(elements[NAME].string.pointer),
> +				       elements[NAME].string.length,
> +				       &str_value, &str_len);
> +	if (ACPI_FAILURE(ret)) {
> +		kfree(str_value);
> +		return ret;
> +	}
> +
> +	strscpy(bioscfg_drv.integer_data[instance_id].attribute_name,
> +		str_value,
> +		sizeof(bioscfg_drv.integer_data[instance_id].attribute_name));
> +	strscpy(bioscfg_drv.integer_data[instance_id].display_name,
> +		str_value,
> +		sizeof(bioscfg_drv.integer_data[instance_id].display_name));
> +	kfree(str_value);
> +	str_value = NULL;
> +
> +	populate_integer_elements_from_package(elements, instance_id, HPWMI_INTEGER_TYPE);
> +	return sysfs_create_group(attr_name_kobj, &integer_attr_group);
> +}
> +
> +int populate_integer_elements_from_package(union acpi_object *elements,
> +					   int instance_id,
> +					   enum hp_wmi_data_type type)
> +{
> +	char *str_value = NULL;
> +	int value_len;
> +	int status = 0;
> +	u32 size = 0;
> +	u32 int_value;
> +	int elem = 0;
> +	int reqs;
> +	int eloc;
> +
> +	if (!elements)
> +		return -EINVAL;
> +
> +	strscpy(bioscfg_drv.integer_data[instance_id].display_name_language_code,
> +		LANG_CODE_STR,
> +		sizeof(bioscfg_drv.integer_data[instance_id].display_name_language_code));
> +
> +	for (elem = 1, eloc = 1; elem < hp_wmi_elements_count[type]; elem++, eloc++) {
> +
> +		switch (elements[elem].type) {
> +		case ACPI_TYPE_STRING:
> +
> +			if (elem != PREREQUISITES) {
> +				status = convert_hexstr_to_str(&elements[elem].string.pointer,
> +							       elements[elem].string.length,
> +							       &str_value, &value_len);
> +
> +				if (ACPI_FAILURE(status))
> +					continue;
> +			}
> +			break;
> +		case ACPI_TYPE_INTEGER:
> +			int_value = (u32)elements[elem].integer.value;
> +			break;
> +		default:
> +			pr_warn("Unsupported object type [%d]\n", elements[elem].type);
> +			continue;
> +		}
> +		/*
> +		 * Stop if extra counter is greater than total number
> +		 * of elements for integer type.
> +		 */
> +		if (eloc == hp_wmi_elements_count[type])
> +			goto exit_integer_package;
> +
> +		/* Assign appropriate element value to corresponding field*/
> +		switch (eloc) {
> +		case VALUE:
> +			status = kstrtoint(str_value, 10, &int_value);
> +			if (status)
> +				continue;
> +
> +			bioscfg_drv.integer_data[instance_id].current_value = int_value;
> +			break;
> +		case PATH:
> +			strscpy(bioscfg_drv.integer_data[instance_id].path, str_value,
> +				sizeof(bioscfg_drv.integer_data[instance_id].path));
> +			break;
> +		case IS_READONLY:
> +			bioscfg_drv.integer_data[instance_id].is_readonly = int_value;
> +			break;
> +		case DISPLAY_IN_UI:
> +			bioscfg_drv.integer_data[instance_id].display_in_ui = int_value;
> +			break;
> +		case REQUIRES_PHYSICAL_PRESENCE:
> +			bioscfg_drv.integer_data[instance_id].requires_physical_presence = int_value;
> +			break;
> +		case SEQUENCE:
> +			bioscfg_drv.integer_data[instance_id].sequence = int_value;
> +			break;
> +		case PREREQUISITE_SIZE:
> +			bioscfg_drv.integer_data[instance_id].prerequisitesize = int_value;
> +
> +			if (int_value > 20)
> +				pr_warn("Prerequisites size value exceeded the maximum number of elements supported or data may be malformed\n");
> +			/*
> +			 * prerequisites element is omitted when
> +			 * prerequisitesSize value is zero.
> +			 */
> +			if (int_value == 0)
> +				eloc++;
> +			break;
> +		case PREREQUISITES:
> +			size = bioscfg_drv.integer_data[instance_id].prerequisitesize;
> +			for (reqs = 0; reqs < size; reqs++) {
> +				status = convert_hexstr_to_str(&elements[elem].string.pointer,
> +							       elements[elem].string.length,
> +							       &str_value, &value_len);
> +
> +				if (ACPI_FAILURE(status))
> +					continue;
> +
> +				strlcat(bioscfg_drv.integer_data[instance_id].prerequisites,
> +					str_value,
> +					sizeof(bioscfg_drv.integer_data[instance_id].prerequisites));
> +				if (reqs != (size - 1))
> +					strlcat(bioscfg_drv.integer_data[instance_id].prerequisites, ";",
> +						sizeof(bioscfg_drv.integer_data[instance_id].prerequisites));
> +
> +				kfree(str_value);
> +				str_value = NULL;
> +			}
> +			break;
> +
> +		case SECURITY_LEVEL:
> +			bioscfg_drv.integer_data[instance_id].security_level = int_value;
> +			break;
> +		case INT_LOWER_BOUND:
> +			bioscfg_drv.integer_data[instance_id].lower_bound = int_value;
> +			break;
> +		case INT_UPPER_BOUND:
> +			bioscfg_drv.integer_data[instance_id].upper_bound = int_value;
> +			break;
> +		case INT_SCALAR_INCREMENT:
> +			bioscfg_drv.integer_data[instance_id].scalar_increment = int_value;
> +			break;
> +
> +		default:
> +			pr_warn("Invalid element: %d found in Integer attribute or data may be malformed\n", elem);
> +			break;
> +		}
> +		kfree(str_value);
> +		str_value = NULL;
> +	}
> +exit_integer_package:
> +	kfree(str_value);
> +	str_value = NULL;
> +	return 0;
> +}
> +
> +
> +/*
> + * populate_integer_buffer_data() -
> + * Populate all properties of an instance under integer attribute
> + *
> + * @integer_obj: ACPI object with integer data
> + * @instance_id: The instance to enumerate
> + * @attr_name_kobj: The parent kernel object
> + */
> +int populate_integer_buffer_data(union acpi_object *integer_obj, int instance_id,
> +			struct kobject *attr_name_kobj)
> +{
> +	bioscfg_drv.integer_data[instance_id].type = HPWMI_INTEGER_TYPE;
> +	bioscfg_drv.integer_data[instance_id].attr_name_kobj = attr_name_kobj;
> +
> +	strscpy(bioscfg_drv.integer_data[instance_id].attribute_name,
> +		attr_name_kobj->name,
> +		sizeof(bioscfg_drv.integer_data[instance_id].attribute_name));
> +
> +	strscpy(bioscfg_drv.integer_data[instance_id].display_name,
> +		attr_name_kobj->name,
> +		sizeof(bioscfg_drv.integer_data[instance_id].display_name));
> +
> +	/* Populate integer elements */
> +	populate_integer_elements_from_buffer(integer_obj, instance_id, HPWMI_INTEGER_TYPE);
> +
> +	return sysfs_create_group(attr_name_kobj, &integer_attr_group);
> +}
> +
> +int populate_integer_elements_from_buffer(union acpi_object *integer_obj,
> +					  int instance_id, enum hp_wmi_data_type type)
> +{
> +	int status;
> +	char *str = NULL;
> +	int elem;
> +	int reqs;
> +	int integer;
> +	int size = 0;
> +	int ret;
> +
> +	elem = 0;
> +	strscpy(bioscfg_drv.integer_data[instance_id].display_name_language_code,
> +		LANG_CODE_STR,
> +		sizeof(bioscfg_drv.integer_data[instance_id].display_name_language_code));
> +
> +	for (elem = 1; elem < 3; elem++) {
> +
> +		status = get_string_from_buffer((u16 **)&integer_obj->buffer.pointer, &str);
> +		if (ACPI_FAILURE(status))
> +			continue;
> +
> +		switch (elem) {
> +		case VALUE:
> +			ret = kstrtoint(str, 10, &integer);
> +			if (ret)
> +				continue;
> +
> +			bioscfg_drv.integer_data[instance_id].current_value = integer;
> +			break;
> +		case PATH:
> +			strscpy(bioscfg_drv.integer_data[instance_id].path, str,
> +				sizeof(bioscfg_drv.integer_data[instance_id].path));
> +			break;
> +		default:
> +			pr_warn("Invalid element: %d found in Integer attribute or data may be malformed\n", elem);
> +			break;
> +		}
> +		kfree(str);
> +		str = NULL;
> +	}
> +
> +	for (elem = 3; elem < hp_wmi_elements_count[type]; elem++) {
> +
> +		if (elem != PREREQUISITES)
> +			status = get_integer_from_buffer((int **)&integer_obj->buffer.pointer, (int *)&integer);
> +
> +		if (ACPI_FAILURE(status))
> +			continue;
> +
> +		switch (elem) {
> +
> +		case IS_READONLY:
> +			bioscfg_drv.integer_data[instance_id].is_readonly = integer;
> +			break;
> +		case DISPLAY_IN_UI:
> +			bioscfg_drv.integer_data[instance_id].display_in_ui = integer;
> +			break;
> +		case REQUIRES_PHYSICAL_PRESENCE:
> +			bioscfg_drv.integer_data[instance_id].requires_physical_presence = integer;
> +			break;
> +		case SEQUENCE:
> +			bioscfg_drv.integer_data[instance_id].sequence = integer;
> +			break;
> +		case PREREQUISITE_SIZE:
> +			bioscfg_drv.integer_data[instance_id].prerequisitesize = integer;
> +			size = integer;
> +			if (size > 20)
> +				pr_warn("Prerequisites size value exceeded the maximum number of elements supported or data may be malformed\n");
> +
> +			break;
> +		case PREREQUISITES:
> +			for (reqs = 0; reqs < size; reqs++) {
> +				status = get_string_from_buffer((u16 **)&integer_obj->buffer.pointer, &str);
> +				if (ACPI_FAILURE(status))
> +					continue;
> +
> +				strlcat(bioscfg_drv.integer_data[instance_id].prerequisites,
> +					str,
> +					sizeof(bioscfg_drv.integer_data[instance_id].prerequisites));
> +				if (reqs != (size - 1))
> +					strlcat(bioscfg_drv.integer_data[instance_id].prerequisites, ";",
> +						sizeof(bioscfg_drv.integer_data[instance_id].prerequisites));
> +
> +				kfree(str);
> +				str = NULL;
> +			}
> +			break;
> +
> +		case SECURITY_LEVEL:
> +			bioscfg_drv.integer_data[instance_id].security_level = integer;
> +			break;
> +		case INT_LOWER_BOUND:
> +			bioscfg_drv.integer_data[instance_id].lower_bound = integer;
> +			break;
> +		case INT_UPPER_BOUND:
> +			bioscfg_drv.integer_data[instance_id].upper_bound = integer;
> +			break;
> +		case INT_SCALAR_INCREMENT:
> +			bioscfg_drv.integer_data[instance_id].scalar_increment = integer;
> +			break;
> +
> +		default:
> +			pr_warn("Invalid element: %d found in Integer attribute or data may be malformed\n", elem);
> +			break;
> +		}
> +		kfree(str);
> +		str = NULL;
> +	}
> +	return 0;
> +}
> +
> +/*
> + * exit_integer_attributes() - Clear all attribute data
> + *
> + * Clears all data allocated for this group of attributes
> + */
> +void exit_integer_attributes(void)
> +{
> +	int instance_id;
> +
> +	for (instance_id = 0; instance_id < bioscfg_drv.integer_instances_count; instance_id++) {
> +		if (bioscfg_drv.integer_data[instance_id].attr_name_kobj)
> +			sysfs_remove_group(bioscfg_drv.integer_data[instance_id].attr_name_kobj,
> +								&integer_attr_group);
> +	}
> +	bioscfg_drv.integer_instances_count = 0;
> +
> +	kfree(bioscfg_drv.integer_data);
> +	bioscfg_drv.integer_data = NULL;
> +}
> diff --git a/drivers/platform/x86/hp/ordered-attributes.c b/drivers/platform/x86/hp/ordered-attributes.c
> new file mode 100644
> index 000000000000..a66d7f0b34d2
> --- /dev/null
> +++ b/drivers/platform/x86/hp/ordered-attributes.c
> @@ -0,0 +1,568 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Functions corresponding to ordered list type attributes under
> + * BIOS ORDERED LIST GUID for use with hp-bioscfg driver.
> + *
> + *  Copyright (c) 2022 HP Development Company, L.P.
> + */
> +
> +#include "bioscfg.h"
> +
> +get_instance_id(ordered_list);
> +
> +static ssize_t current_value_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
> +{
> +	int instance_id = get_ordered_list_instance_id(kobj);
> +	union acpi_object *obj = NULL;
> +	ssize_t ret;
> +
> +	if (instance_id < 0)
> +		return -EIO;
> +
> +	/* need to use specific instance_id and guid combination to get right data */
> +	obj = get_wmiobj_pointer(instance_id, HP_WMI_BIOS_ORDERED_LIST_GUID);
> +	if (!obj)
> +		return -EIO;
> +
> +	ret = snprintf(buf, PAGE_SIZE, "%s\n",
> +		       bioscfg_drv.ordered_list_data[instance_id].current_value);
> +
> +	kfree(obj);
> +	return ret;
> +}
> +
> +/*
> + * validate_ordered_list_value -
> + * Validate input of current_value against possible values
> + *
> + * @instance_id: The instance on which input is validated
> + * @buf: Input value
> + */
> +static int validate_ordered_list_values(int instance_id, const char *buf)
> +{
> +	char *options = NULL;
> +	char *p;
> +	int ret = 0;
> +	int found = 0;
> +	char *new_values = NULL;
> +	char *value;
> +	int elem;
> +	int elem_found = 0;
> +
> +	options = kstrdup(bioscfg_drv.ordered_list_data[instance_id].elements,
> +				 GFP_KERNEL);
> +	new_values = kstrdup(buf, GFP_KERNEL);
> +
> +	if (!options || !new_values) {
> +		ret = -ENOMEM;
> +		goto validate_ordered_list_value_exit;
> +	}
> +
> +	/* Is it a read only attribute */
> +	if (bioscfg_drv.ordered_list_data[instance_id].is_readonly) {
> +		ret = -EIO;
> +		goto validate_ordered_list_value_exit;
> +	}
> +
> +	/*
> +	 * Changes to ordered list values require checking that new
> +	 * values are found in the list of elements.
> +	 */
> +	for (elem = 0; elem < bioscfg_drv.ordered_list_data[instance_id].size; elem++) {
> +
> +		value = strsep(&new_values, ",");
> +		if (value != NULL) {
> +			if (!*value)
> +				continue;
> +			elem_found++;
> +		}
> +
> +		while ((p = strsep(&options, ";")) != NULL) {
> +			if (!*p)
> +				continue;
> +
> +			if (!strcasecmp(p, value)) {
> +				found = 1;
> +				break;
> +			}
> +		}
> +
> +		if (!found) {
> +			pr_warn("\"%s\" is not a valid ordered list element\n", value);
> +			ret = -EINVAL;
> +			goto validate_ordered_list_value_exit;
> +		}
> +	}
> +
> +	if (elem_found == bioscfg_drv.ordered_list_data[instance_id].size) {
> +		pr_warn("Number of new values is not equal to number of ordered list elements (%d)\n",
> +			bioscfg_drv.ordered_list_data[instance_id].size);
> +		ret = -EINVAL;
> +		goto validate_ordered_list_value_exit;
> +	}
> +
> +validate_ordered_list_value_exit:
> +	kfree(options);
> +	kfree(new_values);
> +	return ret;
> +}
> +
> +/*
> + * validate_ordered_input() -
> + * Validate input of current_value against possible values
> + *
> + * @instance_id: The instance on which input is validated
> + * @buf: Input value
> + */
> +static int validate_ordered_list_input(int instance_id, const char *buf)
> +{
> +	int ret = 0;
> +
> +	ret = validate_ordered_list_values(instance_id, buf);
> +	if (ret < 0) {
> +		ret = -EINVAL;
> +		goto validate_ordered_list_exit;
> +	}
> +
> +	strscpy(bioscfg_drv.ordered_list_data[instance_id].new_value,
> +		buf,
> +		sizeof(bioscfg_drv.ordered_list_data[instance_id].new_value));
> +
> +validate_ordered_list_exit:
> +	return ret;
> +}
> +
> +static void update_ordered_list_value(int instance_id)
> +{
> +	strscpy(bioscfg_drv.ordered_list_data[instance_id].current_value,
> +		bioscfg_drv.ordered_list_data[instance_id].new_value,
> +		sizeof(bioscfg_drv.ordered_list_data[instance_id].current_value));
> +}
> +
> +attribute_s_property_show(display_name_language_code, ordered_list);
> +static struct kobj_attribute ordered_list_display_langcode =
> +		__ATTR_RO(display_name_language_code);
> +
> +attribute_s_property_show(display_name, ordered_list);
> +static struct kobj_attribute ordered_list_display_name =
> +		__ATTR_RO(display_name);
> +
> +attribute_property_store(current_value, ordered_list);
> +static struct kobj_attribute ordered_list_current_val =
> +		__ATTR_RW_MODE(current_value, 0600);
> +
> +attribute_s_property_show(elements, ordered_list);
> +static struct kobj_attribute ordered_list_elements_val =
> +		__ATTR_RO(elements);
> +
> +attribute_n_property_show(size, ordered_list);
> +static struct kobj_attribute ordered_list_size_val =
> +		__ATTR_RO(size);
> +
> +static ssize_t type_show(struct kobject *kobj, struct kobj_attribute *attr,
> +			 char *buf)
> +{
> +	return sprintf(buf, "ordered-list\n");
> +}
> +static struct kobj_attribute ordered_list_type =
> +		__ATTR_RO(type);
> +
> +static struct attribute *ordered_list_attrs[] = {
> +	&ordered_list_display_langcode.attr,
> +	&ordered_list_display_name.attr,
> +	&ordered_list_current_val.attr,
> +	&ordered_list_elements_val.attr,
> +	&ordered_list_size_val.attr,
> +	&ordered_list_type.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group ordered_list_attr_group = {
> +	.attrs = ordered_list_attrs,
> +};
> +
> +int alloc_ordered_list_data(void)
> +{
> +	int ret = 0;
> +
> +	bioscfg_drv.ordered_list_instances_count =
> +		get_instance_count(HP_WMI_BIOS_ORDERED_LIST_GUID);
> +	bioscfg_drv.ordered_list_data = kcalloc(bioscfg_drv.ordered_list_instances_count,
> +					sizeof(struct ordered_list_data), GFP_KERNEL);
> +	if (!bioscfg_drv.ordered_list_data) {
> +		bioscfg_drv.ordered_list_instances_count = 0;
> +		ret = -ENOMEM;
> +	}
> +	return ret;
> +}
> +
> +/*
> + * populate_ordered_list_package_data() -
> + * Populate all properties of an instance under ordered_list attribute
> + *
> + * @order_obj: ACPI object with ordered_list data
> + * @instance_id: The instance to enumerate
> + * @attr_name_kobj: The parent kernel object
> + */
> +int populate_ordered_list_package_data(union acpi_object *order_obj, int instance_id,
> +			struct kobject *attr_name_kobj)
> +{
> +	char *str_value = NULL;
> +	int str_len;
> +	int ret = 0;
> +
> +	bioscfg_drv.ordered_list_data[instance_id].type = HPWMI_ORDERED_LIST_TYPE;
> +	bioscfg_drv.ordered_list_data[instance_id].attr_name_kobj = attr_name_kobj;
> +	ret = convert_hexstr_to_str(&(order_obj[NAME].string.pointer),
> +				       order_obj[NAME].string.length,
> +				       &str_value, &str_len);
> +
> +	if (ACPI_FAILURE(ret)) {
> +		kfree(str_value);
> +		return ret;
> +	}
> +
> +	strscpy(bioscfg_drv.ordered_list_data[instance_id].attribute_name,
> +		str_value,
> +		sizeof(bioscfg_drv.ordered_list_data[instance_id].attribute_name));
> +	strscpy(bioscfg_drv.ordered_list_data[instance_id].display_name,
> +		str_value,
> +		sizeof(bioscfg_drv.ordered_list_data[instance_id].display_name));
> +
> +	kfree(str_value);
> +	str_value = NULL;
> +
> +	populate_ordered_list_elements_from_package(order_obj, instance_id, HPWMI_ORDERED_LIST_TYPE);
> +	return sysfs_create_group(attr_name_kobj, &ordered_list_attr_group);
> +}
> +
> +int populate_ordered_list_elements_from_package(union acpi_object *order_obj,
> +					   int instance_id,
> +					   enum hp_wmi_data_type type)
> +{
> +	char *str_value = NULL;
> +	int value_len;
> +	int status = 0;
> +	u32 size = 0;
> +	u32 int_value;
> +	int elem = 0;
> +	int reqs;
> +	int eloc;
> +	char *tmpstr = NULL;
> +	char *part_tmp = NULL;
> +	int tmp_len = 0;
> +	char *part = NULL;
> +
> +	strscpy(bioscfg_drv.ordered_list_data[instance_id].display_name_language_code,
> +		LANG_CODE_STR,
> +		sizeof(bioscfg_drv.ordered_list_data[instance_id].display_name_language_code));
> +
> +	for (elem = 1, eloc = 1; elem < hp_wmi_elements_count[type]; elem++, eloc++) {
> +
> +		switch (order_obj[elem].type) {
> +		case ACPI_TYPE_STRING:
> +
> +			if (elem != PREREQUISITES) {
> +				status = convert_hexstr_to_str(&order_obj[elem].string.pointer,
> +							       order_obj[elem].string.length,
> +							       &str_value, &value_len);
> +				if (ACPI_FAILURE(status))
> +					continue;
> +
> +			}
> +			break;
> +		case ACPI_TYPE_INTEGER:
> +			int_value = (u32)order_obj[elem].integer.value;
> +			break;
> +		default:
> +			pr_warn("Unsupported object type [%d]\n", order_obj[elem].type);
> +			continue;
> +		}
> +
> +		/*
> +		 * Stop if extra counter is greater than total number
> +		 * of elements for ordered list type
> +		 */
> +		if (eloc == hp_wmi_elements_count[type])
> +			goto exit_ordered_list_package;
> +
> +
> +		/* Assign appropriate element value to corresponding field*/
> +		switch (eloc) {
> +		case VALUE:
> +			strscpy(bioscfg_drv.ordered_list_data[instance_id].current_value,
> +				str_value, sizeof(bioscfg_drv.ordered_list_data[instance_id].current_value));
> +			break;
> +		case PATH:
> +			strscpy(bioscfg_drv.ordered_list_data[instance_id].path, str_value,
> +				sizeof(bioscfg_drv.ordered_list_data[instance_id].path));
> +			break;
> +		case IS_READONLY:
> +			bioscfg_drv.ordered_list_data[instance_id].is_readonly = int_value;
> +			break;
> +		case DISPLAY_IN_UI:
> +			bioscfg_drv.ordered_list_data[instance_id].display_in_ui = int_value;
> +			break;
> +		case REQUIRES_PHYSICAL_PRESENCE:
> +			bioscfg_drv.ordered_list_data[instance_id].requires_physical_presence = int_value;
> +			break;
> +		case SEQUENCE:
> +			bioscfg_drv.ordered_list_data[instance_id].sequence = int_value;
> +			break;
> +		case PREREQUISITE_SIZE:
> +			bioscfg_drv.ordered_list_data[instance_id].prerequisitesize = int_value;
> +			if (int_value > 20)
> +				pr_warn("Prerequisites size value exceeded the maximum number of elements supported or data may be malformed\n");
> +			/*
> +			 * prerequisites element is omitted when
> +			 * prerequisitesSize value is zero.
> +			 */
> +			if (int_value == 0)
> +				eloc++;
> +			break;
> +		case PREREQUISITES:
> +			size = bioscfg_drv.ordered_list_data[instance_id].prerequisitesize;
> +			for (reqs = 0; reqs < size; reqs++) {
> +				status = convert_hexstr_to_str(&order_obj[elem].string.pointer,
> +							       order_obj[elem].string.length,
> +							       &str_value, &value_len);
> +
> +				if (ACPI_FAILURE(status))
> +					continue;
> +
> +				strlcat(bioscfg_drv.ordered_list_data[instance_id].prerequisites,
> +					str_value,
> +					sizeof(bioscfg_drv.ordered_list_data[instance_id].prerequisites));
> +
> +				if (reqs != (size - 1))
> +					strlcat(bioscfg_drv.ordered_list_data[instance_id].prerequisites, ";",
> +						sizeof(bioscfg_drv.ordered_list_data[instance_id].prerequisites));
> +
> +				kfree(str_value);
> +				str_value = NULL;
> +			}
> +			break;
> +
> +		case SECURITY_LEVEL:
> +			bioscfg_drv.ordered_list_data[instance_id].security_level = int_value;
> +			break;
> +
> +		case ORD_LIST_SIZE:
> +			bioscfg_drv.ordered_list_data[instance_id].size = int_value;
> +			break;
> +		case ORD_LIST_ELEMENTS:
> +			size = bioscfg_drv.ordered_list_data[instance_id].size;
> +
> +			/*
> +			 * Ordered list data is stored in hex and comma separated format
> +			 * Convert the data and split it to show each element
> +			 */
> +			status = convert_hexstr_to_str(&str_value, value_len, &tmpstr, &tmp_len);
> +			if (ACPI_FAILURE(status))
> +				goto exit_ordered_list_package;
> +
> +			part_tmp = tmpstr;
> +			part = strsep(&part_tmp, ",");
> +			if (!part)
> +				strscpy(bioscfg_drv.ordered_list_data[instance_id].elements,
> +					tmpstr, sizeof(bioscfg_drv.ordered_list_data[instance_id].elements));
> +
> +			while (part) {
> +				strlcat(bioscfg_drv.ordered_list_data[instance_id].elements,
> +					part, sizeof(bioscfg_drv.ordered_list_data[instance_id].elements));
> +
> +				part = strsep(&part_tmp, ",");
> +				if (part)
> +					strlcat(bioscfg_drv.ordered_list_data[instance_id].elements, ";",
> +						sizeof(bioscfg_drv.ordered_list_data[instance_id].elements));
> +			}
> +			break;
> +		default:
> +			pr_warn("Invalid element: %d found in Ordered_List attribute or data may be malformed\n", elem);
> +			break;
> +		}
> +		kfree(tmpstr);
> +		tmpstr = NULL;
> +		kfree(str_value);
> +		str_value = NULL;
> +	}
> +
> +exit_ordered_list_package:
> +	kfree(tmpstr);
> +	tmpstr = NULL;
> +	kfree(str_value);
> +	str_value = NULL;
> +	return 0;
> +}
> +
> +/*
> + * populate_ordered_list_data() - Populate all properties of an
> + * instance under ordered list attribute
> + *
> + * @order_obj: ACPI object with enumeration data
> + * @instance_id: The instance to enumerate
> + * @attr_name_kobj: The parent kernel object
> + * @enum_property_count: Total properties count under ordered list type
> + */
> +int populate_ordered_list_buffer_data(union acpi_object *order_obj, int instance_id,
> +			struct kobject *attr_name_kobj)
> +{
> +
> +	bioscfg_drv.ordered_list_data[instance_id].type = HPWMI_ORDERED_LIST_TYPE;
> +	bioscfg_drv.ordered_list_data[instance_id].attr_name_kobj = attr_name_kobj;
> +
> +	strscpy(bioscfg_drv.ordered_list_data[instance_id].attribute_name,
> +		attr_name_kobj->name,
> +		sizeof(bioscfg_drv.ordered_list_data[instance_id].attribute_name));
> +	strscpy(bioscfg_drv.ordered_list_data[instance_id].display_name,
> +		attr_name_kobj->name,
> +		sizeof(bioscfg_drv.ordered_list_data[instance_id].display_name));
> +
> +	/* Populate ordered list elements */
> +	populate_ordered_list_elements_from_buffer(order_obj, instance_id, HPWMI_ORDERED_LIST_TYPE);
> +
> +	return sysfs_create_group(attr_name_kobj, &ordered_list_attr_group);
> +}
> +
> +int populate_ordered_list_elements_from_buffer(union acpi_object *order_obj,
> +					       int instance_id, enum hp_wmi_data_type type)
> +{
> +	int status;
> +	char *str = NULL;
> +	int elem;
> +	int reqs;
> +	int integer;
> +	int size = 0;
> +	int values;
> +
> +	elem = 0;
> +	strscpy(bioscfg_drv.ordered_list_data[instance_id].display_name_language_code,
> +		LANG_CODE_STR,
> +		sizeof(bioscfg_drv.ordered_list_data[instance_id].display_name_language_code));
> +
> +	for (elem = 1; elem < 3; elem++) {
> +
> +		status = get_string_from_buffer((u16 **)&order_obj->buffer.pointer, &str);
> +		if (ACPI_FAILURE(status))
> +			continue;
> +
> +		switch (elem) {
> +		case VALUE:
> +			strscpy(bioscfg_drv.ordered_list_data[instance_id].current_value,
> +				str, sizeof(bioscfg_drv.ordered_list_data[instance_id].current_value));
> +			break;
> +		case PATH:
> +			strscpy(bioscfg_drv.ordered_list_data[instance_id].path, str,
> +				sizeof(bioscfg_drv.ordered_list_data[instance_id].path));
> +			break;
> +		default:
> +			pr_warn("Invalid element: %d found in Ordered list attribute or data may be malformed\n", elem);
> +			break;
> +		}
> +		kfree(str);
> +		str = NULL;
> +	}
> +	for (elem = 3; elem < hp_wmi_elements_count[type]; elem++) {
> +
> +		if (elem != PREREQUISITES && elem != ORD_LIST_ELEMENTS)
> +			status = get_integer_from_buffer((int **)&order_obj->buffer.pointer, (int *)&integer);
> +
> +		if (ACPI_FAILURE(status))
> +			continue;
> +
> +		switch (elem) {
> +
> +		case IS_READONLY:
> +			bioscfg_drv.ordered_list_data[instance_id].is_readonly = integer;
> +			break;
> +		case DISPLAY_IN_UI:
> +			bioscfg_drv.ordered_list_data[instance_id].display_in_ui = integer;
> +			break;
> +		case REQUIRES_PHYSICAL_PRESENCE:
> +			bioscfg_drv.ordered_list_data[instance_id].requires_physical_presence = integer;
> +			break;
> +		case SEQUENCE:
> +			bioscfg_drv.ordered_list_data[instance_id].sequence = integer;
> +			break;
> +		case PREREQUISITE_SIZE:
> +			bioscfg_drv.ordered_list_data[instance_id].prerequisitesize = integer;
> +			if (integer > 20)
> +				pr_warn("Prerequisites size value exceeded the maximum number of elements supported or data may be malformed\n");
> +			break;
> +		case PREREQUISITES:
> +			size = bioscfg_drv.ordered_list_data[instance_id].prerequisitesize;
> +			for (reqs = 0; reqs < size; reqs++) {
> +				status = get_string_from_buffer((u16 **)&order_obj->buffer.pointer, &str);
> +				if (ACPI_FAILURE(status))
> +					continue;
> +
> +				strlcat(bioscfg_drv.ordered_list_data[instance_id].prerequisites,
> +					str,
> +					sizeof(bioscfg_drv.ordered_list_data[instance_id].prerequisites));
> +
> +				if (reqs != (size - 1))
> +					strlcat(bioscfg_drv.ordered_list_data[instance_id].prerequisites, ";",
> +						sizeof(bioscfg_drv.ordered_list_data[instance_id].prerequisites));
> +
> +				kfree(str);
> +				str = NULL;
> +			}
> +			break;
> +		case SECURITY_LEVEL:
> +			bioscfg_drv.ordered_list_data[instance_id].security_level = integer;
> +			break;
> +		case ORD_LIST_SIZE:
> +			bioscfg_drv.ordered_list_data[instance_id].size = integer;
> +			break;
> +		case ORD_LIST_ELEMENTS:
> +			size = bioscfg_drv.ordered_list_data[instance_id].size;
> +			for (values = 0; values < size; values++) {
> +				status = get_string_from_buffer((u16 **)&order_obj->buffer.pointer, &str);
> +				if (ACPI_FAILURE(status))
> +					continue;
> +
> +				strlcat(bioscfg_drv.ordered_list_data[instance_id].elements,
> +					str,
> +					sizeof(bioscfg_drv.ordered_list_data[instance_id].elements));
> +
> +				if (values != (size - 1))
> +					strlcat(bioscfg_drv.ordered_list_data[instance_id].elements, ";",
> +						sizeof(bioscfg_drv.ordered_list_data[instance_id].elements));
> +
> +				kfree(str);
> +				str = NULL;
> +			}
> +			break;
> +		default:
> +			pr_warn("Invalid element: %d found in Ordered list attribute or data may be malformed\n", elem);
> +			break;
> +		}
> +		kfree(str);
> +		str = NULL;
> +	}
> +	kfree(str);
> +	str = NULL;
> +
> +	return 0;
> +}
> +
> +
> +/*
> + * exit_ordered_list_attributes() - Clear all attribute data
> + *
> + * Clears all data allocated for this group of attributes
> + */
> +void exit_ordered_list_attributes(void)
> +{
> +	int instance_id;
> +
> +	for (instance_id = 0; instance_id < bioscfg_drv.ordered_list_instances_count; instance_id++) {
> +		if (bioscfg_drv.ordered_list_data[instance_id].attr_name_kobj)
> +			sysfs_remove_group(bioscfg_drv.ordered_list_data[instance_id].attr_name_kobj,
> +								&ordered_list_attr_group);
> +	}
> +	bioscfg_drv.ordered_list_instances_count = 0;
> +
> +	kfree(bioscfg_drv.ordered_list_data);
> +	bioscfg_drv.ordered_list_data = NULL;
> +}
> diff --git a/drivers/platform/x86/hp/passwdattr-interface.c b/drivers/platform/x86/hp/passwdattr-interface.c
> new file mode 100644
> index 000000000000..ecba2994563c
> --- /dev/null
> +++ b/drivers/platform/x86/hp/passwdattr-interface.c
> @@ -0,0 +1,50 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Functions corresponding to SET password methods under
> + * HP_WMI_SET_BIOS_SETTING_GUID for use with hp-bioscfg driver.
> + *
> + * Copyright (c) 2022 Hewlett-Packard Inc.
> + */
> +
> +#include <linux/wmi.h>
> +#include "bioscfg.h"
> +
> +static int bios_attr_pass_interface_probe(struct wmi_device *wdev, const void *context)
> +{
> +	mutex_lock(&bioscfg_drv.mutex);
> +	bioscfg_drv.password_attr_wdev = wdev;
> +	mutex_unlock(&bioscfg_drv.mutex);
> +	return 0;
> +}
> +
> +static void bios_attr_pass_interface_remove(struct wmi_device *wdev)
> +{
> +	mutex_lock(&bioscfg_drv.mutex);
> +	bioscfg_drv.password_attr_wdev = NULL;
> +	mutex_unlock(&bioscfg_drv.mutex);
> +}
> +
> +static const struct wmi_device_id bios_attr_pass_interface_id_table[] = {
> +	{ .guid_string = HP_WMI_SET_BIOS_SETTING_GUID },
> +	{ },
> +};
> +static struct wmi_driver bios_attr_pass_interface_driver = {
> +	.driver = {
> +		.name = DRIVER_NAME"-password"
> +	},
> +	.probe = bios_attr_pass_interface_probe,
> +	.remove = bios_attr_pass_interface_remove,
> +	.id_table = bios_attr_pass_interface_id_table,
> +};
> +
> +int init_bios_attr_pass_interface(void)
> +{
> +	return wmi_driver_register(&bios_attr_pass_interface_driver);
> +}
> +
> +void exit_bios_attr_pass_interface(void)
> +{
> +	wmi_driver_unregister(&bios_attr_pass_interface_driver);
> +}
> +
> +MODULE_DEVICE_TABLE(wmi, bios_attr_pass_interface_id_table);
> diff --git a/drivers/platform/x86/hp/passwdobj-attributes.c b/drivers/platform/x86/hp/passwdobj-attributes.c
> new file mode 100644
> index 000000000000..75d2f2c1e0e3
> --- /dev/null
> +++ b/drivers/platform/x86/hp/passwdobj-attributes.c
> @@ -0,0 +1,640 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Functions corresponding to password object type attributes under
> + * BIOS PASSWORD for use with hp-bioscfg driver.
> + *
> + *  Copyright (c) 2022 HP Development Company, L.P.
> + */
> +
> +#include "bioscfg.h"
> +#include <asm-generic/posix_types.h>
> +
> +get_instance_id(password);
> +
> +int clear_passwords(const int instance)
> +{
> +	if (!bioscfg_drv.password_data[instance].is_enabled)
> +		return 0;
> +
> +	memset(bioscfg_drv.password_data[instance].current_password,
> +	       0, sizeof(bioscfg_drv.password_data[instance].current_password));
> +	memset(bioscfg_drv.password_data[instance].new_password,
> +	       0, sizeof(bioscfg_drv.password_data[instance].new_password));
> +
> +	return 0;
> +}
> +
> +int clear_all_passwords(void)
> +{
> +	int instance;
> +
> +	for (instance = 0; instance < bioscfg_drv.password_instances_count; instance++)
> +		clear_passwords(instance);
> +
> +	return 0;
> +}
> +
> +int get_password_instance_for_type(const char *name)
> +{
> +	int count = bioscfg_drv.password_instances_count;
> +	int instance;
> +
> +	for (instance = 0; instance < count; instance++) {
> +		if (strcmp(bioscfg_drv.password_data[instance].display_name, name) == 0)
> +			return instance;
> +	}
> +	return -EINVAL;
> +}
> +
> +int validate_password_input(int instance_id, const char *buf)
> +{
> +	int length;
> +
> +	length = strlen(buf);
> +	if (buf[length-1] == '\n')
> +		length--;
> +
> +	if (length > MAX_PASSWD_SIZE)
> +		return INVALID_BIOS_AUTH;
> +
> +	if (bioscfg_drv.password_data[instance_id].min_password_length > length ||
> +	    bioscfg_drv.password_data[instance_id].max_password_length < length)
> +		return INVALID_BIOS_AUTH;
> +	return SUCCESS;
> +}
> +
> +int password_is_set(const char *name)
> +{
> +	int id;
> +
> +	id = get_password_instance_for_type(name);
> +	if (id < 0)
> +		return 0;
> +
> +	return bioscfg_drv.password_data[id].is_enabled;
> +}
> +
> +attribute_n_property_show(is_enabled, password);
> +static struct kobj_attribute password_is_password_set = __ATTR_RO(is_enabled);
> +
> +static ssize_t current_password_store(struct kobject *kobj,
> +				      struct kobj_attribute *attr,
> +				      const char *buf, size_t count)
> +{
> +	char *p, *buf_cp;
> +	int id, ret = 0;
> +
> +	buf_cp = kstrdup(buf, GFP_KERNEL);
> +	if (!buf_cp) {
> +		ret = -ENOMEM;
> +		goto exit_current_password;
> +	}
> +
> +	p = memchr(buf_cp, '\n', count);
> +
> +	if (p != NULL)
> +		*p = '\0';
> +
> +	id = get_password_instance_id(kobj);
> +
> +	if (id >= 0)
> +		ret = validate_password_input(id, buf_cp);
> +
> +	if (!ret)
> +		strscpy(bioscfg_drv.password_data[id].current_password,
> +			buf_cp,
> +			sizeof(bioscfg_drv.password_data[id].current_password));
> +
> +exit_current_password:
> +	kfree(buf_cp);
> +	return ret ? ret : count;
> +}
> +static struct kobj_attribute password_current_password = __ATTR_WO(current_password);
> +
> +static ssize_t new_password_store(struct kobject *kobj,
> +				  struct kobj_attribute *attr,
> +				  const char *buf, size_t count)
> +{
> +	char *p, *buf_cp = NULL;
> +	int id, ret = -EIO;
> +
> +	buf_cp = kstrdup(buf, GFP_KERNEL);
> +	if (!buf_cp) {
> +		ret = -ENOMEM;
> +		goto exit_new_password;
> +	}
> +
> +	p = memchr(buf_cp, '\n', count);
> +
> +	if (p != NULL)
> +		*p = '\0';
> +
> +	id = get_password_instance_id(kobj);
> +
> +	if (id >= 0)
> +		ret = validate_password_input(id, buf_cp);
> +
> +	if (!ret)
> +		strscpy(bioscfg_drv.password_data[id].new_password,
> +			buf_cp,
> +			sizeof(bioscfg_drv.password_data[id].new_password));
> +
> +	if (!ret)
> +		ret = hp_set_attribute(kobj->name, buf_cp);
> +
> +exit_new_password:
> +	/*
> +	 * Regardless of the results both new and current passwords
> +	 * will be set to zero and avoid security issues
> +	 */
> +	clear_passwords(id);
> +
> +	kfree(buf_cp);
> +	return ret ? ret : count;
> +}
> +
> +static struct kobj_attribute password_new_password = __ATTR_WO(new_password);
> +
> +
> +attribute_n_property_show(min_password_length, password);
> +static struct kobj_attribute password_min_password_length = __ATTR_RO(min_password_length);
> +
> +attribute_n_property_show(max_password_length, password);
> +static struct kobj_attribute password_max_password_length = __ATTR_RO(max_password_length);
> +
> +static ssize_t role_show(struct kobject *kobj, struct kobj_attribute *attr,
> +			 char *buf)
> +{
> +	if (strcmp(kobj->name, SETUP_PASSWD) == 0)
> +		return sprintf(buf, "%s\n", role_type[BIOS_ADMIN]);
> +
> +	if (strcmp(kobj->name, POWER_ON_PASSWD) == 0)
> +		return sprintf(buf,  "%s\n", role_type[POWER_ON]);
> +
> +	return -EIO;
> +}
> +static struct kobj_attribute password_role = __ATTR_RO(role);
> +
> +static ssize_t mechanism_show(struct kobject *kobj, struct kobj_attribute *attr,
> +			   char *buf)
> +{
> +	int i = get_password_instance_id(kobj);
> +
> +	if (i < 0)
> +		return i;
> +
> +	if (bioscfg_drv.password_data[i].mechanism != PASSWORD)
> +		return -EINVAL;
> +
> +	return sprintf(buf, "%s\n",
> +		       passwd_mechanism_types[bioscfg_drv.password_data[i].mechanism]);
> +}
> +static struct kobj_attribute password_mechanism = __ATTR_RO(mechanism);
> +
> +static ssize_t type_show(struct kobject *kobj, struct kobj_attribute *attr,
> +			 char *buf)
> +{
> +	return sprintf(buf, "password\n");
> +}
> +static struct kobj_attribute password_type = __ATTR_RO(type);
> +
> +attribute_s_property_show(display_name, password);
> +static struct kobj_attribute password_display_name =
> +		__ATTR_RO(display_name);
> +
> +attribute_s_property_show(display_name_language_code, password);
> +static struct kobj_attribute password_display_langcode =
> +		__ATTR_RO(display_name_language_code);
> +
> +attribute_s_property_show(supported_encoding,  password);
> +static struct kobj_attribute password_encoding =
> +		__ATTR_RO(supported_encoding);
> +
> +attribute_n_property_show(encoding_size,  password);
> +static struct kobj_attribute password_encoding_size =
> +		__ATTR_RO(encoding_size);
> +
> +static struct attribute *password_attrs[] = {
> +	&password_is_password_set.attr,
> +	&password_min_password_length.attr,
> +	&password_max_password_length.attr,
> +	&password_current_password.attr,
> +	&password_new_password.attr,
> +	&password_role.attr,
> +	&password_mechanism.attr,
> +	&password_type.attr,
> +	&password_display_name.attr,
> +	&password_display_langcode.attr,
> +	&password_encoding.attr,
> +	&password_encoding_size.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group bios_password_attr_group = {
> +	.attrs = password_attrs,
> +};
> +
> +static const struct attribute_group system_password_attr_group = {
> +	.attrs = password_attrs,
> +};
> +
> +int alloc_password_data(void)
> +{
> +	int ret = 0;
> +
> +	bioscfg_drv.password_instances_count = get_instance_count(HP_WMI_BIOS_PASSWORD_GUID);
> +	bioscfg_drv.password_data = kcalloc(bioscfg_drv.password_instances_count,
> +					    sizeof(struct password_data), GFP_KERNEL);
> +	if (!bioscfg_drv.password_data) {
> +		bioscfg_drv.password_instances_count = 0;
> +		ret = -ENOMEM;
> +	}
> +
> +	return ret;
> +}
> +
> +/*
> + * populate_password_package_data -
> + *	Populate all properties for an instance under password attribute
> + *
> + * @password_obj: ACPI object with password data
> + * @instance_id: The instance to enumerate
> + * @attr_name_kobj: The parent kernel object
> + */
> +int populate_password_package_data(union acpi_object *password_obj, int instance_id,
> +				   struct kobject *attr_name_kobj)
> +{
> +	char *str_value = NULL;
> +	int str_len;
> +	int ret = 0;
> +
> +	bioscfg_drv.password_data[instance_id].type = HPWMI_PASSWORD_TYPE;
> +	bioscfg_drv.password_data[instance_id].attr_name_kobj = attr_name_kobj;
> +
> +	ret = convert_hexstr_to_str(&(password_obj[NAME].string.pointer),
> +				    password_obj[NAME].string.length,
> +				    &str_value, &str_len);
> +
> +	if (ACPI_FAILURE(ret)) {
> +		kfree(str_value);
> +		return ret;
> +	}
> +
> +	strscpy(bioscfg_drv.password_data[instance_id].attribute_name,
> +		str_value,
> +		sizeof(bioscfg_drv.password_data[instance_id].attribute_name));
> +	strscpy(bioscfg_drv.password_data[instance_id].display_name,
> +		str_value,
> +		sizeof(bioscfg_drv.password_data[instance_id].display_name));
> +
> +	kfree(str_value);
> +	str_value = NULL;
> +
> +	populate_password_elements_from_package(password_obj, instance_id, HPWMI_PASSWORD_TYPE);
> +
> +	if (strcmp(attr_name_kobj->name, "Setup Password") == 0) {
> +		/* Save  system authentication instance for easy access */
> +		return sysfs_create_group(attr_name_kobj, &bios_password_attr_group);
> +	}
> +
> +	return sysfs_create_group(attr_name_kobj, &system_password_attr_group);
> +}
> +
> +int populate_password_elements_from_package(union acpi_object *password_obj,
> +					   int instance_id,
> +					   enum hp_wmi_data_type type)
> +{
> +	char *str_value = NULL;
> +	int value_len;
> +	int status = 0;
> +	u32 size = 0;
> +	u32 int_value;
> +	int elem = 0;
> +	int reqs;
> +	int eloc;
> +	int pos_values;
> +
> +	strscpy(bioscfg_drv.password_data[instance_id].display_name_language_code,
> +		LANG_CODE_STR,
> +		sizeof(bioscfg_drv.password_data[instance_id].display_name_language_code));
> +
> +	for (elem = 1, eloc = 1; elem < hp_wmi_elements_count[type]; elem++, eloc++) {
> +
> +		switch (password_obj[elem].type) {
> +		case ACPI_TYPE_STRING:
> +
> +			if (PREREQUISITES != elem && ENUM_POSSIBLE_VALUES != elem) {
> +				status = convert_hexstr_to_str(&password_obj[elem].string.pointer,
> +							       password_obj[elem].string.length,
> +							       &str_value, &value_len);
> +
> +				if (ACPI_FAILURE(status))
> +					continue;
> +
> +			}
> +			break;
> +		case ACPI_TYPE_INTEGER:
> +			int_value = (u32)password_obj[elem].integer.value;
> +			break;
> +		default:
> +			pr_warn("Unsupported object type [%d]\n", password_obj[elem].type);
> +			continue;
> +		}
> +
> +		/* stop if extra counter is greater than total number
> +		 * of elements for password type
> +		 */
> +		if (eloc == hp_wmi_elements_count[type])
> +			goto exit_password_package;
> +
> +		/* Assign appropriate element value to corresponding field*/
> +		switch (eloc) {
> +		case VALUE:
> +			break;
> +		case PATH:
> +			strscpy(bioscfg_drv.password_data[instance_id].path, str_value,
> +				sizeof(bioscfg_drv.password_data[instance_id].path));
> +			break;
> +		case IS_READONLY:
> +			bioscfg_drv.password_data[instance_id].is_readonly = int_value;
> +			break;
> +		case DISPLAY_IN_UI:
> +			bioscfg_drv.password_data[instance_id].display_in_ui = int_value;
> +			break;
> +		case REQUIRES_PHYSICAL_PRESENCE:
> +			bioscfg_drv.password_data[instance_id].requires_physical_presence = int_value;
> +			break;
> +		case SEQUENCE:
> +			bioscfg_drv.password_data[instance_id].sequence = int_value;
> +			break;
> +		case PREREQUISITE_SIZE:
> +			bioscfg_drv.password_data[instance_id].prerequisitesize = int_value;
> +			if (int_value > 20)
> +				pr_warn("Prerequisites size value exceeded the maximum number of elements supported or data may be malformed\n");
> +			/*
> +			 * prerequisites element is omitted when
> +			 * prerequisitesSize value is zero.
> +			 */
> +			if (int_value == 0)
> +				eloc++;
> +			break;
> +		case PREREQUISITES:
> +			size = bioscfg_drv.password_data[instance_id].prerequisitesize;
> +
> +			for (reqs = 0; reqs < size; reqs++) {
> +				status = convert_hexstr_to_str(&password_obj[elem].string.pointer,
> +							       password_obj[elem].string.length,
> +							       &str_value, &value_len);
> +
> +				if (ACPI_FAILURE(status))
> +					break;
> +
> +				strlcat(bioscfg_drv.password_data[instance_id].prerequisites,
> +					str_value,
> +					sizeof(bioscfg_drv.password_data[instance_id].prerequisites));
> +
> +				if (reqs != (size - 1))
> +					strlcat(bioscfg_drv.password_data[instance_id].prerequisites, ";",
> +						sizeof(bioscfg_drv.password_data[instance_id].prerequisites));
> +
> +				kfree(str_value);
> +				str_value = NULL;
> +			}
> +			break;
> +
> +		case SECURITY_LEVEL:
> +			bioscfg_drv.password_data[instance_id].security_level = int_value;
> +			break;
> +
> +		case PSWD_MIN_LENGTH:
> +			bioscfg_drv.password_data[instance_id].min_password_length = int_value;
> +			break;
> +		case PSWD_MAX_LENGTH:
> +			bioscfg_drv.password_data[instance_id].max_password_length = int_value;
> +			break;
> +		case PSWD_SIZE:
> +			bioscfg_drv.password_data[instance_id].encoding_size = int_value;
> +			break;
> +		case PSWD_SUPPORTED_ENCODING:
> +			size = bioscfg_drv.password_data[instance_id].encoding_size;
> +			for (pos_values = 0; pos_values < size; pos_values++) {
> +				status = convert_hexstr_to_str(&password_obj[elem + pos_values].string.pointer,
> +							       password_obj[elem  + pos_values].string.length,
> +							       &str_value, &value_len);
> +				if (ACPI_FAILURE(status))
> +					break;
> +
> +				strlcat(bioscfg_drv.password_data[instance_id].supported_encoding,
> +					str_value,
> +					sizeof(bioscfg_drv.password_data[instance_id].supported_encoding));
> +
> +				if (pos_values < (size - 1))
> +					strlcat(bioscfg_drv.password_data[instance_id].supported_encoding, ";",
> +						sizeof(bioscfg_drv.password_data[instance_id].supported_encoding));
> +				kfree(str_value);
> +				str_value = NULL;
> +			}
> +			break;
> +		case PSWD_IS_SET:
> +			bioscfg_drv.password_data[instance_id].is_enabled = int_value;
> +			break;
> +
> +		default:
> +			pr_warn("Invalid element: %d found in Password attribute or data may be malformed\n", elem);
> +			break;
> +		}
> +		kfree(str_value);
> +		str_value = NULL;
> +	}
> +
> +exit_password_package:
> +	kfree(str_value);
> +	str_value = NULL;
> +	return 0;
> +}
> +
> +/*
> + * populate_password_buffer_data -
> + * Populate all properties for an instance under password object attribute
> + *
> + * @password_obj: ACPI object with password object data
> + * @instance_id: The instance to enumerate
> + * @attr_name_kobj: The parent kernel object
> + */
> +int populate_password_buffer_data(union acpi_object *password_obj, int instance_id,
> +			   struct kobject *attr_name_kobj)
> +{
> +	bioscfg_drv.password_data[instance_id].type = HPWMI_PASSWORD_TYPE;
> +	bioscfg_drv.password_data[instance_id].attr_name_kobj = attr_name_kobj;
> +
> +	strscpy(bioscfg_drv.password_data[instance_id].attribute_name,
> +		attr_name_kobj->name,
> +		sizeof(bioscfg_drv.password_data[instance_id].attribute_name));
> +	strscpy(bioscfg_drv.password_data[instance_id].display_name,
> +		attr_name_kobj->name,
> +		sizeof(bioscfg_drv.password_data[instance_id].display_name));
> +
> +	/* Populate Password attributes */
> +	populate_password_elements_from_buffer(password_obj, instance_id, HPWMI_PASSWORD_TYPE);
> +	if (strcmp(attr_name_kobj->name, "Setup Password") == 0)
> +		return sysfs_create_group(attr_name_kobj, &bios_password_attr_group);
> +
> +	return sysfs_create_group(attr_name_kobj, &system_password_attr_group);
> +}
> +
> +int populate_password_elements_from_buffer(union acpi_object *password_obj,
> +					   int instance_id,
> +					   enum hp_wmi_data_type type)
> +{
> +	int status;
> +	char *str = NULL;
> +	int elem;
> +	int reqs;
> +	int integer;
> +	int size = 0;
> +	int values;
> +
> +	elem = 0;
> +	strscpy(bioscfg_drv.password_data[instance_id].display_name_language_code,
> +		LANG_CODE_STR,
> +		sizeof(bioscfg_drv.password_data[instance_id].display_name_language_code));
> +
> +	for (elem = 1; elem < 3; elem++) {
> +
> +		status = get_string_from_buffer((u16 **)&password_obj->buffer.pointer, &str);
> +		if (ACPI_FAILURE(status))
> +			continue;
> +
> +		switch (elem) {
> +		case VALUE:
> +			strscpy(bioscfg_drv.password_data[instance_id].current_password,
> +				str, sizeof(bioscfg_drv.password_data[instance_id].current_password));
> +			break;
> +		case PATH:
> +			strscpy(bioscfg_drv.password_data[instance_id].path, str,
> +				sizeof(bioscfg_drv.password_data[instance_id].path));
> +			break;
> +		default:
> +			pr_warn("Invalid element: %d found in Password  attribute or data may be malformed\n", elem);
> +			break;
> +		}
> +		kfree(str);
> +		str = NULL;
> +	}
> +
> +	for (elem = 3; elem < hp_wmi_elements_count[type]; elem++) {
> +
> +		if (elem != PREREQUISITES  && elem != PSWD_SUPPORTED_ENCODING)
> +			status = get_integer_from_buffer((int **)&password_obj->buffer.pointer, (int *)&integer);
> +
> +		if (ACPI_FAILURE(status))
> +			continue;
> +
> +		switch (elem) {
> +		case IS_READONLY:
> +			bioscfg_drv.password_data[instance_id].is_readonly = integer;
> +			break;
> +		case DISPLAY_IN_UI:
> +			bioscfg_drv.password_data[instance_id].display_in_ui = integer;
> +			break;
> +		case REQUIRES_PHYSICAL_PRESENCE:
> +			bioscfg_drv.password_data[instance_id].requires_physical_presence = integer;
> +			break;
> +		case SEQUENCE:
> +			bioscfg_drv.password_data[instance_id].sequence = integer;
> +			break;
> +		case PREREQUISITE_SIZE:
> +			bioscfg_drv.password_data[instance_id].prerequisitesize = integer;
> +			if (integer > 20)
> +				pr_warn("Prerequisites size value exceeded the maximum number of elements supported or data may be malformed\n");
> +			break;
> +		case PREREQUISITES:
> +			size = bioscfg_drv.password_data[instance_id].prerequisitesize;
> +			for (reqs = 0; reqs < size; reqs++) {
> +				status = get_string_from_buffer((u16 **)&password_obj->buffer.pointer, &str);
> +				if (ACPI_FAILURE(status))
> +					continue;
> +
> +				strlcat(bioscfg_drv.password_data[instance_id].prerequisites,
> +					str,
> +					sizeof(bioscfg_drv.password_data[instance_id].prerequisites));
> +
> +				if (reqs != (size - 1))
> +					strlcat(bioscfg_drv.password_data[instance_id].prerequisites, ";",
> +						sizeof(bioscfg_drv.password_data[instance_id].prerequisites));
> +
> +				kfree(str);
> +				str = NULL;
> +			}
> +			break;
> +		case SECURITY_LEVEL:
> +			bioscfg_drv.password_data[instance_id].security_level = integer;
> +			break;
> +
> +		case PSWD_MIN_LENGTH:
> +			bioscfg_drv.password_data[instance_id].min_password_length = integer;
> +			break;
> +		case PSWD_MAX_LENGTH:
> +			bioscfg_drv.password_data[instance_id].max_password_length = integer;
> +			break;
> +		case PSWD_SIZE:
> +			bioscfg_drv.password_data[instance_id].encoding_size = integer;
> +			break;
> +		case PSWD_SUPPORTED_ENCODING:
> +			size = bioscfg_drv.password_data[instance_id].encoding_size;
> +			for (values = 0; values < size; values++) {
> +				status = get_string_from_buffer((u16 **)&password_obj->buffer.pointer, &str);
> +				if (ACPI_FAILURE(status))
> +					continue;
> +
> +				strlcat(bioscfg_drv.password_data[instance_id].supported_encoding,
> +					str,
> +					sizeof(bioscfg_drv.password_data[instance_id].supported_encoding));
> +
> +				if (values != (size - 1))
> +					strlcat(bioscfg_drv.password_data[instance_id].supported_encoding, ";",
> +						sizeof(bioscfg_drv.password_data[instance_id].supported_encoding));
> +
> +				kfree(str);
> +				str = NULL;
> +			}
> +			break;
> +		case PSWD_IS_SET:
> +			bioscfg_drv.password_data[instance_id].is_enabled = integer;
> +			break;
> +		default:
> +			pr_warn("Invalid element: %d found in Password  attribute or data may be malformed\n", elem);
> +			break;
> +		}
> +		kfree(str);
> +		str = NULL;
> +	}
> +	kfree(str);
> +	str = NULL;
> +
> +	return 0;
> +}
> +
> +/*
> + * exit_password_attributes() - Clear all attribute data
> + *
> + * Clears all data allocated for this group of attributes
> + */
> +void exit_password_attributes(void)
> +{
> +	int instance_id;
> +
> +	for (instance_id = 0; instance_id < bioscfg_drv.password_instances_count; instance_id++) {
> +		if (bioscfg_drv.password_data[instance_id].attr_name_kobj) {
> +			if (strcmp(bioscfg_drv.password_data[instance_id].attr_name_kobj->name, SETUP_PASSWD) == 0)
> +				sysfs_remove_group(bioscfg_drv.password_data[instance_id].attr_name_kobj,
> +								&bios_password_attr_group);
> +			else
> +				sysfs_remove_group(bioscfg_drv.password_data[instance_id].attr_name_kobj,
> +								&system_password_attr_group);
> +		}
> +	}
> +	bioscfg_drv.password_instances_count = 0;
> +	kfree(bioscfg_drv.password_data);
> +	bioscfg_drv.password_data = NULL;
> +}
> diff --git a/drivers/platform/x86/hp/spmobj-attributes.c b/drivers/platform/x86/hp/spmobj-attributes.c
> new file mode 100644
> index 000000000000..631fdbd05be9
> --- /dev/null
> +++ b/drivers/platform/x86/hp/spmobj-attributes.c
> @@ -0,0 +1,408 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Functions corresponding to secure platform management object type
> + * attributes under BIOS PASSWORD for use with hp-bioscfg driver
> + *
> + *  Copyright (c) 2022 HP Development Company, L.P.
> + */
> +
> +#include "bioscfg.h"
> +
> +#define MAX_KEK_BLOB_SIZE	4160
> +#define MAX_SK_BLOB_SIZE	516
> +
> +enum spm_states_values {
> +	NOT_PROVISIONED		 = 0x00,
> +	PROVISIONED		 = 0x01,
> +	PROVISIONING_IN_PROGRESS = 0x02
> +};
> +
> +static const char * const spm_state_types[] = {
> +	"not provisioned",
> +	"provisioned",
> +	"provisioning in progress"};
> +
> +
> +int check_spm_is_enabled(void)
> +{
> +	/* do we need to check the admin password is also configured */
> +	return bioscfg_drv.spm_data.is_enabled;
> +}
> +
> +/*
> + * calculate_security_buffer() - determines size of security buffer
> + * for authentication scheme
> + *
> + * @authentication: the authentication content
> + *
> + * Currently only supported type is Admin password
> + */
> +size_t calculate_security_buffer(const char *authentication)
> +{
> +	int size;
> +
> +	if (authentication != NULL && strlen(authentication) > 0) {
> +		size =  (sizeof(u16) + (strlen(authentication) * sizeof(u16)) +
> +			+ (strlen(UTF_PREFIX) * sizeof(u16)));
> +		return size;
> +	}
> +
> +	size  = sizeof(u16) * 2;
> +	return size;
> +}
> +
> +/*
> + * populate_security_buffer() - builds a security buffer for
> + * authentication scheme
> + *
> + * @buffer: the buffer to populate
> + * @authentication: the authentication content
> + *
> + * Currently only supported type is PLAIN TEXT
> + */
> +void populate_security_buffer(u16 *buffer, const char *authentication)
> +{
> +	u16 *auth = buffer;
> +	char *strprefix = NULL;
> +
> +	if (strncmp(authentication, BEAM_PREFIX, strlen(BEAM_PREFIX)) == 0) {
> +		/*
> +		 * BEAM_PREFIX is append to buffer when a signature
> +		 * is provided and Sure Admin is enabled in BIOS
> +		 */
> +		// BEAM_PREFIX found, convert part to unicode
> +		auth = ascii_to_utf16_unicode(auth, authentication);
> +	} else {
> +		/*
> +		 * UTF-16 prefix is append to the * buffer when a BIOS
> +		 * admin password is configured in BIOS
> +		 */
> +
> +		// append UTF_PREFIX to part and then convert it to unicode
> +		strprefix = kasprintf(GFP_KERNEL, "%s%s", UTF_PREFIX, authentication);
> +		if (!strprefix)
> +			goto out_populate_security_buffer;
> +
> +		auth = ascii_to_utf16_unicode(auth, strprefix);
> +	}
> +out_populate_security_buffer:
> +
> +	kfree(strprefix);
> +	strprefix = NULL;
> +}
> +
> +ssize_t update_spm_state(void)
> +{
> +	int ret;
> +	struct secureplatform_provisioning_data *data = NULL;
> +
> +	data = kmalloc(sizeof(struct secureplatform_provisioning_data), GFP_KERNEL);
> +	if (!data) {
> +		ret = -ENOMEM;
> +		goto spm_state_exit;
> +	}
> +
> +	ret = hp_wmi_perform_query(HPWMI_SECUREPLATFORM_GET_STATE,
> +				       HPWMI_SECUREPLATFORM, data, 0,
> +				       sizeof(struct secureplatform_provisioning_data));
> +	if (ret < 0)
> +		goto spm_state_exit;
> +
> +	bioscfg_drv.spm_data.mechanism = data->state;
> +	if (bioscfg_drv.spm_data.mechanism)
> +		bioscfg_drv.spm_data.is_enabled = 1;
> +
> +spm_state_exit:
> +	kfree(data);
> +
> +	return ret;
> +}
> +
> +/*
> + * statusbin - Reports SPM status in binary format
> + *
> + * @kobj:  Pointer to a kernel object of things that show up as
> + *	   directory in the sysfs filesystem.
> + * @attr:  Pointer to list of attributes for the operation
> + * @buf:   Pointer to buffer
> + *
> + * Returns number of bytes read on success.  Otherwise,
> + *         an HP WMI query specific error code (which is positive)
> + *         -ENODEV if the query was not successful at all
> + *
> + */
> +ssize_t statusbin(struct kobject *kobj,
> +		      struct kobj_attribute *attr, char *buf)
> +{
> +	int ret = hp_wmi_perform_query(HPWMI_SECUREPLATFORM_GET_STATE,
> +				       HPWMI_SECUREPLATFORM, buf, 0,
> +				       sizeof(struct secureplatform_provisioning_data));
> +
> +	return ret ? -ENODEV : sizeof(struct secureplatform_provisioning_data);
> +}
> +
> +ssize_t statusbin_show(struct kobject *kobj,
> +			   struct kobj_attribute *attr, char *buf)
> +{
> +	int ret;
> +	struct secureplatform_provisioning_data *data = NULL;
> +
> +	data = kmalloc(sizeof(struct secureplatform_provisioning_data), GFP_KERNEL);
> +	if (!data) {
> +		ret = -ENOMEM;
> +		goto statusbin_show_exit;
> +	}
> +
> +	ret = statusbin(kobj, attr, (char *)data);
> +	if (ret < 0)
> +		goto statusbin_show_exit;
> +
> +	/* copy data to spm local structure */
> +	memcpy(buf, data, sizeof(struct secureplatform_provisioning_data));
> +
> +statusbin_show_exit:
> +	kfree(data);
> +
> +	return ret ? ret : strnlen(buf, PAGE_SIZE);
> +}
> +struct kobj_attribute password_spm_statusbin = __ATTR_RO(statusbin);
> +
> +/*
> + * status_show - Reads SPM status
> + *
> + * @kobj:  Pointer to a kernel object of things that show up as
> + *	   directory in the sysfs filesystem.
> + * @attr:  Pointer to list of attributes for the operation
> + * @buf:   Pointer to buffer
> + *
> + * Returns number of bytes read on success.  Otherwise,
> + *         an HP WMI query specific error code (which is positive)
> + *         -ENODEV if the query was not successful at all
> + *         -ENOMEM if cannot allocate required memory size
> + *
> + */
> +ssize_t status_show(struct kobject *kobj, struct kobj_attribute
> +			*attr, char *buf)
> +{
> +	int ret, i;
> +	struct secureplatform_provisioning_data *data = NULL;
> +
> +	data = kmalloc(sizeof(struct secureplatform_provisioning_data), GFP_KERNEL);
> +	if (!data) {
> +		ret = -ENOMEM;
> +		goto status_show_exit;
> +	}
> +
> +	ret = statusbin(kobj, attr, (char *)data);
> +	if (ret < 0)
> +		goto status_show_exit;
> +
> +	snprintf(buf, PAGE_SIZE, "%sState: %d\n", buf, data->state);
> +	snprintf(buf, PAGE_SIZE, "%sVersion: %d.%d\n", buf, data->version[0],
> +		 data->version[1]);
> +
> +	/* state == 0 means secure platform management feature is not configured in BIOS. */
> +	if (data->state == 0)
> +		goto status_show_exit;
> +
> +	snprintf(buf, PAGE_SIZE, "%sNonce: %d\n", buf, data->nonce);
> +	snprintf(buf, PAGE_SIZE, "%sFeaturesInUse: %d\n", buf, data->features);
> +	snprintf(buf, PAGE_SIZE, "%sEndorsementKeyMod: {", buf);
> +
> +	for (i = 255; i >= 0; i--)
> +		snprintf(buf, PAGE_SIZE, "%s %u", buf, data->kek_mod[i]);
> +
> +	snprintf(buf, PAGE_SIZE, "%s }\n", buf);
> +	snprintf(buf, PAGE_SIZE, "%sSigningKeyMod: {", buf);
> +
> +	for (i = 255; i >= 0; i--)
> +		snprintf(buf, PAGE_SIZE, "%s %u", buf, data->sk_mod[i]);
> +	snprintf(buf, PAGE_SIZE, "%s }\n", buf);
> +
> +status_show_exit:
> +	kfree(data);
> +
> +	return strnlen(buf, PAGE_SIZE);
> +}
> +
> +struct kobj_attribute password_spm_status = __ATTR_RO(status);
> +
> +attribute_spm_n_property_show(is_enabled, spm);
> +static struct kobj_attribute password_spm_is_key_enabled = __ATTR_RO(is_enabled);
> +
> +
> +static ssize_t key_mechanism_show(struct kobject *kobj, struct kobj_attribute *attr,
> +			   char *buf)
> +{
> +	int ret;
> +
> +	ret = snprintf(buf, PAGE_SIZE, "%s\n",
> +		       spm_mechanism_types[bioscfg_drv.spm_data.mechanism]);
> +	return ret;
> +}
> +static struct kobj_attribute password_spm_key_mechanism = __ATTR_RO(key_mechanism);
> +
> +static ssize_t sk_store(struct kobject *kobj,
> +				  struct kobj_attribute *attr,
> +				  const char *buf, size_t count)
> +{
> +	int ret;
> +	int length;
> +
> +	length = count;
> +	if (buf[length-1] == '\n')
> +		length--;
> +
> +	/* allocate space and copy current signing key */
> +	bioscfg_drv.spm_data.signing_key = kmalloc(length, GFP_KERNEL);
> +	if (!bioscfg_drv.spm_data.signing_key) {
> +		ret = -ENOMEM;
> +		goto exit_signing_key;
> +	}
> +
> +	memcpy(bioscfg_drv.spm_data.signing_key, buf, length);
> +	bioscfg_drv.spm_data.signing_key[length] = '\0';
> +
> +	/* submit signing key payload */
> +	ret = hp_wmi_perform_query(HPWMI_SECUREPLATFORM_SET_SK,
> +				   HPWMI_SECUREPLATFORM,
> +				   (void *)bioscfg_drv.spm_data.signing_key,
> +				   length, 0);
> +
> +	if (!ret) {
> +		bioscfg_drv.spm_data.mechanism = SIGNING_KEY;
> +		bioscfg_drv.pending_reboot = TRUE;
> +	}
> +
> +exit_signing_key:
> +	kfree(bioscfg_drv.spm_data.signing_key);
> +	bioscfg_drv.spm_data.signing_key = NULL;
> +
> +	return ret ? ret : count;
> +}
> +
> +static struct kobj_attribute password_spm_signing_key = __ATTR_WO(sk);
> +
> +static ssize_t kek_store(struct kobject *kobj,
> +				  struct kobj_attribute *attr,
> +				  const char *buf, size_t count)
> +{
> +	int ret;
> +	int length;
> +
> +	length = count;
> +	if (buf[length-1] == '\n')
> +		length--;
> +
> +	/* allocate space and copy current signing key */
> +	bioscfg_drv.spm_data.endorsement_key = kmalloc(length, GFP_KERNEL);
> +	if (!bioscfg_drv.spm_data.endorsement_key) {
> +		ret = -ENOMEM;
> +		goto exit_endorsement_key;
> +	}
> +
> +	memcpy(bioscfg_drv.spm_data.endorsement_key, buf, length);
> +	bioscfg_drv.spm_data.endorsement_key[length] = '\0';
> +
> +	ret = hp_wmi_perform_query(HPWMI_SECUREPLATFORM_SET_KEK,
> +				   HPWMI_SECUREPLATFORM,
> +				   (void *)bioscfg_drv.spm_data.endorsement_key,
> +				   count, 0);
> +
> +	if (!ret) {
> +		bioscfg_drv.spm_data.mechanism = ENDORSEMENT_KEY;
> +		bioscfg_drv.pending_reboot = TRUE;
> +	}
> +
> +exit_endorsement_key:
> +	kfree(bioscfg_drv.spm_data.endorsement_key);
> +	bioscfg_drv.spm_data.endorsement_key = NULL;
> +
> +	return ret ? ret : count;
> +}
> +static struct kobj_attribute password_spm_endorsement_key = __ATTR_WO(kek);
> +
> +static ssize_t display_name_language_code_show(struct kobject *kobj,
> +					       struct kobj_attribute *attr,
> +					       char *buf)
> +{
> +	return sprintf(buf, "%s\n", LANG_CODE_STR);
> +}
> +
> +static struct kobj_attribute password_spm_display_langcode =
> +		__ATTR_RO(display_name_language_code);
> +
> +
> +static ssize_t display_name_show(struct kobject *kobj,
> +				 struct kobj_attribute *attr, char *buf)
> +{
> +	return sprintf(buf, "%s\n", SPM_STR_DESC);
> +}
> +static struct kobj_attribute password_spm_display_name = __ATTR_RO(display_name);
> +
> +static ssize_t type_show(struct kobject *kobj, struct kobj_attribute *attr,
> +			 char *buf)
> +{
> +	return sprintf(buf, "secure-platform-management\n");
> +}
> +static struct kobj_attribute password_spm_type = __ATTR_RO(type);
> +
> +static ssize_t role_show(struct kobject *kobj, struct kobj_attribute *attr,
> +			 char *buf)
> +{
> +	return sprintf(buf, "%s\n", role_type[BIOS_SPM]);
> +}
> +static struct kobj_attribute password_spm_role = __ATTR_RO(role);
> +
> +static struct attribute *secure_platform_attrs[] = {
> +	&password_spm_display_name.attr,
> +	&password_spm_display_langcode.attr,
> +	&password_spm_is_key_enabled.attr,
> +	&password_spm_signing_key.attr,
> +	&password_spm_endorsement_key.attr,
> +	&password_spm_key_mechanism.attr,
> +	&password_spm_status.attr,
> +	&password_spm_statusbin.attr,
> +	&password_spm_type.attr,
> +	&password_spm_role.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group secure_platform_attr_group = {
> +	.attrs = secure_platform_attrs,
> +};
> +
> +void exit_secure_platform_attributes(void)
> +{
> +	/* remove secure platform sysfs entry and free key data*/
> +
> +	kfree(bioscfg_drv.spm_data.endorsement_key);
> +	bioscfg_drv.spm_data.endorsement_key = NULL;
> +
> +	kfree(bioscfg_drv.spm_data.signing_key);
> +	bioscfg_drv.spm_data.signing_key = NULL;
> +
> +	sysfs_remove_group(bioscfg_drv.spm_data.attr_name_kobj, &secure_platform_attr_group);
> +}
> +
> +int populate_secure_platform_data(struct kobject *attr_name_kobj)
> +{
> +	/* Populate data for Secure Platform Management */
> +	bioscfg_drv.spm_data.type = HPWMI_SECURE_PLATFORM_TYPE;
> +	bioscfg_drv.spm_data.attr_name_kobj = attr_name_kobj;
> +
> +	strscpy(bioscfg_drv.spm_data.attribute_name, SPM_STR,
> +		sizeof(bioscfg_drv.spm_data.attribute_name));
> +	strscpy(bioscfg_drv.spm_data.display_name, SPM_STR_DESC,
> +		sizeof(bioscfg_drv.spm_data.display_name));
> +
> +	bioscfg_drv.spm_data.is_enabled = 0;
> +	bioscfg_drv.spm_data.mechanism = 0;
> +	bioscfg_drv.pending_reboot = FALSE;
> +	update_spm_state();
> +
> +	bioscfg_drv.spm_data.endorsement_key = NULL;
> +	bioscfg_drv.spm_data.signing_key = NULL;
> +
> +	return sysfs_create_group(attr_name_kobj, &secure_platform_attr_group);
> +}
> diff --git a/drivers/platform/x86/hp/string-attributes.c b/drivers/platform/x86/hp/string-attributes.c
> new file mode 100644
> index 000000000000..c85688cfbccc
> --- /dev/null
> +++ b/drivers/platform/x86/hp/string-attributes.c
> @@ -0,0 +1,447 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Functions corresponding to string type attributes under
> + * HP_WMI_BIOS_STRING_GUID for use with hp-bioscfg driver.
> + *
> + * Copyright (c) 2022 HP Development Company, L.P.
> + */
> +
> +#include "bioscfg.h"
> +
> +#define WMI_STRING_TYPE "HPBIOS_BIOSString"
> +
> +get_instance_id(string);
> +
> +static ssize_t current_value_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
> +{
> +	int instance_id = get_string_instance_id(kobj);
> +	union acpi_object *obj = NULL;
> +	ssize_t ret;
> +
> +	if (instance_id < 0)
> +		return -EIO;
> +
> +	/* need to use specific instance_id and guid combination to get right data */
> +	obj = get_wmiobj_pointer(instance_id, HP_WMI_BIOS_STRING_GUID);
> +	if (!obj)
> +		return -EIO;
> +
> +	ret = snprintf(buf, PAGE_SIZE, "%s\n",
> +		       bioscfg_drv.string_data[instance_id].current_value);
> +
> +	kfree(obj);
> +	return ret;
> +}
> +
> +/*
> + * validate_string_input() -
> + * Validate input of current_value against min and max lengths
> + *
> + * @instance_id: The instance on which input is validated
> + * @buf: Input value
> + */
> +static int validate_string_input(int instance_id, const char *buf)
> +{
> +	int in_len = strlen(buf);
> +
> +	/* BIOS treats it as a read only attribute */
> +	if (bioscfg_drv.string_data[instance_id].is_readonly)
> +		return -EIO;
> +
> +	if ((in_len < bioscfg_drv.string_data[instance_id].min_length) ||
> +	    (in_len > bioscfg_drv.string_data[instance_id].max_length))
> +		return -EINVAL;
> +
> +	strscpy(bioscfg_drv.string_data[instance_id].new_value,
> +		buf,
> +		sizeof(bioscfg_drv.string_data[instance_id].new_value));
> +
> +	return 0;
> +}
> +
> +static void update_string_value(int instance_id)
> +{
> +	/* Write settings to BIOS */
> +	strscpy(bioscfg_drv.string_data[instance_id].current_value,
> +		bioscfg_drv.string_data[instance_id].new_value,
> +		sizeof(bioscfg_drv.string_data[instance_id].current_value));
> +}
> +
> +attribute_s_property_show(display_name_language_code, string);
> +static struct kobj_attribute string_display_langcode =
> +		__ATTR_RO(display_name_language_code);
> +
> +attribute_s_property_show(display_name, string);
> +static struct kobj_attribute string_display_name =
> +		__ATTR_RO(display_name);
> +
> +attribute_property_store(current_value, string);
> +static struct kobj_attribute string_current_val =
> +		__ATTR_RW_MODE(current_value, 0600);
> +
> +attribute_n_property_show(min_length, string);
> +static struct kobj_attribute string_min_length =
> +		__ATTR_RO(min_length);
> +
> +attribute_n_property_show(max_length, string);
> +static struct kobj_attribute string_max_length =
> +		__ATTR_RO(max_length);
> +
> +static ssize_t type_show(struct kobject *kobj, struct kobj_attribute *attr,
> +			 char *buf)
> +{
> +	return sprintf(buf, "string\n");
> +}
> +
> +static struct kobj_attribute string_type =
> +	__ATTR_RO(type);
> +
> +static struct attribute *string_attrs[] = {
> +	&string_display_langcode.attr,
> +	&string_display_name.attr,
> +	&string_current_val.attr,
> +	&string_min_length.attr,
> +	&string_max_length.attr,
> +	&string_type.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group string_attr_group = {
> +	.attrs = string_attrs,
> +};
> +
> +int alloc_string_data(void)
> +{
> +	int ret = 0;
> +
> +	bioscfg_drv.string_instances_count = get_instance_count(HP_WMI_BIOS_STRING_GUID);
> +	bioscfg_drv.string_data = kcalloc(bioscfg_drv.string_instances_count,
> +					sizeof(struct string_data), GFP_KERNEL);
> +	if (!bioscfg_drv.string_data) {
> +		bioscfg_drv.string_instances_count = 0;
> +		ret = -ENOMEM;
> +	}
> +	return ret;
> +}
> +
> +/*
> + * populate_string_package_data() -
> + * Populate all properties of an instance under string attribute
> + *
> + * @elements: ACPI object with string data
> + * @instance_id: The instance to enumerate
> + * @attr_name_kobj: The parent kernel object
> + */
> +int populate_string_package_data(union acpi_object *elements, int instance_id,
> +			struct kobject *attr_name_kobj)
> +{
> +	char *str_value = NULL;
> +	int str_len;
> +	int ret = 0;
> +
> +	bioscfg_drv.string_data[instance_id].type = HPWMI_STRING_TYPE;
> +	bioscfg_drv.string_data[instance_id].attr_name_kobj = attr_name_kobj;
> +
> +	ret = convert_hexstr_to_str(&(elements[NAME].string.pointer),
> +				       elements[NAME].string.length,
> +				       &str_value, &str_len);
> +
> +	if (ACPI_FAILURE(ret)) {
> +		pr_warn("Failed to populate string package data. Error [0%0x]\n", ret);
> +		kfree(str_value);
> +		return ret;
> +	}
> +
> +	strscpy(bioscfg_drv.string_data[instance_id].attribute_name,
> +		str_value,
> +		sizeof(bioscfg_drv.string_data[instance_id].attribute_name));
> +
> +	strscpy(bioscfg_drv.string_data[instance_id].display_name,
> +		str_value,
> +		sizeof(bioscfg_drv.string_data[instance_id].display_name));
> +
> +	kfree(str_value);
> +	str_value = NULL;
> +
> +	populate_string_elements_from_package(elements, instance_id, HPWMI_STRING_TYPE);
> +
> +	return sysfs_create_group(attr_name_kobj, &string_attr_group);
> +}
> +
> +int populate_string_elements_from_package(union acpi_object *elements,
> +					   int instance_id,
> +					   enum hp_wmi_data_type type)
> +{
> +	char *str_value = NULL;
> +	int value_len;
> +	int status = 0;
> +	u32 size = 0;
> +	u32 int_value;
> +	int elem = 0;
> +	int reqs;
> +	int eloc;
> +
> +	if (!elements)
> +		return -EINVAL;
> +
> +	strscpy(bioscfg_drv.string_data[instance_id].display_name_language_code,
> +		LANG_CODE_STR,
> +		sizeof(bioscfg_drv.string_data[instance_id].display_name_language_code));
> +
> +	for (elem = 1, eloc = 1; elem < hp_wmi_elements_count[type]; elem++, eloc++) {
> +
> +		switch (elements[elem].type) {
> +		case ACPI_TYPE_STRING:
> +
> +			if (elem != PREREQUISITES) {
> +				status = convert_hexstr_to_str(&elements[elem].string.pointer,
> +							       elements[elem].string.length,
> +							       &str_value, &value_len);
> +
> +				if (ACPI_FAILURE(status))
> +					continue;
> +			}
> +			break;
> +		case ACPI_TYPE_INTEGER:
> +			int_value = (u32)elements[elem].integer.value;
> +			break;
> +		default:
> +			pr_warn("Unsupported object type [%d]\n", elements[elem].type);
> +			continue;
> +		}
> +
> +		/*
> +		 * Stop if extra counter is greater than total number
> +		 * of elements for string type
> +		 */
> +		if (eloc == hp_wmi_elements_count[type])
> +			goto exit_string_package;
> +
> +		/* Assign appropriate element value to corresponding field*/
> +		switch (eloc) {
> +		case VALUE:
> +			strscpy(bioscfg_drv.string_data[instance_id].current_value,
> +				str_value, sizeof(bioscfg_drv.string_data[instance_id].current_value));
> +			break;
> +		case PATH:
> +			strscpy(bioscfg_drv.string_data[instance_id].path, str_value,
> +				sizeof(bioscfg_drv.string_data[instance_id].path));
> +			break;
> +		case IS_READONLY:
> +			bioscfg_drv.string_data[instance_id].is_readonly = int_value;
> +			break;
> +		case DISPLAY_IN_UI:
> +			bioscfg_drv.string_data[instance_id].display_in_ui = int_value;
> +			break;
> +		case REQUIRES_PHYSICAL_PRESENCE:
> +			bioscfg_drv.string_data[instance_id].requires_physical_presence = int_value;
> +			break;
> +		case SEQUENCE:
> +			bioscfg_drv.string_data[instance_id].sequence = int_value;
> +			break;
> +		case PREREQUISITE_SIZE:
> +			bioscfg_drv.string_data[instance_id].prerequisitesize = int_value;
> +			if (size > 20)
> +				pr_warn("Prerequisites size value exceeded the maximum number of elements supported or data may be malformed\n");
> +
> +			/*
> +			 * prerequisites element is omitted when
> +			 * prerequisitesSize value is zero.
> +			 */
> +			if (int_value == 0)
> +				eloc++;
> +			break;
> +		case PREREQUISITES:
> +			size = bioscfg_drv.string_data[instance_id].prerequisitesize;
> +
> +			for (reqs = 0; reqs < size; reqs++) {
> +				status = convert_hexstr_to_str(&elements[elem].string.pointer,
> +							       elements[elem].string.length,
> +							       &str_value, &value_len);
> +
> +				if (ACPI_FAILURE(status))
> +					continue;
> +				pr_warn("Prerequisite String  value [%s]\n", str_value);
> +
> +				strlcat(bioscfg_drv.string_data[instance_id].prerequisites,
> +					str_value,
> +					sizeof(bioscfg_drv.string_data[instance_id].prerequisites));
> +
> +				if (reqs != (size - 1))
> +					strlcat(bioscfg_drv.string_data[instance_id].prerequisites, ";",
> +						sizeof(bioscfg_drv.string_data[instance_id].prerequisites));
> +
> +				kfree(str_value);
> +				str_value = NULL;
> +			}
> +			break;
> +
> +		case SECURITY_LEVEL:
> +			bioscfg_drv.string_data[instance_id].security_level = int_value;
> +			break;
> +		case STR_MIN_LENGTH:
> +			bioscfg_drv.string_data[instance_id].min_length = int_value;
> +			break;
> +		case STR_MAX_LENGTH:
> +			bioscfg_drv.string_data[instance_id].max_length = int_value;
> +			break;
> +		default:
> +			pr_warn("Invalid element: %d found in String attribute or data may be malformed\n", elem);
> +			break;
> +		}
> +		kfree(str_value);
> +		str_value = NULL;
> +	}
> +exit_string_package:
> +	kfree(str_value);
> +	str_value = NULL;
> +
> +	return 0;
> +}
> +
> +/*
> + * populate_string_data() -
> + * Populate all properties of an instance under string attribute
> + *
> + * @string_obj: ACPI object with string data
> + * @instance_id: The instance to enumerate
> + * @attr_name_kobj: The parent kernel object
> + */
> +int populate_string_buffer_data(union acpi_object *string_obj, int instance_id, struct kobject *attr_name_kobj)
> +{
> +	bioscfg_drv.string_data[instance_id].type = HPWMI_STRING_TYPE;
> +	bioscfg_drv.string_data[instance_id].attr_name_kobj = attr_name_kobj;
> +	strscpy(bioscfg_drv.string_data[instance_id].attribute_name,
> +		attr_name_kobj->name,
> +		sizeof(bioscfg_drv.string_data[instance_id].attribute_name));
> +
> +	strscpy(bioscfg_drv.string_data[instance_id].display_name,
> +		attr_name_kobj->name,
> +		sizeof(bioscfg_drv.string_data[instance_id].display_name));
> +	/* Populate string elements */
> +
> +	populate_string_elements_from_buffer(string_obj, instance_id, HPWMI_STRING_TYPE);
> +
> +	return sysfs_create_group(attr_name_kobj, &string_attr_group);
> +}
> +
> +int populate_string_elements_from_buffer(union acpi_object *string_obj, int instance_id, enum hp_wmi_data_type type)
> +{
> +	int status;
> +	char *str = NULL;
> +	int elem;
> +	int reqs;
> +	int int_value;
> +	int size = 0;
> +
> +	strscpy(bioscfg_drv.string_data[instance_id].display_name_language_code,
> +		LANG_CODE_STR,
> +		sizeof(bioscfg_drv.string_data[instance_id].display_name_language_code));
> +
> +	for (elem = 1; elem < 3; elem++) {
> +		status = get_string_from_buffer((u16 **)&string_obj->buffer.pointer, &str);
> +		if (ACPI_FAILURE(status))
> +			continue;
> +
> +		switch (elem) {
> +		case VALUE:
> +			strscpy(bioscfg_drv.string_data[instance_id].current_value,
> +				str, sizeof(bioscfg_drv.string_data[instance_id].current_value));
> +			break;
> +		case PATH:
> +			strscpy(bioscfg_drv.string_data[instance_id].path, str, sizeof(bioscfg_drv.string_data[instance_id].path));
> +			break;
> +		default:
> +			pr_warn("Invalid element: %d found in String attribute or data may be malformed\n", elem);
> +			break;
> +		}
> +		kfree(str);
> +		str = NULL;
> +	}
> +
> +	for (elem = 3; elem < hp_wmi_elements_count[type]; elem++) {
> +
> +		if (elem != PREREQUISITES)
> +			status = get_integer_from_buffer((int **)&string_obj->buffer.pointer, (int *)&int_value);
> +
> +		if (ACPI_FAILURE(status))
> +			continue;
> +
> +		switch (elem) {
> +		case IS_READONLY:
> +			bioscfg_drv.string_data[instance_id].is_readonly = int_value;
> +			break;
> +		case DISPLAY_IN_UI:
> +			bioscfg_drv.string_data[instance_id].display_in_ui = int_value;
> +			break;
> +		case REQUIRES_PHYSICAL_PRESENCE:
> +			bioscfg_drv.string_data[instance_id].requires_physical_presence = int_value;
> +			break;
> +		case SEQUENCE:
> +			bioscfg_drv.string_data[instance_id].sequence = int_value;
> +			break;
> +		case PREREQUISITE_SIZE:
> +			bioscfg_drv.string_data[instance_id].prerequisitesize = int_value;
> +			if (int_value > 20)
> +				pr_warn("Prerequisites size value exceeded the maximum number of elements supported or data may be malformed\n");
> +			break;
> +		case PREREQUISITES:
> +			size = bioscfg_drv.string_data[instance_id].prerequisitesize;
> +			for (reqs = 0; reqs < size; reqs++) {
> +				status = get_string_from_buffer((u16 **)&string_obj->buffer.pointer, &str);
> +				if (ACPI_FAILURE(status))
> +					continue;
> +
> +				strlcat(bioscfg_drv.string_data[instance_id].prerequisites,
> +					str,
> +					sizeof(bioscfg_drv.string_data[instance_id].prerequisites));
> +
> +				if (reqs != (size - 1))
> +					strlcat(bioscfg_drv.string_data[instance_id].prerequisites, ";",
> +						sizeof(bioscfg_drv.string_data[instance_id].prerequisites));
> +
> +				kfree(str);
> +				str = NULL;
> +			}
> +			break;
> +		case SECURITY_LEVEL:
> +			bioscfg_drv.string_data[instance_id].security_level = int_value;
> +			break;
> +		case STR_MIN_LENGTH:
> +			bioscfg_drv.string_data[instance_id].min_length = int_value;
> +			break;
> +		case STR_MAX_LENGTH:
> +			bioscfg_drv.string_data[instance_id].max_length = int_value;
> +			break;
> +		default:
> +			pr_warn("Invalid element: %d found in String attribute or data may be malformed\n", elem);
> +			break;
> +		}
> +		kfree(str);
> +		str = NULL;
> +	}
> +	kfree(str);
> +	str = NULL;
> +
> +	return 0;
> +}
> +
> +/*
> + * exit_string_attributes() - Clear all attribute data
> + *
> + * Clears all data allocated for this group of attributes
> + */
> +void exit_string_attributes(void)
> +{
> +	int instance_id;
> +
> +	for (instance_id = 0; instance_id < bioscfg_drv.string_instances_count; instance_id++) {
> +		if (bioscfg_drv.string_data[instance_id].attr_name_kobj)
> +			sysfs_remove_group(bioscfg_drv.string_data[instance_id].attr_name_kobj,
> +								&string_attr_group);
> +	}
> +	bioscfg_drv.string_instances_count = 0;
> +
> +	kfree(bioscfg_drv.string_data);
> +	bioscfg_drv.string_data = NULL;
> +}
> diff --git a/drivers/platform/x86/hp/sureadmin-attributes.c b/drivers/platform/x86/hp/sureadmin-attributes.c
> new file mode 100644
> index 000000000000..dba5f94e8c9a
> --- /dev/null
> +++ b/drivers/platform/x86/hp/sureadmin-attributes.c
> @@ -0,0 +1,984 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Functions corresponding to sure admin object type attributes under
> + * BIOS for use with hp-bioscfg driver
> + *
> + *  Copyright (c) 2022 HP Development Company, L.P.
> + */
> +
> +#include "bioscfg.h"
> +
> +static int bios_settings_size;
> +static int buf_alloc_size;
> +static char *bios_settings_buffer;
> +
> +const char *hp_wmi_classes[] = {
> +	"HPBIOS_BIOSString",
> +	"HPBIOS_BIOSInteger",
> +	"HPBIOS_BIOSEnumeration",
> +	"HPBIOS_BIOSOrderedList",
> +	"HPBIOS_BIOSPassword"
> +};
> +
> +get_instance_id_for_attribute(string);
> +get_instance_id_for_attribute(integer);
> +get_instance_id_for_attribute(enumeration);
> +get_instance_id_for_attribute(ordered_list);
> +
> +static ssize_t sure_admin_settings_write(struct file *filp, struct kobject *kobj,
> +					 struct bin_attribute *attr,
> +					 char *buf, loff_t off, size_t count)
> +{
> +	int status = 0;
> +	char *part = NULL;
> +	char *attr_name = NULL;
> +	char *attr_value = NULL;
> +	int part_len = 0;
> +	unsigned short *buffer = NULL;
> +	unsigned short *tmpstr = NULL;
> +	int buffer_size = (count + strlen(UTF_PREFIX)) * sizeof(unsigned short);
> +
> +	buffer = kmalloc(buffer_size, GFP_KERNEL);
> +	if (!buffer)
> +		return -ENOMEM;
> +
> +	tmpstr = buffer;
> +	part = strsep(&buf, ",");
> +	if (!part) {
> +		status = -EINVAL;
> +		goto exit_settings;
> +	}
> +	// Save attr_name
> +	attr_name = kmalloc(strlen(part) + 1, GFP_KERNEL);
> +	if (!attr_name) {
> +		status = -EINVAL;
> +		goto exit_settings;
> +	}
> +	strncpy(attr_name, part, strlen(part));
> +
> +	tmpstr = ascii_to_utf16_unicode(tmpstr, part);
> +	part = strsep(&buf, ",");
> +	if (!part) {
> +		status = -EINVAL;
> +		goto exit_settings;
> +	}
> +
> +	part_len = strlen(part);
> +
> +	/* Add extra buffer space when encountering an empty string */
> +	if (!part_len) {
> +		buffer_size += sizeof(unsigned short);
> +		part_len += sizeof(unsigned short);
> +	}
> +
> +	// Save attr_value
> +	attr_value = kmalloc(part_len + 1, GFP_KERNEL);
> +	if (!attr_value) {
> +		status = -EINVAL;
> +		goto exit_settings;
> +	}
> +	strncpy(attr_value, part, part_len);
> +
> +	tmpstr = ascii_to_utf16_unicode(tmpstr, part);
> +	part = strsep(&buf, ",");
> +	if (!part) {
> +		status = -EINVAL;
> +		goto exit_settings;
> +	}
> +	part_len = strlen(part) - 1;
> +	part[part_len] = '\0';
> +
> +	if (strncmp(part, BEAM_PREFIX, strlen(BEAM_PREFIX)) == 0) {
> +	       /*
> +		* BEAM_PREFIX is append to buffer when a signature
> +		* is provided and Sure Admin is enabled in BIOS
> +		*/
> +		// BEAM_PREFIX found, convert part to unicode
> +		tmpstr = ascii_to_utf16_unicode(tmpstr, part);
> +		// decrease buffer size allocated initially for UTF_PREFIX
> +		buffer_size -= strlen(UTF_PREFIX) * sizeof(unsigned short);
> +	} else {
> +		/*
> +		 * UTF-16 prefix is append to the * buffer when a BIOS
> +		 * admin password is configured in BIOS
> +		 */
> +
> +		// append UTF_PREFIX to part and then convert it to unicode
> +		part = kasprintf(GFP_KERNEL, "%s%s", UTF_PREFIX, part);
> +		if (!part)
> +			goto exit_settings;
> +
> +		tmpstr = ascii_to_utf16_unicode(tmpstr, part);
> +		kfree(part);
> +	}
> +
> +	part = strsep(&buf, ",");
> +	if (part) {
> +		status = -EINVAL;
> +		goto exit_settings;
> +	}
> +
> +	status = hp_wmi_set_bios_setting(buffer, buffer_size);
> +	if (ACPI_FAILURE(status)) {
> +		status = -EINVAL;
> +		goto exit_settings;
> +	}
> +
> +	if (attr_name == NULL)
> +		pr_warn("Name is null\n");
> +	if (attr_value == NULL)
> +		pr_warn("Value is null\n");
> +
> +	update_attribute_value(attr_name, attr_value);
> +
> +
> +exit_settings:
> +	kfree(buffer);
> +	kfree(attr_name);
> +	kfree(attr_value);
> +
> +	if (ACPI_SUCCESS(status))
> +		return count;
> +
> +	return status;
> +}
> +
> +int update_attribute_value(char *attr_name, char *attr_value)
> +{
> +	int instance = -EIO;
> +	int int_val;
> +	int ret;
> +
> +	if (!attr_name || !attr_value)
> +		return -EIO;
> +
> +	/* update value for the attribute */
> +	instance = get_instance_id_for_string(attr_name);
> +	if (instance >= 0) {
> +		strscpy(bioscfg_drv.string_data[instance].current_value,
> +			attr_value,
> +			sizeof(bioscfg_drv.string_data[instance].current_value));
> +		goto exit_update_attribute;
> +	}
> +
> +	instance = get_instance_id_for_integer(attr_name);
> +	if (instance >= 0) {
> +		ret = kstrtoint(attr_value, 10, &int_val);
> +		if (!ret)
> +			bioscfg_drv.integer_data[instance].current_value = int_val;
> +		goto exit_update_attribute;
> +	}
> +
> +	instance = get_instance_id_for_enumeration(attr_name);
> +	if (instance >= 0) {
> +		strscpy(bioscfg_drv.enumeration_data[instance].current_value,
> +			attr_value,
> +			sizeof(bioscfg_drv.enumeration_data[instance].current_value));
> +		goto exit_update_attribute;
> +	}
> +	instance = get_instance_id_for_ordered_list(attr_name);
> +	if (instance >= 0)
> +		strscpy(bioscfg_drv.ordered_list_data[instance].current_value,
> +			attr_value,
> +			sizeof(bioscfg_drv.ordered_list_data[instance].current_value));
> +
> +exit_update_attribute:
> +	return instance;
> +}
> +
> +static ssize_t sure_admin_settings_read(struct file *filp, struct kobject *kobj,
> +					struct bin_attribute *attr, char *buf,
> +					loff_t off, size_t count)
> +{
> +	ssize_t ret;
> +
> +	/* clear the buffer when offset is pointing to the last position */
> +	if (off >= bios_settings_size && bios_settings_size > 0) {
> +		hp_bios_settings_free_buffer();
> +		return 0;
> +	}
> +
> +	/* clear the buffer whenever the read starts from the first position */
> +	if (off == 0 && bios_settings_size > 0)
> +		hp_bios_settings_free_buffer();
> +
> +	if (bios_settings_size == 0)
> +		hp_bios_settings_fill_buffer();
> +
> +	mutex_lock(&bioscfg_drv.mutex);
> +	ret = memory_read_from_buffer(buf, count, &off, bios_settings_buffer,
> +				      bios_settings_size);
> +	mutex_unlock(&bioscfg_drv.mutex);
> +
> +	return ret;
> +}
> +
> +HPWMI_BINATTR_RW(sure_admin, settings, 0);
> +
> +static struct bin_attribute *sure_admin_binattrs[] = {
> +	&sure_admin_settings,
> +	NULL,
> +};
> +
> +static ssize_t type_show(struct kobject *kobj, struct kobj_attribute *attr,
> +			 char *buf)
> +{
> +	return sprintf(buf, "sure-admin\n");
> +}
> +static struct kobj_attribute sure_admin_type = __ATTR_RO(type);
> +
> +static ssize_t display_name_language_code_show(struct kobject *kobj,
> +					       struct kobj_attribute *attr,
> +					       char *buf)
> +{
> +	return sprintf(buf, "%s\n", LANG_CODE_STR);
> +}
> +
> +static struct kobj_attribute sure_admin_display_langcode =
> +		__ATTR_RO(display_name_language_code);
> +
> +
> +static ssize_t display_name_show(struct kobject *kobj,
> +				 struct kobj_attribute *attr, char *buf)
> +{
> +	return sprintf(buf, "%s\n", SURE_ADMIN_DESC);
> +}
> +static struct kobj_attribute sure_admin_display_name = __ATTR_RO(display_name);
> +
> +static struct attribute *sure_admin_attrs[] = {
> +	&sure_admin_display_name.attr,
> +	&sure_admin_display_langcode.attr,
> +	&sure_admin_type.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group sure_admin_attr_group = {
> +	.attrs = sure_admin_attrs,
> +	.bin_attrs = sure_admin_binattrs,
> +};
> +
> +void exit_sure_admin_attributes(void)
> +{
> +	sysfs_remove_group(bioscfg_drv.sure_admin_attr_kobj, &sure_admin_attr_group);
> +}
> +
> +int populate_sure_admin_data(struct kobject *attr_name_kobj)
> +{
> +	bioscfg_drv.sure_admin_attr_kobj = attr_name_kobj;
> +	return sysfs_create_group(attr_name_kobj, &sure_admin_attr_group);
> +}
> +
> +int hp_bios_settings_fill_buffer(void)
> +{
> +	int status = 0;
> +	int initial_buffer_size = 20 * PAGE_SIZE;
> +
> +	mutex_lock(&bioscfg_drv.mutex);
> +	bios_settings_buffer = kmalloc(initial_buffer_size, GFP_KERNEL);
> +	mutex_unlock(&bioscfg_drv.mutex);
> +	if (!bios_settings_buffer)
> +		return -ENOMEM;
> +
> +	mutex_lock(&bioscfg_drv.mutex);
> +	buf_alloc_size = ksize(bios_settings_buffer);
> +	memset(bios_settings_buffer, 0x00, buf_alloc_size);
> +	bios_settings_size = snprintf(bios_settings_buffer,
> +					buf_alloc_size, "[\n");
> +	mutex_unlock(&bioscfg_drv.mutex);
> +
> +	status = append_read_settings(HPWMI_STRING_TYPE,
> +					   &bios_settings_buffer,
> +					   &bios_settings_size,
> +					   &buf_alloc_size);
> +	if (ACPI_FAILURE(status))
> +		pr_err("error 0x%x occurred retrieving string instances\n", status);
> +
> +	status = append_read_settings(HPWMI_INTEGER_TYPE,
> +					   &bios_settings_buffer,
> +					   &bios_settings_size,
> +					   &buf_alloc_size);
> +	if (ACPI_FAILURE(status))
> +		pr_err("error 0x%x occurred retrieving integer instances\n", status);
> +
> +	status = append_read_settings(HPWMI_ENUMERATION_TYPE,
> +					   &bios_settings_buffer,
> +					   &bios_settings_size,
> +					   &buf_alloc_size);
> +	if (ACPI_FAILURE(status))
> +		pr_err("error 0x%x occurred retrieving enumeration instances\n", status);
> +
> +	status = append_read_settings(HPWMI_ORDERED_LIST_TYPE,
> +					   &bios_settings_buffer,
> +					   &bios_settings_size,
> +					   &buf_alloc_size);
> +	if (ACPI_FAILURE(status))
> +		pr_err("error 0x%x occurred retrieving ordered list instances\n", status);
> +
> +	status = append_read_settings(HPWMI_PASSWORD_TYPE,
> +					   &bios_settings_buffer,
> +					   &bios_settings_size,
> +					   &buf_alloc_size);
> +	if (ACPI_FAILURE(status))
> +		pr_err("error 0x%x occurred retrieving password list instances\n", status);
> +
> +	mutex_lock(&bioscfg_drv.mutex);
> +	/*
> +	 * remove trailing comma
> +	 */
> +	if (bios_settings_size >= 3) {
> +		if (bios_settings_buffer[bios_settings_size - 2] == ',')
> +			bios_settings_buffer[bios_settings_size - 2] = ' ';
> +	}
> +	bios_settings_size = snprintf(bios_settings_buffer,
> +					buf_alloc_size, "%s]\n",
> +					bios_settings_buffer);
> +	mutex_unlock(&bioscfg_drv.mutex);
> +
> +	return bios_settings_size;
> +}
> +
> +int hp_bios_settings_free_buffer(void)
> +{
> +	mutex_lock(&bioscfg_drv.mutex);
> +	kfree(bios_settings_buffer);
> +	bios_settings_size = 0;
> +	buf_alloc_size = 0;
> +	mutex_unlock(&bioscfg_drv.mutex);
> +
> +	return 0;
> +}
> +int hp_bios_settings_realloc_buffer(char **buf, int *buf_size, int *alloc_size)
> +{
> +	int new_buffer_size;
> +	char *new_buf = NULL;
> +	int ret = 0;
> +
> +	if (*buf_size + PAGE_SIZE >= *alloc_size) {
> +		new_buffer_size = buf_alloc_size + 2 * PAGE_SIZE;
> +
> +		mutex_lock(&bioscfg_drv.mutex);
> +		new_buf = krealloc(*buf, new_buffer_size, GFP_KERNEL);
> +		mutex_unlock(&bioscfg_drv.mutex);
> +		if (new_buf) {
> +			mutex_lock(&bioscfg_drv.mutex);
> +			*buf = new_buf;
> +			*alloc_size = ksize(new_buf);
> +			mutex_unlock(&bioscfg_drv.mutex);
> +		} else {
> +			hp_bios_settings_free_buffer();
> +			ret = -ENOMEM;
> +		}
> +	}
> +
> +	return ret;
> +}
> +
> +int append_read_settings(enum hp_wmi_data_type type, char **buf,
> +			 int *buf_size, int *alloc_size)
> +{
> +	int ret = 0;
> +	int status = 0;
> +	int instance = 0;
> +	int instance_count = 0;
> +
> +	switch (type) {
> +	case HPWMI_STRING_TYPE:
> +		instance_count = bioscfg_drv.string_instances_count;
> +		break;
> +	case HPWMI_INTEGER_TYPE:
> +		instance_count = bioscfg_drv.integer_instances_count;
> +		break;
> +	case HPWMI_ENUMERATION_TYPE:
> +		instance_count = bioscfg_drv.enumeration_instances_count;
> +		break;
> +	case HPWMI_ORDERED_LIST_TYPE:
> +		instance_count = bioscfg_drv.ordered_list_instances_count;
> +		break;
> +	case HPWMI_PASSWORD_TYPE:
> +		instance_count = bioscfg_drv.password_instances_count;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * Query all the instances
> +	 */
> +	for (instance = 0; instance < instance_count; instance++) {
> +		mutex_lock(&bioscfg_drv.mutex);
> +		status = append_read_attributes(buf, *alloc_size,
> +						     instance, type);
> +		if (status > 0)
> +			*buf_size = status;
> +
> +		mutex_unlock(&bioscfg_drv.mutex);
> +
> +		ret = hp_bios_settings_realloc_buffer(buf, buf_size,
> +						      alloc_size);
> +	}
> +	return ret;
> +}
> +
> +int append_read_attributes(char **buf, int alloc_size,
> +			   int instance, enum hp_wmi_data_type type)
> +{
> +	int status = 0;
> +
> +	switch (type) {
> +	case HPWMI_STRING_TYPE:
> +		status = append_read_string_attributes(*buf, alloc_size,
> +						       instance, type);
> +		break;
> +	case HPWMI_INTEGER_TYPE:
> +		status = append_read_integer_attributes(*buf, alloc_size,
> +							instance, type);
> +		break;
> +	case HPWMI_ENUMERATION_TYPE:
> +		status = append_read_enumeration_attributes(*buf,
> +							    alloc_size,
> +							    instance, type);
> +		break;
> +	case HPWMI_ORDERED_LIST_TYPE:
> +		status = append_read_ordered_list_attributes(*buf,
> +							     alloc_size,
> +							     instance, type);
> +		break;
> +	case HPWMI_PASSWORD_TYPE:
> +		status = append_read_password_attributes(*buf,
> +							 alloc_size,
> +							 instance, type);
> +		break;
> +	default:
> +		status = -EINVAL;
> +		break;
> +	}
> +	return status;
> +}
> +
> +
> +int append_read_string_attributes(char *buf, int alloc_size,
> +				  int instance,
> +				  enum hp_wmi_data_type type)
> +{
> +	int buf_size;
> +	char *part_tmp = NULL;
> +	char *part = NULL;
> +
> +	if (type >= ARRAY_SIZE(hp_wmi_classes) || !buf)
> +		return -EINVAL;
> +
> +	buf_size = snprintf(buf, alloc_size, "%s{\n", buf);
> +	buf_size = snprintf(buf, alloc_size, "%s\t\"Class\": \"%s\",\n",
> +			    buf, hp_wmi_classes[type]);
> +
> +	buf_size = snprintf(buf, alloc_size,
> +			    "%s\t\"Name\": \"%s\",\n",
> +			    buf,
> +			    bioscfg_drv.string_data[instance].display_name);
> +
> +	buf_size = snprintf(buf, alloc_size,
> +			    "%s\t\"Value\": \"%s\",\n",
> +			    buf,
> +			    bioscfg_drv.string_data[instance].current_value);
> +
> +	buf_size = snprintf(buf, alloc_size,
> +			    "%s\t\"Path\": \"%s\",\n",
> +			    buf,
> +			    bioscfg_drv.string_data[instance].path);
> +
> +	buf_size = snprintf(buf, alloc_size,
> +			    "%s\t\"IsReadOnly\": %d,\n",
> +			    buf,
> +			    bioscfg_drv.string_data[instance].is_readonly);
> +
> +	buf_size = snprintf(buf, alloc_size,
> +			    "%s\t\"DisplayInUI\": %d,\n",
> +			    buf,
> +			    bioscfg_drv.string_data[instance].display_in_ui);
> +
> +	buf_size = snprintf(buf, alloc_size,
> +			    "%s\t\"RequiresPhysicalPresence\": %d,\n",
> +			    buf,
> +			    bioscfg_drv.string_data[instance].requires_physical_presence);
> +
> +	buf_size = snprintf(buf, alloc_size,
> +			    "%s\t\"Sequence\": %d,\n",
> +			    buf,
> +			    bioscfg_drv.string_data[instance].sequence);
> +
> +	buf_size = snprintf(buf, alloc_size,
> +			    "%s\t\"PrerequisiteSize\": %d,\n",
> +			    buf,
> +			    bioscfg_drv.string_data[instance].prerequisitesize);
> +
> +	buf_size = snprintf(buf, alloc_size, "%s\t\"Prerequisites\": [\n", buf);
> +
> +	if (bioscfg_drv.string_data[instance].prerequisitesize) {
> +		part_tmp = kstrdup(bioscfg_drv.string_data[instance].prerequisites,
> +				   GFP_KERNEL);
> +		part = strsep(&part_tmp, ";");
> +		while (part) {
> +			buf_size = snprintf(buf, alloc_size, "%s\t\t\"%s\"", buf, part);
> +			part = strsep(&part_tmp, ";");
> +			if (part)
> +				buf_size = snprintf(buf, alloc_size, "%s,\n", buf);
> +			else
> +				buf_size = snprintf(buf, alloc_size, "%s\n", buf);
> +		}
> +		kfree(part_tmp);
> +		part_tmp = NULL;
> +	}
> +	buf_size = snprintf(buf, alloc_size, "%s\t],\n", buf);
> +
> +
> +	buf_size = snprintf(buf, alloc_size,
> +			    "%s\t\"SecurityLevel\": %d,\n",
> +			    buf,
> +			    bioscfg_drv.string_data[instance].security_level);
> +
> +	buf_size = snprintf(buf, alloc_size,
> +			    "%s\t\"MinLength\": %d,\n",
> +			    buf,
> +			    bioscfg_drv.string_data[instance].min_length);
> +
> +	buf_size = snprintf(buf, alloc_size,
> +			    "%s\t\"MaxLength\": %d\n",
> +			    buf,
> +			    bioscfg_drv.string_data[instance].max_length);
> +
> +	return snprintf(buf, alloc_size, "%s},\n", buf);
> +}
> +
> +
> +int append_read_integer_attributes(char *buf, int alloc_size,
> +				   int instance,
> +				   enum hp_wmi_data_type type)
> +{
> +	int buf_size;
> +	char *part_tmp = NULL;
> +	char *part = NULL;
> +
> +	if (type >= ARRAY_SIZE(hp_wmi_classes) || !buf)
> +		return -EINVAL;
> +
> +	buf_size = snprintf(buf, alloc_size, "%s{\n", buf);
> +	buf_size = snprintf(buf, alloc_size, "%s\t\"Class\": \"%s\",\n",
> +			    buf, hp_wmi_classes[type]);
> +
> +	buf_size = snprintf(buf, alloc_size,
> +			    "%s\t\"Name\": \"%s\",\n",
> +			    buf,
> +			    bioscfg_drv.integer_data[instance].display_name);
> +
> +	buf_size = snprintf(buf, alloc_size,
> +			    "%s\t\"Value\": \"%d\",\n",
> +			    buf,
> +			    bioscfg_drv.integer_data[instance].current_value);
> +
> +	buf_size = snprintf(buf, alloc_size,
> +			    "%s\t\"Path\": \"%s\",\n",
> +			    buf,
> +			    bioscfg_drv.integer_data[instance].path);
> +
> +	buf_size = snprintf(buf, alloc_size,
> +			    "%s\t\"IsReadOnly\": %d,\n",
> +			    buf,
> +			    bioscfg_drv.integer_data[instance].is_readonly);
> +
> +	buf_size = snprintf(buf, alloc_size,
> +			    "%s\t\"DisplayInUI\": %d,\n",
> +			    buf,
> +			    bioscfg_drv.integer_data[instance].display_in_ui);
> +
> +	buf_size = snprintf(buf, alloc_size,
> +			    "%s\t\"RequiresPhysicalPresence\": %d,\n",
> +			    buf,
> +			    bioscfg_drv.integer_data[instance].requires_physical_presence);
> +
> +	buf_size = snprintf(buf, alloc_size,
> +			    "%s\t\"Sequence\": %d,\n",
> +			    buf,
> +			    bioscfg_drv.integer_data[instance].sequence);
> +
> +	buf_size = snprintf(buf, alloc_size,
> +			    "%s\t\"PrerequisiteSize\": %d,\n",
> +			    buf,
> +			    bioscfg_drv.integer_data[instance].prerequisitesize);
> +
> +	buf_size = snprintf(buf, alloc_size, "%s\t\"Prerequisites\": [\n", buf);
> +
> +	if (bioscfg_drv.integer_data[instance].prerequisitesize) {
> +		part_tmp = kstrdup(bioscfg_drv.integer_data[instance].prerequisites,
> +				   GFP_KERNEL);
> +		part = strsep(&part_tmp, ";");
> +		while (part) {
> +			buf_size = snprintf(buf, alloc_size, "%s\t\t\"%s\"", buf, part);
> +			part = strsep(&part_tmp, ";");
> +			if (part)
> +				buf_size = snprintf(buf, alloc_size, "%s,\n", buf);
> +			else
> +				buf_size = snprintf(buf, alloc_size, "%s\n", buf);
> +		}
> +		kfree(part_tmp);
> +		part_tmp = NULL;
> +	}
> +	buf_size = snprintf(buf, alloc_size, "%s\t],\n", buf);
> +
> +	buf_size = snprintf(buf, alloc_size,
> +			    "%s\t\"SecurityLevel\": %d,\n",
> +			    buf,
> +			    bioscfg_drv.integer_data[instance].security_level);
> +
> +	buf_size = snprintf(buf, alloc_size,
> +			    "%s\t\"LowerBound\": %d,\n",
> +			    buf,
> +			    bioscfg_drv.integer_data[instance].lower_bound);
> +
> +	buf_size = snprintf(buf, alloc_size,
> +			    "%s\t\"UpperBound\": %d,\n",
> +			    buf,
> +			    bioscfg_drv.integer_data[instance].upper_bound);
> +
> +	buf_size = snprintf(buf, alloc_size,
> +			    "%s\t\"IntValue\": %d\n",
> +			    buf,
> +			    bioscfg_drv.integer_data[instance].scalar_increment);
> +
> +	return snprintf(buf, alloc_size, "%s},\n", buf);
> +}
> +
> +int append_read_enumeration_attributes(char *buf, int alloc_size,
> +				       int instance,
> +				       enum hp_wmi_data_type type)
> +{
> +	int buf_size;
> +	char *part_tmp = NULL;
> +	char *part = NULL;
> +
> +	if (type >= ARRAY_SIZE(hp_wmi_classes) || !buf)
> +		return -EINVAL;
> +
> +	buf_size = snprintf(buf, alloc_size, "%s{\n", buf);
> +	buf_size = snprintf(buf, alloc_size, "%s\t\"Class\": \"%s\",\n",
> +			    buf, hp_wmi_classes[type]);
> +
> +	buf_size = snprintf(buf, alloc_size,
> +			    "%s\t\"Name\": \"%s\",\n",
> +			    buf,
> +			    bioscfg_drv.enumeration_data[instance].display_name);
> +
> +	buf_size = snprintf(buf, alloc_size,
> +			    "%s\t\"Path\": \"%s\",\n",
> +			    buf,
> +			    bioscfg_drv.enumeration_data[instance].path);
> +
> +	buf_size = snprintf(buf, alloc_size,
> +			    "%s\t\"IsReadOnly\": %d,\n",
> +			    buf,
> +			    bioscfg_drv.enumeration_data[instance].is_readonly);
> +
> +	buf_size = snprintf(buf, alloc_size,
> +			    "%s\t\"DisplayInUI\": %d,\n",
> +			    buf,
> +			    bioscfg_drv.enumeration_data[instance].display_in_ui);
> +
> +	buf_size = snprintf(buf, alloc_size,
> +			    "%s\t\"RequiresPhysicalPresence\": %d,\n",
> +			    buf,
> +			    bioscfg_drv.enumeration_data[instance].requires_physical_presence);
> +
> +	buf_size = snprintf(buf, alloc_size,
> +			    "%s\t\"Sequence\": %d,\n",
> +			    buf,
> +			    bioscfg_drv.enumeration_data[instance].sequence);
> +
> +	buf_size = snprintf(buf, alloc_size,
> +			    "%s\t\"PrerequisiteSize\": %d,\n",
> +			    buf,
> +			    bioscfg_drv.enumeration_data[instance].prerequisitesize);
> +
> +	buf_size = snprintf(buf, alloc_size, "%s\t\"Prerequisites\": [\n", buf);
> +
> +	if (bioscfg_drv.enumeration_data[instance].prerequisitesize) {
> +		part_tmp = kstrdup(bioscfg_drv.enumeration_data[instance].prerequisites,
> +				   GFP_KERNEL);
> +		part = strsep(&part_tmp, ";");
> +		while (part) {
> +			buf_size = snprintf(buf, alloc_size, "%s\t\t\"%s\"", buf, part);
> +			part = strsep(&part_tmp, ";");
> +			if (part)
> +				buf_size = snprintf(buf, alloc_size, "%s,\n", buf);
> +			else
> +				buf_size = snprintf(buf, alloc_size, "%s\n", buf);
> +		}
> +		kfree(part_tmp);
> +		part_tmp = NULL;
> +	}
> +	buf_size = snprintf(buf, alloc_size, "%s\t],\n", buf);
> +
> +	buf_size = snprintf(buf, alloc_size,
> +			    "%s\t\"SecurityLevel\": %d,\n",
> +			    buf,
> +			    bioscfg_drv.enumeration_data[instance].security_level);
> +
> +	buf_size = snprintf(buf, alloc_size,
> +			    "%s\t\"Value\": \"%s\",\n",
> +			    buf,
> +			    bioscfg_drv.enumeration_data[instance].current_value);
> +
> +	buf_size = snprintf(buf, alloc_size,
> +			    "%s\t\"Size\": %d,\n",
> +			    buf,
> +			    bioscfg_drv.enumeration_data[instance].size);
> +
> +	buf_size = snprintf(buf, alloc_size, "%s\t\"PossibleValues\": [\n", buf);
> +
> +	if (bioscfg_drv.enumeration_data[instance].size) {
> +		part_tmp = kstrdup(bioscfg_drv.enumeration_data[instance].possible_values,
> +				   GFP_KERNEL);
> +		part = strsep(&part_tmp, ";");
> +		while (part) {
> +			buf_size = snprintf(buf, alloc_size, "%s\t\t\"%s\"", buf, part);
> +			part = strsep(&part_tmp, ";");
> +			if (part)
> +				buf_size = snprintf(buf, alloc_size, "%s,\n", buf);
> +			else
> +				buf_size = snprintf(buf, alloc_size, "%s\n", buf);
> +		}
> +		kfree(part_tmp);
> +		part_tmp = NULL;
> +	}
> +	buf_size = snprintf(buf, alloc_size, "%s\t]\n", buf);
> +
> +	return snprintf(buf, alloc_size, "%s},\n", buf);
> +}
> +
> +int append_read_ordered_list_attributes(char *buf, int alloc_size,
> +					int instance,
> +					enum hp_wmi_data_type type)
> +{
> +	int buf_size;
> +	char *part_tmp = NULL;
> +	char *part = NULL;
> +
> +	if (type >= ARRAY_SIZE(hp_wmi_classes) || !buf)
> +		return -EINVAL;
> +
> +	buf_size = snprintf(buf, alloc_size, "%s{\n", buf);
> +	buf_size = snprintf(buf, alloc_size, "%s\t\"Class\": \"%s\",\n",
> +			    buf, hp_wmi_classes[type]);
> +
> +
> +	buf_size = snprintf(buf, alloc_size,
> +			    "%s\t\"Name\": \"%s\",\n",
> +			    buf,
> +			    bioscfg_drv.ordered_list_data[instance].display_name);
> +
> +	buf_size = snprintf(buf, alloc_size,
> +			    "%s\t\"Value\": \"%s\",\n",
> +			    buf,
> +			    bioscfg_drv.ordered_list_data[instance].current_value);
> +
> +	buf_size = snprintf(buf, alloc_size,
> +			    "%s\t\"Path\": \"%s\",\n",
> +			    buf,
> +			    bioscfg_drv.ordered_list_data[instance].path);
> +
> +	buf_size = snprintf(buf, alloc_size,
> +			    "%s\t\"IsReadOnly\": %d,\n",
> +			    buf,
> +			    bioscfg_drv.ordered_list_data[instance].is_readonly);
> +
> +	buf_size = snprintf(buf, alloc_size,
> +			    "%s\t\"DisplayInUI\": %d,\n",
> +			    buf,
> +			    bioscfg_drv.ordered_list_data[instance].display_in_ui);
> +
> +	buf_size = snprintf(buf, alloc_size,
> +			    "%s\t\"RequiresPhysicalPresence\": %d,\n",
> +			    buf,
> +			    bioscfg_drv.ordered_list_data[instance].requires_physical_presence);
> +
> +	buf_size = snprintf(buf, alloc_size,
> +			    "%s\t\"Sequence\": %d,\n",
> +			    buf,
> +			    bioscfg_drv.ordered_list_data[instance].sequence);
> +
> +	buf_size = snprintf(buf, alloc_size,
> +			    "%s\t\"PrerequisiteSize\": %d,\n",
> +			    buf,
> +			    bioscfg_drv.ordered_list_data[instance].prerequisitesize);
> +
> +	buf_size = snprintf(buf, alloc_size, "%s\t\"Prerequisites\": [\n", buf);
> +
> +	if (bioscfg_drv.ordered_list_data[instance].prerequisitesize) {
> +		part_tmp = kstrdup(bioscfg_drv.ordered_list_data[instance].prerequisites,
> +				   GFP_KERNEL);
> +		part = strsep(&part_tmp, ";");
> +		while (part) {
> +			buf_size = snprintf(buf, alloc_size, "%s\t\t\"%s\"", buf, part);
> +			part = strsep(&part_tmp, ";");
> +			if (part)
> +				buf_size = snprintf(buf, alloc_size, "%s,\n", buf);
> +			else
> +				buf_size = snprintf(buf, alloc_size, "%s\n", buf);
> +		}
> +		kfree(part_tmp);
> +		part_tmp = NULL;
> +	}
> +	buf_size = snprintf(buf, alloc_size, "%s\t],\n", buf);
> +
> +	buf_size = snprintf(buf, alloc_size,
> +			    "%s\t\"SecurityLevel\": %d,\n",
> +			    buf,
> +			    bioscfg_drv.ordered_list_data[instance].security_level);
> +
> +	buf_size = snprintf(buf, alloc_size,
> +			    "%s\t\"Size\": %d,\n",
> +			    buf,
> +			    bioscfg_drv.ordered_list_data[instance].size);
> +
> +	buf_size = snprintf(buf, alloc_size, "%s\t\"Elements\": [\n", buf);
> +
> +	if (bioscfg_drv.ordered_list_data[instance].size) {
> +		part_tmp = kstrdup(bioscfg_drv.ordered_list_data[instance].elements,
> +				   GFP_KERNEL);
> +		part = strsep(&part_tmp, ";");
> +		while (part) {
> +			buf_size = snprintf(buf, alloc_size, "%s\t\t\"%s\"", buf, part);
> +			part = strsep(&part_tmp, ";");
> +			if (part)
> +				buf_size = snprintf(buf, alloc_size, "%s,\n", buf);
> +			else
> +				buf_size = snprintf(buf, alloc_size, "%s\n", buf);
> +		}
> +		kfree(part_tmp);
> +		part_tmp = NULL;
> +	}
> +	buf_size = snprintf(buf, alloc_size, "%s\t]\n", buf);
> +
> +	return snprintf(buf, alloc_size, "%s},\n", buf);
> +}
> +
> +
> +int append_read_password_attributes(char *buf, int alloc_size,
> +				    int instance,
> +				    enum hp_wmi_data_type type)
> +{
> +	int buf_size;
> +	char *part_tmp = NULL;
> +	char *part = NULL;
> +
> +	if (type >= ARRAY_SIZE(hp_wmi_classes) || !buf)
> +		return -EINVAL;
> +
> +	buf_size = snprintf(buf, alloc_size, "%s{\n", buf);
> +	buf_size = snprintf(buf, alloc_size, "%s\t\"Class\": \"%s\",\n",
> +			    buf, hp_wmi_classes[type]);
> +
> +
> +	buf_size = snprintf(buf, alloc_size,
> +			    "%s\t\"Name\": \"%s\",\n",
> +			    buf,
> +			    bioscfg_drv.password_data[instance].display_name);
> +
> +	buf_size = snprintf(buf, alloc_size,
> +			    "%s\t\"Value\": \"%s\",\n",
> +			    buf,
> +			    bioscfg_drv.password_data[instance].current_password);
> +
> +	buf_size = snprintf(buf, alloc_size,
> +			    "%s\t\"Path\": \"%s\",\n",
> +			    buf,
> +			    bioscfg_drv.password_data[instance].path);
> +
> +	buf_size = snprintf(buf, alloc_size,
> +			    "%s\t\"IsReadOnly\": %d,\n",
> +			    buf,
> +			    bioscfg_drv.password_data[instance].is_readonly);
> +
> +	buf_size = snprintf(buf, alloc_size,
> +			    "%s\t\"DisplayInUI\": %d,\n",
> +			    buf,
> +			    bioscfg_drv.password_data[instance].display_in_ui);
> +
> +	buf_size = snprintf(buf, alloc_size,
> +			    "%s\t\"RequiresPhysicalPresence\": %d,\n",
> +			    buf,
> +			    bioscfg_drv.password_data[instance].requires_physical_presence);
> +
> +	buf_size = snprintf(buf, alloc_size,
> +			    "%s\t\"Sequence\": %d,\n",
> +			    buf,
> +			    bioscfg_drv.password_data[instance].sequence);
> +
> +	buf_size = snprintf(buf, alloc_size,
> +			    "%s\t\"PrerequisiteSize\": %d,\n",
> +			    buf,
> +			    bioscfg_drv.password_data[instance].prerequisitesize);
> +
> +	buf_size = snprintf(buf, alloc_size, "%s\t\"Prerequisites\": [\n", buf);
> +
> +	if (bioscfg_drv.password_data[instance].prerequisitesize) {
> +		part_tmp = kstrdup(bioscfg_drv.password_data[instance].prerequisites,
> +				   GFP_KERNEL);
> +		part = strsep(&part_tmp, ";");
> +		while (part) {
> +			buf_size = snprintf(buf, alloc_size, "%s\t\t\"%s\"", buf, part);
> +			part = strsep(&part_tmp, ";");
> +			if (part)
> +				buf_size = snprintf(buf, alloc_size, "%s,\n", buf);
> +			else
> +				buf_size = snprintf(buf, alloc_size, "%s\n", buf);
> +		}
> +		kfree(part_tmp);
> +		part_tmp = NULL;
> +	}
> +	buf_size = snprintf(buf, alloc_size, "%s\t],\n", buf);
> +
> +	buf_size = snprintf(buf, alloc_size,
> +			    "%s\t\"SecurityLevel\": %d,\n",
> +			    buf,
> +			    bioscfg_drv.password_data[instance].security_level);
> +
> +	buf_size = snprintf(buf, alloc_size,
> +			    "%s\t\"MinLength\": %d,\n",
> +			    buf,
> +			    bioscfg_drv.password_data[instance].min_password_length);
> +
> +	buf_size = snprintf(buf, alloc_size,
> +			    "%s\t\"MaxLength\": %d,\n",
> +			    buf,
> +			    bioscfg_drv.password_data[instance].max_password_length);
> +
> +	buf_size = snprintf(buf, alloc_size,
> +			    "%s\t\"Size\": %d,\n",
> +			    buf,
> +			    bioscfg_drv.password_data[instance].encoding_size);
> +
> +	buf_size = snprintf(buf, alloc_size, "%s\t\"SupportedEncoding\": [\n", buf);
> +
> +	if (bioscfg_drv.password_data[instance].encoding_size) {
> +		part_tmp = kstrdup(bioscfg_drv.password_data[instance].supported_encoding,
> +				   GFP_KERNEL);
> +		part = strsep(&part_tmp, ";");
> +		while (part) {
> +			buf_size = snprintf(buf, alloc_size, "%s\t\t\"%s\"", buf, part);
> +			part = strsep(&part_tmp, ";");
> +			if (part)
> +				buf_size = snprintf(buf, alloc_size, "%s,\n", buf);
> +			else
> +				buf_size = snprintf(buf, alloc_size, "%s\n", buf);
> +		}
> +		kfree(part_tmp);
> +		part_tmp = NULL;
> +	}
> +	buf_size = snprintf(buf, alloc_size, "%s\t],\n", buf);
> +
> +	buf_size = snprintf(buf, alloc_size,
> +			    "%s\t\"IsSet\": %d\n",
> +			    buf,
> +			    bioscfg_drv.password_data[instance].is_enabled);
> +
> +	return snprintf(buf, alloc_size, "%s},\n", buf);
> +}
> diff --git a/drivers/platform/x86/hp/surestart-attributes.c b/drivers/platform/x86/hp/surestart-attributes.c
> new file mode 100644
> index 000000000000..41c5a549f2ca
> --- /dev/null
> +++ b/drivers/platform/x86/hp/surestart-attributes.c
> @@ -0,0 +1,145 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Functions corresponding to sure start object type attributes under
> + * BIOS for use with hp-bioscfg driver
> + *
> + *  Copyright (c) 2022 HP Development Company, L.P.
> + */
> +
> +#include "bioscfg.h"
> +#include <asm-generic/posix_types.h>
> +
> +#define LOG_MAX_ENTRIES	254
> +#define LOG_ENTRY_SIZE	16
> +
> +/*
> + * audit_log_entry_count_show - Reports the number of
> + *				existing audit log entries available
> + *				to be read
> + *
> + * @kobj:  Pointer to a kernel object of things that show up as directory
> + *	   in the sysfs filesystem.
> + * @attr:  Pointer to list of attributes for the operation
> + * @buf:   Pointer to buffer
> + *
> + * Returns number of existing audit log entries available to be read,
> + *         audit log entry size, and maximum number of entries
> + *         supported. Otherwise, an HP WMI query specific error code
> + *         (which is negative)
> + *
> + *         [No of entries],[log entry size],[Max number of entries supported]
> + */
> +static ssize_t audit_log_entry_count_show(struct kobject *kobj,
> +					  struct kobj_attribute *attr, char *buf)
> +{
> +	int ret;
> +	u32 count = 0;
> +
> +	ret = hp_wmi_perform_query(HPWMI_SURESTART_GET_LOG_COUNT, HPWMI_SURESTART,
> +				   &count, 0, sizeof(count));
> +	if (ret < 0)
> +		return ret;
> +
> +	return snprintf(buf, PAGE_SIZE, "%d,%d,%d\n", count, LOG_ENTRY_SIZE, LOG_MAX_ENTRIES);
> +}
> +
> +/*
> + * audit_log_entries_show() - Return all entries found in log file
> + *
> + * @kobj:  Pointer to a kernel object of things that show up as
> + *	   directory in the sysfs filesystem.
> + * @attr:  Pointer to list of attributes for the operation
> + * @buf:   Pointer to buffer
> + *
> + * Returns number of bytes needed to read all audit logs entries to be read.
> + *         Otherwise, an HP WMI query specific error code (which is negative)
> + *	   -EFAULT if the audit logs size exceeds 4KB
> + *
> + */
> +static ssize_t audit_log_entries_show(struct kobject *kobj,
> +				      struct kobj_attribute *attr, char *buf)
> +{
> +	int ret;
> +	int i;
> +	u32 count = 0;
> +
> +	// Get the number of event logs
> +	ret = hp_wmi_perform_query(HPWMI_SURESTART_GET_LOG_COUNT, HPWMI_SURESTART,
> +				   &count, 1, 4);
> +
> +	/*
> +	 * The show() api will not work if the audit logs ever go
> +	 *  beyond 4KB
> +	 */
> +	if (count * LOG_ENTRY_SIZE > PAGE_SIZE)
> +		return -EFAULT;
> +
> +	if (ret < 0)
> +		return ret;
> +
> +	/*
> +	 * We are guaranteed the buffer is 4KB so today all the event
> +	 * logs will fit
> +	 */
> +	for (i = 0; ((i < count) & (ret >= 0)); i++) {
> +		*buf = (i + 1);
> +		ret = hp_wmi_perform_query(HPWMI_SURESTART_GET_LOG,
> +					   HPWMI_SURESTART,
> +					   buf, 1, 128);
> +		if (ret >= 0)
> +			buf += LOG_ENTRY_SIZE;
> +	}
> +	return (count * LOG_ENTRY_SIZE);
> +}
> +
> +static struct kobj_attribute sure_start_audit_log_entry_count = __ATTR_RO(audit_log_entry_count);
> +struct kobj_attribute sure_start_audit_log_entries = __ATTR_RO(audit_log_entries);
> +
> +static ssize_t type_show(struct kobject *kobj, struct kobj_attribute *attr,
> +			 char *buf)
> +{
> +	return sprintf(buf, "sure-start\n");
> +}
> +static struct kobj_attribute sure_start_type = __ATTR_RO(type);
> +
> +static ssize_t display_name_language_code_show(struct kobject *kobj,
> +					       struct kobj_attribute *attr,
> +					       char *buf)
> +{
> +	return sprintf(buf, "%s\n", LANG_CODE_STR);
> +}
> +
> +static struct kobj_attribute sure_start_display_langcode =
> +		__ATTR_RO(display_name_language_code);
> +
> +
> +static ssize_t display_name_show(struct kobject *kobj,
> +				 struct kobj_attribute *attr, char *buf)
> +{
> +	return sprintf(buf, "%s\n", SURE_START_DESC);
> +}
> +static struct kobj_attribute sure_start_display_name = __ATTR_RO(display_name);
> +
> +static struct attribute *sure_start_attrs[] = {
> +	&sure_start_display_name.attr,
> +	&sure_start_display_langcode.attr,
> +	&sure_start_audit_log_entry_count.attr,
> +	&sure_start_audit_log_entries.attr,
> +	&sure_start_type.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group sure_start_attr_group = {
> +	.attrs = sure_start_attrs,
> +};
> +
> +void exit_sure_start_attributes(void)
> +{
> +	sysfs_remove_group(bioscfg_drv.sure_start_attr_kobj, &sure_start_attr_group);
> +}
> +
> +int populate_sure_start_data(struct kobject *attr_name_kobj)
> +{
> +	bioscfg_drv.sure_start_attr_kobj = attr_name_kobj;
> +	return sysfs_create_group(attr_name_kobj, &sure_start_attr_group);
> +}


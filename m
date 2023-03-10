Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61397C64EC4
	for <platform-driver-x86@archiver.kernel.org>; Fri, 10 Mar 2023 10:02:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231310AbjCJKCO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 10 Mar 2023 05:02:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231305AbjCJKCJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 10 Mar 2023 05:02:09 -0500
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2065.outbound.protection.outlook.com [40.107.223.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDBA710BA68
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Mar 2023 02:01:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lY58lGis3kd9hokSciocggFlcbxO5Er4XWiH/9cE6mcQSwvOggUYxWLxbg5dkhfXQiYmrT9801A7PZ9jSO1uYd6CfMb1uMmJvMrgWb/DCC9n5omSeaNonbrgGFFLnBJm6dQEjJibIx4W1R0PIecJwoBhay6qTAxaQHCeF/8bIjNZPGlAqIp6f9Dcw01Z2ZTg62aN+trN6NrM4N4AUN9rP2aqt2H8QYyEBAqLBqqdO5if7G9oqfktgOXKQzspuTbjPMg5JwaS5Fpw4k/J89/Fz2HqxiGAW8PN8Xwyh76bCJz6qYKT8E2kf69ORJVQZbwmaqRw/U0Rngs6PTfP3O0eMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bkzmksrCzwAjANc6MktExdBnP7vVW+xaBws6c7usrx0=;
 b=nuUCyqKyhKim0uXTh27tgY+2CBiNi2xjqDGnPmGKzhmRKMFSwLPdEVhJad2vd5luKr/q0XcdGyc8h7cjRxp33T9ZpbYLVhGEYWzQFPtMkTrUO7NIAqx0ACUWRs7xe5ZWYtLEQNMGJ2qiCnke3xLyDQw8ZAZ+2NtKhDwdMSmhiINgipMdHXn0kJ+KCTCaU2zmRuNevpU9+OMsHwCHKOK+QUCTFbOiifIXuo506vzrz8gSUtmVyXA9AGkRXO1Chnq/krcBdIJqKplnGuxO8N2bn/FqM+pnbI+SwSvqbJzjS3Z7GPac3+IxZ+NHswnRUCkIDLB6jM29ztCDKP+W+ZhvEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bkzmksrCzwAjANc6MktExdBnP7vVW+xaBws6c7usrx0=;
 b=c5LoicY+Tkrsp4Y6E1eCfY6REsJnu+54DLy9FxLzcNW3Z2QwQ5YfZRQbi+VyzCKwJXP6qQYQWniXgwj8C81JPnCuMDpnddU/D5YNq3bIYC23AE1YsBi5ISUMxJN3+DqYa3j96pK1TdLHVjVpqZ69xDHKvpSruoYxVAkyi2Sv39U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by CO6PR12MB5491.namprd12.prod.outlook.com (2603:10b6:303:13b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Fri, 10 Mar
 2023 10:01:52 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::8db1:ed03:e196:be2e]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::8db1:ed03:e196:be2e%7]) with mapi id 15.20.6178.019; Fri, 10 Mar 2023
 10:01:52 +0000
Message-ID: <586069f4-5faa-18e4-df7b-0d260536b713@amd.com>
Date:   Fri, 10 Mar 2023 15:31:41 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH] platform/x86/amd: pmc: decouple CONFIG_SUSPEND from AMD
 STB API usage
To:     hdegoede@redhat.com, markgross@kernel.org
Cc:     Sanket.Goswami@amd.com, platform-driver-x86@vger.kernel.org,
        Robert Swiecki <robert@swiecki.net>,
        Steven Rostedt <rostedt@goodmis.org>
References: <20230310095301.1596369-1-Shyam-sundar.S-k@amd.com>
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <20230310095301.1596369-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0005.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::10) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|CO6PR12MB5491:EE_
X-MS-Office365-Filtering-Correlation-Id: da845236-20a3-4086-eb62-08db214e789b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OsgFs0NUsaFrp3Nsxon3KcT6Ab/1N83rBVrr/pRzfHHVeV5m0pGdqm0jT/SvHTjyrLQDK3+F+TYzEa0GCgaiyU4BC2+Mz2eHCyzf62ws0hl2NpyuNs1/JWzl0Xav3yI4y2ECqIR3HVE7e/Rjbr3/my/96cMgzvEcPq/qSxeAE/X3Ht8mcrwKoS8qu9j8vbcdiuOzy23RDkmbDl7B5ZwYUb3vqVPZwMA0o5gxDumtKdP252Ie9tnkXMARwYu3D9K8XNZS3HHvibWD4fdgr6dVO9mqtXQKqniAWQ2dtOIiQm4lSG0cG+cNfuVa7p4yv2YnMV/9jv3LrBnrfvYnjiWAHCCxfrccV5mXF3Rx/OvbrQroZFEPK2R8o98EcS7B+YVJ2Kv5wd67zpG10X0hOw68bd0RGlA/j20ZEuRQ0njxEU9exBNu6PqJFlbJB6BvV2XIIC/AGFFDjrlyOSk3nVlyOy3cRRZFpuX7RPyMIKMWnpRcOY7vdmz0l2UtTzfneeq0QmzD86G7N8rn9D9Tbq9xFgkavGcSVtjReF81I9bs2Gxs5GT+5bE3ihWwFVP9g8nPlguelJa2yWR5xVn4AOoFuZWGmW6rVDlgQDwL/PM4MdLT9SwYRER5SZZdpXoJPKPbac6/x7oDrJVbioQY4xad/FctnDFH2yKAcQNURvSW//uFt07WD1L8kduTySvYsWRykMf0Zr2bZPEDxlw+naBxRag89z5hG3bXWFWGbny7lB8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(39860400002)(376002)(346002)(136003)(396003)(451199018)(83380400001)(31686004)(26005)(36756003)(316002)(54906003)(6506007)(38100700002)(86362001)(31696002)(186003)(66556008)(53546011)(6512007)(2616005)(41300700001)(6486002)(5660300002)(4326008)(478600001)(8936002)(966005)(8676002)(66476007)(2906002)(66946007)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXhaNXBxbmVnMEFMbDhmMThxbTZpeGY2SzZlcjNVNFFVdHhDMlRIemVwZDZH?=
 =?utf-8?B?Slg3eFludVRrT0p0eTVMcTJSMU9pM0pMN0JMYWMzYi9uaHpyaUJQVVdhbjdW?=
 =?utf-8?B?TFkyWjl1YTNZcnVuWmh6Y3FXY0xNcjE0d1ZnUUJWV1pFZ2wza2podDlLYWlo?=
 =?utf-8?B?LzREbVcrVjZHallNcE9ETVdpVUJkVEpmREhINzFORVpHOWdtU0pRL0tHSEd4?=
 =?utf-8?B?SGlUWURGczNyamNRN3JRc2pKUlNHUUJiWHJHUXlJaUV3NlpoWmJXVG5pcngv?=
 =?utf-8?B?MjZWLysrL0VqV1ZPSGNkdWFnUjEzZ0RvQXNSK3dJa2xqOFl0djdFbXZmbGVx?=
 =?utf-8?B?bXA1ZVpxZGlzalZDY0xNV2NTem5UWS9ZRlc1TFp3ZjZCdHFtSHlMRTgzcmpn?=
 =?utf-8?B?VHZZYUVESmNUejVkU3RyUlEvSko1LzIvUjdFcjJuUTlYTE9nbWx4anpRYnNZ?=
 =?utf-8?B?bUcrQUd3QzlId3RuNUN1OVBveDE0VXMrazdwY1lCVlB2WWJ5VXhDdlRob05a?=
 =?utf-8?B?bFF3eUxHLzFCdXNsNko0endvUHh5Rm9pSXBiWWxNYTAyTEV6RVJEQWhwak55?=
 =?utf-8?B?a0pNang1VnVmNjlaRlY1WmlGWTd4Y1A4NDZvQzZwcyswZHR2bUo0SUx5RG44?=
 =?utf-8?B?ekdpSTJQeGVBNitFTDltNk1yZDF5NmNOajhySmlhNDhlL1orViswYzFCM1ZT?=
 =?utf-8?B?ZktSTjI2NlJCbFpLS3kxRFdEVjl6cDJjdlNmZkNGc3JyT1QwbjRPYTBFRWFw?=
 =?utf-8?B?d3ViNS9oS01KOWxOY04rdFdYSUs1RlVxY0JPY0ZFR3RaYitKWDhQaCtFT2s1?=
 =?utf-8?B?TW9XUnFTMTk5akI2eERIQk85U1pOZE5HYnpmd1RnZnJEUTZ0a2lUT2RzNFhN?=
 =?utf-8?B?aUZXL24wQkVvVVJkc3lVVnZTbFo1KzRlL3pEQjd5U1Y4RDR2clcvQTRVVnQ1?=
 =?utf-8?B?RS9DZ0p2bGJhRVZNZlNhWklrcGxFTUgyZkFHc2N2b0RVMWFXQmdDMDJleG9U?=
 =?utf-8?B?dXp2ZVVlZEpibkNBVVM5UThNV3FWc1BiSHVpU2VlRXFDZGpkNGRzVkwwVU84?=
 =?utf-8?B?NDN0a0d5Q2hmMXVHSW5LamkzaXY0T1ZsZEFRSEpHU1BzYlJDa1EyZnZIWUp4?=
 =?utf-8?B?cTFBWTBuT1lFQ2pSeHBSTGFtVU8yeVNvQ1p4VDRzMkZxK3lUM25Fc0FYTisv?=
 =?utf-8?B?MlZCaC9CdUlJdjdZNGNESisrZVBQKzdYYXV3dEQ3UjBsTmVWY2ZFR3A1eWRw?=
 =?utf-8?B?ZDF1NXFUUzR2SS8yQ3NSYXhaSm11alRPdkhvNU5FbzBEU3JQVnQ3aEFjU0tj?=
 =?utf-8?B?RHJXTzVWeS9sSzZpQmViTG9Xb2dVTVRNSzNWU09tM2lnN0hsbi9wL2EwMzBi?=
 =?utf-8?B?OHBpNnlWM0I0S2U5VThaZVFmVHViNXhzVDBOZ3Q3SnplY2o0dkNzQkxrSStj?=
 =?utf-8?B?M3BhOVNqNFlwdjdxN29xQjk4Ri9sbUgxc2tRS0d3aEtWMGR0QlVZZ3RWajRR?=
 =?utf-8?B?VXRzbG5xOTkySjdNREphVmp4S3lYeUtxUzREYm5IbEZML0srOSttcGdIM1FV?=
 =?utf-8?B?c0h4eEpqZ3dZVTFXVXYwaWxEK0NZcUt6UytHK2E3alhBbktRQ2ZRaEN3RzNr?=
 =?utf-8?B?VjBGNGZ6TEtIUkREcisyNXlFdW1oN0xaM2cwbmMxc24rb3dnU2RkRkUrV003?=
 =?utf-8?B?VW1OSlJPYWREMTVhVTVteHNZTEZVeCsxY3JleXUzTDlXcGoyWGxjTmQwV09O?=
 =?utf-8?B?cThtL01qSmUyOWVyS2xKcGd3UmJCbXdtVm5neU9pQ0ZFZFgrRURKbXJVVnhG?=
 =?utf-8?B?cENWaVpEODdYQUY5aGJBUDdybWlhelpIYlBDUm9lbUVmMUpOaHk4dHM2bEVH?=
 =?utf-8?B?TGNrTnhKbnFaR1lUVStBbDd5eXJaRS9vSVRuUFB6WlRoWHh4R3NhaDZ5ZzVs?=
 =?utf-8?B?cDJKM0FXcFp3RFBBWEJPVE5qbDRzTWZmM2xoRk5wbHJCVURJNk9GOW1DOWda?=
 =?utf-8?B?N1VvSVJnNkN1NXozUHZaRHE3UlgxYkxQR1UrTk92UXY2VzdwSUZpZGVaL0Vk?=
 =?utf-8?B?RE1mZisyTmRad0o5b0U1ZE9YR0I2ZlVldCtkak9UQWh4YjhhbWNodjczcGF1?=
 =?utf-8?Q?LRg0SpdnVST0XdKahR/YjU6aZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da845236-20a3-4086-eb62-08db214e789b
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 10:01:52.0999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2XZrjnaTuTyzAtPAJbK8uBymjRiHLkMyDk0rzzZQ7nU+sCcrjFGs6fkeWfY3rIkHvBcdEd5/Fii2RwLlBuzLlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5491
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Hans,

On 3/10/2023 3:23 PM, Shyam Sundar S K wrote:
> The initial introduction of AMD STB was limited to only suspend/resume
> use cases, but the need for STB APIs like amd_pmc_write_stb() have grown
> overtime and guarding it with CONFIG_SUSPEND seems to be incorrect.
> 
> Also, with the recent commit, it seems to create a build failure where
> CONFIG_SUSPEND is not enabled. Remove the association of CONFIG_SUSPEND
> with STB APIs altogether.
> 
> Cc: Sanket Goswami <Sanket.Goswami@amd.com>
> Fixes: b0d4bb973539 ("platform/x86/amd: pmc: Write dummy postcode into the STB DRAM")
> Reported-by: Robert Swiecki <robert@swiecki.net>
> Link: https://lore.kernel.org/platform-driver-x86/20230309225016.2e8cd211@gandalf.local.home/T/#t
> Reported-by: Steven Rostedt <rostedt@goodmis.org>
> Link: https://lore.kernel.org/platform-driver-x86/20230309225016.2e8cd211@gandalf.local.home/T/#t

I had to use the same "Link" tag twice as Robert & Steven reported the
same issue and without that checkpatch fails.

Hope that's fine.

Thanks,
Shyam

> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmc.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
> index ab05b9ee6655..8db608e2c1ea 100644
> --- a/drivers/platform/x86/amd/pmc.c
> +++ b/drivers/platform/x86/amd/pmc.c
> @@ -171,9 +171,7 @@ MODULE_PARM_DESC(disable_workarounds, "Disable workarounds for platform bugs");
>  static struct amd_pmc_dev pmc;
>  static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret);
>  static int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf);
> -#ifdef CONFIG_SUSPEND
>  static int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data);
> -#endif
>  
>  static inline u32 amd_pmc_reg_read(struct amd_pmc_dev *dev, int reg_offset)
>  {
> @@ -905,7 +903,6 @@ static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
>  	return 0;
>  }
>  
> -#ifdef CONFIG_SUSPEND
>  static int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data)
>  {
>  	int err;
> @@ -926,7 +923,6 @@ static int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data)
>  
>  	return 0;
>  }
> -#endif
>  
>  static int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf)
>  {
> 

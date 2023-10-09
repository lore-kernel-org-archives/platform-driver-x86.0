Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD857E95A91
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Oct 2023 14:56:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346494AbjJIO4R (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 9 Oct 2023 10:56:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234608AbjJIO4O (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Oct 2023 10:56:14 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74DA910F
        for <platform-driver-x86@vger.kernel.org>; Mon,  9 Oct 2023 07:56:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MQHRWQ99LJ9xAkqIOY7q2H+tEMTebtL35AdHRa7FxUCtrRN0zTemD/erdudMHcaq0LXfUDapvI17TQ5rp8HbXlT8bkmh5MoaR4hMDdjS5/lSEBdyow+4ClQoyzdy61tYfnQVaEtDqt0XgVzBmy/sAa6dK5cRBuvClbzsbTj55OMItOAjWaBgmbM+JR0jkuCZpFWPIuWtqoU5jdyz9OOvzaLsLtpQtUOFlJyZO+VA0Wy3VTAn6Ocvx13eeu/wxp/X4RtDqVCBrfjWE8p/57/Aiau+iwYVsb5ue/EBbvSFdYfvxz2WtQxbsk9TJktfsiFp+HKQlIEFw462hzDz5TKagA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AE9GcYkn8onm7PP13g6hO+Fbt6dwNsBOI1VeE/YX0do=;
 b=VBaITksxfbjq0BOHbt/HGRvG5U2nYw4C0GE/ntFa8Kk/WDoFYbjSMDsS1y7tLXiHS4wIojLp3C0vmlfOCjoiD9SJZvkIBjKWGKyV5v3hgdqI9AFMCU8xAcRncQIxXZ15ML71oH8U5Z0TJCE2GDdOceIiYkksff/3gx+docGAPPtF2/d0f/5OZBn9eS04HVqf2LunHRro9POize3Fk2ySMeDIuiuOPfuciw1yZiAd/VoPFmkRiMU0Wkq0SiMHQpjJU5vEfBjfewOOMYDjkM2XpyjoPPlBCVNlukptOI2rF6JjcTvPy0vJNyhGn2gqsCLenH/7wksra2BjUbxdlA+/4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AE9GcYkn8onm7PP13g6hO+Fbt6dwNsBOI1VeE/YX0do=;
 b=eAZA1WA050H3Mqbsn8TeYaN0QesixgyM2skr756PnoITVaROcfaLPSX4H17o0Pm7URkN8m3HkIalerOTid1pQQjlU27eAT+ZoFCv5t5NZZ6QZHR8GS6rH9iJv7h4e0vXgojA8+CrYeqWL3hRC+5t993p+S+9go5vZs38ddhJOvI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by BL1PR12MB5801.namprd12.prod.outlook.com (2603:10b6:208:391::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.41; Mon, 9 Oct
 2023 14:56:08 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::3e65:d396:58fb:27d4]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::3e65:d396:58fb:27d4%3]) with mapi id 15.20.6863.032; Mon, 9 Oct 2023
 14:56:08 +0000
Message-ID: <41b8ebc4-78c9-4321-8062-9793fac10835@amd.com>
Date:   Mon, 9 Oct 2023 09:56:07 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] platform/x86/amd/pmc: Move structures to pmc header
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
        ilpo.jarvinen@linux.intel.com, markgross@kernel.org
Cc:     Sanket.Goswami@amd.com, platform-driver-x86@vger.kernel.org
References: <20231009144748.24054-1-Shyam-sundar.S-k@amd.com>
 <20231009144748.24054-2-Shyam-sundar.S-k@amd.com>
From:   Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20231009144748.24054-2-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR01CA0007.prod.exchangelabs.com (2603:10b6:805:b6::20)
 To MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|BL1PR12MB5801:EE_
X-MS-Office365-Filtering-Correlation-Id: c177e5ea-a6f9-4535-2c58-08dbc8d7dec4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uZPkA8yVf7w/uxheRbg+U7RBHePCuBaNl5b5Vp+0RJQY2NxOYaGdeewAgpIEj6eXwF++ioODwoD5M6P7LNf1pfeW2XxrAJ+Smzs1fKKsZL6a6wvPEzT+QpN9JgMC4KBQkY9M8kRYEEo/jqeO+45Hng31akj3izHeb2085mcG+YDOk6hECkixXIkdwDzrDzf7VA9fCwXuEw5A5fKeUJuVvsG3N9cmJ2aUaoVCO7fTi8y+9CZjGUPDc+Y0XWB94zC9NZWdTWD7PZAIGmRDzWY5V5TG4dRL/WN+vZzxP4zVRKGjlAAmaepOshL42p6u0oEwPnZukXgWNONYco/lk8vLVtNuHayOet+ZmhNWnvkNFEMYTjZs28Ba+R2WsLhcqsM81zvc05S6fdb/vpHRYa8ZPqUIyIJMyIpxiqQTUI7ToskpK1S8c7nd4Gd3yaiUB7lGYj7rd57aN8/WMZxO2xkQ2gPCbT7UyxJDuz3hmNs5FR7Hf1P1PtNdXAbY7eqE/feoR+cAYz2EV0p+AgX7af4i98N5vhopbtF6PLvTVUZvPoE0xQ7npQSstarGpgp1Yi7iQ4H+3OrJ3x08SNC+uJPjAs3/E9iblCwgH54L7Ea6KwQrVlvO+S9QaxShqSD7wNRC2AaiaFkdQ7FFYZibhUoWlA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(39860400002)(346002)(366004)(396003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(41300700001)(53546011)(6512007)(2906002)(6486002)(478600001)(6506007)(2616005)(8676002)(83380400001)(8936002)(44832011)(5660300002)(66946007)(66556008)(4326008)(316002)(66476007)(26005)(38100700002)(36756003)(31696002)(86362001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3hNREFwVCt5OHd4SkVMV3BmSWg5K214bGhzM0hIQWFCeThNVm9BekU4VmFl?=
 =?utf-8?B?Tys2THVjSnhEMFR3TFpUTTNmVzlpTEczK0p0QXlhUEFoTHBRZWNGVGlRelp3?=
 =?utf-8?B?RklneHdFaTlTUktmOTkrb3NvUXZ1a0NDOC9raFlZTG4rN1pZYXdJMDN0RVJT?=
 =?utf-8?B?NDFtbk16MUtqZzFJTVFkNmhwV212RXJoRG53R0JUa1hieWxTb283aGtKczd4?=
 =?utf-8?B?dDQ5TmlTZVVNUS92M29qRnB6bVpuYklmTDVDM0N1OWFsblZBL1BjSXRJQ3hJ?=
 =?utf-8?B?RGwyeWxOaS9VdnFDaVpVMnNEQVFrZC8yclNRU1hwdFJ1WDV5TVdxZ0g1Y2ls?=
 =?utf-8?B?dFROOExYS3l2b2c5K0lBNEoveG1FQ1h4TzJjZ2dWQUZGaWtKVzdsMDhyM2Zw?=
 =?utf-8?B?R0lMZjU1a2lXNHRhSDV4VHpldWVVUWt6MjQ2SWtHcHVHdHFnbmxkZm1DcFpH?=
 =?utf-8?B?WkNVSWpCUFVmMWxUMy9teFdDNkpUUWpNb25Rc0MyVXowUXUzYUpORzVMRzNi?=
 =?utf-8?B?OHJQc3IvdFQ0ZENlV0JqT1prNlZaUVFlRXpVNVdyZ1pWczE5OUFsRUtRRU90?=
 =?utf-8?B?SVZPZEpqbXA0TXl3SnhnbWdJbmNIS1VweHlBQXYwN2E1dGZVRnF2R3ZWWXBB?=
 =?utf-8?B?N0V5NnZHVjZkWHloODFQUlVWL3RBdTBzMC9BR3hjTTU4K28zTERHSzVDTDVa?=
 =?utf-8?B?RnhRMHBRVE5sRXpWRUdkU08wWitiWll2SG9YQkM4YnlPSTBxNTFKbVkzaVZ2?=
 =?utf-8?B?cDV1TzRyUXdYajQvSjRqU2tyYURnYkFTY29DK1p6V0dVdzE5Y3d1L2xQd1ZD?=
 =?utf-8?B?K0dnTHhhMmtYQUhUU0RkdFExcWJNRHY5djZpcGxKM1c0dU5kcG5rTnVkOGYy?=
 =?utf-8?B?OGlVRk1VTDRpdm5FMXZOMENZd2d5MDArUmZlU3lzSklJTHlycVNjbmIzcVh5?=
 =?utf-8?B?MmZqV0Fkb2FhZGIxS3ZvTXdIZmpyczIwa0hWeGNWb2EweGhzdUZ2N3pONEpK?=
 =?utf-8?B?QkN6TWJ2dTlzempQejVtR0ttdGNrZ3h3SkZyMjR5RWZmRzFzZkJtYm5FTHFW?=
 =?utf-8?B?RUtUcEljZVhrRmRTS3dNZzJwV0tVT3RrZzhQcVEzK0VwZmVnVFh3elplY01n?=
 =?utf-8?B?b29jY3Y1TzZRSDBDU0tLQ3dPbCtyNXRXV2JqNzFkZkRsUThzSzZKcWJhbFRU?=
 =?utf-8?B?L0JIL2xCUkQ2N25pcVVtMVhOcEpETmJoRXlGOHY0Mlk5eXhHb3VHQytuZ1Z4?=
 =?utf-8?B?enFqeXFrR09EeHVwZ2o4QkFPa2o0STR3QVZTYXhLTTB0MkcyK2duOHYwUUNH?=
 =?utf-8?B?WUczaXVuczNKbi9YbmtybVlLVmtOcWhKSDFaRDZMbGNjQk9mTHJwMnRUQjJZ?=
 =?utf-8?B?Ni9EeHpOazd1T3hFdis5bzhSbERmUW15czA2bVdxRWhtRzVrVlA2UGVoVkNy?=
 =?utf-8?B?akhIbWtRRjZCQjJhUG1ubEFGeXpiSFhWMld1MXFyMENTS2Yzekd2S0dJb2Rv?=
 =?utf-8?B?N01UYVZoaXdSLzFQM1duVitlNFJnYmNtUi9jNnIvSndzcUNuSHY2dFBSWVJq?=
 =?utf-8?B?WnNEVXJtc2VLVG9MSzZBaFB2aGhtbDdzVHBWdmZ2MDBYMjVWeWh2ZkFvdXFq?=
 =?utf-8?B?Mk1Sd3BnMHJXR2YrYThFL1JnbkFqMytMcm1mdm80MW95bnFNRUlIVUN2TEZV?=
 =?utf-8?B?bHAvVERqZTdpYlFiT0QwNFlWckNqcWc1OUx4aFJ4SnhlTHQrckpsRVNKblR5?=
 =?utf-8?B?TXNxazJqdWpubllCc21sMHdTSCtMWmU0V3NjL211RDZ2NEhuSlcvWVB2eUdN?=
 =?utf-8?B?Z2FyVmg5a2RuYzg5MXh3b2NnNlc3alF2QytRb2N1Z0NQWnRUelZoQ01DWDND?=
 =?utf-8?B?clFPQllpYlRlaTVaaldNeU85cUJQc0E2aDEwQ21KMEtodWhmQXViazZ3YllG?=
 =?utf-8?B?Z0RpZE13MEM5aURCMTlSWksvTFlmM0w4bGlpRi9rSmNXRHFnUjdBYzVmQk5j?=
 =?utf-8?B?bXlkaklhdlZrSDNiYm1ORXdwZGVBRnI5UHIwRjQvV2hrVUk2VzFjc296UG5h?=
 =?utf-8?B?bUVFS2tRcWYySVQzalN4R0tqcWJXUlRNSnZ3VEtENU5kWWlLeDRsWVJ0QjlO?=
 =?utf-8?Q?4AmnOxcHzk6TpzRe9vF11v1/n?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c177e5ea-a6f9-4535-2c58-08dbc8d7dec4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 14:56:08.5351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: en49LTp/HbJSuuMUiozitz1Ebc0vdBvkihHwxCPvVR/FkmXhm1ZDuHN7qAVglvKGAujGD3j3skkrA9sC+cgbpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5801
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 10/9/2023 09:47, Shyam Sundar S K wrote:
> As we have a separate header for amd_pmc driver, move the common strutures,
> enums, and macros to the header file.
> 
> Suggested-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
> based on review-ilpo, can be added on top of recent stb changes

This also splits it up nicely to be able to potentially re-organize the 
driver more logically.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

> 
>   drivers/platform/x86/amd/pmc/pmc.c | 103 -----------------------------
>   drivers/platform/x86/amd/pmc/pmc.h | 103 +++++++++++++++++++++++++++++
>   2 files changed, 103 insertions(+), 103 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index 92adf4523736..943fb85af91d 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -30,109 +30,6 @@
>   
>   #include "pmc.h"
>   
> -/* SMU communication registers */
> -#define AMD_PMC_REGISTER_MESSAGE	0x538
> -#define AMD_PMC_REGISTER_RESPONSE	0x980
> -#define AMD_PMC_REGISTER_ARGUMENT	0x9BC
> -
> -/* PMC Scratch Registers */
> -#define AMD_PMC_SCRATCH_REG_CZN		0x94
> -#define AMD_PMC_SCRATCH_REG_YC		0xD14
> -
> -/* STB Registers */
> -#define AMD_PMC_STB_PMI_0		0x03E30600
> -#define AMD_PMC_STB_S2IDLE_PREPARE	0xC6000001
> -#define AMD_PMC_STB_S2IDLE_RESTORE	0xC6000002
> -#define AMD_PMC_STB_S2IDLE_CHECK	0xC6000003
> -#define AMD_PMC_STB_DUMMY_PC		0xC6000007
> -
> -/* STB S2D(Spill to DRAM) has different message port offset */
> -#define AMD_S2D_REGISTER_MESSAGE	0xA20
> -#define AMD_S2D_REGISTER_RESPONSE	0xA80
> -#define AMD_S2D_REGISTER_ARGUMENT	0xA88
> -
> -/* STB Spill to DRAM Parameters */
> -#define S2D_TELEMETRY_BYTES_MAX		0x100000
> -#define S2D_RSVD_RAM_SPACE		0x100000
> -#define S2D_TELEMETRY_DRAMBYTES_MAX	0x1000000
> -
> -/* STB Spill to DRAM Message Definition */
> -#define STB_FORCE_FLUSH_DATA		0xCF
> -
> -/* Base address of SMU for mapping physical address to virtual address */
> -#define AMD_PMC_MAPPING_SIZE		0x01000
> -#define AMD_PMC_BASE_ADDR_OFFSET	0x10000
> -#define AMD_PMC_BASE_ADDR_LO		0x13B102E8
> -#define AMD_PMC_BASE_ADDR_HI		0x13B102EC
> -#define AMD_PMC_BASE_ADDR_LO_MASK	GENMASK(15, 0)
> -#define AMD_PMC_BASE_ADDR_HI_MASK	GENMASK(31, 20)
> -
> -/* SMU Response Codes */
> -#define AMD_PMC_RESULT_OK                    0x01
> -#define AMD_PMC_RESULT_CMD_REJECT_BUSY       0xFC
> -#define AMD_PMC_RESULT_CMD_REJECT_PREREQ     0xFD
> -#define AMD_PMC_RESULT_CMD_UNKNOWN           0xFE
> -#define AMD_PMC_RESULT_FAILED                0xFF
> -
> -/* FCH SSC Registers */
> -#define FCH_S0I3_ENTRY_TIME_L_OFFSET	0x30
> -#define FCH_S0I3_ENTRY_TIME_H_OFFSET	0x34
> -#define FCH_S0I3_EXIT_TIME_L_OFFSET	0x38
> -#define FCH_S0I3_EXIT_TIME_H_OFFSET	0x3C
> -#define FCH_SSC_MAPPING_SIZE		0x800
> -#define FCH_BASE_PHY_ADDR_LOW		0xFED81100
> -#define FCH_BASE_PHY_ADDR_HIGH		0x00000000
> -
> -/* SMU Message Definations */
> -#define SMU_MSG_GETSMUVERSION		0x02
> -#define SMU_MSG_LOG_GETDRAM_ADDR_HI	0x04
> -#define SMU_MSG_LOG_GETDRAM_ADDR_LO	0x05
> -#define SMU_MSG_LOG_START		0x06
> -#define SMU_MSG_LOG_RESET		0x07
> -#define SMU_MSG_LOG_DUMP_DATA		0x08
> -#define SMU_MSG_GET_SUP_CONSTRAINTS	0x09
> -/* List of supported CPU ids */
> -#define AMD_CPU_ID_RV			0x15D0
> -#define AMD_CPU_ID_RN			0x1630
> -#define AMD_CPU_ID_PCO			AMD_CPU_ID_RV
> -#define AMD_CPU_ID_CZN			AMD_CPU_ID_RN
> -#define AMD_CPU_ID_YC			0x14B5
> -#define AMD_CPU_ID_CB			0x14D8
> -#define AMD_CPU_ID_PS			0x14E8
> -#define AMD_CPU_ID_SP			0x14A4
> -#define PCI_DEVICE_ID_AMD_1AH_M20H_ROOT 0x1507
> -
> -#define PMC_MSG_DELAY_MIN_US		50
> -#define RESPONSE_REGISTER_LOOP_MAX	20000
> -
> -#define DELAY_MIN_US		2000
> -#define DELAY_MAX_US		3000
> -#define FIFO_SIZE		4096
> -
> -enum amd_pmc_def {
> -	MSG_TEST = 0x01,
> -	MSG_OS_HINT_PCO,
> -	MSG_OS_HINT_RN,
> -};
> -
> -enum s2d_arg {
> -	S2D_TELEMETRY_SIZE = 0x01,
> -	S2D_PHYS_ADDR_LOW,
> -	S2D_PHYS_ADDR_HIGH,
> -	S2D_NUM_SAMPLES,
> -	S2D_DRAM_SIZE,
> -};
> -
> -struct amd_pmc_stb_v2_data {
> -	size_t size;
> -	u8 data[] __counted_by(size);
> -};
> -
> -struct amd_pmc_bit_map {
> -	const char *name;
> -	u32 bit_mask;
> -};
> -
>   static const struct amd_pmc_bit_map soc15_ip_blk[] = {
>   	{"DISPLAY",	BIT(0)},
>   	{"CPU",		BIT(1)},
> diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
> index 12728eedecda..704256b07ef4 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.h
> +++ b/drivers/platform/x86/amd/pmc/pmc.h
> @@ -14,6 +14,109 @@
>   #include <linux/types.h>
>   #include <linux/mutex.h>
>   
> +/* SMU communication registers */
> +#define AMD_PMC_REGISTER_MESSAGE	0x538
> +#define AMD_PMC_REGISTER_RESPONSE	0x980
> +#define AMD_PMC_REGISTER_ARGUMENT	0x9BC
> +
> +/* PMC Scratch Registers */
> +#define AMD_PMC_SCRATCH_REG_CZN		0x94
> +#define AMD_PMC_SCRATCH_REG_YC		0xD14
> +
> +/* STB Registers */
> +#define AMD_PMC_STB_PMI_0		0x03E30600
> +#define AMD_PMC_STB_S2IDLE_PREPARE	0xC6000001
> +#define AMD_PMC_STB_S2IDLE_RESTORE	0xC6000002
> +#define AMD_PMC_STB_S2IDLE_CHECK	0xC6000003
> +#define AMD_PMC_STB_DUMMY_PC		0xC6000007
> +
> +/* STB S2D(Spill to DRAM) has different message port offset */
> +#define AMD_S2D_REGISTER_MESSAGE	0xA20
> +#define AMD_S2D_REGISTER_RESPONSE	0xA80
> +#define AMD_S2D_REGISTER_ARGUMENT	0xA88
> +
> +/* STB Spill to DRAM Parameters */
> +#define S2D_TELEMETRY_BYTES_MAX		0x100000
> +#define S2D_RSVD_RAM_SPACE			0x100000
> +#define S2D_TELEMETRY_DRAMBYTES_MAX	0x1000000
> +
> +/* STB Spill to DRAM Message Definition */
> +#define STB_FORCE_FLUSH_DATA		0xCF
> +
> +/* Base address of SMU for mapping physical address to virtual address */
> +#define AMD_PMC_MAPPING_SIZE		0x01000
> +#define AMD_PMC_BASE_ADDR_OFFSET	0x10000
> +#define AMD_PMC_BASE_ADDR_LO		0x13B102E8
> +#define AMD_PMC_BASE_ADDR_HI		0x13B102EC
> +#define AMD_PMC_BASE_ADDR_LO_MASK	GENMASK(15, 0)
> +#define AMD_PMC_BASE_ADDR_HI_MASK	GENMASK(31, 20)
> +
> +/* SMU Response Codes */
> +#define AMD_PMC_RESULT_OK                    0x01
> +#define AMD_PMC_RESULT_CMD_REJECT_BUSY       0xFC
> +#define AMD_PMC_RESULT_CMD_REJECT_PREREQ     0xFD
> +#define AMD_PMC_RESULT_CMD_UNKNOWN           0xFE
> +#define AMD_PMC_RESULT_FAILED                0xFF
> +
> +/* FCH SSC Registers */
> +#define FCH_S0I3_ENTRY_TIME_L_OFFSET	0x30
> +#define FCH_S0I3_ENTRY_TIME_H_OFFSET	0x34
> +#define FCH_S0I3_EXIT_TIME_L_OFFSET	0x38
> +#define FCH_S0I3_EXIT_TIME_H_OFFSET	0x3C
> +#define FCH_SSC_MAPPING_SIZE		0x800
> +#define FCH_BASE_PHY_ADDR_LOW		0xFED81100
> +#define FCH_BASE_PHY_ADDR_HIGH		0x00000000
> +
> +/* SMU Message Definations */
> +#define SMU_MSG_GETSMUVERSION		0x02
> +#define SMU_MSG_LOG_GETDRAM_ADDR_HI	0x04
> +#define SMU_MSG_LOG_GETDRAM_ADDR_LO	0x05
> +#define SMU_MSG_LOG_START		0x06
> +#define SMU_MSG_LOG_RESET		0x07
> +#define SMU_MSG_LOG_DUMP_DATA		0x08
> +#define SMU_MSG_GET_SUP_CONSTRAINTS	0x09
> +/* List of supported CPU ids */
> +#define AMD_CPU_ID_RV			0x15D0
> +#define AMD_CPU_ID_RN			0x1630
> +#define AMD_CPU_ID_PCO			AMD_CPU_ID_RV
> +#define AMD_CPU_ID_CZN			AMD_CPU_ID_RN
> +#define AMD_CPU_ID_YC			0x14B5
> +#define AMD_CPU_ID_CB			0x14D8
> +#define AMD_CPU_ID_PS			0x14E8
> +#define AMD_CPU_ID_SP			0x14A4
> +#define PCI_DEVICE_ID_AMD_1AH_M20H_ROOT 0x1507
> +
> +#define PMC_MSG_DELAY_MIN_US		50
> +#define RESPONSE_REGISTER_LOOP_MAX	20000
> +
> +#define DELAY_MIN_US		2000
> +#define DELAY_MAX_US		3000
> +#define FIFO_SIZE		4096
> +
> +enum amd_pmc_def {
> +	MSG_TEST = 0x01,
> +	MSG_OS_HINT_PCO,
> +	MSG_OS_HINT_RN,
> +};
> +
> +enum s2d_arg {
> +	S2D_TELEMETRY_SIZE = 0x01,
> +	S2D_PHYS_ADDR_LOW,
> +	S2D_PHYS_ADDR_HIGH,
> +	S2D_NUM_SAMPLES,
> +	S2D_DRAM_SIZE,
> +};
> +
> +struct amd_pmc_stb_v2_data {
> +	size_t size;
> +	u8 data[] __counted_by(size);
> +};
> +
> +struct amd_pmc_bit_map {
> +	const char *name;
> +	u32 bit_mask;
> +};
> +
>   struct amd_pmc_dev {
>   	void __iomem *regbase;
>   	void __iomem *smu_virt_addr;


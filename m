Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D882C00140
	for <platform-driver-x86@archiver.kernel.org>; Tue,  2 Aug 2022 11:22:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234024AbiHBLWm (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 2 Aug 2022 07:22:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231860AbiHBLWl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 2 Aug 2022 07:22:41 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2050.outbound.protection.outlook.com [40.107.94.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51A513E740
        for <platform-driver-x86@vger.kernel.org>; Tue,  2 Aug 2022 04:22:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mZdk8iVrrf7TEDRgsYgHyDdxke/oH498IjbwJorIl5iL5a0eC4eeodqixbi40JdVNMLWFUgPrSPa1Dh0TWKTcqmqzoclLpHHF7HoACbLC7XKujy82bZVs7Vb7p5+IawXUIXDB/QoPC4DgsONPw76gOVxJxDJsO0mFuPW3Tzvn0IklIJdpUSgq1rcQ8Q/dRUhmp62rv8c+W5eJvRiqOcj3SvaC4NTL1jJZxFo4w4iysJHB+AC5fTPg8Is9IFC+XMPuLGtRPcu4SYW0N8e00gDZQh22xLRzw7VYJkXSCDLmtZR7MrigECrtXuzJbxLc2E9QeQo25JQ/HYarddmJJhG/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m7cC0k+aDf2KOoFQJ1NhW814MoCsYwI6Xps0+udzh24=;
 b=jG2HuUklsgnYiYsGgYNi6wpZKL2CT3bpkwgO2HlsNBpC7M/bM4kl3Vqcqmb9ERL8Etusp1R/6ASUZwlRfgNnuRh5yZzkXyq1jJSP9R8mx7+XGyWMhfBiBUo3u4OYlnMFYNOBYvMiy8WIlxixqFVgnYv7W6Ns9+UcW8ptcnMd5xcihk9XxE58U9mHY98aaTzoi4CVW9Z/IaEMquyIK6aIXBXqFan/R215PT+TJw2j0abWQDcxMnj+Yn9iuv9GMJj2gxto7Siq8U3ITLUtDXpoocLkE5dC5gmlm5mbDpVmMAxnICTORh5ZtpRjABJXkptBMVwWHtFY6MYJjh/WtMD2sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m7cC0k+aDf2KOoFQJ1NhW814MoCsYwI6Xps0+udzh24=;
 b=u2burzPGdTC7qvdoyjarVMJy8ItZ51k5Ru6/AJVfRk8YPlnOijAWEYI1r10/CeNeovAhkXPLtrq8PFPnvKiJitYnu/Zj7V6b4F90KQeFKfi1jXBEradtty/aLjRazxooBtCNkn8ophYqIWYcH5LYBMtKi+wB9+m2kbdGd6lF+7Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by MWHPR12MB1150.namprd12.prod.outlook.com (2603:10b6:300:f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Tue, 2 Aug
 2022 11:22:36 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::6947:34fa:6a20:3e20]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::6947:34fa:6a20:3e20%9]) with mapi id 15.20.5482.016; Tue, 2 Aug 2022
 11:22:36 +0000
Message-ID: <3868af4d-8b88-fb80-af80-35bd2549490a@amd.com>
Date:   Tue, 2 Aug 2022 16:52:27 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v2 RESEND 09/11] platform/x86/amd/pmf: Handle AMT and CQL
 events for Auto mode
To:     Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
        Mario Limonciello <mario.limonciello@amd.com>,
        Mark Pearson <markpearson@lenovo.com>
References: <20220728182028.2082096-1-Shyam-sundar.S-k@amd.com>
 <20220728182028.2082096-10-Shyam-sundar.S-k@amd.com>
 <a4b27d9d-f217-f9da-ac48-487e851f23e3@redhat.com>
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <a4b27d9d-f217-f9da-ac48-487e851f23e3@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0190.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::15) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4cf37c81-6491-4845-e785-08da74794d5f
X-MS-TrafficTypeDiagnostic: MWHPR12MB1150:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Wgx2w13xGgSAm4mEbKgKdsp3zl2KMl7zVt3lot6o4lnUrDbH+51x+al7RAdpepdelhWUOXfygRYYlNHfohVYKSTgj5qs4gWINXKJS3NJ/DWve15+62f8THHtvOBeh32iCDAD/oiR6Wb4Cmnwc0dJh3QRhlmrpxkK+4kgJtEa99rtKdzLZBS/C0zvrciw5vhQuWUMLStAAYZ0kVj1UZ3DkLdqrndfrxP/WE15yoIEw0yKvc5micRI+Sj/0s+vlQbNorjod5cwGzurMLB4eWdO8kJlUny0N8Kt7j9/FwQPJvU9X0Ek5bkDWBbxSn9b0XRWMzIoxWI/2J+5hhzcja9fNaqJZRqfXd2WR/YAsWj+23EGv7ri/lXnW7DVnoK0KPcWGG4V9bBR87X2K4DMN7Troamvv9RCjwuAycxx0lbdL+uGlLfqWj2cr9eg0wTHBC4tmNcywjpK1J7NCkWMHahawU+v15maEHSDAjo0eeZNpIK/n0dWjk1/wtH9mZSRXQvvX93f0CTI7Hs9gK8wg6+H7NZaygI1rJlsBuKuF3WnwQk2EwyFlNZ+6IOtF5q6rVubkKQFo5chXpWN29iSVqSPF+XKPYt69X81dq12joAnad4fFw4O8P7v4PY2sBlBCIITAUZzOZAAH6x1JXB4Dhfw6DuksQxIYLwGYQJVvga1uLc9kFy2vUglSrYFpbvlvO0fZ1RJU+yclHenxQf4EYmIrPJeU6T5Ly9ck/R71+Oez3GNIBbab2PxYhsAY7C3DGEYYBu4dQuOCMI8Zd5Z8dDiTLbkzH5BAxffTw9NTQqFwcp6aN9h26K1/nsmQ/wFfoZnoPmbOxJqh8K5LtI71R5MFv6qP+Z3z+GckL8Z+R35aaz2NF7PJYxM77OY4rFwmDIH
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(366004)(396003)(136003)(346002)(376002)(8936002)(54906003)(2616005)(316002)(30864003)(66556008)(66476007)(31696002)(8676002)(4326008)(5660300002)(66946007)(86362001)(53546011)(6506007)(83380400001)(186003)(38100700002)(41300700001)(6666004)(36756003)(26005)(6486002)(966005)(478600001)(45080400002)(31686004)(2906002)(6512007)(43740500002)(45980500001)(309714004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkxjNVM2ZTZZckR0T1ZqYUI4OWFEOFRQcWxtWC9BOVM2OFpsQjJnR2JrR1NM?=
 =?utf-8?B?RmJFaU1mbVVkZ3BTdC9PVEdzU0p3ak1Ld0xnWk82dTdOSHkvMVI5cVg0cmVx?=
 =?utf-8?B?b3BQaTY3R0lNYkpFYzZIKzdhQmVZQldMYVVxZ1R6Ump6clgxOGZMaUUrdzJJ?=
 =?utf-8?B?QWx4VEhUaUJnL3RCcC9UMlVWVGh5RzE0aFlKTlR5eXRhRU90WEJaMldQWGNZ?=
 =?utf-8?B?ckFQeHFPS014bFltSVFLTDdxazM4RWN0cXJlVVBMV3MvTkNFUTRKRFZDTnZw?=
 =?utf-8?B?SnRQdjJhMXNJZDYrekZtZkdWN0RvSStBSHl4cHVLSktPdmN0RXI3ckVnT3lo?=
 =?utf-8?B?NzNlemtQSkNiZkNkTnh4NUV0bDI0cU5HQk1Xa1cxN215MmZabkEwMTdSWUls?=
 =?utf-8?B?bDhPUlN0QkpJZktoaGFQcXFiS1FqcVdRell4Y3BMYjA3bTA5SWRhVXNTTU1z?=
 =?utf-8?B?cFlBWjhTSHczYTRJMnpudVF6ZEZRbXhhdUV5TmI0bDhwV2I2UlowdnJuSFdH?=
 =?utf-8?B?S0tBZXpORzlJZlU2NEx2VlpaNHNLR0hpUkVxakcvdE0xM29SWWdTUnR0TGZj?=
 =?utf-8?B?a2I5ZnpZRWRZRXVBaklWZU9PczhlY0xOOENMRGpOdUVCRTN4NnNJMzludWd4?=
 =?utf-8?B?eThqdTBzaWE0QmIzaG9YYlRGZkt6MUZDSnE0cUZXbHA3NlRRdm44MjVZQWh5?=
 =?utf-8?B?ek5ES291OTlkSzZJMGdCbU8wbit5SzVUaU9KV2RpdkNGTGsxTEV2NVdJdUVk?=
 =?utf-8?B?V3NDYkF0eEtSK3VBK3FiTGsyQ1ZXSlF3QVFjUnNEUnFqdmVPTFF4SkFXTlE3?=
 =?utf-8?B?T2prWGRmZFRyTzlLS2YraVg2Unh4NTRnVmxvQitVemdtZmZzMno2YW4yRUpT?=
 =?utf-8?B?K245WEVscTdLSHBqaG1TWUtQT0wzbDVCaWFJUWZUOWFwdXFkenZmYjNycUlY?=
 =?utf-8?B?UStyRDZiVHY3MitCZGEzWll0ZjNETzhsNmFLUE5KUFNtT3VxWXBRRXcxVG9K?=
 =?utf-8?B?czNCNk1oVU9RNnRjNjRPM3ZKRXBlTXJKY1VyQll2RTJMSEZnbHFubXphaUJu?=
 =?utf-8?B?eHNaRllmK2VESmY1UWJWaC9seDgrWi8ramZ1dGVLVkhYUXBjQTg5TkxrWkdP?=
 =?utf-8?B?alNFLytwUENmb2FkTEVxdkNDWllOcUJRY2VtUVB4VE1aYzZPa2JmemVVeDZG?=
 =?utf-8?B?L1BtWUh5bDJqQUtVZzZxTSs1R1k2Y3BQS05PZ01hcTRHam04aXBxd1pscTl4?=
 =?utf-8?B?WUVaMy9zdkh2TXNWb2owcFVyN2lpSGN4QWc2amcxVWFIcjBUZDkxTGtkekg1?=
 =?utf-8?B?Tkl1UU50d2E0Z1FuQnBWdlc3b1lOWHRWZGJCVDIzV1lHSTYwNGpMbWorODBW?=
 =?utf-8?B?TzNER2R5YU1TTnZJMXBOSzZ5bVhGWmpuUmRSTlV5QmUyK0JneTRXbGRHTDln?=
 =?utf-8?B?RXFVWnZMSzE4MXR1VmRyZmpibWpjczdkWjlONUIxdk1MN1VDUGNTK0ZxYVdm?=
 =?utf-8?B?WEFhNTAvMzRQaWt3UnFLZDE0a0RpOWlmalVmUDFZaTNaanlHZlltOEFmVUhh?=
 =?utf-8?B?anM4UnlqbFhGQ1RtNVFBWGR4dzBCYWFrb0EwTFRmTVNUOWl3MGVaV24xT3da?=
 =?utf-8?B?eE54cCtQODZISTV2STB5NFdSanp2WFVOcCswWlZCZGdzdEtBZ0hnMGhsWVZh?=
 =?utf-8?B?alZQY2c0RWRNWVd1dklBWG50RUZ4THhzYzNnL3N3RFVhRnJwL3lvWS8vWW1v?=
 =?utf-8?B?cVBvRjBuQkNRcEUxcUlPOXVKZWRuVVlOWStPVTZuQlR3MjdPYWVrczF1NW5P?=
 =?utf-8?B?N2J0S2djaCtUWWQvd1pDTml6M0tkTDBuMEJoVG1aVENDajVxNE9ydFR2a25F?=
 =?utf-8?B?cTlmUHlGU1BObEwxMmJKRWl3aE92ZnhyZ3pQaklxYmVwcm9BLyswTHRMYXdB?=
 =?utf-8?B?NlRmdU5iWEpvK1IwalIzcHM0RElISWFzaFdYVll5bk4vZjZRUmVYajFueUpi?=
 =?utf-8?B?b0VtZWRUTUpFUkpVc0VnNS9vUHVodW1GQ1Y4OGxrZ2ptT3gzNzNqKzAzTXRQ?=
 =?utf-8?B?cy94R2pCSU5jSThJbEYzRkxFT092Wkx6Mnl4OEVGeEZ3THV3M0lsODQ5Nm9Z?=
 =?utf-8?Q?lcegwcKPpFWjiT4d9PMh7ihlP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cf37c81-6491-4845-e785-08da74794d5f
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2022 11:22:36.5904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pEzI6rwMYysXN41evPqs0o4fTya0GZ2pEIjaSYO+OuPyYN3UtWu4QUb4dl/oUgVo+Axah4APdYcIsi1+ZOYEzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1150
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Hans,

On 8/1/2022 7:25 PM, Hans de Goede wrote:
> Hi,
> 
> On 7/28/22 20:20, Shyam Sundar S K wrote:
>> The transition to auto-mode happens when the PMF driver receives
>> AMT (Auto Mode transition) event. transition logic will reside in the
>> PMF driver but the events would come from other supported drivers[1].
>>
>> The thermal parameters would vary between when a performance "on-lap" mode
>> is detected and versus when not. The CQL event would get triggered from
>> other drivers, so that PMF driver would adjust the system thermal config
>> based on the ACPI inputs.
>>
>> OEMs can control whether or not to enable AMT or CQL via other supported
>> drivers[1] but the actual transition logic resides in the AMD PMF driver.
>> When an AMT event is received the automatic mode transition RAPL algorithm
>> will run. When a CQL event is received an performance "on-lap" mode will
>> be enabled and thermal parameters will be adjusted accordingly.
>>
>> [1]
>> Link: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fpdx86%2Fplatform-drivers-x86.git%2Fcommit%2F%3Fh%3Dreview-hans%26id%3D755b249250df1b612d982f3b702c831b26ecdf73&amp;data=05%7C01%7Cshyam-sundar.s-k%40amd.com%7C1297e4cd71784092e05008da73c59095%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637949589653252953%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=5QDwDnnn45ZCwq2MfPQjv6ll27%2BPrj0QzffQIWX0ATo%3D&amp;reserved=0
>>
>> Cc: Mario Limonciello <mario.limonciello@amd.com>
>> Cc: Mark Pearson <markpearson@lenovo.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>  drivers/platform/x86/amd/pmf/acpi.c      | 59 ++++++++++++++++++++++++
>>  drivers/platform/x86/amd/pmf/auto-mode.c | 22 +++++++++
>>  drivers/platform/x86/amd/pmf/core.c      | 32 +++++++++++++
>>  drivers/platform/x86/amd/pmf/pmf.h       | 22 +++++++++
>>  4 files changed, 135 insertions(+)
>>
>> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
>> index 724150ec58fb..dedaebf18d88 100644
>> --- a/drivers/platform/x86/amd/pmf/acpi.c
>> +++ b/drivers/platform/x86/amd/pmf/acpi.c
>> @@ -12,6 +12,8 @@
>>  #include "pmf.h"
>>  
>>  #define APMF_METHOD "\\_SB_.PMF_.APMF"
>> +#define APMF_CQL_NOTIFICATION	2
>> +#define APMF_AMT_NOTIFICATION	3
>>  
>>  static unsigned long supported_func;
>>  
>> @@ -99,6 +101,7 @@ static void apmf_if_parse_functions(struct apmf_if_functions *func, u32 mask)
>>  {
>>  	func->system_params = mask & APMF_FUNC_GET_SYS_PARAMS;
>>  	func->static_slider_granular = mask & APMF_FUNC_STATIC_SLIDER_GRANULAR;
>> +	func->sbios_requests = mask & APMF_FUNC_SBIOS_REQUESTS;
> 
> I just noticed that this is not correct, this should be:
> 
> 	func->system_params = mask & BIT(APMF_FUNC_... - 1);
> 
> Which does something completely different!
> 
> Also this information is duplicated by:
> 
> is_apmf_func_supported(APMF_FUNC_...) so please drop the apmf_if_functions
> struct completely and use is_apmf_func_supported() everywhere.
> 
>>  	func->auto_mode_def = mask & APMF_FUNC_AUTO_MODE;
>>  	func->fan_table_idx = mask & APMF_FUNC_SET_FAN_IDX;
>>  }
>> @@ -167,6 +170,44 @@ int apmf_get_auto_mode_def(struct apmf_if *apmf_if, struct apmf_auto_mode *data)
>>  					 data, sizeof(*data));
>>  }
>>  
>> +int apmf_get_sbios_requests(struct apmf_if *apmf_if, struct apmf_sbios_req *req)
>> +{
>> +	return apmf_if_call_store_buffer(apmf_if, APMF_FUNC_SBIOS_REQUESTS,
>> +									 req, sizeof(*req));
>> +}
>> +
>> +static void apmf_event_handler(acpi_handle handle, u32 event, void *data)
>> +{
>> +	struct amd_pmf_dev *pmf_dev = data;
>> +	struct apmf_if *apmf_if = pmf_dev->apmf_if;
>> +	int ret;
>> +
>> +	if (apmf_if->func.sbios_requests) {
> 
> IMHO it would be better to change the test for [un]registering the handler to:
> 
> 	if (is_apmf_func_supported(APMF_FUNC_AUTO_MODE) &&
> 	    is_apmf_func_supported(APMF_FUNC_SBIOS_REQUESTS))
> 
> and then the sbios_requests test here (in apmf_event_handler()) can be dropped.
> 
>> +		struct apmf_sbios_req req;
>> +
>> +		ret = apmf_get_sbios_requests(apmf_if, &req);
>> +		if (ret) {
>> +			dev_err(pmf_dev->dev, "Failed to get SBIOS requests:%d\n", ret);
>> +			return;
>> +		}
>> +
>> +		if (req.pending_req & BIT(APMF_AMT_NOTIFICATION)) {
>> +			pr_debug("PMF: AMT is supported and notifications %s\n",
>> +				 req.amt_event ? "Enabled" : "Disabled");
>> +			pmf_dev->is_amt_event = !!req.amt_event;
> 
> The is_amt_event variable is not storing if the last event was an amt_event but
> rather wether AMT is enabled or not, so please rename it to amt_enabled.
> 
> Also by just setting the flag here you are introducing a race, at least on
> AMT disabling.
> 
> 1: amd_pmf_get_metrics() is running, has just passed the
>    "if (dev->is_amt_event)" check and is about to call amd_pmf_trans_automode().
> 
> 2. apmf_event_handler() gets called to disable AMT
> 
> 3. apmf_event_handler() finishes and the firmware now starts programming the
>    limits because thinkpad_acpi's platform_profile has been set to !balanced.
> 
> 4.  amd_pmf_get_metrics() continues and calls amd_pmf_trans_automode()
> 5.  amd_pmf_trans_automode() reprograms the limits, overriding the ones
>     set by the firmware eventhough AMT is disabled at this point.
> 
> To avoid this race apmf_event_handler() and amd_pmf_get_metrics() should both
> lock a newly added shared update_mutex mutex while running so that they cannot
> both run at the same time.
> 
> ###
> 
> Likewise restoring the static slider settings on AMT disable is also racy
> and to fix that the amd_pmf_reset_amt(dev);should be moved here; and then for
> consistency and cleanness the setting of the initial AMT values should also
> be moved here.
> 
> This will result in adding the following code here:
> 
> 		dev_dbg(dev->dev, "amt enabled: %d\n", dev->amt_enabled);
> 
> 		if (pmf_dev->amt_enabled)
> 			amd_pmf_handle_automode(dev, SLIDER_OP_SET, config_store.current_mode, NULL);
> 		else		
> 			amd_pmf_reset_amt(dev);
> 
> Also be handling the flanks (enabled<->disabled transitions) here like this there
> no longer is a need for a separate amt_running variable to detect the flanks in other
> places.
> 
>> +		}
>> +
>> +		if (req.pending_req & BIT(APMF_CQL_NOTIFICATION)) {
>> +			pr_debug("PMF: CQL is supported and notifications %s\n",
>> +				 req.cql_event ? "Enabled" : "Disabled");
>> +			pmf_dev->is_cql_event = !!req.cql_event;
> 
> is_cql_event is only used to pass req.cql_event to amd_pmf_update_2_cql()
> please drop it from struct amd_pmf_dev and make it an argument to
> amd_pmf_update_2_cql()
> 
>> +
>> +			/* update the target mode information */
>> +			amd_pmf_update_2_cql(pmf_dev);
>> +		}
>> +	}
>> +}
>> +
>>  static int apmf_if_verify_interface(struct amd_pmf_dev *pdev, struct apmf_if *apmf_if)
>>  {
>>  	struct apmf_verify_interface output;
>> @@ -211,12 +252,19 @@ static int apmf_get_system_params(struct apmf_if *apmf_if)
>>  
>>  void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev)
>>  {
>> +	acpi_handle ahandle = ACPI_HANDLE(pmf_dev->dev);
>> +
> 
> Hmm, is this the handle for: "\\_SB_.PMF" ? as in the parent of:
> 
> #define APMF_METHOD "\\_SB_.PMF_.APMF"
> 
> ?
> 
> In that case then apmf_if_call() can use:
> 
> 	acpi_handle ahandle = ACPI_HANDLE(pmf_dev->dev);
> 
> 	...
> 
> 	status = acpi_evaluate_object(ahandle, "APMF", &apmf_if_arg_list, &buffer);
> 
> and the whole:
> 
> +	status = acpi_get_handle(NULL, (acpi_string) APMF_METHOD, &apmf_if_handle);
> +	if (ACPI_FAILURE(status))
> +		return -ENODEV;
> +
> 
> bit + storing the handle + also:
> 
> +#define APMF_METHOD "\\_SB_.PMF_.APMF"
> 
> can then all be dropped. That would be a nice cleanup and then calling
> dev_err(...) for the ACPI errors also makes even more sense	
> 
> 
>>  	if (pmf_dev->apmf_if->func.sbios_heartbeat)
>>  		cancel_delayed_work_sync(&pmf_dev->heart_beat);
>> +
>> +	if (is_apmf_func_supported(APMF_FUNC_AUTO_MODE))
> 
> As mentioned above IMHO it would make sense to make this check:
> 
> 	if (is_apmf_func_supported(APMF_FUNC_AUTO_MODE) &&
> 	    is_apmf_func_supported(APMF_FUNC_SBIOS_REQUESTS))
> 
>> +		acpi_remove_notify_handler(ahandle, ACPI_ALL_NOTIFY,
>> +					   apmf_event_handler);
>>  }
>>  
>>  int apmf_acpi_init(struct amd_pmf_dev *pmf_dev)
>>  {
>> +	acpi_handle ahandle = ACPI_HANDLE(pmf_dev->dev);
>>  	struct apmf_notification_cfg *n;
>>  	acpi_handle apmf_if_handle;
>>  	struct apmf_if *apmf_if;
>> @@ -256,6 +304,17 @@ int apmf_acpi_init(struct amd_pmf_dev *pmf_dev)
>>  		schedule_delayed_work(&pmf_dev->heart_beat, 0);
>>  	}
>>  
>> +	/* Install the APMF Notify handler */
>> +	if (is_apmf_func_supported(APMF_FUNC_AUTO_MODE)) {
> 
> As mentioned above IMHO it would make sense to make this check:
> 
> 	if (is_apmf_func_supported(APMF_FUNC_AUTO_MODE) &&
> 	    is_apmf_func_supported(APMF_FUNC_SBIOS_REQUESTS))
> 
> What is missing here is detecting the initial AMT and CQL values and configuring
> things accordingly. Maybe this can be done by calling apmf_event_handler
> manually once before registering it ?

Thank you for all the review remarks.

I think manually calling the apmf_event_handler() is not required as the
the structure has the info on the pending AMT/CQL requests.

I did attempt to make this change but it did not make any difference.
Leaving this apart, I tried to address all of the comments in v2. Kindly
have a look again.

Thanks,
Shyam

> 
> Note the initial state detection must be done before registering the handler
> to avoid races.
> 
>> +		status = acpi_install_notify_handler(ahandle,
>> +						     ACPI_ALL_NOTIFY,
>> +						     apmf_event_handler, pmf_dev);
>> +		if (ACPI_FAILURE(status)) {
>> +			dev_err(pmf_dev->dev, "failed to install notify handler\n");
>> +			return -ENODEV;
>> +		}
>> +	}
>> +
>>  out:
>>  	return ret;
>>  }
>> diff --git a/drivers/platform/x86/amd/pmf/auto-mode.c b/drivers/platform/x86/amd/pmf/auto-mode.c
>> index 954fde25e71e..a85ef4b95cdb 100644
>> --- a/drivers/platform/x86/amd/pmf/auto-mode.c
>> +++ b/drivers/platform/x86/amd/pmf/auto-mode.c
>> @@ -111,6 +111,13 @@ void amd_pmf_trans_automode(struct amd_pmf_dev *dev, int socket_power, ktime_t t
>>  	bool update = false;
>>  	int i, j;
>>  
>> +	if (!dev->amt_running && dev->is_amt_event) {
>> +		dev_dbg(dev->dev, "setting AMT thermals\n");
>> +		amd_pmf_handle_automode(dev, SLIDER_OP_SET, config_store.current_mode, NULL);
>> +		dev->amt_running = true;
>> +		return;
>> +	}
>> +
> 
> As suggested above this is best done on receiving the amt_event.
> 
>>  	/* Get the average moving average computed by auto mode algorithm */
>>  	avg_power = amd_pmf_get_moving_avg(socket_power);
>>  
>> @@ -161,6 +168,21 @@ void amd_pmf_trans_automode(struct amd_pmf_dev *dev, int socket_power, ktime_t t
>>  	}
>>  }
>>  
>> +void amd_pmf_update_2_cql(struct amd_pmf_dev *dev)
>> +{
>> +	config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].target_mode =
>> +			dev->is_cql_event ? AUTO_PERFORMANCE_ON_LAP : AUTO_PERFORMANCE;
>> +	if ((config_store.current_mode == AUTO_PERFORMANCE ||
>> +	     config_store.current_mode == AUTO_PERFORMANCE_ON_LAP) &&
>> +	    config_store.current_mode !=
>> +	    config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].target_mode) {
>> +		config_store.current_mode =
>> +				config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].target_mode;
>> +		amd_pmf_handle_automode(dev, SLIDER_OP_SET, config_store.current_mode, NULL);
>> +	}
>> +	dev_dbg(dev->dev, "updated CQL thermals\n");
>> +}
>> +
>>  static void amd_pmf_get_power_threshold(void)
>>  {
>>  	config_store.transition[AUTO_TRANSITION_TO_QUIET].power_threshold =
>> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
>> index ef71f8326248..bfae779ccc23 100644
>> --- a/drivers/platform/x86/amd/pmf/core.c
>> +++ b/drivers/platform/x86/amd/pmf/core.c
>> @@ -93,6 +93,27 @@ int amd_pmf_get_power_source(void)
>>  		return POWER_SOURCE_DC;
>>  }
>>  
>> +static void amd_pmf_reset_amt(struct amd_pmf_dev *dev)
>> +{
>> +	pr_debug("resetting AMT thermals\n");
>> +	dev->amt_running = false;
>> +
>> +	/*
>> +	 * OEM BIOS implementation guide says that if the auto mode is enabled
>> +	 * the platform_profile registration shall be done by the OEM driver.
>> +	 * There could be cases where both static slider and auto mode BIOS
>> +	 * functions are enabled and we could end up in a race. To avoid that
>> +	 * add a protection and touch the static slider only if that's enabled
>> +	 * from the BIOS side.
>> +	 */
> 
> This comment seems odd. The is_apmf_func_supported() does not help to
> avoid the race. This check is necessary to avoid amd_pmf_update_slider()
> on systems where amd_pmf_load_defaults_sps() does not run. Otherwise
> amd_pmf_update_slider() ends up writing uninitialized (all 0) limits.
> 
> To fix the race the amd_pmf_update_slider() call must be done before
> apmf_event_handler() exits as suggested above. The feature check has
> nothing to do with the race ...
> 
> 
> 
>> +
>> +	if (is_apmf_func_supported(APMF_FUNC_STATIC_SLIDER_GRANULAR)) {
>> +		u8 mode = amd_pmf_get_pprof_modes(dev);
>> +
>> +		amd_pmf_update_slider(dev, SLIDER_OP_SET, mode, NULL);
>> +	}
>> +}
>> +
>>  static void amd_pmf_get_metrics(struct work_struct *work)
>>  {
>>  	struct amd_pmf_dev *dev = container_of(work, struct amd_pmf_dev, work_buffer.work);
>> @@ -103,6 +124,9 @@ static void amd_pmf_get_metrics(struct work_struct *work)
>>  	/* Get the current profile information */
>>  	current_profile = READ_ONCE(dev->current_profile);
>>  
>> +	if (!dev->is_amt_event)
>> +		dev_dbg(dev->dev, "amt event: %s\n", dev->is_amt_event ? "Enabled" : "Disabled");
>> +
> 
> This is weird, you check for !is_amt_event so this will only ever log:
> "amt event: Disabled" so the check in the dev_dbg is not necessary. Also this is
> best done when receiving the amt-event, as suggested above so this can just be dropped.
> 
>>  	/* Transfer table contents */
>>  	memset(&dev->m_table, 0, sizeof(dev->m_table));
>>  	amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, 0, 7, NULL);
>> @@ -112,6 +136,14 @@ static void amd_pmf_get_metrics(struct work_struct *work)
>>  	/* Calculate the avg SoC power consumption */
>>  	socket_power = dev->m_table.apu_power + dev->m_table.dgpu_power;
>>  
>> +	if (dev->is_amt_event) {
>> +		/* Apply the Auto Mode transition */
>> +		amd_pmf_trans_automode(dev, socket_power, time_elapsed_ms);
>> +	} else if (!dev->is_amt_event && dev->amt_running) {
>> +		/* reset to other mode if we receive a AMT disable event */
>> +		amd_pmf_reset_amt(dev);
>> +	}
>> +
> 
> As discussed above the amd_pmf_reset_amt() call must be done from inside
> apmf_event_handler(). So the whole "else if (...) {}" block can be dropped here.
> 
>>  	dev->start_time = ktime_to_ms(ktime_get());
>>  	schedule_delayed_work(&dev->work_buffer, msecs_to_jiffies(metrics_table_loop_ms));
>>  }
>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
>> index 4618ddc5a662..0f8b25524845 100644
>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>> @@ -17,6 +17,7 @@
>>  /* APMF Functions */
>>  #define APMF_FUNC_VERIFY_INTERFACE			0
>>  #define APMF_FUNC_GET_SYS_PARAMS			1
>> +#define APMF_FUNC_SBIOS_REQUESTS			2
>>  #define APMF_FUNC_SBIOS_HEARTBEAT			4
>>  #define APMF_FUNC_AUTO_MODE					5
>>  #define APMF_FUNC_SET_FAN_IDX				7
>> @@ -49,6 +50,7 @@
>>  /* AMD PMF BIOS interfaces */
>>  struct apmf_if_functions {
>>  	bool system_params;
>> +	bool sbios_requests;
>>  	bool sbios_heartbeat;
>>  	bool auto_mode_def;
>>  	bool fan_table_idx;
>> @@ -80,6 +82,21 @@ struct apmf_system_params {
>>  	u32 heartbeat_int;
>>  } __packed;
>>  
>> +struct apmf_sbios_req {
>> +	u16 size;
>> +	u32 pending_req;
>> +	u8 rsd;
>> +	u8 cql_event;
>> +	u8 amt_event;
>> +	u32 fppt;
>> +	u32 sppt;
>> +	u32 fppt_apu_only;
>> +	u32 spl;
>> +	u32 stt_min_limit;
>> +	u8 skin_temp_apu;
>> +	u8 skin_temp_hs2;
>> +} __packed;
>> +
>>  struct apmf_fan_idx {
>>  	u16 size;
>>  	u8 fan_ctl_mode;
>> @@ -161,6 +178,9 @@ struct amd_pmf_dev {
>>  	struct smu_pmf_metrics m_table;
>>  	struct delayed_work work_buffer;
>>  	ktime_t start_time;
>> +	bool is_amt_event;
> 
> The is_amt_event variable is not storing if the last event was an amt_event but
> rather wether AMT is enabled or not, so please rename it to amt_enabled.
> 
>> +	bool is_cql_event;
>> +	bool amt_running;
> 
> As discussed both these struct members can be dropped.
> 
>>  };
>>  
>>  struct apmf_sps_prop_granular {
>> @@ -320,5 +340,7 @@ int apmf_get_auto_mode_def(struct apmf_if *ampf_if, struct apmf_auto_mode *data)
>>  void amd_pmf_init_auto_mode(struct amd_pmf_dev *dev);
>>  void amd_pmf_deinit_auto_mode(struct amd_pmf_dev *dev);
>>  void amd_pmf_trans_automode(struct amd_pmf_dev *dev, int socket_power, ktime_t time_elapsed_ms);
>> +int apmf_get_sbios_requests(struct apmf_if *ampf_if, struct apmf_sbios_req *req);
>> +void amd_pmf_update_2_cql(struct amd_pmf_dev *dev);
>>  
>>  #endif /* PMF_H */
> 
> Regards,
> 
> Hans
> 

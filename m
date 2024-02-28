Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2067.outbound.protection.outlook.com [40.107.223.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B2B20DC8
	for <platform-driver-x86@vger.kernel.org>; Wed, 28 Feb 2024 06:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709101572; cv=fail; b=j7rCsy2OauXr6o48xNJsviiVDr8xeJXPdbQmcBtYLkiNKoV8t8pe4aOlXy6w8U7zW9rbBNbgigDtKLFqkg3ZTQk61vUixDL5X/+UoEAFGsa4sUBxUbhXmAz1V6tbYTbtkt7pNrz81RLgACdsIU4XzPhtQIcslz4ygcmri8cq40o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709101572; c=relaxed/simple;
	bh=PyEwOqTHUb8D8rEPUD+YvYvEt6fTshsy+WtjEczG8kc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BTmUYQzZXXcXM35yDsWpUWC/JQHdVzVfPaW1+OSC3dc2LF8nXnNFjs4dLrN8VZmzEF6RF7gyrnLpsq/xsOm0KT3sykXA0rClooJf/2MNqFw48ArrmxkP9hSv2WatCsntG1mXRFjSyeFb9RCYzLbwaiKMIB+J/yv2+xkmUUmHI3Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=yvj9oool; arc=fail smtp.client-ip=40.107.223.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="yvj9oool"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U6xX6CyNtHv6HvgWgrTJgH+RjXP7KRd8+INo3UyTDY7Txai+PBn3DduTGtIfP7SldvPji9PVgd+HjUoWP8/X1fhEp3ClRxQ8aIP217Ye+l78F0CHWP5Iawm2iPT95U580D8zaAQAO+Ihn7T2Iz1q38gI4cocjuUviHAj3A0bUYsQL46ojOHkxm6i4WBo3G+KySW4wwFWKpXlbPdNaxIPo+oDVr12jcJFEvzldFmuL4q5Rh5pNoRhJ/W/3KGcnXBu77c+czrVd+kn0WV1N+91erPB+idLnKbwRYY1x3PuMR4zz3IIqWeEbzA2Ecg/Awm0QkLYEh4PyDKSa1LehWnFlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b5lXIe1Tfeay4rtqaxuh+qKiW7NgtwiOdrWerbdWjTE=;
 b=QA8oHg6tqUj/f4XHpZaEMMsQZXCARFaLwLd1TAqhlRyNYuvw0Q8tNEGkq6XCtowz5dWlElTTLO5fQH+ZeEeI3FPc8aAgZB6M24l/CieifgsEBHSibIk8bm7ht0r8ZysYD91C7gTXX8yEMZ65zdtf/W7IoknG9LSwOwxFo0pCbCHebivctUzBxug8V4pLNtcNfELjURKnwGxAZSCYCG96MDTQnopp86RavGhAt6iwqZ++qy/Z6+pYC+USYnoWQNEuKjDH28nnrt7Feot3CzlDze3BlXqiaxN84nI9ezhy0EC0E7R7FSZG2F5IHwvSS6MuezRf5Z53XE1K5sVRlKnLRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b5lXIe1Tfeay4rtqaxuh+qKiW7NgtwiOdrWerbdWjTE=;
 b=yvj9ooolF2Mbi+S3kHoocWxIbhRUXtTa8RLH1DY3YaPmQRx4Uz/t7gL7XNFtqdGuXG/aWTjgE1VqDXJF5r/yU91yLIs3yKvYzrOlmbm2qIx8lwld3bGRrxC/ki0uoreQVj/Dh/bpgUyuT+WHBsn4xAWdqAC4XN2SK2pvbMWw28c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by CH0PR12MB8530.namprd12.prod.outlook.com (2603:10b6:610:188::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.36; Wed, 28 Feb
 2024 06:26:08 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::3476:df27:437c:12b8]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::3476:df27:437c:12b8%5]) with mapi id 15.20.7316.037; Wed, 28 Feb 2024
 06:26:07 +0000
Message-ID: <74f0d344-8d4f-4a33-8862-ade4ace571d1@amd.com>
Date: Wed, 28 Feb 2024 11:56:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] platform/x86/amd/pmf: Add support to get sbios
 requests in PMF driver
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org,
 Patil.Reddy@amd.com
References: <20240227125520.3153140-1-Shyam-sundar.S-k@amd.com>
 <20240227125520.3153140-4-Shyam-sundar.S-k@amd.com>
 <1358d40e-5114-2d1d-c679-342cf3ca0989@linux.intel.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <1358d40e-5114-2d1d-c679-342cf3ca0989@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0099.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::19) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|CH0PR12MB8530:EE_
X-MS-Office365-Filtering-Correlation-Id: 22af5b75-390e-4cbb-a93f-08dc382625e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6mAuuAVYLroUL5+9jszAZBEyOZ149As3GnrBZnpNQ7Si3ZfsDS6JpFSxGUSakkq9w+yeX9G3ouLbM4njd9Q7aZXie5z+x0N9pWbEVwsRVJL3ULKu+W5SZjr/AGoyH1OqYy8mY7llBYAH1abe2tvBlMgmbjbVVSXr92R7IgGbKbwpnptYND2WRjjJoSxdkiBiPuUuhoFGi/VECKIlFbnT2evWFP19QqEJS/A6WGXXAL2Vwer+rH+5f10s0e/Ia6gXj0gEa/ZsH0r5WN8GmPhJaO3I2yrY8RcN9HNXfH7Y70hW39ztw3VRtEU9RatGAZ8NtDqCmLjCREdLHTodBXGSpvqNlzrbCW/onD857ZndDER4ZWQIa0pxAKuWoDm1dOyYJoFB7u48swMkRIw8r8zwQvdrlgm+cJ74+vXJXf3kolRSzm+wQAVrZN0tCRk19VfqVVUIDvnS5z5044IzBth3qs+Wnn19yluJp0btuk6nhJFZM2ZxoBYIyiy2AzZukLM4vzAdM88xuUA5Vb3oL7WH9qzKTwk8gmFwKae71LWQHeAJGoGS14y4WqK7XhE9HO+Y1sdp3S1sdyDNuaMDkQOQONhkkc+mzeTSaHvIpeR0D87GSN83k1tZuqdakPllmXUN1D5/wYb/lEcQmvxGmEnIMA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M241ckw4bjBIL0hBWFB6TXNnVjBjR2pZOW12eE1vYWswaStpMXNzZlpIb2dD?=
 =?utf-8?B?bngrTGthcHR6QzdVT0VXS3hZb0FmcXZMUnZ3bW5yaTJUMjM2Q3ByOFV6Tmxq?=
 =?utf-8?B?RUtXTStxRjhxSVhYdHhQZUQrS1U3M1NQZnUwb0pBYnVGQVY1QlUydGpxVVZO?=
 =?utf-8?B?OG93czVwczh2ZXllRnQ5YXRTRk4veThYTTFXT1p5YTZvVjBYVXMybHMyb0hz?=
 =?utf-8?B?d3AvRWNxdTZCUWxaYnVnVlpnSVhic2pKNE10QnArcVdZSzF6R1UxdlM3TVRT?=
 =?utf-8?B?eDBoWjEyYVp3M0ZmNjRUZUVVZFh6S1ZpRjRTYmxkK1BkT0l6TlVNb1ZiaitC?=
 =?utf-8?B?TDV5NzMxM0NGYWlZeDZXY3IxMDJGK1J1S1NTN2lxY2pXR0szdGd1WlBKeGpX?=
 =?utf-8?B?UzUxeXBmVDdFeklZMWRsczk4bjVEcjRPRlZqWXgzMFpHTEdsbklTWmxYRGNm?=
 =?utf-8?B?YWs1aUI1VmdiUkRxOExoc2NiSnk0cWFXdDVwQnFyVXVRMEdjTHBnQnhwNnJD?=
 =?utf-8?B?UTE0YklLOUh2WFQ1azdXUXlXeVY5aGZxTFlRQmJXalYybW1xdStGSkI0Z3FV?=
 =?utf-8?B?bm16bU0zSUpBTW9uampna2Rvam54TnBkL3FZbmN3a2Zac3puc21IemVmS2VW?=
 =?utf-8?B?MXRxSWduNEdJbHhJVkdQbDd0TW9ON2M5ZUp4UXg5SDhIQ2tGYnZlNzV4TGZq?=
 =?utf-8?B?MVB5bU5wVnErUzhGV3BLVjdITzQrSy9nY04vYWxZT00rQnJDdHd1VFcxK1RN?=
 =?utf-8?B?RHlMbGtua1F3V1pwdWVrSXdFQlI2L1YzUzl0Q0dwd0ZaQjc4VVBETXZ2MmZ3?=
 =?utf-8?B?bW5VcDVtL3kvVGswNkV1Q2hlQ1ZNVE5PVXdvRFZndjBUOWRsVERKUy93dStx?=
 =?utf-8?B?Qmc3Q09iWERaZ3lZRDA5bmVobW1zc1FLc1hEb252a3BBQjI2ai9kVlZyRVJj?=
 =?utf-8?B?K1laYzVTY1VkZHBxVlQwbEpHQkZaMVRieHVyRG01OG1xMmdLMjkxVkpHaE5V?=
 =?utf-8?B?YUlGTmVhQmE1Uzk3dENTc3d2ZUoxSGlzeHN3Z2ZUd2pVS1RuMHNlRTN1WDFh?=
 =?utf-8?B?UlBmV2tpWmpveVVaU1UvbUN2QzdnUmE5emw0a2k5Qzg1QTk2c1pkbm81Qnha?=
 =?utf-8?B?KzlUODhmeC9qNDNpcEk0OGtiYS9sUnpEQlJJMnp1bkFlZEx4MWdVejlHTW0v?=
 =?utf-8?B?eDQ5cUVTQmVhR0xxREZsNUxmdUhsSmoyNThvY2NCSnB4SUFjTkg0eWJJMHVt?=
 =?utf-8?B?QTU1eFZaeGFlT3dod3Y4U0xPaVA3czB5YXRCZVFXWjMraG9HTnRWdDdXMmo5?=
 =?utf-8?B?TmFRREc1K1Q3Um8wYmYrTW9aemlCYUxhTEtOb0hGYnJpbDVSN3lkcHRKU3By?=
 =?utf-8?B?czZ4eEx5ZDlsMWZOS20wSnJXNkN4eWFBRXBDNUh4KzA4TmQzeU4vRU1NMEtS?=
 =?utf-8?B?UUVGbXorS1E5VWtUMG1OWVd2anpzeFpWSVh2dlZVYnM3ZmlJWEtCVkw0WCt1?=
 =?utf-8?B?Sk9ZQ2dRTFNkeVhlSURXMzVOUkZUYWhXTis4eGNab3htd1BCRU1qTDJ3RmlE?=
 =?utf-8?B?QnBIY2dNK3BZSWxsQnNjTmFiMW9oOUVVS0pHd2hhend3YlhhbWg1OHloQTBN?=
 =?utf-8?B?Q3VsY1RkZDFtbEVPZEN1dURQRmdSV1JXbGk2WUZCNTlKN0VJOS9ERWprQS9s?=
 =?utf-8?B?RGZXQktBU1l4OVdhczlLZ05DSmZCUXpRRkZTSUZLa2FmS2M0SjRuTndkV0I1?=
 =?utf-8?B?bEx6T2NMVFpROU0vbHpUWkdxMXZlc3FzY0R4M052T2o2N1JIK1lGZTN4T01W?=
 =?utf-8?B?QThzSGxLWUVRbEVEbUtwZ2R3TVR5QWV1OGN2WG9xVVAyOGVwS2ppakxLNzhz?=
 =?utf-8?B?VG53RlY4cmVHdVhIcTMxV2pZNnkxeFBlSWM4d2dCcXF6WnlRdEVTRXRiRlBU?=
 =?utf-8?B?anpZaXBtWjdDMCtBVk85cXNyTWQvenloUUFOdE90TEJ3eFo2NThNNjhhN0d0?=
 =?utf-8?B?dU9lOVphZUVKaStJOGMzOUVNdnZTWkQ5aVBjMWlOZmhybVFvZTlzY092U0pX?=
 =?utf-8?B?UUZJV0FFRVhCLzdTc1J2ejdCYzFwVHZuTmpGdEdnVUlVazVGcWN5b2JhbEdp?=
 =?utf-8?Q?Y4XumrM1vieQh7BfiECEIrPfo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22af5b75-390e-4cbb-a93f-08dc382625e4
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 06:26:07.8898
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ap4bSSzMfB9qhG06vCgT5yMIQKalQq0v5zlDCWhoyQ0fJOyVfg8onovnBfs8DSDrd/bioOk8xLPUG5S4X2q64A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8530



On 2/27/2024 18:58, Ilpo Järvinen wrote:
> On Tue, 27 Feb 2024, Shyam Sundar S K wrote:
> 
>> Update the APMF function index 2 for family 1Ah, that gets the
>> information of  SBIOS requests (like the pending requests from BIOS,
> 
> extra space.
> 
>> custom notifications, updation of power limits etc).
>>
>> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>  drivers/platform/x86/amd/pmf/acpi.c |  6 ++++++
>>  drivers/platform/x86/amd/pmf/pmf.h  | 13 +++++++++++++
>>  2 files changed, 19 insertions(+)
>>
>> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
>> index 1f287a147c57..1b2a099c0cef 100644
>> --- a/drivers/platform/x86/amd/pmf/acpi.c
>> +++ b/drivers/platform/x86/amd/pmf/acpi.c
>> @@ -166,6 +166,12 @@ int apmf_get_auto_mode_def(struct amd_pmf_dev *pdev, struct apmf_auto_mode *data
>>  	return apmf_if_call_store_buffer(pdev, APMF_FUNC_AUTO_MODE, data, sizeof(*data));
>>  }
>>  
>> +int apmf_get_sbios_requests_v2(struct amd_pmf_dev *pdev, struct apmf_sbios_req_v2 *req)
>> +{
>> +	return apmf_if_call_store_buffer(pdev, APMF_FUNC_SBIOS_REQUESTS,
>> +									req, sizeof(*req));
> 
> Fix the alignment please.
> 
>> +}
>> +
>>  int apmf_get_sbios_requests(struct amd_pmf_dev *pdev, struct apmf_sbios_req *req)
>>  {
>>  	return apmf_if_call_store_buffer(pdev, APMF_FUNC_SBIOS_REQUESTS,
>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
>> index 4364af72a7a3..f11d2a348696 100644
>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>> @@ -116,6 +116,18 @@ struct apmf_sbios_req {
>>  	u8 skin_temp_hs2;
>>  } __packed;
>>  
>> +struct apmf_sbios_req_v2 {
>> +	u16 size;
>> +	u32 pending_req;
>> +	u8 rsvd;
>> +	u32 update_ppt_pmf;
>> +	u32 update_ppt_pmf_apu_only;
>> +	u32 update_stt_min;
>> +	u8 update_stt_apu;
>> +	u8 update_stt_hs2;
> 
> Is it intentional that these do not match with the names in struct 
> apmf_sbios_req? I mean some of the fields look suspiciously close in name 
> so is the purpose still the same and somebody just invented new names for the 
> same field?

The idea is to optimize certain fields in the BIOS menu that OEMs have
to feed in while making the right choices for the power settings for
different features.

The entire series is targeted towards that where the interface between
the driver and the BIOS is improvised so that:

- Multiple features can link to one state, so OEMs doesn’t need to
program same parameters in multiple locations.
- If we need to add new power controller limits , we don’t have to
touch APMF functions, its more expandable adding new fields in APS
methods.

To answers to your question of apmf_sbios_req vs apmf_sbios_req_v2:

It calls for a new struct _v2, because:
- AMT support has been dropped so there shall be no pending events
from DYTC (like the CQL and AMT)
- As per the new design, the PMFW has given control to set PPT and STT
limits and no pending requests on updating SPL limits.

But as per names, I don't think there is no new invention :-)

FYI, here PPT means Power Packaging Tracking, so it could be SPPT
(Slow PPT) or FPPT (Fast PPT) and SST means Skin Temperature Tracking.

I will address your other remarks.

Thanks,
Shyam

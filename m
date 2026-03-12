Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013054.outbound.protection.outlook.com [40.93.196.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786EA397E78;
	Thu, 12 Mar 2026 16:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773331564; cv=fail; b=MraYR72oxAuj/YSoNCg3ZvallOO0im2LPdHtHoMpfCR5paRpzt0LoQE7JmH2TFvqa6LXV9BkoZ8hyVqXFz6SiuH58jdE2rpqo9F6Q8qtsSmQbabQ/CNoEAbXwzJXYk2+f9bBlL8ZOfIN6aY09gPuE7sdiEkZDmxVHq7/S/VGfjs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773331564; c=relaxed/simple;
	bh=4DeGTVn4sTVMbAj6vPobh2sAbdPWwITYBTb9hCcjyu8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UgmM1JdYb8Xe/Pl688rboYchwwvC8JytFCOwwi+Tvz2VeNA+N2E5WgguJjN3ceents+GKQblwbhg+wj+B2eLO6LZrFIkK/tHWOwBbPPl+CWgpsvCDw3cZw7qUg3sHVX6X/RSfzIK+oQ1sjw8kqWA31fZGeBZOqxWode4SO6lnlY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=puGFupsG; arc=fail smtp.client-ip=40.93.196.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="puGFupsG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jzM36fcZwO/r3ita34re23Ozcl7SBuAOFKyCRtk0APnA4bTAwYLS/hJwFIg+KIqvW2IhYtzrQFe0wrGVLT3jn9CfU+uTG9SrhC2mQQNtOFiPz2VDxqB7S7Z1p6dg7aM1IeUS831pE2ZA01Tn2jeNbEbv0z6lwT6T4wyCpJrqVViiJ6Xy6QpsiuYIR1KAZCB4i2oB1WHh4bfxGl6v5EbvBnkfJQg5fwmtBBFoAuWM/RZrOPt1kwm6viRjNkRjJC8RUoAv+zdoOL8gqIujYg+JaqkCM57LpNKcNAg+Q+9KaIgq8Q1GQ7TgauML6C/6xQSNsjhXwhN7yFZU6rOkPLtEwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=COwq8wCtD1JX/J0HUw96jXJWimkz+ZUaBInD/fdrhIs=;
 b=rNCP2lneJSzCczk6y071QSLmZdn0arK0tAojCuiJAICDKgJ2xKK3UqHiOadUa3A5VjuEIY9Dqzeji/PhA3K/hC5Rp1pf8spj1SK8yAdBDKZivsVDvQcvHGUh9Tqj7JD9vEFbIQ2219Z6aDQcyShPnrJvsK90LJ9+GqjGxTrYYpS26IGNQyzbeBLfPcOtL4hj4Ey5KkOIP38bTzTfTdWPM6Q8cpbDOK6w9DCTSBmbRPhFf8LQSU/jjWHOdZdvDt5WVrs7I0wFu6TnDNYm5LQ9cKC/Z1zzKiaNHQdqnw92MjhYIUYHU7qxZn9S5XwmZVBLI75mXTc3ORZM0kuHIyMl6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=COwq8wCtD1JX/J0HUw96jXJWimkz+ZUaBInD/fdrhIs=;
 b=puGFupsGl5PgYfMMRzYAOu2sOXDAC9V4yGOG3gHQ3IVlYJHANud8UZO1Cht/nWUBz5K68OCdOmxmOhr6eDeKenFO6H2H5fp0B6+KK8r/WIWPlcZU2c1145uQqFOPcF5TkMMh2TubUPydj1Z1MBzccSUbbVau+D7HcLBQDiVP4i4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4557.namprd12.prod.outlook.com (2603:10b6:806:9d::10)
 by DM3PR12MB9435.namprd12.prod.outlook.com (2603:10b6:0:40::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.4; Thu, 12 Mar 2026 16:05:59 +0000
Received: from SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287]) by SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287%5]) with mapi id 15.20.9723.000; Thu, 12 Mar 2026
 16:05:59 +0000
Message-ID: <9843a54e-fafc-48cd-b92f-66cff9091848@amd.com>
Date: Thu, 12 Mar 2026 11:05:57 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v4 2/4] platform/x86/amd: dptc: Add AMD DPTCi driver
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: W_Armin@gmx.de, sashal@kernel.org, Shyam-Sundar.S-k@amd.com,
 derekjohn.clark@gmail.com, denis.benato@linux.dev, i@rong.moe,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260309205125.293148-1-lkml@antheas.dev>
 <20260309205125.293148-3-lkml@antheas.dev>
 <23ee46ed-6978-40a0-9447-e7f527ec7c11@amd.com>
 <CAGwozwFn0nUHWrF6nmba1N9-jbDx7ZpLRe8GcYJAZsQ1MO0y1w@mail.gmail.com>
 <9a9e441c-850a-44fb-b659-f4bc135beabe@amd.com>
 <CAGwozwE9yn0fQxUPxZa70CyTajjvyWZjRDfWRs15fa_Xtf0sGg@mail.gmail.com>
 <8bdccd48-556e-4b9f-8f90-dfb1ec761073@amd.com>
 <CAGwozwGUPuY9_wH6Bi+eSVm2o=F4Vgdv+URo9aTQ366vwptBOQ@mail.gmail.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <CAGwozwGUPuY9_wH6Bi+eSVm2o=F4Vgdv+URo9aTQ366vwptBOQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DS7PR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:5:3b8::12) To SA0PR12MB4557.namprd12.prod.outlook.com
 (2603:10b6:806:9d::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4557:EE_|DM3PR12MB9435:EE_
X-MS-Office365-Filtering-Correlation-Id: a631a783-c10b-4a66-abaf-08de8051400e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	EJB/8FF1SsCYHA4u6rHnWVd2vHP1TCq0fjoYwCZqs0tdjgEfC0Rl1k+4exF0ptN2RMpsc2+BTD5W/7ydaPTUdz0AphHSod8sRLTkJTY1uGjd99Q9vDbUh55xWlK3SBalSyk3AuJQjmxB1Y548Z54WTPnH2q5yYQLngYNnVEZQ+i39uIppftZVRCjADWGYRkqeSezyiTPYev2VFBr4d4SDBQNq3oW4EaZcN62PmCdqzXBqSgJYldXGKkkIOh9cqnhg75idc0CZwpQ9sd2NRtd6gUYgfMU1M1MC5VbDvx+D5nbecEmDyA06luRMGYJ/5/4NfNQHlZHLsy7K2FUtSTFVY8qglQYg0+lAfPC8HkAzvj4GjUToBMcbNQc6TpfNLJbOd8GcgWh1k8q0FfYrlyGSPvrWV377vkT5J3X/K2z7NPZUJOuNCwBqAt0acBY5tuvmSCYT1l3uI3sc2XtTsHvzeXD+B6eqVTa3cu9V2KGMoiRhqsWB6tCicpTbHbG74Jon1xxeLA09+1xLKVy3QUi+u8VETy9ItW+3UpFg1G2vBbD5KI3M7hun6dGIyE4j8wBi4BDd2An7vLefUDP4hV+/wyM2Ej00CvD+v1Ii0PQKhrYuW1wKnANOH7TohN0fhLkddLiZkFOXIlZRcmN+XzXsKcGj8YLKIjPdQ7zPHZ6cTqX71A/FuLBxoSUQfcwFOfU5PX+oRBZEUQWNGuMssKj+bLt5tRDUDHUb7cklLy4fRE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4557.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dUdGeXFMdkdWZ1BsZG1KaGQzYVNRckF2WXpleDFyQzdlcWRKWjBxNG9OMHls?=
 =?utf-8?B?dDliRi9kUjJvY1VOSTB6dWxLYjBzdWcxZ1ZJUHd3TExVMVJqZGtGTjdpeTdI?=
 =?utf-8?B?ZjM0YXk3d1lXRnlaZW1PM1B6MGN5cSswQWtmaklTeXlGbGpMcFhaYzVuMmxV?=
 =?utf-8?B?K2Z2UGdPZ2pwTW9BazdqUVVrbkRsQzB5TzZGUTRsb1V3SzVEejI4QlFiV3dx?=
 =?utf-8?B?OEVpQ3ozQS9ISkVKM09vT1lSS1pndHdKOW43U1I3SGlDeHE4UEF5ZWFVYWpO?=
 =?utf-8?B?L1ZZaGlvRUZrMDl1T0VPT1lwVDZtRGxxUDRwdVVIVVJZNTJkU29Zc2l3U2wx?=
 =?utf-8?B?bVhDOWY1ZjRRSFQ2ck1WRWNVc1FnczJSMGNaYzBJczRLZFNUa2xJbG9BR2RX?=
 =?utf-8?B?YUFURHVuUmZHMkZqUk9yZjQ2QkpMZ21rNDcxUG1KZWlEOW9DcHdxYk05aHZK?=
 =?utf-8?B?bURVcTRlVUI0aDZ5d09oNkc5WGR1SmE4d0dqV0NrRk93ZDRwZXVMdnZTa0g3?=
 =?utf-8?B?UDRKcU92aGJsdTVZVWJkVEFGYkl5LzNKOXUyMmJiMmJEb3I5MTBwVi9qZGVV?=
 =?utf-8?B?TFZGcFluYlNWM2VQMEFtVUtJMTJ1c2hlTEFOYWcvelZCTU01UmF5cFpmOUZp?=
 =?utf-8?B?SHhJTXdMZVFzUmVSNzhYWlRXWXlFSCtqenJkUkgzTGI3NzJCSWhWVUEvd3kv?=
 =?utf-8?B?bW4wdG8xMlUwam1UMTZIUWdJQmhuZTJuOFB6SVQ0ZXBPRENsT0R5NGpQOG1j?=
 =?utf-8?B?RHBIZk1tSFdsWHcvdkJxckpHTnhPN3h1MVVGVjNaNU10ZWhMdlNlNUpSeUgw?=
 =?utf-8?B?Kzg0QnI0WlR5dzFGMk9sajNaNHJkOW1QUGgxR29kWnRJbGVmN2NOWTJLNUFZ?=
 =?utf-8?B?eXhTUDRuVFRWWSs2TnlqU2ttcmMxbkdNK1FGbnZCbWhmL0lBNll1SFl2N1R0?=
 =?utf-8?B?NnVIN1hwZExhRWZ1S2c3c2N3bkxkTnQvWjF3QjNPSVNlVnRlbEFORThzR2NO?=
 =?utf-8?B?RjdPN3JTRFhHWThabGJ5VUdhT2JWVW44WTBlYm9sc1ZKUmNlZStTamw1Y1Fo?=
 =?utf-8?B?MTdSdy9lQlFEczFIWlZEelk2WUhwY2VzNTAzbzJxd2ZSckR6S1VVNXk3UVBl?=
 =?utf-8?B?VGc3VWtYWWt3M3JBOEtDa2Y3MVlQajVlRkgvSjFHbEdMeThNSEtUR1JMYnB2?=
 =?utf-8?B?OGE3Y2lyT3I0b2lHMDV4L0MxQXhmRTdpdjF5VHo5VEQwZmgrQlc4MlNsQ2Y1?=
 =?utf-8?B?L2Y0V1lxdXNlVzdvSFdYbmVOeW4wZlQyeXJxQWJzYUl3S3FXSnRtWVVMam80?=
 =?utf-8?B?L2NCaWlpMHlSRUJ5V3BDQW5LcVIvS2MyYWRPV3NoOTRVSjZvdjVyaXkva1NR?=
 =?utf-8?B?d0ZTS25HWmhKQkVrYWZwenozTGsvSmJFdDVnQWdWY3dHT0ovaVdZcWJvZUs0?=
 =?utf-8?B?anJ1azZBYjd1VktCZEg1REZNeFpkNEJEVDRuMzI4ZlI5bjdVVGZlUEZNM1lh?=
 =?utf-8?B?YTlwZnJiZlAyaGFXQjBmcS9jN01KUm1QMTVqN2pNNnFtVitWV2Rhck5EYkFn?=
 =?utf-8?B?eU9IcGJBbHBzR3U5Q0hHVjNZS0d3K3h5Q21xc0NZbHR2VjFoWVI4dFJ4SUsx?=
 =?utf-8?B?U1drbVFKU0F6M3ZweDFWdzZpdUo4Q3VJM2tjT3lYdVhyR1FXSmk2NjhmdjBv?=
 =?utf-8?B?NnhKREhNTk5XcVhFc0JOYWlScHNYYkd5VTZ6NXYxdUQ1a2dna2NXQTREeEw0?=
 =?utf-8?B?RVQ3bEhBb3oxREJkajlrNHlLL2dEeEN2Z01vV2p2ak04ckR0NHkzL1ByQm5k?=
 =?utf-8?B?UEtrM0dmYnMxNUE2SXk1cnZkUHZGSEpyc2VwMW9pVGVmOEtBTWxOdGhBb2do?=
 =?utf-8?B?USt4VHVncXB6c0lTVmd1VTJqL1BCQkxla2NYRGM5M0FuOFdJNW9LTi9RbGVr?=
 =?utf-8?B?eFBoakZJTWdYQXVXZXpadDlORkhmR0ZpNGJuUDU4RVBRNEtQRnkvVVZUZkt4?=
 =?utf-8?B?SHQwZS9hV0xkbUxEbFVha1BqMldHYVZKQVpNRTJjUzBKOGxpUklvUVFSZWxO?=
 =?utf-8?B?cmpoTWhudDgramNET0NRMlJwcjhNaXlTb0orN0w2aW5TenJORDJ2ZmhEaXhl?=
 =?utf-8?B?RzZVWFlSQzF6VHBZRXAycEM1OUdSSVNsY0o1dVNoWUozRXBxZm9QRlJVVXRS?=
 =?utf-8?B?Q2JKT09mdkFlem9Sekl3WVVsVmF1ZWthODltb0FDTDR1d3JGT3dMYnloRkhS?=
 =?utf-8?B?TUw5WFZtalNBYUNKWGlhTmVpaDVEUEhIbFk1VytrbXNlQVlPRDV0NkRBY0Rq?=
 =?utf-8?B?WUtUYWtBWmZCM0pmRUp4R1Z2c0U1SHY1Y08xemdNcmt1dDRuYzg1QT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a631a783-c10b-4a66-abaf-08de8051400e
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 16:05:58.9763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4tD4hYOHGgbJhODQGf6NUz3i1hMectbVEIEP3hKvqSA4CbsqwpbzK9cT4lzoJ4J24qDtVpS1nWwucqgdXFO69Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9435


>>
>> So please; do not make assumptions based on a lack of hard data.
>> If you don't have data for multiple years of a system or multiple chips
>> in the system, leave it off your quirk list.  They can always be added
>> later when the data is available.
> 
> Specifically for GPD, the userspace implementation has been tested on
> all generations. It is fine to choose a (lower) limit that works on
> all of them. The thermals did not change between generations.
> Saturation above 20W means that there is little difference between
> 22W, 25W, 28W, 30W, etc. If there is doubt, going lower is fine. Even
> if one device can do 5W more it does not matter (but the chassis,
> battery, and cooler are exactly the same; only the board was revised
> for the new SoC).
> 
> 8-20W is the sweet spot for these APUs. 8W and 15W are sane for
> low-power/balanced. The only question is how close to 30W should be
> the maximum and where performance should point to. This version does
> 25W for performance. 20W might be better for daily use until AC/DC
> detection.
> 
> We do not need to complicate things. All this driver needs to do is
> expose a slider from 4-30W. This covers 6800-HX370 for all vendors and
> matches user expectation. AI Max will need further research as I do
> not have a lot of data on its performance curve. Ayaneo had some drops
> between 2022-2023 that had lower TDP limits, but there is less than 1k
> units in existence.

User expectation and reality aren't necessarily the same.

Performance is tied to a thermal design.  A user might want to run a 
handheld at the max performance, but max performance is not purely a 
function of the APU.

It's a function of the APU + cooling solution + power distribution.

That's why I have been saying there need to be different values for 
different parts, and you can't make assumptions year to year.

Even if the external chassis plastics are identical, a different fan or 
heatpipe might be used and those are non-trivial impacts.

The values used should be calculated by performance measurements of the 
entire solution in a thermal chamber.

I know you're not going to be able to do that, but that's what 
manufacturers /should/ be doing.

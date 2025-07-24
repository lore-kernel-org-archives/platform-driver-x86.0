Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2054.outbound.protection.outlook.com [40.107.94.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5346C259C85
	for <platform-driver-x86@vger.kernel.org>; Thu, 24 Jul 2025 09:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753348824; cv=fail; b=GIeYEt+xl9TtDaUq3tNb5dLtjSP1JLQNHQi7ni4zQsJSkhWWCTt9/m9aOLULdeNZYBM7uXv6d34aj9gqFT91WtJG1QrH8YAPnpJ5yuUcSU8mtVDVT/93dJnHMHX5zsrzjD+qFZqhYUlLArHBxJGKM89KPsNrvQj5CAMioCD4DPA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753348824; c=relaxed/simple;
	bh=ggioN9vD1P4y0Mt92EiifJo769NWv5o0s23FvYuKS50=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=R97FT7OQHUtGI5cqcjGS2Y9XiDs63d2/QBUvGSSA0fMnJ7VK93f0pIiGm9nuPoBC6rBB1RXDvYmUJ7YSUtT54nMHHFDKO1DiXctVg+41Fy46QfqPdYbTCB10IM+rHUZSpm91a2oYrNS8pUdzJ4q/jquhKvDWFDMU4j5cxP4n4FI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=3SUmssYw; arc=fail smtp.client-ip=40.107.94.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="3SUmssYw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T3IM9BNtP/OsHHjTBccAjiZkHb57nv8grz1eLxPyGie5e+fYDny9CMAFd/hSsSr7KP6/3bKS0EIhHN2d1QpRN2sppeFt/KYe6HBUSc3fHKIBV/j4PqSgiq2De3bzec7EjOsGi49eyVx6cCGEIborSWAbKf4yJSWtKu/UlV9UdqudFEv0WKE8aV+ewQ3OS8JAEAEb7XkH6Zw8IVRX/mOdONalkF5uS9PQA4zHMU+G/SUUGtEBHALv+39nXEiOX969ltJj8NVc1S0F6MxPd7jO/s0Q5wq5EKoODKOuQNAiYF7xfR6zdutMji1Hpu0dTyeZHAH/UzhnXVhrAM6zZd5aEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZAD2h9Gt10dEfBPti2UkIFlywqkjNVgueKJyK6ued0U=;
 b=hM1Ke/2ETw///smo34wfvh76FwwyjbX0ACl8IXc/OWuvA7KId73AFlthGO5HAQihqfXA5W11KAoWK3W+daESp61bdfd78HlqDwSR/WVnmbJfdHRR9AvcBnYMAt8NXG/7EmUQLgML5iLKt6DGL/+RPFd9PAxTOFOp6ewDs9LdXmIjro0eZ6/hUOl6svnuucgBEZA64k5VyM4NRyZ17RsdYWXbKLEWzRnZS7oVhuTSmOFvscmHxzuZf+ZvsCg+v/eHkaVWsOrXTvUxuGEy3NEUJJK1/S5kr1zzwnt396N+Ae0KM6rBcgWSrR4KMYCnPT4IXqMt7xdpnk+XgIdtrsKbtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZAD2h9Gt10dEfBPti2UkIFlywqkjNVgueKJyK6ued0U=;
 b=3SUmssYw7zMSJcLRvw1vMdyP/TaIkgrX5NV8i3/JwJJJeQOroIZTwd5ihMFuzy96TDrc6EWeF/s4zAT+ppdlsavl4Ff9CGFs/DzvGIBnOW3vfjWWLuyWIheorVhIVGJyM0LoIxaQHFJ5gvdx1JCOtnfgPEftRsOFXrLrsiZmLBw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV2PR12MB5966.namprd12.prod.outlook.com (2603:10b6:408:171::21)
 by DM4PR12MB5818.namprd12.prod.outlook.com (2603:10b6:8:62::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Thu, 24 Jul
 2025 09:20:20 +0000
Received: from LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::7c1b:5fa1:7929:fd81]) by LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::7c1b:5fa1:7929:fd81%4]) with mapi id 15.20.8964.021; Thu, 24 Jul 2025
 09:20:20 +0000
Message-ID: <dd58fb6a-021c-4467-9873-7832e2185ca2@amd.com>
Date: Thu, 24 Jul 2025 14:50:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] platform/x86/amd/hsmp: Ensure initialization of
 the sock struct in hsmp_send_message()
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
References: <20250723051251.3009625-1-suma.hegde@amd.com>
 <20250723051251.3009625-5-suma.hegde@amd.com>
 <11a77699-49f4-ac5f-4bce-6dedae7f0170@linux.intel.com>
Content-Language: en-US
From: Suma Hegde <Suma.Hegde@amd.com>
In-Reply-To: <11a77699-49f4-ac5f-4bce-6dedae7f0170@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4PR01CA0048.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:279::8) To LV2PR12MB5966.namprd12.prod.outlook.com
 (2603:10b6:408:171::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5966:EE_|DM4PR12MB5818:EE_
X-MS-Office365-Filtering-Correlation-Id: e86cac07-8865-4757-367e-08ddca934f69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QlVLYTJxWVJMWkx0QnRMRndWWHhrR28yOUNsTWk1YzVhR3lRRGpZbTkvMkFG?=
 =?utf-8?B?cllFUWdnb0tsWGYxcVBnclp4RnNKTzBXWFlUeHhzTG82Mk9oSDZxMkV6SHor?=
 =?utf-8?B?eFJsY1hyT1hxczREZWwzMXh3V3JIYXEzS2J1NHZJQkpPcEk3cTlLMWxqMGEz?=
 =?utf-8?B?WGo0Qm9zV05Pd2F0MXI5Tm1kSUZGVFVXVE5aeVFHQ3VKbk1GMkM4WnhJV0Ev?=
 =?utf-8?B?cHpqQk0xbWdXR1ZUKzNhdmVWT0JrT0FqZWM4VFZ5aDhlQmdvQnp0Z05ERUhy?=
 =?utf-8?B?RXVoRTY0ei8rWXZhNEs2YW9sVTZaL0tJTC9uT3oyaEpJdjZBVVZwQUc2Tk9T?=
 =?utf-8?B?R0ZwaHVFWmVjK3RpSk9IUDlOU09kWFcwaHlNdXd3NUFkU2hJTHpKOHo2Z0Rp?=
 =?utf-8?B?VmpBd0o1TThEY3UyRHliZmYxRTBVaG4zTEh6ejdkc2UzcTJCTW1PTU9rL3Qy?=
 =?utf-8?B?QmFHTWg4dVNDU3RxSGpUSzJqNjRHeEEvNW9NeUFvNTVTdHRKeUQ0SnNKbWRK?=
 =?utf-8?B?cFVZdmtoRk5tWmF5YjdIQ1gzZWsrNmVPdEd2K0E3c3BydzBCN0FjMTltLzY2?=
 =?utf-8?B?em1KRTh5eU9tQnhWVU5RQXJqQkFlQXEwMG5laWdvcGtRZzlqSktSUWZsaWVW?=
 =?utf-8?B?eS9Nek5CemZUWXhWTDZTTkFyVFduNmdwbjBOcy81Qno1SE9IZzZVc0NVbGp3?=
 =?utf-8?B?S0ZvT3Bhbk12aU16ZVZSRElLTC8xeWxScERVWmxXTWdLTXk5Y1hkMU9zZy9i?=
 =?utf-8?B?LzZ5MXBhNE1FMVc2NnlQQ0JvV2ZLRGhwdk9FeWMwc3ArTVo5eGoxMHVQRzA4?=
 =?utf-8?B?QW5JV3IzNE1wUm9LYisrWG44QVVxajBpS2NTamNrU1NFRCtKbzhmVWxZeFln?=
 =?utf-8?B?djAxdU5QWjA5dk1CUHUwMU5keEl3eE15aEg0ZW9vZVN1NGtPTGc3Y2VWeHpS?=
 =?utf-8?B?aktDOWdVMUh2SUI4djRXcmp2cEZua2hxUzJCYWlidlFQWTYrSGZBTlVmcHE0?=
 =?utf-8?B?V0ZKYkNtRUp2RE5xdjJhNnpRazQxWEx3bHFBVEFrQmU3VXU0YzdaWWdYbysx?=
 =?utf-8?B?bkQzcVVDTGxKclZxcllqamZHUmE5Mm9VWnEyazBUNUYweFRNTm85TWYvQXJn?=
 =?utf-8?B?RGVUeHFzb0lzQkQwdU9keHFROHc2V2FUVVU4ek5qd1ZiTk85eTl1QkR5NGhB?=
 =?utf-8?B?K0VkbWY4c3Rub0pPZ0tUd0x6Z2t6UzlwcmMrQVNKS2J3R3lTVFlNT25GQ2ZD?=
 =?utf-8?B?T2tkNVMwMkhqTzNaZEFoOWNSRG5wa1FwSGF4UHpoSjJzZitaYW1NNmJBb1dE?=
 =?utf-8?B?Z3BWS0M5Z25mSW1TN3c5YVlrMEJWSW1CQ2xvdjZpMUdvRU5oU0wxcW9xV0lE?=
 =?utf-8?B?Q2RpZHRrNTBCOVcwMkVHNStzd0NKZEQrVktXRDY1RWh0SVhXaGFBOEVMOHBD?=
 =?utf-8?B?eWhWeDAraXk0Ty8ra1Fscjk5amM0RkRiUWM1a29MWjlaU3dXRTB4WkhiQ0VP?=
 =?utf-8?B?dmU4Q1lYaEFCL096RllSVncyaXVsR2tJNWl3TG5jcUoxTC9mVHUvaUkrcHE5?=
 =?utf-8?B?K20wVVFiMllVUG42S20xbG1xd2x4ZVZqdmhIbFBDeHVXdldnaUc2OVR4Q2hn?=
 =?utf-8?B?TnpmckE0dUowdnhwRWd4TlVzcFhEY1pqWVJ3RWFRMCtpdUUzVkIvR1A1SWNp?=
 =?utf-8?B?S3dtMGRaR3dzSllkdlQ0NWREeUh6NHJnS014eW5ObHVSZzBRSnNpbVRCR3hH?=
 =?utf-8?B?UWhQM3dXb2M2QUcyTFpFd2tuZEJvc2JaUmp5T21ndDJ5K1JUNEFodnd3NUh4?=
 =?utf-8?B?UUdzOEFZL1JRckFWRUdkTksvUXlxRDJyNXFEOXpkZVFmdHZHb3hOR2JkUlpT?=
 =?utf-8?B?Vzdjc2ZZV0REc3Awa1gxVUQ2bW1odjl6c2tHRmg3eTN1dWdhKzJ2QWRjVGwx?=
 =?utf-8?Q?5DKn8Rxi/aA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5966.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Nm9aN3FXYUlrYWRMS3VYQ3VzbDBJKy93TUcvWjFzM0FCMXRGUWRHeCtTWUhN?=
 =?utf-8?B?QXdGbFhtSkdUVVhvOE9aNkdEQnpVcEUzYkdwR0gyQ21TN1I2T09Ca2Frenpp?=
 =?utf-8?B?MHhsUysyekRQWmFaU05sU0d0Nm1DMXcxMkM0Yi9sL1pxQlEvMlVnc3R1a3Rq?=
 =?utf-8?B?Ny9nQ1JVNHJieUpxVzNPclk4dmZJU3lMSTdwQ0JYa3Y2elR6TnBIVTJ4Rm9P?=
 =?utf-8?B?WWRzNDRCRkpjcWJRaEwrQlUvaTFRQ3Rna0xRSWhCSWZ5c3dVdi9JUVVNeGhu?=
 =?utf-8?B?ZnEwcjFWNVBTOEY2WENlRktlbjlXeGhVcVU3bFdIbHRZZjNwNFE4Vi93TkdW?=
 =?utf-8?B?ZVBjUERuRHhBSlBRNTBFSTJkOFdrK3cwNDU4Z24vYW02Vkoxdnk4Q1o0NHpU?=
 =?utf-8?B?NWkzQkFJVVEvazNwcThRQTgvUU9uR0lLVGFYSjVjVTQvNVovb3BwTTVJVTYz?=
 =?utf-8?B?eWhWL0I1SzFNbUJqc1FZamtudkxwTEZFa0ZJcTJLMEFzSEZPVjFkVG1ZbGh3?=
 =?utf-8?B?WDhxUUNkWDY2STJqYkI3QnZrWlh3UTFSOGFHbldtRzJkUUlXbkV4MWZ5Q1d4?=
 =?utf-8?B?ZnJTY1NHaVR0c1FGZkxkN3VxQzN2enB1REZnVzQ2NDlUT283NkwySGFjOUl2?=
 =?utf-8?B?QUJ4TWtEdVlaaERDWVlEc0V5eVZNckRQNHVrVFQvRm1hb1NnUERSVjNKOFZn?=
 =?utf-8?B?VklEc2E5YVk3SldwcHFPOUx3c0RSUGwrRm9uSjY5VTAxZTF3TFA1aTRzcmg0?=
 =?utf-8?B?SHlUNEkvRUR0QTYxTmxNTElHQmdNOTNPZW1KcGlleE1NK2s0Vi9HUFhwcHNy?=
 =?utf-8?B?TWhhRmM2WTFoWHlnUHJrcDl0Rm85eTNURnNXTjVXNVBnRXd2UmVLd0FURlhw?=
 =?utf-8?B?MXJ3K05qdm11d2NRc1g5NDJOMGxuQmxSMkRCekVyU1duU2liT2JVRlZNTzMw?=
 =?utf-8?B?TENPYVRicU1sQXZBUXNBTTVteEtNQlBuUFJhbzhyWnpUcFpML2FDNEpPbytk?=
 =?utf-8?B?c2xQamh5VXMwVDZLaitxNFpadmFoMEtTZGlWZm5MajFmZVJxMDR4dlZ3ZjB2?=
 =?utf-8?B?TkhleU5IeCtQdVZVZGdCZ0lYdjA5dlFjTWlPL0ZnazJZSDZOazA3eTJOQXlD?=
 =?utf-8?B?bXJ2S3QrRytBTVo4VUIyNXVJeFphbVJrYStidjd6R2JXMkp4b2pycEFhMks1?=
 =?utf-8?B?N2lWaUZWVnVEek1mRHgrY1RSY05wL0VuV3JmOVdtTEZvZnRwOEcwUHB6ZHl1?=
 =?utf-8?B?OExDMDI2VVpIRDlKNnM3WHVmd0ZxSU51MEhBOFFNMTNIbGtLcERBOUtFNURJ?=
 =?utf-8?B?Q2swb0J1a2VqcDNBaUZLOXRJeWZ5QXk5Wk81MFd5L3BRVlZwSnR4a2I0clJH?=
 =?utf-8?B?cWo4clArOGxYMVFMY1g4Zjh3TkZMdzVmWjUzWllMUDNXY1pydTBSTzBrb3lO?=
 =?utf-8?B?R3IxT04wOVlPcEhROWpJdTBSVlRjTm14QlR2ajlnNU81eG81UFp3aDNMTlBw?=
 =?utf-8?B?elE1SmRKSHQ2bW5rRDE0ZjFzYkppZi9uc2tLQnQyQWUvMkgxK1RGK3ZrNCsy?=
 =?utf-8?B?aWRlcnVZQmZvNkxwVDVudWhRMjJuUmU3U1JrdkhzOXcvd1ZmdGRDSldRT2ZL?=
 =?utf-8?B?Y0N4TVNoZ01ZKzdBaVdiK3U4dExjMk94SzdqaDYycEloamFKdTZXU2NpTENy?=
 =?utf-8?B?RlkrYmYvNVRxeG1pTFNVU2hMalNvbWo2RjlQMTN1U0N5NXpHQ2tibFRCNHRS?=
 =?utf-8?B?RDBUZXRBMkNMZVRJZFRVUTUrRGgrMHNDV1RxZjFxY3I2U012dTUvU0VNbjR1?=
 =?utf-8?B?Y2k3L290TGx2cXh0RVJtRE5sS0JPR2pEanVvdnhGVXRBL2UvbnRjQzd4YnJN?=
 =?utf-8?B?MFdhTlFwL1F3b0VkMnZETEplTW5ueWdWUmdYRDF6SEtpT0kvcEdGd0NZR05x?=
 =?utf-8?B?bnNzekh0NTA4NVU1MFh0ekVacDFUNDRjM3g5SnQzL2xYK3R0akUyRFFVVHZW?=
 =?utf-8?B?MzRlZ1ozYkhzS3NMNWp3dG9EcDRRUEdCSjRKTnlHb28vcUJzSVZZcjJEN2g4?=
 =?utf-8?B?eGlHU1hiZnBVWm5FVVg5NWFTcXQ5TkhqaXpkaFltVW9hS2xQSXU3b0oyRERP?=
 =?utf-8?Q?JzxAO23/bNv+S+gnWnoJFEOuH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e86cac07-8865-4757-367e-08ddca934f69
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5966.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 09:20:19.9974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1W4IpdqiuxRy6p5AjNPnjr4df1q7Y4bzRZspHQu+t9o/WpNH/CIk6/CZf7pij9i6aa+Embe6SNRgKVPREf+2uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5818

Hi Ilpo,


On 7/23/2025 12:40 PM, Ilpo Järvinen wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> On Wed, 23 Jul 2025, Suma Hegde wrote:
>
>> If all sockets are not probed, invoking hsmp_send_message() might result in
>> unexpected behavior due to accessing an uninitialized socket structure.
>>
>> The initialization of the sock structure can be confirmed if sock->dev
>> is initialized.
>>
>> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
>> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
>> ---
>> Changes since v1:
>> New patch to address the partial probe/removal issue.
>>
>>   drivers/platform/x86/amd/hsmp/acpi.c | 4 ++++
>>   drivers/platform/x86/amd/hsmp/hsmp.c | 3 +++
>>   2 files changed, 7 insertions(+)
>>
>> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
>> index 15c4cedc2759..a2d91d4a3e02 100644
>> --- a/drivers/platform/x86/amd/hsmp/acpi.c
>> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
>> @@ -617,6 +617,10 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
>>
>>   static void hsmp_acpi_remove(struct platform_device *pdev)
>>   {
>> +     struct hsmp_socket *sock = dev_get_drvdata(&pdev->dev);
>> +
>> +     sock->dev = NULL;
>> +
>>        guard(mutex)(&hsmp_lock);
>>        /*
>>         * We register only one misc_device even on multi-socket system.
>> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
>> index e05d824045d6..a4420db42781 100644
>> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
>> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
>> @@ -219,6 +219,9 @@ int hsmp_send_message(struct hsmp_message *msg)
>>                return -ENODEV;
>>        sock = &hsmp_pdev.sock[msg->sock_ind];
>>
>> +     if (!sock->dev)
>> +             return -ENODEV;
>> +
>>        ret = down_interruptible(&sock->hsmp_sem);
>>        if (ret < 0)
>>                return ret;
> This is still racy. AFAICT, nothing prevents assigning NULL into sock->dev
> because of remove while hsmp_send_message() is running and that can result
> in dereferencing NULL.

Could you please suggest on how to resolve this issue?


> --
>   i.


Thanks and Regards,

Suma


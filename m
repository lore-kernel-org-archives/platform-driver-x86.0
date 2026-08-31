Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012024.outbound.protection.outlook.com [52.101.43.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF3F39150B;
	Mon, 31 Aug 2026 18:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788202406; cv=fail; b=WBVHEZ/Nas10um/dq/vbOoHfvRAxzPoUW/exqkKMW4diTZivEvhr47GYml9vMJ7fE0ww7Ev4VdRJ4Ioc34nh8u+Gs7bC7XBHTzISX/rbfwFxuwdUAAoq5/qFAE9uvyFT7gLQl1agz/ll9uZIbCDT5XdzxHVKOn7aH5CMcpfgeCU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788202406; c=relaxed/simple;
	bh=NKgQECA2ax5YXB2qlg2nBVyzz+3USnUu4xt5nduoDtM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=h96OG9mN13tMHJVOWCyTIGDJGJhRHLBBacIu3mnTW0npbeNuQwYH+W7MlSHES70X6Sf3UxoXmGa8uymdf0okLUQkw+gnTHRtNRLb/uyqR2lE63Pb6sQuMkjwSg7Zqy73VLzGStzZFTYjuI69LHL79cAcCFrlHLQKKVCoM2J1EqI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ql7ikaO/; arc=fail smtp.client-ip=52.101.43.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ql7ikaO/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dsU9YhiUc4mtKQ+rP9ks0gB2ZLP/Xpd/1kydYe7flEYsVxBQfriUaECYaTd9PnD11pDzOIBSnkoDp52y0rIsQEra6xpIIZ6CTWEPsoKezxHbVVEbkoyDDwsPuiZZ6hvJlktSiSXpdDH4QnTpk26JUQyav6UL2tn94F1u7ApwA1Nxee2rEn/WH7edK4lWO1Rszi/1AukCyas1w9Mw9vrFwg5uGqPt9xk5yE2V23PBhehYXGOCaA0CZ9RaVAldr/sUYr8sjp+OswLh6qKDCBBLyyWWSufZp1XaAOLni6scr7bYcqMOivvMY4M/5HHvN28cCB/mJJ8qsCxFiRQ2IoHFUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4sQIHJ5ni9IUOmnqW6kh4vn/slblUcQOEmp3hSMSxpk=;
 b=qCYL09y5YEpSQVvYxP/MdWvk0iW2RXrJx3Rwwwhgk2/pRzul0wg5JFnk101yASc2lso6wsm53+3LB85VjphXE4DwKi2h8qzmz1I7AWhEK7mvX5VTRjTQu9mXjeuXx/kkYpa4n+8I5Nyz/2Ihv9w8AbRpWqg3PWnk8im5lGpaXnxcmhrwh08sYC4mwppaIGvLxjHjFezSphWzgSiPaofzkh+2xmMplyFeeDWMXJUVhOD7trqe+V26gvnW1FGrKGl7KG1kk7QtUsgPoTnQ6AV6VcIC7vnyeqsuX+NMz7dw3rLvLJVg9y66s/SIGt/1WU8sIngbLkU/7WzTzCMjtZvZLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4sQIHJ5ni9IUOmnqW6kh4vn/slblUcQOEmp3hSMSxpk=;
 b=ql7ikaO/fX/PNo46Zm5EyoJx+kngIXSqU3I+cyxa6zTcVxIJUoCudZ4fPoLD0NiHub9K/ZgqhvMdOG/9Nfwx7/YbPIX1WwcHQrfEwR1XgPyzGDB9v6+8Bkk3Q5gAmwuhM/LHYVcX+j8jWCpNiDulqtqXRdxtX5rHhJSvh4g0k1A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB6914.namprd12.prod.outlook.com (2603:10b6:510:1cb::21)
 by CY8PR12MB7121.namprd12.prod.outlook.com (2603:10b6:930:62::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 18:53:20 +0000
Received: from PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000]) by PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000%7]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 18:53:20 +0000
Message-ID: <b8510d6e-4303-4698-a056-9f12cb859bc9@amd.com>
Date: Mon, 31 Aug 2026 13:53:18 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: Cache-aware scheduling does not work well with amd big/little
 cores
Content-Language: en-US
To: Klaus Kusche <klaus.kusche@computerix.info>,
 Tim Chen <tim.c.chen@linux.intel.com>, "Chen, Yu C" <yu.c.chen@intel.com>
Cc: "Badole, Vishal" <Vishal.Badole@amd.com>,
 Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
 platform-driver-x86@vger.kernel.org, K Prateek Nayak
 <KPrateek.Nayak@amd.com>, ricardo.neri@intel.com
References: <2180ea5a-eb28-4152-8d4d-cd00b0c24b2e@computerix.info>
 <8064e1d8-b51c-48e5-a312-8c31581991f5@amd.com>
 <b475039b-defe-46e7-ab85-46e3196da667@intel.com>
 <369d0bbb-db7a-4f86-bee2-332d5295c452@computerix.info>
 <406a5c407bbe60cafc24f715e089f5552a0791f9.camel@linux.intel.com>
 <3a8985e1-77b4-4127-af0a-ec1c397eb1ad@computerix.info>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <3a8985e1-77b4-4127-af0a-ec1c397eb1ad@computerix.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR13CA0164.namprd13.prod.outlook.com
 (2603:10b6:806:28::19) To PH8PR12MB6914.namprd12.prod.outlook.com
 (2603:10b6:510:1cb::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB6914:EE_|CY8PR12MB7121:EE_
X-MS-Office365-Filtering-Correlation-Id: bf24ebd6-80ed-472f-5399-08df07912060
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|10067099003|56012099006|4143699003|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	gZMGLGd2waRuCpJbDoEG7Y7K/KhcieElLvFTPy0xlHJlbGA1TWV8bTUgjSXw3R9snggLLJpUQ7hFOu8IAffcBdlutSVj+ExE7kOhsGOQIvBUm/envB7QJOh33UaXcZ3fOzamcjIaj/66qP0DT/IeyqV1AQvNkiZVB4t2sFN6+mye7KalYY584aAo3YIOfCCjzA9Dl317ZzivEgmOeSxoGazRoP/uBMWnwBE75HMi6GkLWafRglIFTMw/yCQ9jZcpK/YdZNAAR8Ft1YtjFsxK3IWb9I5TTEWA4frjJBcw7jK1BT2aduzsowzZDOIzLtjGiIX6SRqHSTrDww6uQQMVtKGhTeOfLrOXB5MMssxGZOdtOZoEV/6HZzoGw0t64E5ByZUmwvezaDqAVKg+JixRyiBYgBdMFYoXk05jYkHnQqckKDqy7WU+ZTbfeoMsYtg6EUQoQ+Sv/6NHfn+5xkZtWUDTXBeoHfynto7VLFb5QDRJoQYcaa5nbRv/0Bj3iLFX23dZLQq+yKvCXnwOdbAH3+8ZV5Wmch9CEkzo5FdRQCcUQSMCsAT6MZ4OhUHW6FqKWl0ojDSaFgPS8IZqaceYKCwy5IoStazxQ2ml9NUjq7axIJRuraMOACXf3REQODatuoPPvwT0dUuLPhDd4e54qVUH2kHJoWgJu21ehHKowKg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB6914.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(10067099003)(56012099006)(4143699003)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RDArUnM4MjBYV1d0MUh5UFZWWFlIaCtMWE5OUWlvQ2dWSnRCNEJUOHd3MmZ1?=
 =?utf-8?B?dUl4d0RoeW80YldVVkdDS3hMWkxkQ2xXeDJsbDQxdDllODAzTTVzSSsxcG9t?=
 =?utf-8?B?bDdIU2xYWHFaZWhyWnpxd2hodERjOXNoMUtpdWxDbGI4SEh4RDJ5eTNPOW8r?=
 =?utf-8?B?Y2NoT2gwSVNpSHJucTl6bkJEci9uZmtFWk11M3ZtTWFGZzkyZEVLRWQ0OGFJ?=
 =?utf-8?B?cEoxMEEzYlNESlI4dUdJNTMvTE9wWjFweUdPalFKeHBoT09DbmdmQ1Bqd21K?=
 =?utf-8?B?ejFDQ215UlB0UTdiaUFycTY5cVZwWlh1MHBvSDFSdTFWWndjWVNtMmdlUE5L?=
 =?utf-8?B?MXlPVlM5MjdNQkYwME41RHorUUx3ZmdFQjk2emFseHVGZVVoMUZkczJHUjZ4?=
 =?utf-8?B?SlIzM1B4SXpReENFTitaOXJDaStVQzdJNk1uNGJLZkk5bWFrWStrRXRIWVMx?=
 =?utf-8?B?RXZLQzFTS3Ezb1prSVZGY2J5Y1lpaHB5VnFZQmE4MEdYSmhLOXRhUG9QNjBs?=
 =?utf-8?B?M0U1WHlBeWZNMnhxQ3VhNHdPK0xpeXUwMmVUd0U2MDNNQjQza0FaMEN5K1F3?=
 =?utf-8?B?WFZMMWFlMkhaL3NiSENncVV1QkQyTDVDWmd1TktNQ0ppUXVEODI0bEFsMEdv?=
 =?utf-8?B?WGlwbjFaY0JRbDBYVnhGRVFINTByQ2pxVDNaMG55bXFjcUJUZnBpNTQ4UWgx?=
 =?utf-8?B?d0xCQzBmcWViS0Qyc1NvMkdsQlB3MUtjRnB0dUlyQjh6UUlIb2xJNW9DbXN3?=
 =?utf-8?B?VExDZE1zSFdKd3B4SndCb2pMbk9ISlZsWHJneDdjblBQY2xqeXFBK3RGYjNp?=
 =?utf-8?B?SzVCb1RFdUpmTytXWUlBYkNWNFdqcTNncVorckpkcldpSFhsMk9uVXB2ellM?=
 =?utf-8?B?U1pjQnZvWUs2ckEzWjEwb2YvcE12N2pFaGVUSXBOaUJrRi9sWXU0dVpJNmlM?=
 =?utf-8?B?ZnF5SHZsUzJXR1d1RGNMenIzQlZHQnlPY2wxc1hrUDVOc1BKb05RUHFCa2c0?=
 =?utf-8?B?UnNhUnR0NTJ0Y2dhNzVMWVBneG1kTGNrVlRTWDJjWmg0MzRkaGxUc3Nxd2lJ?=
 =?utf-8?B?b1I3dEZJUm9YZFVROFZjTDV5T0pJMGNNZUJPNS9OYUZxajEySnduMERwaitY?=
 =?utf-8?B?bFRVYUZCRmhkOEY5WkJwcHlHdVVaUDVNbVdvdVR2U2Y3VkFRN3VvT2hTdkhF?=
 =?utf-8?B?ZDlkbXVuM2hRdlU3aG9BVGpEZ3NFSldZbllBL3VKNUVVbXF0NFg5aXdXbVAv?=
 =?utf-8?B?clpmYjRVczhqRGRoOXBFelBUbHlQQWhjTnpKSmFWcDNyNlNtRHMzeWQ1N3VX?=
 =?utf-8?B?Q0cyS2V0bXQ1dlVJVlJqNi9tMFRKZStDVlRNa3MwcEtveXdGTUNWWVJQcm1k?=
 =?utf-8?B?Q1A4RWdBcldkbzFzUnVoNmJxVHZud0QzRDI5WE45M1diN2hRT00vTWdGNzlj?=
 =?utf-8?B?UnRKd1ZVbWQwRTcwTTIwdG1nRHZPNk41Y21VSDR0VjlVdTl2NDVYZlNQZEhp?=
 =?utf-8?B?SjUzU3JPRmhSOG5hYmJocTRkUW54RG4xYjFwOXlSZ2Y3MVY5WnRwL0hMaStu?=
 =?utf-8?B?a3U4T1NuUTdiZ0FVMjVSSytKMjNMSnhvUkZCUGFVYytzSXdZVi9zLytGYzRS?=
 =?utf-8?B?aXhEV1BFTVZJTURxVDNzMDRUK21XbnFrbEorVFFiVWdwRTNsSlRHRHhtSm5t?=
 =?utf-8?B?c1NWYVJ3UlE5bytxRW5seGtONUdLMStEQ3Q1eDVwWUdSSUdiL3lTNTBxdW5U?=
 =?utf-8?B?ZmYzU0NlK1hmSmgxWXorLyt1SmVHWkw5YlZlbTZTWmtzVXBJNVJTNk4zTEgw?=
 =?utf-8?B?NFQ2Z3YwOTVEYmhmcFlUVHJlTUFzbVJVMHdOYUhXV0k5S0tRWHlPQ1ptaEhF?=
 =?utf-8?B?UisvQ0YzSTBHQ2JkQmRTRjlZanVqcnNGNDB2SzM0R3oxSU1OWVBEaGM5WmRj?=
 =?utf-8?B?QkdIbzB4NHBtMjFaQ3ZacUZDMWJuS1dVS0tiakdETVRFWk5lRlZSYkFiNmM5?=
 =?utf-8?B?WjZ1Yi9zZStyNnJkS1lJUDdQUUZtT0RRVzlIS1c5VXoweEJveEVSUjBSN2NW?=
 =?utf-8?B?MWx5K2o5aXp3NDdaNXpmZnF3NU1hb2dUYk1XSXVWbG42OEoxdnlqUVNUY1dH?=
 =?utf-8?B?K1N5UVdSSjIzeHlNQlhscGZRd0FvSW1hSE5Sc212M2tkakZ1bnhLUFNrUlR1?=
 =?utf-8?B?cElRTmtKSmtFRHNiNDh4Rm1Fam5LWWsySjB4dTFGUUF3bWF3MkpMajhZaU0v?=
 =?utf-8?B?Z1NkdG9SbHpqQVpTNEplMWMyVzZBdjhNUFRXaDB0djNiNmE3V09YdFpsSU80?=
 =?utf-8?B?QVNvRUpvQ3lXSXJuTUs2OGU3bmx1aGVQVllXUEFhQVAveGxxeEoyUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf24ebd6-80ed-472f-5399-08df07912060
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6914.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 18:53:20.6007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5zQbpqgH3mu3H8NB/FCdTjbZtGCBZiXtZKNGZKW7IFJVmDA+iRN6nCoxVWO9rxYYXg5qM2ZKO8NvrxMBKVw0FQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7121



On 8/31/26 13:49, Klaus Kusche wrote:
> 
> This would need some more testing efforts,
> because all my kernels are built without debugfs
> (using an earlier version of Mario's patch),
> and without Mario's patch and without debugfs,
> I don't get any big/little scheduling at all.
> So I'd need to build and test with debugfs
> (tomorrow I'm on a mountain tour, perhaps later this week).
> 
The debugfs patch doesn't really add anything tangible.  I'd say tests 
with that and debugfs turned off are just as valid as tests with no 
patch and debugfs turned on.

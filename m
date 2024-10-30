Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2072.outbound.protection.outlook.com [40.107.243.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EAB433D5
	for <platform-driver-x86@vger.kernel.org>; Wed, 30 Oct 2024 16:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730305418; cv=fail; b=l6670g78Dk9Q/hM982Al/7tiusco39VbzCqoR/bTNXkSvwGIGw5ZGHaAHFuJ1ydmifZwxuVepwt6qumD6bZFl8F8KaA635HkXgLtZJd4X42Py+9sLEPPz5fByQBBNWNT9SS0PFILG0ALloY72wNIUoBhgTfXK+jTEK4AeA8pLtw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730305418; c=relaxed/simple;
	bh=0Hdbi8Z9FVAuHCYZz5EN5IaTwMkH+T6sFUDIL95c5CE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZbivuN244TlQN2YRh83MUhg71tuY67/Cv7NlUzQW/dIfrtsrqN1ON4gHZM99H8L9ty34upGPxB6WnmIt9TuoiuwOTe4F55nPQ7rLzOYdygyBikP1b9liA7vO/A27XxA+H5dPOy2T9knVO0Ja19EeiLSFKcJIZBl/0L9My6Xcqo4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=S5NzZSbB; arc=fail smtp.client-ip=40.107.243.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="S5NzZSbB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TvhMJoFYImpnBo8zgw7PkODIaSf+nPGBQmiQPo/ALKc9Vm9/5VeK6XwixCm/cz2HHMvNKPXOxmtXuBYj4CYdWQbvx7GuojtzwoDasnGW2m09Y8oRtNAIlg4OUVaedy2tdhPVmvoZ1ARcIZf9t83fxqE2T2ZEHZftsRIx9NBllZyj1F80Zbak1VYYa9BpRP24fA0asegymrM6fuA6agZxVWyf/fPQAAeZcDqCk8jzALyDKCbTyqfBFixsX92isxSGC2J2uKBXjPY0LBrqrXSXC8dg+2qG5hz5HDvttnzGKImtuQHEA9f+8U3IUoGOU5p4xVDMlHLMVgQGIFYlOkZ3LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yuS62Rnuax1pbaUHaz1S3dgOoGi0OfFOWGFuW0DnLx8=;
 b=vlXI4yDA8iK/5NNmFiom2ol7xWKHF0ZsuCt8yKxaGDIn+Kpl7vzyu0S57ZR4V29O3ubaxC35uvgU61/Kkqyau7m2XCfzqxmkgxKhUHaGELxX181pzGNFQcT1VX2huxcJYfGdeCAALr3JKxgUuzoVe4ZvzxvJ8T1De3Xk2xZfoDp9c1EtQ4ycQDvo91aYm03Fn4ZrNyo2vqjwE8gd6m6FKrg34w0qkxouW1eEkY+LnER3+i78kMdaKT6rKr6m2OLOWF2+VIQ2BRi4ndIzG8HdjVTvwPeBq5fZWxlDGDMQRpzjoYt6CZM+MF1BO7WAZKUBIHXbb3FkFCYZAbcG+rCQkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yuS62Rnuax1pbaUHaz1S3dgOoGi0OfFOWGFuW0DnLx8=;
 b=S5NzZSbBsrXNal8Vaj1TMMdIBOrMZpD1ORLiN8ZpFvhiBxA5NI6BQKcOZYrnLJkmschnmMI4EQ14OLlDhsfWjlc8X6By+4H+Jlty6lEDvYRr3cid9FS+Pu/rm1mFZcn3E/TBbbsOXO5T70Big3hDcVvN2+DIjKm96gfthmP7+dM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by PH7PR12MB7914.namprd12.prod.outlook.com (2603:10b6:510:27d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.23; Wed, 30 Oct
 2024 16:23:32 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%5]) with mapi id 15.20.8114.015; Wed, 30 Oct 2024
 16:23:32 +0000
Message-ID: <4060a47d-c05c-4b6c-b508-f3ae96a3829f@amd.com>
Date: Wed, 30 Oct 2024 21:53:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] platform/x86/amd/pmf: Add PMF driver changes to
 make compatible with PMF-TA
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20241023063245.1404420-1-Shyam-sundar.S-k@amd.com>
 <20241023063245.1404420-6-Shyam-sundar.S-k@amd.com>
 <733dbf68-a1a7-43d8-acc2-7f1b8d222427@amd.com>
 <84fe3b9b-cf98-4f49-ae2b-ec1a8759af4f@amd.com>
 <02bf47e4-f39e-4799-bda4-5a65e7f948f2@amd.com>
 <41d66544-6b49-4f22-8c1c-38f14ca47fbd@amd.com>
 <9260af45-4c7a-4e8e-8ab4-16b83ed51ee9@amd.com>
 <02a2c321-33f9-4bcd-9507-3b0788acc287@amd.com>
 <e1502166-88db-4900-8f2d-ef9adfab42d1@amd.com>
 <d7b8d58b-be23-179e-0618-9bcfc54b8d0b@linux.intel.com>
 <63ac59dd-a33b-4bc8-b35c-7bf9329351b7@redhat.com>
 <26109281-38a2-4166-b65d-b52dddceb542@amd.com>
 <0b1094af-fcf3-4df6-a8b7-9c05c3e20fd5@amd.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <0b1094af-fcf3-4df6-a8b7-9c05c3e20fd5@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0201.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e9::13) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|PH7PR12MB7914:EE_
X-MS-Office365-Filtering-Correlation-Id: 08d82446-962e-4c68-8bda-08dcf8ff320f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z0trUk9XaUlqSjdKcW1ZWWtXRFdzMk9wdExubUtkbUswTEVwakhHSklLNGxa?=
 =?utf-8?B?R3VjOVFtR0ZybFNDZXpkN3ZhUHlwVmhvbFFGKzVqNzU2NVhPUkVrZGRhK1o5?=
 =?utf-8?B?bzAxNDEvcmU4Q3NCYkNBa3Z3UWFia1B6NER2OXVTNnBXTVV2M2JrK1VOSmFM?=
 =?utf-8?B?Q3dNdll2WklTU3c4THlQYmFPYVdYMUxubW1yMUg3OVFsNFg2OVVFZFREelp1?=
 =?utf-8?B?WWlZUzdOV3dCak01ZFZEY00rZmN5eVA0VkdIdjMyd1ZkcDFFbmtXWG1SWS9T?=
 =?utf-8?B?TXJoWHd4K25ocXpES055TkdjTzdPaHlzYzBKOEc4d1FrRXMwakcyZmpSb0JW?=
 =?utf-8?B?aWsxNWRXa3R3c1pWOCtqUkR6UlJuai9xK1Z1QVNYSDRIYmZiOWNPMHdZQ044?=
 =?utf-8?B?MTg0Rm1XQUdsMysxZEJSSlluTTlZd3lIS3V1Nm91dGNtZW9tcnh6aVZHN1lw?=
 =?utf-8?B?YVY2bzhGWjQ0QUVZa2ZMT2RDWEw0bmt3WnZDM0FVK0xDSnhtSjJrRjJtYTF4?=
 =?utf-8?B?Z1FjSjdjUmo2S3ByUW4rSnI1Z3FYYUlscXM3dUVSY0hGSDRpOXc2VUNOM1Bo?=
 =?utf-8?B?Nmk0dE93VFZpL2FPbVVvMDJTQTB6SkJlV2o3dnRuZy83NUZvYXR0cjR0ZUtV?=
 =?utf-8?B?RUxBVjRGR3BLdG1aOHlBZ3ZnemdzVzJYZ2tqcDhCejdmeDQxem44RFNvSk1p?=
 =?utf-8?B?dXoyLzYwRHNSdlRQUGF6Z2VxSndMc0w2QUc2Z1VOdEt3VU10REQwa3ZLSnAv?=
 =?utf-8?B?QWdVVzJ5UUtVdG1XazZlc2F1VkF1Tit4QlY0dE1uUHR3eEJKRk1pTVBkRTJi?=
 =?utf-8?B?cGVxUm5WZmtDU1FhUWZ4MFhFbmxYSzQzTTNZYzNXVkF4OXZ0bEZnSS9JNDBM?=
 =?utf-8?B?aWhFMGRldGt6UVhqOXNmaGY4ODlqdVlSSkRQb3VPWVp6QTdZWm1Tc0NRMTNu?=
 =?utf-8?B?WVg4aCtqaWNMU2Y1dk1RK2FKSVJHdTQyZWQzQ055bEY5N2tvNXN0eGI3cG43?=
 =?utf-8?B?RGY2azB2VmlUdER2dW1JRytqalJwL2JwbzBFUnJoNUNhYXVCbDE3azhXdnNn?=
 =?utf-8?B?SlRpRHhmVzM0WHNJRFA3ZERnd2NRUXNOMEQrYjdwTXdWeG94MjhnRUJkUVVF?=
 =?utf-8?B?LzNzMnZSaStVWmJXQzZyWkVDZDcycFliUWxxY29lZ1FlTmdsd0pKRHVkOTM4?=
 =?utf-8?B?cC9iSWtlSmtpUm5UdDUrTGVDc1FTVTZrS0YyK3JoWnVyeThXdnZxVEY2UHlS?=
 =?utf-8?B?dG5VenhhWFR0UjFscEhpd0xxRlcyR1BTUlQrTnU2QjlVQnpzdldKSTVjL1oy?=
 =?utf-8?B?blpvekU2bUFBTWZhT2xYczFUMkpXY2lpKytYRG5wNzlybnF5SzBlZUtXblNq?=
 =?utf-8?B?cCtIc05UdkEzZVo2YUVOazlHTEJPbVl1YmMyMy9XTm55K0hUWmQ2UXFjM1Jm?=
 =?utf-8?B?M2pDbjNKQ2RFMmtUQUFzTWtyZEZUZWRTRTQwTGJCWVhrNyt2NytUclZTU3Qy?=
 =?utf-8?B?SnpBYUFUeWxBdTVYY2pjT3FnMWVFam52ZVNZK2tDWlpxOXhTV1VvRGJyc3M1?=
 =?utf-8?B?c1BJTjBNeWFJSk5ZWWc4UEJuTzVZZDZjUnRXSTN2TnBDOGNUVTJtUmRhVXNO?=
 =?utf-8?B?ZmlYT2ZQVDQ1K0t0SUZaempQQzhSd2x3QWpmWUx2MFRtQmtrU1lvcm1QUmVr?=
 =?utf-8?B?T3pIN2tZb3ZtT01UVjdiOVRPSzB6cTdsMGRBdVNJYmpyUSs4WFVwU1p2aEtY?=
 =?utf-8?Q?l3sBGsF4q+T8lBF9wGeFtp/e5afJINPH5FAdyd2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3c4NHQwU21iUnhYSmwramNyL1NnY3F1Uk12NEFYSk9MbDFrY3drSFVJUitH?=
 =?utf-8?B?UlpBZnN2OWhyMUExRVByNmFYRG9mOHN2YnJlNFhuQ2tkYUVBd3hVa1NXc1Y4?=
 =?utf-8?B?RkhPQmVKaXZGMzRoUXhFMFVBc1JBclphNFJyV1VyeXdyeWVzQ1JsOHludkpS?=
 =?utf-8?B?RDlvUVVvMjdhWStRSW1ReWNPc2JRajVLcmovRTVVdi9SeTY5ZFhXZ00wSFla?=
 =?utf-8?B?WjJnWWJXUW5GYWhGQlNPdjRrSkRuUklPRW5TaG92aUJuS05WMFNOdThrVGdq?=
 =?utf-8?B?OVZEMWVFU2lXQjFiaUwzS3RyTTJHL0grL2R3QnBHYVJVak9rODB5UXlzdlAx?=
 =?utf-8?B?dnJUY2lqOXJCL1dPQW1zWUF6OElCYXVVdWRLUkdKdHlIcVIyVU9FOWNhdWZK?=
 =?utf-8?B?dUVtWStCdWJ2UklkemRnSGtGK0RRcUh2L0dSN0VCeFZTU244TldpRnZuSjl3?=
 =?utf-8?B?cTkrU1BXbUExUVdZZFQ2dElVTXlOdUFkZXNldExUc1lMSWx0Q20rakpZNTl3?=
 =?utf-8?B?WCt2VzgwSW5GZ092clByVUNta1hpZ0pBTTZyYzJDK1JvVTBxbVVHc2swdlM2?=
 =?utf-8?B?Rmp2T1FaUUIxeGtkUVIwL0lMQWh6MkNUOXE4QjBtcHl3MXF6Q0J5UEE3eTBG?=
 =?utf-8?B?ZnRYalErRWdvSFJUemhwZWdJMGVkWlFrVkJrZTFqN0lxT2ZwNkxlNmloekpu?=
 =?utf-8?B?RFVSVi9RbXVud2hIQlZ5NWpBQTdsNlhmUzVDbnArUG1mbzh5MzZrMWF6aFJu?=
 =?utf-8?B?dTFNa2xHQy9WbENsbHNiUkJUQmVzdzRZbVM3bExQazB1WkxFbTUvY3psMG1B?=
 =?utf-8?B?MkQzczI2NUVMYVZ2eVRJZFBNZ3l1QktZckVnalN4NWdMVUEyT0lmd1NaK2xa?=
 =?utf-8?B?MXBsSVIvNUwrN3d2bmNUd3ZER2M4aSthbzdHQUMrbFYzRThqa0pOR0JRb1pZ?=
 =?utf-8?B?ZUo4c1daTkJ0bEJwUmZRL1ovMlAvSzYxTDR2TGdTV2ZWamVLbm85SXNRajh4?=
 =?utf-8?B?U1pSMHppNDcvcExvd0g4MG5RWFVvYTNFcHllZExSeTVWd2IzaXcrYUVlWEJ2?=
 =?utf-8?B?R2ttVUlJUDhBalJHMlozeDF4RkZVbmlSd2VlVmVOZTJsUm5KaER5dE8zWmRX?=
 =?utf-8?B?SHFRYVdrT3NGQzQ2c3EwQVlOMzYyUWxWYlpIakFPY25Yd0pYemxuOHNVZlNS?=
 =?utf-8?B?bWxSK0o5Z3BjaU4ydTNpSU9rMG1CS1Z0aElyN2grbE12MjBRMHhId0QyQllW?=
 =?utf-8?B?QTNobG40RmlKdHU3aHh1aFltZlJydjFSOVdHbys4SWlyMWNmZGg2S1BoMjFU?=
 =?utf-8?B?NG1TNk9ZVENCVjBSbkhYU09XbjN4M1oyQlRqRnFZZWNjais1eVM1WU5jZlJj?=
 =?utf-8?B?eEdKTHdJaHhJd1kvSEtCelNNdlZUWlpnTTJpUHp3OFE3bWtYS3hxMGJ2bFVC?=
 =?utf-8?B?ZjFBeTJObVRVc3JPa2k1bUpleGtDS2tHR0xpcm40cjFpeHdMd3ZaK1dJWGdm?=
 =?utf-8?B?STRrWHJTbExvNlFMcllDNFRDazIwZ1JzT0N6VVJNMHN4T1lTV0RMd0dkZnVQ?=
 =?utf-8?B?N2k0bjBrNXVLNmJWZHZYZ3oxd3dKNVh4ZHZLQ3NZK21uaVlDT1paMVloTnFD?=
 =?utf-8?B?UFRKKzFhc05MTG1SUVZQakt0M2t4U0lCZUtZY1VxOGpjNEZvZ25SckJQQ1Vr?=
 =?utf-8?B?OXpiUjJmV055Q2R4aFVKQWg5Z0NXUVVJbnEzUnVwZGRCbjJ0aS9xc1ZWbnBw?=
 =?utf-8?B?bmdoWFM0QllwbHVvQ0gvQ2hRb2N4Ky9wdjNaaHlXbkk0c0VtaGxWcndGT2VN?=
 =?utf-8?B?eGR1cEdYWEVFdktJVElycG8zLzRZT2p6RldtT2VNMERuN0FLeExoelNWNG4r?=
 =?utf-8?B?cUIwMTV0NWkzRzNOUTIyTVNnLzEzMnVBVmdzeG9jWk9JRThUUDY0UjNIbTBZ?=
 =?utf-8?B?cFk5ekNXRHhGakwvSjlYUklQcURXQ2NGelZGbXErSjhuSlVuV08yekkweURO?=
 =?utf-8?B?LzF2Y0pzbkx0QlpDYmx2WlpmVUl5Si9YQkQ0Q2Z4LzNkK3VyWTZXdVlOZGNJ?=
 =?utf-8?B?OERGYXBQVnBpb3BGVGhhQkhxeWpkWm5hR1lVbUp1dHlwcWVmUUMrSUduVHRH?=
 =?utf-8?Q?QI4dtjdUP+ym3aj+e6mVPdy8V?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08d82446-962e-4c68-8bda-08dcf8ff320f
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 16:23:32.3036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zTuyFqPC/C6hx3CNilSU111kVmbCDW9lIUlm6rzgvhzW3VI6hY8GcJ+71JgvcIm6TGqPz3PImyn2tqJr5O267A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7914



On 10/30/2024 21:38, Mario Limonciello wrote:
> On 10/30/2024 11:03, Shyam Sundar S K wrote:
>> Hi,
>>
>> On 10/30/2024 19:30, Hans de Goede wrote:
>>> Hi,
>>>
>>> On 29-Oct-24 3:07 PM, Ilpo Järvinen wrote:
>>>> Hi Hens,
>>>>
>>>> There a question / item needing your input below.
>>>>
>>>> On Wed, 23 Oct 2024, Mario Limonciello wrote:
>>>>> On 10/23/2024 10:52, Shyam Sundar S K wrote:
>>>>>> On 10/23/2024 21:10, Mario Limonciello wrote:
>>>>>>> On 10/23/2024 10:32, Shyam Sundar S K wrote:
>>>>>>>> On 10/23/2024 20:04, Mario Limonciello wrote:
>>>>>>>>> On 10/23/2024 09:29, Shyam Sundar S K wrote:
>>>>>>>>>> On 10/23/2024 19:41, Mario Limonciello wrote:
>>>>>>>>>>> On 10/23/2024 01:32, Shyam Sundar S K wrote:
>>>>>>>>>>>> The PMF driver will allocate shared buffer memory using the
>>>>>>>>>>>> tee_shm_alloc_kernel_buf(). This allocated memory is
>>>>>>>>>>>> located in
>>>>>>>>>>>> the
>>>>>>>>>>>> secure world and is used for communication with the PMF-TA.
>>>>>>>>>>>>
>>>>>>>>>>>> The latest PMF-TA version introduces new structures with OEM
>>>>>>>>>>>> debug
>>>>>>>>>>>> information and additional policy input conditions for
>>>>>>>>>>>> evaluating the
>>>>>>>>>>>> policy binary. Consequently, the shared memory size must be
>>>>>>>>>>>> increased to
>>>>>>>>>>>> ensure compatibility between the PMF driver and the updated
>>>>>>>>>>>> PMF-TA.
>>>>>>>>>>>>
>>>>>>>>>>>> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>>>>>>>>>>>> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>>>>>>>>>>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>>>>>>>>>>
>>>>>>>>>>> How does this present to a user?  From what you describe it
>>>>>>>>>>> seems
>>>>>>>>>>> to
>>>>>>>>>>> me like this means a new TA will fail on older kernel in
>>>>>>>>>>> some way.
>>>>>>>>>>
>>>>>>>>>> Newer TA will not fail on older systems. This change is just
>>>>>>>>>> about
>>>>>>>>>> the
>>>>>>>>>> increase in TA reserved memory that is presented as "shared
>>>>>>>>>> memory",
>>>>>>>>>> as TA needs the additional memory for its own debug data
>>>>>>>>>> structures.
>>>>>>>>>
>>>>>>>>> Thx for comments. But so if you use new TA with older kernel
>>>>>>>>> driver,
>>>>>>>>> what will happen?  Can TA do a buffer overrun because the
>>>>>>>>> presented
>>>>>>>>> shared memory was too small?
>>>>>>>>>
>>>>>>>>
>>>>>>>> New TA will fail on older kernel and hence this change will be
>>>>>>>> required for new TA to work.
>>>>>>>
>>>>>>> OK, that's what I was worried about.
>>>>>>>
>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>     From user standpoint, always be on latest FW,
>>>>>>>>>> irrespective of the
>>>>>>>>>> platform. At this point in time, I don't see a need for FW
>>>>>>>>>> versioning
>>>>>>>>>> name (in the future, if there is a need for having a limited
>>>>>>>>>> support
>>>>>>>>>> to older platforms, we can carve out a logic to do versioning
>>>>>>>>>> stuff).
>>>>>>>>>
>>>>>>>>> I wish we could enforce this, but In the Linux world there is an
>>>>>>>>> expectation that these two trains don't need to arrive at
>>>>>>>>> station at
>>>>>>>>> the same time.
>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>> Some ideas:
>>>>>>>>>>>
>>>>>>>>>>> 1) Should there be header version check on the TA and
>>>>>>>>>>> dynamically
>>>>>>>>>>> allocate the structure size based on the version of the F/W?
>>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> This can be done, when the TA versioning upgrade happens,
>>>>>>>>>> like from
>>>>>>>>>> 1.3 to 1.4, apart from that there is no header stuff
>>>>>>>>>> association.
>>>>>>>>>>
>>>>>>>>>>> 2) Or is there a command to the TA that can query the expected
>>>>>>>>>>> output
>>>>>>>>>>> size?
>>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> No, this is just the initial shared memory that the driver
>>>>>>>>>> allocates
>>>>>>>>>> to pass the inputs and the commands to TA.
>>>>>>>>>>
>>>>>>>>>>> 3) Or should the new TA filename be versioned, and the
>>>>>>>>>>> driver has
>>>>>>>>>>> a
>>>>>>>>>>> fallback policy?
>>>>>>>>>>>
>>>>>>>>>>> Whatever the outcome is; I think it's best that if possible
>>>>>>>>>>> this
>>>>>>>>>>> change goes back to stable to try to minimize regressions to
>>>>>>>>>>> users as
>>>>>>>>>>> distros update linux-firmware.  For example Fedora updates
>>>>>>>>>>> this
>>>>>>>>>>> monthly, but also tracks stable kernels.
>>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Advisory to distros should be to pick the latest PMF TA
>>>>>>>>>> (note that,
>>>>>>>>>> I
>>>>>>>>>> have not still submitted to new TA FW).
>>>>>>>>>
>>>>>>>>> Yeah we can advise distros to pick it up when upstreamed as
>>>>>>>>> long as
>>>>>>>>> there isn't tight dependency on this patch being present.
>>>>>>>>>
>>>>>>>>
>>>>>>>> That is the reason I am waiting for this change to land. Once
>>>>>>>> that is
>>>>>>>> done, I will submit the new TA, you can send out a advisory to
>>>>>>>> upgrade
>>>>>>>> the kernel or this change has to be back-ported to stable/oem
>>>>>>>> kernels
>>>>>>>> for their enablement.
>>>>>>>>
>>>>>>>> Makes sense?
>>>>>>>>
>>>>>>>
>>>>>>> I think we need Hans' and Ilpo's comments here to decide what
>>>>>>> to do.
>>>>>>>
>>>>>>
>>>>>> Sure.
>>>>>>
>>>>>>> I will say that when we had this happen in amdgpu for a breaking
>>>>>>> reason there was a new firmware binary filename
>>>>>>> created/upstreamed for
>>>>>>> the breaking version (IIRC foo.bin -> foo_1.bin) and amdgpu had to
>>>>>>> have fallback code so it could be compatible with either binary.
>>>>>>>
>>>>>>
>>>>>> True. In case of amdgpu, the FW loading is part of the amdgpu
>>>>>> driver.
>>>>>> But in case of PMF, the PMF TA gets picked from the AMD TEE driver
>>>>>> through the TEE commands.
>>>>>>
>>>>>> So, there is no need for FW versioning logic in PMF driver.
>>>>>>
>>>>>
>>>>> That's a very good point, and this is a lot of complexity then.
>>>>>
>>>>>>
>>>>>>> * If user on older kernel took newer linux-firmware package
>>>>>>> they used
>>>>>>> older binary.
>>>>>>> * If user on newer kernel took older linux-firmware package
>>>>>>> they used
>>>>>>> older binary.
>>>>>>> * If user on newer kernel took newer linux-firmware package
>>>>>>> they used
>>>>>>> newer binary.
>>>>>>>
>>>>>>> If the decision is this goes in "as is" it definitely needs to
>>>>>>> go back
>>>>>>> to stable kernels.
>>>>>>>
>>>>>>
>>>>>> IMHO, let's not put too many fallback mechanisms. The philosophy
>>>>>> should be use latest driver and latest FW that avoids a lot of
>>>>>> confusion and yeah for that to happen this change has to go to
>>>>>> stable.
>>>>>>
>>>>>> Thanks,
>>>>>> Shyam
>>>>>
>>>>> Of course Hans and Ilpo make the final call, but I think from our
>>>>> discussions
>>>>> here it would be ideal that patch 1 and patch 5 from this series
>>>>> go into 6.12
>>>>> and have stable tags, the rest would be 6.13 material.
>>>>
>>>> Distros and SW component management challenges are more in the
>>>> domain of
>>>> Hans' expertise so I'd prefer to hear his opinion on this.
>>>>
>>>> Personally I feel though that the commit message is not entirely
>>>> honest
>>>> on all the impact as is. The wordings are sounding quite innocent
>>>> while if
>>>> I infer the above right, an incorrect combination will cause a
>>>> non-gracious failure.
>>>
>>> There are basically 4 possible scenarios and to me it
>>> is only clear from this thread what will happen in 3 of
>>> the 4 scenarios :
>>>
>>> 1. Old TA fw, Old kernel (TA_OUTPUT_RESERVED_MEM=906) -> works
>>> 2. New TA fw, Old kernel (TA_OUTPUT_RESERVED_MEM=906) -> broken
>>> 3. Old TA fw, new kernel (TA_OUTPUT_RESERVED_MEM=922) -> ???
>>> 4. New TA fw, new kernel (TA_OUTPUT_RESERVED_MEM=922) -> works
>>>
>>> If the answer to 3 is: "works" then I agree that this patch
>>> should be submitted to Linus as a fix with Cc: stable ASAP
>>> and then once that has hit most stable series it should be
>>> ok to upgrade the fw in linux-firmware
>>>
>>
>> Short answer, "yes" it does not work for "3." and you can consider it
>> a broken.
>>
>>> Note this is still not ideal but IMHO it would be ok.
>>>
>>> But if the answer is "broken" then we will really need to
>>> find some way to unbreak this, which could be as simple
>>> as querying the fw-version and basing the size on this,
>>> but having a kernel change which will regress things for
>>> users who do not have the old firmware yet is simply
>>> not acceptable.
>>>
>>
>> I am not sure if there is a firmware versioning interface that the ASP
>> (AMD Security Processor) returns back the kernel/driver.
>  > The code path in this case is:
>>
>> AMD PMF driver -> AMD TEE driver -> AMD CCP driver -> ASP TEE -> ASP
>> TA -> ASP HW.
>>
>> So, I uncertain which module has this information and where exactly
>> the code of fw versioning has to reside. It will take a while for me
>> to dig this in.
> 
> As a solution to this, can amd-pmf explicitly do it's own
> request_firmware() call to load the firmware binary and determine the
> size to use in the array and then discard the loaded binary?
> 
> This would let the TEE module still do it's own load later like normal
> without having to plumb this information across subsystems.
> 

TEE driver feeds in a lot of metadata and the structure information
for PSP headers and I don't think just having a request_firmware()
will help.

Sidebar, TEE driver has a lot of plumbing that can be used decrypt the
policy binaries to debug issues related to TA load failures and policy
binary issues (basically the descriptors)

So we might end up in replicating a majority of TEE code into PMF
driver, which might not be a good design choice.

Let me first talk to internal folks to see if we can solve it by not
making complex changes.

Thanks,
Shyam


>>
>> Meanwhile, shall I drop this patch and resend the series (by
>> addressing the dev_dbg change Mario commented) so that this atleast
>> becomes a 6.13 material?
>> >
>> Thanks,
>> Shyam
>>
>>> Regards,
>>>
>>> Hans
>>>
>>>
>>>
>>>
> 

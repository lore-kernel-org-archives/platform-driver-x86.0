Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2046.outbound.protection.outlook.com [40.107.236.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BD933C9
	for <platform-driver-x86@vger.kernel.org>; Mon, 14 Oct 2024 06:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728889122; cv=fail; b=ANEZ+g9RESdLMtophLQ8W43NL39vruW+sZsrPiwq/3f7nKjRZv2d+dkVFt/MCLNMUhXTtmaFHDf52kmR9Ps+57I7sesPyYE31VDUMbDOieI1KtU/dmzMksGaZGcvkn7dsGMUSBCP5QXvBAP2mEo+jnUVze9PNNT71NeqdA+G1Yw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728889122; c=relaxed/simple;
	bh=S/rLM/K8PiuxWerIjzo4cKM6vZj2EfEQ706GtCUuc6k=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CZXmi3H+OZ3jEXJeyM6LBfB/hqj48NGZWcSUUiHFtm9yXf+fwO3PzZPCuKKqzKZNO6DbAgCU/Zv3JN7SEi4PlG+Hcf6z/E3PmWeTL2p3K/cFROO81zEVR+6JEYQ/IMDRe1ol/ZlLl9YnCh9GgXWgGjM/o2T/9KgzieXyprqtxWs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=N7iHcZPB; arc=fail smtp.client-ip=40.107.236.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="N7iHcZPB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MPo+XnCVBLj7/LpIjz3DFDn91oK/KxQ6g9pcprMnZHFzdJXpsKS0k1HgKamNYXGLqkKYoxwcldOP/OvoOAy2iiLX2x4EzCsQ5pSpYPr1ZJo9oc0JzQ7y9OwdVPaZci2fwHFdpqPtY7ihk6XWFTWc1YJdwX6TkksXtnlj8nPRFTBL5tZjI3HXlmiDWY6eNcatPC7w/YHa0HjwvjVCiJukVZGbNu3KXXYjmseOwUTX547qPToeuQv6Jn0dyjvHFvDxagfjgyrpZduKmyoTcbBTXbNpL4VJYAEKqPnGnc0lCn8s0pU5UQn+e5hFVnSxgHCdt4rL2q9FJhG19SeAO+Ld3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xwDZ/VfmQpC/MeI3ujI8HU3s+gDJrMA5F2GSxBqOB6s=;
 b=G0afjKbS50OpSmDF2L/uhDROnUNzhic0gS7dt6DurfPJqKAFkkXYm+imn+meMB6/QfY8JKOQo+/nYFICjyJscBKSCAVouy7YkJuhg/K4/arYGgrqPorXFPTmkvCBTP7584LHLjjF/LOu5wRYDVAJTa3qdAqSgxg6XXb6kLYDw96bKW+IvY4D8qIBTb0dJqr07rbH8zCu67P/V4xfZBBGiPq3BRnh0PtsorMnEvF+9szZ1ijg2yGOX6tQqK5hHvWX/A7qZka85VlyE30DWHvXszMt84/C78amNmPKxHddAI7rHSCWS42HXUYbhppa/oE3uxMQOjAqPJeH+ETLM8CkOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xwDZ/VfmQpC/MeI3ujI8HU3s+gDJrMA5F2GSxBqOB6s=;
 b=N7iHcZPBh4d51G4vaBFvqOAjH9zJb8pA3yzNCXCH3nqvXuLqnNrzv4Vw8AsbXNyNQ/EFtv/M+9Qdw3zI/jzn3lScdUroTviaYVy13Uz9LxdzPk8IOvVMg4F7h/P1wJgQz5JpmylW94iDZpaRisBwfBcujAmLK2zKX8b012Em/LE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by MW6PR12MB8998.namprd12.prod.outlook.com (2603:10b6:303:249::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Mon, 14 Oct
 2024 06:58:36 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%4]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 06:58:36 +0000
Message-ID: <a6f7dc24-b56f-4f69-8065-d99dc43e7b06@amd.com>
Date: Mon, 14 Oct 2024 12:28:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: please help with intermittent s2idle problem on AMD laptop
Content-Language: en-US
To: "Goswami, Sanket" <Sanket.Goswami@amd.com>,
 Corey Hickey <bugfood-ml@fatooh.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
References: <48c7aa22-7c0d-40af-80d4-538fd16327d1@fatooh.org>
 <MN0PR12MB61028BD76B3F88121289BAAB9C442@MN0PR12MB6102.namprd12.prod.outlook.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <MN0PR12MB61028BD76B3F88121289BAAB9C442@MN0PR12MB6102.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BM1PR01CA0160.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::30) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|MW6PR12MB8998:EE_
X-MS-Office365-Filtering-Correlation-Id: 39b08eec-b00b-4573-fddf-08dcec1d9ff3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VllTQjJmaUxyMjFiK0VMSThKdWhTMndjT1JnSDBaOEhnUCtNNjQ0VGFmSkxW?=
 =?utf-8?B?RDduMm52VmduenZmaHV2MGpnZjk4diswRndGK0p1TzVpUlpIc0FTbmM5NEs3?=
 =?utf-8?B?U1ZVeFpDVG4rWlJ1Snh3QVhtdWs3cmUvVzZWS3hsWGlCNmRrTm43dENCSG0v?=
 =?utf-8?B?YTRIUlBrVWNzY3BZQkFGOG1TMGMxMUgxcWhSaU12bE5hU2RrUGljNGxLNmRW?=
 =?utf-8?B?N29hSUk0Rkc0UmZjU2hvRU41V21KbjB3RGZSMW8wU1RaWnRnMnkxSU1rc3FZ?=
 =?utf-8?B?Y2p6dXdTQWZ0K1Z3cDR6dDhsclRTcWNhWWI5b2p0bWMvV3FTRFc1QUw5VGI2?=
 =?utf-8?B?ZEd6MHRuMjN5QkJYZ2hoSTFzbzEvU0QrR1VUdldKZ2Z0MG01OVZFRWpMSVNw?=
 =?utf-8?B?cGs0cEw3WDV3SXFHOVVhUHgwN1VlTkVTcXlKN2t1ZHhjbXFJQ2NwU1psckI0?=
 =?utf-8?B?Q2xxSXdCSnB3ajVST2lxdFdlTVVLNEtFdGNTV01aZ0Z0M1RMdVI1Q1pFVkJn?=
 =?utf-8?B?NGczRE8wUUltb2JKN0NzaE9LeE1BR0NMaXRPcnBoWGJOV3c5UDlqeTVLOGoy?=
 =?utf-8?B?VVRuMGxqNXpGRTdLRGEzRnZDWm8yYXJTdEExdS9meUJ5NThmc1JYbklwUG91?=
 =?utf-8?B?NzhzdFd5Wm1RcXFIRDBMQWZnQzR5K1BEK2ttUXJDa1lLZHhkbFd5OVRCQ3NI?=
 =?utf-8?B?cUZNSDBTZzRLL2RiUVNkaytCeVJjczBNVTkrQTBIaWs4a3RiYmhGSlA1cDNW?=
 =?utf-8?B?YVl6dC9YNUlUd25XbW9GbzY1K1BxNGVuK3VCZWZTODcxK3V1d05EU2NvL2Ja?=
 =?utf-8?B?UEF1RjBVbUVDcGlTMjkzbExXcjhwTU44QmxMOUs0Mk5nOWJaOTNPUUpmenE0?=
 =?utf-8?B?Qnp3TDlNazVsSXRFTXBlQ3pBeEhsSkNVcVp2Q0MzS3JRcTBISmNmWERjNDE1?=
 =?utf-8?B?czh3NlRGMG8wRStxQjNwa2RzVEtUQkdlblBwZGx0RVBKZUxQTnFpN1kvK2Zv?=
 =?utf-8?B?dGhueE1mZWFlSG4zdmJNMFZkWjRxdDI4RFN0VDBRbFZMeUlJQkcvczBLSGxO?=
 =?utf-8?B?bXBZWXFRNnBZKzBhSkwrR1FBVm5HL3RZYmJRSzd5MCt2WE00VE9xb29RSm8y?=
 =?utf-8?B?MVNxUG1QOW1sdFJ5UHBzLzZORlVlcTg0KzgyNjFERlNYTXF3dzUxKzlFR1ZB?=
 =?utf-8?B?YmtFczNVU1Q1eE1VZks3dllTUWh3ck1ZeGNFT1NvTzJsV1pxODZUMGlyZHlD?=
 =?utf-8?B?NDFnQUM5VWQyd2RHbHAzRjA4SDhWV1Rwbm5pK3FqOWROZUJoeXZzZnRWZisr?=
 =?utf-8?B?WG1qQ3ROdWxCV3dGQy8rcjE3ajdZWEh6MWFIblNHUkgxTUZNMFl6YndpbSs4?=
 =?utf-8?B?a1VNMVBRUG1DY2l3ZnBaTXF4MjBJUW5razhLSU04SnlwZUpTNWdqRGhZelNH?=
 =?utf-8?B?Rk5rTVlsaXlvTVpRbm1YQnFqL3FKWis1cUhrc1FlNnBoc2dHMm5zaVNaaDhz?=
 =?utf-8?B?RmdwL2lNMjJiOVJ3QWhLNVVmNTIvdG9qbHZrSXQ2cmQyeGNzWTVFeFpkb2sw?=
 =?utf-8?B?ZG1jdDlYcXo5cktTY3JRT3dDMkpoVHJYL1RRS0R2Y0xQNzJRMHJqT1RNdVFW?=
 =?utf-8?Q?bcmx1DG3iSlMNrU8HsRYZVKxBvYPtM5kZuYLpSnfnXh0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V2d0S3dZZnN1SVZVSk1mdWFlYjdwczZIb3FkTVcySkMvb2Q2ZHc3OXBZVnVH?=
 =?utf-8?B?Q254RVBiMzJIeGRjOFpVNU1YS2JINVQ3R1B3OUY5T0Y5WGxYWkMveXp5K2FV?=
 =?utf-8?B?d09yclJxTFkxTStyWUdrb1gxWkZsa1VzYjRjZXZ5L3JpQ24rQTVNWmRzY3c2?=
 =?utf-8?B?TWd3NzVtcG9NeWhvOHhRa3dJem5BSnpmUHkxNE9seWlnSmwxVXI1d2kxekRI?=
 =?utf-8?B?MFB1ZWIyR2Y4VGZXcUNZK3d0YzV6c1ZSbXlnSTh5dlluL0hjc3FQQlBQMnRD?=
 =?utf-8?B?SVdaMXpKUCt3TUUzRStWSjhKcGVpZzlWOUtkTGdUUVprYmF4cmM0OUpoVTRI?=
 =?utf-8?B?d3BWTk9Qa1FXTWNmQnJyWXZiNWQvS3FMVm1PYW5zS2VWZG1sdlZpQVFBd01Z?=
 =?utf-8?B?WDllR0Jacys2dFpZOGxSa052UjBIQWhBcW14ZlBKdlQzOTlZRklpNTJsYnBL?=
 =?utf-8?B?bkNxNGlQc1pBL25rRHY1b3FoUU4vZ0RZOCtZTUxDY1doWTdoTXNRRDYxY21x?=
 =?utf-8?B?TXJaSWdwTVgwZTMvQnNRM3RXaTd3NnJyeTBzelplOVNmamZFdExzbnlDeU14?=
 =?utf-8?B?T3J0YUVjZW1sdVNzWXBNV3FIdkExckkwN1FhVTN2cmY2akJzOGlPVGJMdVZU?=
 =?utf-8?B?T2sxb1BVWHVmc2YzQzFJaFlrQjNPN3hQV2U0Vk5GSjgvUklqQ2VvdmxjQmgy?=
 =?utf-8?B?VXNBbTVualZBOEhudzFTdnZWS2JudWUvRncwcWxDa0lLTS9BSXEzWlpiOGtB?=
 =?utf-8?B?MjJMR3F1SlF2bnJnSDdBd2pTdkZZeE4waWJqWmNKT1RaZTM1c2hoQ0gyS2Na?=
 =?utf-8?B?bTFHRTB2SGpkREVXdnljbWFTdDJnS0VQZFNLSUV4TDJKcmowTmV4bWU1TXQ0?=
 =?utf-8?B?V3dXbEhNamgwTFVvTldUOVMrRTFWYkEyMHJlVHgyWHRCT3NhdjRvaWkyOEZS?=
 =?utf-8?B?c1lFYmI4Q21HbW4zQmd2dG1Ba0p4bWMxSkFHMWZDLzVnZVYwQ3V2c3N0OHNG?=
 =?utf-8?B?KzBPQndVVkVEQmdkU1ZBMjdlWnIrcDNXQmdPRWYvOXJDdk1wYS9oVWdqekV6?=
 =?utf-8?B?VGx0ZnhPN0lmNVZFbWxKVFd1OGIvRW1NYVFtVUNwRWZRQmlpNy9uTy92RVRs?=
 =?utf-8?B?TUQ4NnliT1U2L0NHUk5IL0U5UUplQVVVMS9wSkRwR1YyeVR1VmdBOFlNcTN6?=
 =?utf-8?B?cU43RzdtMSs5WHhHRUNpdVlLY3VmMklFQkNVeGdkRmNDOFdXWU5WeWdReEov?=
 =?utf-8?B?V1ZNR2w2S3ZXUkNCcXJjNm0xakVsdWFHTUVnczNOMUh2MHQ4bElzRFhjeGE3?=
 =?utf-8?B?cHZtSFJIUGtPaFBHdEZ2aEVMZWx0c0ZicnF0OXZKdzc5WVhoZ05rRTRRQUlr?=
 =?utf-8?B?cEphQ2hDVzlVdEpWTDlrSDJaYU02NTU5Wjg0YlIyZE4zV0x6MDZCRTZhSy8v?=
 =?utf-8?B?N0JkazFLS1Z5Zkg4djNLNHFaU3dTYVhsaC9YWVpjMk52Vy9DOGJkZ1JoVEp3?=
 =?utf-8?B?U016cEplUFEvaTljNlBRRnFyL0JPN0thQ0VFN04zUy9nRUt4d2U0N3k3bk03?=
 =?utf-8?B?dHZaaXZIMFVGVmx0RUV5UmJPQTA2ZW9mM0tvZ0JvN2dKNnlLNmFsUFFPdExm?=
 =?utf-8?B?T1U0SzV6eFJOUEYvVzdsUnFEWDVpMk1FaTNuZXEwcktOSWloa2NPVXIwOGpk?=
 =?utf-8?B?b2hTdjVYV0M4emlLR1R2ME0zczJ2aHUyMkdVQi8yN3AvdXBPZGVCNTVZWFNV?=
 =?utf-8?B?djNFdXNkbVJkV2EzQkVEbDRHTERFZ3Z3QWpCSHBaOWlJZGtXRVpId1paazlT?=
 =?utf-8?B?eHVLaG8xenBQWDhPbWp5WWg1Z3NsN0dDMzBDbnI1dkJYWVUrRG1LTTVncDYy?=
 =?utf-8?B?dWJTQ3NBbkV1cFJhaGdySHB1ZDFnZ3pIN0NhbzZjbUtwbjNSZEl2U1lwSmRB?=
 =?utf-8?B?MVU5NzZhTi9nREozSTFYblR4RkIyUmxZYWVnQjhPM2JZdThScnZnNzZNQ0NV?=
 =?utf-8?B?V0tCZHJzUjJVRUFnam5pZmJTeVdFOU1OZ3VJL1kzQXdyank3bWlyQVZMNHN3?=
 =?utf-8?B?OVJTSGZKY1JVN2RFdnhadXJ4SEEzSnRBLzl2ZUZDa21pcFdNMmxwL2ZHRmdD?=
 =?utf-8?Q?pfA6Gz+dA1oUHBoihU8xlKXWI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39b08eec-b00b-4573-fddf-08dcec1d9ff3
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 06:58:36.4116
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eue3TqQQiYYCFZm7GGsX/W+I3gnMjWHY50iLfUoNVAGogim9pQMHzyOIc6KOQUVSlTXNLlXb/74ZpDeVK/+UAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8998



On 10/14/2024 12:17, Goswami, Sanket wrote:
> [AMD Official Use Only - AMD Internal Distribution Only]
>=20
> +Shyam
>=20
> -----Original Message-----
> From: Corey Hickey <bugfood-ml@fatooh.org>
> Sent: Sunday, October 13, 2024 3:42 AM
> To: platform-driver-x86@vger.kernel.org
> Subject: please help with intermittent s2idle problem on AMD laptop
>=20
> Hello,
>=20
> I am having an intermittent problem with resuming from s2idle. There seem=
s to be a problem with going into the s2idle state--the laptop appears susp=
ended, but the power draw is high and laptop remains warm over time. Attemp=
ting to resume fails; I need to fully power off the laptop.
>=20
> Can somebody please help me troubleshoot this? I am able to test patches =
and experiment, but I'm out of my depth with trying to figure this out on m=
y own.
>=20
> If there is a better place to ask this, please let me know.
>=20
> I first posted about the problem here:
>=20
> https://community.frame.work/t/linux-framework-16-intermittent-failure-to=
-resume-from-suspend/58674
>=20
> System details are:
> * Framework Laptop 16 (without GPU module)
> * Ryzen 7 7840HS
> * Debian Sid
>=20
> The kernel I had trouble with was 6.10.6; I have just recently updated th=
e kernel to git 09f6b0c8904bfaa1e0601bc102e1b6aa6de8c98f (from
> yesterday) in order to try to troubleshoot further.
>=20
>=20
> I tried to find some debugging information on my own. The remainder of th=
is message is about that effort, but if I'm on the wrong track, please disr=
egard the following.
>=20
>=20
> I found this article:
> https://www.phoronix.com/news/AMD-MP2-STB-Suspend-Resume
> ...and hoped I would be able to find some useful information.
>=20
> As far as I can tell from the code, I need to load the amd_pmc module wit=
h enable_stb=3D1.
>=20
> lizard:~# rmmod amd_pmc
> lizard:~# modprobe amd_pmc enable_stb=3D1
>=20
> If I do that, though:
> 1. There is an error: 'amd_pmc AMDI0009:00: SMU cmd failed. err: 0xff'

this is expected as the command is not supported on PMFW loaded on
your system.

and..

ret=3D-5 is expected on your system, because it does not support EFR
(Enhanced Firmware Reporting).

> 2. There is a kernel WARNING (which I will paste in full below):
>     ioremap on RAM at 0x0000000000000000 - 0x0000000000ffffff 3. The expe=
cted files in debugfs do not appear.
>=20

This is happening because, the ioremap() is happening for addr 0x0.
Ideally you should have got the physical address from the mailbox
command. But that does not seem to happen.

I suspect that on your system, the STB is not enabled. Can you check
the following path to see if that helps?

AMD CBS -> SMU Debug Options -> SMU Feature Config Limits -> STB To
DRAM Log <Enabled>

If DRAM log is disabled, then that should be enabled to attempt to
take a stb log.

>=20
> I added some printk statements to the driver in order to try to find out =
what is happening.
>=20
> The trouble seems to be in amd_pmc_s2d_init() and the results it gets bac=
k from calling amd_pmc_send_cmd()
>=20
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/d=
rivers/platform/x86/amd/pmc/pmc.c#n978
>=20
>=20
>          /* Get DRAM size */
>          ret =3D amd_pmc_send_cmd(dev, S2D_DRAM_SIZE, &dev->dram_size, de=
v->s2d_msg_id, true);
>          printk(KERN_INFO "amd_pmc_s2d_init s2d_dram_size ret: %d\n", ret=
);
>          if (ret || !dev->dram_size)
>                  dev->dram_size =3D S2D_TELEMETRY_DRAMBYTES_MAX;
>=20
>          /* Get STB DRAM address */
>          amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_LOW, &phys_addr_low, dev->s2=
d_msg_id, true);
>          amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_HIGH, &phys_addr_hi, dev->s2=
d_msg_id, true);
>=20
>=20
> For the call to retrieve S2D_DRAM_SIZE, the return value is -5.
> For the calls to retrieve S2D_PHYS_ADDR_LOW, the return value is 0, but p=
hys_addr_low is 0 as well, which seems wrong.
> For S2D_PHYS_ADDR_HIGH, phys_addr_hi is 0 is well.
>=20
> I think that both of the phys_addr values being 0 is resulting in the war=
ning from ioremap.
>=20
> Is this a driver bug, or a hardware limitation?
>=20
> I will post my debug patch below and then the output from the kernel when=
 loading 'amd_pmc enable_stb=3D1'.
>=20
>=20
> ----------------------------------------------------------------------
> commit ed7a2784cf6a19796734b8aca87a260c4ff1f752
> Author: Corey Hickey <bugfood-c@fatooh.org>
> Date:   Fri 2024-10-11 23:13:40
>=20
>      debug
>=20
> diff --git a/drivers/platform/x86/amd/pmc/mp2_stb.c b/drivers/platform/x8=
6/amd/pmc/mp2_stb.c
> index 9775ddc1b27a..718b01266bff 100644
> --- a/drivers/platform/x86/amd/pmc/mp2_stb.c
> +++ b/drivers/platform/x86/amd/pmc/mp2_stb.c
> @@ -228,10 +228,12 @@ void amd_mp2_stb_init(struct amd_pmc_dev *dev)
>         struct pci_dev *pdev;
>         int rc;
>=20

No need to look at mp2_stb.c as it is meant for chromebook use-cases.
So, it will not take this path on your framework system.

Note that I have looked at your debug patch, but it may not be in the
right direction.

I would suggest:
- reload the amd_pmc driver with dyndbg
- Put the system to sleep "echo mem > /sys/power/state" and take the
dmesg logs
- get the dump of /sys/kernel/debug/amd_pmc/s0ix_stats and
/sys/kernel/debug/amd_pmc/smu_fw_info

if the dmesg and debugfs logs are not helpful, then you can enable the
BIOS settings as described above to take the STB log.

The stb log can be obtained by cat /sys/kernel/debug/amd_pmc/stb_read
> stb_data.bin and please put that info on bugzilla.

Thanks,
Shyam

> +    printk(KERN_INFO "amd_mp2_stb_init 1\n");
>         mp2 =3D devm_kzalloc(dev->dev, sizeof(*mp2), GFP_KERNEL);
>         if (!mp2)
>                 return;
>=20
> +    printk(KERN_INFO "amd_mp2_stb_init 2\n");
>         pdev =3D pci_get_device(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_MP2_=
STB, NULL);
>         if (!pdev)
>                 return;
> @@ -239,24 +241,28 @@ void amd_mp2_stb_init(struct amd_pmc_dev *dev)
>         dev->mp2 =3D mp2;
>         mp2->pdev =3D pdev;
>=20
> +    printk(KERN_INFO "amd_mp2_stb_init 3");
>         mp2->devres_gid =3D devres_open_group(&pdev->dev, NULL, GFP_KERNE=
L);
>         if (!mp2->devres_gid) {
>                 dev_err(&pdev->dev, "devres_open_group failed\n");
>                 goto mp2_error;
>         }
>=20
> +    printk(KERN_INFO "amd_mp2_stb_init 4\n");
>         rc =3D pcim_enable_device(pdev);
>         if (rc) {
>                 dev_err(&pdev->dev, "pcim_enable_device failed\n");
>                 goto mp2_error;
>         }
>=20
> +    printk(KERN_INFO "amd_mp2_stb_init 5\n");
>         rc =3D pcim_iomap_regions(pdev, BIT(MP2_MMIO_BAR), "mp2 stb");
>         if (rc) {
>                 dev_err(&pdev->dev, "pcim_iomap_regions failed\n");
>                 goto mp2_error;
>         }
>=20
> +    printk(KERN_INFO "amd_mp2_stb_init 6\n");
>         mp2->mmio =3D pcim_iomap_table(pdev)[MP2_MMIO_BAR];
>         if (!mp2->mmio) {
>                 dev_err(&pdev->dev, "pcim_iomap_table failed\n"); @@ -265=
,6 +271,7 @@ void amd_mp2_stb_init(struct amd_pmc_dev *dev)
>=20
>         pci_set_master(pdev);
>=20
> +    printk(KERN_INFO "amd_mp2_stb_init 7\n");
>         rc =3D dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
>         if (rc) {
>                 dev_err(&pdev->dev, "failed to set DMA mask\n"); diff --g=
it a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.=
c
> index bbb8edb62e00..6ca497473d78 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -627,6 +627,7 @@ static void amd_pmc_dbgfs_unregister(struct amd_pmc_d=
ev *dev)
>=20
>   static bool amd_pmc_is_stb_supported(struct amd_pmc_dev *dev)
>   {
> +    printk(KERN_INFO "amd_pmc_is_stb_supported cpu_id: %d\n",
> + dev->cpu_id);
>         switch (dev->cpu_id) {
>         case AMD_CPU_ID_YC:
>         case AMD_CPU_ID_CB:
> @@ -986,11 +987,13 @@ static int amd_pmc_s2d_init(struct amd_pmc_dev *dev=
)
>         dev->msg_port =3D 1;
>=20
>         amd_pmc_send_cmd(dev, S2D_TELEMETRY_SIZE, &size, dev->s2d_msg_id,=
 true);
> +       printk(KERN_INFO "amd_pmc_s2d_init size: %u\n", size);
>         if (size !=3D S2D_TELEMETRY_BYTES_MAX)
>                 return -EIO;
>=20
>         /* Get DRAM size */
>         ret =3D amd_pmc_send_cmd(dev, S2D_DRAM_SIZE, &dev->dram_size, dev=
->s2d_msg_id, true);
> +       printk(KERN_INFO "amd_pmc_s2d_init s2d_dram_size ret: %d\n", ret)=
;
>         if (ret || !dev->dram_size)
>                 dev->dram_size =3D S2D_TELEMETRY_DRAMBYTES_MAX;
>=20
> @@ -1003,7 +1006,9 @@ static int amd_pmc_s2d_init(struct amd_pmc_dev *dev=
)
>         /* Clear msg_port for other SMU operation */
>         dev->msg_port =3D 0;
>=20
> +       printk(KERN_INFO "amd_pmc_s2d_init p_a_l: %u p_a_hi: %u s_p_a: %l=
lu
> +sz: %u\n", phys_addr_low, phys_addr_hi, stb_phys_addr, dev->dram_size);
>         dev->stb_virt_addr =3D devm_ioremap(dev->dev, stb_phys_addr, dev-=
>dram_size);
> +       printk(KERN_INFO "amd_pmc_s2d_init dsva: %p\n", dev->stb_virt_add=
r);
>         if (!dev->stb_virt_addr)
>                 return -ENOMEM;
>=20
> @@ -1047,6 +1052,7 @@ static int amd_pmc_probe(struct platform_device *pd=
ev)
>         int err;
>         u32 val;
>=20
> +       printk(KERN_INFO "amd_pmc_probe: 1\n");
>         dev->dev =3D &pdev->dev;
>=20
>         rdev =3D pci_get_domain_bus_and_slot(0, 0, PCI_DEVFN(0, 0)); @@ -=
1057,12 +1063,14 @@ static int amd_pmc_probe(struct platform_device *pdev)
>=20
>         dev->cpu_id =3D rdev->device;
>=20
> +       printk(KERN_INFO "amd_pmc_probe: 2\n");
>         if (dev->cpu_id =3D=3D AMD_CPU_ID_SP) {
>                 dev_warn_once(dev->dev, "S0i3 is not supported on this ha=
rdware\n");
>                 err =3D -ENODEV;
>                 goto err_pci_dev_put;
>         }
>=20
> +       printk(KERN_INFO "amd_pmc_probe: 3\n");
>         dev->rdev =3D rdev;
>         err =3D amd_smn_read(0, AMD_PMC_BASE_ADDR_LO, &val);
>         if (err) {
> @@ -1073,6 +1081,7 @@ static int amd_pmc_probe(struct platform_device *pd=
ev)
>=20
>         base_addr_lo =3D val & AMD_PMC_BASE_ADDR_HI_MASK;
>=20
> +       printk(KERN_INFO "amd_pmc_probe: 4\n");
>         err =3D amd_smn_read(0, AMD_PMC_BASE_ADDR_HI, &val);
>         if (err) {
>                 dev_err(dev->dev, "error reading 0x%x\n", AMD_PMC_BASE_AD=
DR_HI); @@ -1085,6 +1094,7 @@ static int amd_pmc_probe(struct platform_devi=
ce *pdev)
>=20
>         dev->regbase =3D devm_ioremap(dev->dev, base_addr + AMD_PMC_BASE_=
ADDR_OFFSET,
>                                     AMD_PMC_MAPPING_SIZE);
> +       printk(KERN_INFO "amd_pmc_probe: 5\n");
>         if (!dev->regbase) {
>                 err =3D -ENOMEM;
>                 goto err_pci_dev_put;
> @@ -1095,24 +1105,31 @@ static int amd_pmc_probe(struct platform_device *=
pdev)
>         /* Get num of IP blocks within the SoC */
>         amd_pmc_get_ip_info(dev);
>=20
> +       printk(KERN_INFO "amd_pmc_probe: 6\n");
>         if (enable_stb && amd_pmc_is_stb_supported(dev)) {
>                 err =3D amd_pmc_s2d_init(dev);
> +               printk(KERN_INFO "amd_pmc_probe: 6a\n");
>                 if (err)
>                         goto err_pci_dev_put;
>         }
>=20
> +       printk(KERN_INFO "amd_pmc_probe: 7\n");
>         platform_set_drvdata(pdev, dev);
>         if (IS_ENABLED(CONFIG_SUSPEND)) {
>                 err =3D acpi_register_lps0_dev(&amd_pmc_s2idle_dev_ops);
> +               printk(KERN_INFO "amd_pmc_probe: 7a\n");
>                 if (err)
>                         dev_warn(dev->dev, "failed to register LPS0 sleep=
 handler, expect increased power consumption\n");
>                 if (!disable_workarounds)
>                         amd_pmc_quirks_init(dev);
>         }
>=20
> +       printk(KERN_INFO "amd_pmc_probe: 8\n");
>         amd_pmc_dbgfs_register(dev);
> -       if (IS_ENABLED(CONFIG_AMD_MP2_STB))
> +       if (IS_ENABLED(CONFIG_AMD_MP2_STB)) {
> +               printk(KERN_INFO "amd_pmc_probe: calling amd_mp2_stb_init=
\n");
>                 amd_mp2_stb_init(dev);
> +    }
>         pm_report_max_hw_sleep(U64_MAX);
>         return 0;
>=20
> ----------------------------------------------------------------------
>=20
> Oct 12 00:20:01 lizard kernel: amd_pmc_probe: 1 Oct 12 00:20:01 lizard ke=
rnel: amd_pmc_probe: 2 Oct 12 00:20:01 lizard kernel: amd_pmc_probe: 3 Oct =
12 00:20:01 lizard kernel: amd_pmc_probe: 4 Oct 12 00:20:01 lizard kernel: =
amd_pmc_probe: 5 Oct 12 00:20:01 lizard kernel: amd_pmc_probe: 6 Oct 12 00:=
20:01 lizard kernel: amd_pmc_is_stb_supported cpu_id: 5352 Oct 12 00:20:01 =
lizard kernel: amd_pmc_s2d_init size: 1048576 Oct 12 00:20:01 lizard kernel=
: amd_pmc AMDI0009:00: SMU cmd failed. err: 0xff Oct 12 00:20:01 lizard ker=
nel: amd_pmc_s2d_init s2d_dram_size ret: -5 Oct 12 00:20:01 lizard kernel: =
amd_pmc_s2d_init p_a_l: 0 p_a_hi: 0 s_p_a: 0 sz: 16777216 Oct 12 00:20:01 l=
izard kernel: ------------[ cut here ]------------ Oct 12 00:20:01 lizard k=
ernel: ioremap on RAM at 0x0000000000000000 - 0x0000000000ffffff Oct 12 00:=
20:01 lizard kernel: WARNING: CPU: 10 PID: 2151 at arch/x86/mm/ioremap.c:21=
7 __ioremap_caller+0x2cd/0x340 Oct 12 00:20:01 lizard kernel: Modules linke=
d in: amd_pmc(+) ccm cpufreq_userspace cpufreq_powersave cpufreq_conservati=
ve sunrpc binfmt_misc nls_ascii nls_cp437 vfat fat typec_displayport amdgpu=
 snd_sof_amd_rembrandt amdxcp drm_exec snd_sof_amd_acp gpu_sched btusb snd_=
sof_pci drm_buddy snd_sof_xtensa_dsp btrtl drm_suballoc_helper snd_hda_code=
c_realtek amd_atl drm_display_helper btintel intel_rapl_msr snd_sof btbcm i=
ntel_rapl_common snd_hda_codec_generic snd_sof_utils cec btmtk snd_hda_scod=
ec_component snd_hda_codec_hdmi snd_soc_core uvcvideo mt7921e snd_compress =
videobuf2_vmalloc rc_core snd_pcm_dmaengine uvc snd_hda_intel mt7921_common=
 drm_ttm_helper videobuf2_memops snd_pci_ps snd_intel_dspcfg snd_rpl_pci_ac=
p6x snd_intel_sdw_acpi mt792x_lib videobuf2_v4l2 snd_pci_acp6x edac_mce_amd=
 ttm snd_pci_acp5x mt76_connac_lib snd_hda_codec snd_rn_pci_acp3x videodev =
bluetooth drm_kms_helper snd_acp_config mt76 snd_hda_core videobuf2_common =
snd_soc_acpi i2c_algo_bit mc crc16 snd_hwdep snd_pci_acp3x amd_pmf kvm_amd =
amdtee mac80211 hid_sensor_als Oct 12 00:20:01 lizard kernel:  hid_sensor_t=
rigger ccp libarc4 ucsi_acpi hid_sensor_iio_common kvm industrialio_trigger=
ed_buffer amd_sfh typec_ucsi kfifo_buf leds_cros_ec cros_usbpd_charger tee =
typec snd_pcsp cros_ec_hwmon platform_profile led_class_multicolor rapl cro=
s_usbpd_notify cfg80211 cros_ec_sysfs industrialio roles cros_usbpd_logger =
cros_ec_debugfs cros_charge_control cros_ec_chardev wmi_bmof sp5100_tco but=
ton ac k10temp watchdog rfkill cpufreq_ondemand snd_intel8x0 snd_ac97_codec=
 ac97_bus snd_pcm_oss snd_mixer_oss snd_pcm snd_timer snd soundcore evdev i=
2c_dev sidewinder gameport joydev parport_pc ppdev lp parport efi_pstore co=
nfigfs nfnetlink ip_tables x_tables autofs4 xfs dm_crypt dm_mod efivarfs ra=
id10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx xor=
 raid6_pq libcrc32c crc32c_generic raid0 cdc_ncm cdc_ether usbnet r8152 mii=
 libphy usbhid raid1 hid_multitouch hid_sensor_hub hid_generic md_mod crct1=
0dif_pclmul i2c_hid_acpi crc32_pclmul xhci_pci i2c_hid crc32c_intel cros_ec=
_dev xhci_hcd ghash_clmulni_intel Oct 12 00:20:01 lizard kernel:  cros_ec_l=
pcs sha512_ssse3 cros_ec nvme sha256_ssse3 usbcore drm thunderbolt sha1_sss=
e3 i2c_piix4 video nvme_core i2c_smbus usb_common battery wmi hid aesni_int=
el gf128mul crypto_simd cryptd [last unloaded: amd_pmc] Oct 12 00:20:01 liz=
ard kernel: CPU: 10 UID: 0 PID: 2151 Comm: modprobe Not tainted 6.12.0-rc2+=
 #8 Oct 12 00:20:01 lizard kernel: Hardware name: Framework Laptop 16 (AMD =
Ryzen 7040 Series)/FRANMZCP07, BIOS 03.03 03/27/2024 Oct 12 00:20:01 lizard=
 kernel: RIP: 0010:__ioremap_caller+0x2cd/0x340 Oct 12 00:20:01 lizard kern=
el: Code: 1f fe ff ff 80 3d 7e 33 d8 01 00 75 9d 48 8d 54 24 28 48 8d 74 24=
 18 48 c7 c7 9f ae 6c 82 c6 05 64 33 d8 01 01 e8 53 d8 01 00 <0f> 0b e9 79 =
ff ff ff 83 fd 04 75 35 bf 04 00 00 00 e8 ad a0 ff ff Oct 12 00:20:01 lizar=
d kernel: RSP: 0018:ffffaee502663a18 EFLAGS: 00010282 Oct 12 00:20:01 lizar=
d kernel: RAX: 0000000000000000 RBX: ffff8fe3066563e8 RCX: 0000000000000027=
 Oct 12 00:20:01 lizard kernel: RDX: ffff8ff1dff21788 RSI: 0000000000000001=
 RDI: ffff8ff1dff21780 Oct 12 00:20:01 lizard kernel: RBP: 0000000000000002=
 R08: 0000000000000000 R09: ffffaee502663898 Oct 12 00:20:01 lizard kernel:=
 R10: ffffffff82eb40e8 R11: 0000000000000003 R12: 0000000001000000 Oct 12 0=
0:20:01 lizard kernel: R13: 0000000001000000 R14: 0000000000000000 R15: 000=
0000000000000 Oct 12 00:20:01 lizard kernel: FS:  00007f5e2c747640(0000) GS=
:ffff8ff1dff00000(0000) knlGS:0000000000000000 Oct 12 00:20:01 lizard kerne=
l: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033 Oct 12 00:20:01 lizard=
 kernel: CR2: 00007f5e2bf7e700 CR3: 000000010d2a2000 CR4: 0000000000750ef0 =
Oct 12 00:20:01 lizard kernel: PKRU: 55555554 Oct 12 00:20:01 lizard kernel=
: Call Trace:
> Oct 12 00:20:01 lizard kernel:  <TASK>
> Oct 12 00:20:01 lizard kernel:  ? __ioremap_caller+0x2cd/0x340 Oct 12 00:=
20:01 lizard kernel:  ? __warn.cold+0x93/0xf6 Oct 12 00:20:01 lizard kernel=
:  ? __ioremap_caller+0x2cd/0x340 Oct 12 00:20:01 lizard kernel:  ? report_=
bug+0xff/0x140 Oct 12 00:20:01 lizard kernel:  ? console_unlock+0x9d/0x140 =
Oct 12 00:20:01 lizard kernel:  ? handle_bug+0x58/0x90 Oct 12 00:20:01 liza=
rd kernel:  ? exc_invalid_op+0x17/0x70 Oct 12 00:20:01 lizard kernel:  ? as=
m_exc_invalid_op+0x1a/0x20 Oct 12 00:20:01 lizard kernel:  ? __ioremap_call=
er+0x2cd/0x340 Oct 12 00:20:01 lizard kernel:  ? __ioremap_caller+0x2cd/0x3=
40 Oct 12 00:20:01 lizard kernel:  ? devm_ioremap+0x49/0x80 Oct 12 00:20:01=
 lizard kernel:  ? __pfx_devm_ioremap_release+0x10/0x10
> Oct 12 00:20:01 lizard kernel:  devm_ioremap+0x49/0x80 Oct 12 00:20:01 li=
zard kernel:  amd_pmc_probe+0x41a/0x5ac [amd_pmc] Oct 12 00:20:01 lizard ke=
rnel:  platform_probe+0x41/0xa0 Oct 12 00:20:01 lizard kernel:  really_prob=
e+0xdb/0x340 Oct 12 00:20:01 lizard kernel:  ? pm_runtime_barrier+0x54/0x90=
 Oct 12 00:20:01 lizard kernel:  ? __pfx___driver_attach+0x10/0x10 Oct 12 0=
0:20:01 lizard kernel:  __driver_probe_device+0x78/0x110 Oct 12 00:20:01 li=
zard kernel:  driver_probe_device+0x1f/0xa0 Oct 12 00:20:01 lizard kernel: =
 __driver_attach+0xba/0x1c0 Oct 12 00:20:01 lizard kernel:  bus_for_each_de=
v+0x8c/0xe0 Oct 12 00:20:01 lizard kernel:  bus_add_driver+0x112/0x1f0 Oct =
12 00:20:01 lizard kernel:  driver_register+0x72/0xd0 Oct 12 00:20:01 lizar=
d kernel:  ? __pfx_amd_pmc_driver_init+0x10/0x10 [amd_pmc] Oct 12 00:20:01 =
lizard kernel:  do_one_initcall+0x58/0x310 Oct 12 00:20:01 lizard kernel:  =
do_init_module+0x60/0x230 Oct 12 00:20:01 lizard kernel:  init_module_from_=
file+0x86/0xc0 Oct 12 00:20:01 lizard kernel:  idempotent_init_module+0x11e=
/0x310
> Oct 12 00:20:01 lizard kernel:  __x64_sys_finit_module+0x5e/0xb0 Oct 12 0=
0:20:01 lizard kernel:  do_syscall_64+0x82/0x190 Oct 12 00:20:01 lizard ker=
nel:  ? srso_alias_return_thunk+0x5/0xfbef5
> Oct 12 00:20:01 lizard kernel:  ? __count_memcg_events+0x53/0xf0 Oct 12 0=
0:20:01 lizard kernel:  ? srso_alias_return_thunk+0x5/0xfbef5
> Oct 12 00:20:01 lizard kernel:  ? count_memcg_events.constprop.0+0x1a/0x3=
0
> Oct 12 00:20:01 lizard kernel:  ? srso_alias_return_thunk+0x5/0xfbef5
> Oct 12 00:20:01 lizard kernel:  ? handle_mm_fault+0x1bb/0x2c0 Oct 12 00:2=
0:01 lizard kernel:  ? srso_alias_return_thunk+0x5/0xfbef5
> Oct 12 00:20:01 lizard kernel:  ? do_user_addr_fault+0x36c/0x620 Oct 12 0=
0:20:01 lizard kernel:  ? srso_alias_return_thunk+0x5/0xfbef5
> Oct 12 00:20:01 lizard kernel:  ? srso_alias_return_thunk+0x5/0xfbef5
> Oct 12 00:20:01 lizard kernel:  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> Oct 12 00:20:01 lizard kernel: RIP: 0033:0x7f5e2bf1b0e9 Oct 12 00:20:01 l=
izard kernel: Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 8=
9 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48>=
 3d 01 f0 ff ff 73 01 c3 48 8b 0d ff 5c 0d 00 f7 d8 64 89 01 48 Oct 12 00:2=
0:01 lizard kernel: RSP: 002b:00007ffdc1020768 EFLAGS: 00000246 ORIG_RAX: 0=
000000000000139 Oct 12 00:20:01 lizard kernel: RAX: ffffffffffffffda RBX: 0=
00055bc6cec2e70 RCX: 00007f5e2bf1b0e9 Oct 12 00:20:01 lizard kernel: RDX: 0=
000000000000000 RSI: 000055bc6cec3220 RDI: 0000000000000003 Oct 12 00:20:01=
 lizard kernel: RBP: 0000000000000000 R08: 00007f5e2bff1b20 R09: 0000000000=
000000 Oct 12 00:20:01 lizard kernel: R10: 0000000000000040 R11: 0000000000=
000246 R12: 000055bc6cec3220 Oct 12 00:20:01 lizard kernel: R13: 0000000000=
040000 R14: 000055bc6cec2f10 R15: 0000000000000000 Oct 12 00:20:01 lizard k=
ernel:  </TASK> Oct 12 00:20:01 lizard kernel: ---[ end trace 0000000000000=
000 ]--- Oct 12 00:20:01 lizard kernel: amd_pmc_s2d_init dsva: 000000000000=
0000 Oct 12 00:20:01 lizard kernel: amd_pmc_probe: 6a Oct 12 00:20:01 lizar=
d kernel: amd_pmc AMDI0009:00: probe with driver amd_pmc failed with error =
-12
> ----------------------------------------------------------------------
>=20
>=20
> Thank you,
> Corey

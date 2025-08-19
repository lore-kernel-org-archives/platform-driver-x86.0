Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2048.outbound.protection.outlook.com [40.107.212.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7E426FA5B
	for <platform-driver-x86@vger.kernel.org>; Tue, 19 Aug 2025 12:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755605333; cv=fail; b=A4pHUQssw4N4i8bbhX0jwTXvzUJXuDakcGsE3BqXpPgWXKHS2A87pjxReOXclfpUT4ScQBpeGHZ6CnHw8/Fy1gvoJTGL46GhwwQzGamu5sumruC9fq6fnz9ngf6H4sd094VVkY3v0r2lCt2Iuh2yF732cu9yf3L7T3RZwYqUazU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755605333; c=relaxed/simple;
	bh=QAAL3QBxpzOhBz/De4jBMVeiyWqFd7/PlLJyqmBwZo8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hQ+apXI33S3y1h79Kviy6T8s4IJoj5K3BttiJI2kQfYmSxpOtwbyyjDfOFII4C2wuQvrxRJCrnXRksUb7maRXHn/BSbZb/fjcbBEGQgxlfxxf04IkOuye+fRlC1muU7dxt3dWPg7qvbO9FaBU2EzRXenAH5ixAOKsYnm3/xz9XU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=hE8C6nQW; arc=fail smtp.client-ip=40.107.212.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="hE8C6nQW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X7mlUMlCqAoWL1SulfTDVFghcWBcjJWafNUm5K9Uwywbwz5SnM7+LslNI74BBlidAUHvdsxT1Ic5uCMWxTx1GEtWuBtvgFMwRPcexHSEjvAWLBerc+BNnR8S1LC5czFK9kE2wt4Dxh49EMKa7LbMGSzbVRRGU83Q7qM62pyFxrLecRUE1mTcR2W55HxTMpsdgK7/oQvQd3yBbRcqekXOKEsbBuNsgXVfS4/pTWIq/dTg7743eUSS2m7vPSge07+9ehdVpzOkXH4lAdx0PQZqMJso8GgC5R33VgQS0yHUn3eFTDQvJPsDuE6aLu8O3KOOia7JiQZJK4fFMFKQSaoekQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4kxZSOooBGbwZUpFAkMB2eQPw25wHlSPfHzIc/NFIXM=;
 b=N8yBfGHxShzOGJyTQMgl9nuIuitDEgTUwhe59Pd0pdXOm3dVohpcugHO/jJxTzZJcJMipmBa5w9Jn5xrBk63CRsg191hEizMo9+5HunhQ4gLIWdl8Y02hBTgds7ev+wtvPzta6oLoiSdLgGxfneIIRZ76QIxAjtd8VhcSZT7F2AsdLu/Km1Xcah593TxG6egYzYNivLts2uNAQa0deQ4/hS1uH2hA5qb40pTDrVYT9MCFHJpRgVUyjYzop5p5+CmsIo3+69tDeQP7BtJNMFR95m8w2SU1bV/XcvuSne+FLc47P3QjLrL8Visell1i6U5SGicwcAYp+J9M+g4uM372A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4kxZSOooBGbwZUpFAkMB2eQPw25wHlSPfHzIc/NFIXM=;
 b=hE8C6nQWtgaeYmcPEu7fjV9qVIE0Gf9hfTtGrX9O1Auf9NOkVn/6gDS1DVqiJA2XiO8hfAWHPwjXkoGTLOEs0qNjCtmoMt4SDWn3vPYrE/IKrwUFet3yaFs5DxARdx0+dnrBCAdJSJHYZ1MJD0uqbP4ilQP+tkbiw27AOiYSXww=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by CH3PR12MB9098.namprd12.prod.outlook.com (2603:10b6:610:19e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.25; Tue, 19 Aug
 2025 12:08:48 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%5]) with mapi id 15.20.9031.014; Tue, 19 Aug 2025
 12:08:48 +0000
Message-ID: <de990743-2610-4f5a-a700-b4b7725fc375@amd.com>
Date: Tue, 19 Aug 2025 17:38:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/9] platform/x86/amd/pmf: Call enact function sooner
 to process early pending requests
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org,
 Patil.Reddy@amd.com, mario.limonciello@amd.com, Yijun.Shen@dell.com
References: <20250723064121.2051232-1-Shyam-sundar.S-k@amd.com>
 <20250723064121.2051232-9-Shyam-sundar.S-k@amd.com>
 <ec6d6d81-a574-ee08-a62c-7672769bdfab@linux.intel.com>
 <47604edb-01a9-493b-ba30-bc2bc679edfb@amd.com>
 <07e8c640-72d5-ca1c-411b-3dc2ab8444e8@linux.intel.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <07e8c640-72d5-ca1c-411b-3dc2ab8444e8@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BMXP287CA0003.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::16) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|CH3PR12MB9098:EE_
X-MS-Office365-Filtering-Correlation-Id: a3f6a78f-a3ad-4713-d983-08dddf19276d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bmg1YzY1MzRCSEpvWHlzR2JIaTluSEFoRlRRbUhZSURZdmxmVnZXV3JzR0x1?=
 =?utf-8?B?TkxKbExlMy9YK3FBM1F3azlSN0d1ZUU1L2krc1ozbWNiWU9IRDB4eVdubVM4?=
 =?utf-8?B?RU1VYWVZZHhGdHdCOXdaM0dPWUhkSm9SbGh1K2piMVJPZFVUaXNwTGNFMHpB?=
 =?utf-8?B?RGQrSDNGS2lkQlhhUkxVc3QrRE9vNW5nRElEN2NXcCtsNkQvWm9BaUg3UWJJ?=
 =?utf-8?B?bDBPZXlaTTE4SHRUd0czUjh2RzNReERGVHNPLy82YkVUbTN1RnVmK2pNZVgz?=
 =?utf-8?B?U25MYmNRUG5kTmdYY3E0SHdmQW9tSytKL05FODNnY3F2K3FxUXVpUFBHYzJJ?=
 =?utf-8?B?OUFKa1piWHQxT3JqRnovTlpzeTRmaStsTmVESkVmUmhnSkpiYW5yL1k5b1oy?=
 =?utf-8?B?WjF1ZGdiTjRiVWNGOEFGY0lxV1ZXcm5LbWRTc0p4eTRSRHUrbENGY2tWWGxE?=
 =?utf-8?B?bHErbGFiakwyekdFMWtKZDd1alRrWU9oR0R0dHgzSGx2M0pieEFiNnozeURG?=
 =?utf-8?B?M3p5WCtLRDl0ZnFkSEIzby9NbXJsb0FFSWRDdlpxdkhMUGpEdHhqVVltYjZE?=
 =?utf-8?B?OERMbTR1bGVSSjhxcklQdmRkTmJvTEwydjJhOHB6d2JSb2lRd1J0QjRqZVph?=
 =?utf-8?B?VitMMW5aUVdQV283RW1ISDd0RndtSTY3STdaU29VQzdlVFRGc25zMnJNWmpX?=
 =?utf-8?B?bzVqUmMxY1pHOWhOY1dzRDdYNjM5TzhUWURZSytKTERXOGFLTVp2bCtkaHhK?=
 =?utf-8?B?MFo4N1JXUHROTFJNVlpucXF1ejArRDErUXRPcWtLRm1KYlJ3eXhOa0NxZTYx?=
 =?utf-8?B?eGlKQ0kxU0FMRTFzRHIvMkZPeGdza3BKVnF4N2VBWS9FTEVFTVpnRi9YbUk2?=
 =?utf-8?B?TGl3RHBsWGNnQWY4ZGlNOVptWlRIK0FZUmxJZTRPLzdsblk4K29JbkRXSUVI?=
 =?utf-8?B?eVcxbCt4VE5SQ0tieUg1NDVpNUF4QWNmUUNZUFVVWlQyNk1tR3haZ0VaM0pq?=
 =?utf-8?B?YmU3eHgxdXZmREFQOWRVK1ZHWVVzR2dnSXRXMmQzTEs0NEhldm0ySjFDMlhr?=
 =?utf-8?B?N0JZQno3NFRDTEJaMzdsd3NOR3oyMENlVXF5TVR2WmU1TksyMk5pZ0JHbCt1?=
 =?utf-8?B?M1cwVFhVZHpvR1ZEcCtsSG1NaWNsRUJmN1VzTEwwL0ptUm5ua2F3NDR1RHdS?=
 =?utf-8?B?YjBoOXYwaU1FOFlsVjlCUTR1S2J3WWp1QlZmNlFBWnZZVFBVM012R1ZWcGJ0?=
 =?utf-8?B?UWRkYTJmM1h0VnRNb1ZjaTk1RXdwek5FbE4zemw4eVYzVWNKc0ZjOVVZOGV3?=
 =?utf-8?B?ekluUERuRDh3RGlqakx5R2VDODE1NE5uU1JpaGpYOTMzbjBzdmZtY0xhcFFV?=
 =?utf-8?B?WGtQbk01bU81M1BBN2NaZ1ViRXFrVmRyZHRVRzUrRjVWcm1Kc0xscGJOb0Na?=
 =?utf-8?B?U3VVbzU3cUlSOEdiSFpLOEczaktUWWE0cmo2Q0ZCNjByTnRqRlgzelNSMDVX?=
 =?utf-8?B?TnlnUVh6eit3OXRjazROMG5haTRYazhSZlQ5bHIrSitPc2NtaHdoZGFPTEVD?=
 =?utf-8?B?cWlHem5JMzJaYW5qNHZVRGhLZTMycnFmLzV5Y1VaMDVGZUJXQVkvbUEvV0pr?=
 =?utf-8?B?L0J3ajlzWkM1Zm9aeUYydzl0aXlLRDE1bzJtREY4NUJMTVhIWGw0bi90V1U4?=
 =?utf-8?B?UFh0YnIzOEJlc0xGVktZeHpFMDAxWmJzUzZoVk1UL3FkYTVuTzFxLzR4QnhV?=
 =?utf-8?B?Y1ljYTBOb0RTa0dpbFZoODZ2UURjdTZlelQzajc4ak8yKzlrSGFSamFFanU1?=
 =?utf-8?B?UnhSdXlnSTNXamhJOCtUV0V2azB3NHhDMW1WK3hzeDFXOTY0eHBPZjN3d3dj?=
 =?utf-8?B?VWtRU3JSN2VLbDVXY3N6UGlnZGdwcXB0bzIvb0g2UHVQWDBuMkV4K1YyM3lm?=
 =?utf-8?Q?2Hml+0lpTRI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TzAzSHcrVUhsMVNGdTF1NGxobDVYS084MEZ6RWpsV0JBMkFYOTVwOWIxT3ZW?=
 =?utf-8?B?a3dVcmdLekJvQVZqazB5OGpkMkZGLzRyYmN4V1NsdDZnTnp0ZU5rMndrMEoz?=
 =?utf-8?B?NzRFalRTOFdmWVhMc0cwSzhHamJFN0hOTmlKN2RDNEFTUDNDYm5wcEpPZjVv?=
 =?utf-8?B?WjRubllDc2o1NXJHNmtKSkRsbjZoTlkxczFVMllZWExoKzlrb3Fvd1pVelpO?=
 =?utf-8?B?Y3o3UTk1UkJzUjlnVjlKbnpzQWsySUtvdmI2Uk1ZLzFFM1dBT3RnTkV4REYy?=
 =?utf-8?B?MU9KVXo3bmtmeHBicUdlOWY0RElkVytYalZ0OTRkVDRncFZDWnVEZ2dac1oz?=
 =?utf-8?B?SUpFdGZ3T3lLV2N2SGZrcUtjSUJRdVFhNGp1bnU4Q0JBdzZaT3FrM2RiUFdj?=
 =?utf-8?B?ZVcvU0N2RW5Ibkt3QmpQOHdQU0pYcGNWQUFVMTJtVmgxc254MHdTbkZjbE5t?=
 =?utf-8?B?YVNKZTZQM1dOWnBvUHJFdlIzYkprVzFVSFlKbWFBVjZicGxVdHczT3lBSTR1?=
 =?utf-8?B?OTRjYWxlU21nTDV1Wit6UGpoUGUzaW1IVGFIY2oyV0VQc2R4NitIZ2kzZUNR?=
 =?utf-8?B?QWxzam91NFgxREg3QmNIV0FMQStDSjl2QVFSS0ZuSVZ4eUF5djFldjYzbjla?=
 =?utf-8?B?OUtFempuY2VhZXkvamY3U2liVERIZmllS2RheStkK0NYZTVjTThpV0RFOGRh?=
 =?utf-8?B?cTV4RTM4SWQxVE9KeVc2RmhxZ1JCOVE5YUp0R1lHMU5Nb3ZCTHFOZisvMzlk?=
 =?utf-8?B?MVJFUTNhdktQSytieURaa2F3MUNNWE45Rk5EYlJ5ZWtQYTNibEhWYWYxL05j?=
 =?utf-8?B?cEFWNkVhRzIwU0F0MWJTT2F5bzF4MXhCbTZqWVA4NFlEeURtUThkZkFMN1VY?=
 =?utf-8?B?UjdNRXZ3MGJPZ2Yza1lrYm5SaUZVNHFNV0g2V2xGYXdmSmJKcVF5ZVdmMVhl?=
 =?utf-8?B?RUY1bDhoUG9nOFhzTlIveWp2OEtGTXVwekVBN2pSclpPb3AwTWxpMGphMEli?=
 =?utf-8?B?MnUyeHNibXF6bk0zMXV1WlgwWVNVVUNxaVNTUmJVOU9wcXphb0NlbVdlRHAr?=
 =?utf-8?B?QTVuZzFmWWRSaHVqc2MxV2xua2ZSTHhwZEhSNUZ6a0Fnb1dYNm93WlpMSGhT?=
 =?utf-8?B?bkhqVTBDNkJQQzVMWHRBTy9sL2Q3TUlpajI3MU9ETmttM0IrTmZoUU41N0F6?=
 =?utf-8?B?WUNqT0NYaWl0YVprV1lDNFlyeXVPaWErd3cveU9UV3dtZStyZFJmMnZDMWND?=
 =?utf-8?B?cmxjbk5kL1p2M1paZlE5bVo1R3I2ZGZnelZaN042LzBJSWM2eVM0Nldac0tk?=
 =?utf-8?B?ZTUvVEZOajBMdFg4VFV0ZDdWNmRqMGJlNDErbm9UcEVUeDlON3BFdkVTTjFp?=
 =?utf-8?B?MWtFdkovNjJkOUsya3lSKzZtNCtwa2xLNndWK3Q1RzJhMlBaYlR1Y1IzK091?=
 =?utf-8?B?L25BQW5tNWtxdldSUHNJRWU4dDRndGluRklJajhJMWoyU0VGNmptKzY1ZnI1?=
 =?utf-8?B?c3J2WXd4WThJRkdScXR5TGpDejgzMzluMGl4bVlmdDlQeGI4Qi90NjI0RGlG?=
 =?utf-8?B?SkpCeFRGTVBSWUltRS9JTUVibjVoYU1tZzc0ZjNTVzMzTEVJTG9BMi9hL3Y5?=
 =?utf-8?B?bUVPUHdjSzZrVG5rYncrUmx5K0dzU3BhZUxWQkM5SHFjakF1SDhxRDE3VE9M?=
 =?utf-8?B?aDdudTJQUFVqd3NxREpFTUdkc3JMTHlxWTBwMDdlOUU2MG9iQ2F2TGxMUkw3?=
 =?utf-8?B?bC9PeXJid1AvalpENkF5K3FBVjRFNXdzMWU1ZmduV09oZUtPY2h5VzI5YTJT?=
 =?utf-8?B?ZlJiS0xIcmllTlBncW4wS0FwRmUwSlgwTk9FNkFMTXFrNzBvVlI1WWd1aCtT?=
 =?utf-8?B?MStGQ3BJTzNxMm0vNWZHTTA2dVBkMUhXK0x3YnFBOVpZYVplYXBtYzRyNXhl?=
 =?utf-8?B?ZHBFK3E1Y2tNYTBYZTVERTB4VDd5QjFwMHFTQlBobkFEeEtYeVJBR0lZQnhX?=
 =?utf-8?B?TnhzMHdyc3dGMUl2VTNuUFF2L09kb0JVQjZEZFNvUXJKUlEvQnozNHc0cU12?=
 =?utf-8?B?L2xCdkpMZCttYlU4ZHpYRTAzWEZKQzNNQ2FaOXN2aTRvWG8zY0VPL3daSzhy?=
 =?utf-8?Q?brm9zf8VGyGTaCSDUlfU7SGnc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3f6a78f-a3ad-4713-d983-08dddf19276d
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 12:08:48.8323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i4cPfJVTazCqmM0rPq/pjLRDvxIFisxU1INQ5yU4fVyPFuqJHyYjf9myVfMApAXTB8Qy6ClWRdeuzlM5lvBjKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9098



On 8/19/2025 17:17, Ilpo Järvinen wrote:
> On Tue, 19 Aug 2025, Shyam Sundar S K wrote:
>> On 8/19/2025 16:50, Ilpo Järvinen wrote:
>>> On Wed, 23 Jul 2025, Shyam Sundar S K wrote:
>>>
>>>> Call the amd_pmf_invoke_cmd_enact() function to manage early pending
>>>> requests and their associated custom BIOS inputs. Additionally, add a
>>>> return statement for cases of failure.
>>>
>>> No return statements are added into amd_pmf_invoke_cmd_enact() ??
>>
>> Actually I meant add `return` from the
>> apmf_event_handler_v1()/apmf_event_handler_v2 handler calls.
> 
> That's just replacing the implicit return as you need them after adding 
> code to the tail of the function. I'd just drop that "Additionally," part 
> as it's more confusing that useful.

I get your point. I will reword to reflect the change.

Thanks,
Shyam


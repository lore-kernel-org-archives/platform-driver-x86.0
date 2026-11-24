Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795542167;
	b=oSAk3LMBsloKDEf1NP98sygHbdOF6QU0jfrCQgUezkyKqliWVSSPPv0tpEABiKhR2KUm
	 8Z15iDuyiInTUWWUQ3CfjWejaIm1BaAYXYM8XdGzxzGPRhtXtvoVh8z0Tp5IyxQle50JD
	 uHIxXh65iYsWB9KuiRZlIVE5or8j3eHP2Ik9LUFz7RKLHfFayDhObz29JCNl/sn6itjZx
	 A80uaIbZ15RBoKpBA4dQKpKubr2sKyFcj+cXE/oZgDVLnGUXquG0oUVspJQnuHNkoIgha
	 77pdFQ7l/1MxV7dlrqmT6nri9qFyho4g+TIS0rxNFcr3AEMFAaR4mMH/0FvLTAVuIhA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795542167;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=E9E/zNkmmGg1LCKhecdWIx8YH92O6C7ad4fqQwVz84k=;
	b=0MtQG1JaGF3OD4gPqUgJgJgg1fbnzM8krNAn12tqpyQ+9zoUlL5ApLObnNFRNF+vzKJb
	 cF2S2GWQUaNC1Fjc+yiQbin/HwIEVaao79i9DkhmIY4MGtO9JYlnzXJRlPyTe5MrpqYi5
	 QVS2VnEWBNzYPUAoyA5M+8opcrVVjzvYCzXqAKh/WlvOjq/XCqup0jSNMxi3QAIyLa4b1
	 wn3LkQ1y+HpuZYfRGMKgPtya3sB21uF+dOdL2oWH47x0fuFFi+gIxHrH8sCKBIO5O83hZ
	 1fzU20fpX93DUx6MPKhV4NjIbblGJJKhp674HH7QXTQi9WkFrurtQE5WPB/hct4FwLQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=HoS8nCQW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.13
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013013.outbound.protection.outlook.com [40.93.201.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADEB606A31E;
	Tue, 24 Nov 2026 17:42:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4ADEB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=HoS8nCQW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q0xYjsa/a9iJqDw5peunMV2JMLhnElx7p7fX2ubFT9Okc3GsApaRmId/mS0Mvo6qF3zje9gbC9R87kzW29QYNPOyIbe6e+65Ix+9G4m7NIoL/YRahuDXBQuVcmg5ddTcn4/KevHqi3j28L1njbGV6uxuRJArPgZme1SSAVPB2gi7ghg/8Q4ZlWw2o0dpV9K7Zi9XcJOLmvmTprAKQSvfAdq+v8o+ITlFFpoC6YomwSRY4ZhvP+E7hPaQ7Ye5sfXTb+/zmFKPyq/kW9H/ttVAZMDhLj+CGRg3cK4B03g2nQVSGo/NnfVW60GIQ7aCvSVQxP/AXFYuhJSWdWHOe7xSTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E9E/zNkmmGg1LCKhecdWIx8YH92O6C7ad4fqQwVz84k=;
 b=BRMgT+vQ0On1AF/7hP2/rnPzxoY5xToReAFya1uUwT1TeTX6PDeSb6SVPHGFmjN2p/hkvvPlWiAjXCyVh44keGDA8sQbhry1+RojGUlkSeXu3TSovxNp2uLjyw6HHHdhex5uaVVflTuiyJoTdqMB7BrtxzYzgzj2HE4mm6clxspCX157dnZNykSC9zpxbibnulblwtw4FRa8x74e6S6TIGkp2DJFV2KfbsIjcSoFKbk2GSJS26RwQzyq3Lm+DMOgm9Sz9jr/1dawPv14f321TNkgm3q4SBixjgR+J9pq1tzhCsukfX5sklg9xnoAA5FiGoae+0Bry1IDP5MZnvcvgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E9E/zNkmmGg1LCKhecdWIx8YH92O6C7ad4fqQwVz84k=;
 b=HoS8nCQW4FKbuf9nmLm8p70hco3zRwKiFC1CZuIXlfdrNEBNmsZLV8TB1uqjjNW/LntFsSNWX+0p3U9bmV2joyUNFE90ag9b4zxngDRhEWNBTngLrIPy4S40gBpl1PD88Mgk3LZgU/tHQRMU05iUI6oSuA2TcbdjRn3sB07b/iLQkr9pxoiYhjDXbPNO1cJLhCqigoVFX5dtD6u2fHyq1XsiX6TD8gAAwIhoz4FAuav42T+8eBX45IYK/ST53LNF+mILu8z7ViQfoWZ2yLRD2vRxi5YJXJIP/HamPdNxI3RqZOGBZtAo+n+WxrMgXF1YXU9ILfR8CtdhkE3zGoaPgQ==
Received: from MN0PR12MB5786.namprd12.prod.outlook.com (2603:10b6:208:375::13)
 by SN7PR12MB7883.namprd12.prod.outlook.com (2603:10b6:806:32b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Tue, 24 Nov
 2026 17:42:40 +0000
Received: from MN0PR12MB5786.namprd12.prod.outlook.com
 ([fe80::ae61:c9b4:847b:4854]) by MN0PR12MB5786.namprd12.prod.outlook.com
 ([fe80::ae61:c9b4:847b:4854%5]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 17:42:40 +0000
From: Brian Mak <bmak@nvidia.com>
To: Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hansg@kernel.org>,
	=?utf-8?B?SWxwbyBKw6RydmluZW4=?= <ilpo.jarvinen@linux.intel.com>
CC: Kurt Borja <kuurtb@gmail.com>, Stuart Hayes <stuart.w.hayes@gmail.com>,
	Matthew Garrett <mjg59@srcf.ucam.org>, =?utf-8?B?UGFsaSBSb2jDoXI=?=
	<pali@kernel.org>, Lyndon Sanche <lsanche@lyndeno.ca>, Prasanth Ksr
	<prasanth.ksr@dell.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
	<skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	"Dell.Client.Kernel@dell.com" <Dell.Client.Kernel@dell.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 6/8] platform: dell: smbios: Add quirk for non-functional
 calling interface
Thread-Topic: [PATCH 6/8] platform: dell: smbios: Add quirk for non-functional
 calling interface
Thread-Index: AQHdeUxcJjeWavWmSUeVzbExQlxH3Lc4i6SAgAPKggCAAPelgIAAB+2AgAAuFYA=
Date: Tue, 24 Nov 2026 17:42:40 +0000
Message-ID: <f95b8efb-1719-4b39-9c23-5313903d1d4e@nvidia.com>
References: <20261121000556.173028-1-bmak@nvidia.com>
 <20261121000556.173028-7-bmak@nvidia.com>
 <f3dc7e25-9c22-4b1d-9555-e83db82d05a1@gmx.de>
 <792a7fdd-b2a0-4a2d-88b3-7aecf1af3d7c@nvidia.com>
 <12ff3c7e-0425-42ea-9994-69f9d56a4591@gmx.de>
 <a851c757-3110-4ecc-b920-a98736b190b5@gmx.de>
In-Reply-To: <a851c757-3110-4ecc-b920-a98736b190b5@gmx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB5786:EE_|SN7PR12MB7883:EE_
x-ms-office365-filtering-correlation-id: cb0da800-cd0e-4c91-bf2a-08df4a525646
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|261022113327099003|261026121527099003|261022105027099003|261021123027099003|10067099003|261026140227099003|261028144727099003|261009223027099003|18002099003|22082099003|11063799006|56012099006|4143699003|38070700021;
x-microsoft-antispam-message-info:
 DDDEZ72J8CFsDrvCc21JijFgJu7OmcEluNXYkUk4NMpyO1k9eFaNfPJRLOCGXzn9TBl1Wy0NYru4xQEO+WEw7qIwY47TNjshmJtGb5xcy7c2tmBLFEsL1MFj4no896Ld2xicgwj++845awGQIqUy/dr2Csr2BMkCzlv2qtlSanSocw9e0sCCZOexb6jPBmgrKqw7FCrsvT3fQ9AYaNTMfNBuKgN17ekQedgRQKZ4GtHlJSLEcj2fec3ldWl+FUuv6CPpyNsayBC/ay9LpSJpglaVNxYDWGFIOnAhN9fS5l175MZamKQ1aSPZ2KZm2nhe4OtZ9q4VtO5/Yd7qWfMtIpQUrIYOvc8YOkkUeY8QSM3Bdshd2nw83/Q52Jx+hWVXRSMreKoUcMjC2ajU0MEn4bPtFmwRB2Am46DmuDAVesbX+9WEGrM2Q+PKt+gh6DS81rwPDG8u74Ekkz5+dq/bw4SwlL5uX3If7Z3uz92Z7SeQKn9r6lXp5J0a8zlMfNVr5WjumHVfJ47DI1vJU+3WeLcXeSePwmq1f3kTIWfLAzIpxGYKkxlRMiif3rL0Gdvzk1ADNZD2mJfcsYjeUzbQs2vctxtTDVwfJodpaVkmYrP2x0ZK94d3pdiKT8fPNbiIOn1AiH99N2gk2VGgDsJQjCrBC0hr5mp0/GAaPgbFITSt8phWTjGq5sDtyQR7a7fDsMCuoAaihzgEBXiqYngx/HCb1s8s3h4dV6KMmg+fCg0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5786.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(261022113327099003)(261026121527099003)(261022105027099003)(261021123027099003)(10067099003)(261026140227099003)(261028144727099003)(261009223027099003)(18002099003)(22082099003)(11063799006)(56012099006)(4143699003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MVVYL0tYWFlOTW0vbUZYbDhCNFE4eHVQSHpHR0w4VzBMSlJ1bU1xdnN6U1Vn?=
 =?utf-8?B?Q1JkbGZzSDBUVlRweDAzcUtJcm1qN255M3NVSFE4SFZBQnFJTW1lNGpUVVRP?=
 =?utf-8?B?ZWpvL25ZN2NmNlg1UTdhR3VzOVpKd1IxWW1GVjc4ZTB0eWk0bml3R2dsR1E2?=
 =?utf-8?B?akRReWtnaDlndXZ4blpsRWlHOEdJVTJmUHIvd2RVamhUTmJMNmxyeGNhQU5o?=
 =?utf-8?B?ZnNWdVpNU0RxRFhkeUVUU3QwTVkvTTF0WVRhRkVUUTR3UkhuQ1lWb1RSUWFB?=
 =?utf-8?B?b25QUVViRGdFUzBsa3Q2TksyeUJHNDhzOTFMWVRVdGlDTXZ0aGpiOHRpMEVZ?=
 =?utf-8?B?Snd6dlVYSTVGeDFRWUthcTdiNmJZY3ZPcjlXWWJYc3RELzVoOFZNY1phbmVB?=
 =?utf-8?B?YUtaRXljSXdGUXQvRFM1Kyt2bzRYWXpaMzVPQXJ3NE8rYisvSmpxUDNjREVN?=
 =?utf-8?B?MWZsMStCM0hkRnlVUWhtUngxKzFKdlBpUDRSMnlTU3Q1NlNvRW1jOHVTaGEx?=
 =?utf-8?B?QTdBMDRiMTgxQ0wzUXdoVHdLYkNzWEk2ZVJsZHk2dHNVdlNWRlZpQXVFeVcw?=
 =?utf-8?B?QnIrZExMbzRvb0FpM2FkblYzQ3RjdkIzS1Nlb3B2b0dmSEZ1U2c1TER1cXJz?=
 =?utf-8?B?RHdHVWg2alVDY3JCNXloSVNqalVSOW5VTUxFWW1ncGlrLzFWWElZQUYzdUxC?=
 =?utf-8?B?aFhDM1NXcmNORm5OQnpXdzEvdXRwdGJzRW5GeTVMN1AzbDdhclVpSjV4cGxv?=
 =?utf-8?B?bW94NkhpeHhRRDg2SHZnaXAwS3NGZWowT2I1SWwxUVRuU0o5SFhWeHIybEpo?=
 =?utf-8?B?a2QrOTZReDAwekRsTmJCd3U5T2pubTFNRlNvL01DTTdOM2NoYlB3M2NyMjVy?=
 =?utf-8?B?SHhPQ3Vrbk9kVGs3VXV2K2pLaU15QTA4TzhuWHlXOTdlcWh3SVR1VDlocDY2?=
 =?utf-8?B?VjBzbFFjVCtHdlU2VEhEdWJPM0VIOGVIUHp3ejVEb3VKem81ZTNESWZpY1ha?=
 =?utf-8?B?Q1I4TmFkaHk0TzE4VWl1V2JGUGdCanBkcDRzWncxMUZuOVR2citydHpOQ2Nr?=
 =?utf-8?B?SDZQcnBvMVBNWmpsNlpRY0djZkpURkdTRXc1L3h4Y0JmS1V3U2lkVkpjazdN?=
 =?utf-8?B?TjhSOThPVkxZcjA1ZHZnQUNyaDNkRTc2NzN1S1UwVzFGVVNGYWVUMzRISDQ1?=
 =?utf-8?B?TkVRbGkxNmxuVUdxMytnVnNiTHdweGpKM3JyZjFRaGg2Vjc3WHE1M1UvQTFp?=
 =?utf-8?B?NFNwa0ZsWlFpVUh3TDkzZlErZXNZYzUyMmNqYWkveXFLbU9rcm0wa2REK25K?=
 =?utf-8?B?VWl4SDNEWVVzamNXTi95VFljTFIwL0xWdjNaQmVQN1JwcnJBQk95WTlMakJk?=
 =?utf-8?B?QXQ0SExjb0VSaUQzbGhxSnBUZVJQRDF3cHVNT0hIZk1Qd0xtMEY2S1RlMlVh?=
 =?utf-8?B?cEhNL3lHNTBwVEhUMlZoS09ac1VwbTdoQU15NS9RaWE2VkdTZnRYZVpodzRJ?=
 =?utf-8?B?TEpwUUtEYXhlQzFYUGxRUkVsZEgvSzlGdW9pMlIzSDNMdnNFWkY3Mnh4eUg1?=
 =?utf-8?B?Um5TMHV5TzdtK3g1cy9yekVoZE1CMHZoRkZVV2ZkMnF4TTlpVHFxZy9CQU00?=
 =?utf-8?B?M2VBMzVMUjAvWmVubVpNYm9hcm9NTVJkNmlPN2JWUnhOc1RMK2NrU3BoOFNG?=
 =?utf-8?B?T1BvMDBaNUtuajF4cXY0ZzBOSmZ3Z245ektqclV4K0lRMXZXUnozRnlKcDRT?=
 =?utf-8?B?NjlpM3BNdXdFK05ORStCSTE3NS80ZFJML3FwRkhPLzJWS0dJeWw3bnlQT1pj?=
 =?utf-8?B?TVVUMmliZXI4TWtwRDBUU1E0UE9kb0Z1Z0JGSXVoem1obVRDWHNQdHd0bFdY?=
 =?utf-8?B?VXJDWksyZ2l5V1krdGluQ2ZpMk42bDZoNzdpZHp6cmFMWUlvN2JhWFY5L09K?=
 =?utf-8?B?WHhKRk01akRmQlVUQjd5cTZteXhoR2k1ZUNSYktoOFBwVkI1ZGcyM2twSlRR?=
 =?utf-8?B?QS9kN3J4TEZkdFBxbytkU2tBQ1VCN3h5b282dVFmak1uajVibmo5VktnUjQr?=
 =?utf-8?B?TGEydVFmbkpudjNiZHY5Sk9HZGtGVFh4S3U1ZCs0Uys4UnNhd3pJSURrMExW?=
 =?utf-8?B?UWNZWDViamdsajlaSjVmYzdLdFRJZzNOVUlkR1Faa0ltcXphSDhSSkFScjZH?=
 =?utf-8?B?bUhmQVhCa3o4NjhZUERLQUR1NkNUMW5IVUtSdzJSRHl1b0JGTURkMUNzcXpz?=
 =?utf-8?B?QmZiVkRYWnlMVVd5WDUvUk9UOWtaSHVPeU1rSEpaZTBOcGd2SVdNWXhWcXNo?=
 =?utf-8?Q?go0C583PJ+cP2IUnA6?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EE2D4BA2896E7642B82FD8E2A61309AC@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5786.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb0da800-cd0e-4c91-bf2a-08df4a525646
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2026 17:42:40.4839
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HKzxvDynNrtevCWU+ikTd+TXm0qrZk3ZZN/hsMUF27eZEaDFRmftlpdVpKmifITS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7883

T24gMTEvMjQvMjYgMDY6NTcsIEFybWluIFdvbGYgd3JvdGU6DQo+IEFtIDI0LjExLjI2IHVtIDE1
OjI5IHNjaHJpZWIgQXJtaW4gV29sZjoNCj4+IEFtIDI0LjExLjI2IHVtIDAwOjQzIHNjaHJpZWIg
QnJpYW4gTWFrOg0KPj4+IE9uIDExLzIxLzI2IDA1OjQ5LCBBcm1pbiBXb2xmIHdyb3RlOg0KPj4+
PiBBbSAyMS4xMS4yNiB1bSAwMTowNSBzY2hyaWViIEJyaWFuIE1hazoNCj4+Pj4gQWx0ZXJuYXRp
dmVseSwgbWF5YmUgdGhlIHdyb25nIGJhY2tlbmQgZ2V0IHNlbGVjdGVkLiBDdXJyZW50bHkgdGhl
IA0KPj4+PiBkZWxsLQ0KPj4+PiBzbWJpb3Mtc21tDQo+Pj4+IGJhY2tlbmQgd2lsbCB0cnkgdG8g
cmVhZCBhIHNwZWNpZmljIHRva2VuIGluIHRlc3Rfd3NtdF9lbmFibGVkKCkgdG8NCj4+Pj4gZGV0
ZXJtaW5lIGlmDQo+Pj4+IHRoZSBXU01UIEFDUEkgdGFibGUgaXMgYWN0aXZlLiBUaGlzIG1pZ2h0
IG5vdCB3b3JrIG9uIGFybTY0IA0KPj4+PiBtYWNoaW5lcywgc28NCj4+Pj4gbWF5YmUgcGFyc2lu
Zw0KPj4+PiB0aGUgcmVhbCBXU01UIEFDUEkgdGFibGUgd291bGQgZml4IHRoaXMgcHJvYmxlbT8N
Cj4+Pg0KPj4+IGRlbGwtc21iaW9zLXNtbSBpcyBub3QgYXZhaWxhYmxlIG91dHNpZGUgb2YgeDg2
LCBhcyBpdCBkZXBlbmRzIG9uDQo+Pj4gRENEQkFTLCB3aGljaCBkZXBlbmRzIG9uIFg4Ni4gSXQg
d291bGQgb25seSBiZSB1c2luZyB0aGUgV01JIGJhY2tlbmQuDQo+Pj4NCj4+PiBUaGFua3MsDQo+
Pj4gQnJpYW4NCj4+DQo+PiBJZiBpIHVuZGVyc3RhbmQgdGhlIEFDUEkgY29kZSBjb3JyZWN0bHks
IHRoZW4gaXQgc2VlbXMgdGhhdCB0aGUgV01JIA0KPj4gaW50ZXJmYWNlIGludGVyYWN0cyB3aXRo
IGEgT3BlcmF0aW9uUmVnaW9uIGhhbmRsZWQgYnkgdGhlIEFSTUwwMDAyIA0KPj4gZGV2aWNlLCBh
c3NvY2lhdGVkIHdpdGggdGhlIEFSTSBGRkEgaW50ZXJmYWNlLg0KPj4NCj4+IEFGQUlLIHRoZSBs
aW51eCBrZXJuZWwgY3VycmVudGx5IGRvZXMgbm90IHN1cHBvcnQgdGhpcyBkZXZpY2UsIG1heWJl
IA0KPj4gdGhpcyBpcyB0aGUgcmVhc29uIHdoeSBhbGwgU01CSU9TIGNhbGxzIGZhaWwuDQo+IA0K
PiBBZnRlciBkb2luZyBzb21lIG1vcmUgcmVzZWFyY2ggaXQgc2VlbXMgdGhhdCB0aGUgYXNzb2Np
YXRlZCBXTUkgbWV0aG9kDQo+IHRyaWVzIHRvIGNhbGwgYSBBUk0gRkZBIHNlcnZpY2UgdXNpbmcg
YSBGRml4ZWRIYXJkd2FyZSBvcHJlZ2lvbi4gDQo+IFRoZW9yZXRpY2FsbHkgTGludXggYWxyZWFk
eSBzdXBwb3J0cyB0aGlzLCBkaWQgeW91IGVuYWJsZSBDT05GSUdfQUNQSV9GRkg/DQoNCkhpIEFy
bWluLA0KDQpXZSB1c2UgRkZIIG9mZnNldCAyIGZvciB0aGlzLCB3aGljaCBpcyBub3Qgc3VwcG9y
dGVkIGJ5IENPTkZJR19BQ1BJX0ZGSCANCihvbmx5IHN1cHBvcnRzIG9mZnNldHMgMCBhbmQgMSks
IGJ1dCBpcyBzdXBwb3J0ZWQgYnkgdGhlIG52aWRpYS1mZmEtZWMgDQpkcml2ZXIgd2UgY3VycmVu
dGx5IGNhcnJ5IG91dC1vZi10cmVlOg0KDQpodHRwczovL2dpdGh1Yi5jb20vTlZJRElBL05WLUtl
cm5lbHMvYmxvYi9VYnVudHUtbnZpZGlhLWJvcy03LjAuMC0yMDIyLjIzL2RyaXZlcnMvcGxhdGZv
cm0vYXJtNjQvbnZpZGlhLWZmYS1lYy5jDQoNCmh0dHBzOi8vZ2l0aHViLmNvbS9OVklESUEvTlYt
S2VybmVscy9jb21taXQvNjk5ZWMzZGNjNjJjZTA5ZjA3MTYyNTMwNzA3OWRjN2Q2OGQ4NzY3ZQ0K
DQpUaGFua3MsDQpCcmlhbg0KDQo+IFRoYW5rcywNCj4gQXJtaW4gV29sZg0KPiANCj4+IEkgYWxz
byBub3RpY2VkIHRoYXQgdGhlIGRldmljZSBzdXBwb3J0cyB0aGUgV01JIGludGVyZmFjZSB1c2Vk
IGJ5IHRoZQ0KPj4gZGVsbC1zbW0taHdtb24gZHJpdmVyLiBJZiB5b3Ugd2FudCBpIGNhbiB0cnkg
dG8gZW5hYmxlIHRoaXMgZHJpdmVyIG9uDQo+PiBhcm02NCB0b28sIGJ1dCBJTUhPIGl0IHNob3Vs
ZCBiZSBjb25zaWRlcmVkIG9wdGlvbmFsIGF0IGJlc3QuDQo+Pg0KPj4gVGhhbmtzLA0KPj4gQXJt
aW4gV29sZg0KPj4NCj4+Pj4gVGhhbmtzLA0KPj4+PiBBcm1pbiBXb2xmDQo+Pg0KPj4NCg0K

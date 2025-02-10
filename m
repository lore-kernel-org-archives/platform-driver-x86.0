Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2087.outbound.protection.outlook.com [40.107.237.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBBC51B414A
	for <platform-driver-x86@vger.kernel.org>; Mon, 10 Feb 2025 20:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739219435; cv=fail; b=fWEzXxijPywrKJVM+6KzCzCcA54a1MHeeoWiJWpfS1LPPHJOMHVY+q1eaWz4EUFApoWoDbjp4H5E7vuOULfSdPBfdx7HmFYG2v1432UA2dSHd3f8sMRZbHe8LrDg6nCGqWYENA/Cjqe7znQg0DHnb3eg8qnWyTv1CTeUiXRhSm8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739219435; c=relaxed/simple;
	bh=J59Q7jdssj9k/KRju6534+TiA+Lz58qWkP649yqZ2xo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mIArlPbquf2PNhEj/iIaAUoBS/x6UnyUPLvTLAa+YU1G+MRRB8ZA+n7Yy+tzIU9pbp5b2GuS5AiLP+iMJDr9BPGUHxPpwlcGLEK02dTGyc3NMsqk8kLsBDdeylxhShifr6BfgpS88GuZSglucsc7NAT+nLCf2BYSrsdDdVaEG0U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=IFO77PAA; arc=fail smtp.client-ip=40.107.237.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="IFO77PAA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lyTV/eGszTO69kuWbJiCJ/0e/iQ7ybgpqCnL8/Q5Kf4sDUMiia0lVu8x1GsnMQzktf+y/tZdvNac1nfylPReGB7Z+NxA58g0YBj+9krzaLm/45+HbkRu/RkBIKZ4pPuLjosk2HnuotiuXmenqGSx0MO/do46xn0FQmW8shRFbzobqunOT0ZRIwZpCmSIJg+aDV59UPD7y/PdPJy2O1G8Aar9hLx0a+zBAyUqyZH2hqTDByD/vCzzfRcKBNFyzROocsXQSPIDsok5cO28z52bDjCoXo3dGbAkI8g2IXn+K7JD6tceLnzBkBRfEeOZ0DSCpGMNiHKDbgag4m2V3ay3NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J59Q7jdssj9k/KRju6534+TiA+Lz58qWkP649yqZ2xo=;
 b=pvpkYdO24ilasca7APANvsM4j/s+GlGKXg9qozq59CzoFQ70xCwDxXQQGzErfNMRuKIEArgkcCweLP/PdyvPNkIKC+RAAGF1s8NV9Ox1rJH7G5Bd9rdMweBwPkCYZXIflWbQWmKxVmZMjiQ5BKzm34KcGlCCQ+2LcjGZMfqNq8Lj30KbO9qp2RSMznkJnjJ/bsU5jjNGxjdBGKvW/yA0FOLPTTKZ/a4oHFxLV5HN5TI45Eh5nKO0DRF/c+tnXtRwK938Tqm9888l7MpN0AeaBk8S3Zhd9UuB1AEp4irkADGJ2ZgmRQXqgs1Je4cXe7XphoeK4d0WEd31rqJ5VwiygA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J59Q7jdssj9k/KRju6534+TiA+Lz58qWkP649yqZ2xo=;
 b=IFO77PAADhNHYGIEJ+KSy5PS+zXhEyUoopEtqRQ7LVRtLfolI0lTvtvmYUeVBcrpe4nD3ACuIFzRW20q+yxlrgrZ/TvjhXTLjVcvhpKAeeS+g1Tmfp1du+WPzJP2elyRSjulQ/Be1YVR/T/emMNWL6Xx6gKYJ1d2ScSYmvq5gGtaiX1NEIuA5R5JJsjNw+x1LYTH/3IoOgxNma3dhBXmtokw3QbObO+7Wi54MPaSTApd6aJ84vBSIZFfK1CSEyfj/IoEh0jgpEWoHbHhEJFfJBAuLUldvwQMIVBP2PfpY2hSk5yMYhzryWHN7EQ5oGpM610w1rb6kGwzoCpqQRLohQ==
Received: from PH7PR12MB6668.namprd12.prod.outlook.com (2603:10b6:510:1aa::12)
 by SN7PR12MB8435.namprd12.prod.outlook.com (2603:10b6:806:2e2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 20:30:30 +0000
Received: from PH7PR12MB6668.namprd12.prod.outlook.com
 ([fe80::6d5b:2553:adc8:b6a6]) by PH7PR12MB6668.namprd12.prod.outlook.com
 ([fe80::6d5b:2553:adc8:b6a6%6]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 20:30:30 +0000
From: Vadim Pasternak <vadimp@nvidia.com>
To: =?utf-8?B?SWxwbyBKw6RydmluZW4=?= <ilpo.jarvinen@linux.intel.com>
CC: Hans de Goede <hdegoede@redhat.com>, Michael Shych <michaelsh@nvidia.com>,
	Ciju Rajan K <crajank@nvidia.com>, Felix Radensky <fradensky@nvidia.com>,
	Oleksandr Shamray <oleksandrs@nvidia.com>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: RE: [PATCH v5 05/12] platform/mellanox: mlxreg-hotplug: Add support
 for new flavor of capability registers
Thread-Topic: [PATCH v5 05/12] platform/mellanox: mlxreg-hotplug: Add support
 for new flavor of capability registers
Thread-Index: AQHbboVumVnZXhPjSUu0GDums6bwr7M1pzEAgAtUAKA=
Date: Mon, 10 Feb 2025 20:30:30 +0000
Message-ID:
 <PH7PR12MB66687E5512AB0A506A411C70AFF22@PH7PR12MB6668.namprd12.prod.outlook.com>
References: <20250124172632.22437-1-vadimp@nvidia.com>
 <20250124172632.22437-6-vadimp@nvidia.com>
 <13c4d945-a9e3-05ec-a805-573980505f3f@linux.intel.com>
In-Reply-To: <13c4d945-a9e3-05ec-a805-573980505f3f@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB6668:EE_|SN7PR12MB8435:EE_
x-ms-office365-filtering-correlation-id: 5f2d5854-949b-4ef3-2645-08dd4a11c2e3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?U29rVTZ3U1Nlc2FuZ3gzNDNreERrVE1zcVoxYmhITElsSk5DR1dqWjVRSkJ1?=
 =?utf-8?B?OWFBY2RWckMySWdLdTBYZElmd0gwRytRTzh2NEtmL0RuWHRGZ29ZNWNWejEy?=
 =?utf-8?B?blRuSUM0T1VHK0xqOENsRkZ2ekJZZkV6Z2phR3lLVmw0TER2aDNvaWR5RUpL?=
 =?utf-8?B?Wng5UXFUR2hIWWdseEwxNERBYjRWY1V5ZEVLNVhhTUMxRFNodThjTi9KUlhv?=
 =?utf-8?B?WG9Sa2lacEg0MHVBOTlCU1ozVXNLVUY5RGVudmRrR2hrR3YyOG5wTklNWGhJ?=
 =?utf-8?B?aVl4U2svanVJOUhoQXRKQnpCQTZvRVNDc3FlNkZVbXpjTjFsWm0rZFg4RHlk?=
 =?utf-8?B?TE16aHdFS2hmSWR5Ty8xTDN5V1hpNWZ4aE5hL29PQTBwZSs2N3BSVWlhSkNv?=
 =?utf-8?B?YWxmNGxMOVo0dFZSc01ab1Nyd3JOL0JuR2hpdlIrMXlWcmJnZFFydmRMVTEx?=
 =?utf-8?B?SVB4ZUVzSHBHeTlkdnBZS3p0OTdyYmFyV0tMUUNjbFRzRUtQVHA3eDBYUDlX?=
 =?utf-8?B?SXR5Z0ZYQm16dWN5UnFCSjdwME55NStIajB3TWEvNHB6Yk5tYkpDT0ZLL3p1?=
 =?utf-8?B?RXdwMWlVaStlTUFoK0R4YXMzSXhteURkc3FleXNmZG1lVHVxOWRJMW51ZDEy?=
 =?utf-8?B?TlhRLzRiRjI5NUNoNFFHRHR4NHY1M1dtZ1JoSTFjaDhzSGJrTkZWVXNqcWR4?=
 =?utf-8?B?UGVyUGFodjAyOTdwUEJaYzE3U25ZTU5VWXJJNWI5QWxreW42Ui9FaG1GSUxP?=
 =?utf-8?B?Y1ZPZm9QVnhwYzNINUVhbnU0Wjk2YjJIRWtEWUtsM3BKMWRyeFNMOWJlSWdO?=
 =?utf-8?B?UGQ2WTA0YjJNZlZ5NGI2VVVleWgwR2ljSmZPcFEyQmRsakhpWXRJWXVUQkxh?=
 =?utf-8?B?WmpmdFA2eGcwU3NZM2dKcVI5V0x5SEVPck9DdjMzRGxINTBYUGRtLzFIMFZi?=
 =?utf-8?B?MUYwTmE0NXVtUVR2UUU3Z3hiY2E5bjVqSlFRQkJoUktaYnoyNmxMdGxIVmZ1?=
 =?utf-8?B?QTRvOXErbGZlWjdWUkhpOFFRSERQS1F3SDM4cXJvYkJUTUloRVVKeC9LWllG?=
 =?utf-8?B?RzlEenlxSFV2WlUrNkFTbHVmMVUvUTQ3MHEyL2FRUzBhQnF4bXNSWTVqOUow?=
 =?utf-8?B?WisxemlPNzZHaW5TMVE0UDMzVHdMT21aUXdudjVMMXo4OVcvTTl4c3hoR2lD?=
 =?utf-8?B?ZHc5VVFCMkdWM281UVlRb1IvMjRBLzZHcU5GMkVRZVN6eUlmR05jMmFaWTdE?=
 =?utf-8?B?MVJ6dDM4YVg0RUw4S1JjUndHN21vVm5vSWdERmpDNXVQazhlcnFFZVcraHA2?=
 =?utf-8?B?MGJyLzFNeE5DMkd6SGZ2SUZkZUtvVUFlZEVVWDVWQ1granRCM0tGRVVVZ1hz?=
 =?utf-8?B?QUxPWFlhbHFtTmRMYkNaakVkTThMbkVaSkhTd01ha21PaWJzOEZJM3RYUDFF?=
 =?utf-8?B?eXVPblF2T3FjMkV1WHJCZU8xV2hiVk5MWklucm1hdlBjWTV6NXRORFVxSkJT?=
 =?utf-8?B?TTRqd283VWtqS1llVXc1Sjg5OGRnUi9wOElkSWJxRm5LZk1hU2RYSEVVMG9t?=
 =?utf-8?B?RThNL29lbHRYNVRzRGlOQnYyb0svTE80L3piODNYUFJ5NEtnYUd3ZnNZNVlB?=
 =?utf-8?B?Qktkei9jQVRHUjVVdy9QMGlHVjBWOVNxUTBPdlo3UWhnd2lSaldiRHA0bGlR?=
 =?utf-8?B?UmVOTVZwQkNTcXplZHFLMVFGRjEyMVhSK1hrRS9ZZGc2b1Vrb1JYUWtZUU1L?=
 =?utf-8?B?OXh6Z1BoZnpybzJzUHNWWll1dUlDcWlzV3JSWHdOVlhRdkVzTTBTWEZ2cTRo?=
 =?utf-8?B?RE9wNkJ3WThZTVVtSk15S2hJTjQ4bzBmcXhOYktITFNFV3hJTXJnK3R2OFBM?=
 =?utf-8?B?UkZLY2wxNTVTck5jWTUxSDdacWxCUEY1M1I0Q1lldlNaSm4xQm4rb1hiWW9E?=
 =?utf-8?Q?z7xS4IBNrqXiXSMvxvQAW9erbRf6AiA3?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB6668.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cmRGTkZwSUl6K0lPbXpoSHVOZVc0U2E3eHZackdQdS9uL1dNV3FTYjE3alQ3?=
 =?utf-8?B?RUtYN2hXMVNIc3IxTytISjZlYnRZYjhzaitOQUFmaUE4VTJtK25Xd2FleUVy?=
 =?utf-8?B?N3NuNHE0dG1tcDJjaXZPVGVEZUw0WFB1VzZyMjQwUGhUc3JiN0g3K0MxVXFD?=
 =?utf-8?B?bnVHK3VqWHBJelEzT0o0QTlkamsxK2tlQ0wrVCtXVE9Uem9veEh5NGNhdkZ2?=
 =?utf-8?B?TDl5N0NjMVJhUEZ2UXJ5S1dxdnorMTBaQVZWSHdkYmVEbDE2aW1pY3FhWnpI?=
 =?utf-8?B?RVZZS0JzZWVrZ2Npb1JQZjM1SGFndFQ4MEw0UTF0dEMvaFV6ZTVvai9IY21u?=
 =?utf-8?B?NDlZQk1VUmhEWGFKaTZUMkRKWm5taEt4dnplT1U0Rk1YZll4alp3L3p2bVdh?=
 =?utf-8?B?Y3BjbGFqUkhOd3JTV1pwR2lVNEpqL3lkcFBRWURDd0RrMkQrMDVJYVhzMU5U?=
 =?utf-8?B?YnRWVkJoZ3RFc21ScjJleElJMnlWS3VsMVJ6UDRxazVBTWtYZlU1ZFJhcGQz?=
 =?utf-8?B?SFNhZENwdTFISUxLenFDdHZ6ZTUvbFFxbytCUmV1eUpIbGIzSG1yaHRkZERV?=
 =?utf-8?B?NFUvSk9MdmdyclZBTHJEaVdkVGNqNDBlU1FhNzNGQXpKbi90R0pvZkZRYjhq?=
 =?utf-8?B?bS9ONWdVZ0IwMW8zQkRPci8xSEN0RHRTT0ZmY2Ewd3pneFV1WXEzUGdqYzdH?=
 =?utf-8?B?NU5EczZ0dG1QeWtuZ1ZvUE8yS1BuV3ZFTjI4U2Q5ak9LaEZLak1yaFRLN2VJ?=
 =?utf-8?B?bWNXeW53SkVxN1ZLRk5GNUFSK21XQzNKTG4vQmZVTVkrdWhlMm9URzFKZFor?=
 =?utf-8?B?V3pSKzFFdlpNTHNRdk8rNExpZDluVVVFSEhKY3RvN0dDSmV1bURtTnBMSElJ?=
 =?utf-8?B?QVkyc1Q3eWxsWkhKcG1yRko3a0pRNURjZmJrL1ZoVlNsd1FGajVxekJBc0g3?=
 =?utf-8?B?YjhFV3U4NkYxb1BXN0p4RDF6ZzQ4eGRtUlFkdU5wL3FKcDJvR2ZrZFhUZ1hR?=
 =?utf-8?B?SkVGUjdSdlB3N3V6OVZKamJoTTVQdVdBdnE5Vk5QR0xiVTVBTjQweTJXVWor?=
 =?utf-8?B?cGJxaWpsWlNPTW50S1FHVDFHU0FnZmZkSkRPbVMyb2VwclZvSlF3blRzNlhH?=
 =?utf-8?B?M3FvSTg5UUovMkpoMERNN3dXeHlBVHVpN3NHZXV1L1ZxUDlpZzZJK1g3WUpH?=
 =?utf-8?B?RldGQVJBcXdGL3FlekxURmlZVm16aitCRmFYNnJhejJKbmw5Zm9ROVd0L1pz?=
 =?utf-8?B?dExsOGlPd0UrejVNOThTcjRpeWRtYlVEaFJjZGR2cTFZMmppQXBzaG9mNFRk?=
 =?utf-8?B?bFA3V0ZGSlRieXhnSFNGT1o2cCtRalN3NDhvZ0ZxbUk0RWVRMU5uTVhWMzR5?=
 =?utf-8?B?eUxuQ2FrQUxlRW54cUpsaCtyckFGNmZTcFNlMjN1dVRpOFpIMmJ3anJIUlgv?=
 =?utf-8?B?L3J2M2M3aW5xUkNSN1dCbmZ0dWdGZlJrUjVRR1ZHcll0RWN6OWlKbEY3NVk3?=
 =?utf-8?B?UW1wRTJ6aGxxd0o3QWZ3K0pRMFp1S1RzQ2RLeEpGVThNOFBIQUFVaC8xdjJB?=
 =?utf-8?B?cjMvWmwxbllVVGJCQmV3bFdhRGUwQWpQSWF4NEd3ZWxRMjRNWk9zRWJkS0xs?=
 =?utf-8?B?bXBodnZpOWwwcHdadnAzYmdmQUxuQk1vMUZiTHZ6WlQvNnp2UjBHTGM2MDk4?=
 =?utf-8?B?SkYxNjdjbWxzK1hrRWJlbGVWak1nK0FFQ0hXMjZlWWpuTnNjNEVVNTdGaDZF?=
 =?utf-8?B?Y1VyMUEyR2JzdEVIdnZJdkZEZVBLUUZjWnphajNxcDVrbzFuNnFQTnlvM3F3?=
 =?utf-8?B?M2dHYURZVnhzQmN2MlQwdnk4cktkZENKYnRTa2hDYytSMnJEc2ZpTDRrK0Ry?=
 =?utf-8?B?WER6QituUjRvbFNMN0RSb1B2QW5Rbjl1ektTUEpqdTMvTkZYV0htQW91VU1X?=
 =?utf-8?B?NTN4NXVmTEhhNlFUU0tpS0VrWUZBMTZQODRQWHRHZjl6TmhvakN6SitSQit3?=
 =?utf-8?B?RTY0NmJDZlZ0a29IQjdLVldwZE1tc2lvQWF5M3VNRzJWaURscWkwVDcvUVNu?=
 =?utf-8?B?QW9SNlRSMmFvTVRqT2xNTWw3bjZJMTN3SzRHSWdjYXZORTZQaXRmRWJrOFVL?=
 =?utf-8?Q?x6sU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6668.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f2d5854-949b-4ef3-2645-08dd4a11c2e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2025 20:30:30.0449
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Dyq4Y3aBUXwZQgsjO1uIjjzbBn14A+y20/6JEMXEIHYibHnk8JYlyjBs4TZqHWSkn2no7toHHU67J7c47+xoRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8435

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSWxwbyBKw6RydmluZW4g
PGlscG8uamFydmluZW5AbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBNb25kYXksIDMgRmVicnVh
cnkgMjAyNSAxNTo0Nw0KPiBUbzogVmFkaW0gUGFzdGVybmFrIDx2YWRpbXBAbnZpZGlhLmNvbT4N
Cj4gQ2M6IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+OyBNaWNoYWVsIFNoeWNo
DQo+IDxtaWNoYWVsc2hAbnZpZGlhLmNvbT47IENpanUgUmFqYW4gSyA8Y3JhamFua0BudmlkaWEu
Y29tPjsgRmVsaXggUmFkZW5za3kNCj4gPGZyYWRlbnNreUBudmlkaWEuY29tPjsgT2xla3NhbmRy
IFNoYW1yYXkgPG9sZWtzYW5kcnNAbnZpZGlhLmNvbT47DQo+IHBsYXRmb3JtLWRyaXZlci14ODZA
dmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjUgMDUvMTJdIHBsYXRmb3Jt
L21lbGxhbm94OiBtbHhyZWctaG90cGx1ZzogQWRkDQo+IHN1cHBvcnQgZm9yIG5ldyBmbGF2b3Ig
b2YgY2FwYWJpbGl0eSByZWdpc3RlcnMNCj4gDQo+IE9uIEZyaSwgMjQgSmFuIDIwMjUsIFZhZGlt
IFBhc3Rlcm5hayB3cm90ZToNCj4gDQo+ID4gSG90cGx1ZyBwbGF0Zm9ybSBkYXRhIGlzIGNvbW1v
biBhY3Jvc3MgdGhlIHZhcmlvdXMgc3lzdGVtcywgd2hpbGUNCj4gPiBob3RwbHVnIGRyaXZlciBz
aG91bGQgYmUgYWJsZSB0byBjb25maWd1cmUgb25seSB0aGUgaW5zdGFuY2VzIHJlbGV2YW50DQo+
ID4gdG8gc3BlY2lmaWMgc3lzdGVtLg0KPiA+DQo+ID4gRm9yIGV4YW1wbGUsIHBsYXRmb3JtIGhv
cHRwbHVnIGRhdGEgbWlnaHQgY29udGFpbiBkZXNjcmlwdGlvbnMgZm9yDQo+ID4gZmFuMSwgZmFu
MiwgLi4uLCBmYW57bn0sIHdoaWxlIHNvbWUgc3lzdGVtcyBlcXVpcHBlZCB3aXRoIGFsbCAnbicN
Cj4gPiBmYW5zLCBvdGhlcnMgd2l0aCBsZXNzLg0KPiA+IFNhbWUgZm9yIHBvd2VyIHVuaXRzLCBw
b3dlciBjb250cm9sbGVycywgQVNJQ3MgYW5kIHNvIG9uLg0KPiA+DQo+ID4gRm9yIGRldGVjdGlv
biBvZiB0aGUgcmVhbCBudW1iZXIgb2YgZXF1aXBwZWQgZGV2aWNlcyBjYXBhYmlsaXR5DQo+ID4g
cmVnaXN0ZXJzIGFyZSB1c2VkLg0KPiA+IFRoZXNlIHJlZ2lzdGVycyB1c2VkIHRvIGluZGljYXRl
IHByZXNlbmNlIG9mIGhvdHBsdWcgZGV2aWNlcyB0aHJvdWdoDQo+ID4gdGhlIGJpdG1hcC4NCj4g
DQo+IEhpLA0KPiANCj4gRG9uJ3QgbGVhdmUgbm9uLWZ1bGwgbGluZXMgaW4gbWlkZGxlIG9mIGEg
cGFyYWdyYXBoLg0KPiANCj4gPiBGb3Igc29tZSBuZXcgYmlnIG1vZHVsYXIgc3lzdGVtcywgdGhl
c2UgcmVnaXN0ZXJzIHdpbGwgcHJvdmlkZQ0KPiA+IHByZXNlbmNlIGJ5IGNvdW50ZXJzLg0KPiA+
DQo+ID4gVXNlIHNsb3QgcGFyYW1ldGVyIHRvIGRldGVybWluZSB3aGV0aGVyIGNhcGFiaWxpdHkg
cmVnaXN0ZXIgY29udGFpbnMNCj4gPiBiaXRtYXNrIG9yIGNvdW50ZXIuDQo+ID4NCj4gPiBTb21l
ICdjYXBhYmlsaXR5JyByZWdpc3RlcnMgY2FuIGJlIHNoYXJlZCBiZXR3ZWVuIGRpZmZlcmVudCBy
ZXNvdXJjZXMuDQo+ID4gVXNlIGZpZWxkcyAnY2FwYWJpbGl0eV9iaXQnIGFuZCAnY2FwYWJpbGl0
eV9tYXNrJyBmb3IgZ2V0dGluZyBvbmx5DQo+ID4gcmVsZXZhbnQgY2FwYWJpbGl0eSBiaXRzLg0K
PiA+DQo+ID4gUmV2aWV3ZWQtYnk6IEZlbGl4IFJhZGVuc2t5IDxmcmFkZW5za3lAbnZpZGlhLmNv
bT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBWYWRpbSBQYXN0ZXJuYWsgPHZhZGltcEBudmlkaWEuY29t
Pg0KPiA+IC0tLQ0KPiA+IHYyLT52Mw0KPiA+IENvbW1lbnRzIHBvaW50ZWQgb3V0IGJ5IElscG86
DQo+ID4gLSBDaGFuZ2Ugcm9sMzIoKSB0byBzaGlmdCBsZWZ0Lg0KPiA+IC0tLQ0KPiA+ICBkcml2
ZXJzL3BsYXRmb3JtL21lbGxhbm94L21seHJlZy1ob3RwbHVnLmMgfCAyMg0KPiA+ICsrKysrKysr
KysrKysrKysrKysrLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wbGF0Zm9ybS9tZWxs
YW5veC9tbHhyZWctaG90cGx1Zy5jDQo+ID4gYi9kcml2ZXJzL3BsYXRmb3JtL21lbGxhbm94L21s
eHJlZy1ob3RwbHVnLmMNCj4gPiBpbmRleCAwY2U5ZmZmMWY3ZDQuLmM1MjViODc1NGQ0OCAxMDA2
NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3BsYXRmb3JtL21lbGxhbm94L21seHJlZy1ob3RwbHVnLmMN
Cj4gPiArKysgYi9kcml2ZXJzL3BsYXRmb3JtL21lbGxhbm94L21seHJlZy1ob3RwbHVnLmMNCj4g
PiBAQCAtMjc0LDYgKzI3NCwxMiBAQCBzdGF0aWMgaW50IG1seHJlZ19ob3RwbHVnX2F0dHJfaW5p
dChzdHJ1Y3QNCj4gbWx4cmVnX2hvdHBsdWdfcHJpdl9kYXRhICpwcml2KQ0KPiA+ICAJCQlpZiAo
cmV0KQ0KPiA+ICAJCQkJcmV0dXJuIHJldDsNCj4gPg0KPiA+ICsJCQlpZiAoIXJlZ3ZhbCkNCj4g
PiArCQkJCWNvbnRpbnVlOw0KPiA+ICsNCj4gPiArCQkJLyogUmVtb3ZlIG5vbi1yZWxldmFudCBi
aXRzLiAqLw0KPiA+ICsJCQlpZiAoaXRlbS0+Y2FwYWJpbGl0eV9tYXNrKQ0KPiA+ICsJCQkJcmVn
dmFsID0gKHJlZ3ZhbCAmIGl0ZW0tPmNhcGFiaWxpdHlfbWFzaykgPDwNCj4gPiAraXRlbS0+Y2Fw
YWJpbGl0eV9iaXQ7DQoNCkFmdGVyIGRyb3BwaW5nICdjYXBhYmlsaXR5X2JpdCcsIGl0J2xsIGJl
IGp1c3QgbWFza2luZyBvZiB1bnVzZWQgYml0czoNCg0KCQkJLyogUmVtb3ZlIG5vbi1yZWxldmFu
dCBiaXRzLiAqLw0KCQkJaWYgKGl0ZW0tPmNhcGFiaWxpdHlfbWFzaykNCgkJCQlyZWd2YWwgPSAo
cmVndmFsICYgaXRlbS0+Y2FwYWJpbGl0eV9tYXNrKTsNCg0KPiANCj4gV2hhdCdzIGluIHJlZ3Zh
bCBhdCB0aGlzIHBvaW50PyBXaGF0IGl0IHdhcyBiZWZvcmUgdGhpcyBwYXRjaD8NCj4gDQo+ID4g
IAkJCWl0ZW0tPm1hc2sgPSBHRU5NQVNLKChyZWd2YWwgJiBpdGVtLT5tYXNrKSAtIDEsIDApOw0K
PiANCj4gSSdtIHNvcnJ5IGJ1dCB0aGF0IGNvbW1lbnQgZGlkbid0IHJlYWxseSBoZWxwIG1lIHVu
ZGVyc3RhbmQgd2hhdCdzIGdvaW5nIG9uDQo+IGhlcmUgd2l0aCB0aGUgZG91YmxlIGZpZWxkIG1h
c2sgZ2VuZXJhdGlvbi4NCg0KDQoNCg0KPiANCj4gSXMgdGhlIGNvZGUgY29ycmVjdCBib3RoIGJl
Zm9yZSB0aGUgYWRkaXRpb24gb2YgdGhlIGV4dHJhIHN0ZXAgYW5kIGFmdGVyIGl0Pw0KPiBCZWNh
dXNlIEkgY2Fubm90IHdyYXAgbXkgaGVhZCBhcm91bmQgd2hhdCB0aGlzIGNvZGUgYXR0ZW1wdHMg
dG8gZG8gYW5kDQo+IGhvdyBjb3VsZCBpdCBiZSBjb3JyZWN0IGJvdGggcHJlIGFuZCBwb3N0IHRo
aXMgY2hhbmdlLg0KPiANCj4gRllJLCBJJ3ZlIHRha2VuIHBhdGNoZXMgMS0zIG9mIHRoaXMgc2Vy
aWVzIGludG8gcmV2aWV3LWlscG8tbmV4dCBhcyB0aGV5IHNlZW1lZA0KPiB0cml2aWFsIGNoYW5n
ZXMuDQo+IA0KPiAtLQ0KPiAgaS4NCj4gDQo+ID4gIAkJfQ0KPiA+DQo+ID4gQEAgLTI5NCw3ICsz
MDAsMTkgQEAgc3RhdGljIGludCBtbHhyZWdfaG90cGx1Z19hdHRyX2luaXQoc3RydWN0DQo+IG1s
eHJlZ19ob3RwbHVnX3ByaXZfZGF0YSAqcHJpdikNCj4gPiAgCQkJCWlmIChyZXQpDQo+ID4gIAkJ
CQkJcmV0dXJuIHJldDsNCj4gPg0KPiA+IC0JCQkJaWYgKCEocmVndmFsICYgZGF0YS0+Yml0KSkg
ew0KPiA+ICsJCQkJLyoNCj4gPiArCQkJCSAqIEluIGNhc2Ugc2xvdCBmaWVsZCBpcyBwcm92aWRl
ZCwgY2FwYWJpbGl0eQ0KPiA+ICsJCQkJICogcmVnaXN0ZXIgY29udGFpbnMgY291bnRlciwgb3Ro
ZXJ3aXNlDQo+IGJpdG1hc2suDQo+ID4gKwkJCQkgKiBTa2lwIG5vbi1yZWxldmFudCBlbnRyaWVz
IGlmIHNsb3Qgc2V0IGFuZA0KPiA+ICsJCQkJICogZXhjZWVkcyBjb3VudGVyLiBPdGhld2lzZSB2
YWxpZGF0ZSBlbnRyeSBieQ0KPiA+ICsJCQkJICogbWF0Y2hpbmcgYml0bWFzay4NCj4gPiArCQkJ
CSAqLw0KPiA+ICsJCQkJaWYgKGRhdGEtPmNhcGFiaWxpdHlfbWFzaykNCj4gPiArCQkJCQlyZWd2
YWwgPSAocmVndmFsICYgaXRlbS0NCj4gPmNhcGFiaWxpdHlfbWFzaykgPDwNCj4gPiArCQkJCQkJ
IGl0ZW0tPmNhcGFiaWxpdHlfYml0Ow0KPiA+ICsJCQkJaWYgKGRhdGEtPnNsb3QgPiByZWd2YWwp
IHsNCj4gPiArCQkJCQlicmVhazsNCj4gPiArCQkJCX0gZWxzZSBpZiAoIShyZWd2YWwgJiBkYXRh
LT5iaXQpICYmICFkYXRhLT5zbG90KSB7DQo+ID4gIAkJCQkJZGF0YSsrOw0KPiA+ICAJCQkJCWNv
bnRpbnVlOw0KPiA+ICAJCQkJfQ0KPiA+IEBAIC02MTEsNyArNjI5LDcgQEAgc3RhdGljIGludCBt
bHhyZWdfaG90cGx1Z19zZXRfaXJxKHN0cnVjdA0KPiBtbHhyZWdfaG90cGx1Z19wcml2X2RhdGEg
KnByaXYpDQo+ID4gIAkJCQlpZiAocmV0KQ0KPiA+ICAJCQkJCWdvdG8gb3V0Ow0KPiA+DQo+ID4g
LQkJCQlpZiAoIShyZWd2YWwgJiBkYXRhLT5iaXQpKQ0KPiA+ICsJCQkJaWYgKCEocmVndmFsICYg
ZGF0YS0+Yml0KSAmJiAhZGF0YS0+c2xvdCkNCj4gPiAgCQkJCQlpdGVtLT5tYXNrICY9IH5CSVQo
aik7DQo+ID4gIAkJCX0NCj4gPiAgCQl9DQo+ID4NCg==
